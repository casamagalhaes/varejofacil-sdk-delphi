unit SDK.Client;

interface

uses
  SysUtils, Classes, IdHTTP, IdSSLOpenSSL, IdGlobalProtocols, IdStack, SDK.Types, SDK.Request, SDK.Response, SDK.Exceptions;

type

  // Mantendo a compatibilidade com versões antigas do Indy
  TSDKIdHTTP = class(TIdCustomHTTP)
  const
    DELETE_HTTP_METHOD = 'DELETE';
  public
    function Delete(const AURL: TString; AResponseContent: TStream): TString; overload;
    function Delete(const AURL: TString): TString; overload;
  end;

  TClient = class(TInterfacedObject, IClient)
  strict private
    FBaseURL: TString;
    FTokens: TTokenStorage;
    FUsername: string;
    FPassword: string;
    function Authenticate(const AURL: TString; AParams, AHeaders: TStrings; AContent: TString; ARequestFunction: TAuthenticatedRequest): IResponse;
    function AuthenticatedGet(const AURL: TString; AParams, AHeaders: TStrings; AContent: TString; ATokens: TTokenStorage): IResponse;
    function AuthenticatedPut(const AURL: TString; AParams, AHeaders: TStrings; AContent: TString; ATokens: TTokenStorage): IResponse;
    function AuthenticatedPost(const AURL: TString; AParams, AHeaders: TStrings; AContent: TString; ATokens: TTokenStorage): IResponse;
    function AuthenticatedDelete(const AURL: TString; AParams, AHeaders: TStrings; AContent: TString; ATokens: TTokenStorage): IResponse;
    function MakeRequest(const ARequest: IRequest): IResponse;
  public
    function Get(const AURL: TString; AParams, AHeaders: TStrings): IResponse;
    function Put(const AURL, AContent: TString; AHeaders: TStrings): IResponse;
    function Post(const AURL, AContent: TString; AHeaders: TStrings): IResponse;
    function Delete(const AURL: TString; AParams, AHeaders: TStrings): IResponse;
    constructor Create(const ABaseURL: TString; const AUsername, APassword: string);
    destructor Destroy; override;
  end;

implementation

{ TClient }

function TClient.Authenticate(const AURL: TString; AParams, AHeaders: TStrings; AContent: TString; ARequestFunction: TAuthenticatedRequest): IResponse;
var
  AuthRequest: IRequest;
  AuthResponse: IResponse;
  AuthHeaders: TStrings;
  RefreshRequest: IRequest;
  RefreshResponse: IResponse;
  RefreshHeaders: TStrings;
begin
  if Assigned(FTokens) then
  begin
    Result := ARequestFunction(AURL, AParams, AHeaders, AContent, FTokens);
    if Result.Status = 401 then
    begin
      RefreshHeaders := TStringList.Create;
      try
        RefreshHeaders.Values['Accept'] := 'application/xml';
        RefreshHeaders.Values['Authorization'] := FTokens.RefreshToken;
        RefreshRequest := TRequest.Create(Concat(FBaseURL, '/api/refresh'), mtGET, nil, RefreshHeaders, Format('{"username": "%s", "password": "%s"}', [FUsername, FPassword]));
        RefreshResponse := MakeRequest(RefreshRequest);
        if RefreshResponse.Status = 200 then
        begin
          FTokens := TTokenStorage.From(RefreshResponse);
          Result := ARequestFunction(AURL, AParams, AHeaders, AContent, FTokens);
        end
        else
          raise Exception.CreateFmt('Refresh falhou com código %d', [AuthResponse.Status]);
      finally
        RefreshHeaders.Free;
      end;
    end;
  end
  else
  begin
    AuthHeaders := TStringList.Create;
    try
      AuthHeaders.Values['Content-Type'] := 'application/json';
      AuthHeaders.Values['Accept'] := 'application/xml';
      AuthRequest := TRequest.Create(Concat(FBaseURL, '/api/auth'), mtPOST, nil, AuthHeaders, Format('{"username": "%s", "password": "%s"}', [FUsername, FPassword]));
      AuthResponse := MakeRequest(AuthRequest);
      if AuthResponse.Status = 200 then
      begin
        FTokens := TTokenStorage.From(AuthResponse);
        Result := ARequestFunction(AURL, AParams, AHeaders, AContent, FTokens);
      end
      else
        raise Exception.CreateFmt('Autenticação falhou com código %d', [AuthResponse.Status]);
    finally
      AuthHeaders.Free;
    end;
  end;
end;

constructor TClient.Create(const ABaseURL: TString; const AUsername, APassword: string);
begin
  inherited Create;
  FBaseURL := ABaseURL;
  FUsername := AUsername;
  FPassword := APassword;
end;

function TClient.Delete(const AURL: TString; AParams, AHeaders: TStrings): IResponse;
begin
  Result := Authenticate(AURL, AParams, AHeaders, EmptyStr, AuthenticatedDelete);
end;

destructor TClient.Destroy;
begin
  if Assigned(FTokens) then
    FreeAndNil(FTokens);
  inherited;
end;

function TClient.AuthenticatedDelete(const AURL: TString; AParams, AHeaders: TStrings; AContent: TString; ATokens: TTokenStorage): IResponse;
var
  Request: IRequest;
begin
  Request := TRequest.Create(Concat(FBaseURL, AURL), mtDELETE, AParams, AHeaders, EmptyStr, ATokens);
  Result := MakeRequest(Request);
end;

function TClient.AuthenticatedGet(const AURL: TString; AParams, AHeaders: TStrings; AContent: TString; ATokens: TTokenStorage): IResponse;
var
  Request: IRequest;
begin
  Request := TRequest.Create(Concat(FBaseURL, AURL), mtGET, AParams, AHeaders, EmptyStr, ATokens);
  Result := MakeRequest(Request);
end;

function TClient.AuthenticatedPost(const AURL: TString; AParams, AHeaders: TStrings; AContent: TString; ATokens: TTokenStorage): IResponse;
var
  Request: IRequest;
begin
  Request := TRequest.Create(Concat(FBaseURL, AURL), mtPOST, nil, nil, AContent, ATokens);
  Result := MakeRequest(Request);
end;

function TClient.AuthenticatedPut(const AURL: TString; AParams, AHeaders: TStrings; AContent: TString; ATokens: TTokenStorage): IResponse;
var
  Request: IRequest;
begin
  Request := TRequest.Create(Concat(FBaseURL, AURL), mtPUT, nil, nil, AContent, ATokens);
  Result := MakeRequest(Request);
end;

function TClient.Get(const AURL: TString; AParams, AHeaders: TStrings): IResponse;
begin
  Result := Authenticate(AURL, AParams, AHeaders, EmptyStr, AuthenticatedGet);
end;

function TClient.Post(const AURL, AContent: TString; AHeaders: TStrings): IResponse;
begin
  Result := Authenticate(AURL, nil, nil, AContent, AuthenticatedPost);
end;

function TClient.Put(const AURL, AContent: TString; AHeaders: TStrings): IResponse;
begin
  Result := Authenticate(AURL, nil, nil, AContent, AuthenticatedPut);
end;

function TClient.MakeRequest(const ARequest: IRequest): IResponse;
var
  ResponseContent: TString;
  HTTP: TSDKIdHTTP;
  HTTPRequest: TIdHTTPRequest;
  HTTPIOHandler: TIdSSLIOHandlerSocketOpenSSL;
  RequestContent: TStream;
begin
  HTTP := TSDKIdHTTP.Create(nil);
  try
    HTTPIOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    try
      HTTPRequest := TIdHTTPRequest.Create(nil);
      try
        HTTP.IOHandler := HTTPIOHandler;
        HTTP.Request := HTTPRequest;
        if Assigned(ARequest.Headers) then
        begin
          HTTP.Request.CustomHeaders.AddStrings(ARequest.Headers);
          HTTP.Request.RawHeaders.AddStrings(ARequest.Headers);
          if ARequest.Headers.IndexOfName('Content-Type') > -1 then
            HTTP.Request.ContentType := ARequest.Headers.Values['Content-Type'];
          if ARequest.Headers.IndexOfName('Accept') > -1 then
            HTTP.Request.Accept := ARequest.Headers.Values['Accept'];
        end;
        if HTTP.Request.CustomHeaders.IndexOfName('Content-Type') = -1 then
        begin
          HTTP.Request.ContentType := 'application/xml';
          HTTP.Request.CustomHeaders.Values['Content-Type'] := 'application/xml';
          HTTP.Request.RawHeaders.Values['Content-Type'] := 'application/xml';
        end;
        if HTTP.Request.CustomHeaders.IndexOfName('Accept') = -1 then
        begin
          HTTP.Request.Accept := 'application/xml';
          HTTP.Request.CustomHeaders.Values['Accept'] := 'application/xml';
          HTTP.Request.RawHeaders.Values['Accept'] := 'application/xml';
        end;
        try
          case ARequest.Method of
            mtGET:
            begin
              ResponseContent := HTTP.Get(ARequest.URL);
            end;
            mtPOST:
            begin
              RequestContent := TStringStream.Create(ARequest.Content);
              try
                ResponseContent := HTTP.Post(ARequest.URL, RequestContent);
              finally
                FreeAndNil(RequestContent);
              end;
            end;
            mtPUT:
            begin
              RequestContent := TStringStream.Create(ARequest.Content);
              try
                ResponseContent := HTTP.Put(ARequest.URL, RequestContent);
              finally
                FreeAndNil(RequestContent);
              end;
            end;
            mtDELETE:
            begin
              ResponseContent := HTTP.Delete(ARequest.URL);
            end;
          end;
        except
          on E: EIdHTTPProtocolException do
          begin
            if HTTP.ResponseCode = 500 then
              raise SDKServerInternalException.Create(E.Message)
            else
            if HTTP.ResponseCode = 400 then
              raise SDKBadRequestException.Create(E.Message)
            else
            if HTTP.ResponseCode = 404 then
            else
            if HTTP.ResponseCode = 422 then
            begin
              ResponseContent := E.ErrorMessage;
            end
            else
              raise SDKHTTPProtocolException.Create(E.Message);
          end;
          on E: EIdSocketError do
          begin
            raise SDKConnectionRefusedException.Create(E.Message);
          end;
        end;
      finally
        FreeAndNil(HTTPRequest);
      end;
    finally
      HTTPIOHandler.Free;
    end;
    Result := TResponse.Create(HTTP.ResponseCode, HTTP.Response.RawHeaders, ResponseContent);
  finally
    FreeAndNil(HTTP);
  end;
end;

{ TSDKIdHTTP }

function TSDKIdHTTP.Delete(const AURL: TString): TString;
var
  Stream: TMemoryStream;
begin
  Result := EmptyStr;
  Stream := TMemoryStream.Create;
  try
    DoRequest(DELETE_HTTP_METHOD, AURL, nil, Stream, []);
    Stream.Position := 0;
    SetString(Result, PAnsiChar(Stream.Memory^), Stream.Size);
  finally
    FreeAndNil(Stream);
  end;
end;

function TSDKIdHTTP.Delete(const AURL: TString; AResponseContent: TStream): TString;
begin
  DoRequest(DELETE_HTTP_METHOD, AURL, nil, AResponseContent, []);
end;

end.

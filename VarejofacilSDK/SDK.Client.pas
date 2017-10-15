unit SDK.Client;

interface

uses
  SysUtils, Classes, IdHTTP, IdGlobalProtocols, IdStack, SDK.Types, SDK.Request, SDK.Response, SDK.Exceptions;

type

  TClient = class(TInterfacedObject, IClient)
  strict private
    FBaseURL: TString;
    function Authenticate(ARequestFunction: TRequestFunction): IResponse;
    function MakeRequest(const ARequest: IRequest): IResponse;
  public
    function Get(const AURL: TString; AParams, AHeaders: TStrings): IResponse;
    function Put(const AURL, AContent: TString; AHeaders: TStrings): IResponse;
    function Post(const AURL, AContent: TString; AHeaders: TStrings): IResponse;
    function Delete(const AURL: TString; AParams, AHeaders: TStrings): IResponse;
    constructor Create(const ABaseURL: TString);
    destructor Destroy; override;
  end;

implementation

{ TClient }

function TClient.Authenticate(ARequestFunction: TRequestFunction): IResponse;
begin
  //Do authenticate
  //make request
  //return response
end;

constructor TClient.Create(const ABaseURL: TString);
begin
  inherited Create;
  FBaseURL := ABaseURL;
end;

function TClient.Delete(const AURL: TString; AParams, AHeaders: TStrings): IResponse;
var
  Request: IRequest;
begin
  Request := TRequest.Create(Concat(FBaseURL, AURL), mtDELETE, AParams, AHeaders);
  Result := MakeRequest(Request);
end;

destructor TClient.Destroy;
begin
  inherited;
end;

function TClient.Get(const AURL: TString; AParams, AHeaders: TStrings): IResponse;
var
  Request: IRequest;
begin
  Request := TRequest.Create(Concat(FBaseURL, AURL), mtGET, AParams, AHeaders);
  Result := MakeRequest(Request);
end;

function TClient.MakeRequest(const ARequest: IRequest): IResponse;

  function ReadResponse(const AInput: TStream): TString;
  var
    Stream: TMemoryStream;
  begin
    Stream := TMemoryStream.Create;
    try
      Stream.Position := 0;
      Result := ReadStringAsCharset(Stream, 'utf8');
    finally
      FreeAndNil(Stream);
    end;
  end;

var
  ResponseContent: TString;
  HTTP: TIdHTTP;
  HTTPRequest: TIdHTTPRequest;
  RequestContent: TStream;
begin
  HTTP := TIdHTTP.Create(nil);
  try
    HTTPRequest := TIdHTTPRequest.Create(nil);
    try
      HTTP.Request := HTTPRequest;
      if Assigned(ARequest.Headers) then
        HTTP.Request.CustomHeaders.AddStrings(ARequest.Headers);
      if HTTP.Request.CustomHeaders.IndexOfName('Content-Type') = -1 then
        HTTP.Request.CustomHeaders.Values['Content-Type'] := 'application/xml';
      if HTTP.Request.CustomHeaders.IndexOfName('Accept') = -1 then
        HTTP.Request.CustomHeaders.Values['Accept'] := 'application/xml';
      try
        case ARequest.Method of
          mtGET:
          begin
            ResponseContent := HTTP.Get(ARequest.URL);
          end;
          mtPOST:
          begin
            RequestContent := TStringStream.Create(ARequest.Content, TEncoding.UTF8);
            try
              ResponseContent := HTTP.Post(ARequest.URL, RequestContent);
            finally
              FreeAndNil(RequestContent);
            end;
          end;
          mtPUT:
          begin
            RequestContent := TStringStream.Create(ARequest.Content, TEncoding.UTF8);
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
          if HTTP.ResponseCode = 422 then
            raise SDKUnprocessableEntityException.Create(E.Message)
          else
          if HTTP.ResponseCode = 400 then
            raise SDKBadRequestException.Create(E.Message)
          else
          if HTTP.ResponseCode = 404 then
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
    Result := TResponse.Create(HTTP.ResponseCode, HTTP.Response.RawHeaders, ResponseContent);
  finally
    FreeAndNil(HTTP);
  end;
end;

function TClient.Post(const AURL, AContent: TString; AHeaders: TStrings): IResponse;
var
  Request: IRequest;
begin
  Request := TRequest.Create(Concat(FBaseURL, AURL), mtPOST, nil, nil, AContent);
  Result := MakeRequest(Request);
end;

function TClient.Put(const AURL, AContent: TString; AHeaders: TStrings): IResponse;
var
  Request: IRequest;
begin
  Request := TRequest.Create(Concat(FBaseURL, AURL), mtPUT, nil, nil, AContent);
  Result := MakeRequest(Request);
end;

end.

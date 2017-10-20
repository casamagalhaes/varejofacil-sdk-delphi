unit SDK.Request;

interface

uses
  SysUtils, Classes, SDK.Types;

type

  TRequest = class(TInterfacedObject, IRequest)
  strict private
    FOwnedObjects: TStrings;
    FMethod: TMethod;
    FContent: TString;
    FHeaders: TStrings;
    FParams: TStrings;
    FURL: TString;
    FTokens: TTokenStorage;
    procedure SetAuthorizationHeaders;
  public
    destructor Destroy; override;

    function GetContent: TString;
    function GetHeaders: TStrings;
    function GetMethod: TMethod;
    function GetParams: TStrings;
    function GetURL: TString;
    procedure SetContent(const AContent: TString);
    procedure SetHeaders(AHeaders: TStrings);
    procedure SetMethod(AMethod: TMethod);
    procedure SetParams(AParams: TStrings);
    procedure SetURL(const AURL: TString);
    procedure SetTokens(const ATokens: TTokenStorage);

    property URL: TString read GetURL write SetURL;
    property Method: TMethod read GetMethod write SetMethod;
    property Params: TStrings read GetParams write SetParams;
    property Headers: TStrings read GetHeaders write SetHeaders;
    property Content: TString read GetContent write SetContent;
    constructor Create(AURL: TString; AMethod: TMethod;
      AParams, AHeaders: TStrings; AContent: TString = ''; const ATokens: TTokenStorage = nil);
  end;

implementation

{ TRequest }

constructor TRequest.Create(AURL: TString; AMethod: TMethod; AParams, AHeaders: TStrings; AContent: TString; const ATokens: TTokenStorage);
begin
  FOwnedObjects := TStringList.Create;
  SetTokens(ATokens);
  SetURL(AURL);
  SetMethod(AMethod);
  SetParams(AParams);
  SetHeaders(AHeaders);
  SetContent(AContent);
end;

destructor TRequest.Destroy;
var
  I: Integer;
begin
  for I := 0 to FOwnedObjects.Count - 1 do
    FOwnedObjects.Objects[I].Free;
  FOwnedObjects.Free;
  inherited;
end;

function TRequest.GetContent: TString;
begin
  Result := FContent;
end;

function TRequest.GetHeaders: TStrings;
begin
  Result := FHeaders;
end;

function TRequest.GetMethod: TMethod;
begin
  Result := FMethod;
end;

function TRequest.GetParams: TStrings;
begin
  Result := FParams;
end;

function TRequest.GetURL: TString;
begin
  Result := FURL;
end;

procedure TRequest.SetAuthorizationHeaders;
begin
  if Assigned(FTokens) then
  begin
    if not Assigned(FHeaders) then
    begin
      FHeaders := TStringList.Create;
      FOwnedObjects.AddObject('Headers', FHeaders);
    end;
    if FHeaders.IndexOf('authorization') = -1 then
      FHeaders.Values['authorization'] := FTokens.AccessToken;
  end;
end;

procedure TRequest.SetContent(const AContent: TString);
begin
  inherited;
  FContent := AContent;
end;

procedure TRequest.SetHeaders(AHeaders: TStrings);
begin
  inherited;
  FHeaders := AHeaders;
  SetAuthorizationHeaders;
end;

procedure TRequest.SetMethod(AMethod: TMethod);
begin
  inherited;
  FMethod := AMethod;
end;

procedure TRequest.SetParams(AParams: TStrings);
begin
  inherited;
  FParams := AParams;
end;

procedure TRequest.SetTokens(const ATokens: TTokenStorage);
begin
  if Assigned(ATokens) then
    FTokens := ATokens.Clone;
end;

procedure TRequest.SetURL(const AURL: TString);
begin
  FURL := AURL;
end;


end.

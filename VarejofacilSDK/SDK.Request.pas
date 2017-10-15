unit SDK.Request;

interface

uses
  SysUtils, Classes, SDK.Types;

type

  TRequest = class(TInterfacedObject, IRequest)
  strict private
    FMethod: TMethod;
    FContent: TString;
    FHeaders: TStrings;
    FParams: TStrings;
    FURL: TString;
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
  public
    destructor Destroy; override;
    property URL: TString read GetURL write SetURL;
    property Method: TMethod read GetMethod write SetMethod;
    property Params: TStrings read GetParams write SetParams;
    property Headers: TStrings read GetHeaders write SetHeaders;
    property Content: TString read GetContent write SetContent;
    constructor Create(AURL: TString; AMethod: TMethod; AParams, AHeaders: TStrings; AContent: TString = '');
  end;

implementation

{ TRequest }

constructor TRequest.Create(AURL: TString; AMethod: TMethod; AParams, AHeaders: TStrings; AContent: TString);
begin
  SetURL(AURL);
  SetMethod(AMethod);
  SetParams(AParams);
  SetHeaders(AHeaders);
  SetContent(AContent);
end;

destructor TRequest.Destroy;
begin

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

procedure TRequest.SetContent(const AContent: TString);
begin
  inherited;
  FContent := AContent;
end;

procedure TRequest.SetHeaders(AHeaders: TStrings);
begin
  inherited;
  FHeaders := AHeaders;
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

procedure TRequest.SetURL(const AURL: TString);
begin
  FURL := AURL;
end;


end.

unit SDK.Response;

interface

uses
  SysUtils, Classes, SDK.Types, XMLIntf;

type

  TResponse = class(TInterfacedObject, IResponse)
  strict private
    FStatus: Integer;
    FContent: TString;
    FHeaders: TStrings;
  public
    constructor Create(AStatus: Integer; const AHeaders: TStrings; AContent: TString);
    destructor Destroy; override;

    function GetContent: TString;
    function GetHeaders: TStrings;
    function GetStatus: Integer;
    procedure SetContent(const Value: TString);
    procedure SetHeaders(Value: TStrings);
    procedure SetStatus(Value: Integer);

    function AsXML: IXMLDocument;
    property Headers: TStrings read GetHeaders write SetHeaders;
    property Content: TString read GetContent write SetContent;
    property Status: Integer read GetStatus write SetStatus;
  end;

implementation

uses SDK.XML;

{ TResponse }

function TResponse.AsXML: IXMLDocument;
begin
  Result := TXMLHelper.CreateDocument(FContent);
end;

constructor TResponse.Create(AStatus: Integer; const AHeaders: TStrings; AContent: TString);
begin
  FHeaders := TStringList.Create;
  FHeaders.AddStrings(AHeaders);
  FHeaders.NameValueSeparator := ':';
  SetStatus(AStatus);
  SetContent(AContent);
end;

destructor TResponse.Destroy;
begin
  FHeaders.Free;
  inherited;
end;

function TResponse.GetContent: TString;
begin
  Result := FContent;
end;

function TResponse.GetHeaders: TStrings;
begin
  Result := FHeaders;
end;

function TResponse.GetStatus: Integer;
begin
  Result := FStatus;
end;

procedure TResponse.SetContent(const Value: TString);
begin
  FContent := Value;
end;

procedure TResponse.SetHeaders(Value: TStrings);
begin
  FHeaders := Value;
end;

procedure TResponse.SetStatus(Value: Integer);
begin
  FStatus := Value;
end;

end.

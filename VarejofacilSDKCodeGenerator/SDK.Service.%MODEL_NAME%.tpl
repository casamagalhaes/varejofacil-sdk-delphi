unit SDK.Service.%MODEL_NAME%;

interface

uses
  SDK.Types, SDK.Model.%MODEL_NAME%, SDK.Service, SDK.XML, XMLIntf, SysUtils;

type

  T%MODEL_NAME%Service = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AId: TString): I%MODEL_NAME%;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = []): T%MODEL_NAME%ListRec;
    function Filter(const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = []): T%MODEL_NAME%ListRec;
  end;

implementation

{ T%MODEL_NAME%Service }

constructor T%MODEL_NAME%Service.Create(const AClient: IClient);
begin
  inherited Create('%ROUTE%', AClient);
end;

function T%MODEL_NAME%Service.Get(const AId: TString): I%MODEL_NAME%;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  Document: IXMLDocument;
begin
  Result := nil;
  Response := FClient.Get(Concat(FPath, '/', AId), nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//%MODEL_NAME%');
  if Length(Nodes) > 0 then
    TXMLHelper.Deserialize(Nodes[0], T%MODEL_NAME%, FDeserializers).QueryInterface(I%MODEL_NAME%, Result);
end;

function T%MODEL_NAME%Service.GetAll(AStart, ACount: Integer; const ASortParams: TStringArray): T%MODEL_NAME%ListRec;
begin
  Result := Filter(EmptyStr, AStart, ACount, ASortParams);
end;

function T%MODEL_NAME%Service.Filter(const AQuery: TString; AStart: Integer;
  ACount: Integer; const ASortParams: TStringArray): T%MODEL_NAME%ListRec;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  %MODEL_NAME%List: I%MODEL_NAME%List;
  %MODEL_NAME%: I%MODEL_NAME%;
  URL: TString;
begin
  URL := Concat(FPath, '?', ToParams(AQuery, AStart, ACount, ASortParams));
  Response := FClient.Get(URL, nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//ResultList/items/*');
  %MODEL_NAME%List := T%MODEL_NAME%List.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], T%MODEL_NAME%, FDeserializers).QueryInterface(I%MODEL_NAME%, %MODEL_NAME%);
    %MODEL_NAME%List.Add(%MODEL_NAME%);
  end;
  Result := T%MODEL_NAME%ListRec.Create(%MODEL_NAME%List);
end;

end.

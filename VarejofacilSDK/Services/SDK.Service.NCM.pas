unit SDK.Service.NCM;

interface

uses
  SDK.Types, SDK.Model.NCM, SDK.Service, SDK.XML, XMLIntf, SysUtils;

type

  TNCMService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AId: TString): INCM;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = []): TNCMListRec;
    function Filter(const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = []): TNCMListRec;
  end;

implementation

{ TNCMService }

constructor TNCMService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/fiscal/ncms', AClient);
end;

function TNCMService.Get(const AId: TString): INCM;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  Document: IXMLDocument;
begin
  Result := nil;
  Response := FClient.Get(Concat(FPath, '/', AId), nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//NCM');
  if Length(Nodes) > 0 then
    TXMLHelper.Deserialize(Nodes[0], TNCM, FDeserializers).QueryInterface(INCM, Result);
end;

function TNCMService.GetAll(AStart, ACount: Integer; const ASortParams: TStringArray): TNCMListRec;
begin
  Result := Filter(EmptyStr, AStart, ACount, ASortParams);
end;

function TNCMService.Filter(const AQuery: TString; AStart: Integer;
  ACount: Integer; const ASortParams: TStringArray): TNCMListRec;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  NCMList: INCMList;
  NCM: INCM;
  URL: TString;
begin
  URL := Concat(FPath, '?', ToParams(AQuery, AStart, ACount, ASortParams));
  Response := FClient.Get(URL, nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//ResultList/items/*');
  NCMList := TNCMList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TNCM, FDeserializers).QueryInterface(INCM, NCM);
    NCMList.Add(NCM);
  end;
  Result := TNCMListRec.Create(NCMList);
end;

end.

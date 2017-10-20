unit SDK.Service.ImpostoFederal;

interface

uses
  SDK.Types, SDK.Model.ImpostoFederal, SDK.Service, SDK.XML, XMLIntf, SysUtils;

type

  TImpostoFederalService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AId: TString): IImpostoFederal;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TImpostoFederalListRec;
    function Filter(const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TImpostoFederalListRec;
  end;

implementation

{ TImpostoFederalService }

constructor TImpostoFederalService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/fiscal/impostos-federais', AClient);
end;

function TImpostoFederalService.Get(const AId: TString): IImpostoFederal;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  Document: IXMLDocument;
begin
  Result := nil;
  Response := FClient.Get(Concat(FPath, '/', AId), nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//ImpostoFederal');
  if Length(Nodes) > 0 then
    TXMLHelper.Deserialize(Nodes[0], TImpostoFederal, FDeserializers).QueryInterface(IImpostoFederal, Result);
end;

function TImpostoFederalService.GetAll(AStart, ACount: Integer; const ASortParams: TStringArray): TImpostoFederalListRec;
begin
  Result := Filter(EmptyStr, AStart, ACount, ASortParams);
end;

function TImpostoFederalService.Filter(const AQuery: TString; AStart: Integer;
  ACount: Integer; const ASortParams: TStringArray): TImpostoFederalListRec;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  ImpostoFederalList: IImpostoFederalList;
  ImpostoFederal: IImpostoFederal;
  URL: TString;
begin
  URL := Concat(FPath, '?', ToParams(AQuery, AStart, ACount, ASortParams));
  Response := FClient.Get(URL, nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//ResultList/items/*');
  ImpostoFederalList := TImpostoFederalList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TImpostoFederal, FDeserializers).QueryInterface(IImpostoFederal, ImpostoFederal);
    ImpostoFederalList.Add(ImpostoFederal);
  end;
  Result := TImpostoFederalListRec.Create(ImpostoFederalList);
end;

end.

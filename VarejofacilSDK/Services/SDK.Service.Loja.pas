unit SDK.Service.Loja;

interface

uses
  SDK.Types, SDK.Model.Loja, SDK.Service, SDK.XML, XMLIntf, SysUtils;

type

  TLojaService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AId: TString): ILoja;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TLojaListRec;
    function Filter(const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TLojaListRec;
  end;

implementation

{ TLojaService }

constructor TLojaService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/pessoa/lojas', AClient);
end;

function TLojaService.Get(const AId: TString): ILoja;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  Document: IXMLDocument;
begin
  Result := nil;
  Response := FClient.Get(Concat(FPath, '/', AId), nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//Loja');
  if Length(Nodes) > 0 then
    TXMLHelper.Deserialize(Nodes[0], TLoja, FDeserializers).QueryInterface(ILoja, Result);
end;

function TLojaService.GetAll(AStart, ACount: Integer; const ASortParams: TStringArray): TLojaListRec;
begin
  Result := Filter(EmptyStr, AStart, ACount, ASortParams);
end;

function TLojaService.Filter(const AQuery: TString; AStart: Integer;
  ACount: Integer; const ASortParams: TStringArray): TLojaListRec;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  LojaList: ILojaList;
  Loja: ILoja;
  URL: TString;
begin
  URL := Concat(FPath, '?', ToParams(AQuery, AStart, ACount, ASortParams));
  Response := FClient.Get(URL, nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//ResultList/items/*');
  LojaList := TLojaList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TLoja, FDeserializers).QueryInterface(ILoja, Loja);
    LojaList.Add(Loja);
  end;
  Result := TLojaListRec.Create(LojaList);
end;

end.

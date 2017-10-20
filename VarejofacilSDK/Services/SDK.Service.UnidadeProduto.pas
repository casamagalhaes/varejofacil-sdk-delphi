unit SDK.Service.UnidadeProduto;

interface

uses
  SDK.Types, SDK.Model.UnidadeProduto, SDK.Service, SDK.XML, XMLIntf, SysUtils;

type

  TUnidadeProdutoService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AId: TString): IUnidadeProduto;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TUnidadeProdutoListRec;
    function Filter(const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TUnidadeProdutoListRec;
  end;

implementation

{ TUnidadeProdutoService }

constructor TUnidadeProdutoService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/produto/unidades', AClient);
end;

function TUnidadeProdutoService.Get(const AId: TString): IUnidadeProduto;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  Document: IXMLDocument;
begin
  Result := nil;
  Response := FClient.Get(Concat(FPath, '/', AId), nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//UnidadeProduto');
  if Length(Nodes) > 0 then
    TXMLHelper.Deserialize(Nodes[0], TUnidadeProduto, FDeserializers).QueryInterface(IUnidadeProduto, Result);
end;

function TUnidadeProdutoService.GetAll(AStart, ACount: Integer; const ASortParams: TStringArray): TUnidadeProdutoListRec;
begin
  Result := Filter(EmptyStr, AStart, ACount, ASortParams);
end;

function TUnidadeProdutoService.Filter(const AQuery: TString; AStart: Integer;
  ACount: Integer; const ASortParams: TStringArray): TUnidadeProdutoListRec;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  UnidadeProdutoList: IUnidadeProdutoList;
  UnidadeProduto: IUnidadeProduto;
  URL: TString;
begin
  URL := Concat(FPath, '?', ToParams(AQuery, AStart, ACount, ASortParams));
  Response := FClient.Get(URL, nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//ResultList/items/*');
  UnidadeProdutoList := TUnidadeProdutoList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TUnidadeProduto, FDeserializers).QueryInterface(IUnidadeProduto, UnidadeProduto);
    UnidadeProdutoList.Add(UnidadeProduto);
  end;
  Result := TUnidadeProdutoListRec.Create(UnidadeProdutoList);
end;

end.

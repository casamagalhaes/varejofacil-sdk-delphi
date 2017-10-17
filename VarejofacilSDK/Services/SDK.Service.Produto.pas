unit SDK.Service.Produto;

interface

uses
  SDK.Types, SDK.Model.Produto, SDK.Service, SDK.XML, XMLIntf, SysUtils;

type

  TProdutoService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AId: TString): IProduto;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = []): TProdutoListRec;
    function Filter(const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = []): TProdutoListRec;
  end;

implementation

{ TProdutoService }

constructor TProdutoService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/produto/produtos', AClient);
end;

function TProdutoService.Get(const AId: TString): IProduto;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  Document: IXMLDocument;
begin
  Result := nil;
  Response := FClient.Get(Concat(FPath, '/', AId), nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//Produto');
  if Length(Nodes) > 0 then
    TXMLHelper.Deserialize(Nodes[0], TProduto, FDeserializers).QueryInterface(IProduto, Result);
end;

function TProdutoService.GetAll(AStart, ACount: Integer; const ASortParams: TStringArray): TProdutoListRec;
begin
  Result := Filter(EmptyStr, AStart, ACount, ASortParams);
end;

function TProdutoService.Filter(const AQuery: TString; AStart: Integer;
  ACount: Integer; const ASortParams: TStringArray): TProdutoListRec;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  ProdutoList: IProdutoList;
  Produto: IProduto;
  URL: TString;
begin
  URL := Concat(FPath, '?', ToParams(AQuery, AStart, ACount, ASortParams));
  Response := FClient.Get(URL, nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//ResultList/items/*');
  ProdutoList := TProdutoList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TProduto, FDeserializers).QueryInterface(IProduto, Produto);
    ProdutoList.Add(Produto);
  end;
  Result := TProdutoListRec.Create(ProdutoList);
end;

end.

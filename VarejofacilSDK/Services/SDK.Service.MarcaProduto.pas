unit SDK.Service.MarcaProduto;

interface

uses
  SDK.Types, SDK.Model.MarcaDoProduto, SDK.Service, SDK.XML, XMLIntf, SysUtils;

type

  TMarcaProdutoService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AId: TString): IMarcaDoProduto;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TMarcaDoProdutoListRec;
    function Filter(const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TMarcaDoProdutoListRec;
  end;

implementation

{ TMarcaDoProdutoService }

constructor TMarcaProdutoService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/produto/marcas', AClient);
end;

function TMarcaProdutoService.Get(const AId: TString): IMarcaDoProduto;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  Document: IXMLDocument;
begin
  Result := nil;
  Response := FClient.Get(Concat(FPath, '/', AId), nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//MarcaProduto');
  if Length(Nodes) > 0 then
    TXMLHelper.Deserialize(Nodes[0], TMarcaDoProduto, FDeserializers).QueryInterface(IMarcaDoProduto, Result);
end;

function TMarcaProdutoService.GetAll(AStart, ACount: Integer; const ASortParams: TStringArray): TMarcaDoProdutoListRec;
begin
  Result := Filter(EmptyStr, AStart, ACount, ASortParams);
end;

function TMarcaProdutoService.Filter(const AQuery: TString; AStart: Integer;
  ACount: Integer; const ASortParams: TStringArray): TMarcaDoProdutoListRec;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  MarcaProdutoList: IMarcaDoProdutoList;
  MarcaProduto: IMarcaDoProduto;
  URL: TString;
begin
  URL := Concat(FPath, '?', ToParams(AQuery, AStart, ACount, ASortParams));
  Response := FClient.Get(URL, nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//ResultList/items/*');
  MarcaProdutoList := TMarcaDoProdutoList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TMarcaDoProduto, FDeserializers).QueryInterface(IMarcaDoProduto, MarcaProduto);
    MarcaProdutoList.Add(MarcaProduto);
  end;
  Result := TMarcaDoProdutoListRec.Create(MarcaProdutoList);
end;

end.

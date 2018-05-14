unit SDK.Service.ProdutoFornecedor;

interface

uses
  SDK.Types, SDK.Model.ReferenciaFornecedor, SDK.Service, SDK.Exceptions, SDK.XML, XMLIntf, SysUtils, Math;

type

  TProdutoFornecedorService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AIdProduto, AId: Variant): IReferenciaFornecedor;
    function GetAll(const AIdProduto: Variant; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TReferenciaFornecedorListRec;
    function Filter(const AIdProduto: Variant; const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TReferenciaFornecedorListRec;
    function Insert(const AIdProduto: Variant; const AModel: IModel): TServiceCommandResult;
    function Update(const AIdProduto, AId: Variant; const AModel: IModel): TServiceCommandResult;
    function Delete(const AIdProduto, AId: Variant): Boolean; reintroduce;
  end;

implementation

{ TReferenciaFornecedorService }

constructor TProdutoFornecedorService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/produto/produtos/%s/fornecedores', AClient);
end;

function TProdutoFornecedorService.Get(const AIdProduto, AId: Variant): IReferenciaFornecedor;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  Document: IXMLDocument;
begin
  Result := nil;
  Response := FClient.Get(Concat(PathWithDependencies([AIdProduto]), '/', AId), nil, nil);
  case Response.Status of
    200:
    begin
      Document := Response.AsXML;
      Nodes := TXMLHelper.XPathSelect(Document, '//ReferenciaDoFornecedor');
      if Length(Nodes) > 0 then
        TXMLHelper.Deserialize(Nodes[0], TReferenciaFornecedor, FDeserializers).QueryInterface(IReferenciaFornecedor, Result);
    end;
    404:
      raise SDKNotFoundException.Create(Concat('Referência do fornecedor ', AId, ' não encontrada'));
  else
    raise SDKUnknownException.Create(Format('Erro %d - %s', [Response.Status, Response.Content]));
  end;
end;

function TProdutoFornecedorService.GetAll(const AIdProduto: Variant; AStart, ACount: Integer; const ASortParams: TStringArray): TReferenciaFornecedorListRec;
begin
  Result := Filter(AIdProduto, EmptyStr, AStart, ACount, ASortParams);
end;


function TProdutoFornecedorService.Insert(const AIdProduto: Variant; const AModel: IModel): TServiceCommandResult;
begin
  Result := inherited Insert(AModel, PathWithDependencies([AIdProduto]));
end;

function TProdutoFornecedorService.Update(const AIdProduto, AId: Variant; const AModel: IModel): TServiceCommandResult;
begin
  Result := inherited Update(AId, AModel, PathWithDependencies([AIdProduto]));
end;

function TProdutoFornecedorService.Delete(const AIdProduto, AId: Variant): Boolean;
begin
  Result := inherited DeleteWithPath(AId, PathWithDependencies([AIdProduto]));
end;

function TProdutoFornecedorService.Filter(const AIdProduto: Variant; const AQuery: TString; AStart: Integer;
  ACount: Integer; const ASortParams: TStringArray): TReferenciaFornecedorListRec;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  FornecedorList, PaginationList: TReferenciaFornecedorList;
  Fornecedor: IReferenciaFornecedor;
  URL: TString;
  ResultNodes: TCustomXMLNodeArray;
  Start, Count, Total, TotalPack, Position: Integer;
begin
  Start := AStart;
  Count := ACount;
  URL := Concat(PathWithDependencies([AIdProduto]), '?', ToParams(AQuery, Start, Count, ASortParams));
  Response := FClient.Get(URL, nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//ResultList/items/*');
  FornecedorList := TReferenciaFornecedorList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TReferenciaFornecedor, FDeserializers).QueryInterface(IReferenciaFornecedor, Fornecedor);
    FornecedorList.Add(Fornecedor);
  end;

  ResultNodes := TXMLHelper.XPathSelect(Document, '//ResultList');

  if Length(ResultNodes) > 0 then
  begin
    Start := ResultNodes[0].ChildValues['start'];
    Count := ResultNodes[0].ChildValues['count'];
    Total := ResultNodes[0].ChildValues['total'];
    if ACount = 0 then
      TotalPack := Total + Start
    else
      TotalPack := Min(Total, ACount) + Start;
    Position := Count + Start;

    if Position < TotalPack then
    begin
      PaginationList := Filter(AIdProduto, AQuery, Start, TotalPack - Position, ASortParams);
      for Fornecedor in PaginationList do
        FornecedorList.Add(Fornecedor);
    end;
  end;

  Result := TReferenciaFornecedorListRec.Create(FornecedorList);
end;

end.

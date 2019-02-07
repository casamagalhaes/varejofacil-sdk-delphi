unit SDK.Service.Produto;

interface

uses
  SDK.Types, SDK.Model.Produto, SDK.Service, SDK.Exceptions, SDK.XML, XMLIntf, SysUtils, Math;

type

  TProdutoService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AId: TString): IProduto;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0; const ASortParams: TStringArray = nil): TProdutoList;
    function Filter(const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0; const ASortParams: TStringArray = nil): TProdutoList;
    function GetChanges(const ALojaId: TString; ADataAlteracao: TDateTime): TProdutoListChanges;
  end;

implementation

uses
  Classes, SDK.Service.Carga;

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
  case Response.Status of
    200:
    begin
      Document := Response.AsXML;
      Nodes := TXMLHelper.XPathSelect(Document, '//Produto');
      if Length(Nodes) > 0 then
        TXMLHelper.Deserialize(Nodes[0], TProduto, FDeserializers).QueryInterface(IProduto, Result);
    end;
    404:
    begin
      raise SDKNotFoundException.Create(Concat('Produto ', AId, ' não encontrado'));
    end;
    else
    begin
      raise SDKUnknownException.Create(Format('Erro %d - %s', [Response.Status, Response.Content]));
    end;
  end;
end;

function TProdutoService.GetAll(AStart, ACount: Integer; const ASortParams: TStringArray): TProdutoList;
begin
  Result := Filter(EmptyStr, AStart, ACount, ASortParams);
end;

function TProdutoService.GetChanges(const ALojaId: TString; ADataAlteracao: TDateTime): TProdutoListChanges;
var
  Nodes: TCustomXMLNodeArray;
  Document: IXMLDocument;
  NodeIdx: Integer;
  Produto: IProduto;
  ProdutoListChange: TProdutoListChanges;
begin
  Document := TCargaService.GetChanges(ALojaId, ADataAlteracao, 'PRODUTO', FClient);
  ProdutoListChange := TProdutoListChanges.Create;

  Nodes := TXMLHelper.XPathSelect(Document, '//Carga/*');
  if Trim(Nodes[0].NodeValue) <> '' then
    ProdutoListChange.DataAlteracao := ISO8601ToDateTime(Nodes[0].NodeValue);

  Nodes := TXMLHelper.XPathSelect(Document, '//Carga/alterados/*');
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    if Nodes[NodeIdx].NodeName = 'produtos' then
    begin
      TXMLHelper.Deserialize(Nodes[NodeIdx], TProduto, FDeserializers).QueryInterface(IProduto, Produto);
      ProdutoListChange.ListAlterados.Add(Produto);
    end;
  end;

  Nodes := TXMLHelper.XPathSelect(Document, '//Carga/removidos/*');
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    if Nodes[NodeIdx].NodeName = 'produtos' then
    begin
      ProdutoListChange.ListIdRemovidos.Add(Nodes[NodeIdx].NodeValue);
    end;
  end;

  Result := ProdutoListChange;
end;

function TProdutoService.Filter(const AQuery: TString; AStart: Integer; ACount: Integer; const ASortParams: TStringArray): TProdutoList;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  ProdutoList,
  PaginationList: TProdutoList;
  Produto: IProduto;
  URL: TString;
  ResultNodes: TCustomXMLNodeArray;
  Start,
  Count,
  Total,
  TotalPack,
  Position: Integer;
begin
  Start := AStart;
  Count := ACount;
  URL := Concat(FPath, '?', ToParams(AQuery, Start, Count, ASortParams));
  Response := FClient.Get(URL, nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//ResultList/items/*');
  ProdutoList := TProdutoList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TProduto, FDeserializers).QueryInterface(IProduto, Produto);
    ProdutoList.Add(Produto);
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

    if Position < Min(TotalPack, Total) then
    begin
      PaginationList := Filter(AQuery, Position, TotalPack - Position, ASortParams);
      for Produto in PaginationList do
        ProdutoList.Add(Produto);
    end;
  end;
  
  Result := ProdutoList;
end;

end.



unit SDK.Service.Preco;

interface

uses
  SDK.Types, SDK.Model.Preco, SDK.Service, SDK.Exceptions, SDK.XML, SDK.Service.Carga,
  XMLIntf, SysUtils, Math, Variants;

type

  TPrecoService = class(TService)
  private
    FPrecosProdutosPath: String;
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AId: TString): IPreco;
    function GetAll(AProdutoId: Variant; AQuery: TString; AStart: Integer = 0; ACount: Integer = 0; const ASortParams: TStringArray = nil): TPrecoList; overload;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0; const ASortParams: TStringArray = nil): TPrecoList; overload;
    function Filter(const AProdutoId: Variant; AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TPrecoList;
    function GetChanges(const ALojaId: TString;
      ADataAlteracao: TDateTime): TPrecoListChanges;
  end;

implementation

{ TPrecoService }

constructor TPrecoService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/produto/precos', AClient);
  FPrecosProdutosPath := '/api/v1/produto/produtos/%s/precos'
end;

function TPrecoService.Get(const AId: TString): IPreco;
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
      Nodes := TXMLHelper.XPathSelect(Document, '//Preco');
      if Length(Nodes) > 0 then
        TXMLHelper.Deserialize(Nodes[0], TPreco, FDeserializers).QueryInterface(IPreco, Result);
    end;
    404:
      raise SDKNotFoundException.Create(Concat('Preço ', AId, ' não encontrado'));
    else
      raise SDKUnknownException.Create(Format('Erro %d - %s', [Response.Status, Response.Content]));
  end;
end;

function TPrecoService.GetAll(AProdutoId: Variant; AQuery: TString; AStart, ACount: Integer; const ASortParams: TStringArray): TPrecoList;
begin
  Result := Filter(AProdutoId, AQuery, AStart, ACount, ASortParams);
end;

function TPrecoService.GetAll(AStart, ACount: Integer; const ASortParams: TStringArray): TPrecoList;
begin
  Result := Filter(null, EmptyStr, AStart, ACount, ASortParams);
end;

function TPrecoService.Filter(const AProdutoId: Variant; AQuery: TString; AStart: Integer;
  ACount: Integer; const ASortParams: TStringArray): TPrecoList;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  PrecoList, PaginationList: TPrecoList;
  Preco: IPreco;
  URL: TString;
  ResultNodes: TCustomXMLNodeArray;
  Start, Count, Total, TotalPack, Position: Integer;
begin
  Start := AStart;
  Count := ACount;
  if AProdutoId = null then
    URL := Concat(FPath, '?', ToParams(AQuery, Start, Count, ASortParams))
  else
  begin
    FPath := FPrecosProdutosPath;
    URL := Concat(PathWithDependencies([AProdutoId]), '?', ToParams(AQuery, Start, Count, ASortParams));
  end;

  Response := FClient.Get(URL, nil, nil);
  Document := Response.AsXML;

  Nodes := TXMLHelper.XPathSelect(Document, '//ResultList/items/*');
  if Length(Nodes) <= 0 then
    Nodes := TXMLHelper.XPathSelect(Document, '//Objects/*');

  PrecoList := TPrecoList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TPreco, FDeserializers).QueryInterface(IPreco, Preco);
    PrecoList.Add(Preco);
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
      if AProdutoId = null then
        PaginationList := Filter(null, AQuery, Start, TotalPack - Position, ASortParams)
      else
        PaginationList := Filter(AProdutoId, AQuery, Position, TotalPack - Position, ASortParams);
      for Preco in PaginationList do
        PrecoList.Add(Preco);
    end;
  end;

  Result := PrecoList;
end;

function TPrecoService.GetChanges(const ALojaId: TString; ADataAlteracao: TDateTime): TPrecoListChanges;
var
  Nodes: TCustomXMLNodeArray;
  Document: IXMLDocument;
  NodeIdx: Integer;
  Preco: IPreco;
  PrecoListChange: TPrecoListChanges;
begin
  Document := TCargaService.GetChanges(ALojaId, ADataAlteracao, 'PRECO', FClient);
  Nodes := TXMLHelper.XPathSelect(Document, '//Carga/alterados/*');
  PrecoListChange := TPrecoListChanges.Create;

  Nodes := TXMLHelper.XPathSelect(Document, '//Carga/*');
  if Trim(Nodes[0].NodeValue) <> '' then
    PrecoListChange.DataAlteracao := ISO8601ToDateTime(Nodes[0].NodeValue);

  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    if Nodes[NodeIdx].NodeName = 'precos' then
    begin
      TXMLHelper.Deserialize(Nodes[NodeIdx], TPreco, FDeserializers).QueryInterface(IPreco, Preco);
      PrecoListChange.ListAlterados.Add(Preco);
    end;
  end;

  Nodes := TXMLHelper.XPathSelect(Document, '//Carga/removidos/*');
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    if Nodes[NodeIdx].NodeName = 'precos' then
    begin
      PrecoListChange.ListIdRemovidos.Add(Nodes[NodeIdx].NodeValue);
    end;
  end;

  Result := PrecoListChange;
end;

end.

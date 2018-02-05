unit SDK.Service.Produto;

interface

uses
  SDK.Types, SDK.Model.Produto, SDK.Service, SDK.Exceptions, SDK.XML, XMLIntf, SysUtils, Math;

type

  TProdutoService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AId: TString): IProduto;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TProdutoListRec;
    function Filter(const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TProdutoListRec;
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
  ProdutoList, PaginationList: TProdutoList;
  Produto: IProduto;
  URL: TString;
  ResultNodes: TCustomXMLNodeArray;
  Start, Count, Total, TotalPack, Position: Integer;
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

    if Position < TotalPack then
    begin
      PaginationList := Filter(AQuery, Start, TotalPack - Position, ASortParams);
      for Produto in PaginationList do
        ProdutoList.Add(Produto);
    end;
  end;

  Result := TProdutoListRec.Create(ProdutoList);
end;

end.


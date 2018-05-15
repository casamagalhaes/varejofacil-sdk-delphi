unit SDK.Service.MarcaProduto;

interface

uses
  SDK.Types, SDK.Model.MarcaDoProduto, SDK.Service, SDK.Exceptions, SDK.XML, XMLIntf, SysUtils, Math;

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

{ TMarcaProdutoService }

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
  case Response.Status of
    200:
    begin
      Document := Response.AsXML;
      Nodes := TXMLHelper.XPathSelect(Document, '//MarcaDoProduto');
      if Length(Nodes) > 0 then
        TXMLHelper.Deserialize(Nodes[0], TMarcaDoProduto, FDeserializers).QueryInterface(IMarcaDoProduto, Result);
    end;
    404:
      raise SDKNotFoundException.Create(Concat('Marca ', AId, ' não encontrada'));
    else
      raise SDKUnknownException.Create(Format('Erro %d - %s', [Response.Status, Response.Content]));
  end;
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
  MarcaProdutoList, PaginationList: TMarcaDoProdutoList;
  MarcaProduto: IMarcaDoProduto;
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
  MarcaProdutoList := TMarcaDoProdutoList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TMarcaDoProduto, FDeserializers).QueryInterface(IMarcaDoProduto, MarcaProduto);
    MarcaProdutoList.Add(MarcaProduto);
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
      PaginationList := Filter(AQuery, Position, TotalPack - Position, ASortParams);
      for MarcaProduto in PaginationList do
        MarcaProdutoList.Add(MarcaProduto);
    end;
  end;

  Result := TMarcaDoProdutoListRec.Create(MarcaProdutoList);
end;

end.

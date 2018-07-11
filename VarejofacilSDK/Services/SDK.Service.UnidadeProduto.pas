unit SDK.Service.UnidadeProduto;

interface

uses
  SDK.Types, SDK.Model.UnidadeProduto, SDK.Service, SDK.Exceptions, SDK.XML, XMLIntf, SysUtils, Math;

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
  case Response.Status of
    200:
    begin
      Document := Response.AsXML;
      Nodes := TXMLHelper.XPathSelect(Document, '//UnidadeProduto');
      if Length(Nodes) > 0 then
        TXMLHelper.Deserialize(Nodes[0], TUnidadeProduto, FDeserializers).QueryInterface(IUnidadeProduto, Result);
    end;
    404:
      raise SDKNotFoundException.Create(Concat('Unidade produto ', AId, ' não encontrada'));
    else
      raise SDKUnknownException.Create(Format('Erro %d - %s', [Response.Status, Response.Content]));
  end;
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
  UnidadeProdutoList, PaginationList: TUnidadeProdutoList;
  UnidadeProduto: IUnidadeProduto;
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
  UnidadeProdutoList := TUnidadeProdutoList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TUnidadeProduto, FDeserializers).QueryInterface(IUnidadeProduto, UnidadeProduto);
    UnidadeProdutoList.Add(UnidadeProduto);
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
      for UnidadeProduto in PaginationList do
        UnidadeProdutoList.Add(UnidadeProduto);
    end;
  end;

  Result := TUnidadeProdutoListRec.Create(UnidadeProdutoList);
end;

end.

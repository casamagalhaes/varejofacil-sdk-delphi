unit SDK.Service.AjusteEstoque;

interface

uses
  SDK.Types, SDK.Model.AjusteEstoque, SDK.Service, SDK.Exceptions, SDK.XML, XMLIntf,
  SysUtils, Math;

type

  TAjusteEstoqueService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AId: TString): IAjusteEstoque;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TAjusteEstoqueListRec;
    function Filter(const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TAjusteEstoqueListRec;
  end;

implementation

{ TAjusteEstoqueService }

constructor TAjusteEstoqueService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/estoque/ajustes', AClient);
end;

function TAjusteEstoqueService.Filter(const AQuery: TString; AStart,
  ACount: Integer; const ASortParams: TStringArray): TAjusteEstoqueListRec;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  AjusteList, PaginationList: TAjusteEstoqueList;
  Ajuste: IAjusteEstoque;
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
  AjusteList := TAjusteEstoqueList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TAjusteEstoque, FDeserializers).QueryInterface(IAjusteEstoque, Ajuste);
    AjusteList.Add(Ajuste);
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
      for Ajuste in PaginationList do
        AjusteList.Add(Ajuste);
    end;
  end;

  Result := TAjusteEstoqueListRec.Create(AjusteList);
end;

function TAjusteEstoqueService.Get(const AId: TString): IAjusteEstoque;
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
      Nodes := TXMLHelper.XPathSelect(Document, '//AjusteEstoque');
      if Length(Nodes) > 0 then
        TXMLHelper.Deserialize(Nodes[0], TAjusteEstoque, FDeserializers).QueryInterface(IAjusteEstoque, Result);
    end;
    404:
      raise SDKNotFoundException.Create(Concat('Ajuste de EStoque ', AId, ' não encontrado'));
    else
      raise SDKUnknownException.Create(Format('Erro %d - %s', [Response.Status, Response.Content]));
  end;
end;

function TAjusteEstoqueService.GetAll(AStart, ACount: Integer;
  const ASortParams: TStringArray): TAjusteEstoqueListRec;
begin
  Result := Filter(EmptyStr, AStart, ACount, ASortParams);
end;

end.

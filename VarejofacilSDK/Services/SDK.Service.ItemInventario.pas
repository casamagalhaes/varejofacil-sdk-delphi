unit SDK.Service.ItemInventario;

interface

uses
  SDK.Types, SDK.Model.ItemInventario, SDK.Service, SDK.Exceptions, SDK.Service.Carga,
  SDK.XML, XMLIntf, SysUtils, Math;

type

  TItemInventarioService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function GetAll(const AInventarioId: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TItemInventarioList;
    function Filter(const AInventarioId: TString; const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TItemInventarioList;
    function Update(const AInventarioID: TString; const AItemInventario: TItemInventario): TServiceCommandResult;
  end;

implementation

uses
  Classes;

{ TItemInventarioService }

constructor TItemInventarioService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/estoque/inventarios/%s/itens', AClient);
end;

function TItemInventarioService.Filter(const AInventarioId: TString; const AQuery: TString; AStart,
  ACount: Integer; const ASortParams: TStringArray): TItemInventarioList;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  ItemInventarioList, PaginationList: TItemInventarioList;
  ItemInventario: IItemInventario;
  URL: TString;
  ResultNodes: TCustomXMLNodeArray;
  Start, Count, Total, TotalPack, Position: Integer;
begin
  Start := AStart;
  Count := ACount;
  URL := Concat(PathWithDependencies([AInventarioId]), '?', ToParams(AQuery, Start, Count, ASortParams));

  Response := FClient.Get(URL, nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//ResultList/items/*');
  ItemInventarioList := TItemInventarioList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TItemInventario, FDeserializers).QueryInterface(IItemInventario, ItemInventario);
    ItemInventarioList.Add(ItemInventario);
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
      PaginationList := Filter(AInventarioId, AQuery, Position, TotalPack - Position, ASortParams);
      for ItemInventario in PaginationList do
        ItemInventarioList.Add(ItemInventario);
    end;
  end;

  Result := ItemInventarioList;
end;

function TItemInventarioService.GetAll(const AInventarioId: TString;
  AStart, ACount: Integer; const ASortParams: TStringArray): TItemInventarioList;
begin
  Result := Filter(AInventarioId, EmptyStr, AStart, ACount, ASortParams);
end;     

function TItemInventarioService.Update(const AInventarioID: TString; const AItemInventario: TItemInventario): TServiceCommandResult;
begin
  Result := inherited Update(AInventarioID, AItemInventario, PathWithDependencies([AInventarioID]));
end;     

end.


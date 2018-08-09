unit SDK.Service.Inventario;

interface

uses
  SDK.Types, SDK.Service, SDK.Exceptions, SDK.XML,
  XMLIntf, SysUtils, Math, SDK.Model.Inventario;

type

  TInventarioService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TInventarioListRec;
    function Filter(const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TInventarioListRec;
    function Update(const AId: Int64; const AModel: IModel): TServiceCommandResult;
  end;

implementation

{ TInventarioService }

constructor TInventarioService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/estoque/inventarios', AClient);
end;

function TInventarioService.Filter(const AQuery: TString; AStart,
  ACount: Integer; const ASortParams: TStringArray): TInventarioListRec;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  InventarioList, PaginationList: TInventarioList;
  Inventario: IInventario;
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
  InventarioList := TInventarioList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TInventario, FDeserializers).QueryInterface(IInventario, Inventario);
    InventarioList.Add(Inventario);
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
      PaginationList := Filter(AQuery, Start, TotalPack - Position, ASortParams);
      for Inventario in PaginationList do
        InventarioList.Add(Inventario);
    end;
  end;

  Result := TInventarioListRec.Create(InventarioList);
end;

function TInventarioService.GetAll(AStart, ACount: Integer;
  const ASortParams: TStringArray): TInventarioListRec;
begin
  Result := Filter(EmptyStr, AStart, ACount, ASortParams);
end;

function TInventarioService.Update(const AId: Int64;
  const AModel: IModel): TServiceCommandResult;
begin

end;

end.

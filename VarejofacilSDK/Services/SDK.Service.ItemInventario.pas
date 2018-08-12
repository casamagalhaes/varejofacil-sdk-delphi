unit SDK.Service.ItemInventario;

interface

uses
  SDK.Types, SDK.Model.ItemInventario, SDK.Service, SDK.Exceptions, SDK.XML, XMLIntf, SysUtils, Math;

type

  TItemInventarioService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function GetAll(const AInventarioId: TString;  AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TItemInventarioListRec;
    function Filter(const AInventarioId: TString; const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TItemInventarioListRec;
    function Update(const AInventarioID: TString;
     const AListItemInventario: TItemInventarioList): TServiceCommandResult;
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
  ACount: Integer; const ASortParams: TStringArray): TItemInventarioListRec;
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
      PaginationList := Filter(AInventarioId, AQuery, Start, TotalPack - Position, ASortParams);
      for ItemInventario in PaginationList do
        ItemInventarioList.Add(ItemInventario);
    end;
  end;

  Result := TItemInventarioListRec.Create(ItemInventarioList);
end;

function TItemInventarioService.GetAll(const AInventarioId: TString;
  AStart, ACount: Integer; const ASortParams: TStringArray): TItemInventarioListRec;
begin
  Result := Filter(AInventarioId, EmptyStr, AStart, ACount, ASortParams);
end;

function TItemInventarioService.Update(const AInventarioID: TString;
  const AListItemInventario: TItemInventarioList): TServiceCommandResult;
var
  ListSerializada: TStrings;
  ItemInventario: IItemInventario;
  Response: IResponse;
  FailReasons: TFailReasonList;  
begin
  Response := nil;
  if AListItemInventario.Count > 50 then
    raise Exception.Create('Ultrapassou o limite de 50 registros ');

  ListSerializada := TStringList.Create;
  try
    for ItemInventario in AListItemInventario do
      ListSerializada.Add(TXMLHelper.Serialize(ItemInventario, True, FSerializers));

    Response := FClient.Put(PathWithDependencies([AInventarioID]), ListSerializada.Text , nil);
  finally
    FreeAndNil(ListSerializada);
  end;

  if Assigned(Response) then
  begin
    FailReasons := TFailReasonHelper.FromResponse(Response);
    try
      Result := TServiceCommandResult.Create(Response.Status = 201, FailReasons, InterpretLocation(Response.Headers.Values['Location']));
    finally
      FailReasons.Free;
    end;
  end;

end;

end.


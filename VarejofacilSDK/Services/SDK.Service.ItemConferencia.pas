unit SDK.Service.ItemConferencia;

interface

uses
  SDK.Types, SDK.Model.ItemConferencia, SDK.Service, SDK.Exceptions, SDK.Service.Carga,
  SDK.XML, XMLIntf, SysUtils, Math;

type

  TItemConferenciaService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function GetAll(const AConferenciaId: TString;  AStart: Integer = 0; ACount: Integer = 0; const ASortParams: TStringArray = nil): TItemConferenciaList;
    function Filter(const AConferenciaId: TString; const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0; const ASortParams: TStringArray = nil): TItemConferenciaList;
    function Update(const AConferenciaId: TString; const AItemConferencia: TItemConferencia): TServiceCommandResult;
  end;

implementation

uses
  Classes;

{ TItemConferenciaService }

constructor TItemConferenciaService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/compra/conferencias/%s/produtos', AClient);
end;

function TItemConferenciaService.Filter(const AConferenciaId: TString; const AQuery: TString; AStart,
  ACount: Integer; const ASortParams: TStringArray): TItemConferenciaList;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  ItemConferenciaList, PaginationList: TItemConferenciaList;
  ItemConferencia: IItemConferencia;
  URL: TString;
  ResultNodes: TCustomXMLNodeArray;
  Start, Count, Total, TotalPack, Position: Integer;
begin
  Start := AStart;
  Count := ACount;
  URL := Concat(PathWithDependencies([AConferenciaId]), '?', ToParams(AQuery, Start, Count, ASortParams));

  Response := FClient.Get(URL, nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//ResultList/items/*');
  ItemConferenciaList := TItemConferenciaList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TItemConferencia, FDeserializers).QueryInterface(IItemConferencia, ItemConferencia);
    ItemConferenciaList.Add(ItemConferencia);
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
      PaginationList := Filter(AConferenciaId, AQuery, Start, TotalPack - Position, ASortParams);
      for ItemConferencia in PaginationList do
        ItemConferenciaList.Add(ItemConferencia);
    end;
  end;

  Result := ItemConferenciaList;
end;

function TItemConferenciaService.GetAll(const AConferenciaId: TString;
  AStart, ACount: Integer; const ASortParams: TStringArray): TItemConferenciaList;
begin
  Result := Filter(AConferenciaId, EmptyStr, AStart, ACount, ASortParams);
end;

function TItemConferenciaService.Update(const AConferenciaId: TString;
  const AItemConferencia: TItemConferencia): TServiceCommandResult;
begin
  Result := inherited Update(AConferenciaId, AItemConferencia, PathWithDependencies([AConferenciaId]));
end;

end.


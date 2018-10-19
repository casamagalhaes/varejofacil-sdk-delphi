unit SDK.Service.Conferencia;

interface

uses
  SDK.Model.Conferencia, SDK.Model.ItemConferencia, SDK.Types, SDK.Exceptions, SDK.XML,
  XMLIntf, SysUtils, Math, SDK.Service, SDK.Service.Carga;

type

  TConferenciaService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0; const ASortParams: TStringArray = nil): TConferenciaList;
    function Filter(const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0; const ASortParams: TStringArray = nil): TConferenciaList;
  end;

implementation

{ TConferenciaService }

constructor TConferenciaService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/compra/conferencias', AClient);
end;

function TConferenciaService.Filter(const AQuery: TString; AStart,
  ACount: Integer; const ASortParams: TStringArray): TConferenciaList;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  ConferenciaList, PaginationList: TConferenciaList;
  Conferencia: IConferencia;
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
  ConferenciaList := TConferenciaList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TConferencia, FDeserializers).QueryInterface(IConferencia, Conferencia);
    ConferenciaList.Add(Conferencia);
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
      for Conferencia in PaginationList do
        ConferenciaList.Add(Conferencia);
    end;
  end;

  Result := ConferenciaList;
end;

function TConferenciaService.GetAll(AStart, ACount: Integer;
  const ASortParams: TStringArray): TConferenciaList;
begin
  Result := Filter(EmptyStr, AStart, ACount, ASortParams);
end;

end.

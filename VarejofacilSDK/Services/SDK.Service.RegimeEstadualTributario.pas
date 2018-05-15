unit SDK.Service.RegimeEstadualTributario;

interface

uses
  SDK.Types, SDK.Model.RegimeEstadualTributario, SDK.Service, SDK.XML, XMLIntf, SysUtils, Math;

type

  TRegimeEstadualTributarioService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AId: TString): IRegimeEstadualTributario;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TRegimeEstadualTributarioListRec;
    function Filter(const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TRegimeEstadualTributarioListRec;
  end;

implementation

{ TRegimeEstadualTributarioService }

constructor TRegimeEstadualTributarioService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/fiscal/regime-estadual-tributario', AClient);
end;

function TRegimeEstadualTributarioService.Get(const AId: TString): IRegimeEstadualTributario;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  Document: IXMLDocument;
begin
  Result := nil;
  Response := FClient.Get(Concat(FPath, '/', AId), nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//RegimeEstadualTributario');
  if Length(Nodes) > 0 then
    TXMLHelper.Deserialize(Nodes[0], TRegimeEstadualTributario, FDeserializers).QueryInterface(IRegimeEstadualTributario, Result);
end;

function TRegimeEstadualTributarioService.GetAll(AStart, ACount: Integer; const ASortParams: TStringArray): TRegimeEstadualTributarioListRec;
begin
  Result := Filter(EmptyStr, AStart, ACount, ASortParams);
end;

function TRegimeEstadualTributarioService.Filter(const AQuery: TString; AStart: Integer;
  ACount: Integer; const ASortParams: TStringArray): TRegimeEstadualTributarioListRec;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  RegimeEstadualTributarioList, PaginationList: TRegimeEstadualTributarioList;
  RegimeEstadualTributario: IRegimeEstadualTributario;
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
  RegimeEstadualTributarioList := TRegimeEstadualTributarioList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TRegimeEstadualTributario, FDeserializers).QueryInterface(IRegimeEstadualTributario, RegimeEstadualTributario);
    RegimeEstadualTributarioList.Add(RegimeEstadualTributario);
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
      for RegimeEstadualTributario in PaginationList do
        RegimeEstadualTributarioList.Add(RegimeEstadualTributario);
    end;
  end;

  Result := TRegimeEstadualTributarioListRec.Create(RegimeEstadualTributarioList);
end;

end.

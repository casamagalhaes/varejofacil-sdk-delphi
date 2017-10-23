unit SDK.Service.Secao;

interface

uses
  SDK.Types, SDK.Model.Secao, SDK.Service, SDK.XML, XMLIntf, SysUtils, Math;

type

  TSecaoService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AId: TString): ISecao;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TSecaoListRec;
    function Filter(const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TSecaoListRec;
  end;

implementation

{ TSecaoService }

constructor TSecaoService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/produto/secoes', AClient);
end;

function TSecaoService.Get(const AId: TString): ISecao;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  Document: IXMLDocument;
begin
  Result := nil;
  Response := FClient.Get(Concat(FPath, '/', AId), nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//Secao');
  if Length(Nodes) > 0 then
    TXMLHelper.Deserialize(Nodes[0], TSecao, FDeserializers).QueryInterface(ISecao, Result);
end;

function TSecaoService.GetAll(AStart, ACount: Integer; const ASortParams: TStringArray): TSecaoListRec;
begin
  Result := Filter(EmptyStr, AStart, ACount, ASortParams);
end;

function TSecaoService.Filter(const AQuery: TString; AStart: Integer;
  ACount: Integer; const ASortParams: TStringArray): TSecaoListRec;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  SecaoList, PaginationList: TSecaoList;
  Secao: ISecao;
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
  SecaoList := TSecaoList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TSecao, FDeserializers).QueryInterface(ISecao, Secao);
    SecaoList.Add(Secao);
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
      for Secao in PaginationList do
        SecaoList.Add(Secao);
    end;
  end;

  Result := TSecaoListRec.Create(SecaoList);
end;

end.

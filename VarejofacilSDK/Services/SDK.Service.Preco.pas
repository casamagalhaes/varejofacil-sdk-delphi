unit SDK.Service.Preco;

interface

uses
  SDK.Types, SDK.Model.Preco, SDK.Service, SDK.XML, XMLIntf, SysUtils, Math;

type

  TPrecoService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AId: TString): IPreco;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TPrecoListRec;
    function Filter(const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TPrecoListRec;
  end;

implementation

{ TPrecoService }

constructor TPrecoService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/produto/precos', AClient);
end;

function TPrecoService.Get(const AId: TString): IPreco;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  Document: IXMLDocument;
begin
  Result := nil;
  Response := FClient.Get(Concat(FPath, '/', AId), nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//Preco');
  if Length(Nodes) > 0 then
    TXMLHelper.Deserialize(Nodes[0], TPreco, FDeserializers).QueryInterface(IPreco, Result);
end;

function TPrecoService.GetAll(AStart, ACount: Integer; const ASortParams: TStringArray): TPrecoListRec;
begin
  Result := Filter(EmptyStr, AStart, ACount, ASortParams);
end;

function TPrecoService.Filter(const AQuery: TString; AStart: Integer;
  ACount: Integer; const ASortParams: TStringArray): TPrecoListRec;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  PrecoList, PaginationList: TPrecoList;
  Preco: IPreco;
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
  PrecoList := TPrecoList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TPreco, FDeserializers).QueryInterface(IPreco, Preco);
    PrecoList.Add(Preco);
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
      for Preco in PaginationList do
        PrecoList.Add(Preco);
    end;
  end;

  Result := TPrecoListRec.Create(PrecoList);
end;

end.

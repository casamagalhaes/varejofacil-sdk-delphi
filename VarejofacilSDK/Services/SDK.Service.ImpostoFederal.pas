unit SDK.Service.ImpostoFederal;

interface

uses
  SDK.Types, SDK.Model.ImpostoFederal, SDK.Service, SDK.Exceptions, SDK.XML, XMLIntf, SysUtils, Math;

type

  TImpostoFederalService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AId: TString): IImpostoFederal;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TImpostoFederalListRec;
    function Filter(const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TImpostoFederalListRec;
  end;

implementation

{ TImpostoFederalService }

constructor TImpostoFederalService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/fiscal/impostos-federais', AClient);
end;

function TImpostoFederalService.Get(const AId: TString): IImpostoFederal;
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
      Nodes := TXMLHelper.XPathSelect(Document, '//ImpostoFederal');
      if Length(Nodes) > 0 then
        TXMLHelper.Deserialize(Nodes[0], TImpostoFederal, FDeserializers).QueryInterface(IImpostoFederal, Result);
    end;
    404:
      raise SDKNotFoundException.Create(Concat('Imposto federal ', AId, ' não encontrado'));
    else
      raise SDKUnknownException.Create(Format('Erro %d - %s', [Response.Status, Response.Content]));
  end;
end;

function TImpostoFederalService.GetAll(AStart, ACount: Integer; const ASortParams: TStringArray): TImpostoFederalListRec;
begin
  Result := Filter(EmptyStr, AStart, ACount, ASortParams);
end;

function TImpostoFederalService.Filter(const AQuery: TString; AStart: Integer;
  ACount: Integer; const ASortParams: TStringArray): TImpostoFederalListRec;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  ImpostoFederalList, PaginationList: TImpostoFederalList;
  ImpostoFederal: IImpostoFederal;
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
  ImpostoFederalList := TImpostoFederalList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TImpostoFederal, FDeserializers).QueryInterface(IImpostoFederal, ImpostoFederal);
    ImpostoFederalList.Add(ImpostoFederal);
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
      for ImpostoFederal in PaginationList do
        ImpostoFederalList.Add(ImpostoFederal);
    end;
  end;

  Result := TImpostoFederalListRec.Create(ImpostoFederalList);
end;

end.

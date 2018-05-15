unit SDK.Service.NCM;

interface

uses
  SDK.Types, SDK.Model.NCM, SDK.Service, SDK.Exceptions, SDK.XML, XMLIntf, SysUtils, Math;

type

  TNCMService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AId: TString): INCM;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TNCMListRec;
    function Filter(const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TNCMListRec;
  end;

implementation

{ TNCMService }

constructor TNCMService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/fiscal/ncms', AClient);
end;

function TNCMService.Get(const AId: TString): INCM;
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
      Nodes := TXMLHelper.XPathSelect(Document, '//NCM');
      if Length(Nodes) > 0 then
        TXMLHelper.Deserialize(Nodes[0], TNCM, FDeserializers).QueryInterface(INCM, Result);
    end;
    404:
      raise SDKNotFoundException.Create(Concat('NCM ', AId, ' não encontrado'));
    else
      raise SDKUnknownException.Create(Format('Erro %d - %s', [Response.Status, Response.Content]));
  end;
end;

function TNCMService.GetAll(AStart, ACount: Integer; const ASortParams: TStringArray): TNCMListRec;
begin
  Result := Filter(EmptyStr, AStart, ACount, ASortParams);
end;

function TNCMService.Filter(const AQuery: TString; AStart: Integer;
  ACount: Integer; const ASortParams: TStringArray): TNCMListRec;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  NCMList, PaginationList: TNCMList;
  NCM: INCM;
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
  NCMList := TNCMList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TNCM, FDeserializers).QueryInterface(INCM, NCM);
    NCMList.Add(NCM);
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
      for NCM in PaginationList do
        NCMList.Add(NCM);
    end;
  end;

  Result := TNCMListRec.Create(NCMList);
end;

end.

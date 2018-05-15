unit SDK.Service.SituacaoFiscal;

interface

uses
  SDK.Types, SDK.Model.SituacaoFiscal, SDK.Exceptions, SDK.Service, SDK.XML, XMLIntf, SysUtils, Math;

type

  TSituacaoFiscalService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AId: TString): ISituacaoFiscal;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TSituacaoFiscalListRec;
    function Filter(const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TSituacaoFiscalListRec;
  end;

implementation

{ TSituacaoFiscalService }

constructor TSituacaoFiscalService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/fiscal/situacoes', AClient);
end;

function TSituacaoFiscalService.Get(const AId: TString): ISituacaoFiscal;
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
      Nodes := TXMLHelper.XPathSelect(Document, '//SituacaoFiscal');
      if Length(Nodes) > 0 then
        TXMLHelper.Deserialize(Nodes[0], TSituacaoFiscal, FDeserializers).QueryInterface(ISituacaoFiscal, Result);
    end;
    404:
    begin
      raise SDKNotFoundException.Create(Concat('Tabela tributária ', AId, ' não encontrada'));
    end;
    else
    begin
      raise SDKUnknownException.Create(Format('Erro %d - %s', [Response.Status, Response.Content]));
    end;
  end;
end;

function TSituacaoFiscalService.GetAll(AStart, ACount: Integer; const ASortParams: TStringArray): TSituacaoFiscalListRec;
begin
  Result := Filter(EmptyStr, AStart, ACount, ASortParams);
end;

function TSituacaoFiscalService.Filter(const AQuery: TString; AStart: Integer;
  ACount: Integer; const ASortParams: TStringArray): TSituacaoFiscalListRec;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  SituacaoFiscalList, PaginationList: TSituacaoFiscalList;
  SituacaoFiscal: ISituacaoFiscal;
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
  SituacaoFiscalList := TSituacaoFiscalList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TSituacaoFiscal, FDeserializers).QueryInterface(ISituacaoFiscal, SituacaoFiscal);
    SituacaoFiscalList.Add(SituacaoFiscal);
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
      for SituacaoFiscal in PaginationList do
        SituacaoFiscalList.Add(SituacaoFiscal);
    end;
  end;

  Result := TSituacaoFiscalListRec.Create(SituacaoFiscalList);
end;

end.

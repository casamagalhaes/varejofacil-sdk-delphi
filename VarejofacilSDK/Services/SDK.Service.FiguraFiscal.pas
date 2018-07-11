unit SDK.Service.FiguraFiscal;

interface

uses
  SDK.Types, SDK.Model.FiguraFiscal, SDK.Exceptions, SDK.Service, SDK.XML, XMLIntf, SysUtils, Math;

type

  TFiguraFiscalService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AId: TString): IFiguraFiscal;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TFiguraFiscalListRec;
    function Filter(const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TFiguraFiscalListRec;
  end;

implementation

{ TFiguraFiscalService }

constructor TFiguraFiscalService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/fiscal/figura-fiscal', AClient);
end;

function TFiguraFiscalService.Get(const AId: TString): IFiguraFiscal;
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
      Nodes := TXMLHelper.XPathSelect(Document, '//FiguraFiscal');
      if Length(Nodes) > 0 then
        TXMLHelper.Deserialize(Nodes[0], TFiguraFiscal, FDeserializers).QueryInterface(IFiguraFiscal, Result);
    end;
    404:
    begin
      raise SDKNotFoundException.Create(Concat('Figura fiscal ', AId, ' não encontrada'));
    end;
    else
    begin
      raise SDKUnknownException.Create(Format('Erro %d - %s', [Response.Status, Response.Content]));
    end;
  end;
end;

function TFiguraFiscalService.GetAll(AStart, ACount: Integer; const ASortParams: TStringArray): TFiguraFiscalListRec;
begin
  Result := Filter(EmptyStr, AStart, ACount, ASortParams);
end;

function TFiguraFiscalService.Filter(const AQuery: TString; AStart: Integer;
  ACount: Integer; const ASortParams: TStringArray): TFiguraFiscalListRec;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  FiguraFiscalList, PaginationList: TFiguraFiscalList;
  FiguraFiscal: IFiguraFiscal;
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
  FiguraFiscalList := TFiguraFiscalList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TFiguraFiscal, FDeserializers).QueryInterface(IFiguraFiscal, FiguraFiscal);
    FiguraFiscalList.Add(FiguraFiscal);
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
      PaginationList := Filter(AQuery, Position, TotalPack - Position, ASortParams);
      for FiguraFiscal in PaginationList do
        FiguraFiscalList.Add(FiguraFiscal);
    end;
  end;

  Result := TFiguraFiscalListRec.Create(FiguraFiscalList);
end;

end.

unit SDK.Service.TabelaTributaria;

interface

uses
  SDK.Types, SDK.Model.TabelaTributaria, SDK.Exceptions, SDK.Service, SDK.XML, XMLIntf, SysUtils, Math;

type

  TTabelaTributariaService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AId: TString): ITabelaTributaria;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TTabelaTributariaListRec;
    function Filter(const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TTabelaTributariaListRec;
  end;

implementation

{ TTabelaTributariaService }

constructor TTabelaTributariaService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/fiscal/tabelas-tributarias', AClient);
end;

function TTabelaTributariaService.Get(const AId: TString): ITabelaTributaria;
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
      Nodes := TXMLHelper.XPathSelect(Document, '//TabelaTributaria');
      if Length(Nodes) > 0 then
        TXMLHelper.Deserialize(Nodes[0], TTabelaTributaria, FDeserializers).QueryInterface(ITabelaTributaria, Result);
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

function TTabelaTributariaService.GetAll(AStart, ACount: Integer; const ASortParams: TStringArray): TTabelaTributariaListRec;
begin
  Result := Filter(EmptyStr, AStart, ACount, ASortParams);
end;

function TTabelaTributariaService.Filter(const AQuery: TString; AStart: Integer;
  ACount: Integer; const ASortParams: TStringArray): TTabelaTributariaListRec;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  TabelaTributariaList, PaginationList: TTabelaTributariaList;
  TabelaTributaria: ITabelaTributaria;
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
  TabelaTributariaList := TTabelaTributariaList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TTabelaTributaria, FDeserializers).QueryInterface(ITabelaTributaria, TabelaTributaria);
    TabelaTributariaList.Add(TabelaTributaria);
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
      for TabelaTributaria in PaginationList do
        TabelaTributariaList.Add(TabelaTributaria);
    end;
  end;

  Result := TTabelaTributariaListRec.Create(TabelaTributariaList);
end;

end.

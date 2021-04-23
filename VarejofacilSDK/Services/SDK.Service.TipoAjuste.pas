unit SDK.Service.TipoAjuste;

interface

uses
  SDK.Types, SDK.Model.TipoAjuste, SDK.Service, SDK.Exceptions, SDK.XML, XMLIntf,
  SysUtils, Math;

type

  TTipoAjusteService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AId: TString): ITipoAjuste;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TTipoAjusteListRec;
    function Filter(const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TTipoAjusteListRec;
  end;


implementation

{ TTipoAjusteService }

constructor TTipoAjusteService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/estoque/tipos-ajuste', AClient);
end;

function TTipoAjusteService.Filter(const AQuery: TString; AStart,
  ACount: Integer; const ASortParams: TStringArray): TTipoAjusteListRec;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  TipoAjusteList, PaginationList: TTipoAjusteList;
  TipoAjuste: ITipoAjuste;
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
  TipoAjusteList := TTipoAjusteList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TTipoAjuste, FDeserializers).QueryInterface(ITipoAjuste, TipoAjuste);
    TipoAjusteList.Add(TipoAjuste);
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
      for TipoAjuste in PaginationList do
        TipoAjusteList.Add(TipoAjuste);
    end;
  end;
  Result := TTipoAjusteListRec.Create(TipoAjusteList);
end;

function TTipoAjusteService.Get(const AId: TString): ITipoAjuste;
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
      Nodes := TXMLHelper.XPathSelect(Document, '//AjusteEstoque');
      if Length(Nodes) > 0 then
        TXMLHelper.Deserialize(Nodes[0], TTipoAjuste, FDeserializers).QueryInterface(ITipoAjuste, Result);
    end;
    404:
      raise SDKNotFoundException.Create(Concat('Ajuste de EStoque ', AId, ' não encontrado'));
    else
      raise SDKUnknownException.Create(Format('Erro %d - %s', [Response.Status, Response.Content]));
  end;
end;

function TTipoAjusteService.GetAll(AStart, ACount: Integer;
  const ASortParams: TStringArray): TTipoAjusteListRec;
begin
  Result := Filter(EmptyStr, AStart, ACount, ASortParams);
end;

end.

unit SDK.Service.Loja;

interface

uses
  SDK.Types, SDK.Model.Loja, SDK.Service, SDK.Exceptions, SDK.XML, XMLIntf, SysUtils, Math;

type

  TLojaService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AId: TString): ILoja;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TLojaListRec;
    function Filter(const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TLojaListRec;
    function GetChanges(const ALojaId, ADataAlteracao: TString): TLojaListChanges;

  end;

implementation

uses
  SDK.Service.Carga;

{ TLojaService }

constructor TLojaService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/pessoa/lojas', AClient);
end;

function TLojaService.Get(const AId: TString): ILoja;
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
      Nodes := TXMLHelper.XPathSelect(Document, '//Loja');
      if Length(Nodes) > 0 then
        TXMLHelper.Deserialize(Nodes[0], TLoja, FDeserializers).QueryInterface(ILoja, Result);
    end;
    404:
      raise SDKNotFoundException.Create(Concat('Loja ', AId, ' não encontrada'));
    else
      raise SDKUnknownException.Create(Format('Erro %d - %s', [Response.Status, Response.Content]));
  end;
end;

function TLojaService.GetAll(AStart, ACount: Integer; const ASortParams: TStringArray): TLojaListRec;
begin
  Result := Filter(EmptyStr, AStart, ACount, ASortParams);
end;

function TLojaService.GetChanges(const ALojaId,
  ADataAlteracao: TString): TLojaListChanges;
var
  Nodes: TCustomXMLNodeArray;
  Document: IXMLDocument;
  NodeIdx: Integer;
  Loja: ILoja;
  LojaListChanges: TLojaListChanges;
begin
  Document := TCargaService.GetChanges(ALojaId, ADataAlteracao, 'LOJA', FClient);
  Nodes := TXMLHelper.XPathSelect(Document, '//Carga/alterados/*');
  LojaListChanges := TLojaListChanges.Create;
    for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    if Nodes[NodeIdx].NodeName = 'lojas' then
    begin
      TXMLHelper.Deserialize(Nodes[NodeIdx], TLoja, FDeserializers).QueryInterface(ILoja, Loja);
      LojaListChanges.ListAlterados.Add(Loja);
    end;
  end;

  Nodes := TXMLHelper.XPathSelect(Document, '//Carga/removidos/*');
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    if Nodes[NodeIdx].NodeName = 'lojas' then
    begin
      LojaListChanges.ListIdRemovidos.Add(Nodes[NodeIdx].NodeValue);
    end;
  end;

  Result := LojaListChanges;
end;

function TLojaService.Filter(const AQuery: TString; AStart: Integer;
  ACount: Integer; const ASortParams: TStringArray): TLojaListRec;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  LojaList, PaginationList: TLojaList;
  Loja: ILoja;
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
  LojaList := TLojaList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TLoja, FDeserializers).QueryInterface(ILoja, Loja);
    LojaList.Add(Loja);
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
      for Loja in PaginationList do
        LojaList.Add(Loja);
    end;
  end;

  Result := TLojaListRec.Create(LojaList);
end;

end.

unit SDK.Service.ImpressaoEtiqueta;

interface

uses
  SDK.Types, SDK.Model.ImpressaoEtiqueta, SDK.Service, SDK.Exceptions, SDK.XML, XMLIntf, SysUtils, Math;

type

  TImpressaoEtiquetaService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AId: TString): IImpressaoEtiqueta;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TImpressaoEtiquetaListRec;
    function Filter(const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TImpressaoEtiquetaListRec;
  end;

implementation

{ TImpressaoEtiquetaService }

constructor TImpressaoEtiquetaService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/produto/impressao-etiqueta', AClient);
end;

function TImpressaoEtiquetaService.Filter(const AQuery: TString; AStart,
  ACount: Integer; const ASortParams: TStringArray): TImpressaoEtiquetaListRec;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  ImpressaoEtiquetaList, PaginationList: TImpressaoEtiquetaList;
  ImpressaoEtiqueta: IImpressaoEtiqueta;
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
  ImpressaoEtiquetaList := TImpressaoEtiquetaList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TImpressaoEtiqueta, FDeserializers).QueryInterface(IImpressaoEtiqueta, ImpressaoEtiqueta);
    ImpressaoEtiquetaList.Add(ImpressaoEtiqueta);
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
      for ImpressaoEtiqueta in PaginationList do
        ImpressaoEtiquetaList.Add(ImpressaoEtiqueta);
    end;
  end;
  Result := TImpressaoEtiquetaListRec.Create(ImpressaoEtiquetaList);
end;

function TImpressaoEtiquetaService.Get(const AId: TString): IImpressaoEtiqueta;
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
      Nodes := TXMLHelper.XPathSelect(Document, '//ImpressaoEtiqueta');
      if Length(Nodes) > 0 then
        TXMLHelper.Deserialize(Nodes[0], TImpressaoEtiqueta, FDeserializers).QueryInterface(IImpressaoEtiqueta, Result);
    end;
    404:
      raise SDKNotFoundException.Create(Concat('Impressão de Etiqueta ', AId, ' não encontrada'));
    else
      raise SDKUnknownException.Create(Format('Erro %d - %s', [Response.Status, Response.Content]));
  end;
end;

function TImpressaoEtiquetaService.GetAll(AStart, ACount: Integer;
  const ASortParams: TStringArray): TImpressaoEtiquetaListRec;
begin
  Result := Filter(EmptyStr, AStart, ACount, ASortParams);
end;

end.

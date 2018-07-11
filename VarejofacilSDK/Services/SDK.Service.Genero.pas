unit SDK.Service.Genero;

interface

uses
  SDK.Types, SDK.Model.Genero, SDK.Service, SDK.Exceptions, SDK.XML, XMLIntf, SysUtils, Math;

type

  TGeneroService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AId: TString): IGenero;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TGeneroListRec;
    function Filter(const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TGeneroListRec;
  end;

implementation

{ TGeneroService }

constructor TGeneroService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/produto/generos', AClient);
end;

function TGeneroService.Get(const AId: TString): IGenero;
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
      Nodes := TXMLHelper.XPathSelect(Document, '//Genero');
      if Length(Nodes) > 0 then
        TXMLHelper.Deserialize(Nodes[0], TGenero, FDeserializers).QueryInterface(IGenero, Result);
    end;
    404:
      raise SDKNotFoundException.Create(Concat('Gênero ', AId, ' não encontrado'));
    else
      raise SDKUnknownException.Create(Format('Erro %d - %s', [Response.Status, Response.Content]));
  end;
end;

function TGeneroService.GetAll(AStart, ACount: Integer; const ASortParams: TStringArray): TGeneroListRec;
begin
  Result := Filter(EmptyStr, AStart, ACount, ASortParams);
end;

function TGeneroService.Filter(const AQuery: TString; AStart: Integer;
  ACount: Integer; const ASortParams: TStringArray): TGeneroListRec;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  GeneroList, PaginationList: TGeneroList;
  Genero: IGenero;
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
  GeneroList := TGeneroList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TGenero, FDeserializers).QueryInterface(IGenero, Genero);
    GeneroList.Add(Genero);
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
      for Genero in PaginationList do
        GeneroList.Add(Genero);
    end;
  end;

  Result := TGeneroListRec.Create(GeneroList);
end;

end.

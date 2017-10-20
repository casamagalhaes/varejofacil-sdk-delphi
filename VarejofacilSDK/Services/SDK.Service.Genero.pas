unit SDK.Service.Genero;

interface

uses
  SDK.Types, SDK.Model.Genero, SDK.Service, SDK.XML, XMLIntf, SysUtils;

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
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//Genero');
  if Length(Nodes) > 0 then
    TXMLHelper.Deserialize(Nodes[0], TGenero, FDeserializers).QueryInterface(IGenero, Result);
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
  GeneroList: IGeneroList;
  Genero: IGenero;
  URL: TString;
begin
  URL := Concat(FPath, '?', ToParams(AQuery, AStart, ACount, ASortParams));
  Response := FClient.Get(URL, nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//ResultList/items/*');
  GeneroList := TGeneroList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TGenero, FDeserializers).QueryInterface(IGenero, Genero);
    GeneroList.Add(Genero);
  end;
  Result := TGeneroListRec.Create(GeneroList);
end;

end.

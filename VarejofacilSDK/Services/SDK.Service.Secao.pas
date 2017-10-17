unit SDK.Service.Secao;

interface

uses
  SDK.Types, SDK.Model.Secao, SDK.Service, SDK.XML, XMLIntf, SysUtils;

type

  TSecaoService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AId: TString): ISecao;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = []): TSecaoListRec;
    function Filter(const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = []): TSecaoListRec;
  end;

implementation

{ TSecaoService }

constructor TSecaoService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/produto/secoes', AClient);
end;

function TSecaoService.Get(const AId: TString): ISecao;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  Document: IXMLDocument;
begin
  Result := nil;
  Response := FClient.Get(Concat(FPath, '/', AId), nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//Secao');
  if Length(Nodes) > 0 then
    TXMLHelper.Deserialize(Nodes[0], TSecao, FDeserializers).QueryInterface(ISecao, Result);
end;

function TSecaoService.GetAll(AStart, ACount: Integer; const ASortParams: TStringArray): TSecaoListRec;
begin
  Result := Filter(EmptyStr, AStart, ACount, ASortParams);
end;

function TSecaoService.Filter(const AQuery: TString; AStart: Integer;
  ACount: Integer; const ASortParams: TStringArray): TSecaoListRec;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  SecaoList: ISecaoList;
  Secao: ISecao;
  URL: TString;
begin
  URL := Concat(FPath, '?', ToParams(AQuery, AStart, ACount, ASortParams));
  Response := FClient.Get(URL, nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//ResultList/items/*');
  SecaoList := TSecaoList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TSecao, FDeserializers).QueryInterface(ISecao, Secao);
    SecaoList.Add(Secao);
  end;
  Result := TSecaoListRec.Create(SecaoList);
end;

end.

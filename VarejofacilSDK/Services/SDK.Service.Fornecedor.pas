unit SDK.Service.Fornecedor;

interface

uses
  SDK.Types, SDK.Model.Fornecedor, SDK.Service, SDK.XML, XMLIntf, SysUtils;

type

  TFornecedorService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AId: TString): IFornecedor;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TFornecedorListRec;
    function Filter(const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TFornecedorListRec;
  end;

implementation

{ TFornecedorService }

constructor TFornecedorService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/pessoa/fornecedores', AClient);
end;

function TFornecedorService.Get(const AId: TString): IFornecedor;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  Document: IXMLDocument;
begin
  Result := nil;
  Response := FClient.Get(Concat(FPath, '/', AId), nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//Fornecedor');
  if Length(Nodes) > 0 then
    TXMLHelper.Deserialize(Nodes[0], TFornecedor, FDeserializers).QueryInterface(IFornecedor, Result);
end;

function TFornecedorService.GetAll(AStart, ACount: Integer; const ASortParams: TStringArray): TFornecedorListRec;
begin
  Result := Filter(EmptyStr, AStart, ACount, ASortParams);
end;

function TFornecedorService.Filter(const AQuery: TString; AStart: Integer;
  ACount: Integer; const ASortParams: TStringArray): TFornecedorListRec;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  FornecedorList: IFornecedorList;
  Fornecedor: IFornecedor;
  URL: TString;
begin
  URL := Concat(FPath, '?', ToParams(AQuery, AStart, ACount, ASortParams));
  Response := FClient.Get(URL, nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//ResultList/items/*');
  FornecedorList := TFornecedorList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TFornecedor, FDeserializers).QueryInterface(IFornecedor, Fornecedor);
    FornecedorList.Add(Fornecedor);
  end;
  Result := TFornecedorListRec.Create(FornecedorList);
end;

end.

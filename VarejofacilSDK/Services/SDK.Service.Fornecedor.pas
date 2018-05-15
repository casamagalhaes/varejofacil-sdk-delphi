unit SDK.Service.Fornecedor;

interface

uses
  SDK.Types, SDK.Model.Fornecedor, SDK.Service, SDK.Exceptions, SDK.XML, XMLIntf, SysUtils, Math;

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
  case Response.Status of
    200:
    begin
      Document := Response.AsXML;
      Nodes := TXMLHelper.XPathSelect(Document, '//Fornecedor');
      if Length(Nodes) > 0 then
        TXMLHelper.Deserialize(Nodes[0], TFornecedor, FDeserializers).QueryInterface(IFornecedor, Result);
    end;
    404:
      raise SDKNotFoundException.Create(Concat('Fornecedor ', AId, ' não encontrado'));
    else
      raise SDKUnknownException.Create(Format('Erro %d - %s', [Response.Status, Response.Content]));
  end;
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
  FornecedorList, PaginationList: TFornecedorList;
  Fornecedor: IFornecedor;
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
  FornecedorList := TFornecedorList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TFornecedor, FDeserializers).QueryInterface(IFornecedor, Fornecedor);
    FornecedorList.Add(Fornecedor);
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
      for Fornecedor in PaginationList do
        FornecedorList.Add(Fornecedor);
    end;
  end;

  Result := TFornecedorListRec.Create(FornecedorList);
end;

end.

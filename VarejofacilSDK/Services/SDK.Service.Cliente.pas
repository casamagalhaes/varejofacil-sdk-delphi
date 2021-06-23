unit SDK.Service.Cliente;

interface

uses
  SDK.Types, SDK.Model.Cliente, SDK.Service, SDK.Exceptions, SDK.XML, XMLIntf, SysUtils, Math;

type

  TClienteService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AId: TString): ICliente;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TClienteListRec;
    function Filter(const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TClienteListRec;
  end;

implementation

{ TClienteService }

constructor TClienteService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/pessoa/clientes', AClient);
end;

function TClienteService.Get(const AId: TString): ICliente;
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
      Nodes := TXMLHelper.XPathSelect(Document, '//Cliente');
      if Length(Nodes) > 0 then
        TXMLHelper.Deserialize(Nodes[0], TCliente, FDeserializers).QueryInterface(ICliente, Result);
    end;
    404:
      raise SDKNotFoundException.Create(Concat('Cliente', AId, ' n�o encontrado'));
    else
      raise SDKUnknownException.Create(Format('Erro %d - %s', [Response.Status, Response.Content]));
  end;
end;

function TClienteService.GetAll(AStart, ACount: Integer; const ASortParams: TStringArray): TClienteListRec;
begin
  Result := Filter(EmptyStr, AStart, ACount, ASortParams);
end;

function TClienteService.Filter(const AQuery: TString; AStart: Integer;
  ACount: Integer; const ASortParams: TStringArray): TClienteListRec;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  ClienteList, PaginationList: TClienteList;
  Cliente: ICliente;
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
  ClienteList := TClienteList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TCliente, FDeserializers).QueryInterface(ICliente, Cliente);
    ClienteList.Add(Cliente);
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
      for Cliente in PaginationList do
        ClienteList.Add(Cliente);
    end;
  end;

  Result := TClienteListRec.Create(ClienteList);
end;

end.

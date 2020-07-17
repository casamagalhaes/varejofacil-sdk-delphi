unit SDK.Service.Funcionario;

interface

uses
  SDK.Types, SDK.Model.Funcionario, SDK.Service, SDK.Exceptions, SDK.XML, XMLIntf, SysUtils, Math;

type
  TFuncionarioService = class(TService)
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const Aid: TString): IFuncionario;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0 ;
     ASortParams: TStringArray = nil): TFuncionarioList;
    function Filter(const AQuery: TString; AStart: Integer = 0;
      ACount: Integer = 0; const ASortParams: TStringArray = nil): TFuncionarioList;
    function GetChanges(const ALojaId: TString; ADataAlteracao: TDateTime): TFuncionarioListChanges;   
  end;

implementation

uses
  SDK.Service.Carga;

{ TFuncionarioService }

constructor TFuncionarioService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/pessoa/funcionarios', AClient);
end;

function TFuncionarioService.Filter(const AQuery: TString; AStart,
  ACount: Integer; const ASortParams: TStringArray): TFuncionarioList;
var
  Start,
  Count,
  Total,
  TotalPack,
  Position: Integer;
  URL: TString;
  Response: IResponse;
  Document: IXMLDocument;
  Nodes,
  ResultNodes: TCustomXMLNodeArray;
  FuncionarioList, PaginationList: TFuncionarioList;
  NodeIdx: Integer;
  Funcionario: IFuncionario;
begin
  Start := AStart;
  Count := ACount;
  URL := Concat(FPath, '?', ToParams(AQuery, Start, Count, ASortParams));
  Response := FClient.Get(URL, nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//ResultList/items/*');
  FuncionarioList := TFuncionarioList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TFuncionario, FDeserializers).QueryInterface(IFuncionario, Funcionario);
    FuncionarioList.Add(Funcionario);
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
      for Funcionario in PaginationList do
        FuncionarioList.Add(Funcionario);
    end;
  end;
  Result := FuncionarioList;
end;

function TFuncionarioService.Get(const Aid: TString): IFuncionario;
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
      Nodes := TXMLHelper.XPathSelect(Document, '//funcionarios');
      if Length(Nodes) > 0 then
        TXMLHelper.Deserialize(Nodes[0], TFuncionario, FDeserializers).QueryInterface(IFuncionario, Result);
    end;
    404:
      raise SDKNotFoundException.Create(Concat('Funcionario ', AId, ' não encontrado'));
    else
      raise SDKUnknownException.Create(Format('Erro %d - %s', [Response.Status, Response.Content]));
  end;
end;

function TFuncionarioService.GetAll(AStart, ACount: Integer;
  ASortParams: TStringArray): TFuncionarioList;
begin
   Result := Filter(EmptyStr, AStart, ACount, ASortParams);
end;

function TFuncionarioService.GetChanges(const ALojaId: TString;
  ADataAlteracao: TDateTime): TFuncionarioListChanges;
var
  Nodes: TCustomXMLNodeArray;
  Document: IXMLDocument;
  NodeIdx: Integer;
  Funcionario: IFuncionario;
  FuncionarioListChange: TFuncionarioListChanges;
begin
  Document := TCargaService.GetChanges(ALojaId, ADataAlteracao, 'FUNCIONARIO', FClient);
  FuncionarioListChange := TFuncionarioListChanges.Create;         
  Nodes := TXMLHelper.XPathSelect(Document, '//Carga/*');
  if Trim(Nodes[0].NodeValue) <> '' then
    FuncionarioListChange.DataAlteracao := ISO8601ToDateTime(Nodes[0].NodeValue);

  Nodes := TXMLHelper.XPathSelect(Document, '//Carga/alterados/*');
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    if Nodes[NodeIdx].NodeName = 'funcionarios' then
    begin
      TXMLHelper.Deserialize(Nodes[NodeIdx], TFuncionario, FDeserializers).QueryInterface(IFuncionario, Funcionario);
      FuncionarioListChange.ListAlterados.Add(Funcionario);
    end;
  end;

  Nodes := TXMLHelper.XPathSelect(Document, '//Carga/removidos/*');
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    if Nodes[NodeIdx].NodeName = 'funcionarios' then
      FuncionarioListChange.ListIdRemovidos.Add(Nodes[NodeIdx].NodeValue);
  end;

  Result := FuncionarioListChange;
end;

end.



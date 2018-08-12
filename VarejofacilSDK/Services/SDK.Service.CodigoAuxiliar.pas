﻿unit SDK.Service.CodigoAuxiliar;

interface

uses
  SDK.Types, SDK.Model.CodigoAuxiliar, SDK.Service, SDK.XML, XMLIntf, SysUtils, Math, Variants;

type

  TCodigoAuxiliarService = class(TBatchService)
  private
    FSecondaryPath: string;
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AId: TString): ICodigoAuxiliar;
    function GetAll(const AProdutoId: Variant; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TCodigoAuxiliarListRec; overload;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TCodigoAuxiliarListRec; overload;
    function Filter(const AProdutoId: Variant; const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TCodigoAuxiliarListRec;
    function Insert(const AIdProduto: Variant; ARequest: IBatchRequest): IBatchResponse;
    function Update(const AIdProduto, AId: TString; const AModel: IModel): TServiceCommandResult;
    function Delete(const AIdProduto, AId: Variant): Boolean; reintroduce;
    function GetChanges(const ALojaId: TString; ADataAlteracao: TDateTime): TCodigoAuxiliarListChanges;
  end;

implementation

uses
  SDK.Service.Carga;

{ TCodigoAuxiliarService }

constructor TCodigoAuxiliarService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/produto/produtos/%s/codigos-auxiliares', AClient);
  FSecondaryPath := '/api/v1/produto/codigos-auxiliares'
end;

function TCodigoAuxiliarService.Get(const AId: TString): ICodigoAuxiliar;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  Document: IXMLDocument;
begin
  Result := nil;
  Response := FClient.Get(Concat(FPath, '/', AId), nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//CodigoAuxiliar');
  if Length(Nodes) > 0 then
    TXMLHelper.Deserialize(Nodes[0], TCodigoAuxiliar, FDeserializers).QueryInterface(ICodigoAuxiliar, Result);
end;

function TCodigoAuxiliarService.GetAll(AStart, ACount: Integer;
  const ASortParams: TStringArray): TCodigoAuxiliarListRec;
begin
  Result := Filter(null, EmptyStr, AStart, ACount, ASortParams);
end;

function TCodigoAuxiliarService.GetChanges(const ALojaId: TString;
  ADataAlteracao: TDateTime): TCodigoAuxiliarListChanges;
var
  Nodes: TCustomXMLNodeArray;
  Document: IXMLDocument;
  NodeIdx: Integer;
  CodigoAuxiliar: ICodigoAuxiliar;
  CodigoAuxiliarListChanges: TCodigoAuxiliarListChanges;
begin
  Document := TCargaService.GetChanges(ALojaId, ADataAlteracao, 'CODIGO_AUXILIAR', FClient);
  Nodes := TXMLHelper.XPathSelect(Document, '//Carga/alterados/*');
  CodigoAuxiliarListChanges := TCodigoAuxiliarListChanges.Create;

  Nodes := TXMLHelper.XPathSelect(Document, '//Carga/*');
  if Trim(Nodes[0].NodeValue) <> '' then
    CodigoAuxiliarListChanges.DataAlteracao := ISO8601ToDateTime(Nodes[0].NodeValue);

  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    if Nodes[NodeIdx].NodeName = 'codigo_auxiliares' then
    begin
      TXMLHelper.Deserialize(Nodes[NodeIdx], TCodigoAuxiliar, FDeserializers).QueryInterface(ICodigoAuxiliar, CodigoAuxiliar);
      CodigoAuxiliarListChanges.ListAlterados.Add(CodigoAuxiliar);
    end;
  end;

  Nodes := TXMLHelper.XPathSelect(Document, '//Carga/removidos/*');
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    if Nodes[NodeIdx].NodeName = 'codigo_auxiliares' then
    begin
      CodigoAuxiliarListChanges.ListIdRemovidos.Add(Nodes[NodeIdx].NodeValue);
    end;
  end;

  Result := CodigoAuxiliarListChanges;
end;

function TCodigoAuxiliarService.GetAll(const AProdutoId: Variant; AStart, ACount: Integer; const ASortParams: TStringArray): TCodigoAuxiliarListRec;
begin
  Result := Filter(AProdutoId, EmptyStr, AStart, ACount, ASortParams);
end;

function TCodigoAuxiliarService.Insert(const AIdProduto: Variant; ARequest: IBatchRequest): IBatchResponse;
begin
  Result := inherited Insert(ARequest, PathWithDependencies([VarToStr(AIdProduto)]));
end;

function TCodigoAuxiliarService.Delete(const AIdProduto, AId: Variant): Boolean;
begin
  Result := inherited DeleteWithPath(VarToStr(AId), PathWithDependencies([VarToStr(AIdProduto)]));
end;

function TCodigoAuxiliarService.Update(const AIdProduto, AId: TString;
  const AModel: IModel): TServiceCommandResult;
begin
  Result := inherited Update(AId, AModel, PathWithDependencies([AIdProduto]));
end;

function TCodigoAuxiliarService.Filter(const AProdutoId: Variant; const AQuery: TString; AStart: Integer;
  ACount: Integer; const ASortParams: TStringArray): TCodigoAuxiliarListRec;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  CodigoAuxiliarList, PaginationList: TCodigoAuxiliarList;
  CodigoAuxiliar: ICodigoAuxiliar;
  URL: TString;
  ResultNodes: TCustomXMLNodeArray;
  Start, Count, Total, TotalPack, Position: Integer;
begin
  Start := AStart;
  Count := ACount;
  if AProdutoId = null then
    URL := Concat(FSecondaryPath, '?', ToParams(AQuery, Start, Count, ASortParams))
  else
    URL := Concat(PathWithDependencies([VarToStr(AProdutoId)]), '?', ToParams(AQuery, Start, Count, ASortParams));

  Response := FClient.Get(URL, nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//ResultList/items/*');
  CodigoAuxiliarList := TCodigoAuxiliarList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TCodigoAuxiliar, FDeserializers).QueryInterface(ICodigoAuxiliar, CodigoAuxiliar);
    CodigoAuxiliarList.Add(CodigoAuxiliar);
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
      if AProdutoId = null then
        PaginationList := Filter(null, AQuery, Start, TotalPack - Position, ASortParams)
      else
        PaginationList := Filter(AProdutoId, AQuery, Start, TotalPack - Position, ASortParams);
      for CodigoAuxiliar in PaginationList do
        CodigoAuxiliarList.Add(CodigoAuxiliar);
    end;
  end;
  Result := TCodigoAuxiliarListRec.Create(CodigoAuxiliarList);
end;

end.

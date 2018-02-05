unit SDK.Service.Grupo;

interface

uses
  SDK.Types, SDK.Model.Grupo, SDK.Service, SDK.Exceptions, SDK.XML, XMLIntf, SysUtils, Math;

type

  TGrupoService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AIdSecao, AId: TString): IGrupo;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TGrupoListRec;
    function Filter(const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TGrupoListRec;
    function Insert(const AIdSecao: TString; const AModel: IModel): TServiceCommandResult;
    function Update(const AIdSecao, AId: TString; const AModel: IModel): TServiceCommandResult;
    function Delete(const AIdSecao, AId: TString): Boolean; reintroduce;
  end;

implementation

{ TGrupoService }

constructor TGrupoService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/produto/secoes/%s/grupos', AClient);
end;

function TGrupoService.Get(const AIdSecao, AId: TString): IGrupo;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  Document: IXMLDocument;
begin
  Result := nil;
  Response := FClient.Get(Concat(PathWithDependencies([AIdSecao]), '/', AId), nil, nil);
  case Response.Status of
    200:
    begin
      Document := Response.AsXML;
      Nodes := TXMLHelper.XPathSelect(Document, '//Grupo');
      if Length(Nodes) > 0 then
        TXMLHelper.Deserialize(Nodes[0], TGrupo, FDeserializers).QueryInterface(IGrupo, Result);
    end;
    404:
      raise SDKNotFoundException.Create(Concat('Grupo ', AId, ' com seção ', AIdSecao, ' não encontrado'));
    else
      raise SDKUnknownException.Create(Format('Erro %d - %s', [Response.Status, Response.Content]));
  end;
end;

function TGrupoService.GetAll(AStart, ACount: Integer; const ASortParams: TStringArray): TGrupoListRec;
begin
  Result := Filter(EmptyStr, AStart, ACount, ASortParams);
end;

function TGrupoService.Insert(const AIdSecao: TString; const AModel: IModel): TServiceCommandResult;
begin
  Result := inherited Insert(AModel, PathWithDependencies([AIdSecao]));
end;

function TGrupoService.Update(const AIdSecao, AId: TString; const AModel: IModel): TServiceCommandResult;
begin
  Result := inherited Update(AId, AModel, PathWithDependencies([AIdSecao]));
end;

function TGrupoService.Delete(const AIdSecao, AId: TString): Boolean;
begin
  Result := inherited DeleteWithPath(AId, PathWithDependencies([AIdSecao]));
end;

function TGrupoService.Filter(const AQuery: TString; AStart: Integer;
  ACount: Integer; const ASortParams: TStringArray): TGrupoListRec;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  GrupoList, PaginationList: TGrupoList;
  Grupo: IGrupo;
  URL: TString;
  ResultNodes: TCustomXMLNodeArray;
  Start, Count, Total, TotalPack, Position: Integer;
begin
  URL := Concat(FPath, '?', ToParams(AQuery, AStart, ACount, ASortParams));
  Response := FClient.Get(URL, nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//ResultList/items/*');
  GrupoList := TGrupoList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TGrupo, FDeserializers).QueryInterface(IGrupo, Grupo);
    GrupoList.Add(Grupo);
  end;

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
      PaginationList := Filter(AQuery, Start, TotalPack - Position, ASortParams);
      for Grupo in PaginationList do
        GrupoList.Add(Grupo);
    end;
  end;

  Result := TGrupoListRec.Create(GrupoList);
end;

end.

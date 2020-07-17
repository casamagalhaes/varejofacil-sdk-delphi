﻿unit SDK.Service.Subgrupo;

interface

uses
  SDK.Types, SDK.Model.Subgrupo, SDK.Service, SDK.Exceptions, SDK.XML, XMLIntf, SysUtils, Math, Variants;

type

  TSubgrupoService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AIdSecao, AIdGrupo, AId: TString): ISubgrupo;
    function GetAll(const AIdSecao, AIdGrupo: Variant; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TSubgrupoListRec;
    function Filter(const AIdSecao, AIdGrupo: Variant; const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = nil): TSubgrupoListRec;
    function Insert(const AIdSecao, AIdGrupo: TString; const AModel: IModel): TServiceCommandResult;
    function Update(const AIdSecao, AIdGrupo, AId: TString; const AModel: IModel): TServiceCommandResult;
    function Delete(const AIdSecao, AIdGrupo, AId: TString): Boolean; reintroduce;
  end;

implementation

{ TSubgrupoService }

constructor TSubgrupoService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/produto/secoes/%s/grupos/%s/subgrupos', AClient);
end;

function TSubgrupoService.Get(const AIdSecao, AIdGrupo, AId: TString): ISubgrupo;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  Document: IXMLDocument;
begin
  Result := nil;
  Response := FClient.Get(Concat(PathWithDependencies([AIdSecao, AIdGrupo]), '/', AId), nil, nil);
  case Response.Status of
    200:
    begin
      Document := Response.AsXML;
      Nodes := TXMLHelper.XPathSelect(Document, '//SubGrupo');
      if Length(Nodes) > 0 then
        TXMLHelper.Deserialize(Nodes[0], TSubgrupo, FDeserializers).QueryInterface(ISubgrupo, Result);
     end;
    404:
      raise SDKNotFoundException.Create(Concat('Subgrupo ', AId, ' com grupo ', AIdGrupo, ' e seção ', AIdSecao, ' não encontrado'));
    else
      raise SDKUnknownException.Create(Format('Erro %d - %s', [Response.Status, Response.Content]));
  end;
end;

function TSubgrupoService.GetAll(const AIdSecao, AIdGrupo: Variant; AStart, ACount: Integer; const ASortParams: TStringArray): TSubgrupoListRec;
begin
  Result := Filter(AIdSecao, AIdGrupo, EmptyStr, AStart, ACount, ASortParams);
end;

function TSubgrupoService.Insert(const AIdSecao, AIdGrupo: TString; const AModel: IModel): TServiceCommandResult;
begin
  Result := inherited Insert(AModel, PathWithDependencies([AIdSecao, AIdGrupo]));
end;

function TSubgrupoService.Update(const AIdSecao, AIdGrupo, AId: TString; const AModel: IModel): TServiceCommandResult;
begin
  Result := inherited Update(AId, AModel, PathWithDependencies([AIdSecao, AIdGrupo]));
end;

function TSubgrupoService.Delete(const AIdSecao, AIdGrupo, AId: TString): Boolean;
begin
  Result := inherited DeleteWithPath(AId, PathWithDependencies([AIdSecao, AIdGrupo]));
end;

function TSubgrupoService.Filter(const AIdSecao, AIdGrupo: Variant; const AQuery: TString; AStart: Integer;
  ACount: Integer; const ASortParams: TStringArray): TSubgrupoListRec;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  SubgrupoList, PaginationList: TSubgrupoList;
  Subgrupo: ISubgrupo;
  URL: TString;
  ResultNodes: TCustomXMLNodeArray;
  Start, Count, Total, TotalPack, Position: Integer;
begin
  URL := Concat(PathWithDependencies([VarToStr(AIdSecao), VarToStr(AIdGrupo)]), '?', ToParams(AQuery, AStart, ACount, ASortParams));
  Response := FClient.Get(URL, nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//ResultList/items/*');
  SubgrupoList := TSubgrupoList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TSubgrupo, FDeserializers).QueryInterface(ISubgrupo, Subgrupo);
    SubgrupoList.Add(Subgrupo);
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

    if Position < Min(TotalPack, Total) then
    begin
      PaginationList := Filter(AIdSecao, AIdGrupo, AQuery, Position, TotalPack - Position, ASortParams);
      for SubGrupo in PaginationList do
        SubGrupoList.Add(SubGrupo);
    end;
  end;

  Result := TSubgrupoListRec.Create(SubgrupoList);
end;

end.

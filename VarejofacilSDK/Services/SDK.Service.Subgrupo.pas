unit SDK.Service.Subgrupo;

interface

uses
  SDK.Types, SDK.Model.Subgrupo, SDK.Service, SDK.XML, XMLIntf, SysUtils;

type

  TSubgrupoService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Get(const AIdSecao, AIdGrupo, AId: TString): ISubgrupo;
    function GetAll(AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = []): TSubgrupoListRec;
    function Filter(const AQuery: TString; AStart: Integer = 0; ACount: Integer = 0;
      const ASortParams: TStringArray = []): TSubgrupoListRec;
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
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//SubGrupo');
  if Length(Nodes) > 0 then
    TXMLHelper.Deserialize(Nodes[0], TSubgrupo, FDeserializers).QueryInterface(ISubgrupo, Result);
end;

function TSubgrupoService.GetAll(AStart, ACount: Integer; const ASortParams: TStringArray): TSubgrupoListRec;
begin
  Result := Filter(EmptyStr, AStart, ACount, ASortParams);
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

function TSubgrupoService.Filter(const AQuery: TString; AStart: Integer;
  ACount: Integer; const ASortParams: TStringArray): TSubgrupoListRec;
var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  SubgrupoList: ISubgrupoList;
  Subgrupo: ISubgrupo;
  URL: TString;
begin
  URL := Concat(FPath, '?', ToParams(AQuery, AStart, ACount, ASortParams));
  Response := FClient.Get(URL, nil, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//ResultList/items/*');
  SubgrupoList := TSubgrupoList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    TXMLHelper.Deserialize(Nodes[NodeIdx], TSubgrupo, FDeserializers).QueryInterface(ISubgrupo, Subgrupo);
    SubgrupoList.Add(Subgrupo);
  end;
  Result := TSubgrupoListRec.Create(SubgrupoList);
end;

end.

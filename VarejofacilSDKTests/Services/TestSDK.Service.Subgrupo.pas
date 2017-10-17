unit TestSDK.Service.Subgrupo;

interface

uses
  TestFramework, SysUtils, SDK.Service, SDK.XML, SDK.Service.Subgrupo,
  SDK.Model.Subgrupo, XMLIntf, SDK.Types, SDK.TestCase, SDK.Model.Secao, SDK.Service.Secao, SDK.Model.Grupo,
  SDK.Service.Grupo;

type

  TTestSubgrupoService = class(TSDKTestCase)
  strict private
    FSubgrupoService: TSubgrupoService;
    FSecaoService: TSecaoService;
    FGrupoService: TGrupoService;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestBasicOperations;
  end;

implementation

procedure TTestSubgrupoService.SetUp;
begin
  FSubgrupoService := TSubgrupoService.Create(GetClient);
  FGrupoService := TGrupoService.Create(GetClient);
  FSecaoService := TSecaoService.Create(GetClient);
end;

procedure TTestSubgrupoService.TearDown;
begin
  FreeAndNil(FSubgrupoService);
  FreeAndNil(FGrupoService);
  FreeAndNil(FSecaoService);
end;

procedure TTestSubgrupoService.TestBasicOperations;
var
  Subgrupo, SubgrupoInserted, SubgrupoUpdated, SubgrupoDeleted: ISubgrupo;
  Secao: ISecao;
  Grupo: IGrupo;
  Id, IdSecao, IdGrupo: Variant;
begin
  Secao := TSecao.Create;
  Grupo := TGrupo.Create;
  Subgrupo := TSubgrupo.Create;

  FillWithRandomValues(Secao);
  FillWithRandomValues(Grupo);
  FillWithRandomValues(Subgrupo);

  IdSecao := Secao.Id;
  IdGrupo := Grupo.Id;
  Id := Subgrupo.Id;

  Grupo.SecaoId := IdSecao;

  FSecaoService.Insert(Secao);
  FGrupoService.Insert(IdSecao, Grupo);
  try
    //Insert
    Assert(FSubgrupoService.Insert(IdSecao, IdGrupo, Subgrupo) <> EmptyStr, 'Erro no insert do Subgrupo');

    //Get
    SubgrupoInserted := FSubgrupoService.Get(IdSecao, IdGrupo, Id);
    Assert(Assigned(SubgrupoInserted), 'Erro no get do Subgrupo');
    AssertAllPropertiesAreEqual(Subgrupo, SubgrupoInserted, 'Subgrupo não inserido corretamente.');
    FillWithRandomValues(SubgrupoInserted);
    SubgrupoInserted.Id := Id;

    //Update
    Assert(FSubgrupoService.Update(IdSecao, IdGrupo, Id, SubgrupoInserted), 'Erro no update do Subgrupo.');
    SubgrupoUpdated := FSubgrupoService.Get(IdSecao, IdGrupo, Id);
    AssertAllPropertiesAreEqual(SubgrupoInserted, SubgrupoUpdated, 'Subgrupo não alterado corretamente.');

    //Delete
    Assert(FSubgrupoService.Delete(IdSecao, IdGrupo, Id), 'Erro no delete do Subgrupo');
    SubgrupoDeleted := FSubgrupoService.Get(IdSecao, IdGrupo, Id);
    Assert(not Assigned(SubgrupoDeleted), 'Subgrupo não apagado corretamente.');
  finally
    FGrupoService.Delete(IdSecao, IdGrupo);
    FSecaoService.Delete(IdSecao);
  end;
end;

initialization
  RegisterTest(TTestSubgrupoService.Suite);

end.


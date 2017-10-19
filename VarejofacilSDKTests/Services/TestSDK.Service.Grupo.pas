unit TestSDK.Service.Grupo;

interface

uses
  TestFramework, SysUtils, SDK.Service, SDK.XML, SDK.Service.Grupo,
  SDK.Model.Grupo, XMLIntf, SDK.Types, SDK.TestCase, SDK.Model.Secao, SDK.Service.Secao;

type

  TTestGrupoService = class(TSDKTestCase)
  strict private
    FGrupoService: TGrupoService;
    FSecaoService: TSecaoService;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestBasicOperations;
  end;

implementation

procedure TTestGrupoService.SetUp;
begin
  FGrupoService := TGrupoService.Create(GetClient);
  FSecaoService := TSecaoService.Create(GetClient);
end;

procedure TTestGrupoService.TearDown;
begin
  FreeAndNil(FGrupoService);
  FreeAndNil(FSecaoService);
end;

procedure TTestGrupoService.TestBasicOperations;
var
  Grupo, GrupoInserted, GrupoUpdated, GrupoDeleted: IGrupo;
  Secao: ISecao;
  Id, IdSecao: Variant;
begin
  Grupo := TGrupo.Create;
  Secao := TSecao.Create;
  FillWithRandomValues(Grupo);
  FillWithRandomValues(Secao);
  Id := Grupo.Id;
  IdSecao := Secao.Id;
  Grupo.SecaoId := IdSecao;

  FSecaoService.Insert(Secao);
  try
    //Insert
    Assert(FGrupoService.Insert(IdSecao, Grupo).Successful, 'Erro no insert do Grupo');

    //Get
    GrupoInserted := FGrupoService.Get(IdSecao, Id);
    Assert(Assigned(GrupoInserted), 'Erro no get do Grupo');
    AssertAllPropertiesAreEqual(Grupo, GrupoInserted, 'Grupo não inserido corretamente.');
    FillWithRandomValues(GrupoInserted);
    GrupoInserted.SecaoId := IdSecao;
    GrupoInserted.Id := Id;

    //Update
    Assert(FGrupoService.Update(IdSecao, Id, GrupoInserted), 'Erro no update do Grupo.');
    GrupoUpdated := FGrupoService.Get(IdSecao, Id);
    AssertAllPropertiesAreEqual(GrupoInserted, GrupoUpdated, 'Grupo não alterado corretamente.');

    //Delete
    Assert(FGrupoService.Delete(IdSecao, Id), 'Erro no delete do Grupo');
    GrupoDeleted := FGrupoService.Get(IdSecao, Id);
    Assert(not Assigned(GrupoDeleted), 'Grupo não apagado corretamente.');
  finally
    FSecaoService.Delete(IdSecao);
  end;
end;

initialization
  RegisterTest(TTestGrupoService.Suite);

end.


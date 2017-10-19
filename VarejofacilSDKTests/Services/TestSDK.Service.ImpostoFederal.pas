unit TestSDK.Service.ImpostoFederal;

interface

uses
  TestFramework, SysUtils, SDK.Service, SDK.XML, SDK.Service.ImpostoFederal,
  SDK.Model.ImpostoFederal, XMLIntf, SDK.Types, SDK.TestCase, SDK.Enums;

type

  TTestImpostoFederalService = class(TSDKTestCase)
  strict private
    FImpostoFederalService: TImpostoFederalService;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestBasicOperations;
  end;

implementation

procedure TTestImpostoFederalService.SetUp;
begin
  FImpostoFederalService := TImpostoFederalService.Create(GetClient);
end;

procedure TTestImpostoFederalService.TearDown;
begin
  FreeAndNil(FImpostoFederalService);
end;

procedure TTestImpostoFederalService.TestBasicOperations;

  procedure SetImpostoFederal(Id: Variant; var ImpostoFederal: IImpostoFederal);
  begin
    ImpostoFederal.Id := Id;
    ImpostoFederal.Descricao := 'Teste';
    ImpostoFederal.Retencao := 100;
    ImpostoFederal.Observacao := 'Obs';
    ImpostoFederal.TipoIncidencia := tiSAIDA;
    ImpostoFederal.TipoImposto := tiCOFINS;
    ImpostoFederal.CstEntrada := 99;
    ImpostoFederal.CstSaida := 7;
    ImpostoFederal.AliquotaEntrada := 99.99;
    ImpostoFederal.AliquotaSaida := 88.88;
    ImpostoFederal.CstEntradaPresumido := 99;
  end;

var
  ImpostoFederal, ImpostoFederalInserted, ImpostoFederalUpdated, ImpostoFederalDeleted: IImpostoFederal;
  Id: Variant;
begin
  ImpostoFederal := TImpostoFederal.Create;
  Id := 99;
  SetImpostoFederal(Id, ImpostoFederal);
  //Insert
  Assert(FImpostoFederalService.Insert(ImpostoFederal).Successful, 'Erro no insert do ImpostoFederal');

  //Get
  ImpostoFederalInserted := FImpostoFederalService.Get(Id);
  Assert(Assigned(ImpostoFederalInserted), 'Erro no get do ImpostoFederal');
  AssertAllPropertiesAreEqual(ImpostoFederal, ImpostoFederalInserted, 'ImpostoFederal não inserido corretamente.');
  SetImpostoFederal(Id, ImpostoFederal);
  ImpostoFederalInserted.Id := Id;

  //Update
  Assert(FImpostoFederalService.Update(Id, ImpostoFederalInserted), 'Erro no update do ImpostoFederal.');
  ImpostoFederalUpdated := FImpostoFederalService.Get(Id);
  AssertAllPropertiesAreEqual(ImpostoFederalInserted, ImpostoFederalUpdated, 'ImpostoFederal não alterado corretamente.');

  //Delete
  Assert(FImpostoFederalService.Delete(Id), 'Erro no delete do ImpostoFederal');
  ImpostoFederalDeleted := FImpostoFederalService.Get(Id);
  Assert(not Assigned(ImpostoFederalDeleted), 'ImpostoFederal não apagado corretamente.');
end;

initialization
  RegisterTest(TTestImpostoFederalService.Suite);

end.


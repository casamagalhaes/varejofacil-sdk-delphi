unit TestSDK.Service.NCM;

interface

uses
  TestFramework, SysUtils, SDK.Service, SDK.XML, SDK.Service.NCM,
  SDK.Model.NCM, XMLIntf, SDK.Types, SDK.TestCase;

type

  TTestNCMService = class(TSDKTestCase)
  strict private
    FNCMService: TNCMService;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestBasicOperations;
  end;

implementation

procedure TTestNCMService.SetUp;
begin
  FNCMService := TNCMService.Create(GetClient);
end;

procedure TTestNCMService.TearDown;
begin
  FreeAndNil(FNCMService);
end;

procedure TTestNCMService.TestBasicOperations;
var
  NCM, NCMInserted, NCMUpdated, NCMDeleted: INCM;
  Id: Variant;
begin
  Id := '1064100';


  //Insert
  //Assert(FNCMService.Insert(NCM) <> EmptyStr, 'Erro no insert do NCM');

  //Get
  NCMInserted := FNCMService.Get(Id);
  Assert(Assigned(NCMInserted), 'Erro no get do NCM');
  //AssertAllPropertiesAreEqual(NCM, NCMInserted, 'NCM não inserido corretamente.');
  //FillWithRandomValues(NCMInserted);
  //NCMInserted.Id := Id;

  //Update
  //Assert(FNCMService.Update(Id, NCMInserted), 'Erro no update do NCM.');
  ////NCMUpdated := FNCMService.Get(Id);
  //AssertAllPropertiesAreEqual(NCMInserted, NCMUpdated, 'NCM não alterado corretamente.');

  //Delete
  //Assert(FNCMService.Delete(Id), 'Erro no delete do NCM');
  //NCMDeleted := FNCMService.Get(Id);
  //Assert(not Assigned(NCMDeleted), 'NCM não apagado corretamente.');
end;

initialization
  RegisterTest(TTestNCMService.Suite);

end.


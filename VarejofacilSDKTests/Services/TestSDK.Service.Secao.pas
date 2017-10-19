unit TestSDK.Service.Secao;

interface

uses
  TestFramework, SysUtils, SDK.Service, SDK.XML, SDK.Service.Secao,
  SDK.Model.Secao, XMLIntf, SDK.Types, SDK.TestCase;

type

  TTestSecaoService = class(TSDKTestCase)
  strict private
    FSecaoService: TSecaoService;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestBasicOperations;
  end;

implementation

procedure TTestSecaoService.SetUp;
begin
  FSecaoService := TSecaoService.Create(GetClient);
end;

procedure TTestSecaoService.TearDown;
begin
  FreeAndNil(FSecaoService);
end;

procedure TTestSecaoService.TestBasicOperations;
var
  Secao, SecaoInserted, SecaoUpdated, SecaoDeleted: ISecao;
  Id: Variant;
begin
  Secao := TSecao.Create;
  FillWithRandomValues(Secao);
  Id := Secao.Id;

  //Insert
  Assert(FSecaoService.Insert(Secao).Successful, 'Erro no insert do Secao');

  //Get
  SecaoInserted := FSecaoService.Get(Id);
  Assert(Assigned(SecaoInserted), 'Erro no get do Secao');
  AssertAllPropertiesAreEqual(Secao, SecaoInserted, 'Secao não inserido corretamente.');
  FillWithRandomValues(SecaoInserted);
  SecaoInserted.Id := Id;

  //Update
  Assert(FSecaoService.Update(Id, SecaoInserted), 'Erro no update do Secao.');
  SecaoUpdated := FSecaoService.Get(Id);
  AssertAllPropertiesAreEqual(SecaoInserted, SecaoUpdated, 'Secao não alterado corretamente.');

  //Delete
  Assert(FSecaoService.Delete(Id), 'Erro no delete do Secao');
  SecaoDeleted := FSecaoService.Get(Id);
  Assert(not Assigned(SecaoDeleted), 'Secao não apagado corretamente.');
end;

initialization
  RegisterTest(TTestSecaoService.Suite);

end.


unit TestSDK.Service.%MODEL_NAME%;

interface

uses
  TestFramework, SysUtils, SDK.Service, SDK.XML, SDK.Service.%MODEL_NAME%,
  SDK.Model.%MODEL_NAME%, XMLIntf, SDK.Types, SDK.TestCase;

type

  TTest%MODEL_NAME%Service = class(TSDKTestCase)
  strict private
    F%MODEL_NAME%Service: T%MODEL_NAME%Service;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestBasicOperations;
  end;

implementation

procedure TTest%MODEL_NAME%Service.SetUp;
begin
  F%MODEL_NAME%Service := T%MODEL_NAME%Service.Create(GetClient);
end;

procedure TTest%MODEL_NAME%Service.TearDown;
begin
  FreeAndNil(F%MODEL_NAME%Service);
end;

procedure TTest%MODEL_NAME%Service.TestBasicOperations;
var
  %MODEL_NAME%, %MODEL_NAME%Inserted, %MODEL_NAME%Updated, %MODEL_NAME%Deleted: I%MODEL_NAME%;
  Id: Variant;
begin
  %MODEL_NAME% := T%MODEL_NAME%.Create;
  FillWithRandomValues(%MODEL_NAME%);
  Id := %MODEL_NAME%.Id;

  //Insert
  Assert(F%MODEL_NAME%Service.Insert(%MODEL_NAME%) <> EmptyStr, 'Erro no insert do %MODEL_NAME%');

  //Get
  %MODEL_NAME%Inserted := F%MODEL_NAME%Service.Get(Id);
  Assert(Assigned(%MODEL_NAME%Inserted), 'Erro no get do %MODEL_NAME%');
  AssertAllPropertiesAreEqual(%MODEL_NAME%, %MODEL_NAME%Inserted, '%MODEL_NAME% não inserido corretamente.');
  FillWithRandomValues(%MODEL_NAME%Inserted);
  %MODEL_NAME%Inserted.Id := Id;

  //Update
  Assert(F%MODEL_NAME%Service.Update(Id, %MODEL_NAME%Inserted), 'Erro no update do %MODEL_NAME%.');
  %MODEL_NAME%Updated := F%MODEL_NAME%Service.Get(Id);
  AssertAllPropertiesAreEqual(%MODEL_NAME%Inserted, %MODEL_NAME%Updated, '%MODEL_NAME% não alterado corretamente.');

  //Delete
  Assert(F%MODEL_NAME%Service.Delete(Id), 'Erro no delete do %MODEL_NAME%');
  %MODEL_NAME%Deleted := F%MODEL_NAME%Service.Get(Id);
  Assert(not Assigned(%MODEL_NAME%Deleted), '%MODEL_NAME% não apagado corretamente.');
end;

initialization
  RegisterTest(TTest%MODEL_NAME%Service.Suite);

end.


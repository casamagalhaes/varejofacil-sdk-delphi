program VarejofacilSDKTestsDXE7;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}
{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

uses
  SysUtils,
  DUnitTestRunner,
  SDK.TestCase in 'SDK.TestCase.pas',
  SDK.TestConfig in 'SDK.TestConfig.pas',
  SDK.TestValueGenerator in 'SDK.TestValueGenerator.pas',
  TestSDK.Service.Secao in 'Services\TestSDK.Service.Secao.pas',
  TestSDK.Service.Grupo in 'Services\TestSDK.Service.Grupo.pas',
  TestSDK.Service.Subgrupo in 'Services\TestSDK.Service.Subgrupo.pas',
  TestSDK.Service.Produto in 'Services\TestSDK.Service.Produto.pas',
  TestSDK.Service.Genero in 'Services\TestSDK.Service.Genero.pas',
  TestSDK.Service.ImpostoFederal in 'Services\TestSDK.Service.ImpostoFederal.pas',
  TestSDK.Service.NCM in 'Services\TestSDK.Service.NCM.pas',
  TestSDK.Service.Fornecedor in 'Services\TestSDK.Service.Fornecedor.pas';

{$R *.RES}

begin
  FindCmdLineSwitch('varejofacil', TestConfig.VarejofacilURL);
  FindCmdLineSwitch('username', TestConfig.Username);
  FindCmdLineSwitch('password', TestConfig.Password);
  DUnitTestRunner.RunRegisteredTests;
end.

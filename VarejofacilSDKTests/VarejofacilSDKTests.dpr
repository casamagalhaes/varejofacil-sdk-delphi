program VarejofacilSDKTests;
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

uses
  SysUtils,
  DUnitTestRunner,
  SDK.TestCase in 'SDK.TestCase.pas',
  SDK.TestConfig in 'SDK.TestConfig.pas',
  SDK.TestValueGenerator in 'SDK.TestValueGenerator.pas',
  TestSDK.Service.Secao in 'Services\TestSDK.Service.Secao.pas';

{$R *.RES}

begin
  FindCmdLineSwitch('varejofacil', TestConfig.VarejofacilURL);
  FindCmdLineSwitch('username', TestConfig.Username);
  FindCmdLineSwitch('password', TestConfig.Password);
  DUnitTestRunner.RunRegisteredTests;
end.

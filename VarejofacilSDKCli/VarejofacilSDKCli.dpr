program VarejofacilSDKCli;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  SDK.Types,
  SDK.Enums,
  SDK.Client,
  SDK.SortParams,
  SDK.XML,
  Variants;

begin
  ReportMemoryLeaksOnShutdown := True;
  try

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  ReadLn;
end.
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

var
  I, X: NullableInteger;
  Z: Variant;

begin
  ReportMemoryLeaksOnShutdown := True;
  try
    Write('Tipo está nulo? ');
    WriteLn(I.IsNull);
    X := 5;
    Z := X;
    WriteLn(Z);
    WriteLn('Alterando para 5');
    I := X * 5;
    Write('Tipo agora está nulo?');
    Write(I.IsNull);
    Write(I.Value);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  ReadLn;
end.
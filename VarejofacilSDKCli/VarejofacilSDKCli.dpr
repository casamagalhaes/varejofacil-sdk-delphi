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
  SDK.Model.NCM,
  SDK.Service.NCM,
  SDK.Model.Secao,
  SDK.Service.Secao,
  Variants;

type

  TMockClass = class
  var
    FClient: IClient;
    FServiceA: TNCMService;
    FServiceB: TSecaoService;
  public
    constructor Create;
    destructor Destroy;
    procedure DoStuff;
  end;

{ TMockClass }

constructor TMockClass.Create;
begin
  //
end;

destructor TMockClass.Destroy;
begin
  //
end;

procedure TMockClass.DoStuff;
begin
  //
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  try

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  ReadLn;
end.
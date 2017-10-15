program VarejofacilSDKCli;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  SDK.Types,
  SDK.Service.Abastecimento,
  SDK.Model.Abastecimento,
  SDK.Enums,
  SDK.Client,
  SDK.SortParams,
  SDK.XML,
  Variants;

var
  Abastecimento: IAbastecimento;
  AbastecimentoService: TAbastecimentoService;
  Client: IClient;

begin
  ReportMemoryLeaksOnShutdown := True;
  Client := TClient.Create('http://172.16.13.109:8080');
  try
    AbastecimentoService := TAbastecimentoService.Create(Client);
    try
      Abastecimento := TAbastecimento.Create;
      Abastecimento.Id := '001';
      AbastecimentoService.Get(Abastecimento.Id);
      Abastecimento.CodigoBomba := 'A';
      Abastecimento.PosicaoAbastecimento := '1';
      Abastecimento.QuantidadeLitrosAbastecida := 1;
      Abastecimento.ValorUnitarioCombustivel := 2.5;
      Abastecimento.ValorTotalAbastecido := 2.1;
      Abastecimento.DataAbastecimento := Now;
      Abastecimento.HoraAbastecimento := 2;
      Abastecimento.StatusSituacaoAbastecimento := False;
      Abastecimento.SequencialTransacao := '1';
      Abastecimento.NumeroCaixa := '002';
      Abastecimento.CombustivelId := '1';
      AbastecimentoService.Insert(Abastecimento);
    finally
      AbastecimentoService.Free;
    end;
    Abastecimento := nil;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  ReadLn;
end.
program VarejofacilSDKCliDXE7;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  SDK.Types,
  System.DateUtils,
  SDK.Enums,
  SDK.Client,
  SDK.SortParams,
  SDK.XML,
  SDK.Model.NCM,
  SDK.Service.NCM,
  SDK.Service,
  SDK.Model.Secao,
  SDK.Model.Produto,
  SDK.Model.Preco,
  SDK.Service.Secao,
  SDK.Service.Produto,
  SDK.Service.Preco,
  SDK.Service.ImpostoFederal,
  SDK.Model.ItemImpostoFederal,
  SDK.Model.EstoqueDoProduto,
  SDK.Model.ImpostoFederal,
  SDK.Model.ImpostoFederalGeral,
  SDK.Model.Apuracao,
  SDK.Service.Apuracao,
  ActiveX,
  Variants;

var
  Client: IClient;
  ProdutoService: TProdutoService;
  ApuracaoService: TApuracaoService;
  ImpostosFederaisService: TImpostoFederalService;
  Produtos: TProdutoList;
  Produto, ProdutoInserido: IProduto;
  Res: TServiceCommandResult;
  Impostos: TItemImpostoFederalList;
  ItemImpostoFederal: TItemImpostoFederal;
  Precos: TPrecoList;
  PrecoService: TPrecoService;
  Preco: IPreco;
  Estoques: TEstoqueDoProdutoList;
  EstoqueItem: TEstoqueDoProduto;
  PISs: TImpostoFederalList;
  ApuracaoList: TApuracaoList;
  Apuracao: IApuracao;
  PIS: IImpostoFederal;
  IG: IImpostoFederalGeral;
  TIG: TImpostoFederalGeral;
  Query: string;
  I: Integer;

begin
  CoInitialize(nil);
  TRY
    ReportMemoryLeaksOnShutdown := False;
    try
      Client := TClient.Create('https://mercado.varejofacil.com', '57a3cce4dece0974e96a460fb88a3390');
      ApuracaoService := TApuracaoService.Create(Client);
      ApuracaoList := ApuracaoService.Get(TImpostoApuracao.iapICMS, TOperacaoApuracao.tapCREDITO, ['1'], StartOfTheYear(Now), EndOfTheMonth(Now));
      for I := 0 to ApuracaoList.Count - 1  do
      begin
        Apuracao := ApuracaoList[I];
        WriteLn(Format('codigoLoja: %d, cfop: %d, cst: %s, aliquota: %s, baseCalculo: %s, valor: %s', [
          Apuracao.CodigoLoja,
          Apuracao.CFOP,
          Apuracao.CST,
          FloatToStr(Apuracao.Aliquota),
          FloatToStr(Apuracao.BaseDeCalculo),
          FloatToStr(Apuracao.Valor)
        ]));
      end;
    except
      on E: Exception do
        Writeln(E.ClassName, ': ', E.Message);
    end;
    ReadLn;
  FINALLY
    CoUninitialize;
  END;
end.
program VarejofacilSDKCliDXE7;

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
  ActiveX,
  Variants;

var
  Client: IClient;
  ProdutoService: TProdutoService;
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
  PIS: IImpostoFederal;
  IG: IImpostoFederalGeral;
  TIG: TImpostoFederalGeral;
  Query: string;


begin
  CoInitialize(nil);
  TRY
    ReportMemoryLeaksOnShutdown := False;
    try
      Client := TClient.Create('http://172.16.13.148:8080', 'dc4aec617b40a62366313f5b35fc8494');
      ImpostosFederaisService := TImpostoFederalService.Create(Client);
      Query := Format('tipoImposto==%s;impostoFederalGeral.cstEntrada==%d;impostoFederalGeral.cstSaida==%s;impostoFederalGeral.aliquotaEntrada==%f;impostoFederalGeral.aliquotaSaida==%f', [
         'PIS',
         50,
         '01',
         1.65,
         1.65
      ], TFormatSettings.Create('en-us'));
      PISs := ImpostosFederaisService.Filter(Query);
      PIS := PISs[0];
      WriteLn(PIS.ImpostoFederalGeral.Id);
    except
      on E: Exception do
        Writeln(E.ClassName, ': ', E.Message);
    end;
    ReadLn;
  FINALLY
    CoUninitialize;
  END;
end.
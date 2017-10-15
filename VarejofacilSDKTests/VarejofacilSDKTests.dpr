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
  TestSDK.Service.Abastecimento in 'Services\TestSDK.Service.Abastecimento.pas',
  TestSDK.Service.Agente in 'Services\TestSDK.Service.Agente.pas',
  TestSDK.Service.Bairro in 'Services\TestSDK.Service.Bairro.pas',
  TestSDK.Service.Bandeira in 'Services\TestSDK.Service.Bandeira.pas',
  TestSDK.Service.Bico in 'Services\TestSDK.Service.Bico.pas',
  TestSDK.Service.Caixa in 'Services\TestSDK.Service.Caixa.pas',
  TestSDK.Service.Campo in 'Services\TestSDK.Service.Campo.pas',
  TestSDK.Service.Cfop in 'Services\TestSDK.Service.Cfop.pas',
  TestSDK.Service.Cliente in 'Services\TestSDK.Service.Cliente.pas',
  TestSDK.Service.Combustivel in 'Services\TestSDK.Service.Combustivel.pas',
  TestSDK.Service.Componente in 'Services\TestSDK.Service.Componente.pas',
  TestSDK.Service.ComposicaoAlimento in 'Services\TestSDK.Service.ComposicaoAlimento.pas',
  TestSDK.Service.Composto in 'Services\TestSDK.Service.Composto.pas',
  TestSDK.Service.ConfiguracaoPdv in 'Services\TestSDK.Service.ConfiguracaoPdv.pas',
  TestSDK.Service.ContaAPagar in 'Services\TestSDK.Service.ContaAPagar.pas',
  TestSDK.Service.ContaAPagarLiquidacao in 'Services\TestSDK.Service.ContaAPagarLiquidacao.pas',
  TestSDK.Service.ContaAReceber in 'Services\TestSDK.Service.ContaAReceber.pas',
  TestSDK.Service.ContaCorrente in 'Services\TestSDK.Service.ContaCorrente.pas',
  TestSDK.Service.Controle in 'Services\TestSDK.Service.Controle.pas',
  TestSDK.Service.ControleCargaPdv in 'Services\TestSDK.Service.ControleCargaPdv.pas',
  TestSDK.Service.Corretor in 'Services\TestSDK.Service.Corretor.pas',
  TestSDK.Service.Csosn in 'Services\TestSDK.Service.Csosn.pas',
  TestSDK.Service.Cst in 'Services\TestSDK.Service.Cst.pas',
  TestSDK.Service.Devolucao in 'Services\TestSDK.Service.Devolucao.pas',
  TestSDK.Service.DocumentoNaoFiscalEmitido in 'Services\TestSDK.Service.DocumentoNaoFiscalEmitido.pas',
  TestSDK.Service.Ecf in 'Services\TestSDK.Service.Ecf.pas',
  TestSDK.Service.EmailGrupo in 'Services\TestSDK.Service.EmailGrupo.pas',
  TestSDK.Service.EmailOcorrencia in 'Services\TestSDK.Service.EmailOcorrencia.pas',
  TestSDK.Service.Entrega in 'Services\TestSDK.Service.Entrega.pas',
  TestSDK.Service.ErroPDV in 'Services\TestSDK.Service.ErroPDV.pas',
  TestSDK.Service.Estoque in 'Services\TestSDK.Service.Estoque.pas',
  TestSDK.Service.EstoqueMovimentacao in 'Services\TestSDK.Service.EstoqueMovimentacao.pas',
  TestSDK.Service.FatoGerador in 'Services\TestSDK.Service.FatoGerador.pas',
  TestSDK.Service.Ficha in 'Services\TestSDK.Service.Ficha.pas',
  TestSDK.Service.FilaImpressao in 'Services\TestSDK.Service.FilaImpressao.pas',
  TestSDK.Service.Finalizadora in 'Services\TestSDK.Service.Finalizadora.pas',
  TestSDK.Service.FiscoEcf in 'Services\TestSDK.Service.FiscoEcf.pas',
  TestSDK.Service.Funcao in 'Services\TestSDK.Service.Funcao.pas',
  TestSDK.Service.Funcionario in 'Services\TestSDK.Service.Funcionario.pas',
  TestSDK.Service.GarantiaEstendida in 'Services\TestSDK.Service.GarantiaEstendida.pas',
  TestSDK.Service.Genero in 'Services\TestSDK.Service.Genero.pas',
  TestSDK.Service.Grupo in 'Services\TestSDK.Service.Grupo.pas',
  TestSDK.Service.Local in 'Services\TestSDK.Service.Local.pas',
  TestSDK.Service.LocalImpressao in 'Services\TestSDK.Service.LocalImpressao.pas',
  TestSDK.Service.MapaResumo in 'Services\TestSDK.Service.MapaResumo.pas',
  TestSDK.Service.Marca in 'Services\TestSDK.Service.Marca.pas',
  TestSDK.Service.Moeda in 'Services\TestSDK.Service.Moeda.pas',
  TestSDK.Service.MoedaCotacao in 'Services\TestSDK.Service.MoedaCotacao.pas',
  TestSDK.Service.NaturezaImpostosFederais in 'Services\TestSDK.Service.NaturezaImpostosFederais.pas',
  TestSDK.Service.Nbs in 'Services\TestSDK.Service.Nbs.pas',
  TestSDK.Service.Ncm in 'Services\TestSDK.Service.Ncm.pas',
  TestSDK.Service.NotaFiscal in 'Services\TestSDK.Service.NotaFiscal.pas',
  TestSDK.Service.Operacao in 'Services\TestSDK.Service.Operacao.pas',
  TestSDK.Service.OperacaoCfop in 'Services\TestSDK.Service.OperacaoCfop.pas',
  TestSDK.Service.Pagamento in 'Services\TestSDK.Service.Pagamento.pas',
  TestSDK.Service.PagueContas in 'Services\TestSDK.Service.PagueContas.pas',
  TestSDK.Service.PedidoVenda in 'Services\TestSDK.Service.PedidoVenda.pas',
  TestSDK.Service.PlanoConta in 'Services\TestSDK.Service.PlanoConta.pas',
  TestSDK.Service.PlanoPagamento in 'Services\TestSDK.Service.PlanoPagamento.pas',
  TestSDK.Service.PreVenda in 'Services\TestSDK.Service.PreVenda.pas',
  TestSDK.Service.Produto in 'Services\TestSDK.Service.Produto.pas',
  TestSDK.Service.ProdutoAux in 'Services\TestSDK.Service.ProdutoAux.pas',
  TestSDK.Service.PromocaoAssistida in 'Services\TestSDK.Service.PromocaoAssistida.pas',
  TestSDK.Service.PromocaoMovimentacao in 'Services\TestSDK.Service.PromocaoMovimentacao.pas',
  TestSDK.Service.Proprio in 'Services\TestSDK.Service.Proprio.pas',
  TestSDK.Service.Ramo in 'Services\TestSDK.Service.Ramo.pas',
  TestSDK.Service.Recebimento in 'Services\TestSDK.Service.Recebimento.pas',
  TestSDK.Service.RecebimentoConvenio in 'Services\TestSDK.Service.RecebimentoConvenio.pas',
  TestSDK.Service.RecebimentoVendaAssistida in 'Services\TestSDK.Service.RecebimentoVendaAssistida.pas',
  TestSDK.Service.Reducao in 'Services\TestSDK.Service.Reducao.pas',
  TestSDK.Service.SaidaOperador in 'Services\TestSDK.Service.SaidaOperador.pas',
  TestSDK.Service.Sangria in 'Services\TestSDK.Service.Sangria.pas',
  TestSDK.Service.Secao in 'Services\TestSDK.Service.Secao.pas',
  TestSDK.Service.SerieProduto in 'Services\TestSDK.Service.SerieProduto.pas',
  TestSDK.Service.Servico in 'Services\TestSDK.Service.Servico.pas',
  TestSDK.Service.SpedDoc in 'Services\TestSDK.Service.SpedDoc.pas',
  TestSDK.Service.StatusCliente in 'Services\TestSDK.Service.StatusCliente.pas',
  TestSDK.Service.SubGrupo in 'Services\TestSDK.Service.SubGrupo.pas',
  TestSDK.Service.Tanque in 'Services\TestSDK.Service.Tanque.pas',
  TestSDK.Service.TipoDesconto in 'Services\TestSDK.Service.TipoDesconto.pas',
  TestSDK.Service.TipoDocumento in 'Services\TestSDK.Service.TipoDocumento.pas',
  TestSDK.Service.TipoRecebimento in 'Services\TestSDK.Service.TipoRecebimento.pas',
  TestSDK.Service.Troca in 'Services\TestSDK.Service.Troca.pas',
  TestSDK.Service.TrocaFormaPagamento in 'Services\TestSDK.Service.TrocaFormaPagamento.pas',
  TestSDK.Service.Unidade in 'Services\TestSDK.Service.Unidade.pas',
  TestSDK.Service.Venda in 'Services\TestSDK.Service.Venda.pas',
  TestSDK.Service.VendaCasada in 'Services\TestSDK.Service.VendaCasada.pas',
  TestSDK.Service.Zona in 'Services\TestSDK.Service.Zona.pas',
  TestSDK.Service.Fornecedor in 'Services\TestSDK.Service.Fornecedor.pas';

{$R *.RES}

begin
  FindCmdLineSwitch('varejofacil', TestConfig.VarejofacilURL);
  DUnitTestRunner.RunRegisteredTests;
end.

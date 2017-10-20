unit SDK.ListSerializers;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.XML, Variants, TypInfo, SDK.Model.AgenteFinanceiro, SDK.Model.Aplicacao, SDK.Model.Caixa, SDK.Model.CancelamentoDeTituloAReceber, SDK.Model.Caracteristica, SDK.Model.CargaProduto, SDK.Model.CategoriaFinanceira, SDK.Model.Cest, SDK.Model.Cfop, SDK.Model.Cliente, SDK.Model.CodigoAuxiliar, SDK.Model.Componente, SDK.Model.ComprovanteTransacao, SDK.Model.ConfiguracaoPDV, SDK.Model.ContaAReceber, SDK.Model.ContaAReceberRenegociacao, SDK.Model.ContaCorrente, SDK.Model.ContaDeEmail, SDK.Model.Contato, SDK.Model.CSTEstadual, SDK.Model.Devolucao, SDK.Model.DevolucaoDeCupom, SDK.Model.Endereco, SDK.Model.EspecieDeDocumento, SDK.Model.EstoqueDoProduto, SDK.Model.FiguraFiscal, SDK.Model.FiltroCaixa, SDK.Model.Finalizacao, SDK.Model.Finalizadora, SDK.Model.FinalizadoraDaPremiacao, SDK.Model.FormaDePagamento, SDK.Model.Fornecedor, SDK.Model.FuncaoDaLoja, SDK.Model.FuncaoDoPDV, SDK.Model.Funcionario, SDK.Model.Genero, SDK.Model.Grupo, SDK.Model.HistoricoValidacaoFiscal, SDK.Model.Holding, SDK.Model.ImpostoFederal, SDK.Model.ItemAplicacaoProduto, SDK.Model.ItemCaracteristicaProduto, SDK.Model.ItemDaTabelaDeTributacao, SDK.Model.ItemDevolucao, SDK.Model.ItemDevolucaoDeCupom, SDK.Model.ItemImpostoFederal, SDK.Model.ItemPagamento, SDK.Model.ItemRecebimento, SDK.Model.ItemSangria, SDK.Model.ItemTroca, SDK.Model.ItemTrocaFormaPagamento, SDK.Model.ItemVenda, SDK.Model.LimiteDeCredito, SDK.Model.LocalDaLoja, SDK.Model.LocalDeImpressao, SDK.Model.LocalEstoque, SDK.Model.Loja, SDK.Model.LojaDaFormaDePagamento, SDK.Model.LojaDoFuncionario, SDK.Model.LojaDoPagamentoPDV, SDK.Model.LojaView, SDK.Model.MarcaDoProduto, SDK.Model.MotivoDaDevolucao, SDK.Model.NCM, SDK.Model.NCMAliquota, SDK.Model.NCMExcecao, SDK.Model.NCMExcecaoAliquota, SDK.Model.NivelDeAcesso, SDK.Model.Ocorrencia, SDK.Model.OcorrenciaVenda, SDK.Model.Pagamento, SDK.Model.PagamentoDeTitulo, SDK.Model.PagamentoPDV, SDK.Model.PagueLeve, SDK.Model.PagueLeveItem, SDK.Model.PautaDoProduto, SDK.Model.PreAutorizacaoContaReceber, SDK.Model.PreAutorizacaoFormaDePagamento, SDK.Model.PreAutorizacaoLiquidacao, SDK.Model.PreAutorizacaoTituloReceber, SDK.Model.Preco, SDK.Model.Premiacao, SDK.Model.PremioLoja, SDK.Model.Produto, SDK.Model.ProdutoDaPremiacao, SDK.Model.ProdutoPrincipal, SDK.Model.ProdutoPromocional, SDK.Model.Ramo, SDK.Model.Recebimento, SDK.Model.Receita, SDK.Model.Reducao, SDK.Model.ReducaoComissao, SDK.Model.Referencia, SDK.Model.ReferenciaDoFornecedor, SDK.Model.RegimeEstadualProduto, SDK.Model.RegimeEstadualTributario, SDK.Model.SaidaOperador, SDK.Model.Sangria, SDK.Model.Secao, SDK.Model.Setor, SDK.Model.SituacaoFiscal, SDK.Model.StatusDoCliente, SDK.Model.SubGrupo, SDK.Model.TabelaDeTributacao, SDK.Model.TipoDocumento, SDK.Model.TipoPagamento, SDK.Model.TituloAReceber, SDK.Model.TituloAReceberCancelamento, SDK.Model.TituloAReceberEstorno, SDK.Model.TituloAReceberLiquidacao, SDK.Model.TituloNaoLiquidado, SDK.Model.TituloNaoLiquidadoMap, SDK.Model.TransacaoConvenio, SDK.Model.TransacaoItemTef, SDK.Model.TransacaoTef, SDK.Model.Tributacao, SDK.Model.Troca, SDK.Model.TrocaFormaPagamento, SDK.Model.UnidadeProduto, SDK.Model.Usuario, SDK.Model.Venda, SDK.Model.VendaCasada, SDK.Service;

type

  TListSerializerException = class(Exception);

  TListSerializer = class
  private
    FType: TString;
    FMarshalling: TServiceMarshalling;
    FSerializers: TPropertySerializerArray;
  public
    constructor Create(const AType: TString = '');
    destructor Destroy; override;
    property Serializers: TPropertySerializerArray read FSerializers;
    function Execute(const AType: TString; AList: TObject): TString; overload;
    function Execute(AList: TObject): TString; overload;
  end;

  TLongListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TLongList): TString;
    class function Execute(AList: TLongList): TString;
  end;

  TAgenteFinanceiroListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TAgenteFinanceiroList): TString;
    class function Execute(AList: TAgenteFinanceiroList): TString;
  end;

  TAplicacaoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TAplicacaoList): TString;
    class function Execute(AList: TAplicacaoList): TString;
  end;

  TCaixaListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TCaixaList): TString;
    class function Execute(AList: TCaixaList): TString;
  end;

  TCancelamentoDeTituloAReceberListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TCancelamentoDeTituloAReceberList): TString;
    class function Execute(AList: TCancelamentoDeTituloAReceberList): TString;
  end;

  TCaracteristicaListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TCaracteristicaList): TString;
    class function Execute(AList: TCaracteristicaList): TString;
  end;

  TCargaProdutoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TCargaProdutoList): TString;
    class function Execute(AList: TCargaProdutoList): TString;
  end;

  TCategoriaFinanceiraListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TCategoriaFinanceiraList): TString;
    class function Execute(AList: TCategoriaFinanceiraList): TString;
  end;

  TCestListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TCestList): TString;
    class function Execute(AList: TCestList): TString;
  end;

  TCfopListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TCfopList): TString;
    class function Execute(AList: TCfopList): TString;
  end;

  TClienteListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TClienteList): TString;
    class function Execute(AList: TClienteList): TString;
  end;

  TCodigoAuxiliarListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TCodigoAuxiliarList): TString;
    class function Execute(AList: TCodigoAuxiliarList): TString;
  end;

  TComponenteListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TComponenteList): TString;
    class function Execute(AList: TComponenteList): TString;
  end;

  TComprovanteTransacaoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TComprovanteTransacaoList): TString;
    class function Execute(AList: TComprovanteTransacaoList): TString;
  end;

  TConfiguracaoPDVListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TConfiguracaoPDVList): TString;
    class function Execute(AList: TConfiguracaoPDVList): TString;
  end;

  TContaAReceberListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TContaAReceberList): TString;
    class function Execute(AList: TContaAReceberList): TString;
  end;

  TContaAReceberRenegociacaoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TContaAReceberRenegociacaoList): TString;
    class function Execute(AList: TContaAReceberRenegociacaoList): TString;
  end;

  TContaCorrenteListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TContaCorrenteList): TString;
    class function Execute(AList: TContaCorrenteList): TString;
  end;

  TContaDeEmailListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TContaDeEmailList): TString;
    class function Execute(AList: TContaDeEmailList): TString;
  end;

  TContatoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TContatoList): TString;
    class function Execute(AList: TContatoList): TString;
  end;

  TCSTEstadualListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TCSTEstadualList): TString;
    class function Execute(AList: TCSTEstadualList): TString;
  end;

  TDevolucaoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TDevolucaoList): TString;
    class function Execute(AList: TDevolucaoList): TString;
  end;

  TDevolucaoDeCupomListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TDevolucaoDeCupomList): TString;
    class function Execute(AList: TDevolucaoDeCupomList): TString;
  end;

  TEnderecoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TEnderecoList): TString;
    class function Execute(AList: TEnderecoList): TString;
  end;

  TEspecieDeDocumentoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TEspecieDeDocumentoList): TString;
    class function Execute(AList: TEspecieDeDocumentoList): TString;
  end;

  TEstoqueDoProdutoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TEstoqueDoProdutoList): TString;
    class function Execute(AList: TEstoqueDoProdutoList): TString;
  end;

  TFiguraFiscalListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TFiguraFiscalList): TString;
    class function Execute(AList: TFiguraFiscalList): TString;
  end;

  TFiltroCaixaListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TFiltroCaixaList): TString;
    class function Execute(AList: TFiltroCaixaList): TString;
  end;

  TFinalizacaoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TFinalizacaoList): TString;
    class function Execute(AList: TFinalizacaoList): TString;
  end;

  TFinalizadoraListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TFinalizadoraList): TString;
    class function Execute(AList: TFinalizadoraList): TString;
  end;

  TFinalizadoraDaPremiacaoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TFinalizadoraDaPremiacaoList): TString;
    class function Execute(AList: TFinalizadoraDaPremiacaoList): TString;
  end;

  TFormaDePagamentoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TFormaDePagamentoList): TString;
    class function Execute(AList: TFormaDePagamentoList): TString;
  end;

  TFornecedorListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TFornecedorList): TString;
    class function Execute(AList: TFornecedorList): TString;
  end;

  TFuncaoDaLojaListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TFuncaoDaLojaList): TString;
    class function Execute(AList: TFuncaoDaLojaList): TString;
  end;

  TFuncaoDoPDVListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TFuncaoDoPDVList): TString;
    class function Execute(AList: TFuncaoDoPDVList): TString;
  end;

  TFuncionarioListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TFuncionarioList): TString;
    class function Execute(AList: TFuncionarioList): TString;
  end;

  TGeneroListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TGeneroList): TString;
    class function Execute(AList: TGeneroList): TString;
  end;

  TGrupoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TGrupoList): TString;
    class function Execute(AList: TGrupoList): TString;
  end;

  THistoricoValidacaoFiscalListSerializer = class(TListSerializer)
  public
    function Serialize(AList: THistoricoValidacaoFiscalList): TString;
    class function Execute(AList: THistoricoValidacaoFiscalList): TString;
  end;

  THoldingListSerializer = class(TListSerializer)
  public
    function Serialize(AList: THoldingList): TString;
    class function Execute(AList: THoldingList): TString;
  end;

  TImpostoFederalListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TImpostoFederalList): TString;
    class function Execute(AList: TImpostoFederalList): TString;
  end;

  TItemAplicacaoProdutoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TItemAplicacaoProdutoList): TString;
    class function Execute(AList: TItemAplicacaoProdutoList): TString;
  end;

  TItemCaracteristicaProdutoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TItemCaracteristicaProdutoList): TString;
    class function Execute(AList: TItemCaracteristicaProdutoList): TString;
  end;

  TItemDaTabelaDeTributacaoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TItemDaTabelaDeTributacaoList): TString;
    class function Execute(AList: TItemDaTabelaDeTributacaoList): TString;
  end;

  TItemDevolucaoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TItemDevolucaoList): TString;
    class function Execute(AList: TItemDevolucaoList): TString;
  end;

  TItemDevolucaoDeCupomListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TItemDevolucaoDeCupomList): TString;
    class function Execute(AList: TItemDevolucaoDeCupomList): TString;
  end;

  TItemImpostoFederalListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TItemImpostoFederalList): TString;
    class function Execute(AList: TItemImpostoFederalList): TString;
  end;

  TItemPagamentoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TItemPagamentoList): TString;
    class function Execute(AList: TItemPagamentoList): TString;
  end;

  TItemRecebimentoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TItemRecebimentoList): TString;
    class function Execute(AList: TItemRecebimentoList): TString;
  end;

  TItemSangriaListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TItemSangriaList): TString;
    class function Execute(AList: TItemSangriaList): TString;
  end;

  TItemTrocaListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TItemTrocaList): TString;
    class function Execute(AList: TItemTrocaList): TString;
  end;

  TItemTrocaFormaPagamentoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TItemTrocaFormaPagamentoList): TString;
    class function Execute(AList: TItemTrocaFormaPagamentoList): TString;
  end;

  TItemVendaListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TItemVendaList): TString;
    class function Execute(AList: TItemVendaList): TString;
  end;

  TLimiteDeCreditoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TLimiteDeCreditoList): TString;
    class function Execute(AList: TLimiteDeCreditoList): TString;
  end;

  TLocalDaLojaListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TLocalDaLojaList): TString;
    class function Execute(AList: TLocalDaLojaList): TString;
  end;

  TLocalDeImpressaoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TLocalDeImpressaoList): TString;
    class function Execute(AList: TLocalDeImpressaoList): TString;
  end;

  TLocalEstoqueListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TLocalEstoqueList): TString;
    class function Execute(AList: TLocalEstoqueList): TString;
  end;

  TLojaListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TLojaList): TString;
    class function Execute(AList: TLojaList): TString;
  end;

  TLojaDaFormaDePagamentoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TLojaDaFormaDePagamentoList): TString;
    class function Execute(AList: TLojaDaFormaDePagamentoList): TString;
  end;

  TLojaDoFuncionarioListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TLojaDoFuncionarioList): TString;
    class function Execute(AList: TLojaDoFuncionarioList): TString;
  end;

  TLojaDoPagamentoPDVListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TLojaDoPagamentoPDVList): TString;
    class function Execute(AList: TLojaDoPagamentoPDVList): TString;
  end;

  TLojaViewListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TLojaViewList): TString;
    class function Execute(AList: TLojaViewList): TString;
  end;

  TMarcaDoProdutoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TMarcaDoProdutoList): TString;
    class function Execute(AList: TMarcaDoProdutoList): TString;
  end;

  TMotivoDaDevolucaoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TMotivoDaDevolucaoList): TString;
    class function Execute(AList: TMotivoDaDevolucaoList): TString;
  end;

  TNCMListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TNCMList): TString;
    class function Execute(AList: TNCMList): TString;
  end;

  TNCMAliquotaListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TNCMAliquotaList): TString;
    class function Execute(AList: TNCMAliquotaList): TString;
  end;

  TNCMExcecaoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TNCMExcecaoList): TString;
    class function Execute(AList: TNCMExcecaoList): TString;
  end;

  TNCMExcecaoAliquotaListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TNCMExcecaoAliquotaList): TString;
    class function Execute(AList: TNCMExcecaoAliquotaList): TString;
  end;

  TNivelDeAcessoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TNivelDeAcessoList): TString;
    class function Execute(AList: TNivelDeAcessoList): TString;
  end;

  TOcorrenciaListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TOcorrenciaList): TString;
    class function Execute(AList: TOcorrenciaList): TString;
  end;

  TOcorrenciaVendaListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TOcorrenciaVendaList): TString;
    class function Execute(AList: TOcorrenciaVendaList): TString;
  end;

  TPagamentoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TPagamentoList): TString;
    class function Execute(AList: TPagamentoList): TString;
  end;

  TPagamentoDeTituloListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TPagamentoDeTituloList): TString;
    class function Execute(AList: TPagamentoDeTituloList): TString;
  end;

  TPagamentoPDVListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TPagamentoPDVList): TString;
    class function Execute(AList: TPagamentoPDVList): TString;
  end;

  TPagueLeveListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TPagueLeveList): TString;
    class function Execute(AList: TPagueLeveList): TString;
  end;

  TPagueLeveItemListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TPagueLeveItemList): TString;
    class function Execute(AList: TPagueLeveItemList): TString;
  end;

  TPautaDoProdutoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TPautaDoProdutoList): TString;
    class function Execute(AList: TPautaDoProdutoList): TString;
  end;

  TPreAutorizacaoContaReceberListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TPreAutorizacaoContaReceberList): TString;
    class function Execute(AList: TPreAutorizacaoContaReceberList): TString;
  end;

  TPreAutorizacaoFormaDePagamentoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TPreAutorizacaoFormaDePagamentoList): TString;
    class function Execute(AList: TPreAutorizacaoFormaDePagamentoList): TString;
  end;

  TPreAutorizacaoLiquidacaoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TPreAutorizacaoLiquidacaoList): TString;
    class function Execute(AList: TPreAutorizacaoLiquidacaoList): TString;
  end;

  TPreAutorizacaoTituloReceberListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TPreAutorizacaoTituloReceberList): TString;
    class function Execute(AList: TPreAutorizacaoTituloReceberList): TString;
  end;

  TPrecoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TPrecoList): TString;
    class function Execute(AList: TPrecoList): TString;
  end;

  TPremiacaoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TPremiacaoList): TString;
    class function Execute(AList: TPremiacaoList): TString;
  end;

  TPremioLojaListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TPremioLojaList): TString;
    class function Execute(AList: TPremioLojaList): TString;
  end;

  TProdutoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TProdutoList): TString;
    class function Execute(AList: TProdutoList): TString;
  end;

  TProdutoDaPremiacaoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TProdutoDaPremiacaoList): TString;
    class function Execute(AList: TProdutoDaPremiacaoList): TString;
  end;

  TProdutoPrincipalListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TProdutoPrincipalList): TString;
    class function Execute(AList: TProdutoPrincipalList): TString;
  end;

  TProdutoPromocionalListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TProdutoPromocionalList): TString;
    class function Execute(AList: TProdutoPromocionalList): TString;
  end;

  TRamoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TRamoList): TString;
    class function Execute(AList: TRamoList): TString;
  end;

  TRecebimentoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TRecebimentoList): TString;
    class function Execute(AList: TRecebimentoList): TString;
  end;

  TReceitaListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TReceitaList): TString;
    class function Execute(AList: TReceitaList): TString;
  end;

  TReducaoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TReducaoList): TString;
    class function Execute(AList: TReducaoList): TString;
  end;

  TReducaoComissaoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TReducaoComissaoList): TString;
    class function Execute(AList: TReducaoComissaoList): TString;
  end;

  TReferenciaListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TReferenciaList): TString;
    class function Execute(AList: TReferenciaList): TString;
  end;

  TReferenciaDoFornecedorListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TReferenciaDoFornecedorList): TString;
    class function Execute(AList: TReferenciaDoFornecedorList): TString;
  end;

  TRegimeEstadualProdutoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TRegimeEstadualProdutoList): TString;
    class function Execute(AList: TRegimeEstadualProdutoList): TString;
  end;

  TRegimeEstadualTributarioListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TRegimeEstadualTributarioList): TString;
    class function Execute(AList: TRegimeEstadualTributarioList): TString;
  end;

  TSaidaOperadorListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TSaidaOperadorList): TString;
    class function Execute(AList: TSaidaOperadorList): TString;
  end;

  TSangriaListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TSangriaList): TString;
    class function Execute(AList: TSangriaList): TString;
  end;

  TSecaoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TSecaoList): TString;
    class function Execute(AList: TSecaoList): TString;
  end;

  TSetorListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TSetorList): TString;
    class function Execute(AList: TSetorList): TString;
  end;

  TSituacaoFiscalListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TSituacaoFiscalList): TString;
    class function Execute(AList: TSituacaoFiscalList): TString;
  end;

  TStatusDoClienteListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TStatusDoClienteList): TString;
    class function Execute(AList: TStatusDoClienteList): TString;
  end;

  TSubGrupoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TSubGrupoList): TString;
    class function Execute(AList: TSubGrupoList): TString;
  end;

  TTabelaDeTributacaoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TTabelaDeTributacaoList): TString;
    class function Execute(AList: TTabelaDeTributacaoList): TString;
  end;

  TTipoDocumentoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TTipoDocumentoList): TString;
    class function Execute(AList: TTipoDocumentoList): TString;
  end;

  TTipoPagamentoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TTipoPagamentoList): TString;
    class function Execute(AList: TTipoPagamentoList): TString;
  end;

  TTituloAReceberListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TTituloAReceberList): TString;
    class function Execute(AList: TTituloAReceberList): TString;
  end;

  TTituloAReceberCancelamentoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TTituloAReceberCancelamentoList): TString;
    class function Execute(AList: TTituloAReceberCancelamentoList): TString;
  end;

  TTituloAReceberEstornoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TTituloAReceberEstornoList): TString;
    class function Execute(AList: TTituloAReceberEstornoList): TString;
  end;

  TTituloAReceberLiquidacaoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TTituloAReceberLiquidacaoList): TString;
    class function Execute(AList: TTituloAReceberLiquidacaoList): TString;
  end;

  TTituloNaoLiquidadoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TTituloNaoLiquidadoList): TString;
    class function Execute(AList: TTituloNaoLiquidadoList): TString;
  end;

  TTituloNaoLiquidadoMapListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TTituloNaoLiquidadoMapList): TString;
    class function Execute(AList: TTituloNaoLiquidadoMapList): TString;
  end;

  TTransacaoConvenioListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TTransacaoConvenioList): TString;
    class function Execute(AList: TTransacaoConvenioList): TString;
  end;

  TTransacaoItemTefListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TTransacaoItemTefList): TString;
    class function Execute(AList: TTransacaoItemTefList): TString;
  end;

  TTransacaoTefListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TTransacaoTefList): TString;
    class function Execute(AList: TTransacaoTefList): TString;
  end;

  TTributacaoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TTributacaoList): TString;
    class function Execute(AList: TTributacaoList): TString;
  end;

  TTrocaListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TTrocaList): TString;
    class function Execute(AList: TTrocaList): TString;
  end;

  TTrocaFormaPagamentoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TTrocaFormaPagamentoList): TString;
    class function Execute(AList: TTrocaFormaPagamentoList): TString;
  end;

  TUnidadeProdutoListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TUnidadeProdutoList): TString;
    class function Execute(AList: TUnidadeProdutoList): TString;
  end;

  TUsuarioListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TUsuarioList): TString;
    class function Execute(AList: TUsuarioList): TString;
  end;

  TVendaListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TVendaList): TString;
    class function Execute(AList: TVendaList): TString;
  end;

  TVendaCasadaListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TVendaCasadaList): TString;
    class function Execute(AList: TVendaCasadaList): TString;
  end;

implementation

{ TListSerializer }

constructor TListSerializer.Create(const AType: TString);
begin
  inherited Create;
  FMarshalling := TServiceMarshalling.Create;
  FSerializers := FMarshalling.Serializers;
  FType := AType;
end;

destructor TListSerializer.Destroy;
begin
  FreeAndNil(FMarshalling);
end;

function TListSerializer.Execute(AList: TObject): TString;
begin
  Result := Execute(FType, AList);
end;

function TListSerializer.Execute(const AType: TString; AList: TObject): TString;
begin
  if SameText(AType, 'TLongList') then Result := TLongListSerializer.Execute(TLongList(AList)) else
  if SameText(AType, 'TAgenteFinanceiroList') then Result := TAgenteFinanceiroListSerializer.Execute(TAgenteFinanceiroList(AList)) else
  if SameText(AType, 'TAplicacaoList') then Result := TAplicacaoListSerializer.Execute(TAplicacaoList(AList)) else
  if SameText(AType, 'TCaixaList') then Result := TCaixaListSerializer.Execute(TCaixaList(AList)) else
  if SameText(AType, 'TCancelamentoDeTituloAReceberList') then Result := TCancelamentoDeTituloAReceberListSerializer.Execute(TCancelamentoDeTituloAReceberList(AList)) else
  if SameText(AType, 'TCaracteristicaList') then Result := TCaracteristicaListSerializer.Execute(TCaracteristicaList(AList)) else
  if SameText(AType, 'TCargaProdutoList') then Result := TCargaProdutoListSerializer.Execute(TCargaProdutoList(AList)) else
  if SameText(AType, 'TCategoriaFinanceiraList') then Result := TCategoriaFinanceiraListSerializer.Execute(TCategoriaFinanceiraList(AList)) else
  if SameText(AType, 'TCestList') then Result := TCestListSerializer.Execute(TCestList(AList)) else
  if SameText(AType, 'TCfopList') then Result := TCfopListSerializer.Execute(TCfopList(AList)) else
  if SameText(AType, 'TClienteList') then Result := TClienteListSerializer.Execute(TClienteList(AList)) else
  if SameText(AType, 'TCodigoAuxiliarList') then Result := TCodigoAuxiliarListSerializer.Execute(TCodigoAuxiliarList(AList)) else
  if SameText(AType, 'TComponenteList') then Result := TComponenteListSerializer.Execute(TComponenteList(AList)) else
  if SameText(AType, 'TComprovanteTransacaoList') then Result := TComprovanteTransacaoListSerializer.Execute(TComprovanteTransacaoList(AList)) else
  if SameText(AType, 'TConfiguracaoPDVList') then Result := TConfiguracaoPDVListSerializer.Execute(TConfiguracaoPDVList(AList)) else
  if SameText(AType, 'TContaAReceberList') then Result := TContaAReceberListSerializer.Execute(TContaAReceberList(AList)) else
  if SameText(AType, 'TContaAReceberRenegociacaoList') then Result := TContaAReceberRenegociacaoListSerializer.Execute(TContaAReceberRenegociacaoList(AList)) else
  if SameText(AType, 'TContaCorrenteList') then Result := TContaCorrenteListSerializer.Execute(TContaCorrenteList(AList)) else
  if SameText(AType, 'TContaDeEmailList') then Result := TContaDeEmailListSerializer.Execute(TContaDeEmailList(AList)) else
  if SameText(AType, 'TContatoList') then Result := TContatoListSerializer.Execute(TContatoList(AList)) else
  if SameText(AType, 'TCSTEstadualList') then Result := TCSTEstadualListSerializer.Execute(TCSTEstadualList(AList)) else
  if SameText(AType, 'TDevolucaoList') then Result := TDevolucaoListSerializer.Execute(TDevolucaoList(AList)) else
  if SameText(AType, 'TDevolucaoDeCupomList') then Result := TDevolucaoDeCupomListSerializer.Execute(TDevolucaoDeCupomList(AList)) else
  if SameText(AType, 'TEnderecoList') then Result := TEnderecoListSerializer.Execute(TEnderecoList(AList)) else
  if SameText(AType, 'TEspecieDeDocumentoList') then Result := TEspecieDeDocumentoListSerializer.Execute(TEspecieDeDocumentoList(AList)) else
  if SameText(AType, 'TEstoqueDoProdutoList') then Result := TEstoqueDoProdutoListSerializer.Execute(TEstoqueDoProdutoList(AList)) else
  if SameText(AType, 'TFiguraFiscalList') then Result := TFiguraFiscalListSerializer.Execute(TFiguraFiscalList(AList)) else
  if SameText(AType, 'TFiltroCaixaList') then Result := TFiltroCaixaListSerializer.Execute(TFiltroCaixaList(AList)) else
  if SameText(AType, 'TFinalizacaoList') then Result := TFinalizacaoListSerializer.Execute(TFinalizacaoList(AList)) else
  if SameText(AType, 'TFinalizadoraList') then Result := TFinalizadoraListSerializer.Execute(TFinalizadoraList(AList)) else
  if SameText(AType, 'TFinalizadoraDaPremiacaoList') then Result := TFinalizadoraDaPremiacaoListSerializer.Execute(TFinalizadoraDaPremiacaoList(AList)) else
  if SameText(AType, 'TFormaDePagamentoList') then Result := TFormaDePagamentoListSerializer.Execute(TFormaDePagamentoList(AList)) else
  if SameText(AType, 'TFornecedorList') then Result := TFornecedorListSerializer.Execute(TFornecedorList(AList)) else
  if SameText(AType, 'TFuncaoDaLojaList') then Result := TFuncaoDaLojaListSerializer.Execute(TFuncaoDaLojaList(AList)) else
  if SameText(AType, 'TFuncaoDoPDVList') then Result := TFuncaoDoPDVListSerializer.Execute(TFuncaoDoPDVList(AList)) else
  if SameText(AType, 'TFuncionarioList') then Result := TFuncionarioListSerializer.Execute(TFuncionarioList(AList)) else
  if SameText(AType, 'TGeneroList') then Result := TGeneroListSerializer.Execute(TGeneroList(AList)) else
  if SameText(AType, 'TGrupoList') then Result := TGrupoListSerializer.Execute(TGrupoList(AList)) else
  if SameText(AType, 'THistoricoValidacaoFiscalList') then Result := THistoricoValidacaoFiscalListSerializer.Execute(THistoricoValidacaoFiscalList(AList)) else
  if SameText(AType, 'THoldingList') then Result := THoldingListSerializer.Execute(THoldingList(AList)) else
  if SameText(AType, 'TImpostoFederalList') then Result := TImpostoFederalListSerializer.Execute(TImpostoFederalList(AList)) else
  if SameText(AType, 'TItemAplicacaoProdutoList') then Result := TItemAplicacaoProdutoListSerializer.Execute(TItemAplicacaoProdutoList(AList)) else
  if SameText(AType, 'TItemCaracteristicaProdutoList') then Result := TItemCaracteristicaProdutoListSerializer.Execute(TItemCaracteristicaProdutoList(AList)) else
  if SameText(AType, 'TItemDaTabelaDeTributacaoList') then Result := TItemDaTabelaDeTributacaoListSerializer.Execute(TItemDaTabelaDeTributacaoList(AList)) else
  if SameText(AType, 'TItemDevolucaoList') then Result := TItemDevolucaoListSerializer.Execute(TItemDevolucaoList(AList)) else
  if SameText(AType, 'TItemDevolucaoDeCupomList') then Result := TItemDevolucaoDeCupomListSerializer.Execute(TItemDevolucaoDeCupomList(AList)) else
  if SameText(AType, 'TItemImpostoFederalList') then Result := TItemImpostoFederalListSerializer.Execute(TItemImpostoFederalList(AList)) else
  if SameText(AType, 'TItemPagamentoList') then Result := TItemPagamentoListSerializer.Execute(TItemPagamentoList(AList)) else
  if SameText(AType, 'TItemRecebimentoList') then Result := TItemRecebimentoListSerializer.Execute(TItemRecebimentoList(AList)) else
  if SameText(AType, 'TItemSangriaList') then Result := TItemSangriaListSerializer.Execute(TItemSangriaList(AList)) else
  if SameText(AType, 'TItemTrocaList') then Result := TItemTrocaListSerializer.Execute(TItemTrocaList(AList)) else
  if SameText(AType, 'TItemTrocaFormaPagamentoList') then Result := TItemTrocaFormaPagamentoListSerializer.Execute(TItemTrocaFormaPagamentoList(AList)) else
  if SameText(AType, 'TItemVendaList') then Result := TItemVendaListSerializer.Execute(TItemVendaList(AList)) else
  if SameText(AType, 'TLimiteDeCreditoList') then Result := TLimiteDeCreditoListSerializer.Execute(TLimiteDeCreditoList(AList)) else
  if SameText(AType, 'TLocalDaLojaList') then Result := TLocalDaLojaListSerializer.Execute(TLocalDaLojaList(AList)) else
  if SameText(AType, 'TLocalDeImpressaoList') then Result := TLocalDeImpressaoListSerializer.Execute(TLocalDeImpressaoList(AList)) else
  if SameText(AType, 'TLocalEstoqueList') then Result := TLocalEstoqueListSerializer.Execute(TLocalEstoqueList(AList)) else
  if SameText(AType, 'TLojaList') then Result := TLojaListSerializer.Execute(TLojaList(AList)) else
  if SameText(AType, 'TLojaDaFormaDePagamentoList') then Result := TLojaDaFormaDePagamentoListSerializer.Execute(TLojaDaFormaDePagamentoList(AList)) else
  if SameText(AType, 'TLojaDoFuncionarioList') then Result := TLojaDoFuncionarioListSerializer.Execute(TLojaDoFuncionarioList(AList)) else
  if SameText(AType, 'TLojaDoPagamentoPDVList') then Result := TLojaDoPagamentoPDVListSerializer.Execute(TLojaDoPagamentoPDVList(AList)) else
  if SameText(AType, 'TLojaViewList') then Result := TLojaViewListSerializer.Execute(TLojaViewList(AList)) else
  if SameText(AType, 'TMarcaDoProdutoList') then Result := TMarcaDoProdutoListSerializer.Execute(TMarcaDoProdutoList(AList)) else
  if SameText(AType, 'TMotivoDaDevolucaoList') then Result := TMotivoDaDevolucaoListSerializer.Execute(TMotivoDaDevolucaoList(AList)) else
  if SameText(AType, 'TNCMList') then Result := TNCMListSerializer.Execute(TNCMList(AList)) else
  if SameText(AType, 'TNCMAliquotaList') then Result := TNCMAliquotaListSerializer.Execute(TNCMAliquotaList(AList)) else
  if SameText(AType, 'TNCMExcecaoList') then Result := TNCMExcecaoListSerializer.Execute(TNCMExcecaoList(AList)) else
  if SameText(AType, 'TNCMExcecaoAliquotaList') then Result := TNCMExcecaoAliquotaListSerializer.Execute(TNCMExcecaoAliquotaList(AList)) else
  if SameText(AType, 'TNivelDeAcessoList') then Result := TNivelDeAcessoListSerializer.Execute(TNivelDeAcessoList(AList)) else
  if SameText(AType, 'TOcorrenciaList') then Result := TOcorrenciaListSerializer.Execute(TOcorrenciaList(AList)) else
  if SameText(AType, 'TOcorrenciaVendaList') then Result := TOcorrenciaVendaListSerializer.Execute(TOcorrenciaVendaList(AList)) else
  if SameText(AType, 'TPagamentoList') then Result := TPagamentoListSerializer.Execute(TPagamentoList(AList)) else
  if SameText(AType, 'TPagamentoDeTituloList') then Result := TPagamentoDeTituloListSerializer.Execute(TPagamentoDeTituloList(AList)) else
  if SameText(AType, 'TPagamentoPDVList') then Result := TPagamentoPDVListSerializer.Execute(TPagamentoPDVList(AList)) else
  if SameText(AType, 'TPagueLeveList') then Result := TPagueLeveListSerializer.Execute(TPagueLeveList(AList)) else
  if SameText(AType, 'TPagueLeveItemList') then Result := TPagueLeveItemListSerializer.Execute(TPagueLeveItemList(AList)) else
  if SameText(AType, 'TPautaDoProdutoList') then Result := TPautaDoProdutoListSerializer.Execute(TPautaDoProdutoList(AList)) else
  if SameText(AType, 'TPreAutorizacaoContaReceberList') then Result := TPreAutorizacaoContaReceberListSerializer.Execute(TPreAutorizacaoContaReceberList(AList)) else
  if SameText(AType, 'TPreAutorizacaoFormaDePagamentoList') then Result := TPreAutorizacaoFormaDePagamentoListSerializer.Execute(TPreAutorizacaoFormaDePagamentoList(AList)) else
  if SameText(AType, 'TPreAutorizacaoLiquidacaoList') then Result := TPreAutorizacaoLiquidacaoListSerializer.Execute(TPreAutorizacaoLiquidacaoList(AList)) else
  if SameText(AType, 'TPreAutorizacaoTituloReceberList') then Result := TPreAutorizacaoTituloReceberListSerializer.Execute(TPreAutorizacaoTituloReceberList(AList)) else
  if SameText(AType, 'TPrecoList') then Result := TPrecoListSerializer.Execute(TPrecoList(AList)) else
  if SameText(AType, 'TPremiacaoList') then Result := TPremiacaoListSerializer.Execute(TPremiacaoList(AList)) else
  if SameText(AType, 'TPremioLojaList') then Result := TPremioLojaListSerializer.Execute(TPremioLojaList(AList)) else
  if SameText(AType, 'TProdutoList') then Result := TProdutoListSerializer.Execute(TProdutoList(AList)) else
  if SameText(AType, 'TProdutoDaPremiacaoList') then Result := TProdutoDaPremiacaoListSerializer.Execute(TProdutoDaPremiacaoList(AList)) else
  if SameText(AType, 'TProdutoPrincipalList') then Result := TProdutoPrincipalListSerializer.Execute(TProdutoPrincipalList(AList)) else
  if SameText(AType, 'TProdutoPromocionalList') then Result := TProdutoPromocionalListSerializer.Execute(TProdutoPromocionalList(AList)) else
  if SameText(AType, 'TRamoList') then Result := TRamoListSerializer.Execute(TRamoList(AList)) else
  if SameText(AType, 'TRecebimentoList') then Result := TRecebimentoListSerializer.Execute(TRecebimentoList(AList)) else
  if SameText(AType, 'TReceitaList') then Result := TReceitaListSerializer.Execute(TReceitaList(AList)) else
  if SameText(AType, 'TReducaoList') then Result := TReducaoListSerializer.Execute(TReducaoList(AList)) else
  if SameText(AType, 'TReducaoComissaoList') then Result := TReducaoComissaoListSerializer.Execute(TReducaoComissaoList(AList)) else
  if SameText(AType, 'TReferenciaList') then Result := TReferenciaListSerializer.Execute(TReferenciaList(AList)) else
  if SameText(AType, 'TReferenciaDoFornecedorList') then Result := TReferenciaDoFornecedorListSerializer.Execute(TReferenciaDoFornecedorList(AList)) else
  if SameText(AType, 'TRegimeEstadualProdutoList') then Result := TRegimeEstadualProdutoListSerializer.Execute(TRegimeEstadualProdutoList(AList)) else
  if SameText(AType, 'TRegimeEstadualTributarioList') then Result := TRegimeEstadualTributarioListSerializer.Execute(TRegimeEstadualTributarioList(AList)) else
  if SameText(AType, 'TSaidaOperadorList') then Result := TSaidaOperadorListSerializer.Execute(TSaidaOperadorList(AList)) else
  if SameText(AType, 'TSangriaList') then Result := TSangriaListSerializer.Execute(TSangriaList(AList)) else
  if SameText(AType, 'TSecaoList') then Result := TSecaoListSerializer.Execute(TSecaoList(AList)) else
  if SameText(AType, 'TSetorList') then Result := TSetorListSerializer.Execute(TSetorList(AList)) else
  if SameText(AType, 'TSituacaoFiscalList') then Result := TSituacaoFiscalListSerializer.Execute(TSituacaoFiscalList(AList)) else
  if SameText(AType, 'TStatusDoClienteList') then Result := TStatusDoClienteListSerializer.Execute(TStatusDoClienteList(AList)) else
  if SameText(AType, 'TSubGrupoList') then Result := TSubGrupoListSerializer.Execute(TSubGrupoList(AList)) else
  if SameText(AType, 'TTabelaDeTributacaoList') then Result := TTabelaDeTributacaoListSerializer.Execute(TTabelaDeTributacaoList(AList)) else
  if SameText(AType, 'TTipoDocumentoList') then Result := TTipoDocumentoListSerializer.Execute(TTipoDocumentoList(AList)) else
  if SameText(AType, 'TTipoPagamentoList') then Result := TTipoPagamentoListSerializer.Execute(TTipoPagamentoList(AList)) else
  if SameText(AType, 'TTituloAReceberList') then Result := TTituloAReceberListSerializer.Execute(TTituloAReceberList(AList)) else
  if SameText(AType, 'TTituloAReceberCancelamentoList') then Result := TTituloAReceberCancelamentoListSerializer.Execute(TTituloAReceberCancelamentoList(AList)) else
  if SameText(AType, 'TTituloAReceberEstornoList') then Result := TTituloAReceberEstornoListSerializer.Execute(TTituloAReceberEstornoList(AList)) else
  if SameText(AType, 'TTituloAReceberLiquidacaoList') then Result := TTituloAReceberLiquidacaoListSerializer.Execute(TTituloAReceberLiquidacaoList(AList)) else
  if SameText(AType, 'TTituloNaoLiquidadoList') then Result := TTituloNaoLiquidadoListSerializer.Execute(TTituloNaoLiquidadoList(AList)) else
  if SameText(AType, 'TTituloNaoLiquidadoMapList') then Result := TTituloNaoLiquidadoMapListSerializer.Execute(TTituloNaoLiquidadoMapList(AList)) else
  if SameText(AType, 'TTransacaoConvenioList') then Result := TTransacaoConvenioListSerializer.Execute(TTransacaoConvenioList(AList)) else
  if SameText(AType, 'TTransacaoItemTefList') then Result := TTransacaoItemTefListSerializer.Execute(TTransacaoItemTefList(AList)) else
  if SameText(AType, 'TTransacaoTefList') then Result := TTransacaoTefListSerializer.Execute(TTransacaoTefList(AList)) else
  if SameText(AType, 'TTributacaoList') then Result := TTributacaoListSerializer.Execute(TTributacaoList(AList)) else
  if SameText(AType, 'TTrocaList') then Result := TTrocaListSerializer.Execute(TTrocaList(AList)) else
  if SameText(AType, 'TTrocaFormaPagamentoList') then Result := TTrocaFormaPagamentoListSerializer.Execute(TTrocaFormaPagamentoList(AList)) else
  if SameText(AType, 'TUnidadeProdutoList') then Result := TUnidadeProdutoListSerializer.Execute(TUnidadeProdutoList(AList)) else
  if SameText(AType, 'TUsuarioList') then Result := TUsuarioListSerializer.Execute(TUsuarioList(AList)) else
  if SameText(AType, 'TVendaList') then Result := TVendaListSerializer.Execute(TVendaList(AList)) else
  if SameText(AType, 'TVendaCasadaList') then Result := TVendaCasadaListSerializer.Execute(TVendaCasadaList(AList)) else
  raise TListSerializerException.Create('lista do tipo s não possui serializador');
end;

{ TLongListSerializer }

class function TLongListSerializer.Execute(AList: TLongList): TString;
var
  Serializer: TLongListSerializer;
begin
  Serializer := TLongListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TLongListSerializer.Serialize(AList: TLongList): TString;
var
  XML: TStrings;
  Item: Int64;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(Format('<value>s</value>', [IntToStr(Item)]));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TAgenteFinanceiroListSerializer }

class function TAgenteFinanceiroListSerializer.Execute(AList: TAgenteFinanceiroList): TString;
var
  Serializer: TAgenteFinanceiroListSerializer;
begin
  Serializer := TAgenteFinanceiroListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TAgenteFinanceiroListSerializer.Serialize(AList: TAgenteFinanceiroList): TString;
var
  XML: TStrings;
  Item: IAgenteFinanceiro;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TAplicacaoListSerializer }

class function TAplicacaoListSerializer.Execute(AList: TAplicacaoList): TString;
var
  Serializer: TAplicacaoListSerializer;
begin
  Serializer := TAplicacaoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TAplicacaoListSerializer.Serialize(AList: TAplicacaoList): TString;
var
  XML: TStrings;
  Item: IAplicacao;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TCaixaListSerializer }

class function TCaixaListSerializer.Execute(AList: TCaixaList): TString;
var
  Serializer: TCaixaListSerializer;
begin
  Serializer := TCaixaListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TCaixaListSerializer.Serialize(AList: TCaixaList): TString;
var
  XML: TStrings;
  Item: ICaixa;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TCancelamentoDeTituloAReceberListSerializer }

class function TCancelamentoDeTituloAReceberListSerializer.Execute(AList: TCancelamentoDeTituloAReceberList): TString;
var
  Serializer: TCancelamentoDeTituloAReceberListSerializer;
begin
  Serializer := TCancelamentoDeTituloAReceberListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TCancelamentoDeTituloAReceberListSerializer.Serialize(AList: TCancelamentoDeTituloAReceberList): TString;
var
  XML: TStrings;
  Item: ICancelamentoDeTituloAReceber;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TCaracteristicaListSerializer }

class function TCaracteristicaListSerializer.Execute(AList: TCaracteristicaList): TString;
var
  Serializer: TCaracteristicaListSerializer;
begin
  Serializer := TCaracteristicaListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TCaracteristicaListSerializer.Serialize(AList: TCaracteristicaList): TString;
var
  XML: TStrings;
  Item: ICaracteristica;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TCargaProdutoListSerializer }

class function TCargaProdutoListSerializer.Execute(AList: TCargaProdutoList): TString;
var
  Serializer: TCargaProdutoListSerializer;
begin
  Serializer := TCargaProdutoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TCargaProdutoListSerializer.Serialize(AList: TCargaProdutoList): TString;
var
  XML: TStrings;
  Item: ICargaProduto;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TCategoriaFinanceiraListSerializer }

class function TCategoriaFinanceiraListSerializer.Execute(AList: TCategoriaFinanceiraList): TString;
var
  Serializer: TCategoriaFinanceiraListSerializer;
begin
  Serializer := TCategoriaFinanceiraListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TCategoriaFinanceiraListSerializer.Serialize(AList: TCategoriaFinanceiraList): TString;
var
  XML: TStrings;
  Item: ICategoriaFinanceira;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TCestListSerializer }

class function TCestListSerializer.Execute(AList: TCestList): TString;
var
  Serializer: TCestListSerializer;
begin
  Serializer := TCestListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TCestListSerializer.Serialize(AList: TCestList): TString;
var
  XML: TStrings;
  Item: ICest;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TCfopListSerializer }

class function TCfopListSerializer.Execute(AList: TCfopList): TString;
var
  Serializer: TCfopListSerializer;
begin
  Serializer := TCfopListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TCfopListSerializer.Serialize(AList: TCfopList): TString;
var
  XML: TStrings;
  Item: ICfop;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TClienteListSerializer }

class function TClienteListSerializer.Execute(AList: TClienteList): TString;
var
  Serializer: TClienteListSerializer;
begin
  Serializer := TClienteListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TClienteListSerializer.Serialize(AList: TClienteList): TString;
var
  XML: TStrings;
  Item: ICliente;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TCodigoAuxiliarListSerializer }

class function TCodigoAuxiliarListSerializer.Execute(AList: TCodigoAuxiliarList): TString;
var
  Serializer: TCodigoAuxiliarListSerializer;
begin
  Serializer := TCodigoAuxiliarListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TCodigoAuxiliarListSerializer.Serialize(AList: TCodigoAuxiliarList): TString;
var
  XML: TStrings;
  Item: ICodigoAuxiliar;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TComponenteListSerializer }

class function TComponenteListSerializer.Execute(AList: TComponenteList): TString;
var
  Serializer: TComponenteListSerializer;
begin
  Serializer := TComponenteListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TComponenteListSerializer.Serialize(AList: TComponenteList): TString;
var
  XML: TStrings;
  Item: IComponente;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TComprovanteTransacaoListSerializer }

class function TComprovanteTransacaoListSerializer.Execute(AList: TComprovanteTransacaoList): TString;
var
  Serializer: TComprovanteTransacaoListSerializer;
begin
  Serializer := TComprovanteTransacaoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TComprovanteTransacaoListSerializer.Serialize(AList: TComprovanteTransacaoList): TString;
var
  XML: TStrings;
  Item: IComprovanteTransacao;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TConfiguracaoPDVListSerializer }

class function TConfiguracaoPDVListSerializer.Execute(AList: TConfiguracaoPDVList): TString;
var
  Serializer: TConfiguracaoPDVListSerializer;
begin
  Serializer := TConfiguracaoPDVListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TConfiguracaoPDVListSerializer.Serialize(AList: TConfiguracaoPDVList): TString;
var
  XML: TStrings;
  Item: IConfiguracaoPDV;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TContaAReceberListSerializer }

class function TContaAReceberListSerializer.Execute(AList: TContaAReceberList): TString;
var
  Serializer: TContaAReceberListSerializer;
begin
  Serializer := TContaAReceberListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TContaAReceberListSerializer.Serialize(AList: TContaAReceberList): TString;
var
  XML: TStrings;
  Item: IContaAReceber;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TContaAReceberRenegociacaoListSerializer }

class function TContaAReceberRenegociacaoListSerializer.Execute(AList: TContaAReceberRenegociacaoList): TString;
var
  Serializer: TContaAReceberRenegociacaoListSerializer;
begin
  Serializer := TContaAReceberRenegociacaoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TContaAReceberRenegociacaoListSerializer.Serialize(AList: TContaAReceberRenegociacaoList): TString;
var
  XML: TStrings;
  Item: IContaAReceberRenegociacao;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TContaCorrenteListSerializer }

class function TContaCorrenteListSerializer.Execute(AList: TContaCorrenteList): TString;
var
  Serializer: TContaCorrenteListSerializer;
begin
  Serializer := TContaCorrenteListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TContaCorrenteListSerializer.Serialize(AList: TContaCorrenteList): TString;
var
  XML: TStrings;
  Item: IContaCorrente;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TContaDeEmailListSerializer }

class function TContaDeEmailListSerializer.Execute(AList: TContaDeEmailList): TString;
var
  Serializer: TContaDeEmailListSerializer;
begin
  Serializer := TContaDeEmailListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TContaDeEmailListSerializer.Serialize(AList: TContaDeEmailList): TString;
var
  XML: TStrings;
  Item: IContaDeEmail;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TContatoListSerializer }

class function TContatoListSerializer.Execute(AList: TContatoList): TString;
var
  Serializer: TContatoListSerializer;
begin
  Serializer := TContatoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TContatoListSerializer.Serialize(AList: TContatoList): TString;
var
  XML: TStrings;
  Item: IContato;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TCSTEstadualListSerializer }

class function TCSTEstadualListSerializer.Execute(AList: TCSTEstadualList): TString;
var
  Serializer: TCSTEstadualListSerializer;
begin
  Serializer := TCSTEstadualListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TCSTEstadualListSerializer.Serialize(AList: TCSTEstadualList): TString;
var
  XML: TStrings;
  Item: ICSTEstadual;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TDevolucaoListSerializer }

class function TDevolucaoListSerializer.Execute(AList: TDevolucaoList): TString;
var
  Serializer: TDevolucaoListSerializer;
begin
  Serializer := TDevolucaoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TDevolucaoListSerializer.Serialize(AList: TDevolucaoList): TString;
var
  XML: TStrings;
  Item: IDevolucao;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TDevolucaoDeCupomListSerializer }

class function TDevolucaoDeCupomListSerializer.Execute(AList: TDevolucaoDeCupomList): TString;
var
  Serializer: TDevolucaoDeCupomListSerializer;
begin
  Serializer := TDevolucaoDeCupomListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TDevolucaoDeCupomListSerializer.Serialize(AList: TDevolucaoDeCupomList): TString;
var
  XML: TStrings;
  Item: IDevolucaoDeCupom;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TEnderecoListSerializer }

class function TEnderecoListSerializer.Execute(AList: TEnderecoList): TString;
var
  Serializer: TEnderecoListSerializer;
begin
  Serializer := TEnderecoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TEnderecoListSerializer.Serialize(AList: TEnderecoList): TString;
var
  XML: TStrings;
  Item: IEndereco;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TEspecieDeDocumentoListSerializer }

class function TEspecieDeDocumentoListSerializer.Execute(AList: TEspecieDeDocumentoList): TString;
var
  Serializer: TEspecieDeDocumentoListSerializer;
begin
  Serializer := TEspecieDeDocumentoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TEspecieDeDocumentoListSerializer.Serialize(AList: TEspecieDeDocumentoList): TString;
var
  XML: TStrings;
  Item: IEspecieDeDocumento;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TEstoqueDoProdutoListSerializer }

class function TEstoqueDoProdutoListSerializer.Execute(AList: TEstoqueDoProdutoList): TString;
var
  Serializer: TEstoqueDoProdutoListSerializer;
begin
  Serializer := TEstoqueDoProdutoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TEstoqueDoProdutoListSerializer.Serialize(AList: TEstoqueDoProdutoList): TString;
var
  XML: TStrings;
  Item: IEstoqueDoProduto;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TFiguraFiscalListSerializer }

class function TFiguraFiscalListSerializer.Execute(AList: TFiguraFiscalList): TString;
var
  Serializer: TFiguraFiscalListSerializer;
begin
  Serializer := TFiguraFiscalListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TFiguraFiscalListSerializer.Serialize(AList: TFiguraFiscalList): TString;
var
  XML: TStrings;
  Item: IFiguraFiscal;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TFiltroCaixaListSerializer }

class function TFiltroCaixaListSerializer.Execute(AList: TFiltroCaixaList): TString;
var
  Serializer: TFiltroCaixaListSerializer;
begin
  Serializer := TFiltroCaixaListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TFiltroCaixaListSerializer.Serialize(AList: TFiltroCaixaList): TString;
var
  XML: TStrings;
  Item: IFiltroCaixa;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TFinalizacaoListSerializer }

class function TFinalizacaoListSerializer.Execute(AList: TFinalizacaoList): TString;
var
  Serializer: TFinalizacaoListSerializer;
begin
  Serializer := TFinalizacaoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TFinalizacaoListSerializer.Serialize(AList: TFinalizacaoList): TString;
var
  XML: TStrings;
  Item: IFinalizacao;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TFinalizadoraListSerializer }

class function TFinalizadoraListSerializer.Execute(AList: TFinalizadoraList): TString;
var
  Serializer: TFinalizadoraListSerializer;
begin
  Serializer := TFinalizadoraListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TFinalizadoraListSerializer.Serialize(AList: TFinalizadoraList): TString;
var
  XML: TStrings;
  Item: IFinalizadora;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TFinalizadoraDaPremiacaoListSerializer }

class function TFinalizadoraDaPremiacaoListSerializer.Execute(AList: TFinalizadoraDaPremiacaoList): TString;
var
  Serializer: TFinalizadoraDaPremiacaoListSerializer;
begin
  Serializer := TFinalizadoraDaPremiacaoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TFinalizadoraDaPremiacaoListSerializer.Serialize(AList: TFinalizadoraDaPremiacaoList): TString;
var
  XML: TStrings;
  Item: IFinalizadoraDaPremiacao;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TFormaDePagamentoListSerializer }

class function TFormaDePagamentoListSerializer.Execute(AList: TFormaDePagamentoList): TString;
var
  Serializer: TFormaDePagamentoListSerializer;
begin
  Serializer := TFormaDePagamentoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TFormaDePagamentoListSerializer.Serialize(AList: TFormaDePagamentoList): TString;
var
  XML: TStrings;
  Item: IFormaDePagamento;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TFornecedorListSerializer }

class function TFornecedorListSerializer.Execute(AList: TFornecedorList): TString;
var
  Serializer: TFornecedorListSerializer;
begin
  Serializer := TFornecedorListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TFornecedorListSerializer.Serialize(AList: TFornecedorList): TString;
var
  XML: TStrings;
  Item: IFornecedor;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TFuncaoDaLojaListSerializer }

class function TFuncaoDaLojaListSerializer.Execute(AList: TFuncaoDaLojaList): TString;
var
  Serializer: TFuncaoDaLojaListSerializer;
begin
  Serializer := TFuncaoDaLojaListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TFuncaoDaLojaListSerializer.Serialize(AList: TFuncaoDaLojaList): TString;
var
  XML: TStrings;
  Item: IFuncaoDaLoja;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TFuncaoDoPDVListSerializer }

class function TFuncaoDoPDVListSerializer.Execute(AList: TFuncaoDoPDVList): TString;
var
  Serializer: TFuncaoDoPDVListSerializer;
begin
  Serializer := TFuncaoDoPDVListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TFuncaoDoPDVListSerializer.Serialize(AList: TFuncaoDoPDVList): TString;
var
  XML: TStrings;
  Item: IFuncaoDoPDV;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TFuncionarioListSerializer }

class function TFuncionarioListSerializer.Execute(AList: TFuncionarioList): TString;
var
  Serializer: TFuncionarioListSerializer;
begin
  Serializer := TFuncionarioListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TFuncionarioListSerializer.Serialize(AList: TFuncionarioList): TString;
var
  XML: TStrings;
  Item: IFuncionario;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TGeneroListSerializer }

class function TGeneroListSerializer.Execute(AList: TGeneroList): TString;
var
  Serializer: TGeneroListSerializer;
begin
  Serializer := TGeneroListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TGeneroListSerializer.Serialize(AList: TGeneroList): TString;
var
  XML: TStrings;
  Item: IGenero;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TGrupoListSerializer }

class function TGrupoListSerializer.Execute(AList: TGrupoList): TString;
var
  Serializer: TGrupoListSerializer;
begin
  Serializer := TGrupoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TGrupoListSerializer.Serialize(AList: TGrupoList): TString;
var
  XML: TStrings;
  Item: IGrupo;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ THistoricoValidacaoFiscalListSerializer }

class function THistoricoValidacaoFiscalListSerializer.Execute(AList: THistoricoValidacaoFiscalList): TString;
var
  Serializer: THistoricoValidacaoFiscalListSerializer;
begin
  Serializer := THistoricoValidacaoFiscalListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function THistoricoValidacaoFiscalListSerializer.Serialize(AList: THistoricoValidacaoFiscalList): TString;
var
  XML: TStrings;
  Item: IHistoricoValidacaoFiscal;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ THoldingListSerializer }

class function THoldingListSerializer.Execute(AList: THoldingList): TString;
var
  Serializer: THoldingListSerializer;
begin
  Serializer := THoldingListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function THoldingListSerializer.Serialize(AList: THoldingList): TString;
var
  XML: TStrings;
  Item: IHolding;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TImpostoFederalListSerializer }

class function TImpostoFederalListSerializer.Execute(AList: TImpostoFederalList): TString;
var
  Serializer: TImpostoFederalListSerializer;
begin
  Serializer := TImpostoFederalListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TImpostoFederalListSerializer.Serialize(AList: TImpostoFederalList): TString;
var
  XML: TStrings;
  Item: IImpostoFederal;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TItemAplicacaoProdutoListSerializer }

class function TItemAplicacaoProdutoListSerializer.Execute(AList: TItemAplicacaoProdutoList): TString;
var
  Serializer: TItemAplicacaoProdutoListSerializer;
begin
  Serializer := TItemAplicacaoProdutoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TItemAplicacaoProdutoListSerializer.Serialize(AList: TItemAplicacaoProdutoList): TString;
var
  XML: TStrings;
  Item: IItemAplicacaoProduto;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TItemCaracteristicaProdutoListSerializer }

class function TItemCaracteristicaProdutoListSerializer.Execute(AList: TItemCaracteristicaProdutoList): TString;
var
  Serializer: TItemCaracteristicaProdutoListSerializer;
begin
  Serializer := TItemCaracteristicaProdutoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TItemCaracteristicaProdutoListSerializer.Serialize(AList: TItemCaracteristicaProdutoList): TString;
var
  XML: TStrings;
  Item: IItemCaracteristicaProduto;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TItemDaTabelaDeTributacaoListSerializer }

class function TItemDaTabelaDeTributacaoListSerializer.Execute(AList: TItemDaTabelaDeTributacaoList): TString;
var
  Serializer: TItemDaTabelaDeTributacaoListSerializer;
begin
  Serializer := TItemDaTabelaDeTributacaoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TItemDaTabelaDeTributacaoListSerializer.Serialize(AList: TItemDaTabelaDeTributacaoList): TString;
var
  XML: TStrings;
  Item: IItemDaTabelaDeTributacao;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TItemDevolucaoListSerializer }

class function TItemDevolucaoListSerializer.Execute(AList: TItemDevolucaoList): TString;
var
  Serializer: TItemDevolucaoListSerializer;
begin
  Serializer := TItemDevolucaoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TItemDevolucaoListSerializer.Serialize(AList: TItemDevolucaoList): TString;
var
  XML: TStrings;
  Item: IItemDevolucao;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TItemDevolucaoDeCupomListSerializer }

class function TItemDevolucaoDeCupomListSerializer.Execute(AList: TItemDevolucaoDeCupomList): TString;
var
  Serializer: TItemDevolucaoDeCupomListSerializer;
begin
  Serializer := TItemDevolucaoDeCupomListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TItemDevolucaoDeCupomListSerializer.Serialize(AList: TItemDevolucaoDeCupomList): TString;
var
  XML: TStrings;
  Item: IItemDevolucaoDeCupom;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TItemImpostoFederalListSerializer }

class function TItemImpostoFederalListSerializer.Execute(AList: TItemImpostoFederalList): TString;
var
  Serializer: TItemImpostoFederalListSerializer;
begin
  Serializer := TItemImpostoFederalListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TItemImpostoFederalListSerializer.Serialize(AList: TItemImpostoFederalList): TString;
var
  XML: TStrings;
  Item: IItemImpostoFederal;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TItemPagamentoListSerializer }

class function TItemPagamentoListSerializer.Execute(AList: TItemPagamentoList): TString;
var
  Serializer: TItemPagamentoListSerializer;
begin
  Serializer := TItemPagamentoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TItemPagamentoListSerializer.Serialize(AList: TItemPagamentoList): TString;
var
  XML: TStrings;
  Item: IItemPagamento;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TItemRecebimentoListSerializer }

class function TItemRecebimentoListSerializer.Execute(AList: TItemRecebimentoList): TString;
var
  Serializer: TItemRecebimentoListSerializer;
begin
  Serializer := TItemRecebimentoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TItemRecebimentoListSerializer.Serialize(AList: TItemRecebimentoList): TString;
var
  XML: TStrings;
  Item: IItemRecebimento;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TItemSangriaListSerializer }

class function TItemSangriaListSerializer.Execute(AList: TItemSangriaList): TString;
var
  Serializer: TItemSangriaListSerializer;
begin
  Serializer := TItemSangriaListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TItemSangriaListSerializer.Serialize(AList: TItemSangriaList): TString;
var
  XML: TStrings;
  Item: IItemSangria;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TItemTrocaListSerializer }

class function TItemTrocaListSerializer.Execute(AList: TItemTrocaList): TString;
var
  Serializer: TItemTrocaListSerializer;
begin
  Serializer := TItemTrocaListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TItemTrocaListSerializer.Serialize(AList: TItemTrocaList): TString;
var
  XML: TStrings;
  Item: IItemTroca;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TItemTrocaFormaPagamentoListSerializer }

class function TItemTrocaFormaPagamentoListSerializer.Execute(AList: TItemTrocaFormaPagamentoList): TString;
var
  Serializer: TItemTrocaFormaPagamentoListSerializer;
begin
  Serializer := TItemTrocaFormaPagamentoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TItemTrocaFormaPagamentoListSerializer.Serialize(AList: TItemTrocaFormaPagamentoList): TString;
var
  XML: TStrings;
  Item: IItemTrocaFormaPagamento;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TItemVendaListSerializer }

class function TItemVendaListSerializer.Execute(AList: TItemVendaList): TString;
var
  Serializer: TItemVendaListSerializer;
begin
  Serializer := TItemVendaListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TItemVendaListSerializer.Serialize(AList: TItemVendaList): TString;
var
  XML: TStrings;
  Item: IItemVenda;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TLimiteDeCreditoListSerializer }

class function TLimiteDeCreditoListSerializer.Execute(AList: TLimiteDeCreditoList): TString;
var
  Serializer: TLimiteDeCreditoListSerializer;
begin
  Serializer := TLimiteDeCreditoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TLimiteDeCreditoListSerializer.Serialize(AList: TLimiteDeCreditoList): TString;
var
  XML: TStrings;
  Item: ILimiteDeCredito;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TLocalDaLojaListSerializer }

class function TLocalDaLojaListSerializer.Execute(AList: TLocalDaLojaList): TString;
var
  Serializer: TLocalDaLojaListSerializer;
begin
  Serializer := TLocalDaLojaListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TLocalDaLojaListSerializer.Serialize(AList: TLocalDaLojaList): TString;
var
  XML: TStrings;
  Item: ILocalDaLoja;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TLocalDeImpressaoListSerializer }

class function TLocalDeImpressaoListSerializer.Execute(AList: TLocalDeImpressaoList): TString;
var
  Serializer: TLocalDeImpressaoListSerializer;
begin
  Serializer := TLocalDeImpressaoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TLocalDeImpressaoListSerializer.Serialize(AList: TLocalDeImpressaoList): TString;
var
  XML: TStrings;
  Item: ILocalDeImpressao;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TLocalEstoqueListSerializer }

class function TLocalEstoqueListSerializer.Execute(AList: TLocalEstoqueList): TString;
var
  Serializer: TLocalEstoqueListSerializer;
begin
  Serializer := TLocalEstoqueListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TLocalEstoqueListSerializer.Serialize(AList: TLocalEstoqueList): TString;
var
  XML: TStrings;
  Item: ILocalEstoque;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TLojaListSerializer }

class function TLojaListSerializer.Execute(AList: TLojaList): TString;
var
  Serializer: TLojaListSerializer;
begin
  Serializer := TLojaListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TLojaListSerializer.Serialize(AList: TLojaList): TString;
var
  XML: TStrings;
  Item: ILoja;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TLojaDaFormaDePagamentoListSerializer }

class function TLojaDaFormaDePagamentoListSerializer.Execute(AList: TLojaDaFormaDePagamentoList): TString;
var
  Serializer: TLojaDaFormaDePagamentoListSerializer;
begin
  Serializer := TLojaDaFormaDePagamentoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TLojaDaFormaDePagamentoListSerializer.Serialize(AList: TLojaDaFormaDePagamentoList): TString;
var
  XML: TStrings;
  Item: ILojaDaFormaDePagamento;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TLojaDoFuncionarioListSerializer }

class function TLojaDoFuncionarioListSerializer.Execute(AList: TLojaDoFuncionarioList): TString;
var
  Serializer: TLojaDoFuncionarioListSerializer;
begin
  Serializer := TLojaDoFuncionarioListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TLojaDoFuncionarioListSerializer.Serialize(AList: TLojaDoFuncionarioList): TString;
var
  XML: TStrings;
  Item: ILojaDoFuncionario;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TLojaDoPagamentoPDVListSerializer }

class function TLojaDoPagamentoPDVListSerializer.Execute(AList: TLojaDoPagamentoPDVList): TString;
var
  Serializer: TLojaDoPagamentoPDVListSerializer;
begin
  Serializer := TLojaDoPagamentoPDVListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TLojaDoPagamentoPDVListSerializer.Serialize(AList: TLojaDoPagamentoPDVList): TString;
var
  XML: TStrings;
  Item: ILojaDoPagamentoPDV;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TLojaViewListSerializer }

class function TLojaViewListSerializer.Execute(AList: TLojaViewList): TString;
var
  Serializer: TLojaViewListSerializer;
begin
  Serializer := TLojaViewListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TLojaViewListSerializer.Serialize(AList: TLojaViewList): TString;
var
  XML: TStrings;
  Item: ILojaView;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TMarcaDoProdutoListSerializer }

class function TMarcaDoProdutoListSerializer.Execute(AList: TMarcaDoProdutoList): TString;
var
  Serializer: TMarcaDoProdutoListSerializer;
begin
  Serializer := TMarcaDoProdutoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TMarcaDoProdutoListSerializer.Serialize(AList: TMarcaDoProdutoList): TString;
var
  XML: TStrings;
  Item: IMarcaDoProduto;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TMotivoDaDevolucaoListSerializer }

class function TMotivoDaDevolucaoListSerializer.Execute(AList: TMotivoDaDevolucaoList): TString;
var
  Serializer: TMotivoDaDevolucaoListSerializer;
begin
  Serializer := TMotivoDaDevolucaoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TMotivoDaDevolucaoListSerializer.Serialize(AList: TMotivoDaDevolucaoList): TString;
var
  XML: TStrings;
  Item: IMotivoDaDevolucao;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TNCMListSerializer }

class function TNCMListSerializer.Execute(AList: TNCMList): TString;
var
  Serializer: TNCMListSerializer;
begin
  Serializer := TNCMListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TNCMListSerializer.Serialize(AList: TNCMList): TString;
var
  XML: TStrings;
  Item: INCM;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TNCMAliquotaListSerializer }

class function TNCMAliquotaListSerializer.Execute(AList: TNCMAliquotaList): TString;
var
  Serializer: TNCMAliquotaListSerializer;
begin
  Serializer := TNCMAliquotaListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TNCMAliquotaListSerializer.Serialize(AList: TNCMAliquotaList): TString;
var
  XML: TStrings;
  Item: INCMAliquota;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TNCMExcecaoListSerializer }

class function TNCMExcecaoListSerializer.Execute(AList: TNCMExcecaoList): TString;
var
  Serializer: TNCMExcecaoListSerializer;
begin
  Serializer := TNCMExcecaoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TNCMExcecaoListSerializer.Serialize(AList: TNCMExcecaoList): TString;
var
  XML: TStrings;
  Item: INCMExcecao;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TNCMExcecaoAliquotaListSerializer }

class function TNCMExcecaoAliquotaListSerializer.Execute(AList: TNCMExcecaoAliquotaList): TString;
var
  Serializer: TNCMExcecaoAliquotaListSerializer;
begin
  Serializer := TNCMExcecaoAliquotaListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TNCMExcecaoAliquotaListSerializer.Serialize(AList: TNCMExcecaoAliquotaList): TString;
var
  XML: TStrings;
  Item: INCMExcecaoAliquota;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TNivelDeAcessoListSerializer }

class function TNivelDeAcessoListSerializer.Execute(AList: TNivelDeAcessoList): TString;
var
  Serializer: TNivelDeAcessoListSerializer;
begin
  Serializer := TNivelDeAcessoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TNivelDeAcessoListSerializer.Serialize(AList: TNivelDeAcessoList): TString;
var
  XML: TStrings;
  Item: INivelDeAcesso;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TOcorrenciaListSerializer }

class function TOcorrenciaListSerializer.Execute(AList: TOcorrenciaList): TString;
var
  Serializer: TOcorrenciaListSerializer;
begin
  Serializer := TOcorrenciaListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TOcorrenciaListSerializer.Serialize(AList: TOcorrenciaList): TString;
var
  XML: TStrings;
  Item: IOcorrencia;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TOcorrenciaVendaListSerializer }

class function TOcorrenciaVendaListSerializer.Execute(AList: TOcorrenciaVendaList): TString;
var
  Serializer: TOcorrenciaVendaListSerializer;
begin
  Serializer := TOcorrenciaVendaListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TOcorrenciaVendaListSerializer.Serialize(AList: TOcorrenciaVendaList): TString;
var
  XML: TStrings;
  Item: IOcorrenciaVenda;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TPagamentoListSerializer }

class function TPagamentoListSerializer.Execute(AList: TPagamentoList): TString;
var
  Serializer: TPagamentoListSerializer;
begin
  Serializer := TPagamentoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TPagamentoListSerializer.Serialize(AList: TPagamentoList): TString;
var
  XML: TStrings;
  Item: IPagamento;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TPagamentoDeTituloListSerializer }

class function TPagamentoDeTituloListSerializer.Execute(AList: TPagamentoDeTituloList): TString;
var
  Serializer: TPagamentoDeTituloListSerializer;
begin
  Serializer := TPagamentoDeTituloListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TPagamentoDeTituloListSerializer.Serialize(AList: TPagamentoDeTituloList): TString;
var
  XML: TStrings;
  Item: IPagamentoDeTitulo;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TPagamentoPDVListSerializer }

class function TPagamentoPDVListSerializer.Execute(AList: TPagamentoPDVList): TString;
var
  Serializer: TPagamentoPDVListSerializer;
begin
  Serializer := TPagamentoPDVListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TPagamentoPDVListSerializer.Serialize(AList: TPagamentoPDVList): TString;
var
  XML: TStrings;
  Item: IPagamentoPDV;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TPagueLeveListSerializer }

class function TPagueLeveListSerializer.Execute(AList: TPagueLeveList): TString;
var
  Serializer: TPagueLeveListSerializer;
begin
  Serializer := TPagueLeveListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TPagueLeveListSerializer.Serialize(AList: TPagueLeveList): TString;
var
  XML: TStrings;
  Item: IPagueLeve;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TPagueLeveItemListSerializer }

class function TPagueLeveItemListSerializer.Execute(AList: TPagueLeveItemList): TString;
var
  Serializer: TPagueLeveItemListSerializer;
begin
  Serializer := TPagueLeveItemListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TPagueLeveItemListSerializer.Serialize(AList: TPagueLeveItemList): TString;
var
  XML: TStrings;
  Item: IPagueLeveItem;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TPautaDoProdutoListSerializer }

class function TPautaDoProdutoListSerializer.Execute(AList: TPautaDoProdutoList): TString;
var
  Serializer: TPautaDoProdutoListSerializer;
begin
  Serializer := TPautaDoProdutoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TPautaDoProdutoListSerializer.Serialize(AList: TPautaDoProdutoList): TString;
var
  XML: TStrings;
  Item: IPautaDoProduto;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TPreAutorizacaoContaReceberListSerializer }

class function TPreAutorizacaoContaReceberListSerializer.Execute(AList: TPreAutorizacaoContaReceberList): TString;
var
  Serializer: TPreAutorizacaoContaReceberListSerializer;
begin
  Serializer := TPreAutorizacaoContaReceberListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TPreAutorizacaoContaReceberListSerializer.Serialize(AList: TPreAutorizacaoContaReceberList): TString;
var
  XML: TStrings;
  Item: IPreAutorizacaoContaReceber;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TPreAutorizacaoFormaDePagamentoListSerializer }

class function TPreAutorizacaoFormaDePagamentoListSerializer.Execute(AList: TPreAutorizacaoFormaDePagamentoList): TString;
var
  Serializer: TPreAutorizacaoFormaDePagamentoListSerializer;
begin
  Serializer := TPreAutorizacaoFormaDePagamentoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TPreAutorizacaoFormaDePagamentoListSerializer.Serialize(AList: TPreAutorizacaoFormaDePagamentoList): TString;
var
  XML: TStrings;
  Item: IPreAutorizacaoFormaDePagamento;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TPreAutorizacaoLiquidacaoListSerializer }

class function TPreAutorizacaoLiquidacaoListSerializer.Execute(AList: TPreAutorizacaoLiquidacaoList): TString;
var
  Serializer: TPreAutorizacaoLiquidacaoListSerializer;
begin
  Serializer := TPreAutorizacaoLiquidacaoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TPreAutorizacaoLiquidacaoListSerializer.Serialize(AList: TPreAutorizacaoLiquidacaoList): TString;
var
  XML: TStrings;
  Item: IPreAutorizacaoLiquidacao;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TPreAutorizacaoTituloReceberListSerializer }

class function TPreAutorizacaoTituloReceberListSerializer.Execute(AList: TPreAutorizacaoTituloReceberList): TString;
var
  Serializer: TPreAutorizacaoTituloReceberListSerializer;
begin
  Serializer := TPreAutorizacaoTituloReceberListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TPreAutorizacaoTituloReceberListSerializer.Serialize(AList: TPreAutorizacaoTituloReceberList): TString;
var
  XML: TStrings;
  Item: IPreAutorizacaoTituloReceber;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TPrecoListSerializer }

class function TPrecoListSerializer.Execute(AList: TPrecoList): TString;
var
  Serializer: TPrecoListSerializer;
begin
  Serializer := TPrecoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TPrecoListSerializer.Serialize(AList: TPrecoList): TString;
var
  XML: TStrings;
  Item: IPreco;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TPremiacaoListSerializer }

class function TPremiacaoListSerializer.Execute(AList: TPremiacaoList): TString;
var
  Serializer: TPremiacaoListSerializer;
begin
  Serializer := TPremiacaoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TPremiacaoListSerializer.Serialize(AList: TPremiacaoList): TString;
var
  XML: TStrings;
  Item: IPremiacao;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TPremioLojaListSerializer }

class function TPremioLojaListSerializer.Execute(AList: TPremioLojaList): TString;
var
  Serializer: TPremioLojaListSerializer;
begin
  Serializer := TPremioLojaListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TPremioLojaListSerializer.Serialize(AList: TPremioLojaList): TString;
var
  XML: TStrings;
  Item: IPremioLoja;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TProdutoListSerializer }

class function TProdutoListSerializer.Execute(AList: TProdutoList): TString;
var
  Serializer: TProdutoListSerializer;
begin
  Serializer := TProdutoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TProdutoListSerializer.Serialize(AList: TProdutoList): TString;
var
  XML: TStrings;
  Item: IProduto;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TProdutoDaPremiacaoListSerializer }

class function TProdutoDaPremiacaoListSerializer.Execute(AList: TProdutoDaPremiacaoList): TString;
var
  Serializer: TProdutoDaPremiacaoListSerializer;
begin
  Serializer := TProdutoDaPremiacaoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TProdutoDaPremiacaoListSerializer.Serialize(AList: TProdutoDaPremiacaoList): TString;
var
  XML: TStrings;
  Item: IProdutoDaPremiacao;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TProdutoPrincipalListSerializer }

class function TProdutoPrincipalListSerializer.Execute(AList: TProdutoPrincipalList): TString;
var
  Serializer: TProdutoPrincipalListSerializer;
begin
  Serializer := TProdutoPrincipalListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TProdutoPrincipalListSerializer.Serialize(AList: TProdutoPrincipalList): TString;
var
  XML: TStrings;
  Item: IProdutoPrincipal;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TProdutoPromocionalListSerializer }

class function TProdutoPromocionalListSerializer.Execute(AList: TProdutoPromocionalList): TString;
var
  Serializer: TProdutoPromocionalListSerializer;
begin
  Serializer := TProdutoPromocionalListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TProdutoPromocionalListSerializer.Serialize(AList: TProdutoPromocionalList): TString;
var
  XML: TStrings;
  Item: IProdutoPromocional;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TRamoListSerializer }

class function TRamoListSerializer.Execute(AList: TRamoList): TString;
var
  Serializer: TRamoListSerializer;
begin
  Serializer := TRamoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TRamoListSerializer.Serialize(AList: TRamoList): TString;
var
  XML: TStrings;
  Item: IRamo;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TRecebimentoListSerializer }

class function TRecebimentoListSerializer.Execute(AList: TRecebimentoList): TString;
var
  Serializer: TRecebimentoListSerializer;
begin
  Serializer := TRecebimentoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TRecebimentoListSerializer.Serialize(AList: TRecebimentoList): TString;
var
  XML: TStrings;
  Item: IRecebimento;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TReceitaListSerializer }

class function TReceitaListSerializer.Execute(AList: TReceitaList): TString;
var
  Serializer: TReceitaListSerializer;
begin
  Serializer := TReceitaListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TReceitaListSerializer.Serialize(AList: TReceitaList): TString;
var
  XML: TStrings;
  Item: IReceita;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TReducaoListSerializer }

class function TReducaoListSerializer.Execute(AList: TReducaoList): TString;
var
  Serializer: TReducaoListSerializer;
begin
  Serializer := TReducaoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TReducaoListSerializer.Serialize(AList: TReducaoList): TString;
var
  XML: TStrings;
  Item: IReducao;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TReducaoComissaoListSerializer }

class function TReducaoComissaoListSerializer.Execute(AList: TReducaoComissaoList): TString;
var
  Serializer: TReducaoComissaoListSerializer;
begin
  Serializer := TReducaoComissaoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TReducaoComissaoListSerializer.Serialize(AList: TReducaoComissaoList): TString;
var
  XML: TStrings;
  Item: IReducaoComissao;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TReferenciaListSerializer }

class function TReferenciaListSerializer.Execute(AList: TReferenciaList): TString;
var
  Serializer: TReferenciaListSerializer;
begin
  Serializer := TReferenciaListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TReferenciaListSerializer.Serialize(AList: TReferenciaList): TString;
var
  XML: TStrings;
  Item: IReferencia;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TReferenciaDoFornecedorListSerializer }

class function TReferenciaDoFornecedorListSerializer.Execute(AList: TReferenciaDoFornecedorList): TString;
var
  Serializer: TReferenciaDoFornecedorListSerializer;
begin
  Serializer := TReferenciaDoFornecedorListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TReferenciaDoFornecedorListSerializer.Serialize(AList: TReferenciaDoFornecedorList): TString;
var
  XML: TStrings;
  Item: IReferenciaDoFornecedor;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TRegimeEstadualProdutoListSerializer }

class function TRegimeEstadualProdutoListSerializer.Execute(AList: TRegimeEstadualProdutoList): TString;
var
  Serializer: TRegimeEstadualProdutoListSerializer;
begin
  Serializer := TRegimeEstadualProdutoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TRegimeEstadualProdutoListSerializer.Serialize(AList: TRegimeEstadualProdutoList): TString;
var
  XML: TStrings;
  Item: IRegimeEstadualProduto;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TRegimeEstadualTributarioListSerializer }

class function TRegimeEstadualTributarioListSerializer.Execute(AList: TRegimeEstadualTributarioList): TString;
var
  Serializer: TRegimeEstadualTributarioListSerializer;
begin
  Serializer := TRegimeEstadualTributarioListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TRegimeEstadualTributarioListSerializer.Serialize(AList: TRegimeEstadualTributarioList): TString;
var
  XML: TStrings;
  Item: IRegimeEstadualTributario;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TSaidaOperadorListSerializer }

class function TSaidaOperadorListSerializer.Execute(AList: TSaidaOperadorList): TString;
var
  Serializer: TSaidaOperadorListSerializer;
begin
  Serializer := TSaidaOperadorListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TSaidaOperadorListSerializer.Serialize(AList: TSaidaOperadorList): TString;
var
  XML: TStrings;
  Item: ISaidaOperador;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TSangriaListSerializer }

class function TSangriaListSerializer.Execute(AList: TSangriaList): TString;
var
  Serializer: TSangriaListSerializer;
begin
  Serializer := TSangriaListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TSangriaListSerializer.Serialize(AList: TSangriaList): TString;
var
  XML: TStrings;
  Item: ISangria;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TSecaoListSerializer }

class function TSecaoListSerializer.Execute(AList: TSecaoList): TString;
var
  Serializer: TSecaoListSerializer;
begin
  Serializer := TSecaoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TSecaoListSerializer.Serialize(AList: TSecaoList): TString;
var
  XML: TStrings;
  Item: ISecao;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TSetorListSerializer }

class function TSetorListSerializer.Execute(AList: TSetorList): TString;
var
  Serializer: TSetorListSerializer;
begin
  Serializer := TSetorListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TSetorListSerializer.Serialize(AList: TSetorList): TString;
var
  XML: TStrings;
  Item: ISetor;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TSituacaoFiscalListSerializer }

class function TSituacaoFiscalListSerializer.Execute(AList: TSituacaoFiscalList): TString;
var
  Serializer: TSituacaoFiscalListSerializer;
begin
  Serializer := TSituacaoFiscalListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TSituacaoFiscalListSerializer.Serialize(AList: TSituacaoFiscalList): TString;
var
  XML: TStrings;
  Item: ISituacaoFiscal;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TStatusDoClienteListSerializer }

class function TStatusDoClienteListSerializer.Execute(AList: TStatusDoClienteList): TString;
var
  Serializer: TStatusDoClienteListSerializer;
begin
  Serializer := TStatusDoClienteListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TStatusDoClienteListSerializer.Serialize(AList: TStatusDoClienteList): TString;
var
  XML: TStrings;
  Item: IStatusDoCliente;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TSubGrupoListSerializer }

class function TSubGrupoListSerializer.Execute(AList: TSubGrupoList): TString;
var
  Serializer: TSubGrupoListSerializer;
begin
  Serializer := TSubGrupoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TSubGrupoListSerializer.Serialize(AList: TSubGrupoList): TString;
var
  XML: TStrings;
  Item: ISubGrupo;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TTabelaDeTributacaoListSerializer }

class function TTabelaDeTributacaoListSerializer.Execute(AList: TTabelaDeTributacaoList): TString;
var
  Serializer: TTabelaDeTributacaoListSerializer;
begin
  Serializer := TTabelaDeTributacaoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TTabelaDeTributacaoListSerializer.Serialize(AList: TTabelaDeTributacaoList): TString;
var
  XML: TStrings;
  Item: ITabelaDeTributacao;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TTipoDocumentoListSerializer }

class function TTipoDocumentoListSerializer.Execute(AList: TTipoDocumentoList): TString;
var
  Serializer: TTipoDocumentoListSerializer;
begin
  Serializer := TTipoDocumentoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TTipoDocumentoListSerializer.Serialize(AList: TTipoDocumentoList): TString;
var
  XML: TStrings;
  Item: ITipoDocumento;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TTipoPagamentoListSerializer }

class function TTipoPagamentoListSerializer.Execute(AList: TTipoPagamentoList): TString;
var
  Serializer: TTipoPagamentoListSerializer;
begin
  Serializer := TTipoPagamentoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TTipoPagamentoListSerializer.Serialize(AList: TTipoPagamentoList): TString;
var
  XML: TStrings;
  Item: ITipoPagamento;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TTituloAReceberListSerializer }

class function TTituloAReceberListSerializer.Execute(AList: TTituloAReceberList): TString;
var
  Serializer: TTituloAReceberListSerializer;
begin
  Serializer := TTituloAReceberListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TTituloAReceberListSerializer.Serialize(AList: TTituloAReceberList): TString;
var
  XML: TStrings;
  Item: ITituloAReceber;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TTituloAReceberCancelamentoListSerializer }

class function TTituloAReceberCancelamentoListSerializer.Execute(AList: TTituloAReceberCancelamentoList): TString;
var
  Serializer: TTituloAReceberCancelamentoListSerializer;
begin
  Serializer := TTituloAReceberCancelamentoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TTituloAReceberCancelamentoListSerializer.Serialize(AList: TTituloAReceberCancelamentoList): TString;
var
  XML: TStrings;
  Item: ITituloAReceberCancelamento;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TTituloAReceberEstornoListSerializer }

class function TTituloAReceberEstornoListSerializer.Execute(AList: TTituloAReceberEstornoList): TString;
var
  Serializer: TTituloAReceberEstornoListSerializer;
begin
  Serializer := TTituloAReceberEstornoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TTituloAReceberEstornoListSerializer.Serialize(AList: TTituloAReceberEstornoList): TString;
var
  XML: TStrings;
  Item: ITituloAReceberEstorno;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TTituloAReceberLiquidacaoListSerializer }

class function TTituloAReceberLiquidacaoListSerializer.Execute(AList: TTituloAReceberLiquidacaoList): TString;
var
  Serializer: TTituloAReceberLiquidacaoListSerializer;
begin
  Serializer := TTituloAReceberLiquidacaoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TTituloAReceberLiquidacaoListSerializer.Serialize(AList: TTituloAReceberLiquidacaoList): TString;
var
  XML: TStrings;
  Item: ITituloAReceberLiquidacao;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TTituloNaoLiquidadoListSerializer }

class function TTituloNaoLiquidadoListSerializer.Execute(AList: TTituloNaoLiquidadoList): TString;
var
  Serializer: TTituloNaoLiquidadoListSerializer;
begin
  Serializer := TTituloNaoLiquidadoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TTituloNaoLiquidadoListSerializer.Serialize(AList: TTituloNaoLiquidadoList): TString;
var
  XML: TStrings;
  Item: ITituloNaoLiquidado;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TTituloNaoLiquidadoMapListSerializer }

class function TTituloNaoLiquidadoMapListSerializer.Execute(AList: TTituloNaoLiquidadoMapList): TString;
var
  Serializer: TTituloNaoLiquidadoMapListSerializer;
begin
  Serializer := TTituloNaoLiquidadoMapListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TTituloNaoLiquidadoMapListSerializer.Serialize(AList: TTituloNaoLiquidadoMapList): TString;
var
  XML: TStrings;
  Item: ITituloNaoLiquidadoMap;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TTransacaoConvenioListSerializer }

class function TTransacaoConvenioListSerializer.Execute(AList: TTransacaoConvenioList): TString;
var
  Serializer: TTransacaoConvenioListSerializer;
begin
  Serializer := TTransacaoConvenioListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TTransacaoConvenioListSerializer.Serialize(AList: TTransacaoConvenioList): TString;
var
  XML: TStrings;
  Item: ITransacaoConvenio;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TTransacaoItemTefListSerializer }

class function TTransacaoItemTefListSerializer.Execute(AList: TTransacaoItemTefList): TString;
var
  Serializer: TTransacaoItemTefListSerializer;
begin
  Serializer := TTransacaoItemTefListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TTransacaoItemTefListSerializer.Serialize(AList: TTransacaoItemTefList): TString;
var
  XML: TStrings;
  Item: ITransacaoItemTef;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TTransacaoTefListSerializer }

class function TTransacaoTefListSerializer.Execute(AList: TTransacaoTefList): TString;
var
  Serializer: TTransacaoTefListSerializer;
begin
  Serializer := TTransacaoTefListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TTransacaoTefListSerializer.Serialize(AList: TTransacaoTefList): TString;
var
  XML: TStrings;
  Item: ITransacaoTef;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TTributacaoListSerializer }

class function TTributacaoListSerializer.Execute(AList: TTributacaoList): TString;
var
  Serializer: TTributacaoListSerializer;
begin
  Serializer := TTributacaoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TTributacaoListSerializer.Serialize(AList: TTributacaoList): TString;
var
  XML: TStrings;
  Item: ITributacao;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TTrocaListSerializer }

class function TTrocaListSerializer.Execute(AList: TTrocaList): TString;
var
  Serializer: TTrocaListSerializer;
begin
  Serializer := TTrocaListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TTrocaListSerializer.Serialize(AList: TTrocaList): TString;
var
  XML: TStrings;
  Item: ITroca;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TTrocaFormaPagamentoListSerializer }

class function TTrocaFormaPagamentoListSerializer.Execute(AList: TTrocaFormaPagamentoList): TString;
var
  Serializer: TTrocaFormaPagamentoListSerializer;
begin
  Serializer := TTrocaFormaPagamentoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TTrocaFormaPagamentoListSerializer.Serialize(AList: TTrocaFormaPagamentoList): TString;
var
  XML: TStrings;
  Item: ITrocaFormaPagamento;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TUnidadeProdutoListSerializer }

class function TUnidadeProdutoListSerializer.Execute(AList: TUnidadeProdutoList): TString;
var
  Serializer: TUnidadeProdutoListSerializer;
begin
  Serializer := TUnidadeProdutoListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TUnidadeProdutoListSerializer.Serialize(AList: TUnidadeProdutoList): TString;
var
  XML: TStrings;
  Item: IUnidadeProduto;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TUsuarioListSerializer }

class function TUsuarioListSerializer.Execute(AList: TUsuarioList): TString;
var
  Serializer: TUsuarioListSerializer;
begin
  Serializer := TUsuarioListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TUsuarioListSerializer.Serialize(AList: TUsuarioList): TString;
var
  XML: TStrings;
  Item: IUsuario;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TVendaListSerializer }

class function TVendaListSerializer.Execute(AList: TVendaList): TString;
var
  Serializer: TVendaListSerializer;
begin
  Serializer := TVendaListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TVendaListSerializer.Serialize(AList: TVendaList): TString;
var
  XML: TStrings;
  Item: IVenda;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

{ TVendaCasadaListSerializer }

class function TVendaCasadaListSerializer.Execute(AList: TVendaCasadaList): TString;
var
  Serializer: TVendaCasadaListSerializer;
begin
  Serializer := TVendaCasadaListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TVendaCasadaListSerializer.Serialize(AList: TVendaCasadaList): TString;
var
  XML: TStrings;
  Item: IVendaCasada;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;

end.


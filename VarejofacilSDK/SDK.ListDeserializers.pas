unit SDK.ListDeserializers;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.XML, Variants, TypInfo, SDK.Model.AgenteFinanceiro, SDK.Model.Aplicacao, SDK.Model.Caixa, SDK.Model.CancelamentoDeTituloAReceber, SDK.Model.Caracteristica, SDK.Model.CargaProduto, SDK.Model.CategoriaFinanceira, SDK.Model.Cest, SDK.Model.Cfop, SDK.Model.Cliente, SDK.Model.CodigoAuxiliar, SDK.Model.Componente, SDK.Model.ComprovanteTransacao, SDK.Model.ConfiguracaoPDV, SDK.Model.ContaAReceber, SDK.Model.ContaAReceberRenegociacao, SDK.Model.ContaCorrente, SDK.Model.ContaDeEmail, SDK.Model.Contato, SDK.Model.CSTEstadual, SDK.Model.Devolucao, SDK.Model.DevolucaoDeCupom, SDK.Model.Endereco, SDK.Model.EspecieDeDocumento, SDK.Model.EstoqueDoProduto, SDK.Model.FiguraFiscal, SDK.Model.FiltroCaixa, SDK.Model.Finalizacao, SDK.Model.Finalizadora, SDK.Model.FinalizadoraDaPremiacao, SDK.Model.FormaDePagamento, SDK.Model.Fornecedor, SDK.Model.FuncaoDaLoja, SDK.Model.FuncaoDoPDV, SDK.Model.Funcionario, SDK.Model.Genero, SDK.Model.Grupo, SDK.Model.HistoricoValidacaoFiscal, SDK.Model.Holding, SDK.Model.ImpostoFederal, SDK.Model.ItemAplicacaoProduto, SDK.Model.ItemCaracteristicaProduto, SDK.Model.ItemTabelaTributaria, SDK.Model.ItemDevolucao, SDK.Model.ItemDevolucaoDeCupom, SDK.Model.ItemImpostoFederal, SDK.Model.ItemPagamento, SDK.Model.ItemRecebimento, SDK.Model.ItemSangria, SDK.Model.ItemTroca, SDK.Model.ItemTrocaFormaPagamento, SDK.Model.ItemVenda, SDK.Model.LimiteDeCredito, SDK.Model.LocalDaLoja, SDK.Model.LocalDeImpressao, SDK.Model.LocalEstoque, SDK.Model.Loja, SDK.Model.LojaDaFormaDePagamento, SDK.Model.LojaDoFuncionario, SDK.Model.LojaDoPagamentoPDV, SDK.Model.LojaView, SDK.Model.MarcaDoProduto, SDK.Model.MotivoDaDevolucao, SDK.Model.NCM, SDK.Model.NCMAliquota, SDK.Model.NCMExcecao, SDK.Model.NCMExcecaoAliquota, SDK.Model.NivelDeAcesso, SDK.Model.Ocorrencia, SDK.Model.OcorrenciaVenda, SDK.Model.Pagamento, SDK.Model.PagamentoDeTitulo, SDK.Model.PagamentoPDV, SDK.Model.PagueLeve, SDK.Model.PagueLeveItem, SDK.Model.PautaDoProduto, SDK.Model.PreAutorizacaoContaReceber, SDK.Model.PreAutorizacaoFormaDePagamento, SDK.Model.PreAutorizacaoLiquidacao, SDK.Model.PreAutorizacaoTituloReceber, SDK.Model.Preco, SDK.Model.Premiacao, SDK.Model.PremioLoja, SDK.Model.Produto, SDK.Model.ProdutoDaPremiacao, SDK.Model.ProdutoPrincipal, SDK.Model.ProdutoPromocional, SDK.Model.Ramo, SDK.Model.Recebimento, SDK.Model.Receita, SDK.Model.Reducao, SDK.Model.ReducaoComissao, SDK.Model.Referencia, SDK.Model.ReferenciaDoFornecedor, SDK.Model.RegimeEstadualProduto, SDK.Model.RegimeEstadualTributario, SDK.Model.SaidaOperador, SDK.Model.Sangria, SDK.Model.Secao, SDK.Model.Setor, SDK.Model.SituacaoFiscal, SDK.Model.StatusDoCliente, SDK.Model.SubGrupo, SDK.Model.TabelaTributaria, SDK.Model.TipoDocumento, SDK.Model.TipoPagamento, SDK.Model.TituloAReceber, SDK.Model.TituloAReceberCancelamento, SDK.Model.TituloAReceberEstorno, SDK.Model.TituloAReceberLiquidacao, SDK.Model.TituloNaoLiquidado, SDK.Model.TituloNaoLiquidadoMap, SDK.Model.TransacaoConvenio, SDK.Model.TransacaoItemTef, SDK.Model.TransacaoTef, SDK.Model.Tributacao, SDK.Model.Troca, SDK.Model.TrocaFormaPagamento, SDK.Model.UnidadeProduto, SDK.Model.Usuario, SDK.Model.Venda, SDK.Model.VendaCasada, SDK.Service, XMLIntf;

type

  TListDeserializerException = class(Exception);

  TListDeserializer = class
  private
    FType: TString;
    FMarshalling: TServiceMarshalling;
    FDeserializers: TPropertyDeserializerArray;
  public
    constructor Create(const AType: TString = '');
    destructor Destroy; override;
    property Deserializers: TPropertyDeserializerArray read FDeserializers;
    procedure Execute(const AType: TString; ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString); overload;
    procedure Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString); overload;
  end;

  TLongListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TAgenteFinanceiroListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TAplicacaoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TCaixaListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TCancelamentoDeTituloAReceberListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TCaracteristicaListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TCargaProdutoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TCategoriaFinanceiraListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TCestListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TCfopListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TClienteListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TCodigoAuxiliarListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TComponenteListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TComprovanteTransacaoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TConfiguracaoPDVListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TContaAReceberListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TContaAReceberRenegociacaoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TContaCorrenteListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TContaDeEmailListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TContatoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TCSTEstadualListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TDevolucaoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TDevolucaoDeCupomListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TEnderecoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TEspecieDeDocumentoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TEstoqueDoProdutoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TFiguraFiscalListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TFiltroCaixaListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TFinalizacaoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TFinalizadoraListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TFinalizadoraDaPremiacaoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TFormaDePagamentoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TFornecedorListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TFuncaoDaLojaListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TFuncaoDoPDVListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TFuncionarioListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TGeneroListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TGrupoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  THistoricoValidacaoFiscalListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  THoldingListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TImpostoFederalListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TItemAplicacaoProdutoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TItemCaracteristicaProdutoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TItemTabelaTributariaListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TItemDevolucaoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TItemDevolucaoDeCupomListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TItemImpostoFederalListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TItemPagamentoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TItemRecebimentoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TItemSangriaListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TItemTrocaListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TItemTrocaFormaPagamentoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TItemVendaListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TLimiteDeCreditoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TLocalDaLojaListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TLocalDeImpressaoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TLocalEstoqueListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TLojaListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TLojaDaFormaDePagamentoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TLojaDoFuncionarioListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TLojaDoPagamentoPDVListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TLojaViewListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TMarcaDoProdutoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TMotivoDaDevolucaoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TNCMListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TNCMAliquotaListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TNCMExcecaoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TNCMExcecaoAliquotaListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TNivelDeAcessoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TOcorrenciaListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TOcorrenciaVendaListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TPagamentoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TPagamentoDeTituloListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TPagamentoPDVListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TPagueLeveListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TPagueLeveItemListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TPautaDoProdutoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TPreAutorizacaoContaReceberListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TPreAutorizacaoFormaDePagamentoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TPreAutorizacaoLiquidacaoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TPreAutorizacaoTituloReceberListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TPrecoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TPremiacaoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TPremioLojaListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TProdutoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TProdutoDaPremiacaoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TProdutoPrincipalListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TProdutoPromocionalListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TRamoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TRecebimentoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TReceitaListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TReducaoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TReducaoComissaoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TReferenciaListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TReferenciaDoFornecedorListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TRegimeEstadualProdutoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TRegimeEstadualTributarioListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TSaidaOperadorListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TSangriaListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TSecaoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TSetorListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TSituacaoFiscalListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TStatusDoClienteListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TSubGrupoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TTabelaTributariaListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TTipoDocumentoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TTipoPagamentoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TTituloAReceberListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TTituloAReceberCancelamentoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TTituloAReceberEstornoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TTituloAReceberLiquidacaoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TTituloNaoLiquidadoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TTituloNaoLiquidadoMapListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TTransacaoConvenioListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TTransacaoItemTefListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TTransacaoTefListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TTributacaoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TTrocaListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TTrocaFormaPagamentoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TUnidadeProdutoListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TUsuarioListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TVendaListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

  TVendaCasadaListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;

implementation

{ TListDeserializer }

constructor TListDeserializer.Create(const AType: TString);
begin
  inherited Create;
  FMarshalling := TServiceMarshalling.Create;
  FDeserializers := FMarshalling.Deserializers;
  FType := AType;
end;

destructor TListDeserializer.Destroy;
begin
  FreeAndNil(FMarshalling);
end;

procedure TListDeserializer.Execute(const AType: TString; ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString);
begin
  if SameText(AType, 'TLongList') then TLongListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TAgenteFinanceiroList') then TAgenteFinanceiroListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TAplicacaoList') then TAplicacaoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TCaixaList') then TCaixaListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TCancelamentoDeTituloAReceberList') then TCancelamentoDeTituloAReceberListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TCaracteristicaList') then TCaracteristicaListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TCargaProdutoList') then TCargaProdutoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TCategoriaFinanceiraList') then TCategoriaFinanceiraListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TCestList') then TCestListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TCfopList') then TCfopListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TClienteList') then TClienteListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TCodigoAuxiliarList') then TCodigoAuxiliarListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TComponenteList') then TComponenteListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TComprovanteTransacaoList') then TComprovanteTransacaoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TConfiguracaoPDVList') then TConfiguracaoPDVListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TContaAReceberList') then TContaAReceberListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TContaAReceberRenegociacaoList') then TContaAReceberRenegociacaoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TContaCorrenteList') then TContaCorrenteListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TContaDeEmailList') then TContaDeEmailListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TContatoList') then TContatoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TCSTEstadualList') then TCSTEstadualListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TDevolucaoList') then TDevolucaoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TDevolucaoDeCupomList') then TDevolucaoDeCupomListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TEnderecoList') then TEnderecoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TEspecieDeDocumentoList') then TEspecieDeDocumentoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TEstoqueDoProdutoList') then TEstoqueDoProdutoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TFiguraFiscalList') then TFiguraFiscalListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TFiltroCaixaList') then TFiltroCaixaListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TFinalizacaoList') then TFinalizacaoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TFinalizadoraList') then TFinalizadoraListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TFinalizadoraDaPremiacaoList') then TFinalizadoraDaPremiacaoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TFormaDePagamentoList') then TFormaDePagamentoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TFornecedorList') then TFornecedorListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TFuncaoDaLojaList') then TFuncaoDaLojaListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TFuncaoDoPDVList') then TFuncaoDoPDVListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TFuncionarioList') then TFuncionarioListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TGeneroList') then TGeneroListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TGrupoList') then TGrupoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'THistoricoValidacaoFiscalList') then THistoricoValidacaoFiscalListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'THoldingList') then THoldingListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TImpostoFederalList') then TImpostoFederalListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TItemAplicacaoProdutoList') then TItemAplicacaoProdutoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TItemCaracteristicaProdutoList') then TItemCaracteristicaProdutoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TItemTabelaTributariaList') then TItemTabelaTributariaListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TItemDevolucaoList') then TItemDevolucaoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TItemDevolucaoDeCupomList') then TItemDevolucaoDeCupomListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TItemImpostoFederalList') then TItemImpostoFederalListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TItemPagamentoList') then TItemPagamentoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TItemRecebimentoList') then TItemRecebimentoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TItemSangriaList') then TItemSangriaListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TItemTrocaList') then TItemTrocaListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TItemTrocaFormaPagamentoList') then TItemTrocaFormaPagamentoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TItemVendaList') then TItemVendaListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TLimiteDeCreditoList') then TLimiteDeCreditoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TLocalDaLojaList') then TLocalDaLojaListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TLocalDeImpressaoList') then TLocalDeImpressaoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TLocalEstoqueList') then TLocalEstoqueListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TLojaList') then TLojaListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TLojaDaFormaDePagamentoList') then TLojaDaFormaDePagamentoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TLojaDoFuncionarioList') then TLojaDoFuncionarioListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TLojaDoPagamentoPDVList') then TLojaDoPagamentoPDVListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TLojaViewList') then TLojaViewListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TMarcaDoProdutoList') then TMarcaDoProdutoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TMotivoDaDevolucaoList') then TMotivoDaDevolucaoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TNCMList') then TNCMListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TNCMAliquotaList') then TNCMAliquotaListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TNCMExcecaoList') then TNCMExcecaoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TNCMExcecaoAliquotaList') then TNCMExcecaoAliquotaListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TNivelDeAcessoList') then TNivelDeAcessoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TOcorrenciaList') then TOcorrenciaListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TOcorrenciaVendaList') then TOcorrenciaVendaListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TPagamentoList') then TPagamentoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TPagamentoDeTituloList') then TPagamentoDeTituloListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TPagamentoPDVList') then TPagamentoPDVListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TPagueLeveList') then TPagueLeveListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TPagueLeveItemList') then TPagueLeveItemListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TPautaDoProdutoList') then TPautaDoProdutoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TPreAutorizacaoContaReceberList') then TPreAutorizacaoContaReceberListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TPreAutorizacaoFormaDePagamentoList') then TPreAutorizacaoFormaDePagamentoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TPreAutorizacaoLiquidacaoList') then TPreAutorizacaoLiquidacaoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TPreAutorizacaoTituloReceberList') then TPreAutorizacaoTituloReceberListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TPrecoList') then TPrecoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TPremiacaoList') then TPremiacaoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TPremioLojaList') then TPremioLojaListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TProdutoList') then TProdutoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TProdutoDaPremiacaoList') then TProdutoDaPremiacaoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TProdutoPrincipalList') then TProdutoPrincipalListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TProdutoPromocionalList') then TProdutoPromocionalListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TRamoList') then TRamoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TRecebimentoList') then TRecebimentoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TReceitaList') then TReceitaListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TReducaoList') then TReducaoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TReducaoComissaoList') then TReducaoComissaoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TReferenciaList') then TReferenciaListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TReferenciaDoFornecedorList') then TReferenciaDoFornecedorListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TRegimeEstadualProdutoList') then TRegimeEstadualProdutoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TRegimeEstadualTributarioList') then TRegimeEstadualTributarioListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TSaidaOperadorList') then TSaidaOperadorListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TSangriaList') then TSangriaListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TSecaoList') then TSecaoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TSetorList') then TSetorListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TSituacaoFiscalList') then TSituacaoFiscalListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TStatusDoClienteList') then TStatusDoClienteListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TSubGrupoList') then TSubGrupoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TTabelaTributariaList') then TTabelaTributariaListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TTipoDocumentoList') then TTipoDocumentoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TTipoPagamentoList') then TTipoPagamentoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TTituloAReceberList') then TTituloAReceberListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TTituloAReceberCancelamentoList') then TTituloAReceberCancelamentoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TTituloAReceberEstornoList') then TTituloAReceberEstornoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TTituloAReceberLiquidacaoList') then TTituloAReceberLiquidacaoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TTituloNaoLiquidadoList') then TTituloNaoLiquidadoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TTituloNaoLiquidadoMapList') then TTituloNaoLiquidadoMapListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TTransacaoConvenioList') then TTransacaoConvenioListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TTransacaoItemTefList') then TTransacaoItemTefListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TTransacaoTefList') then TTransacaoTefListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TTributacaoList') then TTributacaoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TTrocaList') then TTrocaListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TTrocaFormaPagamentoList') then TTrocaFormaPagamentoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TUnidadeProdutoList') then TUnidadeProdutoListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TUsuarioList') then TUsuarioListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TVendaList') then TVendaListDeserializer.Execute(ANode, AModel, APropName) else
  if SameText(AType, 'TVendaCasadaList') then TVendaCasadaListDeserializer.Execute(ANode, AModel, APropName) else
  raise TListDeserializerException.CreateFmt('lista do tipo %s não possui deserializador', [AType]);
end;

procedure TListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString);
begin
  Execute(FType, ANode, AModel, APropName);
end;

{ TLongListDeserializer }

class function TLongListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TLongListDeserializer;
begin
  Deserializer := TLongListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TLongListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TLongList;
  Item: Int64;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TLongList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := StrToIntDef(ChildNode.Text, 0);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TAgenteFinanceiroListDeserializer }

class function TAgenteFinanceiroListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TAgenteFinanceiroListDeserializer;
begin
  Deserializer := TAgenteFinanceiroListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TAgenteFinanceiroListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TAgenteFinanceiroList;
  Item: IAgenteFinanceiro;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TAgenteFinanceiroList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TAgenteFinanceiro.Create;
      TXMLHelper.Deserialize(ChildNode, TAgenteFinanceiro, Deserializers).QueryInterface(GetTypeData(TypeInfo(IAgenteFinanceiro))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TAplicacaoListDeserializer }

class function TAplicacaoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TAplicacaoListDeserializer;
begin
  Deserializer := TAplicacaoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TAplicacaoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TAplicacaoList;
  Item: IAplicacao;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TAplicacaoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TAplicacao.Create;
      TXMLHelper.Deserialize(ChildNode, TAplicacao, Deserializers).QueryInterface(GetTypeData(TypeInfo(IAplicacao))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TCaixaListDeserializer }

class function TCaixaListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TCaixaListDeserializer;
begin
  Deserializer := TCaixaListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TCaixaListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TCaixaList;
  Item: ICaixa;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TCaixaList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TCaixa.Create;
      TXMLHelper.Deserialize(ChildNode, TCaixa, Deserializers).QueryInterface(GetTypeData(TypeInfo(ICaixa))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TCancelamentoDeTituloAReceberListDeserializer }

class function TCancelamentoDeTituloAReceberListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TCancelamentoDeTituloAReceberListDeserializer;
begin
  Deserializer := TCancelamentoDeTituloAReceberListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TCancelamentoDeTituloAReceberListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TCancelamentoDeTituloAReceberList;
  Item: ICancelamentoDeTituloAReceber;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TCancelamentoDeTituloAReceberList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TCancelamentoDeTituloAReceber.Create;
      TXMLHelper.Deserialize(ChildNode, TCancelamentoDeTituloAReceber, Deserializers).QueryInterface(GetTypeData(TypeInfo(ICancelamentoDeTituloAReceber))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TCaracteristicaListDeserializer }

class function TCaracteristicaListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TCaracteristicaListDeserializer;
begin
  Deserializer := TCaracteristicaListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TCaracteristicaListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TCaracteristicaList;
  Item: ICaracteristica;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TCaracteristicaList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TCaracteristica.Create;
      TXMLHelper.Deserialize(ChildNode, TCaracteristica, Deserializers).QueryInterface(GetTypeData(TypeInfo(ICaracteristica))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TCargaProdutoListDeserializer }

class function TCargaProdutoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TCargaProdutoListDeserializer;
begin
  Deserializer := TCargaProdutoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TCargaProdutoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TCargaProdutoList;
  Item: ICargaProduto;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TCargaProdutoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TCargaProduto.Create;
      TXMLHelper.Deserialize(ChildNode, TCargaProduto, Deserializers).QueryInterface(GetTypeData(TypeInfo(ICargaProduto))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TCategoriaFinanceiraListDeserializer }

class function TCategoriaFinanceiraListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TCategoriaFinanceiraListDeserializer;
begin
  Deserializer := TCategoriaFinanceiraListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TCategoriaFinanceiraListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TCategoriaFinanceiraList;
  Item: ICategoriaFinanceira;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TCategoriaFinanceiraList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TCategoriaFinanceira.Create;
      TXMLHelper.Deserialize(ChildNode, TCategoriaFinanceira, Deserializers).QueryInterface(GetTypeData(TypeInfo(ICategoriaFinanceira))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TCestListDeserializer }

class function TCestListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TCestListDeserializer;
begin
  Deserializer := TCestListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TCestListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TCestList;
  Item: ICest;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TCestList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TCest.Create;
      TXMLHelper.Deserialize(ChildNode, TCest, Deserializers).QueryInterface(GetTypeData(TypeInfo(ICest))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TCfopListDeserializer }

class function TCfopListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TCfopListDeserializer;
begin
  Deserializer := TCfopListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TCfopListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TCfopList;
  Item: ICfop;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TCfopList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TCfop.Create;
      TXMLHelper.Deserialize(ChildNode, TCfop, Deserializers).QueryInterface(GetTypeData(TypeInfo(ICfop))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TClienteListDeserializer }

class function TClienteListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TClienteListDeserializer;
begin
  Deserializer := TClienteListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TClienteListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TClienteList;
  Item: ICliente;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TClienteList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TCliente.Create;
      TXMLHelper.Deserialize(ChildNode, TCliente, Deserializers).QueryInterface(GetTypeData(TypeInfo(ICliente))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TCodigoAuxiliarListDeserializer }

class function TCodigoAuxiliarListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TCodigoAuxiliarListDeserializer;
begin
  Deserializer := TCodigoAuxiliarListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TCodigoAuxiliarListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TCodigoAuxiliarList;
  Item: ICodigoAuxiliar;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TCodigoAuxiliarList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TCodigoAuxiliar.Create;
      TXMLHelper.Deserialize(ChildNode, TCodigoAuxiliar, Deserializers).QueryInterface(GetTypeData(TypeInfo(ICodigoAuxiliar))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TComponenteListDeserializer }

class function TComponenteListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TComponenteListDeserializer;
begin
  Deserializer := TComponenteListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TComponenteListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TComponenteList;
  Item: IComponente;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TComponenteList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TComponente.Create;
      TXMLHelper.Deserialize(ChildNode, TComponente, Deserializers).QueryInterface(GetTypeData(TypeInfo(IComponente))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TComprovanteTransacaoListDeserializer }

class function TComprovanteTransacaoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TComprovanteTransacaoListDeserializer;
begin
  Deserializer := TComprovanteTransacaoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TComprovanteTransacaoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TComprovanteTransacaoList;
  Item: IComprovanteTransacao;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TComprovanteTransacaoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TComprovanteTransacao.Create;
      TXMLHelper.Deserialize(ChildNode, TComprovanteTransacao, Deserializers).QueryInterface(GetTypeData(TypeInfo(IComprovanteTransacao))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TConfiguracaoPDVListDeserializer }

class function TConfiguracaoPDVListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TConfiguracaoPDVListDeserializer;
begin
  Deserializer := TConfiguracaoPDVListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TConfiguracaoPDVListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TConfiguracaoPDVList;
  Item: IConfiguracaoPDV;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TConfiguracaoPDVList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TConfiguracaoPDV.Create;
      TXMLHelper.Deserialize(ChildNode, TConfiguracaoPDV, Deserializers).QueryInterface(GetTypeData(TypeInfo(IConfiguracaoPDV))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TContaAReceberListDeserializer }

class function TContaAReceberListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TContaAReceberListDeserializer;
begin
  Deserializer := TContaAReceberListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TContaAReceberListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TContaAReceberList;
  Item: IContaAReceber;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TContaAReceberList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TContaAReceber.Create;
      TXMLHelper.Deserialize(ChildNode, TContaAReceber, Deserializers).QueryInterface(GetTypeData(TypeInfo(IContaAReceber))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TContaAReceberRenegociacaoListDeserializer }

class function TContaAReceberRenegociacaoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TContaAReceberRenegociacaoListDeserializer;
begin
  Deserializer := TContaAReceberRenegociacaoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TContaAReceberRenegociacaoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TContaAReceberRenegociacaoList;
  Item: IContaAReceberRenegociacao;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TContaAReceberRenegociacaoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TContaAReceberRenegociacao.Create;
      TXMLHelper.Deserialize(ChildNode, TContaAReceberRenegociacao, Deserializers).QueryInterface(GetTypeData(TypeInfo(IContaAReceberRenegociacao))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TContaCorrenteListDeserializer }

class function TContaCorrenteListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TContaCorrenteListDeserializer;
begin
  Deserializer := TContaCorrenteListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TContaCorrenteListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TContaCorrenteList;
  Item: IContaCorrente;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TContaCorrenteList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TContaCorrente.Create;
      TXMLHelper.Deserialize(ChildNode, TContaCorrente, Deserializers).QueryInterface(GetTypeData(TypeInfo(IContaCorrente))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TContaDeEmailListDeserializer }

class function TContaDeEmailListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TContaDeEmailListDeserializer;
begin
  Deserializer := TContaDeEmailListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TContaDeEmailListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TContaDeEmailList;
  Item: IContaDeEmail;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TContaDeEmailList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TContaDeEmail.Create;
      TXMLHelper.Deserialize(ChildNode, TContaDeEmail, Deserializers).QueryInterface(GetTypeData(TypeInfo(IContaDeEmail))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TContatoListDeserializer }

class function TContatoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TContatoListDeserializer;
begin
  Deserializer := TContatoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TContatoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TContatoList;
  Item: IContato;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TContatoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TContato.Create;
      TXMLHelper.Deserialize(ChildNode, TContato, Deserializers).QueryInterface(GetTypeData(TypeInfo(IContato))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TCSTEstadualListDeserializer }

class function TCSTEstadualListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TCSTEstadualListDeserializer;
begin
  Deserializer := TCSTEstadualListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TCSTEstadualListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TCSTEstadualList;
  Item: ICSTEstadual;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TCSTEstadualList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TCSTEstadual.Create;
      TXMLHelper.Deserialize(ChildNode, TCSTEstadual, Deserializers).QueryInterface(GetTypeData(TypeInfo(ICSTEstadual))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TDevolucaoListDeserializer }

class function TDevolucaoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TDevolucaoListDeserializer;
begin
  Deserializer := TDevolucaoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TDevolucaoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TDevolucaoList;
  Item: IDevolucao;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TDevolucaoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TDevolucao.Create;
      TXMLHelper.Deserialize(ChildNode, TDevolucao, Deserializers).QueryInterface(GetTypeData(TypeInfo(IDevolucao))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TDevolucaoDeCupomListDeserializer }

class function TDevolucaoDeCupomListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TDevolucaoDeCupomListDeserializer;
begin
  Deserializer := TDevolucaoDeCupomListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TDevolucaoDeCupomListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TDevolucaoDeCupomList;
  Item: IDevolucaoDeCupom;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TDevolucaoDeCupomList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TDevolucaoDeCupom.Create;
      TXMLHelper.Deserialize(ChildNode, TDevolucaoDeCupom, Deserializers).QueryInterface(GetTypeData(TypeInfo(IDevolucaoDeCupom))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TEnderecoListDeserializer }

class function TEnderecoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TEnderecoListDeserializer;
begin
  Deserializer := TEnderecoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TEnderecoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TEnderecoList;
  Item: IEndereco;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TEnderecoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TEndereco.Create;
      TXMLHelper.Deserialize(ChildNode, TEndereco, Deserializers).QueryInterface(GetTypeData(TypeInfo(IEndereco))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TEspecieDeDocumentoListDeserializer }

class function TEspecieDeDocumentoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TEspecieDeDocumentoListDeserializer;
begin
  Deserializer := TEspecieDeDocumentoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TEspecieDeDocumentoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TEspecieDeDocumentoList;
  Item: IEspecieDeDocumento;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TEspecieDeDocumentoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TEspecieDeDocumento.Create;
      TXMLHelper.Deserialize(ChildNode, TEspecieDeDocumento, Deserializers).QueryInterface(GetTypeData(TypeInfo(IEspecieDeDocumento))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TEstoqueDoProdutoListDeserializer }

class function TEstoqueDoProdutoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TEstoqueDoProdutoListDeserializer;
begin
  Deserializer := TEstoqueDoProdutoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TEstoqueDoProdutoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TEstoqueDoProdutoList;
  Item: IEstoqueDoProduto;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TEstoqueDoProdutoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TEstoqueDoProduto.Create;
      TXMLHelper.Deserialize(ChildNode, TEstoqueDoProduto, Deserializers).QueryInterface(GetTypeData(TypeInfo(IEstoqueDoProduto))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TFiguraFiscalListDeserializer }

class function TFiguraFiscalListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TFiguraFiscalListDeserializer;
begin
  Deserializer := TFiguraFiscalListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TFiguraFiscalListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TFiguraFiscalList;
  Item: IFiguraFiscal;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TFiguraFiscalList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TFiguraFiscal.Create;
      TXMLHelper.Deserialize(ChildNode, TFiguraFiscal, Deserializers).QueryInterface(GetTypeData(TypeInfo(IFiguraFiscal))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TFiltroCaixaListDeserializer }

class function TFiltroCaixaListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TFiltroCaixaListDeserializer;
begin
  Deserializer := TFiltroCaixaListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TFiltroCaixaListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TFiltroCaixaList;
  Item: IFiltroCaixa;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TFiltroCaixaList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TFiltroCaixa.Create;
      TXMLHelper.Deserialize(ChildNode, TFiltroCaixa, Deserializers).QueryInterface(GetTypeData(TypeInfo(IFiltroCaixa))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TFinalizacaoListDeserializer }

class function TFinalizacaoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TFinalizacaoListDeserializer;
begin
  Deserializer := TFinalizacaoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TFinalizacaoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TFinalizacaoList;
  Item: IFinalizacao;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TFinalizacaoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TFinalizacao.Create;
      TXMLHelper.Deserialize(ChildNode, TFinalizacao, Deserializers).QueryInterface(GetTypeData(TypeInfo(IFinalizacao))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TFinalizadoraListDeserializer }

class function TFinalizadoraListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TFinalizadoraListDeserializer;
begin
  Deserializer := TFinalizadoraListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TFinalizadoraListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TFinalizadoraList;
  Item: IFinalizadora;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TFinalizadoraList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TFinalizadora.Create;
      TXMLHelper.Deserialize(ChildNode, TFinalizadora, Deserializers).QueryInterface(GetTypeData(TypeInfo(IFinalizadora))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TFinalizadoraDaPremiacaoListDeserializer }

class function TFinalizadoraDaPremiacaoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TFinalizadoraDaPremiacaoListDeserializer;
begin
  Deserializer := TFinalizadoraDaPremiacaoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TFinalizadoraDaPremiacaoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TFinalizadoraDaPremiacaoList;
  Item: IFinalizadoraDaPremiacao;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TFinalizadoraDaPremiacaoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TFinalizadoraDaPremiacao.Create;
      TXMLHelper.Deserialize(ChildNode, TFinalizadoraDaPremiacao, Deserializers).QueryInterface(GetTypeData(TypeInfo(IFinalizadoraDaPremiacao))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TFormaDePagamentoListDeserializer }

class function TFormaDePagamentoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TFormaDePagamentoListDeserializer;
begin
  Deserializer := TFormaDePagamentoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TFormaDePagamentoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TFormaDePagamentoList;
  Item: IFormaDePagamento;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TFormaDePagamentoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TFormaDePagamento.Create;
      TXMLHelper.Deserialize(ChildNode, TFormaDePagamento, Deserializers).QueryInterface(GetTypeData(TypeInfo(IFormaDePagamento))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TFornecedorListDeserializer }

class function TFornecedorListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TFornecedorListDeserializer;
begin
  Deserializer := TFornecedorListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TFornecedorListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TFornecedorList;
  Item: IFornecedor;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TFornecedorList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TFornecedor.Create;
      TXMLHelper.Deserialize(ChildNode, TFornecedor, Deserializers).QueryInterface(GetTypeData(TypeInfo(IFornecedor))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TFuncaoDaLojaListDeserializer }

class function TFuncaoDaLojaListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TFuncaoDaLojaListDeserializer;
begin
  Deserializer := TFuncaoDaLojaListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TFuncaoDaLojaListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TFuncaoDaLojaList;
  Item: IFuncaoDaLoja;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TFuncaoDaLojaList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TFuncaoDaLoja.Create;
      TXMLHelper.Deserialize(ChildNode, TFuncaoDaLoja, Deserializers).QueryInterface(GetTypeData(TypeInfo(IFuncaoDaLoja))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TFuncaoDoPDVListDeserializer }

class function TFuncaoDoPDVListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TFuncaoDoPDVListDeserializer;
begin
  Deserializer := TFuncaoDoPDVListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TFuncaoDoPDVListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TFuncaoDoPDVList;
  Item: IFuncaoDoPDV;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TFuncaoDoPDVList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TFuncaoDoPDV.Create;
      TXMLHelper.Deserialize(ChildNode, TFuncaoDoPDV, Deserializers).QueryInterface(GetTypeData(TypeInfo(IFuncaoDoPDV))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TFuncionarioListDeserializer }

class function TFuncionarioListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TFuncionarioListDeserializer;
begin
  Deserializer := TFuncionarioListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TFuncionarioListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TFuncionarioList;
  Item: IFuncionario;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TFuncionarioList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TFuncionario.Create;
      TXMLHelper.Deserialize(ChildNode, TFuncionario, Deserializers).QueryInterface(GetTypeData(TypeInfo(IFuncionario))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TGeneroListDeserializer }

class function TGeneroListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TGeneroListDeserializer;
begin
  Deserializer := TGeneroListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TGeneroListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TGeneroList;
  Item: IGenero;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TGeneroList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TGenero.Create;
      TXMLHelper.Deserialize(ChildNode, TGenero, Deserializers).QueryInterface(GetTypeData(TypeInfo(IGenero))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TGrupoListDeserializer }

class function TGrupoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TGrupoListDeserializer;
begin
  Deserializer := TGrupoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TGrupoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TGrupoList;
  Item: IGrupo;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TGrupoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TGrupo.Create;
      TXMLHelper.Deserialize(ChildNode, TGrupo, Deserializers).QueryInterface(GetTypeData(TypeInfo(IGrupo))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ THistoricoValidacaoFiscalListDeserializer }

class function THistoricoValidacaoFiscalListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: THistoricoValidacaoFiscalListDeserializer;
begin
  Deserializer := THistoricoValidacaoFiscalListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function THistoricoValidacaoFiscalListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: THistoricoValidacaoFiscalList;
  Item: IHistoricoValidacaoFiscal;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := THistoricoValidacaoFiscalList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := THistoricoValidacaoFiscal.Create;
      TXMLHelper.Deserialize(ChildNode, THistoricoValidacaoFiscal, Deserializers).QueryInterface(GetTypeData(TypeInfo(IHistoricoValidacaoFiscal))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ THoldingListDeserializer }

class function THoldingListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: THoldingListDeserializer;
begin
  Deserializer := THoldingListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function THoldingListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: THoldingList;
  Item: IHolding;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := THoldingList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := THolding.Create;
      TXMLHelper.Deserialize(ChildNode, THolding, Deserializers).QueryInterface(GetTypeData(TypeInfo(IHolding))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TImpostoFederalListDeserializer }

class function TImpostoFederalListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TImpostoFederalListDeserializer;
begin
  Deserializer := TImpostoFederalListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TImpostoFederalListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TImpostoFederalList;
  Item: IImpostoFederal;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TImpostoFederalList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TImpostoFederal.Create;
      TXMLHelper.Deserialize(ChildNode, TImpostoFederal, Deserializers).QueryInterface(GetTypeData(TypeInfo(IImpostoFederal))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TItemAplicacaoProdutoListDeserializer }

class function TItemAplicacaoProdutoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TItemAplicacaoProdutoListDeserializer;
begin
  Deserializer := TItemAplicacaoProdutoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TItemAplicacaoProdutoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TItemAplicacaoProdutoList;
  Item: IItemAplicacaoProduto;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TItemAplicacaoProdutoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TItemAplicacaoProduto.Create;
      TXMLHelper.Deserialize(ChildNode, TItemAplicacaoProduto, Deserializers).QueryInterface(GetTypeData(TypeInfo(IItemAplicacaoProduto))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TItemCaracteristicaProdutoListDeserializer }

class function TItemCaracteristicaProdutoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TItemCaracteristicaProdutoListDeserializer;
begin
  Deserializer := TItemCaracteristicaProdutoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TItemCaracteristicaProdutoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TItemCaracteristicaProdutoList;
  Item: IItemCaracteristicaProduto;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TItemCaracteristicaProdutoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TItemCaracteristicaProduto.Create;
      TXMLHelper.Deserialize(ChildNode, TItemCaracteristicaProduto, Deserializers).QueryInterface(GetTypeData(TypeInfo(IItemCaracteristicaProduto))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TItemTabelaTributariaListDeserializer }

class function TItemTabelaTributariaListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TItemTabelaTributariaListDeserializer;
begin
  Deserializer := TItemTabelaTributariaListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TItemTabelaTributariaListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TItemTabelaTributariaList;
  Item: IItemTabelaTributaria;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TItemTabelaTributariaList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TItemTabelaTributaria.Create;
      TXMLHelper.Deserialize(ChildNode, TItemTabelaTributaria, Deserializers).QueryInterface(GetTypeData(TypeInfo(IItemTabelaTributaria))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TItemDevolucaoListDeserializer }

class function TItemDevolucaoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TItemDevolucaoListDeserializer;
begin
  Deserializer := TItemDevolucaoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TItemDevolucaoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TItemDevolucaoList;
  Item: IItemDevolucao;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TItemDevolucaoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TItemDevolucao.Create;
      TXMLHelper.Deserialize(ChildNode, TItemDevolucao, Deserializers).QueryInterface(GetTypeData(TypeInfo(IItemDevolucao))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TItemDevolucaoDeCupomListDeserializer }

class function TItemDevolucaoDeCupomListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TItemDevolucaoDeCupomListDeserializer;
begin
  Deserializer := TItemDevolucaoDeCupomListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TItemDevolucaoDeCupomListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TItemDevolucaoDeCupomList;
  Item: IItemDevolucaoDeCupom;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TItemDevolucaoDeCupomList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TItemDevolucaoDeCupom.Create;
      TXMLHelper.Deserialize(ChildNode, TItemDevolucaoDeCupom, Deserializers).QueryInterface(GetTypeData(TypeInfo(IItemDevolucaoDeCupom))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TItemImpostoFederalListDeserializer }

class function TItemImpostoFederalListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TItemImpostoFederalListDeserializer;
begin
  Deserializer := TItemImpostoFederalListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TItemImpostoFederalListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TItemImpostoFederalList;
  Item: IItemImpostoFederal;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TItemImpostoFederalList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TItemImpostoFederal.Create;
      TXMLHelper.Deserialize(ChildNode, TItemImpostoFederal, Deserializers).QueryInterface(GetTypeData(TypeInfo(IItemImpostoFederal))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TItemPagamentoListDeserializer }

class function TItemPagamentoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TItemPagamentoListDeserializer;
begin
  Deserializer := TItemPagamentoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TItemPagamentoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TItemPagamentoList;
  Item: IItemPagamento;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TItemPagamentoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TItemPagamento.Create;
      TXMLHelper.Deserialize(ChildNode, TItemPagamento, Deserializers).QueryInterface(GetTypeData(TypeInfo(IItemPagamento))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TItemRecebimentoListDeserializer }

class function TItemRecebimentoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TItemRecebimentoListDeserializer;
begin
  Deserializer := TItemRecebimentoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TItemRecebimentoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TItemRecebimentoList;
  Item: IItemRecebimento;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TItemRecebimentoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TItemRecebimento.Create;
      TXMLHelper.Deserialize(ChildNode, TItemRecebimento, Deserializers).QueryInterface(GetTypeData(TypeInfo(IItemRecebimento))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TItemSangriaListDeserializer }

class function TItemSangriaListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TItemSangriaListDeserializer;
begin
  Deserializer := TItemSangriaListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TItemSangriaListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TItemSangriaList;
  Item: IItemSangria;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TItemSangriaList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TItemSangria.Create;
      TXMLHelper.Deserialize(ChildNode, TItemSangria, Deserializers).QueryInterface(GetTypeData(TypeInfo(IItemSangria))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TItemTrocaListDeserializer }

class function TItemTrocaListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TItemTrocaListDeserializer;
begin
  Deserializer := TItemTrocaListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TItemTrocaListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TItemTrocaList;
  Item: IItemTroca;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TItemTrocaList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TItemTroca.Create;
      TXMLHelper.Deserialize(ChildNode, TItemTroca, Deserializers).QueryInterface(GetTypeData(TypeInfo(IItemTroca))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TItemTrocaFormaPagamentoListDeserializer }

class function TItemTrocaFormaPagamentoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TItemTrocaFormaPagamentoListDeserializer;
begin
  Deserializer := TItemTrocaFormaPagamentoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TItemTrocaFormaPagamentoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TItemTrocaFormaPagamentoList;
  Item: IItemTrocaFormaPagamento;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TItemTrocaFormaPagamentoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TItemTrocaFormaPagamento.Create;
      TXMLHelper.Deserialize(ChildNode, TItemTrocaFormaPagamento, Deserializers).QueryInterface(GetTypeData(TypeInfo(IItemTrocaFormaPagamento))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TItemVendaListDeserializer }

class function TItemVendaListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TItemVendaListDeserializer;
begin
  Deserializer := TItemVendaListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TItemVendaListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TItemVendaList;
  Item: IItemVenda;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TItemVendaList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TItemVenda.Create;
      TXMLHelper.Deserialize(ChildNode, TItemVenda, Deserializers).QueryInterface(GetTypeData(TypeInfo(IItemVenda))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TLimiteDeCreditoListDeserializer }

class function TLimiteDeCreditoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TLimiteDeCreditoListDeserializer;
begin
  Deserializer := TLimiteDeCreditoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TLimiteDeCreditoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TLimiteDeCreditoList;
  Item: ILimiteDeCredito;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TLimiteDeCreditoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TLimiteDeCredito.Create;
      TXMLHelper.Deserialize(ChildNode, TLimiteDeCredito, Deserializers).QueryInterface(GetTypeData(TypeInfo(ILimiteDeCredito))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TLocalDaLojaListDeserializer }

class function TLocalDaLojaListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TLocalDaLojaListDeserializer;
begin
  Deserializer := TLocalDaLojaListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TLocalDaLojaListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TLocalDaLojaList;
  Item: ILocalDaLoja;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TLocalDaLojaList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TLocalDaLoja.Create;
      TXMLHelper.Deserialize(ChildNode, TLocalDaLoja, Deserializers).QueryInterface(GetTypeData(TypeInfo(ILocalDaLoja))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TLocalDeImpressaoListDeserializer }

class function TLocalDeImpressaoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TLocalDeImpressaoListDeserializer;
begin
  Deserializer := TLocalDeImpressaoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TLocalDeImpressaoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TLocalDeImpressaoList;
  Item: ILocalDeImpressao;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TLocalDeImpressaoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TLocalDeImpressao.Create;
      TXMLHelper.Deserialize(ChildNode, TLocalDeImpressao, Deserializers).QueryInterface(GetTypeData(TypeInfo(ILocalDeImpressao))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TLocalEstoqueListDeserializer }

class function TLocalEstoqueListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TLocalEstoqueListDeserializer;
begin
  Deserializer := TLocalEstoqueListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TLocalEstoqueListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TLocalEstoqueList;
  Item: ILocalEstoque;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TLocalEstoqueList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TLocalEstoque.Create;
      TXMLHelper.Deserialize(ChildNode, TLocalEstoque, Deserializers).QueryInterface(GetTypeData(TypeInfo(ILocalEstoque))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TLojaListDeserializer }

class function TLojaListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TLojaListDeserializer;
begin
  Deserializer := TLojaListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TLojaListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TLojaList;
  Item: ILoja;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TLojaList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TLoja.Create;
      TXMLHelper.Deserialize(ChildNode, TLoja, Deserializers).QueryInterface(GetTypeData(TypeInfo(ILoja))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TLojaDaFormaDePagamentoListDeserializer }

class function TLojaDaFormaDePagamentoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TLojaDaFormaDePagamentoListDeserializer;
begin
  Deserializer := TLojaDaFormaDePagamentoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TLojaDaFormaDePagamentoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TLojaDaFormaDePagamentoList;
  Item: ILojaDaFormaDePagamento;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TLojaDaFormaDePagamentoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TLojaDaFormaDePagamento.Create;
      TXMLHelper.Deserialize(ChildNode, TLojaDaFormaDePagamento, Deserializers).QueryInterface(GetTypeData(TypeInfo(ILojaDaFormaDePagamento))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TLojaDoFuncionarioListDeserializer }

class function TLojaDoFuncionarioListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TLojaDoFuncionarioListDeserializer;
begin
  Deserializer := TLojaDoFuncionarioListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TLojaDoFuncionarioListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TLojaDoFuncionarioList;
  Item: ILojaDoFuncionario;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TLojaDoFuncionarioList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TLojaDoFuncionario.Create;
      TXMLHelper.Deserialize(ChildNode, TLojaDoFuncionario, Deserializers).QueryInterface(GetTypeData(TypeInfo(ILojaDoFuncionario))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TLojaDoPagamentoPDVListDeserializer }

class function TLojaDoPagamentoPDVListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TLojaDoPagamentoPDVListDeserializer;
begin
  Deserializer := TLojaDoPagamentoPDVListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TLojaDoPagamentoPDVListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TLojaDoPagamentoPDVList;
  Item: ILojaDoPagamentoPDV;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TLojaDoPagamentoPDVList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TLojaDoPagamentoPDV.Create;
      TXMLHelper.Deserialize(ChildNode, TLojaDoPagamentoPDV, Deserializers).QueryInterface(GetTypeData(TypeInfo(ILojaDoPagamentoPDV))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TLojaViewListDeserializer }

class function TLojaViewListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TLojaViewListDeserializer;
begin
  Deserializer := TLojaViewListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TLojaViewListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TLojaViewList;
  Item: ILojaView;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TLojaViewList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TLojaView.Create;
      TXMLHelper.Deserialize(ChildNode, TLojaView, Deserializers).QueryInterface(GetTypeData(TypeInfo(ILojaView))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TMarcaDoProdutoListDeserializer }

class function TMarcaDoProdutoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TMarcaDoProdutoListDeserializer;
begin
  Deserializer := TMarcaDoProdutoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TMarcaDoProdutoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TMarcaDoProdutoList;
  Item: IMarcaDoProduto;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TMarcaDoProdutoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TMarcaDoProduto.Create;
      TXMLHelper.Deserialize(ChildNode, TMarcaDoProduto, Deserializers).QueryInterface(GetTypeData(TypeInfo(IMarcaDoProduto))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TMotivoDaDevolucaoListDeserializer }

class function TMotivoDaDevolucaoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TMotivoDaDevolucaoListDeserializer;
begin
  Deserializer := TMotivoDaDevolucaoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TMotivoDaDevolucaoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TMotivoDaDevolucaoList;
  Item: IMotivoDaDevolucao;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TMotivoDaDevolucaoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TMotivoDaDevolucao.Create;
      TXMLHelper.Deserialize(ChildNode, TMotivoDaDevolucao, Deserializers).QueryInterface(GetTypeData(TypeInfo(IMotivoDaDevolucao))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TNCMListDeserializer }

class function TNCMListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TNCMListDeserializer;
begin
  Deserializer := TNCMListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TNCMListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TNCMList;
  Item: INCM;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TNCMList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TNCM.Create;
      TXMLHelper.Deserialize(ChildNode, TNCM, Deserializers).QueryInterface(GetTypeData(TypeInfo(INCM))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TNCMAliquotaListDeserializer }

class function TNCMAliquotaListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TNCMAliquotaListDeserializer;
begin
  Deserializer := TNCMAliquotaListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TNCMAliquotaListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TNCMAliquotaList;
  Item: INCMAliquota;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TNCMAliquotaList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TNCMAliquota.Create;
      TXMLHelper.Deserialize(ChildNode, TNCMAliquota, Deserializers).QueryInterface(GetTypeData(TypeInfo(INCMAliquota))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TNCMExcecaoListDeserializer }

class function TNCMExcecaoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TNCMExcecaoListDeserializer;
begin
  Deserializer := TNCMExcecaoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TNCMExcecaoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TNCMExcecaoList;
  Item: INCMExcecao;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TNCMExcecaoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TNCMExcecao.Create;
      TXMLHelper.Deserialize(ChildNode, TNCMExcecao, Deserializers).QueryInterface(GetTypeData(TypeInfo(INCMExcecao))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TNCMExcecaoAliquotaListDeserializer }

class function TNCMExcecaoAliquotaListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TNCMExcecaoAliquotaListDeserializer;
begin
  Deserializer := TNCMExcecaoAliquotaListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TNCMExcecaoAliquotaListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TNCMExcecaoAliquotaList;
  Item: INCMExcecaoAliquota;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TNCMExcecaoAliquotaList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TNCMExcecaoAliquota.Create;
      TXMLHelper.Deserialize(ChildNode, TNCMExcecaoAliquota, Deserializers).QueryInterface(GetTypeData(TypeInfo(INCMExcecaoAliquota))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TNivelDeAcessoListDeserializer }

class function TNivelDeAcessoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TNivelDeAcessoListDeserializer;
begin
  Deserializer := TNivelDeAcessoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TNivelDeAcessoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TNivelDeAcessoList;
  Item: INivelDeAcesso;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TNivelDeAcessoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TNivelDeAcesso.Create;
      TXMLHelper.Deserialize(ChildNode, TNivelDeAcesso, Deserializers).QueryInterface(GetTypeData(TypeInfo(INivelDeAcesso))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TOcorrenciaListDeserializer }

class function TOcorrenciaListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TOcorrenciaListDeserializer;
begin
  Deserializer := TOcorrenciaListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TOcorrenciaListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TOcorrenciaList;
  Item: IOcorrencia;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TOcorrenciaList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TOcorrencia.Create;
      TXMLHelper.Deserialize(ChildNode, TOcorrencia, Deserializers).QueryInterface(GetTypeData(TypeInfo(IOcorrencia))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TOcorrenciaVendaListDeserializer }

class function TOcorrenciaVendaListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TOcorrenciaVendaListDeserializer;
begin
  Deserializer := TOcorrenciaVendaListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TOcorrenciaVendaListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TOcorrenciaVendaList;
  Item: IOcorrenciaVenda;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TOcorrenciaVendaList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TOcorrenciaVenda.Create;
      TXMLHelper.Deserialize(ChildNode, TOcorrenciaVenda, Deserializers).QueryInterface(GetTypeData(TypeInfo(IOcorrenciaVenda))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TPagamentoListDeserializer }

class function TPagamentoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TPagamentoListDeserializer;
begin
  Deserializer := TPagamentoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TPagamentoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TPagamentoList;
  Item: IPagamento;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TPagamentoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TPagamento.Create;
      TXMLHelper.Deserialize(ChildNode, TPagamento, Deserializers).QueryInterface(GetTypeData(TypeInfo(IPagamento))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TPagamentoDeTituloListDeserializer }

class function TPagamentoDeTituloListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TPagamentoDeTituloListDeserializer;
begin
  Deserializer := TPagamentoDeTituloListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TPagamentoDeTituloListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TPagamentoDeTituloList;
  Item: IPagamentoDeTitulo;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TPagamentoDeTituloList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TPagamentoDeTitulo.Create;
      TXMLHelper.Deserialize(ChildNode, TPagamentoDeTitulo, Deserializers).QueryInterface(GetTypeData(TypeInfo(IPagamentoDeTitulo))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TPagamentoPDVListDeserializer }

class function TPagamentoPDVListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TPagamentoPDVListDeserializer;
begin
  Deserializer := TPagamentoPDVListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TPagamentoPDVListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TPagamentoPDVList;
  Item: IPagamentoPDV;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TPagamentoPDVList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TPagamentoPDV.Create;
      TXMLHelper.Deserialize(ChildNode, TPagamentoPDV, Deserializers).QueryInterface(GetTypeData(TypeInfo(IPagamentoPDV))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TPagueLeveListDeserializer }

class function TPagueLeveListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TPagueLeveListDeserializer;
begin
  Deserializer := TPagueLeveListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TPagueLeveListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TPagueLeveList;
  Item: IPagueLeve;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TPagueLeveList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TPagueLeve.Create;
      TXMLHelper.Deserialize(ChildNode, TPagueLeve, Deserializers).QueryInterface(GetTypeData(TypeInfo(IPagueLeve))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TPagueLeveItemListDeserializer }

class function TPagueLeveItemListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TPagueLeveItemListDeserializer;
begin
  Deserializer := TPagueLeveItemListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TPagueLeveItemListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TPagueLeveItemList;
  Item: IPagueLeveItem;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TPagueLeveItemList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TPagueLeveItem.Create;
      TXMLHelper.Deserialize(ChildNode, TPagueLeveItem, Deserializers).QueryInterface(GetTypeData(TypeInfo(IPagueLeveItem))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TPautaDoProdutoListDeserializer }

class function TPautaDoProdutoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TPautaDoProdutoListDeserializer;
begin
  Deserializer := TPautaDoProdutoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TPautaDoProdutoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TPautaDoProdutoList;
  Item: IPautaDoProduto;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TPautaDoProdutoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TPautaDoProduto.Create;
      TXMLHelper.Deserialize(ChildNode, TPautaDoProduto, Deserializers).QueryInterface(GetTypeData(TypeInfo(IPautaDoProduto))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TPreAutorizacaoContaReceberListDeserializer }

class function TPreAutorizacaoContaReceberListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TPreAutorizacaoContaReceberListDeserializer;
begin
  Deserializer := TPreAutorizacaoContaReceberListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TPreAutorizacaoContaReceberListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TPreAutorizacaoContaReceberList;
  Item: IPreAutorizacaoContaReceber;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TPreAutorizacaoContaReceberList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TPreAutorizacaoContaReceber.Create;
      TXMLHelper.Deserialize(ChildNode, TPreAutorizacaoContaReceber, Deserializers).QueryInterface(GetTypeData(TypeInfo(IPreAutorizacaoContaReceber))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TPreAutorizacaoFormaDePagamentoListDeserializer }

class function TPreAutorizacaoFormaDePagamentoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TPreAutorizacaoFormaDePagamentoListDeserializer;
begin
  Deserializer := TPreAutorizacaoFormaDePagamentoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TPreAutorizacaoFormaDePagamentoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TPreAutorizacaoFormaDePagamentoList;
  Item: IPreAutorizacaoFormaDePagamento;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TPreAutorizacaoFormaDePagamentoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TPreAutorizacaoFormaDePagamento.Create;
      TXMLHelper.Deserialize(ChildNode, TPreAutorizacaoFormaDePagamento, Deserializers).QueryInterface(GetTypeData(TypeInfo(IPreAutorizacaoFormaDePagamento))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TPreAutorizacaoLiquidacaoListDeserializer }

class function TPreAutorizacaoLiquidacaoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TPreAutorizacaoLiquidacaoListDeserializer;
begin
  Deserializer := TPreAutorizacaoLiquidacaoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TPreAutorizacaoLiquidacaoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TPreAutorizacaoLiquidacaoList;
  Item: IPreAutorizacaoLiquidacao;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TPreAutorizacaoLiquidacaoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TPreAutorizacaoLiquidacao.Create;
      TXMLHelper.Deserialize(ChildNode, TPreAutorizacaoLiquidacao, Deserializers).QueryInterface(GetTypeData(TypeInfo(IPreAutorizacaoLiquidacao))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TPreAutorizacaoTituloReceberListDeserializer }

class function TPreAutorizacaoTituloReceberListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TPreAutorizacaoTituloReceberListDeserializer;
begin
  Deserializer := TPreAutorizacaoTituloReceberListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TPreAutorizacaoTituloReceberListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TPreAutorizacaoTituloReceberList;
  Item: IPreAutorizacaoTituloReceber;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TPreAutorizacaoTituloReceberList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TPreAutorizacaoTituloReceber.Create;
      TXMLHelper.Deserialize(ChildNode, TPreAutorizacaoTituloReceber, Deserializers).QueryInterface(GetTypeData(TypeInfo(IPreAutorizacaoTituloReceber))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TPrecoListDeserializer }

class function TPrecoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TPrecoListDeserializer;
begin
  Deserializer := TPrecoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TPrecoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TPrecoList;
  Item: IPreco;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TPrecoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TPreco.Create;
      TXMLHelper.Deserialize(ChildNode, TPreco, Deserializers).QueryInterface(GetTypeData(TypeInfo(IPreco))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TPremiacaoListDeserializer }

class function TPremiacaoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TPremiacaoListDeserializer;
begin
  Deserializer := TPremiacaoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TPremiacaoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TPremiacaoList;
  Item: IPremiacao;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TPremiacaoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TPremiacao.Create;
      TXMLHelper.Deserialize(ChildNode, TPremiacao, Deserializers).QueryInterface(GetTypeData(TypeInfo(IPremiacao))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TPremioLojaListDeserializer }

class function TPremioLojaListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TPremioLojaListDeserializer;
begin
  Deserializer := TPremioLojaListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TPremioLojaListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TPremioLojaList;
  Item: IPremioLoja;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TPremioLojaList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TPremioLoja.Create;
      TXMLHelper.Deserialize(ChildNode, TPremioLoja, Deserializers).QueryInterface(GetTypeData(TypeInfo(IPremioLoja))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TProdutoListDeserializer }

class function TProdutoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TProdutoListDeserializer;
begin
  Deserializer := TProdutoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TProdutoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TProdutoList;
  Item: IProduto;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TProdutoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TProduto.Create;
      TXMLHelper.Deserialize(ChildNode, TProduto, Deserializers).QueryInterface(GetTypeData(TypeInfo(IProduto))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TProdutoDaPremiacaoListDeserializer }

class function TProdutoDaPremiacaoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TProdutoDaPremiacaoListDeserializer;
begin
  Deserializer := TProdutoDaPremiacaoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TProdutoDaPremiacaoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TProdutoDaPremiacaoList;
  Item: IProdutoDaPremiacao;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TProdutoDaPremiacaoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TProdutoDaPremiacao.Create;
      TXMLHelper.Deserialize(ChildNode, TProdutoDaPremiacao, Deserializers).QueryInterface(GetTypeData(TypeInfo(IProdutoDaPremiacao))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TProdutoPrincipalListDeserializer }

class function TProdutoPrincipalListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TProdutoPrincipalListDeserializer;
begin
  Deserializer := TProdutoPrincipalListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TProdutoPrincipalListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TProdutoPrincipalList;
  Item: IProdutoPrincipal;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TProdutoPrincipalList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TProdutoPrincipal.Create;
      TXMLHelper.Deserialize(ChildNode, TProdutoPrincipal, Deserializers).QueryInterface(GetTypeData(TypeInfo(IProdutoPrincipal))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TProdutoPromocionalListDeserializer }

class function TProdutoPromocionalListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TProdutoPromocionalListDeserializer;
begin
  Deserializer := TProdutoPromocionalListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TProdutoPromocionalListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TProdutoPromocionalList;
  Item: IProdutoPromocional;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TProdutoPromocionalList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TProdutoPromocional.Create;
      TXMLHelper.Deserialize(ChildNode, TProdutoPromocional, Deserializers).QueryInterface(GetTypeData(TypeInfo(IProdutoPromocional))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TRamoListDeserializer }

class function TRamoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TRamoListDeserializer;
begin
  Deserializer := TRamoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TRamoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TRamoList;
  Item: IRamo;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TRamoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TRamo.Create;
      TXMLHelper.Deserialize(ChildNode, TRamo, Deserializers).QueryInterface(GetTypeData(TypeInfo(IRamo))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TRecebimentoListDeserializer }

class function TRecebimentoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TRecebimentoListDeserializer;
begin
  Deserializer := TRecebimentoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TRecebimentoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TRecebimentoList;
  Item: IRecebimento;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TRecebimentoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TRecebimento.Create;
      TXMLHelper.Deserialize(ChildNode, TRecebimento, Deserializers).QueryInterface(GetTypeData(TypeInfo(IRecebimento))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TReceitaListDeserializer }

class function TReceitaListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TReceitaListDeserializer;
begin
  Deserializer := TReceitaListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TReceitaListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TReceitaList;
  Item: IReceita;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TReceitaList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TReceita.Create;
      TXMLHelper.Deserialize(ChildNode, TReceita, Deserializers).QueryInterface(GetTypeData(TypeInfo(IReceita))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TReducaoListDeserializer }

class function TReducaoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TReducaoListDeserializer;
begin
  Deserializer := TReducaoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TReducaoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TReducaoList;
  Item: IReducao;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TReducaoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TReducao.Create;
      TXMLHelper.Deserialize(ChildNode, TReducao, Deserializers).QueryInterface(GetTypeData(TypeInfo(IReducao))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TReducaoComissaoListDeserializer }

class function TReducaoComissaoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TReducaoComissaoListDeserializer;
begin
  Deserializer := TReducaoComissaoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TReducaoComissaoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TReducaoComissaoList;
  Item: IReducaoComissao;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TReducaoComissaoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TReducaoComissao.Create;
      TXMLHelper.Deserialize(ChildNode, TReducaoComissao, Deserializers).QueryInterface(GetTypeData(TypeInfo(IReducaoComissao))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TReferenciaListDeserializer }

class function TReferenciaListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TReferenciaListDeserializer;
begin
  Deserializer := TReferenciaListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TReferenciaListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TReferenciaList;
  Item: IReferencia;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TReferenciaList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TReferencia.Create;
      TXMLHelper.Deserialize(ChildNode, TReferencia, Deserializers).QueryInterface(GetTypeData(TypeInfo(IReferencia))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TReferenciaDoFornecedorListDeserializer }

class function TReferenciaDoFornecedorListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TReferenciaDoFornecedorListDeserializer;
begin
  Deserializer := TReferenciaDoFornecedorListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TReferenciaDoFornecedorListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TReferenciaDoFornecedorList;
  Item: IReferenciaDoFornecedor;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TReferenciaDoFornecedorList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TReferenciaDoFornecedor.Create;
      TXMLHelper.Deserialize(ChildNode, TReferenciaDoFornecedor, Deserializers).QueryInterface(GetTypeData(TypeInfo(IReferenciaDoFornecedor))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TRegimeEstadualProdutoListDeserializer }

class function TRegimeEstadualProdutoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TRegimeEstadualProdutoListDeserializer;
begin
  Deserializer := TRegimeEstadualProdutoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TRegimeEstadualProdutoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TRegimeEstadualProdutoList;
  Item: IRegimeEstadualProduto;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TRegimeEstadualProdutoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TRegimeEstadualProduto.Create;
      TXMLHelper.Deserialize(ChildNode, TRegimeEstadualProduto, Deserializers).QueryInterface(GetTypeData(TypeInfo(IRegimeEstadualProduto))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TRegimeEstadualTributarioListDeserializer }

class function TRegimeEstadualTributarioListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TRegimeEstadualTributarioListDeserializer;
begin
  Deserializer := TRegimeEstadualTributarioListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TRegimeEstadualTributarioListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TRegimeEstadualTributarioList;
  Item: IRegimeEstadualTributario;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TRegimeEstadualTributarioList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TRegimeEstadualTributario.Create;
      TXMLHelper.Deserialize(ChildNode, TRegimeEstadualTributario, Deserializers).QueryInterface(GetTypeData(TypeInfo(IRegimeEstadualTributario))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TSaidaOperadorListDeserializer }

class function TSaidaOperadorListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TSaidaOperadorListDeserializer;
begin
  Deserializer := TSaidaOperadorListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TSaidaOperadorListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TSaidaOperadorList;
  Item: ISaidaOperador;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TSaidaOperadorList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TSaidaOperador.Create;
      TXMLHelper.Deserialize(ChildNode, TSaidaOperador, Deserializers).QueryInterface(GetTypeData(TypeInfo(ISaidaOperador))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TSangriaListDeserializer }

class function TSangriaListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TSangriaListDeserializer;
begin
  Deserializer := TSangriaListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TSangriaListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TSangriaList;
  Item: ISangria;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TSangriaList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TSangria.Create;
      TXMLHelper.Deserialize(ChildNode, TSangria, Deserializers).QueryInterface(GetTypeData(TypeInfo(ISangria))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TSecaoListDeserializer }

class function TSecaoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TSecaoListDeserializer;
begin
  Deserializer := TSecaoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TSecaoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TSecaoList;
  Item: ISecao;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TSecaoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TSecao.Create;
      TXMLHelper.Deserialize(ChildNode, TSecao, Deserializers).QueryInterface(GetTypeData(TypeInfo(ISecao))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TSetorListDeserializer }

class function TSetorListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TSetorListDeserializer;
begin
  Deserializer := TSetorListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TSetorListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TSetorList;
  Item: ISetor;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TSetorList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TSetor.Create;
      TXMLHelper.Deserialize(ChildNode, TSetor, Deserializers).QueryInterface(GetTypeData(TypeInfo(ISetor))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TSituacaoFiscalListDeserializer }

class function TSituacaoFiscalListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TSituacaoFiscalListDeserializer;
begin
  Deserializer := TSituacaoFiscalListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TSituacaoFiscalListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TSituacaoFiscalList;
  Item: ISituacaoFiscal;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TSituacaoFiscalList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TSituacaoFiscal.Create;
      TXMLHelper.Deserialize(ChildNode, TSituacaoFiscal, Deserializers).QueryInterface(GetTypeData(TypeInfo(ISituacaoFiscal))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TStatusDoClienteListDeserializer }

class function TStatusDoClienteListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TStatusDoClienteListDeserializer;
begin
  Deserializer := TStatusDoClienteListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TStatusDoClienteListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TStatusDoClienteList;
  Item: IStatusDoCliente;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TStatusDoClienteList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TStatusDoCliente.Create;
      TXMLHelper.Deserialize(ChildNode, TStatusDoCliente, Deserializers).QueryInterface(GetTypeData(TypeInfo(IStatusDoCliente))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TSubGrupoListDeserializer }

class function TSubGrupoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TSubGrupoListDeserializer;
begin
  Deserializer := TSubGrupoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TSubGrupoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TSubGrupoList;
  Item: ISubGrupo;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TSubGrupoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TSubGrupo.Create;
      TXMLHelper.Deserialize(ChildNode, TSubGrupo, Deserializers).QueryInterface(GetTypeData(TypeInfo(ISubGrupo))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TTabelaTributariaListDeserializer }

class function TTabelaTributariaListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TTabelaTributariaListDeserializer;
begin
  Deserializer := TTabelaTributariaListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TTabelaTributariaListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TTabelaTributariaList;
  Item: ITabelaTributaria;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TTabelaTributariaList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TTabelaTributaria.Create;
      TXMLHelper.Deserialize(ChildNode, TTabelaTributaria, Deserializers).QueryInterface(GetTypeData(TypeInfo(ITabelaTributaria))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TTipoDocumentoListDeserializer }

class function TTipoDocumentoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TTipoDocumentoListDeserializer;
begin
  Deserializer := TTipoDocumentoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TTipoDocumentoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TTipoDocumentoList;
  Item: ITipoDocumento;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TTipoDocumentoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TTipoDocumento.Create;
      TXMLHelper.Deserialize(ChildNode, TTipoDocumento, Deserializers).QueryInterface(GetTypeData(TypeInfo(ITipoDocumento))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TTipoPagamentoListDeserializer }

class function TTipoPagamentoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TTipoPagamentoListDeserializer;
begin
  Deserializer := TTipoPagamentoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TTipoPagamentoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TTipoPagamentoList;
  Item: ITipoPagamento;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TTipoPagamentoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TTipoPagamento.Create;
      TXMLHelper.Deserialize(ChildNode, TTipoPagamento, Deserializers).QueryInterface(GetTypeData(TypeInfo(ITipoPagamento))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TTituloAReceberListDeserializer }

class function TTituloAReceberListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TTituloAReceberListDeserializer;
begin
  Deserializer := TTituloAReceberListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TTituloAReceberListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TTituloAReceberList;
  Item: ITituloAReceber;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TTituloAReceberList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TTituloAReceber.Create;
      TXMLHelper.Deserialize(ChildNode, TTituloAReceber, Deserializers).QueryInterface(GetTypeData(TypeInfo(ITituloAReceber))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TTituloAReceberCancelamentoListDeserializer }

class function TTituloAReceberCancelamentoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TTituloAReceberCancelamentoListDeserializer;
begin
  Deserializer := TTituloAReceberCancelamentoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TTituloAReceberCancelamentoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TTituloAReceberCancelamentoList;
  Item: ITituloAReceberCancelamento;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TTituloAReceberCancelamentoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TTituloAReceberCancelamento.Create;
      TXMLHelper.Deserialize(ChildNode, TTituloAReceberCancelamento, Deserializers).QueryInterface(GetTypeData(TypeInfo(ITituloAReceberCancelamento))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TTituloAReceberEstornoListDeserializer }

class function TTituloAReceberEstornoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TTituloAReceberEstornoListDeserializer;
begin
  Deserializer := TTituloAReceberEstornoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TTituloAReceberEstornoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TTituloAReceberEstornoList;
  Item: ITituloAReceberEstorno;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TTituloAReceberEstornoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TTituloAReceberEstorno.Create;
      TXMLHelper.Deserialize(ChildNode, TTituloAReceberEstorno, Deserializers).QueryInterface(GetTypeData(TypeInfo(ITituloAReceberEstorno))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TTituloAReceberLiquidacaoListDeserializer }

class function TTituloAReceberLiquidacaoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TTituloAReceberLiquidacaoListDeserializer;
begin
  Deserializer := TTituloAReceberLiquidacaoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TTituloAReceberLiquidacaoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TTituloAReceberLiquidacaoList;
  Item: ITituloAReceberLiquidacao;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TTituloAReceberLiquidacaoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TTituloAReceberLiquidacao.Create;
      TXMLHelper.Deserialize(ChildNode, TTituloAReceberLiquidacao, Deserializers).QueryInterface(GetTypeData(TypeInfo(ITituloAReceberLiquidacao))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TTituloNaoLiquidadoListDeserializer }

class function TTituloNaoLiquidadoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TTituloNaoLiquidadoListDeserializer;
begin
  Deserializer := TTituloNaoLiquidadoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TTituloNaoLiquidadoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TTituloNaoLiquidadoList;
  Item: ITituloNaoLiquidado;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TTituloNaoLiquidadoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TTituloNaoLiquidado.Create;
      TXMLHelper.Deserialize(ChildNode, TTituloNaoLiquidado, Deserializers).QueryInterface(GetTypeData(TypeInfo(ITituloNaoLiquidado))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TTituloNaoLiquidadoMapListDeserializer }

class function TTituloNaoLiquidadoMapListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TTituloNaoLiquidadoMapListDeserializer;
begin
  Deserializer := TTituloNaoLiquidadoMapListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TTituloNaoLiquidadoMapListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TTituloNaoLiquidadoMapList;
  Item: ITituloNaoLiquidadoMap;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TTituloNaoLiquidadoMapList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TTituloNaoLiquidadoMap.Create;
      TXMLHelper.Deserialize(ChildNode, TTituloNaoLiquidadoMap, Deserializers).QueryInterface(GetTypeData(TypeInfo(ITituloNaoLiquidadoMap))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TTransacaoConvenioListDeserializer }

class function TTransacaoConvenioListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TTransacaoConvenioListDeserializer;
begin
  Deserializer := TTransacaoConvenioListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TTransacaoConvenioListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TTransacaoConvenioList;
  Item: ITransacaoConvenio;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TTransacaoConvenioList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TTransacaoConvenio.Create;
      TXMLHelper.Deserialize(ChildNode, TTransacaoConvenio, Deserializers).QueryInterface(GetTypeData(TypeInfo(ITransacaoConvenio))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TTransacaoItemTefListDeserializer }

class function TTransacaoItemTefListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TTransacaoItemTefListDeserializer;
begin
  Deserializer := TTransacaoItemTefListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TTransacaoItemTefListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TTransacaoItemTefList;
  Item: ITransacaoItemTef;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TTransacaoItemTefList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TTransacaoItemTef.Create;
      TXMLHelper.Deserialize(ChildNode, TTransacaoItemTef, Deserializers).QueryInterface(GetTypeData(TypeInfo(ITransacaoItemTef))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TTransacaoTefListDeserializer }

class function TTransacaoTefListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TTransacaoTefListDeserializer;
begin
  Deserializer := TTransacaoTefListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TTransacaoTefListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TTransacaoTefList;
  Item: ITransacaoTef;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TTransacaoTefList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TTransacaoTef.Create;
      TXMLHelper.Deserialize(ChildNode, TTransacaoTef, Deserializers).QueryInterface(GetTypeData(TypeInfo(ITransacaoTef))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TTributacaoListDeserializer }

class function TTributacaoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TTributacaoListDeserializer;
begin
  Deserializer := TTributacaoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TTributacaoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TTributacaoList;
  Item: ITributacao;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TTributacaoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TTributacao.Create;
      TXMLHelper.Deserialize(ChildNode, TTributacao, Deserializers).QueryInterface(GetTypeData(TypeInfo(ITributacao))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TTrocaListDeserializer }

class function TTrocaListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TTrocaListDeserializer;
begin
  Deserializer := TTrocaListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TTrocaListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TTrocaList;
  Item: ITroca;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TTrocaList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TTroca.Create;
      TXMLHelper.Deserialize(ChildNode, TTroca, Deserializers).QueryInterface(GetTypeData(TypeInfo(ITroca))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TTrocaFormaPagamentoListDeserializer }

class function TTrocaFormaPagamentoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TTrocaFormaPagamentoListDeserializer;
begin
  Deserializer := TTrocaFormaPagamentoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TTrocaFormaPagamentoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TTrocaFormaPagamentoList;
  Item: ITrocaFormaPagamento;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TTrocaFormaPagamentoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TTrocaFormaPagamento.Create;
      TXMLHelper.Deserialize(ChildNode, TTrocaFormaPagamento, Deserializers).QueryInterface(GetTypeData(TypeInfo(ITrocaFormaPagamento))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TUnidadeProdutoListDeserializer }

class function TUnidadeProdutoListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TUnidadeProdutoListDeserializer;
begin
  Deserializer := TUnidadeProdutoListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TUnidadeProdutoListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TUnidadeProdutoList;
  Item: IUnidadeProduto;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TUnidadeProdutoList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TUnidadeProduto.Create;
      TXMLHelper.Deserialize(ChildNode, TUnidadeProduto, Deserializers).QueryInterface(GetTypeData(TypeInfo(IUnidadeProduto))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TUsuarioListDeserializer }

class function TUsuarioListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TUsuarioListDeserializer;
begin
  Deserializer := TUsuarioListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TUsuarioListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TUsuarioList;
  Item: IUsuario;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TUsuarioList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TUsuario.Create;
      TXMLHelper.Deserialize(ChildNode, TUsuario, Deserializers).QueryInterface(GetTypeData(TypeInfo(IUsuario))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TVendaListDeserializer }

class function TVendaListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TVendaListDeserializer;
begin
  Deserializer := TVendaListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TVendaListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TVendaList;
  Item: IVenda;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TVendaList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TVenda.Create;
      TXMLHelper.Deserialize(ChildNode, TVenda, Deserializers).QueryInterface(GetTypeData(TypeInfo(IVenda))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

{ TVendaCasadaListDeserializer }

class function TVendaCasadaListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TVendaCasadaListDeserializer;
begin
  Deserializer := TVendaCasadaListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TVendaCasadaListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: TVendaCasadaList;
  Item: IVendaCasada;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := TVendaCasadaList.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := TVendaCasada.Create;
      TXMLHelper.Deserialize(ChildNode, TVendaCasada, Deserializers).QueryInterface(GetTypeData(TypeInfo(IVendaCasada))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;

end.


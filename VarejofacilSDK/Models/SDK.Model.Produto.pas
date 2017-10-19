unit SDK.Model.Produto;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums, SDK.Model.RegimeEstadualProduto, SDK.Model.ItemImpostoFederal,
  SDK.Model.PautaDoProduto, SDK.Model.EstoqueDoProduto;

type

  IProduto = interface(IModel)
    ['{48A4F7F9-2328-4F1A-9689-37C018CA8F44}']
    function GetId: Variant;
    procedure SetId(const AId: Variant);
    function GetProdutoDestinoId: Variant;
    procedure SetProdutoDestinoId(const AProdutoDestinoId: Variant);
    function GetSubGrupoId: Variant;
    procedure SetSubgrupoId(const ASubGrupoId: Variant);
    function GetGrupoId: Variant;
    procedure SetGrupoId(const AGrupoId: Variant);
    function GetSecaoId: Integer;
    procedure SetSecaoId(const ASecaoId: Integer);
    function GetNaturezaDeImpostoFederalId: Variant;
    procedure SetNaturezaDeImpostoFederalId(const ANaturezaDeImpostoFederalId: Variant);
    function GetCest: Int64;
    procedure SetCest(const ACest: Int64);
    function GetQuantidadeEtiqueta: Integer;
    procedure SetQuantidadeEtiqueta(const AQuantidadeEtiqueta: Integer);
    function GetDiasDeSeguranca: Integer;
    procedure SetDiasDeSeguranca(const ADiasDeSeguranca: Integer);
    function GetCodigoInterno: TString;
    procedure SetCodigoInterno(const ACodigoInterno: TString);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetDescricaoReduzida: TString;
    procedure SetDescricaoReduzida(const ADescricaoReduzida: TString);
    function GetTributacaoId: TString;
    procedure SetTributacaoId(const ATributacaoId: TString);
    function GetUnidadeDeTransferencia: TString;
    procedure SetUnidadeDeTransferencia(const AUnidadeDeTransferencia: TString);
    function GetValidade: TString;
    procedure SetValidade(const AValidade: TString);
    function GetControlaNumeroSerie: Boolean;
    procedure SetControlaNumeroSerie(const AControlaNumeroSerie: Boolean);
    function GetTabelaA: TTabelaA;
    procedure SetTabelaA(const ATabelaA: TTabelaA);
    function GetTipoBonificacao: TTipoBonificacao;
    procedure SetTipoBonificacao(const ATipoBonificacao: TTipoBonificacao);
    function GetControlaEstoque: Boolean;
    procedure SetControlaEstoque(const AControlaEstoque: Boolean);
    function GetAssociacao: TAssociacao;
    procedure SetAssociacao(const AAssociacao: TAssociacao);
    function GetComposicao: TComposicao;
    procedure SetComposicao(const AComposicao: TComposicao);
    function GetControlaValidade: Boolean;
    procedure SetControlaValidade(const AControlaValidade: Boolean);
    function GetEnviaBalanca: Boolean;
    procedure SetEnviaBalanca(const AEnviaBalanca: Boolean);
    function GetMix: TString;
    procedure SetMix(const AMix: TString);
    function GetDescricaoVariavel: Boolean;
    procedure SetDescricaoVariavel(const ADescricaoVariavel: Boolean);
    function GetEndereco: TString;
    procedure SetEndereco(const AEndereco: TString);
    function GetForaDeLinha: TString;
    procedure SetForaDeLinha(const AForaDeLinha: TString);
    function GetUnidadeDeCompra: TString;
    procedure SetUnidadeDeCompra(const AUnidadeDeCompra: TString);
    function GetUnidadeDeReferencia: TString;
    procedure SetUnidadeDeReferencia(const AUnidadeDeReferencia: TString);
    function GetCodigoANP: TString;
    procedure SetCodigoANP(const ACodigoANP: TString);
    function GetTipoIPI: TTipoIPI;
    procedure SetTipoIPI(const ATipoIPI: TTipoIPI);
    function GetTipoAgregacao: TTipoAgregacao;
    procedure SetTipoAgregacao(const ATipoAgregacao: TTipoAgregacao);
    function GetPrecoVariavel: Boolean;
    procedure SetPrecoVariavel(const APrecoVariavel: Boolean);
    function GetIndiceAT: TIndiceAT;
    procedure SetIndiceAT(const AIndiceAT: TIndiceAT);
    function GetProducao: TProducao;
    procedure SetProducao(const AProducao: TProducao);
    function GetNomeclaturaMercosulId: TString;
    procedure SetNomeclaturaMercosulId(const ANomeclaturaMercosulId: TString);
    function GetNomeclaturaMercosulExcecaoId: TString;
    procedure SetNomeclaturaMercosulExcecaoId(const ANomeclaturaMercosulExcecaoId: TString);
    function GetFinalidadeProduto: TFinalidadeProduto;
    procedure SetFinalidadeProduto(const AFinalidadeProduto: TFinalidadeProduto);
    function GetModelo: TString;
    procedure SetModelo(const AModelo: TString);
    function GetIdentificadorDeOrigem: TString;
    procedure SetIdentificadorDeOrigem(const AIdentificadorDeOrigem: TString);
    function GetIncentivoZonaFranca: TString;
    procedure SetIncentivoZonaFranca(const AIncentivoZonaFranca: TString);
    function GetImagem: TString;
    procedure SetImagem(const AImagem: TString);
    function GetAltura: TString;
    procedure SetAltura(const AAltura: TString);
    function GetLargura: TString;
    procedure SetLargura(const ALargura: TString);
    function GetComprimento: TString;
    procedure SetComprimento(const AComprimento: TString);
    function GetUnidadeDeVenda: TString;
    procedure SetUnidadeDeVenda(const AUnidadeDeVenda: TString);
    function GetNaturezaId: Variant;
    procedure SetNaturezaId(const ANaturezaId: Variant);
    function GetTextoDaReceita: TString;
    procedure SetTextoDaReceita(const ATextoDaReceita: TString);
    function GetPermiteDesconto: Boolean;
    procedure SetPermiteDesconto(const APermiteDesconto: Boolean);
    function GetCompoeTotalDaNota: Boolean;
    procedure SetCompoeTotalDaNota(const ACompoeTotalDaNota: Boolean);
    function GetAtivoNoEcommerce: Boolean;
    procedure SetAtivoNoEcommerce(const AAtivoNoEcommerce: Boolean);
    function GetAtualizaFamilia: Boolean;
    procedure SetAtualizaFamilia(const AAtualizaFamilia: Boolean);
    function GetFrenteLoja: Boolean;
    procedure SetFrenteLoja(const AFrenteLoja: Boolean);
    function GetItensEmbalagem: Double;
    procedure SetItensEmbalagem(const AItensEmbalagem: Double);
    function GetItensEmbalagemVenda: Double;
    procedure SetItensEmbalagemVenda(const AItensEmbalagemVenda: Double);
    function GetItensEmbalagemTransferencia: Double;
    procedure SetItensEmbalagemTransferencia(const AItensEmbalagemTransferencia: Double);
    function GetCustoMedio: Double;
    procedure SetCustoMedio(const ACustoMedio: Double);
    function GetQtdMaximaVenda: Double;
    procedure SetQtdMaximaVenda(const AQtdMaximaVenda: Double);
    function GetPesoBruto: Double;
    procedure SetPesoBruto(const APesoBruto: Double);
    function GetPesoLiquido: Double;
    procedure SetPesoLiquido(const APesoLiquido: Double);
    function GetFatorBonificacao: Double;
    procedure SetFatorBonificacao(const AFatorBonificacao: Double);
    function GetMedidaReferencial: Double;
    procedure SetMedidaReferencial(const AMedidaReferencial: Double);
    function GetIpi: Double;
    procedure SetIpi(const AIpi: Double);
    function GetValorAgregacao: Double;
    procedure SetValorAgregacao(const AValorAgregacao: Double);
    function GetPercentualPerda: Double;
    procedure SetPercentualPerda(const APercentualPerda: Double);
    function GetFatorRendimentoUnidade: Double;
    procedure SetFatorRendimentoUnidade(const AFatorRendimentoUnidade: Double);
    function GetFatorRendimentoCusto: Double;
    procedure SetFatorRendimentoCusto(const AFatorRendimentoCusto: Double);
    function GetDescontoMaximo1: Double;
    procedure SetDescontoMaximo1(const ADescontoMaximo1: Double);
    function GetDescontoMaximo2: Double;
    procedure SetDescontoMaximo2(const ADescontoMaximo2: Double);
    function GetDescontoMaximo3: Double;
    procedure SetDescontoMaximo3(const ADescontoMaximo3: Double);
    function GetIncidenciaIPI: TIncidenciaIPI;
    procedure SetIncidenciaIPI(const AIncidenciaIPI: TIncidenciaIPI);
    function GetDataInclusao: TDateTime;
    procedure SetDataInclusao(const ADataInclusao: TDateTime);
    function GetDataSaida: TDateTime;
    procedure SetDataSaida(const ADataSaida: TDateTime);
    function GetTipoFatorKit: TTipoFator;
    procedure SetTipoFatorKit(const ATipoFatorKit: TTipoFator);
    function GetBaixaNaVendaComposto: Boolean;
    procedure SetBaixaNaVendaComposto(const ABaixaNaVendaComposto: Boolean);
    function GetQuantidadeComposto: Variant;
    procedure SetQuantidadeComposto(const AQuantidadeComposto: Variant);
    function GetComissaoCapitacao: Double;
    procedure SetComissaoCapitacao(const AComissaoCapitacao: Double);
    function GetComissaoProducao: Double;
    procedure SetComissaoProducao(const AComissaoProducao: Double);
    function GetComissaoVenda: Double;
    procedure SetComissaoVenda(const AComissaoVenda: Double);
    function GetPagaComissao: Boolean;
    procedure SetPagaComissao(const APagaComissao: Boolean);
    function GetPesoVariavel: TPesoVariavel;
    procedure SetPesoVariavel(const APesoVariavel: TPesoVariavel);
    function GetGeneroId: Variant;
    procedure SetGeneroId(const AGeneroId: Variant);
    function GetMarcaId: Variant;
    procedure SetMarcaId(const AMarcaId: Variant);
    function GetSituacaoFiscalId: Variant;
    procedure SetSituacaoFiscalId(const ASituacaoFiscalId: Variant);
    function GetSituacaoFiscalSaidaId: Variant;
    procedure SetSituacaoFiscalSaidaId(const ASituacaoFiscalSaidaId: Variant);
    function GetFuncionarioId: Variant;
    procedure SetFuncionarioId(const AFuncionarioId: Variant);
    function GetFornecedorId: Variant;
    procedure SetFornecedorId(const AFornecedorId: Variant);
    function GetLocalDeImpressaoId: Variant;
    procedure SetLocalDeImpressaoId(const ALocalDeImpressaoId: Variant);
    function GetAplicacoesIds: TLongList;
    procedure SetAplicacoesIds(const AAplicacoesIds: TLongList);
    function GetCaracteristicasIds: TLongList;
    procedure SetCaracteristicasIds(const ACaracteristicasIds: TLongList);
    function GetRegimesDoProduto: TRegimeEstadualProdutoList;
    procedure SetRegimesDoProduto(const ARegimesDoProduto: TRegimeEstadualProdutoList);
    function GetItensImpostosFederais: TItemImpostoFederalList;
    procedure SetItensImpostosFederais(const AItensImpostosFederais: TItemImpostoFederalList);
    function GetPautasDoProduto: TPautaDoProdutoList;
    procedure SetPautasDoProduto(const APautasDoProduto: TPautaDoProdutoList);
    function GetEstoqueDoProduto: TEstoqueDoProdutoList;
    procedure SetEstoqueDoProduto(const AEstoqueDoProduto: TEstoqueDoProdutoList);
    property Id: Variant read GetId write SetId;
    property ProdutoDestinoId: Variant read GetProdutoDestinoId write SetProdutoDestinoId;
    property SubGrupoId: Variant read GetSubgrupoId write SetSubgrupoId;
    property GrupoId: Variant read GetGrupoId write SetGrupoId;
    property SecaoId: Integer read GetSecaoId write SetSecaoId;
    property NaturezaDeImpostoFederalId: Variant read GetNaturezaDeImpostoFederalId write SetNaturezaDeImpostoFederalId;
    property Cest: Int64 read GetCest write SetCest;
    property QuantidadeEtiqueta: Integer read GetQuantidadeEtiqueta write SetQuantidadeEtiqueta;
    property DiasDeSeguranca: Integer read GetDiasDeSeguranca write SetDiasDeSeguranca;
    property CodigoInterno: TString read GetCodigoInterno write SetCodigoInterno;
    property Descricao: TString read GetDescricao write SetDescricao;
    property DescricaoReduzida: TString read GetDescricaoReduzida write SetDescricaoReduzida;
    property TributacaoId: TString read GetTributacaoId write SetTributacaoId;
    property UnidadeDeTransferencia: TString read GetUnidadeDeTransferencia write SetUnidadeDeTransferencia;
    property Validade: TString read GetValidade write SetValidade;
    property ControlaNumeroSerie: Boolean read GetControlaNumeroSerie write SetControlaNumeroSerie;
    property TabelaA: TTabelaA read GetTabelaA write SetTabelaA;
    property TipoBonificacao: TTipoBonificacao read GetTipoBonificacao write SetTipoBonificacao;
    property ControlaEstoque: Boolean read GetControlaEstoque write SetControlaEstoque;
    property Associacao: TAssociacao read GetAssociacao write SetAssociacao;
    property Composicao: TComposicao read GetComposicao write SetComposicao;
    property ControlaValidade: Boolean read GetControlaValidade write SetControlaValidade;
    property EnviaBalanca: Boolean read GetEnviaBalanca write SetEnviaBalanca;
    property Mix: TString read GetMix write SetMix;
    property DescricaoVariavel: Boolean read GetDescricaoVariavel write SetDescricaoVariavel;
    property Endereco: TString read GetEndereco write SetEndereco;
    property ForaDeLinha: TString read GetForaDeLinha write SetForaDeLinha;
    property UnidadeDeCompra: TString read GetUnidadeDeCompra write SetUnidadeDeCompra;
    property UnidadeDeReferencia: TString read GetUnidadeDeReferencia write SetUnidadeDeReferencia;
    property CodigoANP: TString read GetCodigoANP write SetCodigoANP;
    property TipoIPI: TTipoIPI read GetTipoIPI write SetTipoIPI;
    property TipoAgregacao: TTipoAgregacao read GetTipoAgregacao write SetTipoAgregacao;
    property PrecoVariavel: Boolean read GetPrecoVariavel write SetPrecoVariavel;
    property IndiceAT: TIndiceAT read GetIndiceAT write SetIndiceAT;
    property Producao: TProducao read GetProducao write SetProducao;
    property NomeclaturaMercosulId: TString read GetNomeclaturaMercosulId write SetNomeclaturaMercosulId;
    property NomeclaturaMercosulExcecaoId: TString read GetNomeclaturaMercosulExcecaoId write SetNomeclaturaMercosulExcecaoId;
    property FinalidadeProduto: TFinalidadeProduto read GetFinalidadeProduto write SetFinalidadeProduto;
    property Modelo: TString read GetModelo write SetModelo;
    property IdentificadorDeOrigem: TString read GetIdentificadorDeOrigem write SetIdentificadorDeOrigem;
    property IncentivoZonaFranca: TString read GetIncentivoZonaFranca write SetIncentivoZonaFranca;
    property Imagem: TString read GetImagem write SetImagem;
    property Altura: TString read GetAltura write SetAltura;
    property Largura: TString read GetLargura write SetLargura;
    property Comprimento: TString read GetComprimento write SetComprimento;
    property UnidadeDeVenda: TString read GetUnidadeDeVenda write SetUnidadeDeVenda;
    property NaturezaId: Variant read GetNaturezaId write SetNaturezaId;
    property TextoDaReceita: TString read GetTextoDaReceita write SetTextoDaReceita;
    property PermiteDesconto: Boolean read GetPermiteDesconto write SetPermiteDesconto;
    property CompoeTotalDaNota: Boolean read GetCompoeTotalDaNota write SetCompoeTotalDaNota;
    property AtivoNoEcommerce: Boolean read GetAtivoNoEcommerce write SetAtivoNoEcommerce;
    property AtualizaFamilia: Boolean read GetAtualizaFamilia write SetAtualizaFamilia;
    property FrenteLoja: Boolean read GetFrenteLoja write SetFrenteLoja;
    property ItensEmbalagem: Double read GetItensEmbalagem write SetItensEmbalagem;
    property ItensEmbalagemVenda: Double read GetItensEmbalagemVenda write SetItensEmbalagemVenda;
    property ItensEmbalagemTransferencia: Double read GetItensEmbalagemTransferencia write SetItensEmbalagemTransferencia;
    property CustoMedio: Double read GetCustoMedio write SetCustoMedio;
    property QtdMaximaVenda: Double read GetQtdMaximaVenda write SetQtdMaximaVenda;
    property PesoBruto: Double read GetPesoBruto write SetPesoBruto;
    property PesoLiquido: Double read GetPesoLiquido write SetPesoLiquido;
    property FatorBonificacao: Double read GetFatorBonificacao write SetFatorBonificacao;
    property MedidaReferencial: Double read GetMedidaReferencial write SetMedidaReferencial;
    property Ipi: Double read GetIpi write SetIpi;
    property ValorAgregacao: Double read GetValorAgregacao write SetValorAgregacao;
    property PercentualPerda: Double read GetPercentualPerda write SetPercentualPerda;
    property FatorRendimentoUnidade: Double read GetFatorRendimentoUnidade write SetFatorRendimentoUnidade;
    property FatorRendimentoCusto: Double read GetFatorRendimentoCusto write SetFatorRendimentoCusto;
    property DescontoMaximo1: Double read GetDescontoMaximo1 write SetDescontoMaximo1;
    property DescontoMaximo2: Double read GetDescontoMaximo2 write SetDescontoMaximo2;
    property DescontoMaximo3: Double read GetDescontoMaximo3 write SetDescontoMaximo3;
    property IncidenciaIPI: TIncidenciaIPI read GetIncidenciaIPI write SetIncidenciaIPI;
    property DataInclusao: TDateTime read GetDataInclusao write SetDataInclusao;
    property DataSaida: TDateTime read GetDataSaida write SetDataSaida;
    property TipoFatorKit: TTipoFator read GetTipoFatorKit write SetTipoFatorKit;
    property BaixaNaVendaComposto: Boolean read GetBaixaNaVendaComposto write SetBaixaNaVendaComposto;
    property QuantidadeComposto: Variant read GetQuantidadeComposto write SetQuantidadeComposto;
    property ComissaoCapitacao: Double read GetComissaoCapitacao write SetComissaoCapitacao;
    property ComissaoProducao: Double read GetComissaoProducao write SetComissaoProducao;
    property ComissaoVenda: Double read GetComissaoVenda write SetComissaoVenda;
    property PagaComissao: Boolean read GetPagaComissao write SetPagaComissao;
    property PesoVariavel: TPesoVariavel read GetPesoVariavel write SetPesoVariavel;
    property GeneroId: Variant read GetGeneroId write SetGeneroId;
    property MarcaId: Variant read GetMarcaId write SetMarcaId;
    property SituacaoFiscalId: Variant read GetSituacaoFiscalId write SetSituacaoFiscalId;
    property SituacaoFiscalSaidaId: Variant read GetSituacaoFiscalSaidaId write SetSituacaoFiscalSaidaId;
    property FuncionarioId: Variant read GetFuncionarioId write SetFuncionarioId;
    property FornecedorId: Variant read GetFornecedorId write SetFornecedorId;
    property LocalDeImpressaoId: Variant read GetLocalDeImpressaoId write SetLocalDeImpressaoId;
    property AplicacoesIds: TLongList read GetAplicacoesIds write SetAplicacoesIds;
    property CaracteristicasIds: TLongList read GetCaracteristicasIds write SetCaracteristicasIds;
    property RegimesDoProduto: TRegimeEstadualProdutoList read GetRegimesDoProduto write SetRegimesDoProduto;
    property ItensImpostosFederais: TItemImpostoFederalList read GetItensImpostosFederais write SetItensImpostosFederais;
    property PautasDoProduto: TPautaDoProdutoList read GetPautasDoProduto write SetPautasDoProduto;
    property EstoqueDoProduto: TEstoqueDoProdutoList read GetEstoqueDoProduto write SetEstoqueDoProduto;
  end;

  TProdutoList = class;

  IProdutoList = interface
	['{AE9EA4A3-1D81-46B1-B842-4919304E8DFE}']
    function GetReference: TProdutoList;
    function GetItems(AIndex: Integer): IProduto;
    procedure SetItems(AIndex: Integer; const Value: IProduto);
    procedure Add(const AProduto: IProduto);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IProduto read GetItems write SetItems; default;
  end;

  TProdutoListEnumerator = class
  private
    FIndex: Integer;
    FProdutoList: TProdutoList;
  public
    constructor Create(AProdutoList: TProdutoList);
    function GetCurrent: IProduto; inline;
    function MoveNext: Boolean;
    property Current: IProduto read GetCurrent;
  end;

  TProdutoList = class(TInterfacedObject, IProdutoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IProduto;
    procedure SetItems(AIndex: Integer; const Value: IProduto);
  public
    constructor Create;
    procedure Add(const AProduto: IProduto);
    destructor Destroy; override;
    function GetEnumerator: TProdutoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TProdutoList;
    property Items[AIndex: Integer]: IProduto read GetItems write SetItems; default;
  end;

  TProdutoListRec = record
  private
    FList: IProdutoList;
  public
    class function Create(const AList: IProdutoList): TProdutoListRec; static;
    class operator Implicit(AListRec: TProdutoListRec): TProdutoList;
  end;

  TProduto = class(TInterfacedModel, IProduto)
  private
	FId: Variant;
	FProdutoDestinoId: Variant;
	FSubGrupoId: Variant;
	FGrupoId: Variant;
	FSecaoId: Integer;
	FNaturezaDeImpostoFederalId: Variant;
	FCest: Int64;
	FQuantidadeEtiqueta: Integer;
	FDiasDeSeguranca: Integer;
	FCodigoInterno: TString;
	FDescricao: TString;
	FDescricaoReduzida: TString;
	FTributacaoId: TString;
	FUnidadeDeTransferencia: TString;
	FValidade: TString;
	FControlaNumeroSerie: Boolean;
	FTabelaA: TTabelaA;
	FTipoBonificacao: TTipoBonificacao;
	FControlaEstoque: Boolean;
	FAssociacao: TAssociacao;
	FComposicao: TComposicao;
	FControlaValidade: Boolean;
	FEnviaBalanca: Boolean;
	FMix: TString;
	FDescricaoVariavel: Boolean;
	FEndereco: TString;
	FForaDeLinha: TString;
	FUnidadeDeCompra: TString;
	FUnidadeDeReferencia: TString;
	FCodigoANP: TString;
	FTipoIPI: TTipoIPI;
	FTipoAgregacao: TTipoAgregacao;
	FPrecoVariavel: Boolean;
	FIndiceAT: TIndiceAT;
	FProducao: TProducao;
	FNomeclaturaMercosulId: TString;
	FNomeclaturaMercosulExcecaoId: TString;
	FFinalidadeProduto: TFinalidadeProduto;
	FModelo: TString;
	FIdentificadorDeOrigem: TString;
	FIncentivoZonaFranca: TString;
	FImagem: TString;
	FAltura: TString;
	FLargura: TString;
	FComprimento: TString;
	FUnidadeDeVenda: TString;
	FNaturezaId: Variant;
	FTextoDaReceita: TString;
	FPermiteDesconto: Boolean;
	FCompoeTotalDaNota: Boolean;
	FAtivoNoEcommerce: Boolean;
	FAtualizaFamilia: Boolean;
	FFrenteLoja: Boolean;
	FItensEmbalagem: Double;
	FItensEmbalagemVenda: Double;
	FItensEmbalagemTransferencia: Double;
	FCustoMedio: Double;
	FQtdMaximaVenda: Double;
	FPesoBruto: Double;
	FPesoLiquido: Double;
	FFatorBonificacao: Double;
	FMedidaReferencial: Double;
	FIpi: Double;
	FValorAgregacao: Double;
	FPercentualPerda: Double;
	FFatorRendimentoUnidade: Double;
	FFatorRendimentoCusto: Double;
	FDescontoMaximo1: Double;
	FDescontoMaximo2: Double;
	FDescontoMaximo3: Double;
	FIncidenciaIPI: TIncidenciaIPI;
	FDataInclusao: TDateTime;
	FDataSaida: TDateTime;
	FTipoFatorKit: TTipoFator;
	FBaixaNaVendaComposto: Boolean;
	FQuantidadeComposto: Variant;
	FComissaoCapitacao: Double;
	FComissaoProducao: Double;
	FComissaoVenda: Double;
	FPagaComissao: Boolean;
	FPesoVariavel: TPesoVariavel;
	FGeneroId: Variant;
	FMarcaId: Variant;
	FSituacaoFiscalId: Variant;
	FSituacaoFiscalSaidaId: Variant;
	FFuncionarioId: Variant;
	FFornecedorId: Variant;
	FLocalDeImpressaoId: Variant;
	FAplicacoesIds: TLongList;
	FCaracteristicasIds: TLongList;
	FRegimesDoProduto: TRegimeEstadualProdutoList;
	FItensImpostosFederais: TItemImpostoFederalList;
	FPautasDoProduto: TPautaDoProdutoList;
	FEstoqueDoProduto: TEstoqueDoProdutoList;
    function GetId: Variant;
    procedure SetId(const AId: Variant);
    function GetProdutoDestinoId: Variant;
    procedure SetProdutoDestinoId(const AProdutoDestinoId: Variant);
    function GetSubGrupoId: Variant;
    procedure SetSubgrupoId(const ASubGrupoId: Variant);
    function GetGrupoId: Variant;
    procedure SetGrupoId(const AGrupoId: Variant);
    function GetSecaoId: Integer;
    procedure SetSecaoId(const ASecaoId: Integer);
    function GetNaturezaDeImpostoFederalId: Variant;
    procedure SetNaturezaDeImpostoFederalId(const ANaturezaDeImpostoFederalId: Variant);
    function GetCest: Int64;
    procedure SetCest(const ACest: Int64);
    function GetQuantidadeEtiqueta: Integer;
    procedure SetQuantidadeEtiqueta(const AQuantidadeEtiqueta: Integer);
    function GetDiasDeSeguranca: Integer;
    procedure SetDiasDeSeguranca(const ADiasDeSeguranca: Integer);
    function GetCodigoInterno: TString;
    procedure SetCodigoInterno(const ACodigoInterno: TString);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetDescricaoReduzida: TString;
    procedure SetDescricaoReduzida(const ADescricaoReduzida: TString);
    function GetTributacaoId: TString;
    procedure SetTributacaoId(const ATributacaoId: TString);
    function GetUnidadeDeTransferencia: TString;
    procedure SetUnidadeDeTransferencia(const AUnidadeDeTransferencia: TString);
    function GetValidade: TString;
    procedure SetValidade(const AValidade: TString);
    function GetControlaNumeroSerie: Boolean;
    procedure SetControlaNumeroSerie(const AControlaNumeroSerie: Boolean);
    function GetTabelaA: TTabelaA;
    procedure SetTabelaA(const ATabelaA: TTabelaA);
    function GetTipoBonificacao: TTipoBonificacao;
    procedure SetTipoBonificacao(const ATipoBonificacao: TTipoBonificacao);
    function GetControlaEstoque: Boolean;
    procedure SetControlaEstoque(const AControlaEstoque: Boolean);
    function GetAssociacao: TAssociacao;
    procedure SetAssociacao(const AAssociacao: TAssociacao);
    function GetComposicao: TComposicao;
    procedure SetComposicao(const AComposicao: TComposicao);
    function GetControlaValidade: Boolean;
    procedure SetControlaValidade(const AControlaValidade: Boolean);
    function GetEnviaBalanca: Boolean;
    procedure SetEnviaBalanca(const AEnviaBalanca: Boolean);
    function GetMix: TString;
    procedure SetMix(const AMix: TString);
    function GetDescricaoVariavel: Boolean;
    procedure SetDescricaoVariavel(const ADescricaoVariavel: Boolean);
    function GetEndereco: TString;
    procedure SetEndereco(const AEndereco: TString);
    function GetForaDeLinha: TString;
    procedure SetForaDeLinha(const AForaDeLinha: TString);
    function GetUnidadeDeCompra: TString;
    procedure SetUnidadeDeCompra(const AUnidadeDeCompra: TString);
    function GetUnidadeDeReferencia: TString;
    procedure SetUnidadeDeReferencia(const AUnidadeDeReferencia: TString);
    function GetCodigoANP: TString;
    procedure SetCodigoANP(const ACodigoANP: TString);
    function GetTipoIPI: TTipoIPI;
    procedure SetTipoIPI(const ATipoIPI: TTipoIPI);
    function GetTipoAgregacao: TTipoAgregacao;
    procedure SetTipoAgregacao(const ATipoAgregacao: TTipoAgregacao);
    function GetPrecoVariavel: Boolean;
    procedure SetPrecoVariavel(const APrecoVariavel: Boolean);
    function GetIndiceAT: TIndiceAT;
    procedure SetIndiceAT(const AIndiceAT: TIndiceAT);
    function GetProducao: TProducao;
    procedure SetProducao(const AProducao: TProducao);
    function GetNomeclaturaMercosulId: TString;
    procedure SetNomeclaturaMercosulId(const ANomeclaturaMercosulId: TString);
    function GetNomeclaturaMercosulExcecaoId: TString;
    procedure SetNomeclaturaMercosulExcecaoId(const ANomeclaturaMercosulExcecaoId: TString);
    function GetFinalidadeProduto: TFinalidadeProduto;
    procedure SetFinalidadeProduto(const AFinalidadeProduto: TFinalidadeProduto);
    function GetModelo: TString;
    procedure SetModelo(const AModelo: TString);
    function GetIdentificadorDeOrigem: TString;
    procedure SetIdentificadorDeOrigem(const AIdentificadorDeOrigem: TString);
    function GetIncentivoZonaFranca: TString;
    procedure SetIncentivoZonaFranca(const AIncentivoZonaFranca: TString);
    function GetImagem: TString;
    procedure SetImagem(const AImagem: TString);
    function GetAltura: TString;
    procedure SetAltura(const AAltura: TString);
    function GetLargura: TString;
    procedure SetLargura(const ALargura: TString);
    function GetComprimento: TString;
    procedure SetComprimento(const AComprimento: TString);
    function GetUnidadeDeVenda: TString;
    procedure SetUnidadeDeVenda(const AUnidadeDeVenda: TString);
    function GetNaturezaId: Variant;
    procedure SetNaturezaId(const ANaturezaId: Variant);
    function GetTextoDaReceita: TString;
    procedure SetTextoDaReceita(const ATextoDaReceita: TString);
    function GetPermiteDesconto: Boolean;
    procedure SetPermiteDesconto(const APermiteDesconto: Boolean);
    function GetCompoeTotalDaNota: Boolean;
    procedure SetCompoeTotalDaNota(const ACompoeTotalDaNota: Boolean);
    function GetAtivoNoEcommerce: Boolean;
    procedure SetAtivoNoEcommerce(const AAtivoNoEcommerce: Boolean);
    function GetAtualizaFamilia: Boolean;
    procedure SetAtualizaFamilia(const AAtualizaFamilia: Boolean);
    function GetFrenteLoja: Boolean;
    procedure SetFrenteLoja(const AFrenteLoja: Boolean);
    function GetItensEmbalagem: Double;
    procedure SetItensEmbalagem(const AItensEmbalagem: Double);
    function GetItensEmbalagemVenda: Double;
    procedure SetItensEmbalagemVenda(const AItensEmbalagemVenda: Double);
    function GetItensEmbalagemTransferencia: Double;
    procedure SetItensEmbalagemTransferencia(const AItensEmbalagemTransferencia: Double);
    function GetCustoMedio: Double;
    procedure SetCustoMedio(const ACustoMedio: Double);
    function GetQtdMaximaVenda: Double;
    procedure SetQtdMaximaVenda(const AQtdMaximaVenda: Double);
    function GetPesoBruto: Double;
    procedure SetPesoBruto(const APesoBruto: Double);
    function GetPesoLiquido: Double;
    procedure SetPesoLiquido(const APesoLiquido: Double);
    function GetFatorBonificacao: Double;
    procedure SetFatorBonificacao(const AFatorBonificacao: Double);
    function GetMedidaReferencial: Double;
    procedure SetMedidaReferencial(const AMedidaReferencial: Double);
    function GetIpi: Double;
    procedure SetIpi(const AIpi: Double);
    function GetValorAgregacao: Double;
    procedure SetValorAgregacao(const AValorAgregacao: Double);
    function GetPercentualPerda: Double;
    procedure SetPercentualPerda(const APercentualPerda: Double);
    function GetFatorRendimentoUnidade: Double;
    procedure SetFatorRendimentoUnidade(const AFatorRendimentoUnidade: Double);
    function GetFatorRendimentoCusto: Double;
    procedure SetFatorRendimentoCusto(const AFatorRendimentoCusto: Double);
    function GetDescontoMaximo1: Double;
    procedure SetDescontoMaximo1(const ADescontoMaximo1: Double);
    function GetDescontoMaximo2: Double;
    procedure SetDescontoMaximo2(const ADescontoMaximo2: Double);
    function GetDescontoMaximo3: Double;
    procedure SetDescontoMaximo3(const ADescontoMaximo3: Double);
    function GetIncidenciaIPI: TIncidenciaIPI;
    procedure SetIncidenciaIPI(const AIncidenciaIPI: TIncidenciaIPI);
    function GetDataInclusao: TDateTime;
    procedure SetDataInclusao(const ADataInclusao: TDateTime);
    function GetDataSaida: TDateTime;
    procedure SetDataSaida(const ADataSaida: TDateTime);
    function GetTipoFatorKit: TTipoFator;
    procedure SetTipoFatorKit(const ATipoFatorKit: TTipoFator);
    function GetBaixaNaVendaComposto: Boolean;
    procedure SetBaixaNaVendaComposto(const ABaixaNaVendaComposto: Boolean);
    function GetQuantidadeComposto: Variant;
    procedure SetQuantidadeComposto(const AQuantidadeComposto: Variant);
    function GetComissaoCapitacao: Double;
    procedure SetComissaoCapitacao(const AComissaoCapitacao: Double);
    function GetComissaoProducao: Double;
    procedure SetComissaoProducao(const AComissaoProducao: Double);
    function GetComissaoVenda: Double;
    procedure SetComissaoVenda(const AComissaoVenda: Double);
    function GetPagaComissao: Boolean;
    procedure SetPagaComissao(const APagaComissao: Boolean);
    function GetPesoVariavel: TPesoVariavel;
    procedure SetPesoVariavel(const APesoVariavel: TPesoVariavel);
    function GetGeneroId: Variant;
    procedure SetGeneroId(const AGeneroId: Variant);
    function GetMarcaId: Variant;
    procedure SetMarcaId(const AMarcaId: Variant);
    function GetSituacaoFiscalId: Variant;
    procedure SetSituacaoFiscalId(const ASituacaoFiscalId: Variant);
    function GetSituacaoFiscalSaidaId: Variant;
    procedure SetSituacaoFiscalSaidaId(const ASituacaoFiscalSaidaId: Variant);
    function GetFuncionarioId: Variant;
    procedure SetFuncionarioId(const AFuncionarioId: Variant);
    function GetFornecedorId: Variant;
    procedure SetFornecedorId(const AFornecedorId: Variant);
    function GetLocalDeImpressaoId: Variant;
    procedure SetLocalDeImpressaoId(const ALocalDeImpressaoId: Variant);
    function GetAplicacoesIds: TLongList;
    procedure SetAplicacoesIds(const AAplicacoesIds: TLongList);
    function GetCaracteristicasIds: TLongList;
    procedure SetCaracteristicasIds(const ACaracteristicasIds: TLongList);
    function GetRegimesDoProduto: TRegimeEstadualProdutoList;
    procedure SetRegimesDoProduto(const ARegimesDoProduto: TRegimeEstadualProdutoList);
    function GetItensImpostosFederais: TItemImpostoFederalList;
    procedure SetItensImpostosFederais(const AItensImpostosFederais: TItemImpostoFederalList);
    function GetPautasDoProduto: TPautaDoProdutoList;
    procedure SetPautasDoProduto(const APautasDoProduto: TPautaDoProdutoList);
    function GetEstoqueDoProduto: TEstoqueDoProdutoList;
    procedure SetEstoqueDoProduto(const AEstoqueDoProduto: TEstoqueDoProdutoList);
  published
    property Id: Variant read GetId write SetId;
    property ProdutoDestinoId: Variant read GetProdutoDestinoId write SetProdutoDestinoId;
    property SubGrupoId: Variant read GetSubgrupoId write SetSubgrupoId;
    property GrupoId: Variant read GetGrupoId write SetGrupoId;
    property SecaoId: Integer read GetSecaoId write SetSecaoId;
    property NaturezaDeImpostoFederalId: Variant read GetNaturezaDeImpostoFederalId write SetNaturezaDeImpostoFederalId;
    property Cest: Int64 read GetCest write SetCest;
    property QuantidadeEtiqueta: Integer read GetQuantidadeEtiqueta write SetQuantidadeEtiqueta;
    property DiasDeSeguranca: Integer read GetDiasDeSeguranca write SetDiasDeSeguranca;
    property CodigoInterno: TString read GetCodigoInterno write SetCodigoInterno;
    property Descricao: TString read GetDescricao write SetDescricao;
    property DescricaoReduzida: TString read GetDescricaoReduzida write SetDescricaoReduzida;
    property TributacaoId: TString read GetTributacaoId write SetTributacaoId;
    property UnidadeDeTransferencia: TString read GetUnidadeDeTransferencia write SetUnidadeDeTransferencia;
    property Validade: TString read GetValidade write SetValidade;
    property ControlaNumeroSerie: Boolean read GetControlaNumeroSerie write SetControlaNumeroSerie;
    property TabelaA: TTabelaA read GetTabelaA write SetTabelaA;
    property TipoBonificacao: TTipoBonificacao read GetTipoBonificacao write SetTipoBonificacao;
    property ControlaEstoque: Boolean read GetControlaEstoque write SetControlaEstoque;
    property Associacao: TAssociacao read GetAssociacao write SetAssociacao;
    property Composicao: TComposicao read GetComposicao write SetComposicao;
    property ControlaValidade: Boolean read GetControlaValidade write SetControlaValidade;
    property EnviaBalanca: Boolean read GetEnviaBalanca write SetEnviaBalanca;
    property Mix: TString read GetMix write SetMix;
    property DescricaoVariavel: Boolean read GetDescricaoVariavel write SetDescricaoVariavel;
    property Endereco: TString read GetEndereco write SetEndereco;
    property ForaDeLinha: TString read GetForaDeLinha write SetForaDeLinha;
    property UnidadeDeCompra: TString read GetUnidadeDeCompra write SetUnidadeDeCompra;
    property UnidadeDeReferencia: TString read GetUnidadeDeReferencia write SetUnidadeDeReferencia;
    property CodigoANP: TString read GetCodigoANP write SetCodigoANP;
    property TipoIPI: TTipoIPI read GetTipoIPI write SetTipoIPI;
    property TipoAgregacao: TTipoAgregacao read GetTipoAgregacao write SetTipoAgregacao;
    property PrecoVariavel: Boolean read GetPrecoVariavel write SetPrecoVariavel;
    property IndiceAT: TIndiceAT read GetIndiceAT write SetIndiceAT;
    property Producao: TProducao read GetProducao write SetProducao;
    property NomeclaturaMercosulId: TString read GetNomeclaturaMercosulId write SetNomeclaturaMercosulId;
    property NomeclaturaMercosulExcecaoId: TString read GetNomeclaturaMercosulExcecaoId write SetNomeclaturaMercosulExcecaoId;
    property FinalidadeProduto: TFinalidadeProduto read GetFinalidadeProduto write SetFinalidadeProduto;
    property Modelo: TString read GetModelo write SetModelo;
    property IdentificadorDeOrigem: TString read GetIdentificadorDeOrigem write SetIdentificadorDeOrigem;
    property IncentivoZonaFranca: TString read GetIncentivoZonaFranca write SetIncentivoZonaFranca;
    property Imagem: TString read GetImagem write SetImagem;
    property Altura: TString read GetAltura write SetAltura;
    property Largura: TString read GetLargura write SetLargura;
    property Comprimento: TString read GetComprimento write SetComprimento;
    property UnidadeDeVenda: TString read GetUnidadeDeVenda write SetUnidadeDeVenda;
    property NaturezaId: Variant read GetNaturezaId write SetNaturezaId;
    property TextoDaReceita: TString read GetTextoDaReceita write SetTextoDaReceita;
    property PermiteDesconto: Boolean read GetPermiteDesconto write SetPermiteDesconto;
    property CompoeTotalDaNota: Boolean read GetCompoeTotalDaNota write SetCompoeTotalDaNota;
    property AtivoNoEcommerce: Boolean read GetAtivoNoEcommerce write SetAtivoNoEcommerce;
    property AtualizaFamilia: Boolean read GetAtualizaFamilia write SetAtualizaFamilia;
    property FrenteLoja: Boolean read GetFrenteLoja write SetFrenteLoja;
    property ItensEmbalagem: Double read GetItensEmbalagem write SetItensEmbalagem;
    property ItensEmbalagemVenda: Double read GetItensEmbalagemVenda write SetItensEmbalagemVenda;
    property ItensEmbalagemTransferencia: Double read GetItensEmbalagemTransferencia write SetItensEmbalagemTransferencia;
    property CustoMedio: Double read GetCustoMedio write SetCustoMedio;
    property QtdMaximaVenda: Double read GetQtdMaximaVenda write SetQtdMaximaVenda;
    property PesoBruto: Double read GetPesoBruto write SetPesoBruto;
    property PesoLiquido: Double read GetPesoLiquido write SetPesoLiquido;
    property FatorBonificacao: Double read GetFatorBonificacao write SetFatorBonificacao;
    property MedidaReferencial: Double read GetMedidaReferencial write SetMedidaReferencial;
    property Ipi: Double read GetIpi write SetIpi;
    property ValorAgregacao: Double read GetValorAgregacao write SetValorAgregacao;
    property PercentualPerda: Double read GetPercentualPerda write SetPercentualPerda;
    property FatorRendimentoUnidade: Double read GetFatorRendimentoUnidade write SetFatorRendimentoUnidade;
    property FatorRendimentoCusto: Double read GetFatorRendimentoCusto write SetFatorRendimentoCusto;
    property DescontoMaximo1: Double read GetDescontoMaximo1 write SetDescontoMaximo1;
    property DescontoMaximo2: Double read GetDescontoMaximo2 write SetDescontoMaximo2;
    property DescontoMaximo3: Double read GetDescontoMaximo3 write SetDescontoMaximo3;
    property IncidenciaIPI: TIncidenciaIPI read GetIncidenciaIPI write SetIncidenciaIPI;
    property DataInclusao: TDateTime read GetDataInclusao write SetDataInclusao;
    property DataSaida: TDateTime read GetDataSaida write SetDataSaida;
    property TipoFatorKit: TTipoFator read GetTipoFatorKit write SetTipoFatorKit;
    property BaixaNaVendaComposto: Boolean read GetBaixaNaVendaComposto write SetBaixaNaVendaComposto;
    property QuantidadeComposto: Variant read GetQuantidadeComposto write SetQuantidadeComposto;
    property ComissaoCapitacao: Double read GetComissaoCapitacao write SetComissaoCapitacao;
    property ComissaoProducao: Double read GetComissaoProducao write SetComissaoProducao;
    property ComissaoVenda: Double read GetComissaoVenda write SetComissaoVenda;
    property PagaComissao: Boolean read GetPagaComissao write SetPagaComissao;
    property PesoVariavel: TPesoVariavel read GetPesoVariavel write SetPesoVariavel;
    property GeneroId: Variant read GetGeneroId write SetGeneroId;
    property MarcaId: Variant read GetMarcaId write SetMarcaId;
    property SituacaoFiscalId: Variant read GetSituacaoFiscalId write SetSituacaoFiscalId;
    property SituacaoFiscalSaidaId: Variant read GetSituacaoFiscalSaidaId write SetSituacaoFiscalSaidaId;
    property FuncionarioId: Variant read GetFuncionarioId write SetFuncionarioId;
    property FornecedorId: Variant read GetFornecedorId write SetFornecedorId;
    property LocalDeImpressaoId: Variant read GetLocalDeImpressaoId write SetLocalDeImpressaoId;
    property AplicacoesIds: TLongList read GetAplicacoesIds write SetAplicacoesIds;
    property CaracteristicasIds: TLongList read GetCaracteristicasIds write SetCaracteristicasIds;
    property RegimesDoProduto: TRegimeEstadualProdutoList read GetRegimesDoProduto write SetRegimesDoProduto;
    property ItensImpostosFederais: TItemImpostoFederalList read GetItensImpostosFederais write SetItensImpostosFederais;
    property PautasDoProduto: TPautaDoProdutoList read GetPautasDoProduto write SetPautasDoProduto;
    property EstoqueDoProduto: TEstoqueDoProdutoList read GetEstoqueDoProduto write SetEstoqueDoProduto;
  end;

implementation

{ TProdutoList }

procedure TProdutoList.Add(const AProduto: IProduto);
begin
  FList.Add(AProduto);
end;

procedure TProdutoList.Clear;
begin
  FList.Clear;
end;

function TProdutoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TProdutoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TProdutoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TProdutoList.GetEnumerator: TProdutoListEnumerator;
begin
  Result := TProdutoListEnumerator.Create(Self);
end;

function TProdutoList.GetItems(AIndex: Integer): IProduto;
begin
  Result := FList[AIndex] as IProduto;
end;

function TProdutoList.GetReference: TProdutoList;
begin
  Result := Self;
end;

procedure TProdutoList.SetItems(AIndex: Integer; const Value: IProduto);
begin
  FList[AIndex] := Value;
end;

{ TProdutoListEnumerator }

constructor TProdutoListEnumerator.Create(AProdutoList: TProdutoList);
begin
  inherited Create;
  FIndex := -1;
  FProdutoList := AProdutoList;
end;

function TProdutoListEnumerator.GetCurrent: IProduto;
begin
  Result := FProdutoList[FIndex];
end;

function TProdutoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FProdutoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TProdutoListRec }

class function TProdutoListRec.Create(const AList: IProdutoList): TProdutoListRec;
begin
  FillChar(Result, SizeOf(TProdutoListRec), 0);
  Result.FList := AList;
end;

class operator TProdutoListRec.Implicit(AListRec: TProdutoListRec): TProdutoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TProduto }

function TProduto.GetId: Variant;
begin
  Result := FId;
end;

procedure TProduto.SetId(const AId: Variant);
begin
  FId := AId;
end;

function TProduto.GetProdutoDestinoId: Variant;
begin
  Result := FProdutoDestinoId;
end;

procedure TProduto.SetProdutoDestinoId(const AProdutoDestinoId: Variant);
begin
  FProdutoDestinoId := AProdutoDestinoId;
end;

function TProduto.GetSubGrupoId: Variant;
begin
  Result := FSubgrupoId;
end;

procedure TProduto.SetSubgrupoId(const ASubGrupoId: Variant);
begin
  FSubgrupoId := ASubgrupoId;
end;

function TProduto.GetGrupoId: Variant;
begin
  Result := FGrupoId;
end;

procedure TProduto.SetGrupoId(const AGrupoId: Variant);
begin
  FGrupoId := AGrupoId;
end;

function TProduto.GetSecaoId: Integer;
begin
  Result := FSecaoId;
end;

procedure TProduto.SetSecaoId(const ASecaoId: Integer);
begin
  FSecaoId := ASecaoId;
end;

function TProduto.GetNaturezaDeImpostoFederalId: Variant;
begin
  Result := FNaturezaDeImpostoFederalId;
end;

procedure TProduto.SetNaturezaDeImpostoFederalId(const ANaturezaDeImpostoFederalId: Variant);
begin
  FNaturezaDeImpostoFederalId := ANaturezaDeImpostoFederalId;
end;

function TProduto.GetCest: Int64;
begin
  Result := FCest;
end;

procedure TProduto.SetCest(const ACest: Int64);
begin
  FCest := ACest;
end;

function TProduto.GetQuantidadeEtiqueta: Integer;
begin
  Result := FQuantidadeEtiqueta;
end;

procedure TProduto.SetQuantidadeEtiqueta(const AQuantidadeEtiqueta: Integer);
begin
  FQuantidadeEtiqueta := AQuantidadeEtiqueta;
end;

function TProduto.GetDiasDeSeguranca: Integer;
begin
  Result := FDiasDeSeguranca;
end;

procedure TProduto.SetDiasDeSeguranca(const ADiasDeSeguranca: Integer);
begin
  FDiasDeSeguranca := ADiasDeSeguranca;
end;

function TProduto.GetCodigoInterno: TString;
begin
  Result := FCodigoInterno;
end;

procedure TProduto.SetCodigoInterno(const ACodigoInterno: TString);
begin
  FCodigoInterno := ACodigoInterno;
end;

function TProduto.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TProduto.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

function TProduto.GetDescricaoReduzida: TString;
begin
  Result := FDescricaoReduzida;
end;

procedure TProduto.SetDescricaoReduzida(const ADescricaoReduzida: TString);
begin
  FDescricaoReduzida := ADescricaoReduzida;
end;

function TProduto.GetTributacaoId: TString;
begin
  Result := FTributacaoId;
end;

procedure TProduto.SetTributacaoId(const ATributacaoId: TString);
begin
  FTributacaoId := ATributacaoId;
end;

function TProduto.GetUnidadeDeTransferencia: TString;
begin
  Result := FUnidadeDeTransferencia;
end;

procedure TProduto.SetUnidadeDeTransferencia(const AUnidadeDeTransferencia: TString);
begin
  FUnidadeDeTransferencia := AUnidadeDeTransferencia;
end;

function TProduto.GetValidade: TString;
begin
  Result := FValidade;
end;

procedure TProduto.SetValidade(const AValidade: TString);
begin
  FValidade := AValidade;
end;

function TProduto.GetControlaNumeroSerie: Boolean;
begin
  Result := FControlaNumeroSerie;
end;

procedure TProduto.SetControlaNumeroSerie(const AControlaNumeroSerie: Boolean);
begin
  FControlaNumeroSerie := AControlaNumeroSerie;
end;

function TProduto.GetTabelaA: TTabelaA;
begin
  Result := FTabelaA;
end;

procedure TProduto.SetTabelaA(const ATabelaA: TTabelaA);
begin
  FTabelaA := ATabelaA;
end;

function TProduto.GetTipoBonificacao: TTipoBonificacao;
begin
  Result := FTipoBonificacao;
end;

procedure TProduto.SetTipoBonificacao(const ATipoBonificacao: TTipoBonificacao);
begin
  FTipoBonificacao := ATipoBonificacao;
end;

function TProduto.GetControlaEstoque: Boolean;
begin
  Result := FControlaEstoque;
end;

procedure TProduto.SetControlaEstoque(const AControlaEstoque: Boolean);
begin
  FControlaEstoque := AControlaEstoque;
end;

function TProduto.GetAssociacao: TAssociacao;
begin
  Result := FAssociacao;
end;

procedure TProduto.SetAssociacao(const AAssociacao: TAssociacao);
begin
  FAssociacao := AAssociacao;
end;

function TProduto.GetComposicao: TComposicao;
begin
  Result := FComposicao;
end;

procedure TProduto.SetComposicao(const AComposicao: TComposicao);
begin
  FComposicao := AComposicao;
end;

function TProduto.GetControlaValidade: Boolean;
begin
  Result := FControlaValidade;
end;

procedure TProduto.SetControlaValidade(const AControlaValidade: Boolean);
begin
  FControlaValidade := AControlaValidade;
end;

function TProduto.GetEnviaBalanca: Boolean;
begin
  Result := FEnviaBalanca;
end;

procedure TProduto.SetEnviaBalanca(const AEnviaBalanca: Boolean);
begin
  FEnviaBalanca := AEnviaBalanca;
end;

function TProduto.GetMix: TString;
begin
  Result := FMix;
end;

procedure TProduto.SetMix(const AMix: TString);
begin
  FMix := AMix;
end;

function TProduto.GetDescricaoVariavel: Boolean;
begin
  Result := FDescricaoVariavel;
end;

procedure TProduto.SetDescricaoVariavel(const ADescricaoVariavel: Boolean);
begin
  FDescricaoVariavel := ADescricaoVariavel;
end;

function TProduto.GetEndereco: TString;
begin
  Result := FEndereco;
end;

procedure TProduto.SetEndereco(const AEndereco: TString);
begin
  FEndereco := AEndereco;
end;

function TProduto.GetForaDeLinha: TString;
begin
  Result := FForaDeLinha;
end;

procedure TProduto.SetForaDeLinha(const AForaDeLinha: TString);
begin
  FForaDeLinha := AForaDeLinha;
end;

function TProduto.GetUnidadeDeCompra: TString;
begin
  Result := FUnidadeDeCompra;
end;

procedure TProduto.SetUnidadeDeCompra(const AUnidadeDeCompra: TString);
begin
  FUnidadeDeCompra := AUnidadeDeCompra;
end;

function TProduto.GetUnidadeDeReferencia: TString;
begin
  Result := FUnidadeDeReferencia;
end;

procedure TProduto.SetUnidadeDeReferencia(const AUnidadeDeReferencia: TString);
begin
  FUnidadeDeReferencia := AUnidadeDeReferencia;
end;

function TProduto.GetCodigoANP: TString;
begin
  Result := FCodigoANP;
end;

procedure TProduto.SetCodigoANP(const ACodigoANP: TString);
begin
  FCodigoANP := ACodigoANP;
end;

function TProduto.GetTipoIPI: TTipoIPI;
begin
  Result := FTipoIPI;
end;

procedure TProduto.SetTipoIPI(const ATipoIPI: TTipoIPI);
begin
  FTipoIPI := ATipoIPI;
end;

function TProduto.GetTipoAgregacao: TTipoAgregacao;
begin
  Result := FTipoAgregacao;
end;

procedure TProduto.SetTipoAgregacao(const ATipoAgregacao: TTipoAgregacao);
begin
  FTipoAgregacao := ATipoAgregacao;
end;

function TProduto.GetPrecoVariavel: Boolean;
begin
  Result := FPrecoVariavel;
end;

procedure TProduto.SetPrecoVariavel(const APrecoVariavel: Boolean);
begin
  FPrecoVariavel := APrecoVariavel;
end;

function TProduto.GetIndiceAT: TIndiceAT;
begin
  Result := FIndiceAT;
end;

procedure TProduto.SetIndiceAT(const AIndiceAT: TIndiceAT);
begin
  FIndiceAT := AIndiceAT;
end;

function TProduto.GetProducao: TProducao;
begin
  Result := FProducao;
end;

procedure TProduto.SetProducao(const AProducao: TProducao);
begin
  FProducao := AProducao;
end;

function TProduto.GetNomeclaturaMercosulId: TString;
begin
  Result := FNomeclaturaMercosulId;
end;

procedure TProduto.SetNomeclaturaMercosulId(const ANomeclaturaMercosulId: TString);
begin
  FNomeclaturaMercosulId := ANomeclaturaMercosulId;
end;

function TProduto.GetNomeclaturaMercosulExcecaoId: TString;
begin
  Result := FNomeclaturaMercosulExcecaoId;
end;

procedure TProduto.SetNomeclaturaMercosulExcecaoId(const ANomeclaturaMercosulExcecaoId: TString);
begin
  FNomeclaturaMercosulExcecaoId := ANomeclaturaMercosulExcecaoId;
end;

function TProduto.GetFinalidadeProduto: TFinalidadeProduto;
begin
  Result := FFinalidadeProduto;
end;

procedure TProduto.SetFinalidadeProduto(const AFinalidadeProduto: TFinalidadeProduto);
begin
  FFinalidadeProduto := AFinalidadeProduto;
end;

function TProduto.GetModelo: TString;
begin
  Result := FModelo;
end;

procedure TProduto.SetModelo(const AModelo: TString);
begin
  FModelo := AModelo;
end;

function TProduto.GetIdentificadorDeOrigem: TString;
begin
  Result := FIdentificadorDeOrigem;
end;

procedure TProduto.SetIdentificadorDeOrigem(const AIdentificadorDeOrigem: TString);
begin
  FIdentificadorDeOrigem := AIdentificadorDeOrigem;
end;

function TProduto.GetIncentivoZonaFranca: TString;
begin
  Result := FIncentivoZonaFranca;
end;

procedure TProduto.SetIncentivoZonaFranca(const AIncentivoZonaFranca: TString);
begin
  FIncentivoZonaFranca := AIncentivoZonaFranca;
end;

function TProduto.GetImagem: TString;
begin
  Result := FImagem;
end;

procedure TProduto.SetImagem(const AImagem: TString);
begin
  FImagem := AImagem;
end;

function TProduto.GetAltura: TString;
begin
  Result := FAltura;
end;

procedure TProduto.SetAltura(const AAltura: TString);
begin
  FAltura := AAltura;
end;

function TProduto.GetLargura: TString;
begin
  Result := FLargura;
end;

procedure TProduto.SetLargura(const ALargura: TString);
begin
  FLargura := ALargura;
end;

function TProduto.GetComprimento: TString;
begin
  Result := FComprimento;
end;

procedure TProduto.SetComprimento(const AComprimento: TString);
begin
  FComprimento := AComprimento;
end;

function TProduto.GetUnidadeDeVenda: TString;
begin
  Result := FUnidadeDeVenda;
end;

procedure TProduto.SetUnidadeDeVenda(const AUnidadeDeVenda: TString);
begin
  FUnidadeDeVenda := AUnidadeDeVenda;
end;

function TProduto.GetNaturezaId: Variant;
begin
  Result := FNaturezaId;
end;

procedure TProduto.SetNaturezaId(const ANaturezaId: Variant);
begin
  FNaturezaId := ANaturezaId;
end;

function TProduto.GetTextoDaReceita: TString;
begin
  Result := FTextoDaReceita;
end;

procedure TProduto.SetTextoDaReceita(const ATextoDaReceita: TString);
begin
  FTextoDaReceita := ATextoDaReceita;
end;

function TProduto.GetPermiteDesconto: Boolean;
begin
  Result := FPermiteDesconto;
end;

procedure TProduto.SetPermiteDesconto(const APermiteDesconto: Boolean);
begin
  FPermiteDesconto := APermiteDesconto;
end;

function TProduto.GetCompoeTotalDaNota: Boolean;
begin
  Result := FCompoeTotalDaNota;
end;

procedure TProduto.SetCompoeTotalDaNota(const ACompoeTotalDaNota: Boolean);
begin
  FCompoeTotalDaNota := ACompoeTotalDaNota;
end;

function TProduto.GetAtivoNoEcommerce: Boolean;
begin
  Result := FAtivoNoEcommerce;
end;

procedure TProduto.SetAtivoNoEcommerce(const AAtivoNoEcommerce: Boolean);
begin
  FAtivoNoEcommerce := AAtivoNoEcommerce;
end;

function TProduto.GetAtualizaFamilia: Boolean;
begin
  Result := FAtualizaFamilia;
end;

procedure TProduto.SetAtualizaFamilia(const AAtualizaFamilia: Boolean);
begin
  FAtualizaFamilia := AAtualizaFamilia;
end;

function TProduto.GetFrenteLoja: Boolean;
begin
  Result := FFrenteLoja;
end;

procedure TProduto.SetFrenteLoja(const AFrenteLoja: Boolean);
begin
  FFrenteLoja := AFrenteLoja;
end;

function TProduto.GetItensEmbalagem: Double;
begin
  Result := FItensEmbalagem;
end;

procedure TProduto.SetItensEmbalagem(const AItensEmbalagem: Double);
begin
  FItensEmbalagem := AItensEmbalagem;
end;

function TProduto.GetItensEmbalagemVenda: Double;
begin
  Result := FItensEmbalagemVenda;
end;

procedure TProduto.SetItensEmbalagemVenda(const AItensEmbalagemVenda: Double);
begin
  FItensEmbalagemVenda := AItensEmbalagemVenda;
end;

function TProduto.GetItensEmbalagemTransferencia: Double;
begin
  Result := FItensEmbalagemTransferencia;
end;

procedure TProduto.SetItensEmbalagemTransferencia(const AItensEmbalagemTransferencia: Double);
begin
  FItensEmbalagemTransferencia := AItensEmbalagemTransferencia;
end;

function TProduto.GetCustoMedio: Double;
begin
  Result := FCustoMedio;
end;

procedure TProduto.SetCustoMedio(const ACustoMedio: Double);
begin
  FCustoMedio := ACustoMedio;
end;

function TProduto.GetQtdMaximaVenda: Double;
begin
  Result := FQtdMaximaVenda;
end;

procedure TProduto.SetQtdMaximaVenda(const AQtdMaximaVenda: Double);
begin
  FQtdMaximaVenda := AQtdMaximaVenda;
end;

function TProduto.GetPesoBruto: Double;
begin
  Result := FPesoBruto;
end;

procedure TProduto.SetPesoBruto(const APesoBruto: Double);
begin
  FPesoBruto := APesoBruto;
end;

function TProduto.GetPesoLiquido: Double;
begin
  Result := FPesoLiquido;
end;

procedure TProduto.SetPesoLiquido(const APesoLiquido: Double);
begin
  FPesoLiquido := APesoLiquido;
end;

function TProduto.GetFatorBonificacao: Double;
begin
  Result := FFatorBonificacao;
end;

procedure TProduto.SetFatorBonificacao(const AFatorBonificacao: Double);
begin
  FFatorBonificacao := AFatorBonificacao;
end;

function TProduto.GetMedidaReferencial: Double;
begin
  Result := FMedidaReferencial;
end;

procedure TProduto.SetMedidaReferencial(const AMedidaReferencial: Double);
begin
  FMedidaReferencial := AMedidaReferencial;
end;

function TProduto.GetIpi: Double;
begin
  Result := FIpi;
end;

procedure TProduto.SetIpi(const AIpi: Double);
begin
  FIpi := AIpi;
end;

function TProduto.GetValorAgregacao: Double;
begin
  Result := FValorAgregacao;
end;

procedure TProduto.SetValorAgregacao(const AValorAgregacao: Double);
begin
  FValorAgregacao := AValorAgregacao;
end;

function TProduto.GetPercentualPerda: Double;
begin
  Result := FPercentualPerda;
end;

procedure TProduto.SetPercentualPerda(const APercentualPerda: Double);
begin
  FPercentualPerda := APercentualPerda;
end;

function TProduto.GetFatorRendimentoUnidade: Double;
begin
  Result := FFatorRendimentoUnidade;
end;

procedure TProduto.SetFatorRendimentoUnidade(const AFatorRendimentoUnidade: Double);
begin
  FFatorRendimentoUnidade := AFatorRendimentoUnidade;
end;

function TProduto.GetFatorRendimentoCusto: Double;
begin
  Result := FFatorRendimentoCusto;
end;

procedure TProduto.SetFatorRendimentoCusto(const AFatorRendimentoCusto: Double);
begin
  FFatorRendimentoCusto := AFatorRendimentoCusto;
end;

function TProduto.GetDescontoMaximo1: Double;
begin
  Result := FDescontoMaximo1;
end;

procedure TProduto.SetDescontoMaximo1(const ADescontoMaximo1: Double);
begin
  FDescontoMaximo1 := ADescontoMaximo1;
end;

function TProduto.GetDescontoMaximo2: Double;
begin
  Result := FDescontoMaximo2;
end;

procedure TProduto.SetDescontoMaximo2(const ADescontoMaximo2: Double);
begin
  FDescontoMaximo2 := ADescontoMaximo2;
end;

function TProduto.GetDescontoMaximo3: Double;
begin
  Result := FDescontoMaximo3;
end;

procedure TProduto.SetDescontoMaximo3(const ADescontoMaximo3: Double);
begin
  FDescontoMaximo3 := ADescontoMaximo3;
end;

function TProduto.GetIncidenciaIPI: TIncidenciaIPI;
begin
  Result := FIncidenciaIPI;
end;

procedure TProduto.SetIncidenciaIPI(const AIncidenciaIPI: TIncidenciaIPI);
begin
  FIncidenciaIPI := AIncidenciaIPI;
end;

function TProduto.GetDataInclusao: TDateTime;
begin
  Result := FDataInclusao;
end;

procedure TProduto.SetDataInclusao(const ADataInclusao: TDateTime);
begin
  FDataInclusao := ADataInclusao;
end;

function TProduto.GetDataSaida: TDateTime;
begin
  Result := FDataSaida;
end;

procedure TProduto.SetDataSaida(const ADataSaida: TDateTime);
begin
  FDataSaida := ADataSaida;
end;

function TProduto.GetTipoFatorKit: TTipoFator;
begin
  Result := FTipoFatorKit;
end;

procedure TProduto.SetTipoFatorKit(const ATipoFatorKit: TTipoFator);
begin
  FTipoFatorKit := ATipoFatorKit;
end;

function TProduto.GetBaixaNaVendaComposto: Boolean;
begin
  Result := FBaixaNaVendaComposto;
end;

procedure TProduto.SetBaixaNaVendaComposto(const ABaixaNaVendaComposto: Boolean);
begin
  FBaixaNaVendaComposto := ABaixaNaVendaComposto;
end;

function TProduto.GetQuantidadeComposto: Variant;
begin
  Result := FQuantidadeComposto;
end;

procedure TProduto.SetQuantidadeComposto(const AQuantidadeComposto: Variant);
begin
  FQuantidadeComposto := AQuantidadeComposto;
end;

function TProduto.GetComissaoCapitacao: Double;
begin
  Result := FComissaoCapitacao;
end;

procedure TProduto.SetComissaoCapitacao(const AComissaoCapitacao: Double);
begin
  FComissaoCapitacao := AComissaoCapitacao;
end;

function TProduto.GetComissaoProducao: Double;
begin
  Result := FComissaoProducao;
end;

procedure TProduto.SetComissaoProducao(const AComissaoProducao: Double);
begin
  FComissaoProducao := AComissaoProducao;
end;

function TProduto.GetComissaoVenda: Double;
begin
  Result := FComissaoVenda;
end;

procedure TProduto.SetComissaoVenda(const AComissaoVenda: Double);
begin
  FComissaoVenda := AComissaoVenda;
end;

function TProduto.GetPagaComissao: Boolean;
begin
  Result := FPagaComissao;
end;

procedure TProduto.SetPagaComissao(const APagaComissao: Boolean);
begin
  FPagaComissao := APagaComissao;
end;

function TProduto.GetPesoVariavel: TPesoVariavel;
begin
  Result := FPesoVariavel;
end;

procedure TProduto.SetPesoVariavel(const APesoVariavel: TPesoVariavel);
begin
  FPesoVariavel := APesoVariavel;
end;

function TProduto.GetGeneroId: Variant;
begin
  Result := FGeneroId;
end;

procedure TProduto.SetGeneroId(const AGeneroId: Variant);
begin
  FGeneroId := AGeneroId;
end;

function TProduto.GetMarcaId: Variant;
begin
  Result := FMarcaId;
end;

procedure TProduto.SetMarcaId(const AMarcaId: Variant);
begin
  FMarcaId := AMarcaId;
end;

function TProduto.GetSituacaoFiscalId: Variant;
begin
  Result := FSituacaoFiscalId;
end;

procedure TProduto.SetSituacaoFiscalId(const ASituacaoFiscalId: Variant);
begin
  FSituacaoFiscalId := ASituacaoFiscalId;
end;

function TProduto.GetSituacaoFiscalSaidaId: Variant;
begin
  Result := FSituacaoFiscalSaidaId;
end;

procedure TProduto.SetSituacaoFiscalSaidaId(const ASituacaoFiscalSaidaId: Variant);
begin
  FSituacaoFiscalSaidaId := ASituacaoFiscalSaidaId;
end;

function TProduto.GetFuncionarioId: Variant;
begin
  Result := FFuncionarioId;
end;

procedure TProduto.SetFuncionarioId(const AFuncionarioId: Variant);
begin
  FFuncionarioId := AFuncionarioId;
end;

function TProduto.GetFornecedorId: Variant;
begin
  Result := FFornecedorId;
end;

procedure TProduto.SetFornecedorId(const AFornecedorId: Variant);
begin
  FFornecedorId := AFornecedorId;
end;

function TProduto.GetLocalDeImpressaoId: Variant;
begin
  Result := FLocalDeImpressaoId;
end;

procedure TProduto.SetLocalDeImpressaoId(const ALocalDeImpressaoId: Variant);
begin
  FLocalDeImpressaoId := ALocalDeImpressaoId;
end;

function TProduto.GetAplicacoesIds: TLongList;
begin
  Result := FAplicacoesIds;
end;

procedure TProduto.SetAplicacoesIds(const AAplicacoesIds: TLongList);
begin
  FAplicacoesIds := AAplicacoesIds;
end;

function TProduto.GetCaracteristicasIds: TLongList;
begin
  Result := FCaracteristicasIds;
end;

procedure TProduto.SetCaracteristicasIds(const ACaracteristicasIds: TLongList);
begin
  FCaracteristicasIds := ACaracteristicasIds;
end;

function TProduto.GetRegimesDoProduto: TRegimeEstadualProdutoList;
begin
  Result := FRegimesDoProduto;
end;

procedure TProduto.SetRegimesDoProduto(const ARegimesDoProduto: TRegimeEstadualProdutoList);
begin
  FRegimesDoProduto := ARegimesDoProduto;
end;

function TProduto.GetItensImpostosFederais: TItemImpostoFederalList;
begin
  Result := FItensImpostosFederais;
end;

procedure TProduto.SetItensImpostosFederais(const AItensImpostosFederais: TItemImpostoFederalList);
begin
  FItensImpostosFederais := AItensImpostosFederais;
end;

function TProduto.GetPautasDoProduto: TPautaDoProdutoList;
begin
  Result := FPautasDoProduto;
end;

procedure TProduto.SetPautasDoProduto(const APautasDoProduto: TPautaDoProdutoList);
begin
  FPautasDoProduto := APautasDoProduto;
end;

function TProduto.GetEstoqueDoProduto: TEstoqueDoProdutoList;
begin
  Result := FEstoqueDoProduto;
end;

procedure TProduto.SetEstoqueDoProduto(const AEstoqueDoProduto: TEstoqueDoProdutoList);
begin
  FEstoqueDoProduto := AEstoqueDoProduto;
end;


end.
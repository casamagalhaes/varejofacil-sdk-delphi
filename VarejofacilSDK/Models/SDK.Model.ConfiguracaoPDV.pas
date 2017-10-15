unit SDK.Model.ConfiguracaoPDV;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IConfiguracaoPDV = interface(IModel)
    ['{6D8F21D0-DE0C-4733-B6EA-82ACF907DDE1}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetIdentificadorDeBINSParaCartoes: TString;
    procedure SetIdentificadorDeBINSParaCartoes(const AIdentificadorDeBINSParaCartoes: TString);
    function GetClientePadraoASerUtilizadoNasVendas: TString;
    procedure SetClientePadraoASerUtilizadoNasVendas(const AClientePadraoASerUtilizadoNasVendas: TString);
    function GetPrazoEmDiasParaClientesEmAtraso: TString;
    procedure SetPrazoEmDiasParaClientesEmAtraso(const APrazoEmDiasParaClientesEmAtraso: TString);
    function GetQuantidadeDeDiasParaTrocaDoCaixa: Int64;
    procedure SetQuantidadeDeDiasParaTrocaDoCaixa(const AQuantidadeDeDiasParaTrocaDoCaixa: Int64);
    function GetEnderecoDeCargaParaOsCaixas: TString;
    procedure SetEnderecoDeCargaParaOsCaixas(const AEnderecoDeCargaParaOsCaixas: TString);
    function GetCaminhoDeLeituraDoArquivoDeClientesDeRetaguarda: TString;
    procedure SetCaminhoDeLeituraDoArquivoDeClientesDeRetaguarda(const ACaminhoDeLeituraDoArquivoDeClientesDeRetaguarda: TString);
    function GetCaminhoDeGeracaoDoArquivoDeClientesParaARetaguarda: TString;
    procedure SetCaminhoDeGeracaoDoArquivoDeClientesParaARetaguarda(const ACaminhoDeGeracaoDoArquivoDeClientesParaARetaguarda: TString);
    function GetCaminhoDeLeituraDoArquivoDePreVendasDeRetaguarda: TString;
    procedure SetCaminhoDeLeituraDoArquivoDePreVendasDeRetaguarda(const ACaminhoDeLeituraDoArquivoDePreVendasDeRetaguarda: TString);
    function GetCaminhoDeGeracaoDoArquivoDePreVendasParaARetaguarda: TString;
    procedure SetCaminhoDeGeracaoDoArquivoDePreVendasParaARetaguarda(const ACaminhoDeGeracaoDoArquivoDePreVendasParaARetaguarda: TString);
    function GetCaminhoDeRecebimentoDaRespostaDoTEF: TString;
    procedure SetCaminhoDeRecebimentoDaRespostaDoTEF(const ACaminhoDeRecebimentoDaRespostaDoTEF: TString);
    function GetCaminhoDeEnvioDaSolicitacaoParaOTEF: TString;
    procedure SetCaminhoDeEnvioDaSolicitacaoParaOTEF(const ACaminhoDeEnvioDaSolicitacaoParaOTEF: TString);
    function GetCaminhoDeRecebimentoDaRespostaDoTEF2: TString;
    procedure SetCaminhoDeRecebimentoDaRespostaDoTEF2(const ACaminhoDeRecebimentoDaRespostaDoTEF2: TString);
    function GetCaminhoDeEnvioDaSolicitacaoParaOTEF2: TString;
    procedure SetCaminhoDeEnvioDaSolicitacaoParaOTEF2(const ACaminhoDeEnvioDaSolicitacaoParaOTEF2: TString);
    function GetCaminhoDeRecebimentoDaRespostaDoTEF3: TString;
    procedure SetCaminhoDeRecebimentoDaRespostaDoTEF3(const ACaminhoDeRecebimentoDaRespostaDoTEF3: TString);
    function GetCaminhoDeEnvioDaSolicitacaoParaOTEF3: TString;
    procedure SetCaminhoDeEnvioDaSolicitacaoParaOTEF3(const ACaminhoDeEnvioDaSolicitacaoParaOTEF3: TString);
    function GetCaminhoDeRecebimentoDaRespostaDoTEF4: TString;
    procedure SetCaminhoDeRecebimentoDaRespostaDoTEF4(const ACaminhoDeRecebimentoDaRespostaDoTEF4: TString);
    function GetCaminhoDeEnvioDaSolicitacaoParaOTEF4: TString;
    procedure SetCaminhoDeEnvioDaSolicitacaoParaOTEF4(const ACaminhoDeEnvioDaSolicitacaoParaOTEF4: TString);
    function GetHabilitarCargaAutomaticaParaOPDV: Boolean;
    procedure SetHabilitarCargaAutomaticaParaOPDV(const AHabilitarCargaAutomaticaParaOPDV: Boolean);
    function GetIndicadorDeImpressaoNoECFDoCodigoDaPreVenda: TString;
    procedure SetIndicadorDeImpressaoNoECFDoCodigoDaPreVenda(const AIndicadorDeImpressaoNoECFDoCodigoDaPreVenda: TString);
    function GetNumeroIPDoServidorDeWebService: TString;
    procedure SetNumeroIPDoServidorDeWebService(const ANumeroIPDoServidorDeWebService: TString);
    function GetNumeroDoEnderecoIPDoServidorDeCarga: TString;
    procedure SetNumeroDoEnderecoIPDoServidorDeCarga(const ANumeroDoEnderecoIPDoServidorDeCarga: TString);
    function GetEnderecoIPDaEstacaoDeCarga: TString;
    procedure SetEnderecoIPDaEstacaoDeCarga(const AEnderecoIPDaEstacaoDeCarga: TString);
    function GetNumeroIPDoServidorDeRetaguarda: TString;
    procedure SetNumeroIPDoServidorDeRetaguarda(const ANumeroIPDoServidorDeRetaguarda: TString);
    function GetEnderecoDeEnvioOndeSeraGravadoOArquivoDaPreVenda: TString;
    procedure SetEnderecoDeEnvioOndeSeraGravadoOArquivoDaPreVenda(const AEnderecoDeEnvioOndeSeraGravadoOArquivoDaPreVenda: TString);
    function GetEnderecoIPDoServidorWEB: TString;
    procedure SetEnderecoIPDoServidorWEB(const AEnderecoIPDoServidorWEB: TString);
    function GetCodigoDaLojaParaOTEF: TString;
    procedure SetCodigoDaLojaParaOTEF(const ACodigoDaLojaParaOTEF: TString);
    function GetPercentualASerAplicadoComoAcrescimosNoCupom: Double;
    procedure SetPercentualASerAplicadoComoAcrescimosNoCupom(const APercentualASerAplicadoComoAcrescimosNoCupom: Double);
    function GetTempoInicialParaExibicaoTelaEmSegundos: Int64;
    procedure SetTempoInicialParaExibicaoTelaEmSegundos(const ATempoInicialParaExibicaoTelaEmSegundos: Int64);
    function GetTempoEmSegundosParaExibicaoDaTelaProtecao: Int64;
    procedure SetTempoEmSegundosParaExibicaoDaTelaProtecao(const ATempoEmSegundosParaExibicaoDaTelaProtecao: Int64);
    function GetPortaDeComunicacaoComOServidorDeWebService: Int64;
    procedure SetPortaDeComunicacaoComOServidorDeWebService(const APortaDeComunicacaoComOServidorDeWebService: Int64);
    function GetPortaDoServidorDeCarga: Int64;
    procedure SetPortaDoServidorDeCarga(const APortaDoServidorDeCarga: Int64);
    function GetPortaDeComunicacaoEstacaoCarga: Int64;
    procedure SetPortaDeComunicacaoEstacaoCarga(const APortaDeComunicacaoEstacaoCarga: Int64);
    function GetNumeroDaPortaDoServidorDaRetaguarda: Int64;
    procedure SetNumeroDaPortaDoServidorDaRetaguarda(const ANumeroDaPortaDoServidorDaRetaguarda: Int64);
    function GetPortaDeComunicacao: Int64;
    procedure SetPortaDeComunicacao(const APortaDeComunicacao: Int64);
    function GetPortaDoServidorWEB: Int64;
    procedure SetPortaDoServidorWEB(const APortaDoServidorWEB: Int64);
    function GetCodigoDaFinalizadora1ParaVendasComCartoes: TString;
    procedure SetCodigoDaFinalizadora1ParaVendasComCartoes(const ACodigoDaFinalizadora1ParaVendasComCartoes: TString);
    function GetCodigoDaFinalizadora2ParaVendasComCartoes: TString;
    procedure SetCodigoDaFinalizadora2ParaVendasComCartoes(const ACodigoDaFinalizadora2ParaVendasComCartoes: TString);
    function GetTipoDePrecoUtilizadoParaCartoes: TString;
    procedure SetTipoDePrecoUtilizadoParaCartoes(const ATipoDePrecoUtilizadoParaCartoes: TString);
    function GetValorMinimoParaIdentificarConsumidor: Double;
    procedure SetValorMinimoParaIdentificarConsumidor(const AValorMinimoParaIdentificarConsumidor: Double);
    function GetEnderecoIPParaValidarVendasComSITEF: TString;
    procedure SetEnderecoIPParaValidarVendasComSITEF(const AEnderecoIPParaValidarVendasComSITEF: TString);
    function GetNomeEstabelecidoParaOPreco1: TString;
    procedure SetNomeEstabelecidoParaOPreco1(const ANomeEstabelecidoParaOPreco1: TString);
    function GetNomeEstabelecidoParaOPreco2: TString;
    procedure SetNomeEstabelecidoParaOPreco2(const ANomeEstabelecidoParaOPreco2: TString);
    function GetNomeEstabelecidoParaOPreco3: TString;
    procedure SetNomeEstabelecidoParaOPreco3(const ANomeEstabelecidoParaOPreco3: TString);
    function GetTipoDoTEF: TString;
    procedure SetTipoDoTEF(const ATipoDoTEF: TString);
    function GetCaminhoParaOServidorWEBURL: TString;
    procedure SetCaminhoParaOServidorWEBURL(const ACaminhoParaOServidorWEBURL: TString);
    function GetVariacaoEmGramasParaBalanca: TString;
    procedure SetVariacaoEmGramasParaBalanca(const AVariacaoEmGramasParaBalanca: TString);
    function GetValorMinimoParaLiberacaoEstacionamento: Double;
    procedure SetValorMinimoParaLiberacaoEstacionamento(const AValorMinimoParaLiberacaoEstacionamento: Double);
    function GetMensagemParaClienteIdentificado: TString;
    procedure SetMensagemParaClienteIdentificado(const AMensagemParaClienteIdentificado: TString);
    function GetMensagemParaClienteNaoIdentificado: TString;
    procedure SetMensagemParaClienteNaoIdentificado(const AMensagemParaClienteNaoIdentificado: TString);
    function GetBloquearVendaComPontoDeSangriaAtingido: Boolean;
    procedure SetBloquearVendaComPontoDeSangriaAtingido(const ABloquearVendaComPontoDeSangriaAtingido: Boolean);
    function GetQuantidadeABloquearVendaComPontoDeSangriaAtingido: Integer;
    procedure SetQuantidadeABloquearVendaComPontoDeSangriaAtingido(const AQuantidadeABloquearVendaComPontoDeSangriaAtingido: Integer);
    function GetCodigoDaFinalizadoraNetPoint: TString;
    procedure SetCodigoDaFinalizadoraNetPoint(const ACodigoDaFinalizadoraNetPoint: TString);
    function GetDescricaoDaFinalizadoraNetPoint: TString;
    procedure SetDescricaoDaFinalizadoraNetPoint(const ADescricaoDaFinalizadoraNetPoint: TString);
    property Id: Int64 read GetId write SetId;
    property IdentificadorDeBINSParaCartoes: TString read GetIdentificadorDeBINSParaCartoes write SetIdentificadorDeBINSParaCartoes;
    property ClientePadraoASerUtilizadoNasVendas: TString read GetClientePadraoASerUtilizadoNasVendas write SetClientePadraoASerUtilizadoNasVendas;
    property PrazoEmDiasParaClientesEmAtraso: TString read GetPrazoEmDiasParaClientesEmAtraso write SetPrazoEmDiasParaClientesEmAtraso;
    property QuantidadeDeDiasParaTrocaDoCaixa: Int64 read GetQuantidadeDeDiasParaTrocaDoCaixa write SetQuantidadeDeDiasParaTrocaDoCaixa;
    property EnderecoDeCargaParaOsCaixas: TString read GetEnderecoDeCargaParaOsCaixas write SetEnderecoDeCargaParaOsCaixas;
    property CaminhoDeLeituraDoArquivoDeClientesDeRetaguarda: TString read GetCaminhoDeLeituraDoArquivoDeClientesDeRetaguarda write SetCaminhoDeLeituraDoArquivoDeClientesDeRetaguarda;
    property CaminhoDeGeracaoDoArquivoDeClientesParaARetaguarda: TString read GetCaminhoDeGeracaoDoArquivoDeClientesParaARetaguarda write SetCaminhoDeGeracaoDoArquivoDeClientesParaARetaguarda;
    property CaminhoDeLeituraDoArquivoDePreVendasDeRetaguarda: TString read GetCaminhoDeLeituraDoArquivoDePreVendasDeRetaguarda write SetCaminhoDeLeituraDoArquivoDePreVendasDeRetaguarda;
    property CaminhoDeGeracaoDoArquivoDePreVendasParaARetaguarda: TString read GetCaminhoDeGeracaoDoArquivoDePreVendasParaARetaguarda write SetCaminhoDeGeracaoDoArquivoDePreVendasParaARetaguarda;
    property CaminhoDeRecebimentoDaRespostaDoTEF: TString read GetCaminhoDeRecebimentoDaRespostaDoTEF write SetCaminhoDeRecebimentoDaRespostaDoTEF;
    property CaminhoDeEnvioDaSolicitacaoParaOTEF: TString read GetCaminhoDeEnvioDaSolicitacaoParaOTEF write SetCaminhoDeEnvioDaSolicitacaoParaOTEF;
    property CaminhoDeRecebimentoDaRespostaDoTEF2: TString read GetCaminhoDeRecebimentoDaRespostaDoTEF2 write SetCaminhoDeRecebimentoDaRespostaDoTEF2;
    property CaminhoDeEnvioDaSolicitacaoParaOTEF2: TString read GetCaminhoDeEnvioDaSolicitacaoParaOTEF2 write SetCaminhoDeEnvioDaSolicitacaoParaOTEF2;
    property CaminhoDeRecebimentoDaRespostaDoTEF3: TString read GetCaminhoDeRecebimentoDaRespostaDoTEF3 write SetCaminhoDeRecebimentoDaRespostaDoTEF3;
    property CaminhoDeEnvioDaSolicitacaoParaOTEF3: TString read GetCaminhoDeEnvioDaSolicitacaoParaOTEF3 write SetCaminhoDeEnvioDaSolicitacaoParaOTEF3;
    property CaminhoDeRecebimentoDaRespostaDoTEF4: TString read GetCaminhoDeRecebimentoDaRespostaDoTEF4 write SetCaminhoDeRecebimentoDaRespostaDoTEF4;
    property CaminhoDeEnvioDaSolicitacaoParaOTEF4: TString read GetCaminhoDeEnvioDaSolicitacaoParaOTEF4 write SetCaminhoDeEnvioDaSolicitacaoParaOTEF4;
    property HabilitarCargaAutomaticaParaOPDV: Boolean read GetHabilitarCargaAutomaticaParaOPDV write SetHabilitarCargaAutomaticaParaOPDV;
    property IndicadorDeImpressaoNoECFDoCodigoDaPreVenda: TString read GetIndicadorDeImpressaoNoECFDoCodigoDaPreVenda write SetIndicadorDeImpressaoNoECFDoCodigoDaPreVenda;
    property NumeroIPDoServidorDeWebService: TString read GetNumeroIPDoServidorDeWebService write SetNumeroIPDoServidorDeWebService;
    property NumeroDoEnderecoIPDoServidorDeCarga: TString read GetNumeroDoEnderecoIPDoServidorDeCarga write SetNumeroDoEnderecoIPDoServidorDeCarga;
    property EnderecoIPDaEstacaoDeCarga: TString read GetEnderecoIPDaEstacaoDeCarga write SetEnderecoIPDaEstacaoDeCarga;
    property NumeroIPDoServidorDeRetaguarda: TString read GetNumeroIPDoServidorDeRetaguarda write SetNumeroIPDoServidorDeRetaguarda;
    property EnderecoDeEnvioOndeSeraGravadoOArquivoDaPreVenda: TString read GetEnderecoDeEnvioOndeSeraGravadoOArquivoDaPreVenda write SetEnderecoDeEnvioOndeSeraGravadoOArquivoDaPreVenda;
    property EnderecoIPDoServidorWEB: TString read GetEnderecoIPDoServidorWEB write SetEnderecoIPDoServidorWEB;
    property CodigoDaLojaParaOTEF: TString read GetCodigoDaLojaParaOTEF write SetCodigoDaLojaParaOTEF;
    property PercentualASerAplicadoComoAcrescimosNoCupom: Double read GetPercentualASerAplicadoComoAcrescimosNoCupom write SetPercentualASerAplicadoComoAcrescimosNoCupom;
    property TempoInicialParaExibicaoTelaEmSegundos: Int64 read GetTempoInicialParaExibicaoTelaEmSegundos write SetTempoInicialParaExibicaoTelaEmSegundos;
    property TempoEmSegundosParaExibicaoDaTelaProtecao: Int64 read GetTempoEmSegundosParaExibicaoDaTelaProtecao write SetTempoEmSegundosParaExibicaoDaTelaProtecao;
    property PortaDeComunicacaoComOServidorDeWebService: Int64 read GetPortaDeComunicacaoComOServidorDeWebService write SetPortaDeComunicacaoComOServidorDeWebService;
    property PortaDoServidorDeCarga: Int64 read GetPortaDoServidorDeCarga write SetPortaDoServidorDeCarga;
    property PortaDeComunicacaoEstacaoCarga: Int64 read GetPortaDeComunicacaoEstacaoCarga write SetPortaDeComunicacaoEstacaoCarga;
    property NumeroDaPortaDoServidorDaRetaguarda: Int64 read GetNumeroDaPortaDoServidorDaRetaguarda write SetNumeroDaPortaDoServidorDaRetaguarda;
    property PortaDeComunicacao: Int64 read GetPortaDeComunicacao write SetPortaDeComunicacao;
    property PortaDoServidorWEB: Int64 read GetPortaDoServidorWEB write SetPortaDoServidorWEB;
    property CodigoDaFinalizadora1ParaVendasComCartoes: TString read GetCodigoDaFinalizadora1ParaVendasComCartoes write SetCodigoDaFinalizadora1ParaVendasComCartoes;
    property CodigoDaFinalizadora2ParaVendasComCartoes: TString read GetCodigoDaFinalizadora2ParaVendasComCartoes write SetCodigoDaFinalizadora2ParaVendasComCartoes;
    property TipoDePrecoUtilizadoParaCartoes: TString read GetTipoDePrecoUtilizadoParaCartoes write SetTipoDePrecoUtilizadoParaCartoes;
    property ValorMinimoParaIdentificarConsumidor: Double read GetValorMinimoParaIdentificarConsumidor write SetValorMinimoParaIdentificarConsumidor;
    property EnderecoIPParaValidarVendasComSITEF: TString read GetEnderecoIPParaValidarVendasComSITEF write SetEnderecoIPParaValidarVendasComSITEF;
    property NomeEstabelecidoParaOPreco1: TString read GetNomeEstabelecidoParaOPreco1 write SetNomeEstabelecidoParaOPreco1;
    property NomeEstabelecidoParaOPreco2: TString read GetNomeEstabelecidoParaOPreco2 write SetNomeEstabelecidoParaOPreco2;
    property NomeEstabelecidoParaOPreco3: TString read GetNomeEstabelecidoParaOPreco3 write SetNomeEstabelecidoParaOPreco3;
    property TipoDoTEF: TString read GetTipoDoTEF write SetTipoDoTEF;
    property CaminhoParaOServidorWEBURL: TString read GetCaminhoParaOServidorWEBURL write SetCaminhoParaOServidorWEBURL;
    property VariacaoEmGramasParaBalanca: TString read GetVariacaoEmGramasParaBalanca write SetVariacaoEmGramasParaBalanca;
    property ValorMinimoParaLiberacaoEstacionamento: Double read GetValorMinimoParaLiberacaoEstacionamento write SetValorMinimoParaLiberacaoEstacionamento;
    property MensagemParaClienteIdentificado: TString read GetMensagemParaClienteIdentificado write SetMensagemParaClienteIdentificado;
    property MensagemParaClienteNaoIdentificado: TString read GetMensagemParaClienteNaoIdentificado write SetMensagemParaClienteNaoIdentificado;
    property BloquearVendaComPontoDeSangriaAtingido: Boolean read GetBloquearVendaComPontoDeSangriaAtingido write SetBloquearVendaComPontoDeSangriaAtingido;
    property QuantidadeABloquearVendaComPontoDeSangriaAtingido: Integer read GetQuantidadeABloquearVendaComPontoDeSangriaAtingido write SetQuantidadeABloquearVendaComPontoDeSangriaAtingido;
    property CodigoDaFinalizadoraNetPoint: TString read GetCodigoDaFinalizadoraNetPoint write SetCodigoDaFinalizadoraNetPoint;
    property DescricaoDaFinalizadoraNetPoint: TString read GetDescricaoDaFinalizadoraNetPoint write SetDescricaoDaFinalizadoraNetPoint;
  end;

  TConfiguracaoPDVList = class;

  IConfiguracaoPDVList = interface
	['{591871D4-E9D9-4CA9-A01F-8E8E15195992}']
    function GetReference: TConfiguracaoPDVList;
    function GetItems(AIndex: Integer): IConfiguracaoPDV;
    procedure SetItems(AIndex: Integer; const Value: IConfiguracaoPDV);
    procedure Add(const AConfiguracaoPDV: IConfiguracaoPDV);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IConfiguracaoPDV read GetItems write SetItems; default;
  end;

  TConfiguracaoPDVListEnumerator = class
  private
    FIndex: Integer;
    FConfiguracaoPDVList: TConfiguracaoPDVList;
  public
    constructor Create(AConfiguracaoPDVList: TConfiguracaoPDVList);
    function GetCurrent: IConfiguracaoPDV; inline;
    function MoveNext: Boolean;
    property Current: IConfiguracaoPDV read GetCurrent;
  end;

  TConfiguracaoPDVList = class(TInterfacedObject, IConfiguracaoPDVList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IConfiguracaoPDV;
    procedure SetItems(AIndex: Integer; const Value: IConfiguracaoPDV);
  public
    constructor Create;
    procedure Add(const AConfiguracaoPDV: IConfiguracaoPDV);
    destructor Destroy; override;
    function GetEnumerator: TConfiguracaoPDVListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TConfiguracaoPDVList;
    property Items[AIndex: Integer]: IConfiguracaoPDV read GetItems write SetItems; default;
  end;

  TConfiguracaoPDVListRec = record
  private
    FList: IConfiguracaoPDVList;
  public
    class function Create(const AList: IConfiguracaoPDVList): TConfiguracaoPDVListRec; static;
    class operator Implicit(AListRec: TConfiguracaoPDVListRec): TConfiguracaoPDVList;
  end;

  TConfiguracaoPDV = class(TInterfacedObject, IConfiguracaoPDV)
  private
	FId: Int64;
	FIdentificadorDeBINSParaCartoes: TString;
	FClientePadraoASerUtilizadoNasVendas: TString;
	FPrazoEmDiasParaClientesEmAtraso: TString;
	FQuantidadeDeDiasParaTrocaDoCaixa: Int64;
	FEnderecoDeCargaParaOsCaixas: TString;
	FCaminhoDeLeituraDoArquivoDeClientesDeRetaguarda: TString;
	FCaminhoDeGeracaoDoArquivoDeClientesParaARetaguarda: TString;
	FCaminhoDeLeituraDoArquivoDePreVendasDeRetaguarda: TString;
	FCaminhoDeGeracaoDoArquivoDePreVendasParaARetaguarda: TString;
	FCaminhoDeRecebimentoDaRespostaDoTEF: TString;
	FCaminhoDeEnvioDaSolicitacaoParaOTEF: TString;
	FCaminhoDeRecebimentoDaRespostaDoTEF2: TString;
	FCaminhoDeEnvioDaSolicitacaoParaOTEF2: TString;
	FCaminhoDeRecebimentoDaRespostaDoTEF3: TString;
	FCaminhoDeEnvioDaSolicitacaoParaOTEF3: TString;
	FCaminhoDeRecebimentoDaRespostaDoTEF4: TString;
	FCaminhoDeEnvioDaSolicitacaoParaOTEF4: TString;
	FHabilitarCargaAutomaticaParaOPDV: Boolean;
	FIndicadorDeImpressaoNoECFDoCodigoDaPreVenda: TString;
	FNumeroIPDoServidorDeWebService: TString;
	FNumeroDoEnderecoIPDoServidorDeCarga: TString;
	FEnderecoIPDaEstacaoDeCarga: TString;
	FNumeroIPDoServidorDeRetaguarda: TString;
	FEnderecoDeEnvioOndeSeraGravadoOArquivoDaPreVenda: TString;
	FEnderecoIPDoServidorWEB: TString;
	FCodigoDaLojaParaOTEF: TString;
	FPercentualASerAplicadoComoAcrescimosNoCupom: Double;
	FTempoInicialParaExibicaoTelaEmSegundos: Int64;
	FTempoEmSegundosParaExibicaoDaTelaProtecao: Int64;
	FPortaDeComunicacaoComOServidorDeWebService: Int64;
	FPortaDoServidorDeCarga: Int64;
	FPortaDeComunicacaoEstacaoCarga: Int64;
	FNumeroDaPortaDoServidorDaRetaguarda: Int64;
	FPortaDeComunicacao: Int64;
	FPortaDoServidorWEB: Int64;
	FCodigoDaFinalizadora1ParaVendasComCartoes: TString;
	FCodigoDaFinalizadora2ParaVendasComCartoes: TString;
	FTipoDePrecoUtilizadoParaCartoes: TString;
	FValorMinimoParaIdentificarConsumidor: Double;
	FEnderecoIPParaValidarVendasComSITEF: TString;
	FNomeEstabelecidoParaOPreco1: TString;
	FNomeEstabelecidoParaOPreco2: TString;
	FNomeEstabelecidoParaOPreco3: TString;
	FTipoDoTEF: TString;
	FCaminhoParaOServidorWEBURL: TString;
	FVariacaoEmGramasParaBalanca: TString;
	FValorMinimoParaLiberacaoEstacionamento: Double;
	FMensagemParaClienteIdentificado: TString;
	FMensagemParaClienteNaoIdentificado: TString;
	FBloquearVendaComPontoDeSangriaAtingido: Boolean;
	FQuantidadeABloquearVendaComPontoDeSangriaAtingido: Integer;
	FCodigoDaFinalizadoraNetPoint: TString;
	FDescricaoDaFinalizadoraNetPoint: TString;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetIdentificadorDeBINSParaCartoes: TString;
    procedure SetIdentificadorDeBINSParaCartoes(const AIdentificadorDeBINSParaCartoes: TString);
    function GetClientePadraoASerUtilizadoNasVendas: TString;
    procedure SetClientePadraoASerUtilizadoNasVendas(const AClientePadraoASerUtilizadoNasVendas: TString);
    function GetPrazoEmDiasParaClientesEmAtraso: TString;
    procedure SetPrazoEmDiasParaClientesEmAtraso(const APrazoEmDiasParaClientesEmAtraso: TString);
    function GetQuantidadeDeDiasParaTrocaDoCaixa: Int64;
    procedure SetQuantidadeDeDiasParaTrocaDoCaixa(const AQuantidadeDeDiasParaTrocaDoCaixa: Int64);
    function GetEnderecoDeCargaParaOsCaixas: TString;
    procedure SetEnderecoDeCargaParaOsCaixas(const AEnderecoDeCargaParaOsCaixas: TString);
    function GetCaminhoDeLeituraDoArquivoDeClientesDeRetaguarda: TString;
    procedure SetCaminhoDeLeituraDoArquivoDeClientesDeRetaguarda(const ACaminhoDeLeituraDoArquivoDeClientesDeRetaguarda: TString);
    function GetCaminhoDeGeracaoDoArquivoDeClientesParaARetaguarda: TString;
    procedure SetCaminhoDeGeracaoDoArquivoDeClientesParaARetaguarda(const ACaminhoDeGeracaoDoArquivoDeClientesParaARetaguarda: TString);
    function GetCaminhoDeLeituraDoArquivoDePreVendasDeRetaguarda: TString;
    procedure SetCaminhoDeLeituraDoArquivoDePreVendasDeRetaguarda(const ACaminhoDeLeituraDoArquivoDePreVendasDeRetaguarda: TString);
    function GetCaminhoDeGeracaoDoArquivoDePreVendasParaARetaguarda: TString;
    procedure SetCaminhoDeGeracaoDoArquivoDePreVendasParaARetaguarda(const ACaminhoDeGeracaoDoArquivoDePreVendasParaARetaguarda: TString);
    function GetCaminhoDeRecebimentoDaRespostaDoTEF: TString;
    procedure SetCaminhoDeRecebimentoDaRespostaDoTEF(const ACaminhoDeRecebimentoDaRespostaDoTEF: TString);
    function GetCaminhoDeEnvioDaSolicitacaoParaOTEF: TString;
    procedure SetCaminhoDeEnvioDaSolicitacaoParaOTEF(const ACaminhoDeEnvioDaSolicitacaoParaOTEF: TString);
    function GetCaminhoDeRecebimentoDaRespostaDoTEF2: TString;
    procedure SetCaminhoDeRecebimentoDaRespostaDoTEF2(const ACaminhoDeRecebimentoDaRespostaDoTEF2: TString);
    function GetCaminhoDeEnvioDaSolicitacaoParaOTEF2: TString;
    procedure SetCaminhoDeEnvioDaSolicitacaoParaOTEF2(const ACaminhoDeEnvioDaSolicitacaoParaOTEF2: TString);
    function GetCaminhoDeRecebimentoDaRespostaDoTEF3: TString;
    procedure SetCaminhoDeRecebimentoDaRespostaDoTEF3(const ACaminhoDeRecebimentoDaRespostaDoTEF3: TString);
    function GetCaminhoDeEnvioDaSolicitacaoParaOTEF3: TString;
    procedure SetCaminhoDeEnvioDaSolicitacaoParaOTEF3(const ACaminhoDeEnvioDaSolicitacaoParaOTEF3: TString);
    function GetCaminhoDeRecebimentoDaRespostaDoTEF4: TString;
    procedure SetCaminhoDeRecebimentoDaRespostaDoTEF4(const ACaminhoDeRecebimentoDaRespostaDoTEF4: TString);
    function GetCaminhoDeEnvioDaSolicitacaoParaOTEF4: TString;
    procedure SetCaminhoDeEnvioDaSolicitacaoParaOTEF4(const ACaminhoDeEnvioDaSolicitacaoParaOTEF4: TString);
    function GetHabilitarCargaAutomaticaParaOPDV: Boolean;
    procedure SetHabilitarCargaAutomaticaParaOPDV(const AHabilitarCargaAutomaticaParaOPDV: Boolean);
    function GetIndicadorDeImpressaoNoECFDoCodigoDaPreVenda: TString;
    procedure SetIndicadorDeImpressaoNoECFDoCodigoDaPreVenda(const AIndicadorDeImpressaoNoECFDoCodigoDaPreVenda: TString);
    function GetNumeroIPDoServidorDeWebService: TString;
    procedure SetNumeroIPDoServidorDeWebService(const ANumeroIPDoServidorDeWebService: TString);
    function GetNumeroDoEnderecoIPDoServidorDeCarga: TString;
    procedure SetNumeroDoEnderecoIPDoServidorDeCarga(const ANumeroDoEnderecoIPDoServidorDeCarga: TString);
    function GetEnderecoIPDaEstacaoDeCarga: TString;
    procedure SetEnderecoIPDaEstacaoDeCarga(const AEnderecoIPDaEstacaoDeCarga: TString);
    function GetNumeroIPDoServidorDeRetaguarda: TString;
    procedure SetNumeroIPDoServidorDeRetaguarda(const ANumeroIPDoServidorDeRetaguarda: TString);
    function GetEnderecoDeEnvioOndeSeraGravadoOArquivoDaPreVenda: TString;
    procedure SetEnderecoDeEnvioOndeSeraGravadoOArquivoDaPreVenda(const AEnderecoDeEnvioOndeSeraGravadoOArquivoDaPreVenda: TString);
    function GetEnderecoIPDoServidorWEB: TString;
    procedure SetEnderecoIPDoServidorWEB(const AEnderecoIPDoServidorWEB: TString);
    function GetCodigoDaLojaParaOTEF: TString;
    procedure SetCodigoDaLojaParaOTEF(const ACodigoDaLojaParaOTEF: TString);
    function GetPercentualASerAplicadoComoAcrescimosNoCupom: Double;
    procedure SetPercentualASerAplicadoComoAcrescimosNoCupom(const APercentualASerAplicadoComoAcrescimosNoCupom: Double);
    function GetTempoInicialParaExibicaoTelaEmSegundos: Int64;
    procedure SetTempoInicialParaExibicaoTelaEmSegundos(const ATempoInicialParaExibicaoTelaEmSegundos: Int64);
    function GetTempoEmSegundosParaExibicaoDaTelaProtecao: Int64;
    procedure SetTempoEmSegundosParaExibicaoDaTelaProtecao(const ATempoEmSegundosParaExibicaoDaTelaProtecao: Int64);
    function GetPortaDeComunicacaoComOServidorDeWebService: Int64;
    procedure SetPortaDeComunicacaoComOServidorDeWebService(const APortaDeComunicacaoComOServidorDeWebService: Int64);
    function GetPortaDoServidorDeCarga: Int64;
    procedure SetPortaDoServidorDeCarga(const APortaDoServidorDeCarga: Int64);
    function GetPortaDeComunicacaoEstacaoCarga: Int64;
    procedure SetPortaDeComunicacaoEstacaoCarga(const APortaDeComunicacaoEstacaoCarga: Int64);
    function GetNumeroDaPortaDoServidorDaRetaguarda: Int64;
    procedure SetNumeroDaPortaDoServidorDaRetaguarda(const ANumeroDaPortaDoServidorDaRetaguarda: Int64);
    function GetPortaDeComunicacao: Int64;
    procedure SetPortaDeComunicacao(const APortaDeComunicacao: Int64);
    function GetPortaDoServidorWEB: Int64;
    procedure SetPortaDoServidorWEB(const APortaDoServidorWEB: Int64);
    function GetCodigoDaFinalizadora1ParaVendasComCartoes: TString;
    procedure SetCodigoDaFinalizadora1ParaVendasComCartoes(const ACodigoDaFinalizadora1ParaVendasComCartoes: TString);
    function GetCodigoDaFinalizadora2ParaVendasComCartoes: TString;
    procedure SetCodigoDaFinalizadora2ParaVendasComCartoes(const ACodigoDaFinalizadora2ParaVendasComCartoes: TString);
    function GetTipoDePrecoUtilizadoParaCartoes: TString;
    procedure SetTipoDePrecoUtilizadoParaCartoes(const ATipoDePrecoUtilizadoParaCartoes: TString);
    function GetValorMinimoParaIdentificarConsumidor: Double;
    procedure SetValorMinimoParaIdentificarConsumidor(const AValorMinimoParaIdentificarConsumidor: Double);
    function GetEnderecoIPParaValidarVendasComSITEF: TString;
    procedure SetEnderecoIPParaValidarVendasComSITEF(const AEnderecoIPParaValidarVendasComSITEF: TString);
    function GetNomeEstabelecidoParaOPreco1: TString;
    procedure SetNomeEstabelecidoParaOPreco1(const ANomeEstabelecidoParaOPreco1: TString);
    function GetNomeEstabelecidoParaOPreco2: TString;
    procedure SetNomeEstabelecidoParaOPreco2(const ANomeEstabelecidoParaOPreco2: TString);
    function GetNomeEstabelecidoParaOPreco3: TString;
    procedure SetNomeEstabelecidoParaOPreco3(const ANomeEstabelecidoParaOPreco3: TString);
    function GetTipoDoTEF: TString;
    procedure SetTipoDoTEF(const ATipoDoTEF: TString);
    function GetCaminhoParaOServidorWEBURL: TString;
    procedure SetCaminhoParaOServidorWEBURL(const ACaminhoParaOServidorWEBURL: TString);
    function GetVariacaoEmGramasParaBalanca: TString;
    procedure SetVariacaoEmGramasParaBalanca(const AVariacaoEmGramasParaBalanca: TString);
    function GetValorMinimoParaLiberacaoEstacionamento: Double;
    procedure SetValorMinimoParaLiberacaoEstacionamento(const AValorMinimoParaLiberacaoEstacionamento: Double);
    function GetMensagemParaClienteIdentificado: TString;
    procedure SetMensagemParaClienteIdentificado(const AMensagemParaClienteIdentificado: TString);
    function GetMensagemParaClienteNaoIdentificado: TString;
    procedure SetMensagemParaClienteNaoIdentificado(const AMensagemParaClienteNaoIdentificado: TString);
    function GetBloquearVendaComPontoDeSangriaAtingido: Boolean;
    procedure SetBloquearVendaComPontoDeSangriaAtingido(const ABloquearVendaComPontoDeSangriaAtingido: Boolean);
    function GetQuantidadeABloquearVendaComPontoDeSangriaAtingido: Integer;
    procedure SetQuantidadeABloquearVendaComPontoDeSangriaAtingido(const AQuantidadeABloquearVendaComPontoDeSangriaAtingido: Integer);
    function GetCodigoDaFinalizadoraNetPoint: TString;
    procedure SetCodigoDaFinalizadoraNetPoint(const ACodigoDaFinalizadoraNetPoint: TString);
    function GetDescricaoDaFinalizadoraNetPoint: TString;
    procedure SetDescricaoDaFinalizadoraNetPoint(const ADescricaoDaFinalizadoraNetPoint: TString);
  public
    property Id: Int64 read GetId write SetId;
    property IdentificadorDeBINSParaCartoes: TString read GetIdentificadorDeBINSParaCartoes write SetIdentificadorDeBINSParaCartoes;
    property ClientePadraoASerUtilizadoNasVendas: TString read GetClientePadraoASerUtilizadoNasVendas write SetClientePadraoASerUtilizadoNasVendas;
    property PrazoEmDiasParaClientesEmAtraso: TString read GetPrazoEmDiasParaClientesEmAtraso write SetPrazoEmDiasParaClientesEmAtraso;
    property QuantidadeDeDiasParaTrocaDoCaixa: Int64 read GetQuantidadeDeDiasParaTrocaDoCaixa write SetQuantidadeDeDiasParaTrocaDoCaixa;
    property EnderecoDeCargaParaOsCaixas: TString read GetEnderecoDeCargaParaOsCaixas write SetEnderecoDeCargaParaOsCaixas;
    property CaminhoDeLeituraDoArquivoDeClientesDeRetaguarda: TString read GetCaminhoDeLeituraDoArquivoDeClientesDeRetaguarda write SetCaminhoDeLeituraDoArquivoDeClientesDeRetaguarda;
    property CaminhoDeGeracaoDoArquivoDeClientesParaARetaguarda: TString read GetCaminhoDeGeracaoDoArquivoDeClientesParaARetaguarda write SetCaminhoDeGeracaoDoArquivoDeClientesParaARetaguarda;
    property CaminhoDeLeituraDoArquivoDePreVendasDeRetaguarda: TString read GetCaminhoDeLeituraDoArquivoDePreVendasDeRetaguarda write SetCaminhoDeLeituraDoArquivoDePreVendasDeRetaguarda;
    property CaminhoDeGeracaoDoArquivoDePreVendasParaARetaguarda: TString read GetCaminhoDeGeracaoDoArquivoDePreVendasParaARetaguarda write SetCaminhoDeGeracaoDoArquivoDePreVendasParaARetaguarda;
    property CaminhoDeRecebimentoDaRespostaDoTEF: TString read GetCaminhoDeRecebimentoDaRespostaDoTEF write SetCaminhoDeRecebimentoDaRespostaDoTEF;
    property CaminhoDeEnvioDaSolicitacaoParaOTEF: TString read GetCaminhoDeEnvioDaSolicitacaoParaOTEF write SetCaminhoDeEnvioDaSolicitacaoParaOTEF;
    property CaminhoDeRecebimentoDaRespostaDoTEF2: TString read GetCaminhoDeRecebimentoDaRespostaDoTEF2 write SetCaminhoDeRecebimentoDaRespostaDoTEF2;
    property CaminhoDeEnvioDaSolicitacaoParaOTEF2: TString read GetCaminhoDeEnvioDaSolicitacaoParaOTEF2 write SetCaminhoDeEnvioDaSolicitacaoParaOTEF2;
    property CaminhoDeRecebimentoDaRespostaDoTEF3: TString read GetCaminhoDeRecebimentoDaRespostaDoTEF3 write SetCaminhoDeRecebimentoDaRespostaDoTEF3;
    property CaminhoDeEnvioDaSolicitacaoParaOTEF3: TString read GetCaminhoDeEnvioDaSolicitacaoParaOTEF3 write SetCaminhoDeEnvioDaSolicitacaoParaOTEF3;
    property CaminhoDeRecebimentoDaRespostaDoTEF4: TString read GetCaminhoDeRecebimentoDaRespostaDoTEF4 write SetCaminhoDeRecebimentoDaRespostaDoTEF4;
    property CaminhoDeEnvioDaSolicitacaoParaOTEF4: TString read GetCaminhoDeEnvioDaSolicitacaoParaOTEF4 write SetCaminhoDeEnvioDaSolicitacaoParaOTEF4;
    property HabilitarCargaAutomaticaParaOPDV: Boolean read GetHabilitarCargaAutomaticaParaOPDV write SetHabilitarCargaAutomaticaParaOPDV;
    property IndicadorDeImpressaoNoECFDoCodigoDaPreVenda: TString read GetIndicadorDeImpressaoNoECFDoCodigoDaPreVenda write SetIndicadorDeImpressaoNoECFDoCodigoDaPreVenda;
    property NumeroIPDoServidorDeWebService: TString read GetNumeroIPDoServidorDeWebService write SetNumeroIPDoServidorDeWebService;
    property NumeroDoEnderecoIPDoServidorDeCarga: TString read GetNumeroDoEnderecoIPDoServidorDeCarga write SetNumeroDoEnderecoIPDoServidorDeCarga;
    property EnderecoIPDaEstacaoDeCarga: TString read GetEnderecoIPDaEstacaoDeCarga write SetEnderecoIPDaEstacaoDeCarga;
    property NumeroIPDoServidorDeRetaguarda: TString read GetNumeroIPDoServidorDeRetaguarda write SetNumeroIPDoServidorDeRetaguarda;
    property EnderecoDeEnvioOndeSeraGravadoOArquivoDaPreVenda: TString read GetEnderecoDeEnvioOndeSeraGravadoOArquivoDaPreVenda write SetEnderecoDeEnvioOndeSeraGravadoOArquivoDaPreVenda;
    property EnderecoIPDoServidorWEB: TString read GetEnderecoIPDoServidorWEB write SetEnderecoIPDoServidorWEB;
    property CodigoDaLojaParaOTEF: TString read GetCodigoDaLojaParaOTEF write SetCodigoDaLojaParaOTEF;
    property PercentualASerAplicadoComoAcrescimosNoCupom: Double read GetPercentualASerAplicadoComoAcrescimosNoCupom write SetPercentualASerAplicadoComoAcrescimosNoCupom;
    property TempoInicialParaExibicaoTelaEmSegundos: Int64 read GetTempoInicialParaExibicaoTelaEmSegundos write SetTempoInicialParaExibicaoTelaEmSegundos;
    property TempoEmSegundosParaExibicaoDaTelaProtecao: Int64 read GetTempoEmSegundosParaExibicaoDaTelaProtecao write SetTempoEmSegundosParaExibicaoDaTelaProtecao;
    property PortaDeComunicacaoComOServidorDeWebService: Int64 read GetPortaDeComunicacaoComOServidorDeWebService write SetPortaDeComunicacaoComOServidorDeWebService;
    property PortaDoServidorDeCarga: Int64 read GetPortaDoServidorDeCarga write SetPortaDoServidorDeCarga;
    property PortaDeComunicacaoEstacaoCarga: Int64 read GetPortaDeComunicacaoEstacaoCarga write SetPortaDeComunicacaoEstacaoCarga;
    property NumeroDaPortaDoServidorDaRetaguarda: Int64 read GetNumeroDaPortaDoServidorDaRetaguarda write SetNumeroDaPortaDoServidorDaRetaguarda;
    property PortaDeComunicacao: Int64 read GetPortaDeComunicacao write SetPortaDeComunicacao;
    property PortaDoServidorWEB: Int64 read GetPortaDoServidorWEB write SetPortaDoServidorWEB;
    property CodigoDaFinalizadora1ParaVendasComCartoes: TString read GetCodigoDaFinalizadora1ParaVendasComCartoes write SetCodigoDaFinalizadora1ParaVendasComCartoes;
    property CodigoDaFinalizadora2ParaVendasComCartoes: TString read GetCodigoDaFinalizadora2ParaVendasComCartoes write SetCodigoDaFinalizadora2ParaVendasComCartoes;
    property TipoDePrecoUtilizadoParaCartoes: TString read GetTipoDePrecoUtilizadoParaCartoes write SetTipoDePrecoUtilizadoParaCartoes;
    property ValorMinimoParaIdentificarConsumidor: Double read GetValorMinimoParaIdentificarConsumidor write SetValorMinimoParaIdentificarConsumidor;
    property EnderecoIPParaValidarVendasComSITEF: TString read GetEnderecoIPParaValidarVendasComSITEF write SetEnderecoIPParaValidarVendasComSITEF;
    property NomeEstabelecidoParaOPreco1: TString read GetNomeEstabelecidoParaOPreco1 write SetNomeEstabelecidoParaOPreco1;
    property NomeEstabelecidoParaOPreco2: TString read GetNomeEstabelecidoParaOPreco2 write SetNomeEstabelecidoParaOPreco2;
    property NomeEstabelecidoParaOPreco3: TString read GetNomeEstabelecidoParaOPreco3 write SetNomeEstabelecidoParaOPreco3;
    property TipoDoTEF: TString read GetTipoDoTEF write SetTipoDoTEF;
    property CaminhoParaOServidorWEBURL: TString read GetCaminhoParaOServidorWEBURL write SetCaminhoParaOServidorWEBURL;
    property VariacaoEmGramasParaBalanca: TString read GetVariacaoEmGramasParaBalanca write SetVariacaoEmGramasParaBalanca;
    property ValorMinimoParaLiberacaoEstacionamento: Double read GetValorMinimoParaLiberacaoEstacionamento write SetValorMinimoParaLiberacaoEstacionamento;
    property MensagemParaClienteIdentificado: TString read GetMensagemParaClienteIdentificado write SetMensagemParaClienteIdentificado;
    property MensagemParaClienteNaoIdentificado: TString read GetMensagemParaClienteNaoIdentificado write SetMensagemParaClienteNaoIdentificado;
    property BloquearVendaComPontoDeSangriaAtingido: Boolean read GetBloquearVendaComPontoDeSangriaAtingido write SetBloquearVendaComPontoDeSangriaAtingido;
    property QuantidadeABloquearVendaComPontoDeSangriaAtingido: Integer read GetQuantidadeABloquearVendaComPontoDeSangriaAtingido write SetQuantidadeABloquearVendaComPontoDeSangriaAtingido;
    property CodigoDaFinalizadoraNetPoint: TString read GetCodigoDaFinalizadoraNetPoint write SetCodigoDaFinalizadoraNetPoint;
    property DescricaoDaFinalizadoraNetPoint: TString read GetDescricaoDaFinalizadoraNetPoint write SetDescricaoDaFinalizadoraNetPoint;
  end;

implementation

{ TConfiguracaoPDVList }

procedure TConfiguracaoPDVList.Add(const AConfiguracaoPDV: IConfiguracaoPDV);
begin
  FList.Add(AConfiguracaoPDV);
end;

procedure TConfiguracaoPDVList.Clear;
begin
  FList.Clear;
end;

function TConfiguracaoPDVList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TConfiguracaoPDVList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TConfiguracaoPDVList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TConfiguracaoPDVList.GetEnumerator: TConfiguracaoPDVListEnumerator;
begin
  Result := TConfiguracaoPDVListEnumerator.Create(Self);
end;

function TConfiguracaoPDVList.GetItems(AIndex: Integer): IConfiguracaoPDV;
begin
  Result := FList[AIndex] as IConfiguracaoPDV;
end;

function TConfiguracaoPDVList.GetReference: TConfiguracaoPDVList;
begin
  Result := Self;
end;

procedure TConfiguracaoPDVList.SetItems(AIndex: Integer; const Value: IConfiguracaoPDV);
begin
  FList[AIndex] := Value;
end;

{ TConfiguracaoPDVListEnumerator }

constructor TConfiguracaoPDVListEnumerator.Create(AConfiguracaoPDVList: TConfiguracaoPDVList);
begin
  inherited Create;
  FIndex := -1;
  FConfiguracaoPDVList := AConfiguracaoPDVList;
end;

function TConfiguracaoPDVListEnumerator.GetCurrent: IConfiguracaoPDV;
begin
  Result := FConfiguracaoPDVList[FIndex];
end;

function TConfiguracaoPDVListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FConfiguracaoPDVList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TConfiguracaoPDVListRec }

class function TConfiguracaoPDVListRec.Create(const AList: IConfiguracaoPDVList): TConfiguracaoPDVListRec;
begin
  FillChar(Result, SizeOf(TConfiguracaoPDVListRec), 0);
  Result.FList := AList;
end;

class operator TConfiguracaoPDVListRec.Implicit(AListRec: TConfiguracaoPDVListRec): TConfiguracaoPDVList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TConfiguracaoPDV }

function TConfiguracaoPDV.GetId: Int64;
begin
  Result := FId;
end;

procedure TConfiguracaoPDV.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TConfiguracaoPDV.GetIdentificadorDeBINSParaCartoes: TString;
begin
  Result := FIdentificadorDeBINSParaCartoes;
end;

procedure TConfiguracaoPDV.SetIdentificadorDeBINSParaCartoes(const AIdentificadorDeBINSParaCartoes: TString);
begin
  FIdentificadorDeBINSParaCartoes := AIdentificadorDeBINSParaCartoes;
end;

function TConfiguracaoPDV.GetClientePadraoASerUtilizadoNasVendas: TString;
begin
  Result := FClientePadraoASerUtilizadoNasVendas;
end;

procedure TConfiguracaoPDV.SetClientePadraoASerUtilizadoNasVendas(const AClientePadraoASerUtilizadoNasVendas: TString);
begin
  FClientePadraoASerUtilizadoNasVendas := AClientePadraoASerUtilizadoNasVendas;
end;

function TConfiguracaoPDV.GetPrazoEmDiasParaClientesEmAtraso: TString;
begin
  Result := FPrazoEmDiasParaClientesEmAtraso;
end;

procedure TConfiguracaoPDV.SetPrazoEmDiasParaClientesEmAtraso(const APrazoEmDiasParaClientesEmAtraso: TString);
begin
  FPrazoEmDiasParaClientesEmAtraso := APrazoEmDiasParaClientesEmAtraso;
end;

function TConfiguracaoPDV.GetQuantidadeDeDiasParaTrocaDoCaixa: Int64;
begin
  Result := FQuantidadeDeDiasParaTrocaDoCaixa;
end;

procedure TConfiguracaoPDV.SetQuantidadeDeDiasParaTrocaDoCaixa(const AQuantidadeDeDiasParaTrocaDoCaixa: Int64);
begin
  FQuantidadeDeDiasParaTrocaDoCaixa := AQuantidadeDeDiasParaTrocaDoCaixa;
end;

function TConfiguracaoPDV.GetEnderecoDeCargaParaOsCaixas: TString;
begin
  Result := FEnderecoDeCargaParaOsCaixas;
end;

procedure TConfiguracaoPDV.SetEnderecoDeCargaParaOsCaixas(const AEnderecoDeCargaParaOsCaixas: TString);
begin
  FEnderecoDeCargaParaOsCaixas := AEnderecoDeCargaParaOsCaixas;
end;

function TConfiguracaoPDV.GetCaminhoDeLeituraDoArquivoDeClientesDeRetaguarda: TString;
begin
  Result := FCaminhoDeLeituraDoArquivoDeClientesDeRetaguarda;
end;

procedure TConfiguracaoPDV.SetCaminhoDeLeituraDoArquivoDeClientesDeRetaguarda(const ACaminhoDeLeituraDoArquivoDeClientesDeRetaguarda: TString);
begin
  FCaminhoDeLeituraDoArquivoDeClientesDeRetaguarda := ACaminhoDeLeituraDoArquivoDeClientesDeRetaguarda;
end;

function TConfiguracaoPDV.GetCaminhoDeGeracaoDoArquivoDeClientesParaARetaguarda: TString;
begin
  Result := FCaminhoDeGeracaoDoArquivoDeClientesParaARetaguarda;
end;

procedure TConfiguracaoPDV.SetCaminhoDeGeracaoDoArquivoDeClientesParaARetaguarda(const ACaminhoDeGeracaoDoArquivoDeClientesParaARetaguarda: TString);
begin
  FCaminhoDeGeracaoDoArquivoDeClientesParaARetaguarda := ACaminhoDeGeracaoDoArquivoDeClientesParaARetaguarda;
end;

function TConfiguracaoPDV.GetCaminhoDeLeituraDoArquivoDePreVendasDeRetaguarda: TString;
begin
  Result := FCaminhoDeLeituraDoArquivoDePreVendasDeRetaguarda;
end;

procedure TConfiguracaoPDV.SetCaminhoDeLeituraDoArquivoDePreVendasDeRetaguarda(const ACaminhoDeLeituraDoArquivoDePreVendasDeRetaguarda: TString);
begin
  FCaminhoDeLeituraDoArquivoDePreVendasDeRetaguarda := ACaminhoDeLeituraDoArquivoDePreVendasDeRetaguarda;
end;

function TConfiguracaoPDV.GetCaminhoDeGeracaoDoArquivoDePreVendasParaARetaguarda: TString;
begin
  Result := FCaminhoDeGeracaoDoArquivoDePreVendasParaARetaguarda;
end;

procedure TConfiguracaoPDV.SetCaminhoDeGeracaoDoArquivoDePreVendasParaARetaguarda(const ACaminhoDeGeracaoDoArquivoDePreVendasParaARetaguarda: TString);
begin
  FCaminhoDeGeracaoDoArquivoDePreVendasParaARetaguarda := ACaminhoDeGeracaoDoArquivoDePreVendasParaARetaguarda;
end;

function TConfiguracaoPDV.GetCaminhoDeRecebimentoDaRespostaDoTEF: TString;
begin
  Result := FCaminhoDeRecebimentoDaRespostaDoTEF;
end;

procedure TConfiguracaoPDV.SetCaminhoDeRecebimentoDaRespostaDoTEF(const ACaminhoDeRecebimentoDaRespostaDoTEF: TString);
begin
  FCaminhoDeRecebimentoDaRespostaDoTEF := ACaminhoDeRecebimentoDaRespostaDoTEF;
end;

function TConfiguracaoPDV.GetCaminhoDeEnvioDaSolicitacaoParaOTEF: TString;
begin
  Result := FCaminhoDeEnvioDaSolicitacaoParaOTEF;
end;

procedure TConfiguracaoPDV.SetCaminhoDeEnvioDaSolicitacaoParaOTEF(const ACaminhoDeEnvioDaSolicitacaoParaOTEF: TString);
begin
  FCaminhoDeEnvioDaSolicitacaoParaOTEF := ACaminhoDeEnvioDaSolicitacaoParaOTEF;
end;

function TConfiguracaoPDV.GetCaminhoDeRecebimentoDaRespostaDoTEF2: TString;
begin
  Result := FCaminhoDeRecebimentoDaRespostaDoTEF2;
end;

procedure TConfiguracaoPDV.SetCaminhoDeRecebimentoDaRespostaDoTEF2(const ACaminhoDeRecebimentoDaRespostaDoTEF2: TString);
begin
  FCaminhoDeRecebimentoDaRespostaDoTEF2 := ACaminhoDeRecebimentoDaRespostaDoTEF2;
end;

function TConfiguracaoPDV.GetCaminhoDeEnvioDaSolicitacaoParaOTEF2: TString;
begin
  Result := FCaminhoDeEnvioDaSolicitacaoParaOTEF2;
end;

procedure TConfiguracaoPDV.SetCaminhoDeEnvioDaSolicitacaoParaOTEF2(const ACaminhoDeEnvioDaSolicitacaoParaOTEF2: TString);
begin
  FCaminhoDeEnvioDaSolicitacaoParaOTEF2 := ACaminhoDeEnvioDaSolicitacaoParaOTEF2;
end;

function TConfiguracaoPDV.GetCaminhoDeRecebimentoDaRespostaDoTEF3: TString;
begin
  Result := FCaminhoDeRecebimentoDaRespostaDoTEF3;
end;

procedure TConfiguracaoPDV.SetCaminhoDeRecebimentoDaRespostaDoTEF3(const ACaminhoDeRecebimentoDaRespostaDoTEF3: TString);
begin
  FCaminhoDeRecebimentoDaRespostaDoTEF3 := ACaminhoDeRecebimentoDaRespostaDoTEF3;
end;

function TConfiguracaoPDV.GetCaminhoDeEnvioDaSolicitacaoParaOTEF3: TString;
begin
  Result := FCaminhoDeEnvioDaSolicitacaoParaOTEF3;
end;

procedure TConfiguracaoPDV.SetCaminhoDeEnvioDaSolicitacaoParaOTEF3(const ACaminhoDeEnvioDaSolicitacaoParaOTEF3: TString);
begin
  FCaminhoDeEnvioDaSolicitacaoParaOTEF3 := ACaminhoDeEnvioDaSolicitacaoParaOTEF3;
end;

function TConfiguracaoPDV.GetCaminhoDeRecebimentoDaRespostaDoTEF4: TString;
begin
  Result := FCaminhoDeRecebimentoDaRespostaDoTEF4;
end;

procedure TConfiguracaoPDV.SetCaminhoDeRecebimentoDaRespostaDoTEF4(const ACaminhoDeRecebimentoDaRespostaDoTEF4: TString);
begin
  FCaminhoDeRecebimentoDaRespostaDoTEF4 := ACaminhoDeRecebimentoDaRespostaDoTEF4;
end;

function TConfiguracaoPDV.GetCaminhoDeEnvioDaSolicitacaoParaOTEF4: TString;
begin
  Result := FCaminhoDeEnvioDaSolicitacaoParaOTEF4;
end;

procedure TConfiguracaoPDV.SetCaminhoDeEnvioDaSolicitacaoParaOTEF4(const ACaminhoDeEnvioDaSolicitacaoParaOTEF4: TString);
begin
  FCaminhoDeEnvioDaSolicitacaoParaOTEF4 := ACaminhoDeEnvioDaSolicitacaoParaOTEF4;
end;

function TConfiguracaoPDV.GetHabilitarCargaAutomaticaParaOPDV: Boolean;
begin
  Result := FHabilitarCargaAutomaticaParaOPDV;
end;

procedure TConfiguracaoPDV.SetHabilitarCargaAutomaticaParaOPDV(const AHabilitarCargaAutomaticaParaOPDV: Boolean);
begin
  FHabilitarCargaAutomaticaParaOPDV := AHabilitarCargaAutomaticaParaOPDV;
end;

function TConfiguracaoPDV.GetIndicadorDeImpressaoNoECFDoCodigoDaPreVenda: TString;
begin
  Result := FIndicadorDeImpressaoNoECFDoCodigoDaPreVenda;
end;

procedure TConfiguracaoPDV.SetIndicadorDeImpressaoNoECFDoCodigoDaPreVenda(const AIndicadorDeImpressaoNoECFDoCodigoDaPreVenda: TString);
begin
  FIndicadorDeImpressaoNoECFDoCodigoDaPreVenda := AIndicadorDeImpressaoNoECFDoCodigoDaPreVenda;
end;

function TConfiguracaoPDV.GetNumeroIPDoServidorDeWebService: TString;
begin
  Result := FNumeroIPDoServidorDeWebService;
end;

procedure TConfiguracaoPDV.SetNumeroIPDoServidorDeWebService(const ANumeroIPDoServidorDeWebService: TString);
begin
  FNumeroIPDoServidorDeWebService := ANumeroIPDoServidorDeWebService;
end;

function TConfiguracaoPDV.GetNumeroDoEnderecoIPDoServidorDeCarga: TString;
begin
  Result := FNumeroDoEnderecoIPDoServidorDeCarga;
end;

procedure TConfiguracaoPDV.SetNumeroDoEnderecoIPDoServidorDeCarga(const ANumeroDoEnderecoIPDoServidorDeCarga: TString);
begin
  FNumeroDoEnderecoIPDoServidorDeCarga := ANumeroDoEnderecoIPDoServidorDeCarga;
end;

function TConfiguracaoPDV.GetEnderecoIPDaEstacaoDeCarga: TString;
begin
  Result := FEnderecoIPDaEstacaoDeCarga;
end;

procedure TConfiguracaoPDV.SetEnderecoIPDaEstacaoDeCarga(const AEnderecoIPDaEstacaoDeCarga: TString);
begin
  FEnderecoIPDaEstacaoDeCarga := AEnderecoIPDaEstacaoDeCarga;
end;

function TConfiguracaoPDV.GetNumeroIPDoServidorDeRetaguarda: TString;
begin
  Result := FNumeroIPDoServidorDeRetaguarda;
end;

procedure TConfiguracaoPDV.SetNumeroIPDoServidorDeRetaguarda(const ANumeroIPDoServidorDeRetaguarda: TString);
begin
  FNumeroIPDoServidorDeRetaguarda := ANumeroIPDoServidorDeRetaguarda;
end;

function TConfiguracaoPDV.GetEnderecoDeEnvioOndeSeraGravadoOArquivoDaPreVenda: TString;
begin
  Result := FEnderecoDeEnvioOndeSeraGravadoOArquivoDaPreVenda;
end;

procedure TConfiguracaoPDV.SetEnderecoDeEnvioOndeSeraGravadoOArquivoDaPreVenda(const AEnderecoDeEnvioOndeSeraGravadoOArquivoDaPreVenda: TString);
begin
  FEnderecoDeEnvioOndeSeraGravadoOArquivoDaPreVenda := AEnderecoDeEnvioOndeSeraGravadoOArquivoDaPreVenda;
end;

function TConfiguracaoPDV.GetEnderecoIPDoServidorWEB: TString;
begin
  Result := FEnderecoIPDoServidorWEB;
end;

procedure TConfiguracaoPDV.SetEnderecoIPDoServidorWEB(const AEnderecoIPDoServidorWEB: TString);
begin
  FEnderecoIPDoServidorWEB := AEnderecoIPDoServidorWEB;
end;

function TConfiguracaoPDV.GetCodigoDaLojaParaOTEF: TString;
begin
  Result := FCodigoDaLojaParaOTEF;
end;

procedure TConfiguracaoPDV.SetCodigoDaLojaParaOTEF(const ACodigoDaLojaParaOTEF: TString);
begin
  FCodigoDaLojaParaOTEF := ACodigoDaLojaParaOTEF;
end;

function TConfiguracaoPDV.GetPercentualASerAplicadoComoAcrescimosNoCupom: Double;
begin
  Result := FPercentualASerAplicadoComoAcrescimosNoCupom;
end;

procedure TConfiguracaoPDV.SetPercentualASerAplicadoComoAcrescimosNoCupom(const APercentualASerAplicadoComoAcrescimosNoCupom: Double);
begin
  FPercentualASerAplicadoComoAcrescimosNoCupom := APercentualASerAplicadoComoAcrescimosNoCupom;
end;

function TConfiguracaoPDV.GetTempoInicialParaExibicaoTelaEmSegundos: Int64;
begin
  Result := FTempoInicialParaExibicaoTelaEmSegundos;
end;

procedure TConfiguracaoPDV.SetTempoInicialParaExibicaoTelaEmSegundos(const ATempoInicialParaExibicaoTelaEmSegundos: Int64);
begin
  FTempoInicialParaExibicaoTelaEmSegundos := ATempoInicialParaExibicaoTelaEmSegundos;
end;

function TConfiguracaoPDV.GetTempoEmSegundosParaExibicaoDaTelaProtecao: Int64;
begin
  Result := FTempoEmSegundosParaExibicaoDaTelaProtecao;
end;

procedure TConfiguracaoPDV.SetTempoEmSegundosParaExibicaoDaTelaProtecao(const ATempoEmSegundosParaExibicaoDaTelaProtecao: Int64);
begin
  FTempoEmSegundosParaExibicaoDaTelaProtecao := ATempoEmSegundosParaExibicaoDaTelaProtecao;
end;

function TConfiguracaoPDV.GetPortaDeComunicacaoComOServidorDeWebService: Int64;
begin
  Result := FPortaDeComunicacaoComOServidorDeWebService;
end;

procedure TConfiguracaoPDV.SetPortaDeComunicacaoComOServidorDeWebService(const APortaDeComunicacaoComOServidorDeWebService: Int64);
begin
  FPortaDeComunicacaoComOServidorDeWebService := APortaDeComunicacaoComOServidorDeWebService;
end;

function TConfiguracaoPDV.GetPortaDoServidorDeCarga: Int64;
begin
  Result := FPortaDoServidorDeCarga;
end;

procedure TConfiguracaoPDV.SetPortaDoServidorDeCarga(const APortaDoServidorDeCarga: Int64);
begin
  FPortaDoServidorDeCarga := APortaDoServidorDeCarga;
end;

function TConfiguracaoPDV.GetPortaDeComunicacaoEstacaoCarga: Int64;
begin
  Result := FPortaDeComunicacaoEstacaoCarga;
end;

procedure TConfiguracaoPDV.SetPortaDeComunicacaoEstacaoCarga(const APortaDeComunicacaoEstacaoCarga: Int64);
begin
  FPortaDeComunicacaoEstacaoCarga := APortaDeComunicacaoEstacaoCarga;
end;

function TConfiguracaoPDV.GetNumeroDaPortaDoServidorDaRetaguarda: Int64;
begin
  Result := FNumeroDaPortaDoServidorDaRetaguarda;
end;

procedure TConfiguracaoPDV.SetNumeroDaPortaDoServidorDaRetaguarda(const ANumeroDaPortaDoServidorDaRetaguarda: Int64);
begin
  FNumeroDaPortaDoServidorDaRetaguarda := ANumeroDaPortaDoServidorDaRetaguarda;
end;

function TConfiguracaoPDV.GetPortaDeComunicacao: Int64;
begin
  Result := FPortaDeComunicacao;
end;

procedure TConfiguracaoPDV.SetPortaDeComunicacao(const APortaDeComunicacao: Int64);
begin
  FPortaDeComunicacao := APortaDeComunicacao;
end;

function TConfiguracaoPDV.GetPortaDoServidorWEB: Int64;
begin
  Result := FPortaDoServidorWEB;
end;

procedure TConfiguracaoPDV.SetPortaDoServidorWEB(const APortaDoServidorWEB: Int64);
begin
  FPortaDoServidorWEB := APortaDoServidorWEB;
end;

function TConfiguracaoPDV.GetCodigoDaFinalizadora1ParaVendasComCartoes: TString;
begin
  Result := FCodigoDaFinalizadora1ParaVendasComCartoes;
end;

procedure TConfiguracaoPDV.SetCodigoDaFinalizadora1ParaVendasComCartoes(const ACodigoDaFinalizadora1ParaVendasComCartoes: TString);
begin
  FCodigoDaFinalizadora1ParaVendasComCartoes := ACodigoDaFinalizadora1ParaVendasComCartoes;
end;

function TConfiguracaoPDV.GetCodigoDaFinalizadora2ParaVendasComCartoes: TString;
begin
  Result := FCodigoDaFinalizadora2ParaVendasComCartoes;
end;

procedure TConfiguracaoPDV.SetCodigoDaFinalizadora2ParaVendasComCartoes(const ACodigoDaFinalizadora2ParaVendasComCartoes: TString);
begin
  FCodigoDaFinalizadora2ParaVendasComCartoes := ACodigoDaFinalizadora2ParaVendasComCartoes;
end;

function TConfiguracaoPDV.GetTipoDePrecoUtilizadoParaCartoes: TString;
begin
  Result := FTipoDePrecoUtilizadoParaCartoes;
end;

procedure TConfiguracaoPDV.SetTipoDePrecoUtilizadoParaCartoes(const ATipoDePrecoUtilizadoParaCartoes: TString);
begin
  FTipoDePrecoUtilizadoParaCartoes := ATipoDePrecoUtilizadoParaCartoes;
end;

function TConfiguracaoPDV.GetValorMinimoParaIdentificarConsumidor: Double;
begin
  Result := FValorMinimoParaIdentificarConsumidor;
end;

procedure TConfiguracaoPDV.SetValorMinimoParaIdentificarConsumidor(const AValorMinimoParaIdentificarConsumidor: Double);
begin
  FValorMinimoParaIdentificarConsumidor := AValorMinimoParaIdentificarConsumidor;
end;

function TConfiguracaoPDV.GetEnderecoIPParaValidarVendasComSITEF: TString;
begin
  Result := FEnderecoIPParaValidarVendasComSITEF;
end;

procedure TConfiguracaoPDV.SetEnderecoIPParaValidarVendasComSITEF(const AEnderecoIPParaValidarVendasComSITEF: TString);
begin
  FEnderecoIPParaValidarVendasComSITEF := AEnderecoIPParaValidarVendasComSITEF;
end;

function TConfiguracaoPDV.GetNomeEstabelecidoParaOPreco1: TString;
begin
  Result := FNomeEstabelecidoParaOPreco1;
end;

procedure TConfiguracaoPDV.SetNomeEstabelecidoParaOPreco1(const ANomeEstabelecidoParaOPreco1: TString);
begin
  FNomeEstabelecidoParaOPreco1 := ANomeEstabelecidoParaOPreco1;
end;

function TConfiguracaoPDV.GetNomeEstabelecidoParaOPreco2: TString;
begin
  Result := FNomeEstabelecidoParaOPreco2;
end;

procedure TConfiguracaoPDV.SetNomeEstabelecidoParaOPreco2(const ANomeEstabelecidoParaOPreco2: TString);
begin
  FNomeEstabelecidoParaOPreco2 := ANomeEstabelecidoParaOPreco2;
end;

function TConfiguracaoPDV.GetNomeEstabelecidoParaOPreco3: TString;
begin
  Result := FNomeEstabelecidoParaOPreco3;
end;

procedure TConfiguracaoPDV.SetNomeEstabelecidoParaOPreco3(const ANomeEstabelecidoParaOPreco3: TString);
begin
  FNomeEstabelecidoParaOPreco3 := ANomeEstabelecidoParaOPreco3;
end;

function TConfiguracaoPDV.GetTipoDoTEF: TString;
begin
  Result := FTipoDoTEF;
end;

procedure TConfiguracaoPDV.SetTipoDoTEF(const ATipoDoTEF: TString);
begin
  FTipoDoTEF := ATipoDoTEF;
end;

function TConfiguracaoPDV.GetCaminhoParaOServidorWEBURL: TString;
begin
  Result := FCaminhoParaOServidorWEBURL;
end;

procedure TConfiguracaoPDV.SetCaminhoParaOServidorWEBURL(const ACaminhoParaOServidorWEBURL: TString);
begin
  FCaminhoParaOServidorWEBURL := ACaminhoParaOServidorWEBURL;
end;

function TConfiguracaoPDV.GetVariacaoEmGramasParaBalanca: TString;
begin
  Result := FVariacaoEmGramasParaBalanca;
end;

procedure TConfiguracaoPDV.SetVariacaoEmGramasParaBalanca(const AVariacaoEmGramasParaBalanca: TString);
begin
  FVariacaoEmGramasParaBalanca := AVariacaoEmGramasParaBalanca;
end;

function TConfiguracaoPDV.GetValorMinimoParaLiberacaoEstacionamento: Double;
begin
  Result := FValorMinimoParaLiberacaoEstacionamento;
end;

procedure TConfiguracaoPDV.SetValorMinimoParaLiberacaoEstacionamento(const AValorMinimoParaLiberacaoEstacionamento: Double);
begin
  FValorMinimoParaLiberacaoEstacionamento := AValorMinimoParaLiberacaoEstacionamento;
end;

function TConfiguracaoPDV.GetMensagemParaClienteIdentificado: TString;
begin
  Result := FMensagemParaClienteIdentificado;
end;

procedure TConfiguracaoPDV.SetMensagemParaClienteIdentificado(const AMensagemParaClienteIdentificado: TString);
begin
  FMensagemParaClienteIdentificado := AMensagemParaClienteIdentificado;
end;

function TConfiguracaoPDV.GetMensagemParaClienteNaoIdentificado: TString;
begin
  Result := FMensagemParaClienteNaoIdentificado;
end;

procedure TConfiguracaoPDV.SetMensagemParaClienteNaoIdentificado(const AMensagemParaClienteNaoIdentificado: TString);
begin
  FMensagemParaClienteNaoIdentificado := AMensagemParaClienteNaoIdentificado;
end;

function TConfiguracaoPDV.GetBloquearVendaComPontoDeSangriaAtingido: Boolean;
begin
  Result := FBloquearVendaComPontoDeSangriaAtingido;
end;

procedure TConfiguracaoPDV.SetBloquearVendaComPontoDeSangriaAtingido(const ABloquearVendaComPontoDeSangriaAtingido: Boolean);
begin
  FBloquearVendaComPontoDeSangriaAtingido := ABloquearVendaComPontoDeSangriaAtingido;
end;

function TConfiguracaoPDV.GetQuantidadeABloquearVendaComPontoDeSangriaAtingido: Integer;
begin
  Result := FQuantidadeABloquearVendaComPontoDeSangriaAtingido;
end;

procedure TConfiguracaoPDV.SetQuantidadeABloquearVendaComPontoDeSangriaAtingido(const AQuantidadeABloquearVendaComPontoDeSangriaAtingido: Integer);
begin
  FQuantidadeABloquearVendaComPontoDeSangriaAtingido := AQuantidadeABloquearVendaComPontoDeSangriaAtingido;
end;

function TConfiguracaoPDV.GetCodigoDaFinalizadoraNetPoint: TString;
begin
  Result := FCodigoDaFinalizadoraNetPoint;
end;

procedure TConfiguracaoPDV.SetCodigoDaFinalizadoraNetPoint(const ACodigoDaFinalizadoraNetPoint: TString);
begin
  FCodigoDaFinalizadoraNetPoint := ACodigoDaFinalizadoraNetPoint;
end;

function TConfiguracaoPDV.GetDescricaoDaFinalizadoraNetPoint: TString;
begin
  Result := FDescricaoDaFinalizadoraNetPoint;
end;

procedure TConfiguracaoPDV.SetDescricaoDaFinalizadoraNetPoint(const ADescricaoDaFinalizadoraNetPoint: TString);
begin
  FDescricaoDaFinalizadoraNetPoint := ADescricaoDaFinalizadoraNetPoint;
end;


end.
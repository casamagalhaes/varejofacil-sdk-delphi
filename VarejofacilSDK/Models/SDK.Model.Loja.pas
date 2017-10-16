unit SDK.Model.Loja;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ILoja = interface(IModel)
    ['{DEC61391-AA13-4D63-A024-8ED352F04495}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetPerfilFiscal: TPerfilFiscal;
    procedure SetPerfilFiscal(const APerfilFiscal: TPerfilFiscal);
    function GetAtividadeEconomica: TAtividadeEconomica;
    procedure SetAtividadeEconomica(const AAtividadeEconomica: TAtividadeEconomica);
    function GetRamoAtuacaoId: Integer;
    procedure SetRamoAtuacaoId(const ARamoAtuacaoId: Integer);
    function GetAgenteValidacao: TResponsavelValidacao;
    procedure SetAgenteValidacao(const AAgenteValidacao: TResponsavelValidacao);
    function GetConciliadora: TConciliadora;
    procedure SetConciliadora(const AConciliadora: TConciliadora);
    function GetRegimeEstadualTributarioId: Int64;
    procedure SetRegimeEstadualTributarioId(const ARegimeEstadualTributarioId: Int64);
    function GetContaDeEmailId: Int64;
    procedure SetContaDeEmailId(const AContaDeEmailId: Int64);
    function GetCodReceitaICMS: Integer;
    procedure SetCodReceitaICMS(const ACodReceitaICMS: Integer);
    function GetCodReceitaICMSST: Integer;
    procedure SetCodReceitaICMSST(const ACodReceitaICMSST: Integer);
    function GetCodReceitaPIS: Integer;
    procedure SetCodReceitaPIS(const ACodReceitaPIS: Integer);
    function GetCodReceitaCOFINS: Integer;
    procedure SetCodReceitaCOFINS(const ACodReceitaCOFINS: Integer);
    function GetCodRecolherICMSST: Integer;
    procedure SetCodRecolherICMSST(const ACodRecolherICMSST: Integer);
    function GetCrt: Integer;
    procedure SetCrt(const ACrt: Integer);
    function GetPrecoAplicado: Integer;
    procedure SetPrecoAplicado(const APrecoAplicado: Integer);
    function GetMeses: Integer;
    procedure SetMeses(const AMeses: Integer);
    function GetPorta: Integer;
    procedure SetPorta(const APorta: Integer);
    function GetTokenNetpoints: TString;
    procedure SetTokenNetpoints(const ATokenNetpoints: TString);
    function GetMix: TString;
    procedure SetMix(const AMix: TString);
    function GetMatriz: Boolean;
    procedure SetMatriz(const AMatriz: Boolean);
    function GetSigla: TString;
    procedure SetSigla(const ASigla: TString);
    function GetHashMd5DoSysPDV: TString;
    procedure SetHashMd5DoSysPDV(const AHashMd5DoSysPDV: TString);
    function GetChaveDoServer: TString;
    procedure SetChaveDoServer(const AChaveDoServer: TString);
    function GetVersaoDoServer: TString;
    procedure SetVersaoDoServer(const AVersaoDoServer: TString);
    function GetVersaoDoPDV: TString;
    procedure SetVersaoDoPDV(const AVersaoDoPDV: TString);
    function GetRegimeFederal: TString;
    procedure SetRegimeFederal(const ARegimeFederal: TString);
    function GetRegimeEstadual: TString;
    procedure SetRegimeEstadual(const ARegimeEstadual: TString);
    function GetRegimeMunicipal: TString;
    procedure SetRegimeMunicipal(const ARegimeMunicipal: TString);
    function GetEspecializacaoSimplesNacional: TString;
    procedure SetEspecializacaoSimplesNacional(const AEspecializacaoSimplesNacional: TString);
    function GetIp: TString;
    procedure SetIp(const AIp: TString);
    function GetTokenBRWS: TString;
    procedure SetTokenBRWS(const ATokenBRWS: TString);
    function GetEntradaDeNotaPorAtendimentoDePedido: Boolean;
    procedure SetEntradaDeNotaPorAtendimentoDePedido(const AEntradaDeNotaPorAtendimentoDePedido: Boolean);
    function GetControlaCartao: Boolean;
    procedure SetControlaCartao(const AControlaCartao: Boolean);
    function GetEntradaDeNotaPorConferenciaDeMercadoria: Boolean;
    procedure SetEntradaDeNotaPorConferenciaDeMercadoria(const AEntradaDeNotaPorConferenciaDeMercadoria: Boolean);
    function GetEntradaDeNotaPorRecepcao: Boolean;
    procedure SetEntradaDeNotaPorRecepcao(const AEntradaDeNotaPorRecepcao: Boolean);
    function GetAtivo: Boolean;
    procedure SetAtivo(const AAtivo: Boolean);
    function GetEcommerce: Boolean;
    procedure SetEcommerce(const AEcommerce: Boolean);
    function GetValidarIcms: Boolean;
    procedure SetValidarIcms(const AValidarIcms: Boolean);
    function GetValidarPisCofins: Boolean;
    procedure SetValidarPisCofins(const AValidarPisCofins: Boolean);
    function GetIntegracaoRmsAtiva: Boolean;
    procedure SetIntegracaoRmsAtiva(const AIntegracaoRmsAtiva: Boolean);
    function GetFaturamedoInicial: Double;
    procedure SetFaturamedoInicial(const AFaturamedoInicial: Double);
    function GetMetroQuadrado: Double;
    procedure SetMetroQuadrado(const AMetroQuadrado: Double);
    function GetFaixaInicial: Double;
    procedure SetFaixaInicial(const AFaixaInicial: Double);
    function GetFaixaFinal: Double;
    procedure SetFaixaFinal(const AFaixaFinal: Double);
    function GetIrpj: Double;
    procedure SetIrpj(const AIrpj: Double);
    function GetCsll: Double;
    procedure SetCsll(const ACsll: Double);
    function GetCofins: Double;
    procedure SetCofins(const ACofins: Double);
    function GetPis: Double;
    procedure SetPis(const APis: Double);
    function GetCpp: Double;
    procedure SetCpp(const ACpp: Double);
    function GetIcms: Double;
    procedure SetIcms(const AIcms: Double);
    function GetIpi: Double;
    procedure SetIpi(const AIpi: Double);
    function GetIss: Double;
    procedure SetIss(const AIss: Double);
    function GetAliquotaTotal: Double;
    procedure SetAliquotaTotal(const AAliquotaTotal: Double);
    function GetCategoriaFinanceiraDeJurosPagosId: Int64;
    procedure SetCategoriaFinanceiraDeJurosPagosId(const ACategoriaFinanceiraDeJurosPagosId: Int64);
    function GetCategoriaFinanceiraDeMultasPagasId: Int64;
    procedure SetCategoriaFinanceiraDeMultasPagasId(const ACategoriaFinanceiraDeMultasPagasId: Int64);
    function GetCategoriaFinanceiraDeDescontosRecebidosId: Int64;
    procedure SetCategoriaFinanceiraDeDescontosRecebidosId(const ACategoriaFinanceiraDeDescontosRecebidosId: Int64);
    function GetCategoriaFinanceiraDeEstornosDePagamentoId: Int64;
    procedure SetCategoriaFinanceiraDeEstornosDePagamentoId(const ACategoriaFinanceiraDeEstornosDePagamentoId: Int64);
    function GetCategoriaFinanceiraDeJurosRecebidosId: Int64;
    procedure SetCategoriaFinanceiraDeJurosRecebidosId(const ACategoriaFinanceiraDeJurosRecebidosId: Int64);
    function GetCategoriaFinanceiraDeMultasRecebidasId: Int64;
    procedure SetCategoriaFinanceiraDeMultasRecebidasId(const ACategoriaFinanceiraDeMultasRecebidasId: Int64);
    function GetCategoriaFinanceiraDeDescontosConcedidosId: Int64;
    procedure SetCategoriaFinanceiraDeDescontosConcedidosId(const ACategoriaFinanceiraDeDescontosConcedidosId: Int64);
    function GetCategoriaFinanceiraDeEstornosDeRecebimentoId: Int64;
    procedure SetCategoriaFinanceiraDeEstornosDeRecebimentoId(const ACategoriaFinanceiraDeEstornosDeRecebimentoId: Int64);
    function GetCategoriaFinanceiraDeAcrescimosEmComprasId: Int64;
    procedure SetCategoriaFinanceiraDeAcrescimosEmComprasId(const ACategoriaFinanceiraDeAcrescimosEmComprasId: Int64);
    function GetCategoriaFinanceiraDeAcrescimosEmVendasId: Int64;
    procedure SetCategoriaFinanceiraDeAcrescimosEmVendasId(const ACategoriaFinanceiraDeAcrescimosEmVendasId: Int64);
    function GetCategoriaFinanceiraDePagamentosId: Int64;
    procedure SetCategoriaFinanceiraDePagamentosId(const ACategoriaFinanceiraDePagamentosId: Int64);
    function GetCategoriaFinanceiraDeRecebimentosId: Int64;
    procedure SetCategoriaFinanceiraDeRecebimentosId(const ACategoriaFinanceiraDeRecebimentosId: Int64);
    function GetCategoriaFinanceiraDeQuebraId: Int64;
    procedure SetCategoriaFinanceiraDeQuebraId(const ACategoriaFinanceiraDeQuebraId: Int64);
    function GetCategoriaFinanceiraDeSobraId: Int64;
    procedure SetCategoriaFinanceiraDeSobraId(const ACategoriaFinanceiraDeSobraId: Int64);
    function GetLocaisDaLojaId: TLongList;
    procedure SetLocaisDaLojaId(const ALocaisDaLojaId: TLongList);
    function GetNumeroDoDocumento: TString;
    procedure SetNumeroDoDocumento(const ANumeroDoDocumento: TString);
    function GetNumeroDeIdentificacao: TString;
    procedure SetNumeroDeIdentificacao(const ANumeroDeIdentificacao: TString);
    function GetOrgaoExpedidor: TString;
    procedure SetOrgaoExpedidor(const AOrgaoExpedidor: TString);
    function GetCei: TString;
    procedure SetCei(const ACei: TString);
    function GetInscricaoMunicipal: TString;
    procedure SetInscricaoMunicipal(const AInscricaoMunicipal: TString);
    function GetNome: TString;
    procedure SetNome(const ANome: TString);
    function GetFantasia: TString;
    procedure SetFantasia(const AFantasia: TString);
    function GetTelefone1: TString;
    procedure SetTelefone1(const ATelefone1: TString);
    function GetTelefone2: TString;
    procedure SetTelefone2(const ATelefone2: TString);
    function GetFax: TString;
    procedure SetFax(const AFax: TString);
    function GetEmail: TString;
    procedure SetEmail(const AEmail: TString);
    function GetHomePage: TString;
    procedure SetHomePage(const AHomePage: TString);
    function GetRedeSocial: TString;
    procedure SetRedeSocial(const ARedeSocial: TString);
    function GetTwitter: TString;
    procedure SetTwitter(const ATwitter: TString);
    function GetComunicadorDeMensagensInstantaneas: TString;
    procedure SetComunicadorDeMensagensInstantaneas(const AComunicadorDeMensagensInstantaneas: TString);
    function GetSuframa: TString;
    procedure SetSuframa(const ASuframa: TString);
    function GetTipo: TTipoPessoa;
    procedure SetTipo(const ATipo: TTipoPessoa);
    function GetHoldingId: Integer;
    procedure SetHoldingId(const AHoldingId: Integer);
    function GetCep: TString;
    procedure SetCep(const ACep: TString);
    function GetUf: TString;
    procedure SetUf(const AUf: TString);
    function GetCodigoPais: Integer;
    procedure SetCodigoPais(const ACodigoPais: Integer);
    function GetLogradouro: TString;
    procedure SetLogradouro(const ALogradouro: TString);
    function GetNumero: TString;
    procedure SetNumero(const ANumero: TString);
    function GetBairro: TString;
    procedure SetBairro(const ABairro: TString);
    function GetComplemento: TString;
    procedure SetComplemento(const AComplemento: TString);
    function GetPontoReferencia: TString;
    procedure SetPontoReferencia(const APontoReferencia: TString);
    function GetCodigoIbge: Int64;
    procedure SetCodigoIbge(const ACodigoIbge: Int64);
    function GetDescricaoMunicipio: TString;
    procedure SetDescricaoMunicipio(const ADescricaoMunicipio: TString);
    property Id: Int64 read GetId write SetId;
    property PerfilFiscal: TPerfilFiscal read GetPerfilFiscal write SetPerfilFiscal;
    property AtividadeEconomica: TAtividadeEconomica read GetAtividadeEconomica write SetAtividadeEconomica;
    property RamoAtuacaoId: Integer read GetRamoAtuacaoId write SetRamoAtuacaoId;
    property AgenteValidacao: TResponsavelValidacao read GetAgenteValidacao write SetAgenteValidacao;
    property Conciliadora: TConciliadora read GetConciliadora write SetConciliadora;
    property RegimeEstadualTributarioId: Int64 read GetRegimeEstadualTributarioId write SetRegimeEstadualTributarioId;
    property ContaDeEmailId: Int64 read GetContaDeEmailId write SetContaDeEmailId;
    property CodReceitaICMS: Integer read GetCodReceitaICMS write SetCodReceitaICMS;
    property CodReceitaICMSST: Integer read GetCodReceitaICMSST write SetCodReceitaICMSST;
    property CodReceitaPIS: Integer read GetCodReceitaPIS write SetCodReceitaPIS;
    property CodReceitaCOFINS: Integer read GetCodReceitaCOFINS write SetCodReceitaCOFINS;
    property CodRecolherICMSST: Integer read GetCodRecolherICMSST write SetCodRecolherICMSST;
    property Crt: Integer read GetCrt write SetCrt;
    property PrecoAplicado: Integer read GetPrecoAplicado write SetPrecoAplicado;
    property Meses: Integer read GetMeses write SetMeses;
    property Porta: Integer read GetPorta write SetPorta;
    property TokenNetpoints: TString read GetTokenNetpoints write SetTokenNetpoints;
    property Mix: TString read GetMix write SetMix;
    property Matriz: Boolean read GetMatriz write SetMatriz;
    property Sigla: TString read GetSigla write SetSigla;
    property HashMd5DoSysPDV: TString read GetHashMd5DoSysPDV write SetHashMd5DoSysPDV;
    property ChaveDoServer: TString read GetChaveDoServer write SetChaveDoServer;
    property VersaoDoServer: TString read GetVersaoDoServer write SetVersaoDoServer;
    property VersaoDoPDV: TString read GetVersaoDoPDV write SetVersaoDoPDV;
    property RegimeFederal: TString read GetRegimeFederal write SetRegimeFederal;
    property RegimeEstadual: TString read GetRegimeEstadual write SetRegimeEstadual;
    property RegimeMunicipal: TString read GetRegimeMunicipal write SetRegimeMunicipal;
    property EspecializacaoSimplesNacional: TString read GetEspecializacaoSimplesNacional write SetEspecializacaoSimplesNacional;
    property Ip: TString read GetIp write SetIp;
    property TokenBRWS: TString read GetTokenBRWS write SetTokenBRWS;
    property EntradaDeNotaPorAtendimentoDePedido: Boolean read GetEntradaDeNotaPorAtendimentoDePedido write SetEntradaDeNotaPorAtendimentoDePedido;
    property ControlaCartao: Boolean read GetControlaCartao write SetControlaCartao;
    property EntradaDeNotaPorConferenciaDeMercadoria: Boolean read GetEntradaDeNotaPorConferenciaDeMercadoria write SetEntradaDeNotaPorConferenciaDeMercadoria;
    property EntradaDeNotaPorRecepcao: Boolean read GetEntradaDeNotaPorRecepcao write SetEntradaDeNotaPorRecepcao;
    property Ativo: Boolean read GetAtivo write SetAtivo;
    property Ecommerce: Boolean read GetEcommerce write SetEcommerce;
    property ValidarIcms: Boolean read GetValidarIcms write SetValidarIcms;
    property ValidarPisCofins: Boolean read GetValidarPisCofins write SetValidarPisCofins;
    property IntegracaoRmsAtiva: Boolean read GetIntegracaoRmsAtiva write SetIntegracaoRmsAtiva;
    property FaturamedoInicial: Double read GetFaturamedoInicial write SetFaturamedoInicial;
    property MetroQuadrado: Double read GetMetroQuadrado write SetMetroQuadrado;
    property FaixaInicial: Double read GetFaixaInicial write SetFaixaInicial;
    property FaixaFinal: Double read GetFaixaFinal write SetFaixaFinal;
    property Irpj: Double read GetIrpj write SetIrpj;
    property Csll: Double read GetCsll write SetCsll;
    property Cofins: Double read GetCofins write SetCofins;
    property Pis: Double read GetPis write SetPis;
    property Cpp: Double read GetCpp write SetCpp;
    property Icms: Double read GetIcms write SetIcms;
    property Ipi: Double read GetIpi write SetIpi;
    property Iss: Double read GetIss write SetIss;
    property AliquotaTotal: Double read GetAliquotaTotal write SetAliquotaTotal;
    property CategoriaFinanceiraDeJurosPagosId: Int64 read GetCategoriaFinanceiraDeJurosPagosId write SetCategoriaFinanceiraDeJurosPagosId;
    property CategoriaFinanceiraDeMultasPagasId: Int64 read GetCategoriaFinanceiraDeMultasPagasId write SetCategoriaFinanceiraDeMultasPagasId;
    property CategoriaFinanceiraDeDescontosRecebidosId: Int64 read GetCategoriaFinanceiraDeDescontosRecebidosId write SetCategoriaFinanceiraDeDescontosRecebidosId;
    property CategoriaFinanceiraDeEstornosDePagamentoId: Int64 read GetCategoriaFinanceiraDeEstornosDePagamentoId write SetCategoriaFinanceiraDeEstornosDePagamentoId;
    property CategoriaFinanceiraDeJurosRecebidosId: Int64 read GetCategoriaFinanceiraDeJurosRecebidosId write SetCategoriaFinanceiraDeJurosRecebidosId;
    property CategoriaFinanceiraDeMultasRecebidasId: Int64 read GetCategoriaFinanceiraDeMultasRecebidasId write SetCategoriaFinanceiraDeMultasRecebidasId;
    property CategoriaFinanceiraDeDescontosConcedidosId: Int64 read GetCategoriaFinanceiraDeDescontosConcedidosId write SetCategoriaFinanceiraDeDescontosConcedidosId;
    property CategoriaFinanceiraDeEstornosDeRecebimentoId: Int64 read GetCategoriaFinanceiraDeEstornosDeRecebimentoId write SetCategoriaFinanceiraDeEstornosDeRecebimentoId;
    property CategoriaFinanceiraDeAcrescimosEmComprasId: Int64 read GetCategoriaFinanceiraDeAcrescimosEmComprasId write SetCategoriaFinanceiraDeAcrescimosEmComprasId;
    property CategoriaFinanceiraDeAcrescimosEmVendasId: Int64 read GetCategoriaFinanceiraDeAcrescimosEmVendasId write SetCategoriaFinanceiraDeAcrescimosEmVendasId;
    property CategoriaFinanceiraDePagamentosId: Int64 read GetCategoriaFinanceiraDePagamentosId write SetCategoriaFinanceiraDePagamentosId;
    property CategoriaFinanceiraDeRecebimentosId: Int64 read GetCategoriaFinanceiraDeRecebimentosId write SetCategoriaFinanceiraDeRecebimentosId;
    property CategoriaFinanceiraDeQuebraId: Int64 read GetCategoriaFinanceiraDeQuebraId write SetCategoriaFinanceiraDeQuebraId;
    property CategoriaFinanceiraDeSobraId: Int64 read GetCategoriaFinanceiraDeSobraId write SetCategoriaFinanceiraDeSobraId;
    property LocaisDaLojaId: TLongList read GetLocaisDaLojaId write SetLocaisDaLojaId;
    property NumeroDoDocumento: TString read GetNumeroDoDocumento write SetNumeroDoDocumento;
    property NumeroDeIdentificacao: TString read GetNumeroDeIdentificacao write SetNumeroDeIdentificacao;
    property OrgaoExpedidor: TString read GetOrgaoExpedidor write SetOrgaoExpedidor;
    property Cei: TString read GetCei write SetCei;
    property InscricaoMunicipal: TString read GetInscricaoMunicipal write SetInscricaoMunicipal;
    property Nome: TString read GetNome write SetNome;
    property Fantasia: TString read GetFantasia write SetFantasia;
    property Telefone1: TString read GetTelefone1 write SetTelefone1;
    property Telefone2: TString read GetTelefone2 write SetTelefone2;
    property Fax: TString read GetFax write SetFax;
    property Email: TString read GetEmail write SetEmail;
    property HomePage: TString read GetHomePage write SetHomePage;
    property RedeSocial: TString read GetRedeSocial write SetRedeSocial;
    property Twitter: TString read GetTwitter write SetTwitter;
    property ComunicadorDeMensagensInstantaneas: TString read GetComunicadorDeMensagensInstantaneas write SetComunicadorDeMensagensInstantaneas;
    property Suframa: TString read GetSuframa write SetSuframa;
    property Tipo: TTipoPessoa read GetTipo write SetTipo;
    property HoldingId: Integer read GetHoldingId write SetHoldingId;
    property Cep: TString read GetCep write SetCep;
    property Uf: TString read GetUf write SetUf;
    property CodigoPais: Integer read GetCodigoPais write SetCodigoPais;
    property Logradouro: TString read GetLogradouro write SetLogradouro;
    property Numero: TString read GetNumero write SetNumero;
    property Bairro: TString read GetBairro write SetBairro;
    property Complemento: TString read GetComplemento write SetComplemento;
    property PontoReferencia: TString read GetPontoReferencia write SetPontoReferencia;
    property CodigoIbge: Int64 read GetCodigoIbge write SetCodigoIbge;
    property DescricaoMunicipio: TString read GetDescricaoMunicipio write SetDescricaoMunicipio;
  end;

  TLojaList = class;

  ILojaList = interface
	['{6EFBBF24-D279-403B-94C6-8C807C8B833B}']
    function GetReference: TLojaList;
    function GetItems(AIndex: Integer): ILoja;
    procedure SetItems(AIndex: Integer; const Value: ILoja);
    procedure Add(const ALoja: ILoja);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ILoja read GetItems write SetItems; default;
  end;

  TLojaListEnumerator = class
  private
    FIndex: Integer;
    FLojaList: TLojaList;
  public
    constructor Create(ALojaList: TLojaList);
    function GetCurrent: ILoja; inline;
    function MoveNext: Boolean;
    property Current: ILoja read GetCurrent;
  end;

  TLojaList = class(TInterfacedObject, ILojaList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ILoja;
    procedure SetItems(AIndex: Integer; const Value: ILoja);
  public
    constructor Create;
    procedure Add(const ALoja: ILoja);
    destructor Destroy; override;
    function GetEnumerator: TLojaListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TLojaList;
    property Items[AIndex: Integer]: ILoja read GetItems write SetItems; default;
  end;

  TLojaListRec = record
  private
    FList: ILojaList;
  public
    class function Create(const AList: ILojaList): TLojaListRec; static;
    class operator Implicit(AListRec: TLojaListRec): TLojaList;
  end;

  TLoja = class(TInterfacedModel, ILoja)
  private
	FId: Int64;
	FPerfilFiscal: TPerfilFiscal;
	FAtividadeEconomica: TAtividadeEconomica;
	FRamoAtuacaoId: Integer;
	FAgenteValidacao: TResponsavelValidacao;
	FConciliadora: TConciliadora;
	FRegimeEstadualTributarioId: Int64;
	FContaDeEmailId: Int64;
	FCodReceitaICMS: Integer;
	FCodReceitaICMSST: Integer;
	FCodReceitaPIS: Integer;
	FCodReceitaCOFINS: Integer;
	FCodRecolherICMSST: Integer;
	FCrt: Integer;
	FPrecoAplicado: Integer;
	FMeses: Integer;
	FPorta: Integer;
	FTokenNetpoints: TString;
	FMix: TString;
	FMatriz: Boolean;
	FSigla: TString;
	FHashMd5DoSysPDV: TString;
	FChaveDoServer: TString;
	FVersaoDoServer: TString;
	FVersaoDoPDV: TString;
	FRegimeFederal: TString;
	FRegimeEstadual: TString;
	FRegimeMunicipal: TString;
	FEspecializacaoSimplesNacional: TString;
	FIp: TString;
	FTokenBRWS: TString;
	FEntradaDeNotaPorAtendimentoDePedido: Boolean;
	FControlaCartao: Boolean;
	FEntradaDeNotaPorConferenciaDeMercadoria: Boolean;
	FEntradaDeNotaPorRecepcao: Boolean;
	FAtivo: Boolean;
	FEcommerce: Boolean;
	FValidarIcms: Boolean;
	FValidarPisCofins: Boolean;
	FIntegracaoRmsAtiva: Boolean;
	FFaturamedoInicial: Double;
	FMetroQuadrado: Double;
	FFaixaInicial: Double;
	FFaixaFinal: Double;
	FIrpj: Double;
	FCsll: Double;
	FCofins: Double;
	FPis: Double;
	FCpp: Double;
	FIcms: Double;
	FIpi: Double;
	FIss: Double;
	FAliquotaTotal: Double;
	FCategoriaFinanceiraDeJurosPagosId: Int64;
	FCategoriaFinanceiraDeMultasPagasId: Int64;
	FCategoriaFinanceiraDeDescontosRecebidosId: Int64;
	FCategoriaFinanceiraDeEstornosDePagamentoId: Int64;
	FCategoriaFinanceiraDeJurosRecebidosId: Int64;
	FCategoriaFinanceiraDeMultasRecebidasId: Int64;
	FCategoriaFinanceiraDeDescontosConcedidosId: Int64;
	FCategoriaFinanceiraDeEstornosDeRecebimentoId: Int64;
	FCategoriaFinanceiraDeAcrescimosEmComprasId: Int64;
	FCategoriaFinanceiraDeAcrescimosEmVendasId: Int64;
	FCategoriaFinanceiraDePagamentosId: Int64;
	FCategoriaFinanceiraDeRecebimentosId: Int64;
	FCategoriaFinanceiraDeQuebraId: Int64;
	FCategoriaFinanceiraDeSobraId: Int64;
	FLocaisDaLojaId: TLongList;
	FNumeroDoDocumento: TString;
	FNumeroDeIdentificacao: TString;
	FOrgaoExpedidor: TString;
	FCei: TString;
	FInscricaoMunicipal: TString;
	FNome: TString;
	FFantasia: TString;
	FTelefone1: TString;
	FTelefone2: TString;
	FFax: TString;
	FEmail: TString;
	FHomePage: TString;
	FRedeSocial: TString;
	FTwitter: TString;
	FComunicadorDeMensagensInstantaneas: TString;
	FSuframa: TString;
	FTipo: TTipoPessoa;
	FHoldingId: Integer;
	FCep: TString;
	FUf: TString;
	FCodigoPais: Integer;
	FLogradouro: TString;
	FNumero: TString;
	FBairro: TString;
	FComplemento: TString;
	FPontoReferencia: TString;
	FCodigoIbge: Int64;
	FDescricaoMunicipio: TString;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetPerfilFiscal: TPerfilFiscal;
    procedure SetPerfilFiscal(const APerfilFiscal: TPerfilFiscal);
    function GetAtividadeEconomica: TAtividadeEconomica;
    procedure SetAtividadeEconomica(const AAtividadeEconomica: TAtividadeEconomica);
    function GetRamoAtuacaoId: Integer;
    procedure SetRamoAtuacaoId(const ARamoAtuacaoId: Integer);
    function GetAgenteValidacao: TResponsavelValidacao;
    procedure SetAgenteValidacao(const AAgenteValidacao: TResponsavelValidacao);
    function GetConciliadora: TConciliadora;
    procedure SetConciliadora(const AConciliadora: TConciliadora);
    function GetRegimeEstadualTributarioId: Int64;
    procedure SetRegimeEstadualTributarioId(const ARegimeEstadualTributarioId: Int64);
    function GetContaDeEmailId: Int64;
    procedure SetContaDeEmailId(const AContaDeEmailId: Int64);
    function GetCodReceitaICMS: Integer;
    procedure SetCodReceitaICMS(const ACodReceitaICMS: Integer);
    function GetCodReceitaICMSST: Integer;
    procedure SetCodReceitaICMSST(const ACodReceitaICMSST: Integer);
    function GetCodReceitaPIS: Integer;
    procedure SetCodReceitaPIS(const ACodReceitaPIS: Integer);
    function GetCodReceitaCOFINS: Integer;
    procedure SetCodReceitaCOFINS(const ACodReceitaCOFINS: Integer);
    function GetCodRecolherICMSST: Integer;
    procedure SetCodRecolherICMSST(const ACodRecolherICMSST: Integer);
    function GetCrt: Integer;
    procedure SetCrt(const ACrt: Integer);
    function GetPrecoAplicado: Integer;
    procedure SetPrecoAplicado(const APrecoAplicado: Integer);
    function GetMeses: Integer;
    procedure SetMeses(const AMeses: Integer);
    function GetPorta: Integer;
    procedure SetPorta(const APorta: Integer);
    function GetTokenNetpoints: TString;
    procedure SetTokenNetpoints(const ATokenNetpoints: TString);
    function GetMix: TString;
    procedure SetMix(const AMix: TString);
    function GetMatriz: Boolean;
    procedure SetMatriz(const AMatriz: Boolean);
    function GetSigla: TString;
    procedure SetSigla(const ASigla: TString);
    function GetHashMd5DoSysPDV: TString;
    procedure SetHashMd5DoSysPDV(const AHashMd5DoSysPDV: TString);
    function GetChaveDoServer: TString;
    procedure SetChaveDoServer(const AChaveDoServer: TString);
    function GetVersaoDoServer: TString;
    procedure SetVersaoDoServer(const AVersaoDoServer: TString);
    function GetVersaoDoPDV: TString;
    procedure SetVersaoDoPDV(const AVersaoDoPDV: TString);
    function GetRegimeFederal: TString;
    procedure SetRegimeFederal(const ARegimeFederal: TString);
    function GetRegimeEstadual: TString;
    procedure SetRegimeEstadual(const ARegimeEstadual: TString);
    function GetRegimeMunicipal: TString;
    procedure SetRegimeMunicipal(const ARegimeMunicipal: TString);
    function GetEspecializacaoSimplesNacional: TString;
    procedure SetEspecializacaoSimplesNacional(const AEspecializacaoSimplesNacional: TString);
    function GetIp: TString;
    procedure SetIp(const AIp: TString);
    function GetTokenBRWS: TString;
    procedure SetTokenBRWS(const ATokenBRWS: TString);
    function GetEntradaDeNotaPorAtendimentoDePedido: Boolean;
    procedure SetEntradaDeNotaPorAtendimentoDePedido(const AEntradaDeNotaPorAtendimentoDePedido: Boolean);
    function GetControlaCartao: Boolean;
    procedure SetControlaCartao(const AControlaCartao: Boolean);
    function GetEntradaDeNotaPorConferenciaDeMercadoria: Boolean;
    procedure SetEntradaDeNotaPorConferenciaDeMercadoria(const AEntradaDeNotaPorConferenciaDeMercadoria: Boolean);
    function GetEntradaDeNotaPorRecepcao: Boolean;
    procedure SetEntradaDeNotaPorRecepcao(const AEntradaDeNotaPorRecepcao: Boolean);
    function GetAtivo: Boolean;
    procedure SetAtivo(const AAtivo: Boolean);
    function GetEcommerce: Boolean;
    procedure SetEcommerce(const AEcommerce: Boolean);
    function GetValidarIcms: Boolean;
    procedure SetValidarIcms(const AValidarIcms: Boolean);
    function GetValidarPisCofins: Boolean;
    procedure SetValidarPisCofins(const AValidarPisCofins: Boolean);
    function GetIntegracaoRmsAtiva: Boolean;
    procedure SetIntegracaoRmsAtiva(const AIntegracaoRmsAtiva: Boolean);
    function GetFaturamedoInicial: Double;
    procedure SetFaturamedoInicial(const AFaturamedoInicial: Double);
    function GetMetroQuadrado: Double;
    procedure SetMetroQuadrado(const AMetroQuadrado: Double);
    function GetFaixaInicial: Double;
    procedure SetFaixaInicial(const AFaixaInicial: Double);
    function GetFaixaFinal: Double;
    procedure SetFaixaFinal(const AFaixaFinal: Double);
    function GetIrpj: Double;
    procedure SetIrpj(const AIrpj: Double);
    function GetCsll: Double;
    procedure SetCsll(const ACsll: Double);
    function GetCofins: Double;
    procedure SetCofins(const ACofins: Double);
    function GetPis: Double;
    procedure SetPis(const APis: Double);
    function GetCpp: Double;
    procedure SetCpp(const ACpp: Double);
    function GetIcms: Double;
    procedure SetIcms(const AIcms: Double);
    function GetIpi: Double;
    procedure SetIpi(const AIpi: Double);
    function GetIss: Double;
    procedure SetIss(const AIss: Double);
    function GetAliquotaTotal: Double;
    procedure SetAliquotaTotal(const AAliquotaTotal: Double);
    function GetCategoriaFinanceiraDeJurosPagosId: Int64;
    procedure SetCategoriaFinanceiraDeJurosPagosId(const ACategoriaFinanceiraDeJurosPagosId: Int64);
    function GetCategoriaFinanceiraDeMultasPagasId: Int64;
    procedure SetCategoriaFinanceiraDeMultasPagasId(const ACategoriaFinanceiraDeMultasPagasId: Int64);
    function GetCategoriaFinanceiraDeDescontosRecebidosId: Int64;
    procedure SetCategoriaFinanceiraDeDescontosRecebidosId(const ACategoriaFinanceiraDeDescontosRecebidosId: Int64);
    function GetCategoriaFinanceiraDeEstornosDePagamentoId: Int64;
    procedure SetCategoriaFinanceiraDeEstornosDePagamentoId(const ACategoriaFinanceiraDeEstornosDePagamentoId: Int64);
    function GetCategoriaFinanceiraDeJurosRecebidosId: Int64;
    procedure SetCategoriaFinanceiraDeJurosRecebidosId(const ACategoriaFinanceiraDeJurosRecebidosId: Int64);
    function GetCategoriaFinanceiraDeMultasRecebidasId: Int64;
    procedure SetCategoriaFinanceiraDeMultasRecebidasId(const ACategoriaFinanceiraDeMultasRecebidasId: Int64);
    function GetCategoriaFinanceiraDeDescontosConcedidosId: Int64;
    procedure SetCategoriaFinanceiraDeDescontosConcedidosId(const ACategoriaFinanceiraDeDescontosConcedidosId: Int64);
    function GetCategoriaFinanceiraDeEstornosDeRecebimentoId: Int64;
    procedure SetCategoriaFinanceiraDeEstornosDeRecebimentoId(const ACategoriaFinanceiraDeEstornosDeRecebimentoId: Int64);
    function GetCategoriaFinanceiraDeAcrescimosEmComprasId: Int64;
    procedure SetCategoriaFinanceiraDeAcrescimosEmComprasId(const ACategoriaFinanceiraDeAcrescimosEmComprasId: Int64);
    function GetCategoriaFinanceiraDeAcrescimosEmVendasId: Int64;
    procedure SetCategoriaFinanceiraDeAcrescimosEmVendasId(const ACategoriaFinanceiraDeAcrescimosEmVendasId: Int64);
    function GetCategoriaFinanceiraDePagamentosId: Int64;
    procedure SetCategoriaFinanceiraDePagamentosId(const ACategoriaFinanceiraDePagamentosId: Int64);
    function GetCategoriaFinanceiraDeRecebimentosId: Int64;
    procedure SetCategoriaFinanceiraDeRecebimentosId(const ACategoriaFinanceiraDeRecebimentosId: Int64);
    function GetCategoriaFinanceiraDeQuebraId: Int64;
    procedure SetCategoriaFinanceiraDeQuebraId(const ACategoriaFinanceiraDeQuebraId: Int64);
    function GetCategoriaFinanceiraDeSobraId: Int64;
    procedure SetCategoriaFinanceiraDeSobraId(const ACategoriaFinanceiraDeSobraId: Int64);
    function GetLocaisDaLojaId: TLongList;
    procedure SetLocaisDaLojaId(const ALocaisDaLojaId: TLongList);
    function GetNumeroDoDocumento: TString;
    procedure SetNumeroDoDocumento(const ANumeroDoDocumento: TString);
    function GetNumeroDeIdentificacao: TString;
    procedure SetNumeroDeIdentificacao(const ANumeroDeIdentificacao: TString);
    function GetOrgaoExpedidor: TString;
    procedure SetOrgaoExpedidor(const AOrgaoExpedidor: TString);
    function GetCei: TString;
    procedure SetCei(const ACei: TString);
    function GetInscricaoMunicipal: TString;
    procedure SetInscricaoMunicipal(const AInscricaoMunicipal: TString);
    function GetNome: TString;
    procedure SetNome(const ANome: TString);
    function GetFantasia: TString;
    procedure SetFantasia(const AFantasia: TString);
    function GetTelefone1: TString;
    procedure SetTelefone1(const ATelefone1: TString);
    function GetTelefone2: TString;
    procedure SetTelefone2(const ATelefone2: TString);
    function GetFax: TString;
    procedure SetFax(const AFax: TString);
    function GetEmail: TString;
    procedure SetEmail(const AEmail: TString);
    function GetHomePage: TString;
    procedure SetHomePage(const AHomePage: TString);
    function GetRedeSocial: TString;
    procedure SetRedeSocial(const ARedeSocial: TString);
    function GetTwitter: TString;
    procedure SetTwitter(const ATwitter: TString);
    function GetComunicadorDeMensagensInstantaneas: TString;
    procedure SetComunicadorDeMensagensInstantaneas(const AComunicadorDeMensagensInstantaneas: TString);
    function GetSuframa: TString;
    procedure SetSuframa(const ASuframa: TString);
    function GetTipo: TTipoPessoa;
    procedure SetTipo(const ATipo: TTipoPessoa);
    function GetHoldingId: Integer;
    procedure SetHoldingId(const AHoldingId: Integer);
    function GetCep: TString;
    procedure SetCep(const ACep: TString);
    function GetUf: TString;
    procedure SetUf(const AUf: TString);
    function GetCodigoPais: Integer;
    procedure SetCodigoPais(const ACodigoPais: Integer);
    function GetLogradouro: TString;
    procedure SetLogradouro(const ALogradouro: TString);
    function GetNumero: TString;
    procedure SetNumero(const ANumero: TString);
    function GetBairro: TString;
    procedure SetBairro(const ABairro: TString);
    function GetComplemento: TString;
    procedure SetComplemento(const AComplemento: TString);
    function GetPontoReferencia: TString;
    procedure SetPontoReferencia(const APontoReferencia: TString);
    function GetCodigoIbge: Int64;
    procedure SetCodigoIbge(const ACodigoIbge: Int64);
    function GetDescricaoMunicipio: TString;
    procedure SetDescricaoMunicipio(const ADescricaoMunicipio: TString);
  public
    property Id: Int64 read GetId write SetId;
    property PerfilFiscal: TPerfilFiscal read GetPerfilFiscal write SetPerfilFiscal;
    property AtividadeEconomica: TAtividadeEconomica read GetAtividadeEconomica write SetAtividadeEconomica;
    property RamoAtuacaoId: Integer read GetRamoAtuacaoId write SetRamoAtuacaoId;
    property AgenteValidacao: TResponsavelValidacao read GetAgenteValidacao write SetAgenteValidacao;
    property Conciliadora: TConciliadora read GetConciliadora write SetConciliadora;
    property RegimeEstadualTributarioId: Int64 read GetRegimeEstadualTributarioId write SetRegimeEstadualTributarioId;
    property ContaDeEmailId: Int64 read GetContaDeEmailId write SetContaDeEmailId;
    property CodReceitaICMS: Integer read GetCodReceitaICMS write SetCodReceitaICMS;
    property CodReceitaICMSST: Integer read GetCodReceitaICMSST write SetCodReceitaICMSST;
    property CodReceitaPIS: Integer read GetCodReceitaPIS write SetCodReceitaPIS;
    property CodReceitaCOFINS: Integer read GetCodReceitaCOFINS write SetCodReceitaCOFINS;
    property CodRecolherICMSST: Integer read GetCodRecolherICMSST write SetCodRecolherICMSST;
    property Crt: Integer read GetCrt write SetCrt;
    property PrecoAplicado: Integer read GetPrecoAplicado write SetPrecoAplicado;
    property Meses: Integer read GetMeses write SetMeses;
    property Porta: Integer read GetPorta write SetPorta;
    property TokenNetpoints: TString read GetTokenNetpoints write SetTokenNetpoints;
    property Mix: TString read GetMix write SetMix;
    property Matriz: Boolean read GetMatriz write SetMatriz;
    property Sigla: TString read GetSigla write SetSigla;
    property HashMd5DoSysPDV: TString read GetHashMd5DoSysPDV write SetHashMd5DoSysPDV;
    property ChaveDoServer: TString read GetChaveDoServer write SetChaveDoServer;
    property VersaoDoServer: TString read GetVersaoDoServer write SetVersaoDoServer;
    property VersaoDoPDV: TString read GetVersaoDoPDV write SetVersaoDoPDV;
    property RegimeFederal: TString read GetRegimeFederal write SetRegimeFederal;
    property RegimeEstadual: TString read GetRegimeEstadual write SetRegimeEstadual;
    property RegimeMunicipal: TString read GetRegimeMunicipal write SetRegimeMunicipal;
    property EspecializacaoSimplesNacional: TString read GetEspecializacaoSimplesNacional write SetEspecializacaoSimplesNacional;
    property Ip: TString read GetIp write SetIp;
    property TokenBRWS: TString read GetTokenBRWS write SetTokenBRWS;
    property EntradaDeNotaPorAtendimentoDePedido: Boolean read GetEntradaDeNotaPorAtendimentoDePedido write SetEntradaDeNotaPorAtendimentoDePedido;
    property ControlaCartao: Boolean read GetControlaCartao write SetControlaCartao;
    property EntradaDeNotaPorConferenciaDeMercadoria: Boolean read GetEntradaDeNotaPorConferenciaDeMercadoria write SetEntradaDeNotaPorConferenciaDeMercadoria;
    property EntradaDeNotaPorRecepcao: Boolean read GetEntradaDeNotaPorRecepcao write SetEntradaDeNotaPorRecepcao;
    property Ativo: Boolean read GetAtivo write SetAtivo;
    property Ecommerce: Boolean read GetEcommerce write SetEcommerce;
    property ValidarIcms: Boolean read GetValidarIcms write SetValidarIcms;
    property ValidarPisCofins: Boolean read GetValidarPisCofins write SetValidarPisCofins;
    property IntegracaoRmsAtiva: Boolean read GetIntegracaoRmsAtiva write SetIntegracaoRmsAtiva;
    property FaturamedoInicial: Double read GetFaturamedoInicial write SetFaturamedoInicial;
    property MetroQuadrado: Double read GetMetroQuadrado write SetMetroQuadrado;
    property FaixaInicial: Double read GetFaixaInicial write SetFaixaInicial;
    property FaixaFinal: Double read GetFaixaFinal write SetFaixaFinal;
    property Irpj: Double read GetIrpj write SetIrpj;
    property Csll: Double read GetCsll write SetCsll;
    property Cofins: Double read GetCofins write SetCofins;
    property Pis: Double read GetPis write SetPis;
    property Cpp: Double read GetCpp write SetCpp;
    property Icms: Double read GetIcms write SetIcms;
    property Ipi: Double read GetIpi write SetIpi;
    property Iss: Double read GetIss write SetIss;
    property AliquotaTotal: Double read GetAliquotaTotal write SetAliquotaTotal;
    property CategoriaFinanceiraDeJurosPagosId: Int64 read GetCategoriaFinanceiraDeJurosPagosId write SetCategoriaFinanceiraDeJurosPagosId;
    property CategoriaFinanceiraDeMultasPagasId: Int64 read GetCategoriaFinanceiraDeMultasPagasId write SetCategoriaFinanceiraDeMultasPagasId;
    property CategoriaFinanceiraDeDescontosRecebidosId: Int64 read GetCategoriaFinanceiraDeDescontosRecebidosId write SetCategoriaFinanceiraDeDescontosRecebidosId;
    property CategoriaFinanceiraDeEstornosDePagamentoId: Int64 read GetCategoriaFinanceiraDeEstornosDePagamentoId write SetCategoriaFinanceiraDeEstornosDePagamentoId;
    property CategoriaFinanceiraDeJurosRecebidosId: Int64 read GetCategoriaFinanceiraDeJurosRecebidosId write SetCategoriaFinanceiraDeJurosRecebidosId;
    property CategoriaFinanceiraDeMultasRecebidasId: Int64 read GetCategoriaFinanceiraDeMultasRecebidasId write SetCategoriaFinanceiraDeMultasRecebidasId;
    property CategoriaFinanceiraDeDescontosConcedidosId: Int64 read GetCategoriaFinanceiraDeDescontosConcedidosId write SetCategoriaFinanceiraDeDescontosConcedidosId;
    property CategoriaFinanceiraDeEstornosDeRecebimentoId: Int64 read GetCategoriaFinanceiraDeEstornosDeRecebimentoId write SetCategoriaFinanceiraDeEstornosDeRecebimentoId;
    property CategoriaFinanceiraDeAcrescimosEmComprasId: Int64 read GetCategoriaFinanceiraDeAcrescimosEmComprasId write SetCategoriaFinanceiraDeAcrescimosEmComprasId;
    property CategoriaFinanceiraDeAcrescimosEmVendasId: Int64 read GetCategoriaFinanceiraDeAcrescimosEmVendasId write SetCategoriaFinanceiraDeAcrescimosEmVendasId;
    property CategoriaFinanceiraDePagamentosId: Int64 read GetCategoriaFinanceiraDePagamentosId write SetCategoriaFinanceiraDePagamentosId;
    property CategoriaFinanceiraDeRecebimentosId: Int64 read GetCategoriaFinanceiraDeRecebimentosId write SetCategoriaFinanceiraDeRecebimentosId;
    property CategoriaFinanceiraDeQuebraId: Int64 read GetCategoriaFinanceiraDeQuebraId write SetCategoriaFinanceiraDeQuebraId;
    property CategoriaFinanceiraDeSobraId: Int64 read GetCategoriaFinanceiraDeSobraId write SetCategoriaFinanceiraDeSobraId;
    property LocaisDaLojaId: TLongList read GetLocaisDaLojaId write SetLocaisDaLojaId;
    property NumeroDoDocumento: TString read GetNumeroDoDocumento write SetNumeroDoDocumento;
    property NumeroDeIdentificacao: TString read GetNumeroDeIdentificacao write SetNumeroDeIdentificacao;
    property OrgaoExpedidor: TString read GetOrgaoExpedidor write SetOrgaoExpedidor;
    property Cei: TString read GetCei write SetCei;
    property InscricaoMunicipal: TString read GetInscricaoMunicipal write SetInscricaoMunicipal;
    property Nome: TString read GetNome write SetNome;
    property Fantasia: TString read GetFantasia write SetFantasia;
    property Telefone1: TString read GetTelefone1 write SetTelefone1;
    property Telefone2: TString read GetTelefone2 write SetTelefone2;
    property Fax: TString read GetFax write SetFax;
    property Email: TString read GetEmail write SetEmail;
    property HomePage: TString read GetHomePage write SetHomePage;
    property RedeSocial: TString read GetRedeSocial write SetRedeSocial;
    property Twitter: TString read GetTwitter write SetTwitter;
    property ComunicadorDeMensagensInstantaneas: TString read GetComunicadorDeMensagensInstantaneas write SetComunicadorDeMensagensInstantaneas;
    property Suframa: TString read GetSuframa write SetSuframa;
    property Tipo: TTipoPessoa read GetTipo write SetTipo;
    property HoldingId: Integer read GetHoldingId write SetHoldingId;
    property Cep: TString read GetCep write SetCep;
    property Uf: TString read GetUf write SetUf;
    property CodigoPais: Integer read GetCodigoPais write SetCodigoPais;
    property Logradouro: TString read GetLogradouro write SetLogradouro;
    property Numero: TString read GetNumero write SetNumero;
    property Bairro: TString read GetBairro write SetBairro;
    property Complemento: TString read GetComplemento write SetComplemento;
    property PontoReferencia: TString read GetPontoReferencia write SetPontoReferencia;
    property CodigoIbge: Int64 read GetCodigoIbge write SetCodigoIbge;
    property DescricaoMunicipio: TString read GetDescricaoMunicipio write SetDescricaoMunicipio;
  end;

implementation

{ TLojaList }

procedure TLojaList.Add(const ALoja: ILoja);
begin
  FList.Add(ALoja);
end;

procedure TLojaList.Clear;
begin
  FList.Clear;
end;

function TLojaList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TLojaList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TLojaList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TLojaList.GetEnumerator: TLojaListEnumerator;
begin
  Result := TLojaListEnumerator.Create(Self);
end;

function TLojaList.GetItems(AIndex: Integer): ILoja;
begin
  Result := FList[AIndex] as ILoja;
end;

function TLojaList.GetReference: TLojaList;
begin
  Result := Self;
end;

procedure TLojaList.SetItems(AIndex: Integer; const Value: ILoja);
begin
  FList[AIndex] := Value;
end;

{ TLojaListEnumerator }

constructor TLojaListEnumerator.Create(ALojaList: TLojaList);
begin
  inherited Create;
  FIndex := -1;
  FLojaList := ALojaList;
end;

function TLojaListEnumerator.GetCurrent: ILoja;
begin
  Result := FLojaList[FIndex];
end;

function TLojaListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FLojaList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TLojaListRec }

class function TLojaListRec.Create(const AList: ILojaList): TLojaListRec;
begin
  FillChar(Result, SizeOf(TLojaListRec), 0);
  Result.FList := AList;
end;

class operator TLojaListRec.Implicit(AListRec: TLojaListRec): TLojaList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TLoja }

function TLoja.GetId: Int64;
begin
  Result := FId;
end;

procedure TLoja.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TLoja.GetPerfilFiscal: TPerfilFiscal;
begin
  Result := FPerfilFiscal;
end;

procedure TLoja.SetPerfilFiscal(const APerfilFiscal: TPerfilFiscal);
begin
  FPerfilFiscal := APerfilFiscal;
end;

function TLoja.GetAtividadeEconomica: TAtividadeEconomica;
begin
  Result := FAtividadeEconomica;
end;

procedure TLoja.SetAtividadeEconomica(const AAtividadeEconomica: TAtividadeEconomica);
begin
  FAtividadeEconomica := AAtividadeEconomica;
end;

function TLoja.GetRamoAtuacaoId: Integer;
begin
  Result := FRamoAtuacaoId;
end;

procedure TLoja.SetRamoAtuacaoId(const ARamoAtuacaoId: Integer);
begin
  FRamoAtuacaoId := ARamoAtuacaoId;
end;

function TLoja.GetAgenteValidacao: TResponsavelValidacao;
begin
  Result := FAgenteValidacao;
end;

procedure TLoja.SetAgenteValidacao(const AAgenteValidacao: TResponsavelValidacao);
begin
  FAgenteValidacao := AAgenteValidacao;
end;

function TLoja.GetConciliadora: TConciliadora;
begin
  Result := FConciliadora;
end;

procedure TLoja.SetConciliadora(const AConciliadora: TConciliadora);
begin
  FConciliadora := AConciliadora;
end;

function TLoja.GetRegimeEstadualTributarioId: Int64;
begin
  Result := FRegimeEstadualTributarioId;
end;

procedure TLoja.SetRegimeEstadualTributarioId(const ARegimeEstadualTributarioId: Int64);
begin
  FRegimeEstadualTributarioId := ARegimeEstadualTributarioId;
end;

function TLoja.GetContaDeEmailId: Int64;
begin
  Result := FContaDeEmailId;
end;

procedure TLoja.SetContaDeEmailId(const AContaDeEmailId: Int64);
begin
  FContaDeEmailId := AContaDeEmailId;
end;

function TLoja.GetCodReceitaICMS: Integer;
begin
  Result := FCodReceitaICMS;
end;

procedure TLoja.SetCodReceitaICMS(const ACodReceitaICMS: Integer);
begin
  FCodReceitaICMS := ACodReceitaICMS;
end;

function TLoja.GetCodReceitaICMSST: Integer;
begin
  Result := FCodReceitaICMSST;
end;

procedure TLoja.SetCodReceitaICMSST(const ACodReceitaICMSST: Integer);
begin
  FCodReceitaICMSST := ACodReceitaICMSST;
end;

function TLoja.GetCodReceitaPIS: Integer;
begin
  Result := FCodReceitaPIS;
end;

procedure TLoja.SetCodReceitaPIS(const ACodReceitaPIS: Integer);
begin
  FCodReceitaPIS := ACodReceitaPIS;
end;

function TLoja.GetCodReceitaCOFINS: Integer;
begin
  Result := FCodReceitaCOFINS;
end;

procedure TLoja.SetCodReceitaCOFINS(const ACodReceitaCOFINS: Integer);
begin
  FCodReceitaCOFINS := ACodReceitaCOFINS;
end;

function TLoja.GetCodRecolherICMSST: Integer;
begin
  Result := FCodRecolherICMSST;
end;

procedure TLoja.SetCodRecolherICMSST(const ACodRecolherICMSST: Integer);
begin
  FCodRecolherICMSST := ACodRecolherICMSST;
end;

function TLoja.GetCrt: Integer;
begin
  Result := FCrt;
end;

procedure TLoja.SetCrt(const ACrt: Integer);
begin
  FCrt := ACrt;
end;

function TLoja.GetPrecoAplicado: Integer;
begin
  Result := FPrecoAplicado;
end;

procedure TLoja.SetPrecoAplicado(const APrecoAplicado: Integer);
begin
  FPrecoAplicado := APrecoAplicado;
end;

function TLoja.GetMeses: Integer;
begin
  Result := FMeses;
end;

procedure TLoja.SetMeses(const AMeses: Integer);
begin
  FMeses := AMeses;
end;

function TLoja.GetPorta: Integer;
begin
  Result := FPorta;
end;

procedure TLoja.SetPorta(const APorta: Integer);
begin
  FPorta := APorta;
end;

function TLoja.GetTokenNetpoints: TString;
begin
  Result := FTokenNetpoints;
end;

procedure TLoja.SetTokenNetpoints(const ATokenNetpoints: TString);
begin
  FTokenNetpoints := ATokenNetpoints;
end;

function TLoja.GetMix: TString;
begin
  Result := FMix;
end;

procedure TLoja.SetMix(const AMix: TString);
begin
  FMix := AMix;
end;

function TLoja.GetMatriz: Boolean;
begin
  Result := FMatriz;
end;

procedure TLoja.SetMatriz(const AMatriz: Boolean);
begin
  FMatriz := AMatriz;
end;

function TLoja.GetSigla: TString;
begin
  Result := FSigla;
end;

procedure TLoja.SetSigla(const ASigla: TString);
begin
  FSigla := ASigla;
end;

function TLoja.GetHashMd5DoSysPDV: TString;
begin
  Result := FHashMd5DoSysPDV;
end;

procedure TLoja.SetHashMd5DoSysPDV(const AHashMd5DoSysPDV: TString);
begin
  FHashMd5DoSysPDV := AHashMd5DoSysPDV;
end;

function TLoja.GetChaveDoServer: TString;
begin
  Result := FChaveDoServer;
end;

procedure TLoja.SetChaveDoServer(const AChaveDoServer: TString);
begin
  FChaveDoServer := AChaveDoServer;
end;

function TLoja.GetVersaoDoServer: TString;
begin
  Result := FVersaoDoServer;
end;

procedure TLoja.SetVersaoDoServer(const AVersaoDoServer: TString);
begin
  FVersaoDoServer := AVersaoDoServer;
end;

function TLoja.GetVersaoDoPDV: TString;
begin
  Result := FVersaoDoPDV;
end;

procedure TLoja.SetVersaoDoPDV(const AVersaoDoPDV: TString);
begin
  FVersaoDoPDV := AVersaoDoPDV;
end;

function TLoja.GetRegimeFederal: TString;
begin
  Result := FRegimeFederal;
end;

procedure TLoja.SetRegimeFederal(const ARegimeFederal: TString);
begin
  FRegimeFederal := ARegimeFederal;
end;

function TLoja.GetRegimeEstadual: TString;
begin
  Result := FRegimeEstadual;
end;

procedure TLoja.SetRegimeEstadual(const ARegimeEstadual: TString);
begin
  FRegimeEstadual := ARegimeEstadual;
end;

function TLoja.GetRegimeMunicipal: TString;
begin
  Result := FRegimeMunicipal;
end;

procedure TLoja.SetRegimeMunicipal(const ARegimeMunicipal: TString);
begin
  FRegimeMunicipal := ARegimeMunicipal;
end;

function TLoja.GetEspecializacaoSimplesNacional: TString;
begin
  Result := FEspecializacaoSimplesNacional;
end;

procedure TLoja.SetEspecializacaoSimplesNacional(const AEspecializacaoSimplesNacional: TString);
begin
  FEspecializacaoSimplesNacional := AEspecializacaoSimplesNacional;
end;

function TLoja.GetIp: TString;
begin
  Result := FIp;
end;

procedure TLoja.SetIp(const AIp: TString);
begin
  FIp := AIp;
end;

function TLoja.GetTokenBRWS: TString;
begin
  Result := FTokenBRWS;
end;

procedure TLoja.SetTokenBRWS(const ATokenBRWS: TString);
begin
  FTokenBRWS := ATokenBRWS;
end;

function TLoja.GetEntradaDeNotaPorAtendimentoDePedido: Boolean;
begin
  Result := FEntradaDeNotaPorAtendimentoDePedido;
end;

procedure TLoja.SetEntradaDeNotaPorAtendimentoDePedido(const AEntradaDeNotaPorAtendimentoDePedido: Boolean);
begin
  FEntradaDeNotaPorAtendimentoDePedido := AEntradaDeNotaPorAtendimentoDePedido;
end;

function TLoja.GetControlaCartao: Boolean;
begin
  Result := FControlaCartao;
end;

procedure TLoja.SetControlaCartao(const AControlaCartao: Boolean);
begin
  FControlaCartao := AControlaCartao;
end;

function TLoja.GetEntradaDeNotaPorConferenciaDeMercadoria: Boolean;
begin
  Result := FEntradaDeNotaPorConferenciaDeMercadoria;
end;

procedure TLoja.SetEntradaDeNotaPorConferenciaDeMercadoria(const AEntradaDeNotaPorConferenciaDeMercadoria: Boolean);
begin
  FEntradaDeNotaPorConferenciaDeMercadoria := AEntradaDeNotaPorConferenciaDeMercadoria;
end;

function TLoja.GetEntradaDeNotaPorRecepcao: Boolean;
begin
  Result := FEntradaDeNotaPorRecepcao;
end;

procedure TLoja.SetEntradaDeNotaPorRecepcao(const AEntradaDeNotaPorRecepcao: Boolean);
begin
  FEntradaDeNotaPorRecepcao := AEntradaDeNotaPorRecepcao;
end;

function TLoja.GetAtivo: Boolean;
begin
  Result := FAtivo;
end;

procedure TLoja.SetAtivo(const AAtivo: Boolean);
begin
  FAtivo := AAtivo;
end;

function TLoja.GetEcommerce: Boolean;
begin
  Result := FEcommerce;
end;

procedure TLoja.SetEcommerce(const AEcommerce: Boolean);
begin
  FEcommerce := AEcommerce;
end;

function TLoja.GetValidarIcms: Boolean;
begin
  Result := FValidarIcms;
end;

procedure TLoja.SetValidarIcms(const AValidarIcms: Boolean);
begin
  FValidarIcms := AValidarIcms;
end;

function TLoja.GetValidarPisCofins: Boolean;
begin
  Result := FValidarPisCofins;
end;

procedure TLoja.SetValidarPisCofins(const AValidarPisCofins: Boolean);
begin
  FValidarPisCofins := AValidarPisCofins;
end;

function TLoja.GetIntegracaoRmsAtiva: Boolean;
begin
  Result := FIntegracaoRmsAtiva;
end;

procedure TLoja.SetIntegracaoRmsAtiva(const AIntegracaoRmsAtiva: Boolean);
begin
  FIntegracaoRmsAtiva := AIntegracaoRmsAtiva;
end;

function TLoja.GetFaturamedoInicial: Double;
begin
  Result := FFaturamedoInicial;
end;

procedure TLoja.SetFaturamedoInicial(const AFaturamedoInicial: Double);
begin
  FFaturamedoInicial := AFaturamedoInicial;
end;

function TLoja.GetMetroQuadrado: Double;
begin
  Result := FMetroQuadrado;
end;

procedure TLoja.SetMetroQuadrado(const AMetroQuadrado: Double);
begin
  FMetroQuadrado := AMetroQuadrado;
end;

function TLoja.GetFaixaInicial: Double;
begin
  Result := FFaixaInicial;
end;

procedure TLoja.SetFaixaInicial(const AFaixaInicial: Double);
begin
  FFaixaInicial := AFaixaInicial;
end;

function TLoja.GetFaixaFinal: Double;
begin
  Result := FFaixaFinal;
end;

procedure TLoja.SetFaixaFinal(const AFaixaFinal: Double);
begin
  FFaixaFinal := AFaixaFinal;
end;

function TLoja.GetIrpj: Double;
begin
  Result := FIrpj;
end;

procedure TLoja.SetIrpj(const AIrpj: Double);
begin
  FIrpj := AIrpj;
end;

function TLoja.GetCsll: Double;
begin
  Result := FCsll;
end;

procedure TLoja.SetCsll(const ACsll: Double);
begin
  FCsll := ACsll;
end;

function TLoja.GetCofins: Double;
begin
  Result := FCofins;
end;

procedure TLoja.SetCofins(const ACofins: Double);
begin
  FCofins := ACofins;
end;

function TLoja.GetPis: Double;
begin
  Result := FPis;
end;

procedure TLoja.SetPis(const APis: Double);
begin
  FPis := APis;
end;

function TLoja.GetCpp: Double;
begin
  Result := FCpp;
end;

procedure TLoja.SetCpp(const ACpp: Double);
begin
  FCpp := ACpp;
end;

function TLoja.GetIcms: Double;
begin
  Result := FIcms;
end;

procedure TLoja.SetIcms(const AIcms: Double);
begin
  FIcms := AIcms;
end;

function TLoja.GetIpi: Double;
begin
  Result := FIpi;
end;

procedure TLoja.SetIpi(const AIpi: Double);
begin
  FIpi := AIpi;
end;

function TLoja.GetIss: Double;
begin
  Result := FIss;
end;

procedure TLoja.SetIss(const AIss: Double);
begin
  FIss := AIss;
end;

function TLoja.GetAliquotaTotal: Double;
begin
  Result := FAliquotaTotal;
end;

procedure TLoja.SetAliquotaTotal(const AAliquotaTotal: Double);
begin
  FAliquotaTotal := AAliquotaTotal;
end;

function TLoja.GetCategoriaFinanceiraDeJurosPagosId: Int64;
begin
  Result := FCategoriaFinanceiraDeJurosPagosId;
end;

procedure TLoja.SetCategoriaFinanceiraDeJurosPagosId(const ACategoriaFinanceiraDeJurosPagosId: Int64);
begin
  FCategoriaFinanceiraDeJurosPagosId := ACategoriaFinanceiraDeJurosPagosId;
end;

function TLoja.GetCategoriaFinanceiraDeMultasPagasId: Int64;
begin
  Result := FCategoriaFinanceiraDeMultasPagasId;
end;

procedure TLoja.SetCategoriaFinanceiraDeMultasPagasId(const ACategoriaFinanceiraDeMultasPagasId: Int64);
begin
  FCategoriaFinanceiraDeMultasPagasId := ACategoriaFinanceiraDeMultasPagasId;
end;

function TLoja.GetCategoriaFinanceiraDeDescontosRecebidosId: Int64;
begin
  Result := FCategoriaFinanceiraDeDescontosRecebidosId;
end;

procedure TLoja.SetCategoriaFinanceiraDeDescontosRecebidosId(const ACategoriaFinanceiraDeDescontosRecebidosId: Int64);
begin
  FCategoriaFinanceiraDeDescontosRecebidosId := ACategoriaFinanceiraDeDescontosRecebidosId;
end;

function TLoja.GetCategoriaFinanceiraDeEstornosDePagamentoId: Int64;
begin
  Result := FCategoriaFinanceiraDeEstornosDePagamentoId;
end;

procedure TLoja.SetCategoriaFinanceiraDeEstornosDePagamentoId(const ACategoriaFinanceiraDeEstornosDePagamentoId: Int64);
begin
  FCategoriaFinanceiraDeEstornosDePagamentoId := ACategoriaFinanceiraDeEstornosDePagamentoId;
end;

function TLoja.GetCategoriaFinanceiraDeJurosRecebidosId: Int64;
begin
  Result := FCategoriaFinanceiraDeJurosRecebidosId;
end;

procedure TLoja.SetCategoriaFinanceiraDeJurosRecebidosId(const ACategoriaFinanceiraDeJurosRecebidosId: Int64);
begin
  FCategoriaFinanceiraDeJurosRecebidosId := ACategoriaFinanceiraDeJurosRecebidosId;
end;

function TLoja.GetCategoriaFinanceiraDeMultasRecebidasId: Int64;
begin
  Result := FCategoriaFinanceiraDeMultasRecebidasId;
end;

procedure TLoja.SetCategoriaFinanceiraDeMultasRecebidasId(const ACategoriaFinanceiraDeMultasRecebidasId: Int64);
begin
  FCategoriaFinanceiraDeMultasRecebidasId := ACategoriaFinanceiraDeMultasRecebidasId;
end;

function TLoja.GetCategoriaFinanceiraDeDescontosConcedidosId: Int64;
begin
  Result := FCategoriaFinanceiraDeDescontosConcedidosId;
end;

procedure TLoja.SetCategoriaFinanceiraDeDescontosConcedidosId(const ACategoriaFinanceiraDeDescontosConcedidosId: Int64);
begin
  FCategoriaFinanceiraDeDescontosConcedidosId := ACategoriaFinanceiraDeDescontosConcedidosId;
end;

function TLoja.GetCategoriaFinanceiraDeEstornosDeRecebimentoId: Int64;
begin
  Result := FCategoriaFinanceiraDeEstornosDeRecebimentoId;
end;

procedure TLoja.SetCategoriaFinanceiraDeEstornosDeRecebimentoId(const ACategoriaFinanceiraDeEstornosDeRecebimentoId: Int64);
begin
  FCategoriaFinanceiraDeEstornosDeRecebimentoId := ACategoriaFinanceiraDeEstornosDeRecebimentoId;
end;

function TLoja.GetCategoriaFinanceiraDeAcrescimosEmComprasId: Int64;
begin
  Result := FCategoriaFinanceiraDeAcrescimosEmComprasId;
end;

procedure TLoja.SetCategoriaFinanceiraDeAcrescimosEmComprasId(const ACategoriaFinanceiraDeAcrescimosEmComprasId: Int64);
begin
  FCategoriaFinanceiraDeAcrescimosEmComprasId := ACategoriaFinanceiraDeAcrescimosEmComprasId;
end;

function TLoja.GetCategoriaFinanceiraDeAcrescimosEmVendasId: Int64;
begin
  Result := FCategoriaFinanceiraDeAcrescimosEmVendasId;
end;

procedure TLoja.SetCategoriaFinanceiraDeAcrescimosEmVendasId(const ACategoriaFinanceiraDeAcrescimosEmVendasId: Int64);
begin
  FCategoriaFinanceiraDeAcrescimosEmVendasId := ACategoriaFinanceiraDeAcrescimosEmVendasId;
end;

function TLoja.GetCategoriaFinanceiraDePagamentosId: Int64;
begin
  Result := FCategoriaFinanceiraDePagamentosId;
end;

procedure TLoja.SetCategoriaFinanceiraDePagamentosId(const ACategoriaFinanceiraDePagamentosId: Int64);
begin
  FCategoriaFinanceiraDePagamentosId := ACategoriaFinanceiraDePagamentosId;
end;

function TLoja.GetCategoriaFinanceiraDeRecebimentosId: Int64;
begin
  Result := FCategoriaFinanceiraDeRecebimentosId;
end;

procedure TLoja.SetCategoriaFinanceiraDeRecebimentosId(const ACategoriaFinanceiraDeRecebimentosId: Int64);
begin
  FCategoriaFinanceiraDeRecebimentosId := ACategoriaFinanceiraDeRecebimentosId;
end;

function TLoja.GetCategoriaFinanceiraDeQuebraId: Int64;
begin
  Result := FCategoriaFinanceiraDeQuebraId;
end;

procedure TLoja.SetCategoriaFinanceiraDeQuebraId(const ACategoriaFinanceiraDeQuebraId: Int64);
begin
  FCategoriaFinanceiraDeQuebraId := ACategoriaFinanceiraDeQuebraId;
end;

function TLoja.GetCategoriaFinanceiraDeSobraId: Int64;
begin
  Result := FCategoriaFinanceiraDeSobraId;
end;

procedure TLoja.SetCategoriaFinanceiraDeSobraId(const ACategoriaFinanceiraDeSobraId: Int64);
begin
  FCategoriaFinanceiraDeSobraId := ACategoriaFinanceiraDeSobraId;
end;

function TLoja.GetLocaisDaLojaId: TLongList;
begin
  Result := FLocaisDaLojaId;
end;

procedure TLoja.SetLocaisDaLojaId(const ALocaisDaLojaId: TLongList);
begin
  FLocaisDaLojaId := ALocaisDaLojaId;
end;

function TLoja.GetNumeroDoDocumento: TString;
begin
  Result := FNumeroDoDocumento;
end;

procedure TLoja.SetNumeroDoDocumento(const ANumeroDoDocumento: TString);
begin
  FNumeroDoDocumento := ANumeroDoDocumento;
end;

function TLoja.GetNumeroDeIdentificacao: TString;
begin
  Result := FNumeroDeIdentificacao;
end;

procedure TLoja.SetNumeroDeIdentificacao(const ANumeroDeIdentificacao: TString);
begin
  FNumeroDeIdentificacao := ANumeroDeIdentificacao;
end;

function TLoja.GetOrgaoExpedidor: TString;
begin
  Result := FOrgaoExpedidor;
end;

procedure TLoja.SetOrgaoExpedidor(const AOrgaoExpedidor: TString);
begin
  FOrgaoExpedidor := AOrgaoExpedidor;
end;

function TLoja.GetCei: TString;
begin
  Result := FCei;
end;

procedure TLoja.SetCei(const ACei: TString);
begin
  FCei := ACei;
end;

function TLoja.GetInscricaoMunicipal: TString;
begin
  Result := FInscricaoMunicipal;
end;

procedure TLoja.SetInscricaoMunicipal(const AInscricaoMunicipal: TString);
begin
  FInscricaoMunicipal := AInscricaoMunicipal;
end;

function TLoja.GetNome: TString;
begin
  Result := FNome;
end;

procedure TLoja.SetNome(const ANome: TString);
begin
  FNome := ANome;
end;

function TLoja.GetFantasia: TString;
begin
  Result := FFantasia;
end;

procedure TLoja.SetFantasia(const AFantasia: TString);
begin
  FFantasia := AFantasia;
end;

function TLoja.GetTelefone1: TString;
begin
  Result := FTelefone1;
end;

procedure TLoja.SetTelefone1(const ATelefone1: TString);
begin
  FTelefone1 := ATelefone1;
end;

function TLoja.GetTelefone2: TString;
begin
  Result := FTelefone2;
end;

procedure TLoja.SetTelefone2(const ATelefone2: TString);
begin
  FTelefone2 := ATelefone2;
end;

function TLoja.GetFax: TString;
begin
  Result := FFax;
end;

procedure TLoja.SetFax(const AFax: TString);
begin
  FFax := AFax;
end;

function TLoja.GetEmail: TString;
begin
  Result := FEmail;
end;

procedure TLoja.SetEmail(const AEmail: TString);
begin
  FEmail := AEmail;
end;

function TLoja.GetHomePage: TString;
begin
  Result := FHomePage;
end;

procedure TLoja.SetHomePage(const AHomePage: TString);
begin
  FHomePage := AHomePage;
end;

function TLoja.GetRedeSocial: TString;
begin
  Result := FRedeSocial;
end;

procedure TLoja.SetRedeSocial(const ARedeSocial: TString);
begin
  FRedeSocial := ARedeSocial;
end;

function TLoja.GetTwitter: TString;
begin
  Result := FTwitter;
end;

procedure TLoja.SetTwitter(const ATwitter: TString);
begin
  FTwitter := ATwitter;
end;

function TLoja.GetComunicadorDeMensagensInstantaneas: TString;
begin
  Result := FComunicadorDeMensagensInstantaneas;
end;

procedure TLoja.SetComunicadorDeMensagensInstantaneas(const AComunicadorDeMensagensInstantaneas: TString);
begin
  FComunicadorDeMensagensInstantaneas := AComunicadorDeMensagensInstantaneas;
end;

function TLoja.GetSuframa: TString;
begin
  Result := FSuframa;
end;

procedure TLoja.SetSuframa(const ASuframa: TString);
begin
  FSuframa := ASuframa;
end;

function TLoja.GetTipo: TTipoPessoa;
begin
  Result := FTipo;
end;

procedure TLoja.SetTipo(const ATipo: TTipoPessoa);
begin
  FTipo := ATipo;
end;

function TLoja.GetHoldingId: Integer;
begin
  Result := FHoldingId;
end;

procedure TLoja.SetHoldingId(const AHoldingId: Integer);
begin
  FHoldingId := AHoldingId;
end;

function TLoja.GetCep: TString;
begin
  Result := FCep;
end;

procedure TLoja.SetCep(const ACep: TString);
begin
  FCep := ACep;
end;

function TLoja.GetUf: TString;
begin
  Result := FUf;
end;

procedure TLoja.SetUf(const AUf: TString);
begin
  FUf := AUf;
end;

function TLoja.GetCodigoPais: Integer;
begin
  Result := FCodigoPais;
end;

procedure TLoja.SetCodigoPais(const ACodigoPais: Integer);
begin
  FCodigoPais := ACodigoPais;
end;

function TLoja.GetLogradouro: TString;
begin
  Result := FLogradouro;
end;

procedure TLoja.SetLogradouro(const ALogradouro: TString);
begin
  FLogradouro := ALogradouro;
end;

function TLoja.GetNumero: TString;
begin
  Result := FNumero;
end;

procedure TLoja.SetNumero(const ANumero: TString);
begin
  FNumero := ANumero;
end;

function TLoja.GetBairro: TString;
begin
  Result := FBairro;
end;

procedure TLoja.SetBairro(const ABairro: TString);
begin
  FBairro := ABairro;
end;

function TLoja.GetComplemento: TString;
begin
  Result := FComplemento;
end;

procedure TLoja.SetComplemento(const AComplemento: TString);
begin
  FComplemento := AComplemento;
end;

function TLoja.GetPontoReferencia: TString;
begin
  Result := FPontoReferencia;
end;

procedure TLoja.SetPontoReferencia(const APontoReferencia: TString);
begin
  FPontoReferencia := APontoReferencia;
end;

function TLoja.GetCodigoIbge: Int64;
begin
  Result := FCodigoIbge;
end;

procedure TLoja.SetCodigoIbge(const ACodigoIbge: Int64);
begin
  FCodigoIbge := ACodigoIbge;
end;

function TLoja.GetDescricaoMunicipio: TString;
begin
  Result := FDescricaoMunicipio;
end;

procedure TLoja.SetDescricaoMunicipio(const ADescricaoMunicipio: TString);
begin
  FDescricaoMunicipio := ADescricaoMunicipio;
end;


end.
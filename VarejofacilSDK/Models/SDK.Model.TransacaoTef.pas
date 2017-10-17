unit SDK.Model.TransacaoTef;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums, SDK.Model.TransacaoItemTef;

type

  ITransacaoTef = interface(IModel)
    ['{7253C4C5-3A30-427D-8E4C-C9E1BB83CFC7}']
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetSequencialTransacaoTef: TString;
    procedure SetSequencialTransacaoTef(const ASequencialTransacaoTef: TString);
    function GetDataTransacaoTef: TString;
    procedure SetDataTransacaoTef(const ADataTransacaoTef: TString);
    function GetHoraTransacaoTef: TString;
    procedure SetHoraTransacaoTef(const AHoraTransacaoTef: TString);
    function GetCodigoEcf: TString;
    procedure SetCodigoEcf(const ACodigoEcf: TString);
    function GetDescricaoFinalizadora: TString;
    procedure SetDescricaoFinalizadora(const ADescricaoFinalizadora: TString);
    function GetValorFinalizadora: Double;
    procedure SetValorFinalizadora(const AValorFinalizadora: Double);
    function GetModalidadeDePagamento: TString;
    procedure SetModalidadeDePagamento(const AModalidadeDePagamento: TString);
    function GetDataEHora: TString;
    procedure SetDataEHora(const ADataEHora: TString);
    function GetModalidadeDeCancelamento: TString;
    procedure SetModalidadeDeCancelamento(const AModalidadeDeCancelamento: TString);
    function GetLinhaAutenticacaoDoCheque: TString;
    procedure SetLinhaAutenticacaoDoCheque(const ALinhaAutenticacaoDoCheque: TString);
    function GetPrimeiraViaComprovantePagamento: TByteArray;
    procedure SetPrimeiraViaComprovantePagamento(const APrimeiraViaComprovantePagamento: TByteArray);
    function GetSegundaViaComprovantePagamento: TByteArray;
    procedure SetSegundaViaComprovantePagamento(const ASegundaViaComprovantePagamento: TByteArray);
    function GetTrocoEmDinheiroParaSerDevolvido: TString;
    procedure SetTrocoEmDinheiroParaSerDevolvido(const ATrocoEmDinheiroParaSerDevolvido: TString);
    function GetInstituicaoQueIraProcessarTransacao: TString;
    procedure SetInstituicaoQueIraProcessarTransacao(const AInstituicaoQueIraProcessarTransacao: TString);
    function GetTipoDoCartao: TString;
    procedure SetTipoDoCartao(const ATipoDoCartao: TString);
    function GetNsuSitef: TString;
    procedure SetNsuSitef(const ANsuSitef: TString);
    function GetNsuHostAutorizador: TString;
    procedure SetNsuHostAutorizador(const ANsuHostAutorizador: TString);
    function GetCodigoAutorizacao: TString;
    procedure SetCodigoAutorizacao(const ACodigoAutorizacao: TString);
    function GetNumeroBinCartao: TString;
    procedure SetNumeroBinCartao(const ANumeroBinCartao: TString);
    function GetQtdDeParcelas: TString;
    procedure SetQtdDeParcelas(const AQtdDeParcelas: TString);
    function GetDataPrimeiraParcela: TString;
    procedure SetDataPrimeiraParcela(const ADataPrimeiraParcela: TString);
    function GetTipoDocumentoConsultado: TString;
    procedure SetTipoDocumentoConsultado(const ATipoDocumentoConsultado: TString);
    function GetNumeroDocumento: TString;
    procedure SetNumeroDocumento(const ANumeroDocumento: TString);
    function GetNumeroTelefone: TString;
    procedure SetNumeroTelefone(const ANumeroTelefone: TString);
    function GetTaxaDeServico: TString;
    procedure SetTaxaDeServico(const ATaxaDeServico: TString);
    function GetNumeroParcelas: TString;
    procedure SetNumeroParcelas(const ANumeroParcelas: TString);
    function GetDataDoPreDatado: TString;
    procedure SetDataDoPreDatado(const ADataDoPreDatado: TString);
    function GetPrimeiraParcelaEhAPrazo: Boolean;
    procedure SetPrimeiraParcelaEhAPrazo(const APrimeiraParcelaEhAPrazo: Boolean);
    function GetIntervaloDiasEntreParcelas: TString;
    procedure SetIntervaloDiasEntreParcelas(const AIntervaloDiasEntreParcelas: TString);
    function GetMesNaoEhFechado: Boolean;
    procedure SetMesNaoEhFechado(const AMesNaoEhFechado: Boolean);
    function GetGarantiaParaChequeAPrazo: TString;
    procedure SetGarantiaParaChequeAPrazo(const AGarantiaParaChequeAPrazo: TString);
    function GetNumeroParcelasCDC: TString;
    procedure SetNumeroParcelasCDC(const ANumeroParcelasCDC: TString);
    function GetNumeroCartaoCreditoDigitado: TString;
    procedure SetNumeroCartaoCreditoDigitado(const ANumeroCartaoCreditoDigitado: TString);
    function GetDataVencimentoCartao: TString;
    procedure SetDataVencimentoCartao(const ADataVencimentoCartao: TString);
    function GetCodigoSegurancaCartao: TString;
    procedure SetCodigoSegurancaCartao(const ACodigoSegurancaCartao: TString);
    function GetNomeOperadoraCelular: TString;
    procedure SetNomeOperadoraCelular(const ANomeOperadoraCelular: TString);
    function GetValorRecarga: TString;
    procedure SetValorRecarga(const AValorRecarga: TString);
    function GetNumeroParaRecargaComDDD: TString;
    procedure SetNumeroParaRecargaComDDD(const ANumeroParaRecargaComDDD: TString);
    function GetDigitoVerificador: TString;
    procedure SetDigitoVerificador(const ADigitoVerificador: TString);
    function GetCepLocalidadeDoTerminal: TString;
    procedure SetCepLocalidadeDoTerminal(const ACepLocalidadeDoTerminal: TString);
    function GetModalidadePagamentoCorrespondenteBancario: TString;
    procedure SetModalidadePagamentoCorrespondenteBancario(const AModalidadePagamentoCorrespondenteBancario: TString);
    function GetValorTotalDosTitulosPagosQndPagamentoEmLote: TString;
    procedure SetValorTotalDosTitulosPagosQndPagamentoEmLote(const AValorTotalDosTitulosPagosQndPagamentoEmLote: TString);
    function GetValorTotalDosTitulosNaoPagoQndPagamentoEmLote: TString;
    procedure SetValorTotalDosTitulosNaoPagoQndPagamentoEmLote(const AValorTotalDosTitulosNaoPagoQndPagamentoEmLote: TString);
    function GetDadosDoCheque: TString;
    procedure SetDadosDoCheque(const ADadosDoCheque: TString);
    function GetNsuSitefCancelamento: TString;
    procedure SetNsuSitefCancelamento(const ANsuSitefCancelamento: TString);
    function GetNsuCorrespondenteBancario: TString;
    procedure SetNsuCorrespondenteBancario(const ANsuCorrespondenteBancario: TString);
    function GetValorBeneficio: TString;
    procedure SetValorBeneficio(const AValorBeneficio: TString);
    function GetNumeroOperadoraValeGas: TString;
    procedure SetNumeroOperadoraValeGas(const ANumeroOperadoraValeGas: TString);
    function GetNomeProdutoValeGas: TString;
    procedure SetNomeProdutoValeGas(const ANomeProdutoValeGas: TString);
    function GetNumeroDoValeGas: TString;
    procedure SetNumeroDoValeGas(const ANumeroDoValeGas: TString);
    function GetTipoOperacao: TString;
    procedure SetTipoOperacao(const ATipoOperacao: TString);
    function GetTipo: TCharacter;
    procedure SetTipo(const ATipo: TCharacter);
    function GetSequencialFinalizadora: TString;
    procedure SetSequencialFinalizadora(const ASequencialFinalizadora: TString);
    function GetSequencialEquipamento: Integer;
    procedure SetSequencialEquipamento(const ASequencialEquipamento: Integer);
    function GetStatus: TString;
    procedure SetStatus(const AStatus: TString);
    function GetItensTransacaoItemTef: TTransacaoItemTefList;
    procedure SetItensTransacaoItemTef(const AItensTransacaoItemTef: TTransacaoItemTefList);
    property Id: Integer read GetId write SetId;
    property SequencialTransacaoTef: TString read GetSequencialTransacaoTef write SetSequencialTransacaoTef;
    property DataTransacaoTef: TString read GetDataTransacaoTef write SetDataTransacaoTef;
    property HoraTransacaoTef: TString read GetHoraTransacaoTef write SetHoraTransacaoTef;
    property CodigoEcf: TString read GetCodigoEcf write SetCodigoEcf;
    property DescricaoFinalizadora: TString read GetDescricaoFinalizadora write SetDescricaoFinalizadora;
    property ValorFinalizadora: Double read GetValorFinalizadora write SetValorFinalizadora;
    property ModalidadeDePagamento: TString read GetModalidadeDePagamento write SetModalidadeDePagamento;
    property DataEHora: TString read GetDataEHora write SetDataEHora;
    property ModalidadeDeCancelamento: TString read GetModalidadeDeCancelamento write SetModalidadeDeCancelamento;
    property LinhaAutenticacaoDoCheque: TString read GetLinhaAutenticacaoDoCheque write SetLinhaAutenticacaoDoCheque;
    property PrimeiraViaComprovantePagamento: TByteArray read GetPrimeiraViaComprovantePagamento write SetPrimeiraViaComprovantePagamento;
    property SegundaViaComprovantePagamento: TByteArray read GetSegundaViaComprovantePagamento write SetSegundaViaComprovantePagamento;
    property TrocoEmDinheiroParaSerDevolvido: TString read GetTrocoEmDinheiroParaSerDevolvido write SetTrocoEmDinheiroParaSerDevolvido;
    property InstituicaoQueIraProcessarTransacao: TString read GetInstituicaoQueIraProcessarTransacao write SetInstituicaoQueIraProcessarTransacao;
    property TipoDoCartao: TString read GetTipoDoCartao write SetTipoDoCartao;
    property NsuSitef: TString read GetNsuSitef write SetNsuSitef;
    property NsuHostAutorizador: TString read GetNsuHostAutorizador write SetNsuHostAutorizador;
    property CodigoAutorizacao: TString read GetCodigoAutorizacao write SetCodigoAutorizacao;
    property NumeroBinCartao: TString read GetNumeroBinCartao write SetNumeroBinCartao;
    property QtdDeParcelas: TString read GetQtdDeParcelas write SetQtdDeParcelas;
    property DataPrimeiraParcela: TString read GetDataPrimeiraParcela write SetDataPrimeiraParcela;
    property TipoDocumentoConsultado: TString read GetTipoDocumentoConsultado write SetTipoDocumentoConsultado;
    property NumeroDocumento: TString read GetNumeroDocumento write SetNumeroDocumento;
    property NumeroTelefone: TString read GetNumeroTelefone write SetNumeroTelefone;
    property TaxaDeServico: TString read GetTaxaDeServico write SetTaxaDeServico;
    property NumeroParcelas: TString read GetNumeroParcelas write SetNumeroParcelas;
    property DataDoPreDatado: TString read GetDataDoPreDatado write SetDataDoPreDatado;
    property PrimeiraParcelaEhAPrazo: Boolean read GetPrimeiraParcelaEhAPrazo write SetPrimeiraParcelaEhAPrazo;
    property IntervaloDiasEntreParcelas: TString read GetIntervaloDiasEntreParcelas write SetIntervaloDiasEntreParcelas;
    property MesNaoEhFechado: Boolean read GetMesNaoEhFechado write SetMesNaoEhFechado;
    property GarantiaParaChequeAPrazo: TString read GetGarantiaParaChequeAPrazo write SetGarantiaParaChequeAPrazo;
    property NumeroParcelasCDC: TString read GetNumeroParcelasCDC write SetNumeroParcelasCDC;
    property NumeroCartaoCreditoDigitado: TString read GetNumeroCartaoCreditoDigitado write SetNumeroCartaoCreditoDigitado;
    property DataVencimentoCartao: TString read GetDataVencimentoCartao write SetDataVencimentoCartao;
    property CodigoSegurancaCartao: TString read GetCodigoSegurancaCartao write SetCodigoSegurancaCartao;
    property NomeOperadoraCelular: TString read GetNomeOperadoraCelular write SetNomeOperadoraCelular;
    property ValorRecarga: TString read GetValorRecarga write SetValorRecarga;
    property NumeroParaRecargaComDDD: TString read GetNumeroParaRecargaComDDD write SetNumeroParaRecargaComDDD;
    property DigitoVerificador: TString read GetDigitoVerificador write SetDigitoVerificador;
    property CepLocalidadeDoTerminal: TString read GetCepLocalidadeDoTerminal write SetCepLocalidadeDoTerminal;
    property ModalidadePagamentoCorrespondenteBancario: TString read GetModalidadePagamentoCorrespondenteBancario write SetModalidadePagamentoCorrespondenteBancario;
    property ValorTotalDosTitulosPagosQndPagamentoEmLote: TString read GetValorTotalDosTitulosPagosQndPagamentoEmLote write SetValorTotalDosTitulosPagosQndPagamentoEmLote;
    property ValorTotalDosTitulosNaoPagoQndPagamentoEmLote: TString read GetValorTotalDosTitulosNaoPagoQndPagamentoEmLote write SetValorTotalDosTitulosNaoPagoQndPagamentoEmLote;
    property DadosDoCheque: TString read GetDadosDoCheque write SetDadosDoCheque;
    property NsuSitefCancelamento: TString read GetNsuSitefCancelamento write SetNsuSitefCancelamento;
    property NsuCorrespondenteBancario: TString read GetNsuCorrespondenteBancario write SetNsuCorrespondenteBancario;
    property ValorBeneficio: TString read GetValorBeneficio write SetValorBeneficio;
    property NumeroOperadoraValeGas: TString read GetNumeroOperadoraValeGas write SetNumeroOperadoraValeGas;
    property NomeProdutoValeGas: TString read GetNomeProdutoValeGas write SetNomeProdutoValeGas;
    property NumeroDoValeGas: TString read GetNumeroDoValeGas write SetNumeroDoValeGas;
    property TipoOperacao: TString read GetTipoOperacao write SetTipoOperacao;
    property Tipo: TCharacter read GetTipo write SetTipo;
    property SequencialFinalizadora: TString read GetSequencialFinalizadora write SetSequencialFinalizadora;
    property SequencialEquipamento: Integer read GetSequencialEquipamento write SetSequencialEquipamento;
    property Status: TString read GetStatus write SetStatus;
    property ItensTransacaoItemTef: TTransacaoItemTefList read GetItensTransacaoItemTef write SetItensTransacaoItemTef;
  end;

  TTransacaoTefList = class;

  ITransacaoTefList = interface
	['{47600CB4-1024-418B-84ED-0EBF55DF4CE7}']
    function GetReference: TTransacaoTefList;
    function GetItems(AIndex: Integer): ITransacaoTef;
    procedure SetItems(AIndex: Integer; const Value: ITransacaoTef);
    procedure Add(const ATransacaoTef: ITransacaoTef);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ITransacaoTef read GetItems write SetItems; default;
  end;

  TTransacaoTefListEnumerator = class
  private
    FIndex: Integer;
    FTransacaoTefList: TTransacaoTefList;
  public
    constructor Create(ATransacaoTefList: TTransacaoTefList);
    function GetCurrent: ITransacaoTef; inline;
    function MoveNext: Boolean;
    property Current: ITransacaoTef read GetCurrent;
  end;

  TTransacaoTefList = class(TInterfacedObject, ITransacaoTefList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ITransacaoTef;
    procedure SetItems(AIndex: Integer; const Value: ITransacaoTef);
  public
    constructor Create;
    procedure Add(const ATransacaoTef: ITransacaoTef);
    destructor Destroy; override;
    function GetEnumerator: TTransacaoTefListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TTransacaoTefList;
    property Items[AIndex: Integer]: ITransacaoTef read GetItems write SetItems; default;
  end;

  TTransacaoTefListRec = record
  private
    FList: ITransacaoTefList;
  public
    class function Create(const AList: ITransacaoTefList): TTransacaoTefListRec; static;
    class operator Implicit(AListRec: TTransacaoTefListRec): TTransacaoTefList;
  end;

  TTransacaoTef = class(TInterfacedModel, ITransacaoTef)
  private
	FId: Integer;
	FSequencialTransacaoTef: TString;
	FDataTransacaoTef: TString;
	FHoraTransacaoTef: TString;
	FCodigoEcf: TString;
	FDescricaoFinalizadora: TString;
	FValorFinalizadora: Double;
	FModalidadeDePagamento: TString;
	FDataEHora: TString;
	FModalidadeDeCancelamento: TString;
	FLinhaAutenticacaoDoCheque: TString;
	FPrimeiraViaComprovantePagamento: TByteArray;
	FSegundaViaComprovantePagamento: TByteArray;
	FTrocoEmDinheiroParaSerDevolvido: TString;
	FInstituicaoQueIraProcessarTransacao: TString;
	FTipoDoCartao: TString;
	FNsuSitef: TString;
	FNsuHostAutorizador: TString;
	FCodigoAutorizacao: TString;
	FNumeroBinCartao: TString;
	FQtdDeParcelas: TString;
	FDataPrimeiraParcela: TString;
	FTipoDocumentoConsultado: TString;
	FNumeroDocumento: TString;
	FNumeroTelefone: TString;
	FTaxaDeServico: TString;
	FNumeroParcelas: TString;
	FDataDoPreDatado: TString;
	FPrimeiraParcelaEhAPrazo: Boolean;
	FIntervaloDiasEntreParcelas: TString;
	FMesNaoEhFechado: Boolean;
	FGarantiaParaChequeAPrazo: TString;
	FNumeroParcelasCDC: TString;
	FNumeroCartaoCreditoDigitado: TString;
	FDataVencimentoCartao: TString;
	FCodigoSegurancaCartao: TString;
	FNomeOperadoraCelular: TString;
	FValorRecarga: TString;
	FNumeroParaRecargaComDDD: TString;
	FDigitoVerificador: TString;
	FCepLocalidadeDoTerminal: TString;
	FModalidadePagamentoCorrespondenteBancario: TString;
	FValorTotalDosTitulosPagosQndPagamentoEmLote: TString;
	FValorTotalDosTitulosNaoPagoQndPagamentoEmLote: TString;
	FDadosDoCheque: TString;
	FNsuSitefCancelamento: TString;
	FNsuCorrespondenteBancario: TString;
	FValorBeneficio: TString;
	FNumeroOperadoraValeGas: TString;
	FNomeProdutoValeGas: TString;
	FNumeroDoValeGas: TString;
	FTipoOperacao: TString;
	FTipo: TCharacter;
	FSequencialFinalizadora: TString;
	FSequencialEquipamento: Integer;
	FStatus: TString;
	FItensTransacaoItemTef: TTransacaoItemTefList;
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetSequencialTransacaoTef: TString;
    procedure SetSequencialTransacaoTef(const ASequencialTransacaoTef: TString);
    function GetDataTransacaoTef: TString;
    procedure SetDataTransacaoTef(const ADataTransacaoTef: TString);
    function GetHoraTransacaoTef: TString;
    procedure SetHoraTransacaoTef(const AHoraTransacaoTef: TString);
    function GetCodigoEcf: TString;
    procedure SetCodigoEcf(const ACodigoEcf: TString);
    function GetDescricaoFinalizadora: TString;
    procedure SetDescricaoFinalizadora(const ADescricaoFinalizadora: TString);
    function GetValorFinalizadora: Double;
    procedure SetValorFinalizadora(const AValorFinalizadora: Double);
    function GetModalidadeDePagamento: TString;
    procedure SetModalidadeDePagamento(const AModalidadeDePagamento: TString);
    function GetDataEHora: TString;
    procedure SetDataEHora(const ADataEHora: TString);
    function GetModalidadeDeCancelamento: TString;
    procedure SetModalidadeDeCancelamento(const AModalidadeDeCancelamento: TString);
    function GetLinhaAutenticacaoDoCheque: TString;
    procedure SetLinhaAutenticacaoDoCheque(const ALinhaAutenticacaoDoCheque: TString);
    function GetPrimeiraViaComprovantePagamento: TByteArray;
    procedure SetPrimeiraViaComprovantePagamento(const APrimeiraViaComprovantePagamento: TByteArray);
    function GetSegundaViaComprovantePagamento: TByteArray;
    procedure SetSegundaViaComprovantePagamento(const ASegundaViaComprovantePagamento: TByteArray);
    function GetTrocoEmDinheiroParaSerDevolvido: TString;
    procedure SetTrocoEmDinheiroParaSerDevolvido(const ATrocoEmDinheiroParaSerDevolvido: TString);
    function GetInstituicaoQueIraProcessarTransacao: TString;
    procedure SetInstituicaoQueIraProcessarTransacao(const AInstituicaoQueIraProcessarTransacao: TString);
    function GetTipoDoCartao: TString;
    procedure SetTipoDoCartao(const ATipoDoCartao: TString);
    function GetNsuSitef: TString;
    procedure SetNsuSitef(const ANsuSitef: TString);
    function GetNsuHostAutorizador: TString;
    procedure SetNsuHostAutorizador(const ANsuHostAutorizador: TString);
    function GetCodigoAutorizacao: TString;
    procedure SetCodigoAutorizacao(const ACodigoAutorizacao: TString);
    function GetNumeroBinCartao: TString;
    procedure SetNumeroBinCartao(const ANumeroBinCartao: TString);
    function GetQtdDeParcelas: TString;
    procedure SetQtdDeParcelas(const AQtdDeParcelas: TString);
    function GetDataPrimeiraParcela: TString;
    procedure SetDataPrimeiraParcela(const ADataPrimeiraParcela: TString);
    function GetTipoDocumentoConsultado: TString;
    procedure SetTipoDocumentoConsultado(const ATipoDocumentoConsultado: TString);
    function GetNumeroDocumento: TString;
    procedure SetNumeroDocumento(const ANumeroDocumento: TString);
    function GetNumeroTelefone: TString;
    procedure SetNumeroTelefone(const ANumeroTelefone: TString);
    function GetTaxaDeServico: TString;
    procedure SetTaxaDeServico(const ATaxaDeServico: TString);
    function GetNumeroParcelas: TString;
    procedure SetNumeroParcelas(const ANumeroParcelas: TString);
    function GetDataDoPreDatado: TString;
    procedure SetDataDoPreDatado(const ADataDoPreDatado: TString);
    function GetPrimeiraParcelaEhAPrazo: Boolean;
    procedure SetPrimeiraParcelaEhAPrazo(const APrimeiraParcelaEhAPrazo: Boolean);
    function GetIntervaloDiasEntreParcelas: TString;
    procedure SetIntervaloDiasEntreParcelas(const AIntervaloDiasEntreParcelas: TString);
    function GetMesNaoEhFechado: Boolean;
    procedure SetMesNaoEhFechado(const AMesNaoEhFechado: Boolean);
    function GetGarantiaParaChequeAPrazo: TString;
    procedure SetGarantiaParaChequeAPrazo(const AGarantiaParaChequeAPrazo: TString);
    function GetNumeroParcelasCDC: TString;
    procedure SetNumeroParcelasCDC(const ANumeroParcelasCDC: TString);
    function GetNumeroCartaoCreditoDigitado: TString;
    procedure SetNumeroCartaoCreditoDigitado(const ANumeroCartaoCreditoDigitado: TString);
    function GetDataVencimentoCartao: TString;
    procedure SetDataVencimentoCartao(const ADataVencimentoCartao: TString);
    function GetCodigoSegurancaCartao: TString;
    procedure SetCodigoSegurancaCartao(const ACodigoSegurancaCartao: TString);
    function GetNomeOperadoraCelular: TString;
    procedure SetNomeOperadoraCelular(const ANomeOperadoraCelular: TString);
    function GetValorRecarga: TString;
    procedure SetValorRecarga(const AValorRecarga: TString);
    function GetNumeroParaRecargaComDDD: TString;
    procedure SetNumeroParaRecargaComDDD(const ANumeroParaRecargaComDDD: TString);
    function GetDigitoVerificador: TString;
    procedure SetDigitoVerificador(const ADigitoVerificador: TString);
    function GetCepLocalidadeDoTerminal: TString;
    procedure SetCepLocalidadeDoTerminal(const ACepLocalidadeDoTerminal: TString);
    function GetModalidadePagamentoCorrespondenteBancario: TString;
    procedure SetModalidadePagamentoCorrespondenteBancario(const AModalidadePagamentoCorrespondenteBancario: TString);
    function GetValorTotalDosTitulosPagosQndPagamentoEmLote: TString;
    procedure SetValorTotalDosTitulosPagosQndPagamentoEmLote(const AValorTotalDosTitulosPagosQndPagamentoEmLote: TString);
    function GetValorTotalDosTitulosNaoPagoQndPagamentoEmLote: TString;
    procedure SetValorTotalDosTitulosNaoPagoQndPagamentoEmLote(const AValorTotalDosTitulosNaoPagoQndPagamentoEmLote: TString);
    function GetDadosDoCheque: TString;
    procedure SetDadosDoCheque(const ADadosDoCheque: TString);
    function GetNsuSitefCancelamento: TString;
    procedure SetNsuSitefCancelamento(const ANsuSitefCancelamento: TString);
    function GetNsuCorrespondenteBancario: TString;
    procedure SetNsuCorrespondenteBancario(const ANsuCorrespondenteBancario: TString);
    function GetValorBeneficio: TString;
    procedure SetValorBeneficio(const AValorBeneficio: TString);
    function GetNumeroOperadoraValeGas: TString;
    procedure SetNumeroOperadoraValeGas(const ANumeroOperadoraValeGas: TString);
    function GetNomeProdutoValeGas: TString;
    procedure SetNomeProdutoValeGas(const ANomeProdutoValeGas: TString);
    function GetNumeroDoValeGas: TString;
    procedure SetNumeroDoValeGas(const ANumeroDoValeGas: TString);
    function GetTipoOperacao: TString;
    procedure SetTipoOperacao(const ATipoOperacao: TString);
    function GetTipo: TCharacter;
    procedure SetTipo(const ATipo: TCharacter);
    function GetSequencialFinalizadora: TString;
    procedure SetSequencialFinalizadora(const ASequencialFinalizadora: TString);
    function GetSequencialEquipamento: Integer;
    procedure SetSequencialEquipamento(const ASequencialEquipamento: Integer);
    function GetStatus: TString;
    procedure SetStatus(const AStatus: TString);
    function GetItensTransacaoItemTef: TTransacaoItemTefList;
    procedure SetItensTransacaoItemTef(const AItensTransacaoItemTef: TTransacaoItemTefList);
  public
    property PrimeiraViaComprovantePagamento: TByteArray read GetPrimeiraViaComprovantePagamento write SetPrimeiraViaComprovantePagamento;
    property SegundaViaComprovantePagamento: TByteArray read GetSegundaViaComprovantePagamento write SetSegundaViaComprovantePagamento;
  published
    property Id: Integer read GetId write SetId;
    property SequencialTransacaoTef: TString read GetSequencialTransacaoTef write SetSequencialTransacaoTef;
    property DataTransacaoTef: TString read GetDataTransacaoTef write SetDataTransacaoTef;
    property HoraTransacaoTef: TString read GetHoraTransacaoTef write SetHoraTransacaoTef;
    property CodigoEcf: TString read GetCodigoEcf write SetCodigoEcf;
    property DescricaoFinalizadora: TString read GetDescricaoFinalizadora write SetDescricaoFinalizadora;
    property ValorFinalizadora: Double read GetValorFinalizadora write SetValorFinalizadora;
    property ModalidadeDePagamento: TString read GetModalidadeDePagamento write SetModalidadeDePagamento;
    property DataEHora: TString read GetDataEHora write SetDataEHora;
    property ModalidadeDeCancelamento: TString read GetModalidadeDeCancelamento write SetModalidadeDeCancelamento;
    property LinhaAutenticacaoDoCheque: TString read GetLinhaAutenticacaoDoCheque write SetLinhaAutenticacaoDoCheque;
    property TrocoEmDinheiroParaSerDevolvido: TString read GetTrocoEmDinheiroParaSerDevolvido write SetTrocoEmDinheiroParaSerDevolvido;
    property InstituicaoQueIraProcessarTransacao: TString read GetInstituicaoQueIraProcessarTransacao write SetInstituicaoQueIraProcessarTransacao;
    property TipoDoCartao: TString read GetTipoDoCartao write SetTipoDoCartao;
    property NsuSitef: TString read GetNsuSitef write SetNsuSitef;
    property NsuHostAutorizador: TString read GetNsuHostAutorizador write SetNsuHostAutorizador;
    property CodigoAutorizacao: TString read GetCodigoAutorizacao write SetCodigoAutorizacao;
    property NumeroBinCartao: TString read GetNumeroBinCartao write SetNumeroBinCartao;
    property QtdDeParcelas: TString read GetQtdDeParcelas write SetQtdDeParcelas;
    property DataPrimeiraParcela: TString read GetDataPrimeiraParcela write SetDataPrimeiraParcela;
    property TipoDocumentoConsultado: TString read GetTipoDocumentoConsultado write SetTipoDocumentoConsultado;
    property NumeroDocumento: TString read GetNumeroDocumento write SetNumeroDocumento;
    property NumeroTelefone: TString read GetNumeroTelefone write SetNumeroTelefone;
    property TaxaDeServico: TString read GetTaxaDeServico write SetTaxaDeServico;
    property NumeroParcelas: TString read GetNumeroParcelas write SetNumeroParcelas;
    property DataDoPreDatado: TString read GetDataDoPreDatado write SetDataDoPreDatado;
    property PrimeiraParcelaEhAPrazo: Boolean read GetPrimeiraParcelaEhAPrazo write SetPrimeiraParcelaEhAPrazo;
    property IntervaloDiasEntreParcelas: TString read GetIntervaloDiasEntreParcelas write SetIntervaloDiasEntreParcelas;
    property MesNaoEhFechado: Boolean read GetMesNaoEhFechado write SetMesNaoEhFechado;
    property GarantiaParaChequeAPrazo: TString read GetGarantiaParaChequeAPrazo write SetGarantiaParaChequeAPrazo;
    property NumeroParcelasCDC: TString read GetNumeroParcelasCDC write SetNumeroParcelasCDC;
    property NumeroCartaoCreditoDigitado: TString read GetNumeroCartaoCreditoDigitado write SetNumeroCartaoCreditoDigitado;
    property DataVencimentoCartao: TString read GetDataVencimentoCartao write SetDataVencimentoCartao;
    property CodigoSegurancaCartao: TString read GetCodigoSegurancaCartao write SetCodigoSegurancaCartao;
    property NomeOperadoraCelular: TString read GetNomeOperadoraCelular write SetNomeOperadoraCelular;
    property ValorRecarga: TString read GetValorRecarga write SetValorRecarga;
    property NumeroParaRecargaComDDD: TString read GetNumeroParaRecargaComDDD write SetNumeroParaRecargaComDDD;
    property DigitoVerificador: TString read GetDigitoVerificador write SetDigitoVerificador;
    property CepLocalidadeDoTerminal: TString read GetCepLocalidadeDoTerminal write SetCepLocalidadeDoTerminal;
    property ModalidadePagamentoCorrespondenteBancario: TString read GetModalidadePagamentoCorrespondenteBancario write SetModalidadePagamentoCorrespondenteBancario;
    property ValorTotalDosTitulosPagosQndPagamentoEmLote: TString read GetValorTotalDosTitulosPagosQndPagamentoEmLote write SetValorTotalDosTitulosPagosQndPagamentoEmLote;
    property ValorTotalDosTitulosNaoPagoQndPagamentoEmLote: TString read GetValorTotalDosTitulosNaoPagoQndPagamentoEmLote write SetValorTotalDosTitulosNaoPagoQndPagamentoEmLote;
    property DadosDoCheque: TString read GetDadosDoCheque write SetDadosDoCheque;
    property NsuSitefCancelamento: TString read GetNsuSitefCancelamento write SetNsuSitefCancelamento;
    property NsuCorrespondenteBancario: TString read GetNsuCorrespondenteBancario write SetNsuCorrespondenteBancario;
    property ValorBeneficio: TString read GetValorBeneficio write SetValorBeneficio;
    property NumeroOperadoraValeGas: TString read GetNumeroOperadoraValeGas write SetNumeroOperadoraValeGas;
    property NomeProdutoValeGas: TString read GetNomeProdutoValeGas write SetNomeProdutoValeGas;
    property NumeroDoValeGas: TString read GetNumeroDoValeGas write SetNumeroDoValeGas;
    property TipoOperacao: TString read GetTipoOperacao write SetTipoOperacao;
    property Tipo: TCharacter read GetTipo write SetTipo;
    property SequencialFinalizadora: TString read GetSequencialFinalizadora write SetSequencialFinalizadora;
    property SequencialEquipamento: Integer read GetSequencialEquipamento write SetSequencialEquipamento;
    property Status: TString read GetStatus write SetStatus;
    property ItensTransacaoItemTef: TTransacaoItemTefList read GetItensTransacaoItemTef write SetItensTransacaoItemTef;
  end;

implementation

{ TTransacaoTefList }

procedure TTransacaoTefList.Add(const ATransacaoTef: ITransacaoTef);
begin
  FList.Add(ATransacaoTef);
end;

procedure TTransacaoTefList.Clear;
begin
  FList.Clear;
end;

function TTransacaoTefList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TTransacaoTefList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TTransacaoTefList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TTransacaoTefList.GetEnumerator: TTransacaoTefListEnumerator;
begin
  Result := TTransacaoTefListEnumerator.Create(Self);
end;

function TTransacaoTefList.GetItems(AIndex: Integer): ITransacaoTef;
begin
  Result := FList[AIndex] as ITransacaoTef;
end;

function TTransacaoTefList.GetReference: TTransacaoTefList;
begin
  Result := Self;
end;

procedure TTransacaoTefList.SetItems(AIndex: Integer; const Value: ITransacaoTef);
begin
  FList[AIndex] := Value;
end;

{ TTransacaoTefListEnumerator }

constructor TTransacaoTefListEnumerator.Create(ATransacaoTefList: TTransacaoTefList);
begin
  inherited Create;
  FIndex := -1;
  FTransacaoTefList := ATransacaoTefList;
end;

function TTransacaoTefListEnumerator.GetCurrent: ITransacaoTef;
begin
  Result := FTransacaoTefList[FIndex];
end;

function TTransacaoTefListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FTransacaoTefList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TTransacaoTefListRec }

class function TTransacaoTefListRec.Create(const AList: ITransacaoTefList): TTransacaoTefListRec;
begin
  FillChar(Result, SizeOf(TTransacaoTefListRec), 0);
  Result.FList := AList;
end;

class operator TTransacaoTefListRec.Implicit(AListRec: TTransacaoTefListRec): TTransacaoTefList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TTransacaoTef }

function TTransacaoTef.GetId: Integer;
begin
  Result := FId;
end;

procedure TTransacaoTef.SetId(const AId: Integer);
begin
  FId := AId;
end;

function TTransacaoTef.GetSequencialTransacaoTef: TString;
begin
  Result := FSequencialTransacaoTef;
end;

procedure TTransacaoTef.SetSequencialTransacaoTef(const ASequencialTransacaoTef: TString);
begin
  FSequencialTransacaoTef := ASequencialTransacaoTef;
end;

function TTransacaoTef.GetDataTransacaoTef: TString;
begin
  Result := FDataTransacaoTef;
end;

procedure TTransacaoTef.SetDataTransacaoTef(const ADataTransacaoTef: TString);
begin
  FDataTransacaoTef := ADataTransacaoTef;
end;

function TTransacaoTef.GetHoraTransacaoTef: TString;
begin
  Result := FHoraTransacaoTef;
end;

procedure TTransacaoTef.SetHoraTransacaoTef(const AHoraTransacaoTef: TString);
begin
  FHoraTransacaoTef := AHoraTransacaoTef;
end;

function TTransacaoTef.GetCodigoEcf: TString;
begin
  Result := FCodigoEcf;
end;

procedure TTransacaoTef.SetCodigoEcf(const ACodigoEcf: TString);
begin
  FCodigoEcf := ACodigoEcf;
end;

function TTransacaoTef.GetDescricaoFinalizadora: TString;
begin
  Result := FDescricaoFinalizadora;
end;

procedure TTransacaoTef.SetDescricaoFinalizadora(const ADescricaoFinalizadora: TString);
begin
  FDescricaoFinalizadora := ADescricaoFinalizadora;
end;

function TTransacaoTef.GetValorFinalizadora: Double;
begin
  Result := FValorFinalizadora;
end;

procedure TTransacaoTef.SetValorFinalizadora(const AValorFinalizadora: Double);
begin
  FValorFinalizadora := AValorFinalizadora;
end;

function TTransacaoTef.GetModalidadeDePagamento: TString;
begin
  Result := FModalidadeDePagamento;
end;

procedure TTransacaoTef.SetModalidadeDePagamento(const AModalidadeDePagamento: TString);
begin
  FModalidadeDePagamento := AModalidadeDePagamento;
end;

function TTransacaoTef.GetDataEHora: TString;
begin
  Result := FDataEHora;
end;

procedure TTransacaoTef.SetDataEHora(const ADataEHora: TString);
begin
  FDataEHora := ADataEHora;
end;

function TTransacaoTef.GetModalidadeDeCancelamento: TString;
begin
  Result := FModalidadeDeCancelamento;
end;

procedure TTransacaoTef.SetModalidadeDeCancelamento(const AModalidadeDeCancelamento: TString);
begin
  FModalidadeDeCancelamento := AModalidadeDeCancelamento;
end;

function TTransacaoTef.GetLinhaAutenticacaoDoCheque: TString;
begin
  Result := FLinhaAutenticacaoDoCheque;
end;

procedure TTransacaoTef.SetLinhaAutenticacaoDoCheque(const ALinhaAutenticacaoDoCheque: TString);
begin
  FLinhaAutenticacaoDoCheque := ALinhaAutenticacaoDoCheque;
end;

function TTransacaoTef.GetPrimeiraViaComprovantePagamento: TByteArray;
begin
  Result := FPrimeiraViaComprovantePagamento;
end;

procedure TTransacaoTef.SetPrimeiraViaComprovantePagamento(const APrimeiraViaComprovantePagamento: TByteArray);
begin
  FPrimeiraViaComprovantePagamento := APrimeiraViaComprovantePagamento;
end;

function TTransacaoTef.GetSegundaViaComprovantePagamento: TByteArray;
begin
  Result := FSegundaViaComprovantePagamento;
end;

procedure TTransacaoTef.SetSegundaViaComprovantePagamento(const ASegundaViaComprovantePagamento: TByteArray);
begin
  FSegundaViaComprovantePagamento := ASegundaViaComprovantePagamento;
end;

function TTransacaoTef.GetTrocoEmDinheiroParaSerDevolvido: TString;
begin
  Result := FTrocoEmDinheiroParaSerDevolvido;
end;

procedure TTransacaoTef.SetTrocoEmDinheiroParaSerDevolvido(const ATrocoEmDinheiroParaSerDevolvido: TString);
begin
  FTrocoEmDinheiroParaSerDevolvido := ATrocoEmDinheiroParaSerDevolvido;
end;

function TTransacaoTef.GetInstituicaoQueIraProcessarTransacao: TString;
begin
  Result := FInstituicaoQueIraProcessarTransacao;
end;

procedure TTransacaoTef.SetInstituicaoQueIraProcessarTransacao(const AInstituicaoQueIraProcessarTransacao: TString);
begin
  FInstituicaoQueIraProcessarTransacao := AInstituicaoQueIraProcessarTransacao;
end;

function TTransacaoTef.GetTipoDoCartao: TString;
begin
  Result := FTipoDoCartao;
end;

procedure TTransacaoTef.SetTipoDoCartao(const ATipoDoCartao: TString);
begin
  FTipoDoCartao := ATipoDoCartao;
end;

function TTransacaoTef.GetNsuSitef: TString;
begin
  Result := FNsuSitef;
end;

procedure TTransacaoTef.SetNsuSitef(const ANsuSitef: TString);
begin
  FNsuSitef := ANsuSitef;
end;

function TTransacaoTef.GetNsuHostAutorizador: TString;
begin
  Result := FNsuHostAutorizador;
end;

procedure TTransacaoTef.SetNsuHostAutorizador(const ANsuHostAutorizador: TString);
begin
  FNsuHostAutorizador := ANsuHostAutorizador;
end;

function TTransacaoTef.GetCodigoAutorizacao: TString;
begin
  Result := FCodigoAutorizacao;
end;

procedure TTransacaoTef.SetCodigoAutorizacao(const ACodigoAutorizacao: TString);
begin
  FCodigoAutorizacao := ACodigoAutorizacao;
end;

function TTransacaoTef.GetNumeroBinCartao: TString;
begin
  Result := FNumeroBinCartao;
end;

procedure TTransacaoTef.SetNumeroBinCartao(const ANumeroBinCartao: TString);
begin
  FNumeroBinCartao := ANumeroBinCartao;
end;

function TTransacaoTef.GetQtdDeParcelas: TString;
begin
  Result := FQtdDeParcelas;
end;

procedure TTransacaoTef.SetQtdDeParcelas(const AQtdDeParcelas: TString);
begin
  FQtdDeParcelas := AQtdDeParcelas;
end;

function TTransacaoTef.GetDataPrimeiraParcela: TString;
begin
  Result := FDataPrimeiraParcela;
end;

procedure TTransacaoTef.SetDataPrimeiraParcela(const ADataPrimeiraParcela: TString);
begin
  FDataPrimeiraParcela := ADataPrimeiraParcela;
end;

function TTransacaoTef.GetTipoDocumentoConsultado: TString;
begin
  Result := FTipoDocumentoConsultado;
end;

procedure TTransacaoTef.SetTipoDocumentoConsultado(const ATipoDocumentoConsultado: TString);
begin
  FTipoDocumentoConsultado := ATipoDocumentoConsultado;
end;

function TTransacaoTef.GetNumeroDocumento: TString;
begin
  Result := FNumeroDocumento;
end;

procedure TTransacaoTef.SetNumeroDocumento(const ANumeroDocumento: TString);
begin
  FNumeroDocumento := ANumeroDocumento;
end;

function TTransacaoTef.GetNumeroTelefone: TString;
begin
  Result := FNumeroTelefone;
end;

procedure TTransacaoTef.SetNumeroTelefone(const ANumeroTelefone: TString);
begin
  FNumeroTelefone := ANumeroTelefone;
end;

function TTransacaoTef.GetTaxaDeServico: TString;
begin
  Result := FTaxaDeServico;
end;

procedure TTransacaoTef.SetTaxaDeServico(const ATaxaDeServico: TString);
begin
  FTaxaDeServico := ATaxaDeServico;
end;

function TTransacaoTef.GetNumeroParcelas: TString;
begin
  Result := FNumeroParcelas;
end;

procedure TTransacaoTef.SetNumeroParcelas(const ANumeroParcelas: TString);
begin
  FNumeroParcelas := ANumeroParcelas;
end;

function TTransacaoTef.GetDataDoPreDatado: TString;
begin
  Result := FDataDoPreDatado;
end;

procedure TTransacaoTef.SetDataDoPreDatado(const ADataDoPreDatado: TString);
begin
  FDataDoPreDatado := ADataDoPreDatado;
end;

function TTransacaoTef.GetPrimeiraParcelaEhAPrazo: Boolean;
begin
  Result := FPrimeiraParcelaEhAPrazo;
end;

procedure TTransacaoTef.SetPrimeiraParcelaEhAPrazo(const APrimeiraParcelaEhAPrazo: Boolean);
begin
  FPrimeiraParcelaEhAPrazo := APrimeiraParcelaEhAPrazo;
end;

function TTransacaoTef.GetIntervaloDiasEntreParcelas: TString;
begin
  Result := FIntervaloDiasEntreParcelas;
end;

procedure TTransacaoTef.SetIntervaloDiasEntreParcelas(const AIntervaloDiasEntreParcelas: TString);
begin
  FIntervaloDiasEntreParcelas := AIntervaloDiasEntreParcelas;
end;

function TTransacaoTef.GetMesNaoEhFechado: Boolean;
begin
  Result := FMesNaoEhFechado;
end;

procedure TTransacaoTef.SetMesNaoEhFechado(const AMesNaoEhFechado: Boolean);
begin
  FMesNaoEhFechado := AMesNaoEhFechado;
end;

function TTransacaoTef.GetGarantiaParaChequeAPrazo: TString;
begin
  Result := FGarantiaParaChequeAPrazo;
end;

procedure TTransacaoTef.SetGarantiaParaChequeAPrazo(const AGarantiaParaChequeAPrazo: TString);
begin
  FGarantiaParaChequeAPrazo := AGarantiaParaChequeAPrazo;
end;

function TTransacaoTef.GetNumeroParcelasCDC: TString;
begin
  Result := FNumeroParcelasCDC;
end;

procedure TTransacaoTef.SetNumeroParcelasCDC(const ANumeroParcelasCDC: TString);
begin
  FNumeroParcelasCDC := ANumeroParcelasCDC;
end;

function TTransacaoTef.GetNumeroCartaoCreditoDigitado: TString;
begin
  Result := FNumeroCartaoCreditoDigitado;
end;

procedure TTransacaoTef.SetNumeroCartaoCreditoDigitado(const ANumeroCartaoCreditoDigitado: TString);
begin
  FNumeroCartaoCreditoDigitado := ANumeroCartaoCreditoDigitado;
end;

function TTransacaoTef.GetDataVencimentoCartao: TString;
begin
  Result := FDataVencimentoCartao;
end;

procedure TTransacaoTef.SetDataVencimentoCartao(const ADataVencimentoCartao: TString);
begin
  FDataVencimentoCartao := ADataVencimentoCartao;
end;

function TTransacaoTef.GetCodigoSegurancaCartao: TString;
begin
  Result := FCodigoSegurancaCartao;
end;

procedure TTransacaoTef.SetCodigoSegurancaCartao(const ACodigoSegurancaCartao: TString);
begin
  FCodigoSegurancaCartao := ACodigoSegurancaCartao;
end;

function TTransacaoTef.GetNomeOperadoraCelular: TString;
begin
  Result := FNomeOperadoraCelular;
end;

procedure TTransacaoTef.SetNomeOperadoraCelular(const ANomeOperadoraCelular: TString);
begin
  FNomeOperadoraCelular := ANomeOperadoraCelular;
end;

function TTransacaoTef.GetValorRecarga: TString;
begin
  Result := FValorRecarga;
end;

procedure TTransacaoTef.SetValorRecarga(const AValorRecarga: TString);
begin
  FValorRecarga := AValorRecarga;
end;

function TTransacaoTef.GetNumeroParaRecargaComDDD: TString;
begin
  Result := FNumeroParaRecargaComDDD;
end;

procedure TTransacaoTef.SetNumeroParaRecargaComDDD(const ANumeroParaRecargaComDDD: TString);
begin
  FNumeroParaRecargaComDDD := ANumeroParaRecargaComDDD;
end;

function TTransacaoTef.GetDigitoVerificador: TString;
begin
  Result := FDigitoVerificador;
end;

procedure TTransacaoTef.SetDigitoVerificador(const ADigitoVerificador: TString);
begin
  FDigitoVerificador := ADigitoVerificador;
end;

function TTransacaoTef.GetCepLocalidadeDoTerminal: TString;
begin
  Result := FCepLocalidadeDoTerminal;
end;

procedure TTransacaoTef.SetCepLocalidadeDoTerminal(const ACepLocalidadeDoTerminal: TString);
begin
  FCepLocalidadeDoTerminal := ACepLocalidadeDoTerminal;
end;

function TTransacaoTef.GetModalidadePagamentoCorrespondenteBancario: TString;
begin
  Result := FModalidadePagamentoCorrespondenteBancario;
end;

procedure TTransacaoTef.SetModalidadePagamentoCorrespondenteBancario(const AModalidadePagamentoCorrespondenteBancario: TString);
begin
  FModalidadePagamentoCorrespondenteBancario := AModalidadePagamentoCorrespondenteBancario;
end;

function TTransacaoTef.GetValorTotalDosTitulosPagosQndPagamentoEmLote: TString;
begin
  Result := FValorTotalDosTitulosPagosQndPagamentoEmLote;
end;

procedure TTransacaoTef.SetValorTotalDosTitulosPagosQndPagamentoEmLote(const AValorTotalDosTitulosPagosQndPagamentoEmLote: TString);
begin
  FValorTotalDosTitulosPagosQndPagamentoEmLote := AValorTotalDosTitulosPagosQndPagamentoEmLote;
end;

function TTransacaoTef.GetValorTotalDosTitulosNaoPagoQndPagamentoEmLote: TString;
begin
  Result := FValorTotalDosTitulosNaoPagoQndPagamentoEmLote;
end;

procedure TTransacaoTef.SetValorTotalDosTitulosNaoPagoQndPagamentoEmLote(const AValorTotalDosTitulosNaoPagoQndPagamentoEmLote: TString);
begin
  FValorTotalDosTitulosNaoPagoQndPagamentoEmLote := AValorTotalDosTitulosNaoPagoQndPagamentoEmLote;
end;

function TTransacaoTef.GetDadosDoCheque: TString;
begin
  Result := FDadosDoCheque;
end;

procedure TTransacaoTef.SetDadosDoCheque(const ADadosDoCheque: TString);
begin
  FDadosDoCheque := ADadosDoCheque;
end;

function TTransacaoTef.GetNsuSitefCancelamento: TString;
begin
  Result := FNsuSitefCancelamento;
end;

procedure TTransacaoTef.SetNsuSitefCancelamento(const ANsuSitefCancelamento: TString);
begin
  FNsuSitefCancelamento := ANsuSitefCancelamento;
end;

function TTransacaoTef.GetNsuCorrespondenteBancario: TString;
begin
  Result := FNsuCorrespondenteBancario;
end;

procedure TTransacaoTef.SetNsuCorrespondenteBancario(const ANsuCorrespondenteBancario: TString);
begin
  FNsuCorrespondenteBancario := ANsuCorrespondenteBancario;
end;

function TTransacaoTef.GetValorBeneficio: TString;
begin
  Result := FValorBeneficio;
end;

procedure TTransacaoTef.SetValorBeneficio(const AValorBeneficio: TString);
begin
  FValorBeneficio := AValorBeneficio;
end;

function TTransacaoTef.GetNumeroOperadoraValeGas: TString;
begin
  Result := FNumeroOperadoraValeGas;
end;

procedure TTransacaoTef.SetNumeroOperadoraValeGas(const ANumeroOperadoraValeGas: TString);
begin
  FNumeroOperadoraValeGas := ANumeroOperadoraValeGas;
end;

function TTransacaoTef.GetNomeProdutoValeGas: TString;
begin
  Result := FNomeProdutoValeGas;
end;

procedure TTransacaoTef.SetNomeProdutoValeGas(const ANomeProdutoValeGas: TString);
begin
  FNomeProdutoValeGas := ANomeProdutoValeGas;
end;

function TTransacaoTef.GetNumeroDoValeGas: TString;
begin
  Result := FNumeroDoValeGas;
end;

procedure TTransacaoTef.SetNumeroDoValeGas(const ANumeroDoValeGas: TString);
begin
  FNumeroDoValeGas := ANumeroDoValeGas;
end;

function TTransacaoTef.GetTipoOperacao: TString;
begin
  Result := FTipoOperacao;
end;

procedure TTransacaoTef.SetTipoOperacao(const ATipoOperacao: TString);
begin
  FTipoOperacao := ATipoOperacao;
end;

function TTransacaoTef.GetTipo: TCharacter;
begin
  Result := FTipo;
end;

procedure TTransacaoTef.SetTipo(const ATipo: TCharacter);
begin
  FTipo := ATipo;
end;

function TTransacaoTef.GetSequencialFinalizadora: TString;
begin
  Result := FSequencialFinalizadora;
end;

procedure TTransacaoTef.SetSequencialFinalizadora(const ASequencialFinalizadora: TString);
begin
  FSequencialFinalizadora := ASequencialFinalizadora;
end;

function TTransacaoTef.GetSequencialEquipamento: Integer;
begin
  Result := FSequencialEquipamento;
end;

procedure TTransacaoTef.SetSequencialEquipamento(const ASequencialEquipamento: Integer);
begin
  FSequencialEquipamento := ASequencialEquipamento;
end;

function TTransacaoTef.GetStatus: TString;
begin
  Result := FStatus;
end;

procedure TTransacaoTef.SetStatus(const AStatus: TString);
begin
  FStatus := AStatus;
end;

function TTransacaoTef.GetItensTransacaoItemTef: TTransacaoItemTefList;
begin
  Result := FItensTransacaoItemTef;
end;

procedure TTransacaoTef.SetItensTransacaoItemTef(const AItensTransacaoItemTef: TTransacaoItemTefList);
begin
  FItensTransacaoItemTef := AItensTransacaoItemTef;
end;


end.
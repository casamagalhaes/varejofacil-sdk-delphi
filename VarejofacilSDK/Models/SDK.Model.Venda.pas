unit SDK.Model.Venda;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IVenda = interface(IModel)
    ['{DD317BBA-5DB4-474E-A563-BD26055F06C2}']
    function GetId: TString;
    procedure SetId(const AId: TString);
    function GetSequencial: TString;
    procedure SetSequencial(const ASequencial: TString);
    function GetNumeroCaixa: TString;
    procedure SetNumeroCaixa(const ANumeroCaixa: TString);
    function GetData: TDateTime;
    procedure SetData(const AData: TDateTime);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetCoo: Integer;
    procedure SetCoo(const ACoo: Integer);
    function GetNumeroEquipamento: TString;
    procedure SetNumeroEquipamento(const ANumeroEquipamento: TString);
    function GetFuncionarioId: Integer;
    procedure SetFuncionarioId(const AFuncionarioId: Integer);
    function GetAutorizadorId: Integer;
    procedure SetAutorizadorId(const AAutorizadorId: Integer);
    function GetClienteId: Int64;
    procedure SetClienteId(const AClienteId: Int64);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
    function GetAcrescimo: Double;
    procedure SetAcrescimo(const AAcrescimo: Double);
    function GetDesconto: Double;
    procedure SetDesconto(const ADesconto: Double);
    function GetQtdItensCupom: Double;
    procedure SetQtdItensCupom(const AQtdItensCupom: Double);
    function GetQtdUnidadesCupom: Double;
    procedure SetQtdUnidadesCupom(const AQtdUnidadesCupom: Double);
    function GetQtdItensCancelados: Double;
    procedure SetQtdItensCancelados(const AQtdItensCancelados: Double);
    function GetQtdUnidadesCanceladas: Double;
    procedure SetQtdUnidadesCanceladas(const AQtdUnidadesCanceladas: Double);
    function GetValorItensCancelados: Double;
    procedure SetValorItensCancelados(const AValorItensCancelados: Double);
    function GetMargemDesconto: Double;
    procedure SetMargemDesconto(const AMargemDesconto: Double);
    function GetValorServico: Double;
    procedure SetValorServico(const AValorServico: Double);
    function GetDataVenda: TDateTime;
    procedure SetDataVenda(const ADataVenda: TDateTime);
    function GetDataHoraAberturaCupom: TDateTime;
    procedure SetDataHoraAberturaCupom(const ADataHoraAberturaCupom: TDateTime);
    function GetDataHoraFechamentoCupom: TDateTime;
    procedure SetDataHoraFechamentoCupom(const ADataHoraFechamentoCupom: TDateTime);
    function GetTipoPreco: TString;
    procedure SetTipoPreco(const ATipoPreco: TString);
    function GetCodigoImpressora: TString;
    procedure SetCodigoImpressora(const ACodigoImpressora: TString);
    function GetCartaoFidelidade: TString;
    procedure SetCartaoFidelidade(const ACartaoFidelidade: TString);
    function GetSerieEquipamento: TString;
    procedure SetSerieEquipamento(const ASerieEquipamento: TString);
    function GetContadorDocumento: TString;
    procedure SetContadorDocumento(const AContadorDocumento: TString);
    function GetTransacaoVendaEnvelope: TString;
    procedure SetTransacaoVendaEnvelope(const ATransacaoVendaEnvelope: TString);
    function GetSequencialOperador: TString;
    procedure SetSequencialOperador(const ASequencialOperador: TString);
    function GetAbonoServico: Tboolean;
    procedure SetAbonoServico(const AAbonoServico: Tboolean);
    function GetImprimiuNotaFiscal: Tboolean;
    procedure SetImprimiuNotaFiscal(const AImprimiuNotaFiscal: Tboolean);
    function GetStatusXMLNota: TStatusXmlNotaPDV;
    procedure SetStatusXMLNota(const AStatusXMLNota: TStatusXmlNotaPDV);
    property Id: TString read GetId write SetId;
    property Sequencial: TString read GetSequencial write SetSequencial;
    property NumeroCaixa: TString read GetNumeroCaixa write SetNumeroCaixa;
    property Data: TDateTime read GetData write SetData;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property Coo: Integer read GetCoo write SetCoo;
    property NumeroEquipamento: TString read GetNumeroEquipamento write SetNumeroEquipamento;
    property FuncionarioId: Integer read GetFuncionarioId write SetFuncionarioId;
    property AutorizadorId: Integer read GetAutorizadorId write SetAutorizadorId;
    property ClienteId: Int64 read GetClienteId write SetClienteId;
    property Valor: Double read GetValor write SetValor;
    property Acrescimo: Double read GetAcrescimo write SetAcrescimo;
    property Desconto: Double read GetDesconto write SetDesconto;
    property QtdItensCupom: Double read GetQtdItensCupom write SetQtdItensCupom;
    property QtdUnidadesCupom: Double read GetQtdUnidadesCupom write SetQtdUnidadesCupom;
    property QtdItensCancelados: Double read GetQtdItensCancelados write SetQtdItensCancelados;
    property QtdUnidadesCanceladas: Double read GetQtdUnidadesCanceladas write SetQtdUnidadesCanceladas;
    property ValorItensCancelados: Double read GetValorItensCancelados write SetValorItensCancelados;
    property MargemDesconto: Double read GetMargemDesconto write SetMargemDesconto;
    property ValorServico: Double read GetValorServico write SetValorServico;
    property DataVenda: TDateTime read GetDataVenda write SetDataVenda;
    property DataHoraAberturaCupom: TDateTime read GetDataHoraAberturaCupom write SetDataHoraAberturaCupom;
    property DataHoraFechamentoCupom: TDateTime read GetDataHoraFechamentoCupom write SetDataHoraFechamentoCupom;
    property TipoPreco: TString read GetTipoPreco write SetTipoPreco;
    property CodigoImpressora: TString read GetCodigoImpressora write SetCodigoImpressora;
    property CartaoFidelidade: TString read GetCartaoFidelidade write SetCartaoFidelidade;
    property SerieEquipamento: TString read GetSerieEquipamento write SetSerieEquipamento;
    property ContadorDocumento: TString read GetContadorDocumento write SetContadorDocumento;
    property TransacaoVendaEnvelope: TString read GetTransacaoVendaEnvelope write SetTransacaoVendaEnvelope;
    property SequencialOperador: TString read GetSequencialOperador write SetSequencialOperador;
    property AbonoServico: Tboolean read GetAbonoServico write SetAbonoServico;
    property ImprimiuNotaFiscal: Tboolean read GetImprimiuNotaFiscal write SetImprimiuNotaFiscal;
    property StatusXMLNota: TStatusXmlNotaPDV read GetStatusXMLNota write SetStatusXMLNota;
  end;

  TVendaList = class;

  IVendaList = interface
	['{DEFCFCDF-5F33-480C-A023-ED199331EE13}']
    function GetReference: TVendaList;
    function GetItems(AIndex: Integer): IVenda;
    procedure SetItems(AIndex: Integer; const Value: IVenda);
    procedure Add(const AVenda: IVenda);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IVenda read GetItems write SetItems; default;
  end;

  TVendaListEnumerator = class
  private
    FIndex: Integer;
    FVendaList: TVendaList;
  public
    constructor Create(AVendaList: TVendaList);
    function GetCurrent: IVenda; inline;
    function MoveNext: Boolean;
    property Current: IVenda read GetCurrent;
  end;

  TVendaList = class(TInterfacedObject, IVendaList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IVenda;
    procedure SetItems(AIndex: Integer; const Value: IVenda);
  public
    constructor Create;
    procedure Add(const AVenda: IVenda);
    destructor Destroy; override;
    function GetEnumerator: TVendaListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TVendaList;
    property Items[AIndex: Integer]: IVenda read GetItems write SetItems; default;
  end;

  TVendaListRec = record
  private
    FList: IVendaList;
  public
    class function Create(const AList: IVendaList): TVendaListRec; static;
    class operator Implicit(AListRec: TVendaListRec): TVendaList;
  end;

  TVenda = class(TInterfacedObject, IVenda)
  private
	FId: TString;
	FSequencial: TString;
	FNumeroCaixa: TString;
	FData: TDateTime;
	FLojaId: Int64;
	FCoo: Integer;
	FNumeroEquipamento: TString;
	FFuncionarioId: Integer;
	FAutorizadorId: Integer;
	FClienteId: Int64;
	FValor: Double;
	FAcrescimo: Double;
	FDesconto: Double;
	FQtdItensCupom: Double;
	FQtdUnidadesCupom: Double;
	FQtdItensCancelados: Double;
	FQtdUnidadesCanceladas: Double;
	FValorItensCancelados: Double;
	FMargemDesconto: Double;
	FValorServico: Double;
	FDataVenda: TDateTime;
	FDataHoraAberturaCupom: TDateTime;
	FDataHoraFechamentoCupom: TDateTime;
	FTipoPreco: TString;
	FCodigoImpressora: TString;
	FCartaoFidelidade: TString;
	FSerieEquipamento: TString;
	FContadorDocumento: TString;
	FTransacaoVendaEnvelope: TString;
	FSequencialOperador: TString;
	FAbonoServico: Tboolean;
	FImprimiuNotaFiscal: Tboolean;
	FStatusXMLNota: TStatusXmlNotaPDV;
    function GetId: TString;
    procedure SetId(const AId: TString);
    function GetSequencial: TString;
    procedure SetSequencial(const ASequencial: TString);
    function GetNumeroCaixa: TString;
    procedure SetNumeroCaixa(const ANumeroCaixa: TString);
    function GetData: TDateTime;
    procedure SetData(const AData: TDateTime);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetCoo: Integer;
    procedure SetCoo(const ACoo: Integer);
    function GetNumeroEquipamento: TString;
    procedure SetNumeroEquipamento(const ANumeroEquipamento: TString);
    function GetFuncionarioId: Integer;
    procedure SetFuncionarioId(const AFuncionarioId: Integer);
    function GetAutorizadorId: Integer;
    procedure SetAutorizadorId(const AAutorizadorId: Integer);
    function GetClienteId: Int64;
    procedure SetClienteId(const AClienteId: Int64);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
    function GetAcrescimo: Double;
    procedure SetAcrescimo(const AAcrescimo: Double);
    function GetDesconto: Double;
    procedure SetDesconto(const ADesconto: Double);
    function GetQtdItensCupom: Double;
    procedure SetQtdItensCupom(const AQtdItensCupom: Double);
    function GetQtdUnidadesCupom: Double;
    procedure SetQtdUnidadesCupom(const AQtdUnidadesCupom: Double);
    function GetQtdItensCancelados: Double;
    procedure SetQtdItensCancelados(const AQtdItensCancelados: Double);
    function GetQtdUnidadesCanceladas: Double;
    procedure SetQtdUnidadesCanceladas(const AQtdUnidadesCanceladas: Double);
    function GetValorItensCancelados: Double;
    procedure SetValorItensCancelados(const AValorItensCancelados: Double);
    function GetMargemDesconto: Double;
    procedure SetMargemDesconto(const AMargemDesconto: Double);
    function GetValorServico: Double;
    procedure SetValorServico(const AValorServico: Double);
    function GetDataVenda: TDateTime;
    procedure SetDataVenda(const ADataVenda: TDateTime);
    function GetDataHoraAberturaCupom: TDateTime;
    procedure SetDataHoraAberturaCupom(const ADataHoraAberturaCupom: TDateTime);
    function GetDataHoraFechamentoCupom: TDateTime;
    procedure SetDataHoraFechamentoCupom(const ADataHoraFechamentoCupom: TDateTime);
    function GetTipoPreco: TString;
    procedure SetTipoPreco(const ATipoPreco: TString);
    function GetCodigoImpressora: TString;
    procedure SetCodigoImpressora(const ACodigoImpressora: TString);
    function GetCartaoFidelidade: TString;
    procedure SetCartaoFidelidade(const ACartaoFidelidade: TString);
    function GetSerieEquipamento: TString;
    procedure SetSerieEquipamento(const ASerieEquipamento: TString);
    function GetContadorDocumento: TString;
    procedure SetContadorDocumento(const AContadorDocumento: TString);
    function GetTransacaoVendaEnvelope: TString;
    procedure SetTransacaoVendaEnvelope(const ATransacaoVendaEnvelope: TString);
    function GetSequencialOperador: TString;
    procedure SetSequencialOperador(const ASequencialOperador: TString);
    function GetAbonoServico: Tboolean;
    procedure SetAbonoServico(const AAbonoServico: Tboolean);
    function GetImprimiuNotaFiscal: Tboolean;
    procedure SetImprimiuNotaFiscal(const AImprimiuNotaFiscal: Tboolean);
    function GetStatusXMLNota: TStatusXmlNotaPDV;
    procedure SetStatusXMLNota(const AStatusXMLNota: TStatusXmlNotaPDV);
  public
    property Id: TString read GetId write SetId;
    property Sequencial: TString read GetSequencial write SetSequencial;
    property NumeroCaixa: TString read GetNumeroCaixa write SetNumeroCaixa;
    property Data: TDateTime read GetData write SetData;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property Coo: Integer read GetCoo write SetCoo;
    property NumeroEquipamento: TString read GetNumeroEquipamento write SetNumeroEquipamento;
    property FuncionarioId: Integer read GetFuncionarioId write SetFuncionarioId;
    property AutorizadorId: Integer read GetAutorizadorId write SetAutorizadorId;
    property ClienteId: Int64 read GetClienteId write SetClienteId;
    property Valor: Double read GetValor write SetValor;
    property Acrescimo: Double read GetAcrescimo write SetAcrescimo;
    property Desconto: Double read GetDesconto write SetDesconto;
    property QtdItensCupom: Double read GetQtdItensCupom write SetQtdItensCupom;
    property QtdUnidadesCupom: Double read GetQtdUnidadesCupom write SetQtdUnidadesCupom;
    property QtdItensCancelados: Double read GetQtdItensCancelados write SetQtdItensCancelados;
    property QtdUnidadesCanceladas: Double read GetQtdUnidadesCanceladas write SetQtdUnidadesCanceladas;
    property ValorItensCancelados: Double read GetValorItensCancelados write SetValorItensCancelados;
    property MargemDesconto: Double read GetMargemDesconto write SetMargemDesconto;
    property ValorServico: Double read GetValorServico write SetValorServico;
    property DataVenda: TDateTime read GetDataVenda write SetDataVenda;
    property DataHoraAberturaCupom: TDateTime read GetDataHoraAberturaCupom write SetDataHoraAberturaCupom;
    property DataHoraFechamentoCupom: TDateTime read GetDataHoraFechamentoCupom write SetDataHoraFechamentoCupom;
    property TipoPreco: TString read GetTipoPreco write SetTipoPreco;
    property CodigoImpressora: TString read GetCodigoImpressora write SetCodigoImpressora;
    property CartaoFidelidade: TString read GetCartaoFidelidade write SetCartaoFidelidade;
    property SerieEquipamento: TString read GetSerieEquipamento write SetSerieEquipamento;
    property ContadorDocumento: TString read GetContadorDocumento write SetContadorDocumento;
    property TransacaoVendaEnvelope: TString read GetTransacaoVendaEnvelope write SetTransacaoVendaEnvelope;
    property SequencialOperador: TString read GetSequencialOperador write SetSequencialOperador;
    property AbonoServico: Tboolean read GetAbonoServico write SetAbonoServico;
    property ImprimiuNotaFiscal: Tboolean read GetImprimiuNotaFiscal write SetImprimiuNotaFiscal;
    property StatusXMLNota: TStatusXmlNotaPDV read GetStatusXMLNota write SetStatusXMLNota;
  end;

implementation

{ TVendaList }

procedure TVendaList.Add(const AVenda: IVenda);
begin
  FList.Add(AVenda);
end;

procedure TVendaList.Clear;
begin
  FList.Clear;
end;

function TVendaList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TVendaList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TVendaList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TVendaList.GetEnumerator: TVendaListEnumerator;
begin
  Result := TVendaListEnumerator.Create(Self);
end;

function TVendaList.GetItems(AIndex: Integer): IVenda;
begin
  Result := FList[AIndex] as IVenda;
end;

function TVendaList.GetReference: TVendaList;
begin
  Result := Self;
end;

procedure TVendaList.SetItems(AIndex: Integer; const Value: IVenda);
begin
  FList[AIndex] := Value;
end;

{ TVendaListEnumerator }

constructor TVendaListEnumerator.Create(AVendaList: TVendaList);
begin
  inherited Create;
  FIndex := -1;
  FVendaList := AVendaList;
end;

function TVendaListEnumerator.GetCurrent: IVenda;
begin
  Result := FVendaList[FIndex];
end;

function TVendaListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FVendaList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TVendaListRec }

class function TVendaListRec.Create(const AList: IVendaList): TVendaListRec;
begin
  FillChar(Result, SizeOf(TVendaListRec), 0);
  Result.FList := AList;
end;

class operator TVendaListRec.Implicit(AListRec: TVendaListRec): TVendaList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TVenda }

function TVenda.GetId: TString;
begin
  Result := FId;
end;

procedure TVenda.SetId(const AId: TString);
begin
  FId := AId;
end;

function TVenda.GetSequencial: TString;
begin
  Result := FSequencial;
end;

procedure TVenda.SetSequencial(const ASequencial: TString);
begin
  FSequencial := ASequencial;
end;

function TVenda.GetNumeroCaixa: TString;
begin
  Result := FNumeroCaixa;
end;

procedure TVenda.SetNumeroCaixa(const ANumeroCaixa: TString);
begin
  FNumeroCaixa := ANumeroCaixa;
end;

function TVenda.GetData: TDateTime;
begin
  Result := FData;
end;

procedure TVenda.SetData(const AData: TDateTime);
begin
  FData := AData;
end;

function TVenda.GetLojaId: Int64;
begin
  Result := FLojaId;
end;

procedure TVenda.SetLojaId(const ALojaId: Int64);
begin
  FLojaId := ALojaId;
end;

function TVenda.GetCoo: Integer;
begin
  Result := FCoo;
end;

procedure TVenda.SetCoo(const ACoo: Integer);
begin
  FCoo := ACoo;
end;

function TVenda.GetNumeroEquipamento: TString;
begin
  Result := FNumeroEquipamento;
end;

procedure TVenda.SetNumeroEquipamento(const ANumeroEquipamento: TString);
begin
  FNumeroEquipamento := ANumeroEquipamento;
end;

function TVenda.GetFuncionarioId: Integer;
begin
  Result := FFuncionarioId;
end;

procedure TVenda.SetFuncionarioId(const AFuncionarioId: Integer);
begin
  FFuncionarioId := AFuncionarioId;
end;

function TVenda.GetAutorizadorId: Integer;
begin
  Result := FAutorizadorId;
end;

procedure TVenda.SetAutorizadorId(const AAutorizadorId: Integer);
begin
  FAutorizadorId := AAutorizadorId;
end;

function TVenda.GetClienteId: Int64;
begin
  Result := FClienteId;
end;

procedure TVenda.SetClienteId(const AClienteId: Int64);
begin
  FClienteId := AClienteId;
end;

function TVenda.GetValor: Double;
begin
  Result := FValor;
end;

procedure TVenda.SetValor(const AValor: Double);
begin
  FValor := AValor;
end;

function TVenda.GetAcrescimo: Double;
begin
  Result := FAcrescimo;
end;

procedure TVenda.SetAcrescimo(const AAcrescimo: Double);
begin
  FAcrescimo := AAcrescimo;
end;

function TVenda.GetDesconto: Double;
begin
  Result := FDesconto;
end;

procedure TVenda.SetDesconto(const ADesconto: Double);
begin
  FDesconto := ADesconto;
end;

function TVenda.GetQtdItensCupom: Double;
begin
  Result := FQtdItensCupom;
end;

procedure TVenda.SetQtdItensCupom(const AQtdItensCupom: Double);
begin
  FQtdItensCupom := AQtdItensCupom;
end;

function TVenda.GetQtdUnidadesCupom: Double;
begin
  Result := FQtdUnidadesCupom;
end;

procedure TVenda.SetQtdUnidadesCupom(const AQtdUnidadesCupom: Double);
begin
  FQtdUnidadesCupom := AQtdUnidadesCupom;
end;

function TVenda.GetQtdItensCancelados: Double;
begin
  Result := FQtdItensCancelados;
end;

procedure TVenda.SetQtdItensCancelados(const AQtdItensCancelados: Double);
begin
  FQtdItensCancelados := AQtdItensCancelados;
end;

function TVenda.GetQtdUnidadesCanceladas: Double;
begin
  Result := FQtdUnidadesCanceladas;
end;

procedure TVenda.SetQtdUnidadesCanceladas(const AQtdUnidadesCanceladas: Double);
begin
  FQtdUnidadesCanceladas := AQtdUnidadesCanceladas;
end;

function TVenda.GetValorItensCancelados: Double;
begin
  Result := FValorItensCancelados;
end;

procedure TVenda.SetValorItensCancelados(const AValorItensCancelados: Double);
begin
  FValorItensCancelados := AValorItensCancelados;
end;

function TVenda.GetMargemDesconto: Double;
begin
  Result := FMargemDesconto;
end;

procedure TVenda.SetMargemDesconto(const AMargemDesconto: Double);
begin
  FMargemDesconto := AMargemDesconto;
end;

function TVenda.GetValorServico: Double;
begin
  Result := FValorServico;
end;

procedure TVenda.SetValorServico(const AValorServico: Double);
begin
  FValorServico := AValorServico;
end;

function TVenda.GetDataVenda: TDateTime;
begin
  Result := FDataVenda;
end;

procedure TVenda.SetDataVenda(const ADataVenda: TDateTime);
begin
  FDataVenda := ADataVenda;
end;

function TVenda.GetDataHoraAberturaCupom: TDateTime;
begin
  Result := FDataHoraAberturaCupom;
end;

procedure TVenda.SetDataHoraAberturaCupom(const ADataHoraAberturaCupom: TDateTime);
begin
  FDataHoraAberturaCupom := ADataHoraAberturaCupom;
end;

function TVenda.GetDataHoraFechamentoCupom: TDateTime;
begin
  Result := FDataHoraFechamentoCupom;
end;

procedure TVenda.SetDataHoraFechamentoCupom(const ADataHoraFechamentoCupom: TDateTime);
begin
  FDataHoraFechamentoCupom := ADataHoraFechamentoCupom;
end;

function TVenda.GetTipoPreco: TString;
begin
  Result := FTipoPreco;
end;

procedure TVenda.SetTipoPreco(const ATipoPreco: TString);
begin
  FTipoPreco := ATipoPreco;
end;

function TVenda.GetCodigoImpressora: TString;
begin
  Result := FCodigoImpressora;
end;

procedure TVenda.SetCodigoImpressora(const ACodigoImpressora: TString);
begin
  FCodigoImpressora := ACodigoImpressora;
end;

function TVenda.GetCartaoFidelidade: TString;
begin
  Result := FCartaoFidelidade;
end;

procedure TVenda.SetCartaoFidelidade(const ACartaoFidelidade: TString);
begin
  FCartaoFidelidade := ACartaoFidelidade;
end;

function TVenda.GetSerieEquipamento: TString;
begin
  Result := FSerieEquipamento;
end;

procedure TVenda.SetSerieEquipamento(const ASerieEquipamento: TString);
begin
  FSerieEquipamento := ASerieEquipamento;
end;

function TVenda.GetContadorDocumento: TString;
begin
  Result := FContadorDocumento;
end;

procedure TVenda.SetContadorDocumento(const AContadorDocumento: TString);
begin
  FContadorDocumento := AContadorDocumento;
end;

function TVenda.GetTransacaoVendaEnvelope: TString;
begin
  Result := FTransacaoVendaEnvelope;
end;

procedure TVenda.SetTransacaoVendaEnvelope(const ATransacaoVendaEnvelope: TString);
begin
  FTransacaoVendaEnvelope := ATransacaoVendaEnvelope;
end;

function TVenda.GetSequencialOperador: TString;
begin
  Result := FSequencialOperador;
end;

procedure TVenda.SetSequencialOperador(const ASequencialOperador: TString);
begin
  FSequencialOperador := ASequencialOperador;
end;

function TVenda.GetAbonoServico: Tboolean;
begin
  Result := FAbonoServico;
end;

procedure TVenda.SetAbonoServico(const AAbonoServico: Tboolean);
begin
  FAbonoServico := AAbonoServico;
end;

function TVenda.GetImprimiuNotaFiscal: Tboolean;
begin
  Result := FImprimiuNotaFiscal;
end;

procedure TVenda.SetImprimiuNotaFiscal(const AImprimiuNotaFiscal: Tboolean);
begin
  FImprimiuNotaFiscal := AImprimiuNotaFiscal;
end;

function TVenda.GetStatusXMLNota: TStatusXmlNotaPDV;
begin
  Result := FStatusXMLNota;
end;

procedure TVenda.SetStatusXMLNota(const AStatusXMLNota: TStatusXmlNotaPDV);
begin
  FStatusXMLNota := AStatusXMLNota;
end;


end.
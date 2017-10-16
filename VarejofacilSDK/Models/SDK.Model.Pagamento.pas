unit SDK.Model.Pagamento;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IPagamento = interface(IModel)
    ['{9E2D6016-FC83-4EED-BD9B-2FE38544E70A}']
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
    function GetDataHoraAberturaPagamento: TDateTime;
    procedure SetDataHoraAberturaPagamento(const ADataHoraAberturaPagamento: TDateTime);
    function GetDataHoraFechamentoPagamento: TDateTime;
    procedure SetDataHoraFechamentoPagamento(const ADataHoraFechamentoPagamento: TDateTime);
    function GetFuncionarioId: Integer;
    procedure SetFuncionarioId(const AFuncionarioId: Integer);
    function GetAutorizadorId: Integer;
    procedure SetAutorizadorId(const AAutorizadorId: Integer);
    function GetCodigoImpressora: TString;
    procedure SetCodigoImpressora(const ACodigoImpressora: TString);
    function GetContadorDocumento: TString;
    procedure SetContadorDocumento(const AContadorDocumento: TString);
    function GetCoo: Integer;
    procedure SetCoo(const ACoo: Integer);
    function GetNumeroEquipamento: TString;
    procedure SetNumeroEquipamento(const ANumeroEquipamento: TString);
    function GetSequencialOperador: TString;
    procedure SetSequencialOperador(const ASequencialOperador: TString);
    function GetSerieEquipamento: TString;
    procedure SetSerieEquipamento(const ASerieEquipamento: TString);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
    property Id: TString read GetId write SetId;
    property Sequencial: TString read GetSequencial write SetSequencial;
    property NumeroCaixa: TString read GetNumeroCaixa write SetNumeroCaixa;
    property Data: TDateTime read GetData write SetData;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property DataHoraAberturaPagamento: TDateTime read GetDataHoraAberturaPagamento write SetDataHoraAberturaPagamento;
    property DataHoraFechamentoPagamento: TDateTime read GetDataHoraFechamentoPagamento write SetDataHoraFechamentoPagamento;
    property FuncionarioId: Integer read GetFuncionarioId write SetFuncionarioId;
    property AutorizadorId: Integer read GetAutorizadorId write SetAutorizadorId;
    property CodigoImpressora: TString read GetCodigoImpressora write SetCodigoImpressora;
    property ContadorDocumento: TString read GetContadorDocumento write SetContadorDocumento;
    property Coo: Integer read GetCoo write SetCoo;
    property NumeroEquipamento: TString read GetNumeroEquipamento write SetNumeroEquipamento;
    property SequencialOperador: TString read GetSequencialOperador write SetSequencialOperador;
    property SerieEquipamento: TString read GetSerieEquipamento write SetSerieEquipamento;
    property Valor: Double read GetValor write SetValor;
  end;

  TPagamentoList = class;

  IPagamentoList = interface
	['{DE0D5D58-CFF5-4616-8A2D-B91CF77BD491}']
    function GetReference: TPagamentoList;
    function GetItems(AIndex: Integer): IPagamento;
    procedure SetItems(AIndex: Integer; const Value: IPagamento);
    procedure Add(const APagamento: IPagamento);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IPagamento read GetItems write SetItems; default;
  end;

  TPagamentoListEnumerator = class
  private
    FIndex: Integer;
    FPagamentoList: TPagamentoList;
  public
    constructor Create(APagamentoList: TPagamentoList);
    function GetCurrent: IPagamento; inline;
    function MoveNext: Boolean;
    property Current: IPagamento read GetCurrent;
  end;

  TPagamentoList = class(TInterfacedObject, IPagamentoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IPagamento;
    procedure SetItems(AIndex: Integer; const Value: IPagamento);
  public
    constructor Create;
    procedure Add(const APagamento: IPagamento);
    destructor Destroy; override;
    function GetEnumerator: TPagamentoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TPagamentoList;
    property Items[AIndex: Integer]: IPagamento read GetItems write SetItems; default;
  end;

  TPagamentoListRec = record
  private
    FList: IPagamentoList;
  public
    class function Create(const AList: IPagamentoList): TPagamentoListRec; static;
    class operator Implicit(AListRec: TPagamentoListRec): TPagamentoList;
  end;

  TPagamento = class(TInterfacedModel, IPagamento)
  private
	FId: TString;
	FSequencial: TString;
	FNumeroCaixa: TString;
	FData: TDateTime;
	FLojaId: Int64;
	FDataHoraAberturaPagamento: TDateTime;
	FDataHoraFechamentoPagamento: TDateTime;
	FFuncionarioId: Integer;
	FAutorizadorId: Integer;
	FCodigoImpressora: TString;
	FContadorDocumento: TString;
	FCoo: Integer;
	FNumeroEquipamento: TString;
	FSequencialOperador: TString;
	FSerieEquipamento: TString;
	FValor: Double;
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
    function GetDataHoraAberturaPagamento: TDateTime;
    procedure SetDataHoraAberturaPagamento(const ADataHoraAberturaPagamento: TDateTime);
    function GetDataHoraFechamentoPagamento: TDateTime;
    procedure SetDataHoraFechamentoPagamento(const ADataHoraFechamentoPagamento: TDateTime);
    function GetFuncionarioId: Integer;
    procedure SetFuncionarioId(const AFuncionarioId: Integer);
    function GetAutorizadorId: Integer;
    procedure SetAutorizadorId(const AAutorizadorId: Integer);
    function GetCodigoImpressora: TString;
    procedure SetCodigoImpressora(const ACodigoImpressora: TString);
    function GetContadorDocumento: TString;
    procedure SetContadorDocumento(const AContadorDocumento: TString);
    function GetCoo: Integer;
    procedure SetCoo(const ACoo: Integer);
    function GetNumeroEquipamento: TString;
    procedure SetNumeroEquipamento(const ANumeroEquipamento: TString);
    function GetSequencialOperador: TString;
    procedure SetSequencialOperador(const ASequencialOperador: TString);
    function GetSerieEquipamento: TString;
    procedure SetSerieEquipamento(const ASerieEquipamento: TString);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
  public
    property Id: TString read GetId write SetId;
    property Sequencial: TString read GetSequencial write SetSequencial;
    property NumeroCaixa: TString read GetNumeroCaixa write SetNumeroCaixa;
    property Data: TDateTime read GetData write SetData;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property DataHoraAberturaPagamento: TDateTime read GetDataHoraAberturaPagamento write SetDataHoraAberturaPagamento;
    property DataHoraFechamentoPagamento: TDateTime read GetDataHoraFechamentoPagamento write SetDataHoraFechamentoPagamento;
    property FuncionarioId: Integer read GetFuncionarioId write SetFuncionarioId;
    property AutorizadorId: Integer read GetAutorizadorId write SetAutorizadorId;
    property CodigoImpressora: TString read GetCodigoImpressora write SetCodigoImpressora;
    property ContadorDocumento: TString read GetContadorDocumento write SetContadorDocumento;
    property Coo: Integer read GetCoo write SetCoo;
    property NumeroEquipamento: TString read GetNumeroEquipamento write SetNumeroEquipamento;
    property SequencialOperador: TString read GetSequencialOperador write SetSequencialOperador;
    property SerieEquipamento: TString read GetSerieEquipamento write SetSerieEquipamento;
    property Valor: Double read GetValor write SetValor;
  end;

implementation

{ TPagamentoList }

procedure TPagamentoList.Add(const APagamento: IPagamento);
begin
  FList.Add(APagamento);
end;

procedure TPagamentoList.Clear;
begin
  FList.Clear;
end;

function TPagamentoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TPagamentoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TPagamentoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TPagamentoList.GetEnumerator: TPagamentoListEnumerator;
begin
  Result := TPagamentoListEnumerator.Create(Self);
end;

function TPagamentoList.GetItems(AIndex: Integer): IPagamento;
begin
  Result := FList[AIndex] as IPagamento;
end;

function TPagamentoList.GetReference: TPagamentoList;
begin
  Result := Self;
end;

procedure TPagamentoList.SetItems(AIndex: Integer; const Value: IPagamento);
begin
  FList[AIndex] := Value;
end;

{ TPagamentoListEnumerator }

constructor TPagamentoListEnumerator.Create(APagamentoList: TPagamentoList);
begin
  inherited Create;
  FIndex := -1;
  FPagamentoList := APagamentoList;
end;

function TPagamentoListEnumerator.GetCurrent: IPagamento;
begin
  Result := FPagamentoList[FIndex];
end;

function TPagamentoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FPagamentoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TPagamentoListRec }

class function TPagamentoListRec.Create(const AList: IPagamentoList): TPagamentoListRec;
begin
  FillChar(Result, SizeOf(TPagamentoListRec), 0);
  Result.FList := AList;
end;

class operator TPagamentoListRec.Implicit(AListRec: TPagamentoListRec): TPagamentoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TPagamento }

function TPagamento.GetId: TString;
begin
  Result := FId;
end;

procedure TPagamento.SetId(const AId: TString);
begin
  FId := AId;
end;

function TPagamento.GetSequencial: TString;
begin
  Result := FSequencial;
end;

procedure TPagamento.SetSequencial(const ASequencial: TString);
begin
  FSequencial := ASequencial;
end;

function TPagamento.GetNumeroCaixa: TString;
begin
  Result := FNumeroCaixa;
end;

procedure TPagamento.SetNumeroCaixa(const ANumeroCaixa: TString);
begin
  FNumeroCaixa := ANumeroCaixa;
end;

function TPagamento.GetData: TDateTime;
begin
  Result := FData;
end;

procedure TPagamento.SetData(const AData: TDateTime);
begin
  FData := AData;
end;

function TPagamento.GetLojaId: Int64;
begin
  Result := FLojaId;
end;

procedure TPagamento.SetLojaId(const ALojaId: Int64);
begin
  FLojaId := ALojaId;
end;

function TPagamento.GetDataHoraAberturaPagamento: TDateTime;
begin
  Result := FDataHoraAberturaPagamento;
end;

procedure TPagamento.SetDataHoraAberturaPagamento(const ADataHoraAberturaPagamento: TDateTime);
begin
  FDataHoraAberturaPagamento := ADataHoraAberturaPagamento;
end;

function TPagamento.GetDataHoraFechamentoPagamento: TDateTime;
begin
  Result := FDataHoraFechamentoPagamento;
end;

procedure TPagamento.SetDataHoraFechamentoPagamento(const ADataHoraFechamentoPagamento: TDateTime);
begin
  FDataHoraFechamentoPagamento := ADataHoraFechamentoPagamento;
end;

function TPagamento.GetFuncionarioId: Integer;
begin
  Result := FFuncionarioId;
end;

procedure TPagamento.SetFuncionarioId(const AFuncionarioId: Integer);
begin
  FFuncionarioId := AFuncionarioId;
end;

function TPagamento.GetAutorizadorId: Integer;
begin
  Result := FAutorizadorId;
end;

procedure TPagamento.SetAutorizadorId(const AAutorizadorId: Integer);
begin
  FAutorizadorId := AAutorizadorId;
end;

function TPagamento.GetCodigoImpressora: TString;
begin
  Result := FCodigoImpressora;
end;

procedure TPagamento.SetCodigoImpressora(const ACodigoImpressora: TString);
begin
  FCodigoImpressora := ACodigoImpressora;
end;

function TPagamento.GetContadorDocumento: TString;
begin
  Result := FContadorDocumento;
end;

procedure TPagamento.SetContadorDocumento(const AContadorDocumento: TString);
begin
  FContadorDocumento := AContadorDocumento;
end;

function TPagamento.GetCoo: Integer;
begin
  Result := FCoo;
end;

procedure TPagamento.SetCoo(const ACoo: Integer);
begin
  FCoo := ACoo;
end;

function TPagamento.GetNumeroEquipamento: TString;
begin
  Result := FNumeroEquipamento;
end;

procedure TPagamento.SetNumeroEquipamento(const ANumeroEquipamento: TString);
begin
  FNumeroEquipamento := ANumeroEquipamento;
end;

function TPagamento.GetSequencialOperador: TString;
begin
  Result := FSequencialOperador;
end;

procedure TPagamento.SetSequencialOperador(const ASequencialOperador: TString);
begin
  FSequencialOperador := ASequencialOperador;
end;

function TPagamento.GetSerieEquipamento: TString;
begin
  Result := FSerieEquipamento;
end;

procedure TPagamento.SetSerieEquipamento(const ASerieEquipamento: TString);
begin
  FSerieEquipamento := ASerieEquipamento;
end;

function TPagamento.GetValor: Double;
begin
  Result := FValor;
end;

procedure TPagamento.SetValor(const AValor: Double);
begin
  FValor := AValor;
end;


end.
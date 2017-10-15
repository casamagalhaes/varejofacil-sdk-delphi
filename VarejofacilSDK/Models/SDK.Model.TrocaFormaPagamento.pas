unit SDK.Model.TrocaFormaPagamento;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ITrocaFormaPagamento = interface(IModel)
    ['{BFD3A72B-7CD6-4068-B3AD-E249A6E77DF7}']
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
    function GetDataHoraAbertura: TDateTime;
    procedure SetDataHoraAbertura(const ADataHoraAbertura: TDateTime);
    function GetDataHoraFechamento: TDateTime;
    procedure SetDataHoraFechamento(const ADataHoraFechamento: TDateTime);
    function GetCoo: Integer;
    procedure SetCoo(const ACoo: Integer);
    function GetNumeroEquipamento: TString;
    procedure SetNumeroEquipamento(const ANumeroEquipamento: TString);
    function GetFuncionarioId: Integer;
    procedure SetFuncionarioId(const AFuncionarioId: Integer);
    function GetCodigoImpressora: TString;
    procedure SetCodigoImpressora(const ACodigoImpressora: TString);
    function GetSequencialOperador: TString;
    procedure SetSequencialOperador(const ASequencialOperador: TString);
    function GetSerieEquipamento: TString;
    procedure SetSerieEquipamento(const ASerieEquipamento: TString);
    function GetFuncionarioAutorizadorId: Integer;
    procedure SetFuncionarioAutorizadorId(const AFuncionarioAutorizadorId: Integer);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
    property Id: TString read GetId write SetId;
    property Sequencial: TString read GetSequencial write SetSequencial;
    property NumeroCaixa: TString read GetNumeroCaixa write SetNumeroCaixa;
    property Data: TDateTime read GetData write SetData;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property DataHoraAbertura: TDateTime read GetDataHoraAbertura write SetDataHoraAbertura;
    property DataHoraFechamento: TDateTime read GetDataHoraFechamento write SetDataHoraFechamento;
    property Coo: Integer read GetCoo write SetCoo;
    property NumeroEquipamento: TString read GetNumeroEquipamento write SetNumeroEquipamento;
    property FuncionarioId: Integer read GetFuncionarioId write SetFuncionarioId;
    property CodigoImpressora: TString read GetCodigoImpressora write SetCodigoImpressora;
    property SequencialOperador: TString read GetSequencialOperador write SetSequencialOperador;
    property SerieEquipamento: TString read GetSerieEquipamento write SetSerieEquipamento;
    property FuncionarioAutorizadorId: Integer read GetFuncionarioAutorizadorId write SetFuncionarioAutorizadorId;
    property Valor: Double read GetValor write SetValor;
  end;

  TTrocaFormaPagamentoList = class;

  ITrocaFormaPagamentoList = interface
	['{95DC30CE-E13F-4591-8384-0D5E14215F0A}']
    function GetReference: TTrocaFormaPagamentoList;
    function GetItems(AIndex: Integer): ITrocaFormaPagamento;
    procedure SetItems(AIndex: Integer; const Value: ITrocaFormaPagamento);
    procedure Add(const ATrocaFormaPagamento: ITrocaFormaPagamento);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ITrocaFormaPagamento read GetItems write SetItems; default;
  end;

  TTrocaFormaPagamentoListEnumerator = class
  private
    FIndex: Integer;
    FTrocaFormaPagamentoList: TTrocaFormaPagamentoList;
  public
    constructor Create(ATrocaFormaPagamentoList: TTrocaFormaPagamentoList);
    function GetCurrent: ITrocaFormaPagamento; inline;
    function MoveNext: Boolean;
    property Current: ITrocaFormaPagamento read GetCurrent;
  end;

  TTrocaFormaPagamentoList = class(TInterfacedObject, ITrocaFormaPagamentoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ITrocaFormaPagamento;
    procedure SetItems(AIndex: Integer; const Value: ITrocaFormaPagamento);
  public
    constructor Create;
    procedure Add(const ATrocaFormaPagamento: ITrocaFormaPagamento);
    destructor Destroy; override;
    function GetEnumerator: TTrocaFormaPagamentoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TTrocaFormaPagamentoList;
    property Items[AIndex: Integer]: ITrocaFormaPagamento read GetItems write SetItems; default;
  end;

  TTrocaFormaPagamentoListRec = record
  private
    FList: ITrocaFormaPagamentoList;
  public
    class function Create(const AList: ITrocaFormaPagamentoList): TTrocaFormaPagamentoListRec; static;
    class operator Implicit(AListRec: TTrocaFormaPagamentoListRec): TTrocaFormaPagamentoList;
  end;

  TTrocaFormaPagamento = class(TInterfacedObject, ITrocaFormaPagamento)
  private
	FId: TString;
	FSequencial: TString;
	FNumeroCaixa: TString;
	FData: TDateTime;
	FLojaId: Int64;
	FDataHoraAbertura: TDateTime;
	FDataHoraFechamento: TDateTime;
	FCoo: Integer;
	FNumeroEquipamento: TString;
	FFuncionarioId: Integer;
	FCodigoImpressora: TString;
	FSequencialOperador: TString;
	FSerieEquipamento: TString;
	FFuncionarioAutorizadorId: Integer;
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
    function GetDataHoraAbertura: TDateTime;
    procedure SetDataHoraAbertura(const ADataHoraAbertura: TDateTime);
    function GetDataHoraFechamento: TDateTime;
    procedure SetDataHoraFechamento(const ADataHoraFechamento: TDateTime);
    function GetCoo: Integer;
    procedure SetCoo(const ACoo: Integer);
    function GetNumeroEquipamento: TString;
    procedure SetNumeroEquipamento(const ANumeroEquipamento: TString);
    function GetFuncionarioId: Integer;
    procedure SetFuncionarioId(const AFuncionarioId: Integer);
    function GetCodigoImpressora: TString;
    procedure SetCodigoImpressora(const ACodigoImpressora: TString);
    function GetSequencialOperador: TString;
    procedure SetSequencialOperador(const ASequencialOperador: TString);
    function GetSerieEquipamento: TString;
    procedure SetSerieEquipamento(const ASerieEquipamento: TString);
    function GetFuncionarioAutorizadorId: Integer;
    procedure SetFuncionarioAutorizadorId(const AFuncionarioAutorizadorId: Integer);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
  public
    property Id: TString read GetId write SetId;
    property Sequencial: TString read GetSequencial write SetSequencial;
    property NumeroCaixa: TString read GetNumeroCaixa write SetNumeroCaixa;
    property Data: TDateTime read GetData write SetData;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property DataHoraAbertura: TDateTime read GetDataHoraAbertura write SetDataHoraAbertura;
    property DataHoraFechamento: TDateTime read GetDataHoraFechamento write SetDataHoraFechamento;
    property Coo: Integer read GetCoo write SetCoo;
    property NumeroEquipamento: TString read GetNumeroEquipamento write SetNumeroEquipamento;
    property FuncionarioId: Integer read GetFuncionarioId write SetFuncionarioId;
    property CodigoImpressora: TString read GetCodigoImpressora write SetCodigoImpressora;
    property SequencialOperador: TString read GetSequencialOperador write SetSequencialOperador;
    property SerieEquipamento: TString read GetSerieEquipamento write SetSerieEquipamento;
    property FuncionarioAutorizadorId: Integer read GetFuncionarioAutorizadorId write SetFuncionarioAutorizadorId;
    property Valor: Double read GetValor write SetValor;
  end;

implementation

{ TTrocaFormaPagamentoList }

procedure TTrocaFormaPagamentoList.Add(const ATrocaFormaPagamento: ITrocaFormaPagamento);
begin
  FList.Add(ATrocaFormaPagamento);
end;

procedure TTrocaFormaPagamentoList.Clear;
begin
  FList.Clear;
end;

function TTrocaFormaPagamentoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TTrocaFormaPagamentoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TTrocaFormaPagamentoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TTrocaFormaPagamentoList.GetEnumerator: TTrocaFormaPagamentoListEnumerator;
begin
  Result := TTrocaFormaPagamentoListEnumerator.Create(Self);
end;

function TTrocaFormaPagamentoList.GetItems(AIndex: Integer): ITrocaFormaPagamento;
begin
  Result := FList[AIndex] as ITrocaFormaPagamento;
end;

function TTrocaFormaPagamentoList.GetReference: TTrocaFormaPagamentoList;
begin
  Result := Self;
end;

procedure TTrocaFormaPagamentoList.SetItems(AIndex: Integer; const Value: ITrocaFormaPagamento);
begin
  FList[AIndex] := Value;
end;

{ TTrocaFormaPagamentoListEnumerator }

constructor TTrocaFormaPagamentoListEnumerator.Create(ATrocaFormaPagamentoList: TTrocaFormaPagamentoList);
begin
  inherited Create;
  FIndex := -1;
  FTrocaFormaPagamentoList := ATrocaFormaPagamentoList;
end;

function TTrocaFormaPagamentoListEnumerator.GetCurrent: ITrocaFormaPagamento;
begin
  Result := FTrocaFormaPagamentoList[FIndex];
end;

function TTrocaFormaPagamentoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FTrocaFormaPagamentoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TTrocaFormaPagamentoListRec }

class function TTrocaFormaPagamentoListRec.Create(const AList: ITrocaFormaPagamentoList): TTrocaFormaPagamentoListRec;
begin
  FillChar(Result, SizeOf(TTrocaFormaPagamentoListRec), 0);
  Result.FList := AList;
end;

class operator TTrocaFormaPagamentoListRec.Implicit(AListRec: TTrocaFormaPagamentoListRec): TTrocaFormaPagamentoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TTrocaFormaPagamento }

function TTrocaFormaPagamento.GetId: TString;
begin
  Result := FId;
end;

procedure TTrocaFormaPagamento.SetId(const AId: TString);
begin
  FId := AId;
end;

function TTrocaFormaPagamento.GetSequencial: TString;
begin
  Result := FSequencial;
end;

procedure TTrocaFormaPagamento.SetSequencial(const ASequencial: TString);
begin
  FSequencial := ASequencial;
end;

function TTrocaFormaPagamento.GetNumeroCaixa: TString;
begin
  Result := FNumeroCaixa;
end;

procedure TTrocaFormaPagamento.SetNumeroCaixa(const ANumeroCaixa: TString);
begin
  FNumeroCaixa := ANumeroCaixa;
end;

function TTrocaFormaPagamento.GetData: TDateTime;
begin
  Result := FData;
end;

procedure TTrocaFormaPagamento.SetData(const AData: TDateTime);
begin
  FData := AData;
end;

function TTrocaFormaPagamento.GetLojaId: Int64;
begin
  Result := FLojaId;
end;

procedure TTrocaFormaPagamento.SetLojaId(const ALojaId: Int64);
begin
  FLojaId := ALojaId;
end;

function TTrocaFormaPagamento.GetDataHoraAbertura: TDateTime;
begin
  Result := FDataHoraAbertura;
end;

procedure TTrocaFormaPagamento.SetDataHoraAbertura(const ADataHoraAbertura: TDateTime);
begin
  FDataHoraAbertura := ADataHoraAbertura;
end;

function TTrocaFormaPagamento.GetDataHoraFechamento: TDateTime;
begin
  Result := FDataHoraFechamento;
end;

procedure TTrocaFormaPagamento.SetDataHoraFechamento(const ADataHoraFechamento: TDateTime);
begin
  FDataHoraFechamento := ADataHoraFechamento;
end;

function TTrocaFormaPagamento.GetCoo: Integer;
begin
  Result := FCoo;
end;

procedure TTrocaFormaPagamento.SetCoo(const ACoo: Integer);
begin
  FCoo := ACoo;
end;

function TTrocaFormaPagamento.GetNumeroEquipamento: TString;
begin
  Result := FNumeroEquipamento;
end;

procedure TTrocaFormaPagamento.SetNumeroEquipamento(const ANumeroEquipamento: TString);
begin
  FNumeroEquipamento := ANumeroEquipamento;
end;

function TTrocaFormaPagamento.GetFuncionarioId: Integer;
begin
  Result := FFuncionarioId;
end;

procedure TTrocaFormaPagamento.SetFuncionarioId(const AFuncionarioId: Integer);
begin
  FFuncionarioId := AFuncionarioId;
end;

function TTrocaFormaPagamento.GetCodigoImpressora: TString;
begin
  Result := FCodigoImpressora;
end;

procedure TTrocaFormaPagamento.SetCodigoImpressora(const ACodigoImpressora: TString);
begin
  FCodigoImpressora := ACodigoImpressora;
end;

function TTrocaFormaPagamento.GetSequencialOperador: TString;
begin
  Result := FSequencialOperador;
end;

procedure TTrocaFormaPagamento.SetSequencialOperador(const ASequencialOperador: TString);
begin
  FSequencialOperador := ASequencialOperador;
end;

function TTrocaFormaPagamento.GetSerieEquipamento: TString;
begin
  Result := FSerieEquipamento;
end;

procedure TTrocaFormaPagamento.SetSerieEquipamento(const ASerieEquipamento: TString);
begin
  FSerieEquipamento := ASerieEquipamento;
end;

function TTrocaFormaPagamento.GetFuncionarioAutorizadorId: Integer;
begin
  Result := FFuncionarioAutorizadorId;
end;

procedure TTrocaFormaPagamento.SetFuncionarioAutorizadorId(const AFuncionarioAutorizadorId: Integer);
begin
  FFuncionarioAutorizadorId := AFuncionarioAutorizadorId;
end;

function TTrocaFormaPagamento.GetValor: Double;
begin
  Result := FValor;
end;

procedure TTrocaFormaPagamento.SetValor(const AValor: Double);
begin
  FValor := AValor;
end;


end.
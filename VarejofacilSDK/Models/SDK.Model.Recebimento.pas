unit SDK.Model.Recebimento;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IRecebimento = interface(IModel)
    ['{E41B6CAF-DCCF-43C3-B196-F00E69F09178}']
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
    function GetDataHoraAberturaRecebimento: TDateTime;
    procedure SetDataHoraAberturaRecebimento(const ADataHoraAberturaRecebimento: TDateTime);
    function GetDataHoraFechamentoRecebimento: TDateTime;
    procedure SetDataHoraFechamentoRecebimento(const ADataHoraFechamentoRecebimento: TDateTime);
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
    property DataHoraAberturaRecebimento: TDateTime read GetDataHoraAberturaRecebimento write SetDataHoraAberturaRecebimento;
    property DataHoraFechamentoRecebimento: TDateTime read GetDataHoraFechamentoRecebimento write SetDataHoraFechamentoRecebimento;
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

  TRecebimentoList = class;

  IRecebimentoList = interface
	['{DBF96850-5EDD-45CB-87BA-B93D536EFCE3}']
    function GetReference: TRecebimentoList;
    function GetItems(AIndex: Integer): IRecebimento;
    procedure SetItems(AIndex: Integer; const Value: IRecebimento);
    procedure Add(const ARecebimento: IRecebimento);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IRecebimento read GetItems write SetItems; default;
  end;

  TRecebimentoListEnumerator = class
  private
    FIndex: Integer;
    FRecebimentoList: TRecebimentoList;
  public
    constructor Create(ARecebimentoList: TRecebimentoList);
    function GetCurrent: IRecebimento; inline;
    function MoveNext: Boolean;
    property Current: IRecebimento read GetCurrent;
  end;

  TRecebimentoList = class(TInterfacedObject, IRecebimentoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IRecebimento;
    procedure SetItems(AIndex: Integer; const Value: IRecebimento);
  public
    constructor Create;
    procedure Add(const ARecebimento: IRecebimento);
    destructor Destroy; override;
    function GetEnumerator: TRecebimentoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TRecebimentoList;
    property Items[AIndex: Integer]: IRecebimento read GetItems write SetItems; default;
  end;

  TRecebimentoListRec = record
  private
    FList: IRecebimentoList;
  public
    class function Create(const AList: IRecebimentoList): TRecebimentoListRec; static;
    class operator Implicit(AListRec: TRecebimentoListRec): TRecebimentoList;
  end;

  TRecebimento = class(TInterfacedModel, IRecebimento)
  private
	FId: TString;
	FSequencial: TString;
	FNumeroCaixa: TString;
	FData: TDateTime;
	FLojaId: Int64;
	FDataHoraAberturaRecebimento: TDateTime;
	FDataHoraFechamentoRecebimento: TDateTime;
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
    function GetDataHoraAberturaRecebimento: TDateTime;
    procedure SetDataHoraAberturaRecebimento(const ADataHoraAberturaRecebimento: TDateTime);
    function GetDataHoraFechamentoRecebimento: TDateTime;
    procedure SetDataHoraFechamentoRecebimento(const ADataHoraFechamentoRecebimento: TDateTime);
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
    property DataHoraAberturaRecebimento: TDateTime read GetDataHoraAberturaRecebimento write SetDataHoraAberturaRecebimento;
    property DataHoraFechamentoRecebimento: TDateTime read GetDataHoraFechamentoRecebimento write SetDataHoraFechamentoRecebimento;
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

{ TRecebimentoList }

procedure TRecebimentoList.Add(const ARecebimento: IRecebimento);
begin
  FList.Add(ARecebimento);
end;

procedure TRecebimentoList.Clear;
begin
  FList.Clear;
end;

function TRecebimentoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TRecebimentoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TRecebimentoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TRecebimentoList.GetEnumerator: TRecebimentoListEnumerator;
begin
  Result := TRecebimentoListEnumerator.Create(Self);
end;

function TRecebimentoList.GetItems(AIndex: Integer): IRecebimento;
begin
  Result := FList[AIndex] as IRecebimento;
end;

function TRecebimentoList.GetReference: TRecebimentoList;
begin
  Result := Self;
end;

procedure TRecebimentoList.SetItems(AIndex: Integer; const Value: IRecebimento);
begin
  FList[AIndex] := Value;
end;

{ TRecebimentoListEnumerator }

constructor TRecebimentoListEnumerator.Create(ARecebimentoList: TRecebimentoList);
begin
  inherited Create;
  FIndex := -1;
  FRecebimentoList := ARecebimentoList;
end;

function TRecebimentoListEnumerator.GetCurrent: IRecebimento;
begin
  Result := FRecebimentoList[FIndex];
end;

function TRecebimentoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FRecebimentoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TRecebimentoListRec }

class function TRecebimentoListRec.Create(const AList: IRecebimentoList): TRecebimentoListRec;
begin
  FillChar(Result, SizeOf(TRecebimentoListRec), 0);
  Result.FList := AList;
end;

class operator TRecebimentoListRec.Implicit(AListRec: TRecebimentoListRec): TRecebimentoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TRecebimento }

function TRecebimento.GetId: TString;
begin
  Result := FId;
end;

procedure TRecebimento.SetId(const AId: TString);
begin
  FId := AId;
end;

function TRecebimento.GetSequencial: TString;
begin
  Result := FSequencial;
end;

procedure TRecebimento.SetSequencial(const ASequencial: TString);
begin
  FSequencial := ASequencial;
end;

function TRecebimento.GetNumeroCaixa: TString;
begin
  Result := FNumeroCaixa;
end;

procedure TRecebimento.SetNumeroCaixa(const ANumeroCaixa: TString);
begin
  FNumeroCaixa := ANumeroCaixa;
end;

function TRecebimento.GetData: TDateTime;
begin
  Result := FData;
end;

procedure TRecebimento.SetData(const AData: TDateTime);
begin
  FData := AData;
end;

function TRecebimento.GetLojaId: Int64;
begin
  Result := FLojaId;
end;

procedure TRecebimento.SetLojaId(const ALojaId: Int64);
begin
  FLojaId := ALojaId;
end;

function TRecebimento.GetDataHoraAberturaRecebimento: TDateTime;
begin
  Result := FDataHoraAberturaRecebimento;
end;

procedure TRecebimento.SetDataHoraAberturaRecebimento(const ADataHoraAberturaRecebimento: TDateTime);
begin
  FDataHoraAberturaRecebimento := ADataHoraAberturaRecebimento;
end;

function TRecebimento.GetDataHoraFechamentoRecebimento: TDateTime;
begin
  Result := FDataHoraFechamentoRecebimento;
end;

procedure TRecebimento.SetDataHoraFechamentoRecebimento(const ADataHoraFechamentoRecebimento: TDateTime);
begin
  FDataHoraFechamentoRecebimento := ADataHoraFechamentoRecebimento;
end;

function TRecebimento.GetFuncionarioId: Integer;
begin
  Result := FFuncionarioId;
end;

procedure TRecebimento.SetFuncionarioId(const AFuncionarioId: Integer);
begin
  FFuncionarioId := AFuncionarioId;
end;

function TRecebimento.GetAutorizadorId: Integer;
begin
  Result := FAutorizadorId;
end;

procedure TRecebimento.SetAutorizadorId(const AAutorizadorId: Integer);
begin
  FAutorizadorId := AAutorizadorId;
end;

function TRecebimento.GetCodigoImpressora: TString;
begin
  Result := FCodigoImpressora;
end;

procedure TRecebimento.SetCodigoImpressora(const ACodigoImpressora: TString);
begin
  FCodigoImpressora := ACodigoImpressora;
end;

function TRecebimento.GetContadorDocumento: TString;
begin
  Result := FContadorDocumento;
end;

procedure TRecebimento.SetContadorDocumento(const AContadorDocumento: TString);
begin
  FContadorDocumento := AContadorDocumento;
end;

function TRecebimento.GetCoo: Integer;
begin
  Result := FCoo;
end;

procedure TRecebimento.SetCoo(const ACoo: Integer);
begin
  FCoo := ACoo;
end;

function TRecebimento.GetNumeroEquipamento: TString;
begin
  Result := FNumeroEquipamento;
end;

procedure TRecebimento.SetNumeroEquipamento(const ANumeroEquipamento: TString);
begin
  FNumeroEquipamento := ANumeroEquipamento;
end;

function TRecebimento.GetSequencialOperador: TString;
begin
  Result := FSequencialOperador;
end;

procedure TRecebimento.SetSequencialOperador(const ASequencialOperador: TString);
begin
  FSequencialOperador := ASequencialOperador;
end;

function TRecebimento.GetSerieEquipamento: TString;
begin
  Result := FSerieEquipamento;
end;

procedure TRecebimento.SetSerieEquipamento(const ASerieEquipamento: TString);
begin
  FSerieEquipamento := ASerieEquipamento;
end;

function TRecebimento.GetValor: Double;
begin
  Result := FValor;
end;

procedure TRecebimento.SetValor(const AValor: Double);
begin
  FValor := AValor;
end;


end.
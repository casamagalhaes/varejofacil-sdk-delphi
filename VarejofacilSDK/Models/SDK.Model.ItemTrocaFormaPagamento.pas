unit SDK.Model.ItemTrocaFormaPagamento;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IItemTrocaFormaPagamento = interface(IModel)
    ['{13AEEF46-ED9B-4ECB-9E5C-27B374E6F76C}']
    function GetSequencialVenda: TString;
    procedure SetSequencialVenda(const ASequencialVenda: TString);
    function GetNumeroCaixaVenda: TString;
    procedure SetNumeroCaixaVenda(const ANumeroCaixaVenda: TString);
    function GetDataVenda: TDateTime;
    procedure SetDataVenda(const ADataVenda: TDateTime);
    function GetSequencialFinalizacaoVenda: TString;
    procedure SetSequencialFinalizacaoVenda(const ASequencialFinalizacaoVenda: TString);
    function GetSequencialECFTrocaCOO: Integer;
    procedure SetSequencialECFTrocaCOO(const ASequencialECFTrocaCOO: Integer);
    function GetFinalizadoraOrigemId: TString;
    procedure SetFinalizadoraOrigemId(const AFinalizadoraOrigemId: TString);
    function GetFinalizadoraDestinoId: TString;
    procedure SetFinalizadoraDestinoId(const AFinalizadoraDestinoId: TString);
    function GetSolicitaPlanoPagamento: Boolean;
    procedure SetSolicitaPlanoPagamento(const ASolicitaPlanoPagamento: Boolean);
    function GetGeraContaReceber: Boolean;
    procedure SetGeraContaReceber(const AGeraContaReceber: Boolean);
    function GetNumeroECFTroca: TString;
    procedure SetNumeroECFTroca(const ANumeroECFTroca: TString);
    function GetDefineValorContraValeOuTroco: TString;
    procedure SetDefineValorContraValeOuTroco(const ADefineValorContraValeOuTroco: TString);
    function GetFuncaoTrocaId: TString;
    procedure SetFuncaoTrocaId(const AFuncaoTrocaId: TString);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
    function GetValorContraValeTroco: Double;
    procedure SetValorContraValeTroco(const AValorContraValeTroco: Double);
    property SequencialVenda: TString read GetSequencialVenda write SetSequencialVenda;
    property NumeroCaixaVenda: TString read GetNumeroCaixaVenda write SetNumeroCaixaVenda;
    property DataVenda: TDateTime read GetDataVenda write SetDataVenda;
    property SequencialFinalizacaoVenda: TString read GetSequencialFinalizacaoVenda write SetSequencialFinalizacaoVenda;
    property SequencialECFTrocaCOO: Integer read GetSequencialECFTrocaCOO write SetSequencialECFTrocaCOO;
    property FinalizadoraOrigemId: TString read GetFinalizadoraOrigemId write SetFinalizadoraOrigemId;
    property FinalizadoraDestinoId: TString read GetFinalizadoraDestinoId write SetFinalizadoraDestinoId;
    property SolicitaPlanoPagamento: Boolean read GetSolicitaPlanoPagamento write SetSolicitaPlanoPagamento;
    property GeraContaReceber: Boolean read GetGeraContaReceber write SetGeraContaReceber;
    property NumeroECFTroca: TString read GetNumeroECFTroca write SetNumeroECFTroca;
    property DefineValorContraValeOuTroco: TString read GetDefineValorContraValeOuTroco write SetDefineValorContraValeOuTroco;
    property FuncaoTrocaId: TString read GetFuncaoTrocaId write SetFuncaoTrocaId;
    property Valor: Double read GetValor write SetValor;
    property ValorContraValeTroco: Double read GetValorContraValeTroco write SetValorContraValeTroco;
  end;

  TItemTrocaFormaPagamentoList = class;

  IItemTrocaFormaPagamentoList = interface
	['{18E6E35B-B8CD-435A-ABAF-E1124EF30B89}']
    function GetReference: TItemTrocaFormaPagamentoList;
    function GetItems(AIndex: Integer): IItemTrocaFormaPagamento;
    procedure SetItems(AIndex: Integer; const Value: IItemTrocaFormaPagamento);
    procedure Add(const AItemTrocaFormaPagamento: IItemTrocaFormaPagamento);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IItemTrocaFormaPagamento read GetItems write SetItems; default;
  end;

  TItemTrocaFormaPagamentoListEnumerator = class
  private
    FIndex: Integer;
    FItemTrocaFormaPagamentoList: TItemTrocaFormaPagamentoList;
  public
    constructor Create(AItemTrocaFormaPagamentoList: TItemTrocaFormaPagamentoList);
    function GetCurrent: IItemTrocaFormaPagamento; inline;
    function MoveNext: Boolean;
    property Current: IItemTrocaFormaPagamento read GetCurrent;
  end;

  TItemTrocaFormaPagamentoList = class(TInterfacedObject, IItemTrocaFormaPagamentoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IItemTrocaFormaPagamento;
    procedure SetItems(AIndex: Integer; const Value: IItemTrocaFormaPagamento);
  public
    constructor Create;
    procedure Add(const AItemTrocaFormaPagamento: IItemTrocaFormaPagamento);
    destructor Destroy; override;
    function GetEnumerator: TItemTrocaFormaPagamentoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TItemTrocaFormaPagamentoList;
    property Items[AIndex: Integer]: IItemTrocaFormaPagamento read GetItems write SetItems; default;
  end;

  TItemTrocaFormaPagamentoListRec = record
  private
    FList: IItemTrocaFormaPagamentoList;
  public
    class function Create(const AList: IItemTrocaFormaPagamentoList): TItemTrocaFormaPagamentoListRec; static;
    class operator Implicit(AListRec: TItemTrocaFormaPagamentoListRec): TItemTrocaFormaPagamentoList;
  end;

  TItemTrocaFormaPagamento = class(TInterfacedModel, IItemTrocaFormaPagamento)
  private
	FSequencialVenda: TString;
	FNumeroCaixaVenda: TString;
	FDataVenda: TDateTime;
	FSequencialFinalizacaoVenda: TString;
	FSequencialECFTrocaCOO: Integer;
	FFinalizadoraOrigemId: TString;
	FFinalizadoraDestinoId: TString;
	FSolicitaPlanoPagamento: Boolean;
	FGeraContaReceber: Boolean;
	FNumeroECFTroca: TString;
	FDefineValorContraValeOuTroco: TString;
	FFuncaoTrocaId: TString;
	FValor: Double;
	FValorContraValeTroco: Double;
    function GetSequencialVenda: TString;
    procedure SetSequencialVenda(const ASequencialVenda: TString);
    function GetNumeroCaixaVenda: TString;
    procedure SetNumeroCaixaVenda(const ANumeroCaixaVenda: TString);
    function GetDataVenda: TDateTime;
    procedure SetDataVenda(const ADataVenda: TDateTime);
    function GetSequencialFinalizacaoVenda: TString;
    procedure SetSequencialFinalizacaoVenda(const ASequencialFinalizacaoVenda: TString);
    function GetSequencialECFTrocaCOO: Integer;
    procedure SetSequencialECFTrocaCOO(const ASequencialECFTrocaCOO: Integer);
    function GetFinalizadoraOrigemId: TString;
    procedure SetFinalizadoraOrigemId(const AFinalizadoraOrigemId: TString);
    function GetFinalizadoraDestinoId: TString;
    procedure SetFinalizadoraDestinoId(const AFinalizadoraDestinoId: TString);
    function GetSolicitaPlanoPagamento: Boolean;
    procedure SetSolicitaPlanoPagamento(const ASolicitaPlanoPagamento: Boolean);
    function GetGeraContaReceber: Boolean;
    procedure SetGeraContaReceber(const AGeraContaReceber: Boolean);
    function GetNumeroECFTroca: TString;
    procedure SetNumeroECFTroca(const ANumeroECFTroca: TString);
    function GetDefineValorContraValeOuTroco: TString;
    procedure SetDefineValorContraValeOuTroco(const ADefineValorContraValeOuTroco: TString);
    function GetFuncaoTrocaId: TString;
    procedure SetFuncaoTrocaId(const AFuncaoTrocaId: TString);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
    function GetValorContraValeTroco: Double;
    procedure SetValorContraValeTroco(const AValorContraValeTroco: Double);
  public
    property SequencialVenda: TString read GetSequencialVenda write SetSequencialVenda;
    property NumeroCaixaVenda: TString read GetNumeroCaixaVenda write SetNumeroCaixaVenda;
    property DataVenda: TDateTime read GetDataVenda write SetDataVenda;
    property SequencialFinalizacaoVenda: TString read GetSequencialFinalizacaoVenda write SetSequencialFinalizacaoVenda;
    property SequencialECFTrocaCOO: Integer read GetSequencialECFTrocaCOO write SetSequencialECFTrocaCOO;
    property FinalizadoraOrigemId: TString read GetFinalizadoraOrigemId write SetFinalizadoraOrigemId;
    property FinalizadoraDestinoId: TString read GetFinalizadoraDestinoId write SetFinalizadoraDestinoId;
    property SolicitaPlanoPagamento: Boolean read GetSolicitaPlanoPagamento write SetSolicitaPlanoPagamento;
    property GeraContaReceber: Boolean read GetGeraContaReceber write SetGeraContaReceber;
    property NumeroECFTroca: TString read GetNumeroECFTroca write SetNumeroECFTroca;
    property DefineValorContraValeOuTroco: TString read GetDefineValorContraValeOuTroco write SetDefineValorContraValeOuTroco;
    property FuncaoTrocaId: TString read GetFuncaoTrocaId write SetFuncaoTrocaId;
    property Valor: Double read GetValor write SetValor;
    property ValorContraValeTroco: Double read GetValorContraValeTroco write SetValorContraValeTroco;
  end;

implementation

{ TItemTrocaFormaPagamentoList }

procedure TItemTrocaFormaPagamentoList.Add(const AItemTrocaFormaPagamento: IItemTrocaFormaPagamento);
begin
  FList.Add(AItemTrocaFormaPagamento);
end;

procedure TItemTrocaFormaPagamentoList.Clear;
begin
  FList.Clear;
end;

function TItemTrocaFormaPagamentoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TItemTrocaFormaPagamentoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TItemTrocaFormaPagamentoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TItemTrocaFormaPagamentoList.GetEnumerator: TItemTrocaFormaPagamentoListEnumerator;
begin
  Result := TItemTrocaFormaPagamentoListEnumerator.Create(Self);
end;

function TItemTrocaFormaPagamentoList.GetItems(AIndex: Integer): IItemTrocaFormaPagamento;
begin
  Result := FList[AIndex] as IItemTrocaFormaPagamento;
end;

function TItemTrocaFormaPagamentoList.GetReference: TItemTrocaFormaPagamentoList;
begin
  Result := Self;
end;

procedure TItemTrocaFormaPagamentoList.SetItems(AIndex: Integer; const Value: IItemTrocaFormaPagamento);
begin
  FList[AIndex] := Value;
end;

{ TItemTrocaFormaPagamentoListEnumerator }

constructor TItemTrocaFormaPagamentoListEnumerator.Create(AItemTrocaFormaPagamentoList: TItemTrocaFormaPagamentoList);
begin
  inherited Create;
  FIndex := -1;
  FItemTrocaFormaPagamentoList := AItemTrocaFormaPagamentoList;
end;

function TItemTrocaFormaPagamentoListEnumerator.GetCurrent: IItemTrocaFormaPagamento;
begin
  Result := FItemTrocaFormaPagamentoList[FIndex];
end;

function TItemTrocaFormaPagamentoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FItemTrocaFormaPagamentoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TItemTrocaFormaPagamentoListRec }

class function TItemTrocaFormaPagamentoListRec.Create(const AList: IItemTrocaFormaPagamentoList): TItemTrocaFormaPagamentoListRec;
begin
  FillChar(Result, SizeOf(TItemTrocaFormaPagamentoListRec), 0);
  Result.FList := AList;
end;

class operator TItemTrocaFormaPagamentoListRec.Implicit(AListRec: TItemTrocaFormaPagamentoListRec): TItemTrocaFormaPagamentoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TItemTrocaFormaPagamento }

function TItemTrocaFormaPagamento.GetSequencialVenda: TString;
begin
  Result := FSequencialVenda;
end;

procedure TItemTrocaFormaPagamento.SetSequencialVenda(const ASequencialVenda: TString);
begin
  FSequencialVenda := ASequencialVenda;
end;

function TItemTrocaFormaPagamento.GetNumeroCaixaVenda: TString;
begin
  Result := FNumeroCaixaVenda;
end;

procedure TItemTrocaFormaPagamento.SetNumeroCaixaVenda(const ANumeroCaixaVenda: TString);
begin
  FNumeroCaixaVenda := ANumeroCaixaVenda;
end;

function TItemTrocaFormaPagamento.GetDataVenda: TDateTime;
begin
  Result := FDataVenda;
end;

procedure TItemTrocaFormaPagamento.SetDataVenda(const ADataVenda: TDateTime);
begin
  FDataVenda := ADataVenda;
end;

function TItemTrocaFormaPagamento.GetSequencialFinalizacaoVenda: TString;
begin
  Result := FSequencialFinalizacaoVenda;
end;

procedure TItemTrocaFormaPagamento.SetSequencialFinalizacaoVenda(const ASequencialFinalizacaoVenda: TString);
begin
  FSequencialFinalizacaoVenda := ASequencialFinalizacaoVenda;
end;

function TItemTrocaFormaPagamento.GetSequencialECFTrocaCOO: Integer;
begin
  Result := FSequencialECFTrocaCOO;
end;

procedure TItemTrocaFormaPagamento.SetSequencialECFTrocaCOO(const ASequencialECFTrocaCOO: Integer);
begin
  FSequencialECFTrocaCOO := ASequencialECFTrocaCOO;
end;

function TItemTrocaFormaPagamento.GetFinalizadoraOrigemId: TString;
begin
  Result := FFinalizadoraOrigemId;
end;

procedure TItemTrocaFormaPagamento.SetFinalizadoraOrigemId(const AFinalizadoraOrigemId: TString);
begin
  FFinalizadoraOrigemId := AFinalizadoraOrigemId;
end;

function TItemTrocaFormaPagamento.GetFinalizadoraDestinoId: TString;
begin
  Result := FFinalizadoraDestinoId;
end;

procedure TItemTrocaFormaPagamento.SetFinalizadoraDestinoId(const AFinalizadoraDestinoId: TString);
begin
  FFinalizadoraDestinoId := AFinalizadoraDestinoId;
end;

function TItemTrocaFormaPagamento.GetSolicitaPlanoPagamento: Boolean;
begin
  Result := FSolicitaPlanoPagamento;
end;

procedure TItemTrocaFormaPagamento.SetSolicitaPlanoPagamento(const ASolicitaPlanoPagamento: Boolean);
begin
  FSolicitaPlanoPagamento := ASolicitaPlanoPagamento;
end;

function TItemTrocaFormaPagamento.GetGeraContaReceber: Boolean;
begin
  Result := FGeraContaReceber;
end;

procedure TItemTrocaFormaPagamento.SetGeraContaReceber(const AGeraContaReceber: Boolean);
begin
  FGeraContaReceber := AGeraContaReceber;
end;

function TItemTrocaFormaPagamento.GetNumeroECFTroca: TString;
begin
  Result := FNumeroECFTroca;
end;

procedure TItemTrocaFormaPagamento.SetNumeroECFTroca(const ANumeroECFTroca: TString);
begin
  FNumeroECFTroca := ANumeroECFTroca;
end;

function TItemTrocaFormaPagamento.GetDefineValorContraValeOuTroco: TString;
begin
  Result := FDefineValorContraValeOuTroco;
end;

procedure TItemTrocaFormaPagamento.SetDefineValorContraValeOuTroco(const ADefineValorContraValeOuTroco: TString);
begin
  FDefineValorContraValeOuTroco := ADefineValorContraValeOuTroco;
end;

function TItemTrocaFormaPagamento.GetFuncaoTrocaId: TString;
begin
  Result := FFuncaoTrocaId;
end;

procedure TItemTrocaFormaPagamento.SetFuncaoTrocaId(const AFuncaoTrocaId: TString);
begin
  FFuncaoTrocaId := AFuncaoTrocaId;
end;

function TItemTrocaFormaPagamento.GetValor: Double;
begin
  Result := FValor;
end;

procedure TItemTrocaFormaPagamento.SetValor(const AValor: Double);
begin
  FValor := AValor;
end;

function TItemTrocaFormaPagamento.GetValorContraValeTroco: Double;
begin
  Result := FValorContraValeTroco;
end;

procedure TItemTrocaFormaPagamento.SetValorContraValeTroco(const AValorContraValeTroco: Double);
begin
  FValorContraValeTroco := AValorContraValeTroco;
end;


end.
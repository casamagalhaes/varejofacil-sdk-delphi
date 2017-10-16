unit SDK.Model.ItemPagamento;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IItemPagamento = interface(IModel)
    ['{31A8BBD7-0507-4D36-8505-02EEA8533C87}']
    function GetTipoPagamentoId: Integer;
    procedure SetTipoPagamentoId(const ATipoPagamentoId: Integer);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
    function GetObservacao: TString;
    procedure SetObservacao(const AObservacao: TString);
    function GetCodigoAuxiliar: Integer;
    procedure SetCodigoAuxiliar(const ACodigoAuxiliar: Integer);
    property TipoPagamentoId: Integer read GetTipoPagamentoId write SetTipoPagamentoId;
    property Valor: Double read GetValor write SetValor;
    property Observacao: TString read GetObservacao write SetObservacao;
    property CodigoAuxiliar: Integer read GetCodigoAuxiliar write SetCodigoAuxiliar;
  end;

  TItemPagamentoList = class;

  IItemPagamentoList = interface
	['{63FE2D2C-E1F0-47D6-BFCC-BE30A8741225}']
    function GetReference: TItemPagamentoList;
    function GetItems(AIndex: Integer): IItemPagamento;
    procedure SetItems(AIndex: Integer; const Value: IItemPagamento);
    procedure Add(const AItemPagamento: IItemPagamento);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IItemPagamento read GetItems write SetItems; default;
  end;

  TItemPagamentoListEnumerator = class
  private
    FIndex: Integer;
    FItemPagamentoList: TItemPagamentoList;
  public
    constructor Create(AItemPagamentoList: TItemPagamentoList);
    function GetCurrent: IItemPagamento; inline;
    function MoveNext: Boolean;
    property Current: IItemPagamento read GetCurrent;
  end;

  TItemPagamentoList = class(TInterfacedObject, IItemPagamentoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IItemPagamento;
    procedure SetItems(AIndex: Integer; const Value: IItemPagamento);
  public
    constructor Create;
    procedure Add(const AItemPagamento: IItemPagamento);
    destructor Destroy; override;
    function GetEnumerator: TItemPagamentoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TItemPagamentoList;
    property Items[AIndex: Integer]: IItemPagamento read GetItems write SetItems; default;
  end;

  TItemPagamentoListRec = record
  private
    FList: IItemPagamentoList;
  public
    class function Create(const AList: IItemPagamentoList): TItemPagamentoListRec; static;
    class operator Implicit(AListRec: TItemPagamentoListRec): TItemPagamentoList;
  end;

  TItemPagamento = class(TInterfacedModel, IItemPagamento)
  private
	FTipoPagamentoId: Integer;
	FValor: Double;
	FObservacao: TString;
	FCodigoAuxiliar: Integer;
    function GetTipoPagamentoId: Integer;
    procedure SetTipoPagamentoId(const ATipoPagamentoId: Integer);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
    function GetObservacao: TString;
    procedure SetObservacao(const AObservacao: TString);
    function GetCodigoAuxiliar: Integer;
    procedure SetCodigoAuxiliar(const ACodigoAuxiliar: Integer);
  public
    property TipoPagamentoId: Integer read GetTipoPagamentoId write SetTipoPagamentoId;
    property Valor: Double read GetValor write SetValor;
    property Observacao: TString read GetObservacao write SetObservacao;
    property CodigoAuxiliar: Integer read GetCodigoAuxiliar write SetCodigoAuxiliar;
  end;

implementation

{ TItemPagamentoList }

procedure TItemPagamentoList.Add(const AItemPagamento: IItemPagamento);
begin
  FList.Add(AItemPagamento);
end;

procedure TItemPagamentoList.Clear;
begin
  FList.Clear;
end;

function TItemPagamentoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TItemPagamentoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TItemPagamentoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TItemPagamentoList.GetEnumerator: TItemPagamentoListEnumerator;
begin
  Result := TItemPagamentoListEnumerator.Create(Self);
end;

function TItemPagamentoList.GetItems(AIndex: Integer): IItemPagamento;
begin
  Result := FList[AIndex] as IItemPagamento;
end;

function TItemPagamentoList.GetReference: TItemPagamentoList;
begin
  Result := Self;
end;

procedure TItemPagamentoList.SetItems(AIndex: Integer; const Value: IItemPagamento);
begin
  FList[AIndex] := Value;
end;

{ TItemPagamentoListEnumerator }

constructor TItemPagamentoListEnumerator.Create(AItemPagamentoList: TItemPagamentoList);
begin
  inherited Create;
  FIndex := -1;
  FItemPagamentoList := AItemPagamentoList;
end;

function TItemPagamentoListEnumerator.GetCurrent: IItemPagamento;
begin
  Result := FItemPagamentoList[FIndex];
end;

function TItemPagamentoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FItemPagamentoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TItemPagamentoListRec }

class function TItemPagamentoListRec.Create(const AList: IItemPagamentoList): TItemPagamentoListRec;
begin
  FillChar(Result, SizeOf(TItemPagamentoListRec), 0);
  Result.FList := AList;
end;

class operator TItemPagamentoListRec.Implicit(AListRec: TItemPagamentoListRec): TItemPagamentoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TItemPagamento }

function TItemPagamento.GetTipoPagamentoId: Integer;
begin
  Result := FTipoPagamentoId;
end;

procedure TItemPagamento.SetTipoPagamentoId(const ATipoPagamentoId: Integer);
begin
  FTipoPagamentoId := ATipoPagamentoId;
end;

function TItemPagamento.GetValor: Double;
begin
  Result := FValor;
end;

procedure TItemPagamento.SetValor(const AValor: Double);
begin
  FValor := AValor;
end;

function TItemPagamento.GetObservacao: TString;
begin
  Result := FObservacao;
end;

procedure TItemPagamento.SetObservacao(const AObservacao: TString);
begin
  FObservacao := AObservacao;
end;

function TItemPagamento.GetCodigoAuxiliar: Integer;
begin
  Result := FCodigoAuxiliar;
end;

procedure TItemPagamento.SetCodigoAuxiliar(const ACodigoAuxiliar: Integer);
begin
  FCodigoAuxiliar := ACodigoAuxiliar;
end;


end.
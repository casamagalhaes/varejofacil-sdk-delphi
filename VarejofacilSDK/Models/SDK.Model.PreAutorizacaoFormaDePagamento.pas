unit SDK.Model.PreAutorizacaoFormaDePagamento;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IPreAutorizacaoFormaDePagamento = interface(IModel)
    ['{DF323AEC-24E7-4AC6-A8B7-FE92CD8B0C7C}']
    function GetFinalizadoraId: Integer;
    procedure SetFinalizadoraId(const AFinalizadoraId: Integer);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
    property FinalizadoraId: Integer read GetFinalizadoraId write SetFinalizadoraId;
    property Valor: Double read GetValor write SetValor;
  end;

  TPreAutorizacaoFormaDePagamentoList = class;

  IPreAutorizacaoFormaDePagamentoList = interface
	['{375C6314-4ABC-4A17-9761-3FD9C394984F}']
    function GetReference: TPreAutorizacaoFormaDePagamentoList;
    function GetItems(AIndex: Integer): IPreAutorizacaoFormaDePagamento;
    procedure SetItems(AIndex: Integer; const Value: IPreAutorizacaoFormaDePagamento);
    procedure Add(const APreAutorizacaoFormaDePagamento: IPreAutorizacaoFormaDePagamento);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IPreAutorizacaoFormaDePagamento read GetItems write SetItems; default;
  end;

  TPreAutorizacaoFormaDePagamentoListEnumerator = class
  private
    FIndex: Integer;
    FPreAutorizacaoFormaDePagamentoList: TPreAutorizacaoFormaDePagamentoList;
  public
    constructor Create(APreAutorizacaoFormaDePagamentoList: TPreAutorizacaoFormaDePagamentoList);
    function GetCurrent: IPreAutorizacaoFormaDePagamento; inline;
    function MoveNext: Boolean;
    property Current: IPreAutorizacaoFormaDePagamento read GetCurrent;
  end;

  TPreAutorizacaoFormaDePagamentoList = class(TInterfacedObject, IPreAutorizacaoFormaDePagamentoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IPreAutorizacaoFormaDePagamento;
    procedure SetItems(AIndex: Integer; const Value: IPreAutorizacaoFormaDePagamento);
  public
    constructor Create;
    procedure Add(const APreAutorizacaoFormaDePagamento: IPreAutorizacaoFormaDePagamento);
    destructor Destroy; override;
    function GetEnumerator: TPreAutorizacaoFormaDePagamentoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TPreAutorizacaoFormaDePagamentoList;
    property Items[AIndex: Integer]: IPreAutorizacaoFormaDePagamento read GetItems write SetItems; default;
  end;

  TPreAutorizacaoFormaDePagamentoListRec = record
  private
    FList: IPreAutorizacaoFormaDePagamentoList;
  public
    class function Create(const AList: IPreAutorizacaoFormaDePagamentoList): TPreAutorizacaoFormaDePagamentoListRec; static;
    class operator Implicit(AListRec: TPreAutorizacaoFormaDePagamentoListRec): TPreAutorizacaoFormaDePagamentoList;
  end;

  TPreAutorizacaoFormaDePagamento = class(TInterfacedModel, IPreAutorizacaoFormaDePagamento)
  private
	FFinalizadoraId: Integer;
	FValor: Double;
    function GetFinalizadoraId: Integer;
    procedure SetFinalizadoraId(const AFinalizadoraId: Integer);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
  published
    property FinalizadoraId: Integer read GetFinalizadoraId write SetFinalizadoraId;
    property Valor: Double read GetValor write SetValor;
  end;

implementation

{ TPreAutorizacaoFormaDePagamentoList }

procedure TPreAutorizacaoFormaDePagamentoList.Add(const APreAutorizacaoFormaDePagamento: IPreAutorizacaoFormaDePagamento);
begin
  FList.Add(APreAutorizacaoFormaDePagamento);
end;

procedure TPreAutorizacaoFormaDePagamentoList.Clear;
begin
  FList.Clear;
end;

function TPreAutorizacaoFormaDePagamentoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TPreAutorizacaoFormaDePagamentoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TPreAutorizacaoFormaDePagamentoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TPreAutorizacaoFormaDePagamentoList.GetEnumerator: TPreAutorizacaoFormaDePagamentoListEnumerator;
begin
  Result := TPreAutorizacaoFormaDePagamentoListEnumerator.Create(Self);
end;

function TPreAutorizacaoFormaDePagamentoList.GetItems(AIndex: Integer): IPreAutorizacaoFormaDePagamento;
begin
  Result := FList[AIndex] as IPreAutorizacaoFormaDePagamento;
end;

function TPreAutorizacaoFormaDePagamentoList.GetReference: TPreAutorizacaoFormaDePagamentoList;
begin
  Result := Self;
end;

procedure TPreAutorizacaoFormaDePagamentoList.SetItems(AIndex: Integer; const Value: IPreAutorizacaoFormaDePagamento);
begin
  FList[AIndex] := Value;
end;

{ TPreAutorizacaoFormaDePagamentoListEnumerator }

constructor TPreAutorizacaoFormaDePagamentoListEnumerator.Create(APreAutorizacaoFormaDePagamentoList: TPreAutorizacaoFormaDePagamentoList);
begin
  inherited Create;
  FIndex := -1;
  FPreAutorizacaoFormaDePagamentoList := APreAutorizacaoFormaDePagamentoList;
end;

function TPreAutorizacaoFormaDePagamentoListEnumerator.GetCurrent: IPreAutorizacaoFormaDePagamento;
begin
  Result := FPreAutorizacaoFormaDePagamentoList[FIndex];
end;

function TPreAutorizacaoFormaDePagamentoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FPreAutorizacaoFormaDePagamentoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TPreAutorizacaoFormaDePagamentoListRec }

class function TPreAutorizacaoFormaDePagamentoListRec.Create(const AList: IPreAutorizacaoFormaDePagamentoList): TPreAutorizacaoFormaDePagamentoListRec;
begin
  FillChar(Result, SizeOf(TPreAutorizacaoFormaDePagamentoListRec), 0);
  Result.FList := AList;
end;

class operator TPreAutorizacaoFormaDePagamentoListRec.Implicit(AListRec: TPreAutorizacaoFormaDePagamentoListRec): TPreAutorizacaoFormaDePagamentoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TPreAutorizacaoFormaDePagamento }

function TPreAutorizacaoFormaDePagamento.GetFinalizadoraId: Integer;
begin
  Result := FFinalizadoraId;
end;

procedure TPreAutorizacaoFormaDePagamento.SetFinalizadoraId(const AFinalizadoraId: Integer);
begin
  FFinalizadoraId := AFinalizadoraId;
end;

function TPreAutorizacaoFormaDePagamento.GetValor: Double;
begin
  Result := FValor;
end;

procedure TPreAutorizacaoFormaDePagamento.SetValor(const AValor: Double);
begin
  FValor := AValor;
end;


end.
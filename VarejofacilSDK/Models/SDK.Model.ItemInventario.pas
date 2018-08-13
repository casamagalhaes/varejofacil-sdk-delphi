unit SDK.Model.ItemInventario;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums, SDK.Model.CodigoAuxiliar;

type

  IItemInventario = interface(IModel)
  ['{2BD421F4-9F13-4647-97FC-BFA0B1A0D697}']
    function GetId: Int64;
    function GetInventarioId: Int64;
    function GetProdutoId: Int64;
    function GetCodigoAuxiliar: ICodigoAuxiliar;
    function GetPrimeiraDigitacao: Double;
    procedure SetId(const Value: Int64);
    procedure SetInventarioId(const Value: Int64);
    procedure SetProdutoId(const Value: Int64);
    procedure SetCodigoAuxiliar(const Value: ICodigoAuxiliar);
    procedure SetPrimeiraDigitacao(const Value: Double);
    property Id: Int64 read GetId write SetId;
    property InventarioId: Int64 read GetInventarioId write SetInventarioId;
    property ProdutoId: Int64 read GetProdutoId write SetProdutoId;
    property CodigoAuxiliar: ICodigoAuxiliar read GetCodigoAuxiliar write SetCodigoAuxiliar;
    property PrimeiraDigitacao: Double read GetPrimeiraDigitacao write SetPrimeiraDigitacao;
  end;

  TItemInventarioList = class;

  IItemInventarioList = interface
	['{E0E739A8-397E-450D-927C-A4A903D25E25}']
    function GetReference: TItemInventarioList;
    function GetItems(AIndex: Integer): IItemInventario;
    procedure SetItems(AIndex: Integer; const Value: IItemInventario);
    procedure Add(const AInventario: IItemInventario);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IItemInventario read GetItems write SetItems; default;
  end;

  TItemInventarioListEnumerator = class
  private
    FIndex: Integer;
    FItemInventarioList: TItemInventarioList;
  public
    constructor Create(AItemInventarioList: TItemInventarioList);
    function GetCurrent: IItemInventario; inline;
    function MoveNext: Boolean;
    property Current: IItemInventario read GetCurrent;
  end;

  TItemInventarioList = class(TInterfacedObject, IItemInventarioList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IItemInventario;
    procedure SetItems(AIndex: Integer; const Value: IItemInventario);
  public
    constructor Create;
    procedure Add(const AItemInventario: IItemInventario);
    destructor Destroy; override;
    function GetEnumerator: TItemInventarioListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TItemInventarioList;
    property Items[AIndex: Integer]: IItemInventario read GetItems write SetItems; default;
  end;

  TItemInventarioListRec = record
  private
    FList: IItemInventarioList;
  public
    class function Create(const AList: IItemInventarioList): TItemInventarioListRec; static;
    class operator Implicit(AListRec: TItemInventarioListRec): TItemInventarioList;
  end;


  TItemInventario = class(TInterfacedModel, IItemInventario)
  private
    FId: Int64;
    FInventarioId: Int64;
    FProdutoId: Int64;
    FCodigoAuxiliar: ICodigoAuxiliar;
    FPrimeiraDigitacao: Double;
    function GetCodigoAuxiliar: ICodigoAuxiliar;
    function GetId: Int64;
    function GetInventarioId: Int64;
    function GetPrimeiraDigitacao: Double;
    function GetProdutoId: Int64;
    procedure SetCodigoAuxiliar(const Value: ICodigoAuxiliar);
    procedure SetId(const Value: Int64);
    procedure SetInventarioId(const Value: Int64);
    procedure SetPrimeiraDigitacao(const Value: Double);
    procedure SetProdutoId(const Value: Int64);
  published
    property Id: Int64 read GetId write SetId;
    property InventarioId: Int64 read GetInventarioId write SetInventarioId;
    property ProdutoId: Int64 read GetProdutoId write SetProdutoId;
    property CodigoAuxiliar: ICodigoAuxiliar read GetCodigoAuxiliar write SetCodigoAuxiliar;
    property PrimeiraDigitacao: Double read GetPrimeiraDigitacao write SetPrimeiraDigitacao;

  end;


implementation

{ TItemInventario }

function TItemInventario.GetCodigoAuxiliar: ICodigoAuxiliar;
begin
  Result := FCodigoAuxiliar;
end;

function TItemInventario.GetId: Int64;
begin
  Result := FId;
end;

function TItemInventario.GetInventarioId: Int64;
begin
  Result := FInventarioId;
end;

function TItemInventario.GetPrimeiraDigitacao: Double;
begin
  Result := FPrimeiraDigitacao;
end;

function TItemInventario.GetProdutoId: Int64;
begin
  Result := FProdutoId;
end;

procedure TItemInventario.SetCodigoAuxiliar(const Value: ICodigoAuxiliar);
begin
  FCodigoAuxiliar := Value;
end;

procedure TItemInventario.SetId(const Value: Int64);
begin
  FId := Value;
end;

procedure TItemInventario.SetInventarioId(const Value: Int64);
begin
  FInventarioId := Value;
end;

procedure TItemInventario.SetPrimeiraDigitacao(const Value: Double);
begin
  FPrimeiraDigitacao := Value;
end;

procedure TItemInventario.SetProdutoId(const Value: Int64);
begin
  FProdutoId := Value;      
end;

{ TItemInventarioListEnumerator }

constructor TItemInventarioListEnumerator.Create(
  AItemInventarioList: TItemInventarioList);
begin
  inherited Create;
  FIndex := -1;
  FItemInventarioList := AItemInventarioList;
end;

function TItemInventarioListEnumerator.GetCurrent: IItemInventario;
begin
  Result := FItemInventarioList[FIndex];
end;

function TItemInventarioListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FItemInventarioList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TItemInventarioList }

procedure TItemInventarioList.Add(const AItemInventario: IItemInventario);
begin
  FList.Add(AItemInventario);
end;

procedure TItemInventarioList.Clear;
begin
  FList.Clear;
end;

function TItemInventarioList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TItemInventarioList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TItemInventarioList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TItemInventarioList.GetEnumerator: TItemInventarioListEnumerator;
begin
  Result := TItemInventarioListEnumerator.Create(Self);
end;

function TItemInventarioList.GetItems(AIndex: Integer): IItemInventario;
begin
  Result := FList[AIndex] as IitemInventario;
end;

function TItemInventarioList.GetReference: TItemInventarioList;
begin
  Result := Self;
end;

procedure TItemInventarioList.SetItems(AIndex: Integer;
  const Value: IItemInventario);
begin
  FList[AIndex] := Value; 
end;

{ TItemInventarioListRec }

class function TItemInventarioListRec.Create(
  const AList: IItemInventarioList): TItemInventarioListRec;
begin
  FillChar(Result, SizeOf(TItemInventarioListRec), 0);
  Result.FList := AList;
end;

class operator TItemInventarioListRec.Implicit(
  AListRec: TItemInventarioListRec): TItemInventarioList;
begin
  Result := AListRec.FList.GetReference;
end;

end.

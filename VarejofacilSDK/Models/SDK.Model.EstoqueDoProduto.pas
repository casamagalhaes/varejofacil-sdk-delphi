unit SDK.Model.EstoqueDoProduto;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IEstoqueDoProduto = interface(IModel)
    ['{4D98A359-33BA-4621-826C-F7FBE18CF94C}']
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetEstoqueMinimo: Double;
    procedure SetEstoqueMinimo(const AEstoqueMinimo: Double);
    function GetEstoqueMaximo: Double;
    procedure SetEstoqueMaximo(const AEstoqueMaximo: Double);
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property EstoqueMinimo: Double read GetEstoqueMinimo write SetEstoqueMinimo;
    property EstoqueMaximo: Double read GetEstoqueMaximo write SetEstoqueMaximo;
  end;

  TEstoqueDoProdutoList = class;

  IEstoqueDoProdutoList = interface
	['{C105B2BC-82CA-4730-99C1-68B8965DF6EB}']
    function GetReference: TEstoqueDoProdutoList;
    function GetItems(AIndex: Integer): IEstoqueDoProduto;
    procedure SetItems(AIndex: Integer; const Value: IEstoqueDoProduto);
    procedure Add(const AEstoqueDoProduto: IEstoqueDoProduto);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IEstoqueDoProduto read GetItems write SetItems; default;
  end;

  TEstoqueDoProdutoListEnumerator = class
  private
    FIndex: Integer;
    FEstoqueDoProdutoList: TEstoqueDoProdutoList;
  public
    constructor Create(AEstoqueDoProdutoList: TEstoqueDoProdutoList);
    function GetCurrent: IEstoqueDoProduto; inline;
    function MoveNext: Boolean;
    property Current: IEstoqueDoProduto read GetCurrent;
  end;

  TEstoqueDoProdutoList = class(TInterfacedObject, IEstoqueDoProdutoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IEstoqueDoProduto;
    procedure SetItems(AIndex: Integer; const Value: IEstoqueDoProduto);
  public
    constructor Create;
    procedure Add(const AEstoqueDoProduto: IEstoqueDoProduto);
    destructor Destroy; override;
    function GetEnumerator: TEstoqueDoProdutoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TEstoqueDoProdutoList;
    property Items[AIndex: Integer]: IEstoqueDoProduto read GetItems write SetItems; default;
  end;

  TEstoqueDoProdutoListRec = record
  private
    FList: IEstoqueDoProdutoList;
  public
    class function Create(const AList: IEstoqueDoProdutoList): TEstoqueDoProdutoListRec; static;
    class operator Implicit(AListRec: TEstoqueDoProdutoListRec): TEstoqueDoProdutoList;
  end;

  TEstoqueDoProduto = class(TInterfacedModel, IEstoqueDoProduto)
  private
    FLojaId: Int64;
    FEstoqueMinimo: Double;
    FEstoqueMaximo: Double;
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetEstoqueMinimo: Double;
    procedure SetEstoqueMinimo(const AEstoqueMinimo: Double);
    function GetEstoqueMaximo: Double;
    procedure SetEstoqueMaximo(const AEstoqueMaximo: Double);
  published
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property EstoqueMinimo: Double read GetEstoqueMinimo write SetEstoqueMinimo;
    property EstoqueMaximo: Double read GetEstoqueMaximo write SetEstoqueMaximo;
  end;

implementation

{ TEstoqueDoProdutoList }

procedure TEstoqueDoProdutoList.Add(const AEstoqueDoProduto: IEstoqueDoProduto);
begin
  FList.Add(AEstoqueDoProduto);
end;

procedure TEstoqueDoProdutoList.Clear;
begin
  FList.Clear;
end;

function TEstoqueDoProdutoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TEstoqueDoProdutoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TEstoqueDoProdutoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TEstoqueDoProdutoList.GetEnumerator: TEstoqueDoProdutoListEnumerator;
begin
  Result := TEstoqueDoProdutoListEnumerator.Create(Self);
end;

function TEstoqueDoProdutoList.GetItems(AIndex: Integer): IEstoqueDoProduto;
begin
  Result := FList[AIndex] as IEstoqueDoProduto;
end;

function TEstoqueDoProdutoList.GetReference: TEstoqueDoProdutoList;
begin
  Result := Self;
end;

procedure TEstoqueDoProdutoList.SetItems(AIndex: Integer; const Value: IEstoqueDoProduto);
begin
  FList[AIndex] := Value;
end;

{ TEstoqueDoProdutoListEnumerator }

constructor TEstoqueDoProdutoListEnumerator.Create(AEstoqueDoProdutoList: TEstoqueDoProdutoList);
begin
  inherited Create;
  FIndex := -1;
  FEstoqueDoProdutoList := AEstoqueDoProdutoList;
end;

function TEstoqueDoProdutoListEnumerator.GetCurrent: IEstoqueDoProduto;
begin
  Result := FEstoqueDoProdutoList[FIndex];
end;

function TEstoqueDoProdutoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FEstoqueDoProdutoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TEstoqueDoProdutoListRec }

class function TEstoqueDoProdutoListRec.Create(const AList: IEstoqueDoProdutoList): TEstoqueDoProdutoListRec;
begin
  FillChar(Result, SizeOf(TEstoqueDoProdutoListRec), 0);
  Result.FList := AList;
end;

class operator TEstoqueDoProdutoListRec.Implicit(AListRec: TEstoqueDoProdutoListRec): TEstoqueDoProdutoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TEstoqueDoProduto }

function TEstoqueDoProduto.GetLojaId: Int64;
begin
  Result := FLojaId;
end;

procedure TEstoqueDoProduto.SetLojaId(const ALojaId: Int64);
begin
  FLojaId := ALojaId;
end;

function TEstoqueDoProduto.GetEstoqueMinimo: Double;
begin
  Result := FEstoqueMinimo;
end;

procedure TEstoqueDoProduto.SetEstoqueMinimo(const AEstoqueMinimo: Double);
begin
  FEstoqueMinimo := AEstoqueMinimo;
end;

function TEstoqueDoProduto.GetEstoqueMaximo: Double;
begin
  Result := FEstoqueMaximo;
end;

procedure TEstoqueDoProduto.SetEstoqueMaximo(const AEstoqueMaximo: Double);
begin
  FEstoqueMaximo := AEstoqueMaximo;
end;


end.
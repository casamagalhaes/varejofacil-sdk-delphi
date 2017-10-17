unit SDK.Model.Componente;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IComponente = interface(IModel)
    ['{024746CE-2A36-448D-98A9-F6F5F93927C7}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetProdutoId: Int64;
    procedure SetProdutoId(const AProdutoId: Int64);
    function GetCompostoId: Int64;
    procedure SetCompostoId(const ACompostoId: Int64);
    function GetQuantidade: Double;
    procedure SetQuantidade(const AQuantidade: Double);
    function GetPreco1: Double;
    procedure SetPreco1(const APreco1: Double);
    function GetPreco2: Double;
    procedure SetPreco2(const APreco2: Double);
    function GetPreco3: Double;
    procedure SetPreco3(const APreco3: Double);
    property Id: Int64 read GetId write SetId;
    property ProdutoId: Int64 read GetProdutoId write SetProdutoId;
    property CompostoId: Int64 read GetCompostoId write SetCompostoId;
    property Quantidade: Double read GetQuantidade write SetQuantidade;
    property Preco1: Double read GetPreco1 write SetPreco1;
    property Preco2: Double read GetPreco2 write SetPreco2;
    property Preco3: Double read GetPreco3 write SetPreco3;
  end;

  TComponenteList = class;

  IComponenteList = interface
	['{989EA73A-66CC-4E00-A38A-4E3BA3F70ACE}']
    function GetReference: TComponenteList;
    function GetItems(AIndex: Integer): IComponente;
    procedure SetItems(AIndex: Integer; const Value: IComponente);
    procedure Add(const AComponente: IComponente);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IComponente read GetItems write SetItems; default;
  end;

  TComponenteListEnumerator = class
  private
    FIndex: Integer;
    FComponenteList: TComponenteList;
  public
    constructor Create(AComponenteList: TComponenteList);
    function GetCurrent: IComponente; inline;
    function MoveNext: Boolean;
    property Current: IComponente read GetCurrent;
  end;

  TComponenteList = class(TInterfacedObject, IComponenteList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IComponente;
    procedure SetItems(AIndex: Integer; const Value: IComponente);
  public
    constructor Create;
    procedure Add(const AComponente: IComponente);
    destructor Destroy; override;
    function GetEnumerator: TComponenteListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TComponenteList;
    property Items[AIndex: Integer]: IComponente read GetItems write SetItems; default;
  end;

  TComponenteListRec = record
  private
    FList: IComponenteList;
  public
    class function Create(const AList: IComponenteList): TComponenteListRec; static;
    class operator Implicit(AListRec: TComponenteListRec): TComponenteList;
  end;

  TComponente = class(TInterfacedModel, IComponente)
  private
	FId: Int64;
	FProdutoId: Int64;
	FCompostoId: Int64;
	FQuantidade: Double;
	FPreco1: Double;
	FPreco2: Double;
	FPreco3: Double;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetProdutoId: Int64;
    procedure SetProdutoId(const AProdutoId: Int64);
    function GetCompostoId: Int64;
    procedure SetCompostoId(const ACompostoId: Int64);
    function GetQuantidade: Double;
    procedure SetQuantidade(const AQuantidade: Double);
    function GetPreco1: Double;
    procedure SetPreco1(const APreco1: Double);
    function GetPreco2: Double;
    procedure SetPreco2(const APreco2: Double);
    function GetPreco3: Double;
    procedure SetPreco3(const APreco3: Double);
  published
    property Id: Int64 read GetId write SetId;
    property ProdutoId: Int64 read GetProdutoId write SetProdutoId;
    property CompostoId: Int64 read GetCompostoId write SetCompostoId;
    property Quantidade: Double read GetQuantidade write SetQuantidade;
    property Preco1: Double read GetPreco1 write SetPreco1;
    property Preco2: Double read GetPreco2 write SetPreco2;
    property Preco3: Double read GetPreco3 write SetPreco3;
  end;

implementation

{ TComponenteList }

procedure TComponenteList.Add(const AComponente: IComponente);
begin
  FList.Add(AComponente);
end;

procedure TComponenteList.Clear;
begin
  FList.Clear;
end;

function TComponenteList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TComponenteList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TComponenteList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TComponenteList.GetEnumerator: TComponenteListEnumerator;
begin
  Result := TComponenteListEnumerator.Create(Self);
end;

function TComponenteList.GetItems(AIndex: Integer): IComponente;
begin
  Result := FList[AIndex] as IComponente;
end;

function TComponenteList.GetReference: TComponenteList;
begin
  Result := Self;
end;

procedure TComponenteList.SetItems(AIndex: Integer; const Value: IComponente);
begin
  FList[AIndex] := Value;
end;

{ TComponenteListEnumerator }

constructor TComponenteListEnumerator.Create(AComponenteList: TComponenteList);
begin
  inherited Create;
  FIndex := -1;
  FComponenteList := AComponenteList;
end;

function TComponenteListEnumerator.GetCurrent: IComponente;
begin
  Result := FComponenteList[FIndex];
end;

function TComponenteListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FComponenteList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TComponenteListRec }

class function TComponenteListRec.Create(const AList: IComponenteList): TComponenteListRec;
begin
  FillChar(Result, SizeOf(TComponenteListRec), 0);
  Result.FList := AList;
end;

class operator TComponenteListRec.Implicit(AListRec: TComponenteListRec): TComponenteList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TComponente }

function TComponente.GetId: Int64;
begin
  Result := FId;
end;

procedure TComponente.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TComponente.GetProdutoId: Int64;
begin
  Result := FProdutoId;
end;

procedure TComponente.SetProdutoId(const AProdutoId: Int64);
begin
  FProdutoId := AProdutoId;
end;

function TComponente.GetCompostoId: Int64;
begin
  Result := FCompostoId;
end;

procedure TComponente.SetCompostoId(const ACompostoId: Int64);
begin
  FCompostoId := ACompostoId;
end;

function TComponente.GetQuantidade: Double;
begin
  Result := FQuantidade;
end;

procedure TComponente.SetQuantidade(const AQuantidade: Double);
begin
  FQuantidade := AQuantidade;
end;

function TComponente.GetPreco1: Double;
begin
  Result := FPreco1;
end;

procedure TComponente.SetPreco1(const APreco1: Double);
begin
  FPreco1 := APreco1;
end;

function TComponente.GetPreco2: Double;
begin
  Result := FPreco2;
end;

procedure TComponente.SetPreco2(const APreco2: Double);
begin
  FPreco2 := APreco2;
end;

function TComponente.GetPreco3: Double;
begin
  Result := FPreco3;
end;

procedure TComponente.SetPreco3(const APreco3: Double);
begin
  FPreco3 := APreco3;
end;


end.
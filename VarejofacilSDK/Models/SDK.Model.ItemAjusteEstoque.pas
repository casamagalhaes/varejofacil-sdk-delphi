unit SDK.Model.ItemAjusteEstoque;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IItemAjusteDeEstoque = interface(IModel)
    ['{0671F5B8-085A-4D70-AB59-46697AD1D2AA}']
    function GetId: TString;
    function GetProdutoId: Int64;
    function GetQuantidade: Extended;
    procedure SetId(const AId: TString);
    procedure SetProdutoId(const AProdutoId: Int64);
    procedure SetQuantidade(const AQuantidade: Extended);
    property Id: TString read GetId write SetId;
    property ProdutoId: Int64 read GetProdutoId write SetProdutoId;
    property Quantidade: Extended read GetQuantidade write SetQuantidade;
  end;

  TItemAjusteDeEstoqueList = class;

  IItemAjusteDeEstoqueList = interface
    ['{8894DA65-FE99-46E7-B47C-A7E0CB5FD8E0}']
    function GetReference: TItemAjusteDeEstoqueList;
    function GetItems(AIndex: Integer): IItemAjusteDeEstoque;
    procedure SetItems(AIndex: Integer; const IItemAjusteDeEstoque: IItemAjusteDeEstoque);
    procedure Add(const AItemAjusteDeEstoque: IItemAjusteDeEstoque);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IItemAjusteDeEstoque read GetItems write SetItems; default;
  end;

  TItemAjusteDeEstoqueListEnumerator = class
  private
    FIndex: Integer;
    FItemAjusteDeEstoqueList: TItemAjusteDeEstoqueList;
  public
    constructor Create(AItemAjusteDeEstoqueList: TItemAjusteDeEstoqueList);
    function GetCurrent: IItemAjusteDeEstoque; inline;
    function MoveNext: Boolean;
    property Current: IItemAjusteDeEstoque read GetCurrent;
  end;

  TItemAjusteDeEstoqueList = class(TInterfacedObject, IItemAjusteDeEstoqueList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IItemAjusteDeEstoque;
    procedure SetItems(AIndex: Integer; const Value: IItemAjusteDeEstoque);
  public
    constructor Create;
    procedure Add(const AItemAjusteDeEstoque: IItemAjusteDeEstoque);
    destructor Destroy; override;
    function GetEnumerator: TItemAjusteDeEstoqueListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TItemAjusteDeEstoqueList;
    property Items[AIndex: Integer]: IItemAjusteDeEstoque read GetItems write SetItems; default;
  end;

  TItemAjusteDeEstoqueListRec = record
  private
    FList: IItemAjusteDeEstoqueList;
  public
    class function Create(const AList: IItemAjusteDeEstoqueList): TItemAjusteDeEstoqueListRec; static;
    class operator Implicit(AListRec: TItemAjusteDeEstoqueListRec): TItemAjusteDeEstoqueList;
  end;

  TItemAjusteDeEstoque = class(TInterfacedModel, IItemAjusteDeEstoque)
  private
    FId: TString;
    FProdutoId: Int64;
    FQuantidade: Extended;
    function GetId: TString;
    function GetProdutoId: Int64;
    function GetQuantidade: Extended;
    procedure SetId(const AId: TString);
    procedure SetProdutoId(const AProdutoId: Int64);
    procedure SetQuantidade(const AQuantidade: Extended);
  published
    property Id: TString read GetId write SetId;
    property ProdutoId: Int64 read GetProdutoId write SetProdutoId;
    property Quantidade: Extended read GetQuantidade write SetQuantidade;
  end;



implementation

{ TItemAjusteDeEstoqueListRec }

class function TItemAjusteDeEstoqueListRec.Create(
  const AList: IItemAjusteDeEstoqueList): TItemAjusteDeEstoqueListRec;
begin
  FillChar(Result, SizeOf(TItemAjusteDeEstoqueListRec), 0);
  Result.FList := AList;
end;

class operator TItemAjusteDeEstoqueListRec.Implicit(
  AListRec: TItemAjusteDeEstoqueListRec): TItemAjusteDeEstoqueList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TItemAjusteDeEstoqueList }

procedure TItemAjusteDeEstoqueList.Add(const AItemAjusteDeEstoque: IItemAjusteDeEstoque);
begin
  FList.Add(AItemAjusteDeEstoque);
end;

procedure TItemAjusteDeEstoqueList.Clear;
begin
  FList.Clear;
end;

function TItemAjusteDeEstoqueList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TItemAjusteDeEstoqueList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TItemAjusteDeEstoqueList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TItemAjusteDeEstoqueList.GetEnumerator: TItemAjusteDeEstoqueListEnumerator;
begin
  Result := TItemAjusteDeEstoqueListEnumerator.Create(Self);
end;

function TItemAjusteDeEstoqueList.GetItems(AIndex: Integer): IItemAjusteDeEstoque;
begin
  Result := FList[AIndex] as IItemAjusteDeEstoque;
end;

function TItemAjusteDeEstoqueList.GetReference: TItemAjusteDeEstoqueList;
begin
  Result := Self;
end;

procedure TItemAjusteDeEstoqueList.SetItems(AIndex: Integer;
  const Value: IItemAjusteDeEstoque);
begin
  FList[AIndex] := Value;
end;


{ TItemAjusteDeEstoqueListEnumerator }

constructor TItemAjusteDeEstoqueListEnumerator.Create(
  AItemAjusteDeEstoqueList: TItemAjusteDeEstoqueList);
begin
  inherited Create;
  FIndex := -1;
  FItemAjusteDeEstoqueList := AItemAjusteDeEstoqueList;
end;

function TItemAjusteDeEstoqueListEnumerator.GetCurrent: IItemAjusteDeEstoque;
begin
  Result := FItemAjusteDeEstoqueList[FIndex];
end;

function TItemAjusteDeEstoqueListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FItemAjusteDeEstoqueList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TItemAjusteDeEstoque }

function TItemAjusteDeEstoque.GetId: TString;
begin
  Result := FId;
end;

function TItemAjusteDeEstoque.GetProdutoId: Int64;
begin
  Result := FProdutoId;
end;

function TItemAjusteDeEstoque.GetQuantidade: Extended;
begin
  Result := FQuantidade;
end;

procedure TItemAjusteDeEstoque.SetId(const AId: TString);
begin
  FId := AId;
end;

procedure TItemAjusteDeEstoque.SetProdutoId(const AProdutoId: Int64);
begin
  FProdutoId := AProdutoId;
end;

procedure TItemAjusteDeEstoque.SetQuantidade(const AQuantidade: Extended);
begin
  FQuantidade := AQuantidade;
end;

end.

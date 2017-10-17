unit SDK.Model.ItemAplicacaoProduto;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IItemAplicacaoProduto = interface(IModel)
    ['{A8FC2BDB-9F77-44F5-84F0-D447EE2F44BA}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    property Id: Int64 read GetId write SetId;
  end;

  TItemAplicacaoProdutoList = class;

  IItemAplicacaoProdutoList = interface
	['{DB41E59E-D702-46BC-B7E7-8FFF32BF0AB8}']
    function GetReference: TItemAplicacaoProdutoList;
    function GetItems(AIndex: Integer): IItemAplicacaoProduto;
    procedure SetItems(AIndex: Integer; const Value: IItemAplicacaoProduto);
    procedure Add(const AItemAplicacaoProduto: IItemAplicacaoProduto);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IItemAplicacaoProduto read GetItems write SetItems; default;
  end;

  TItemAplicacaoProdutoListEnumerator = class
  private
    FIndex: Integer;
    FItemAplicacaoProdutoList: TItemAplicacaoProdutoList;
  public
    constructor Create(AItemAplicacaoProdutoList: TItemAplicacaoProdutoList);
    function GetCurrent: IItemAplicacaoProduto; inline;
    function MoveNext: Boolean;
    property Current: IItemAplicacaoProduto read GetCurrent;
  end;

  TItemAplicacaoProdutoList = class(TInterfacedObject, IItemAplicacaoProdutoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IItemAplicacaoProduto;
    procedure SetItems(AIndex: Integer; const Value: IItemAplicacaoProduto);
  public
    constructor Create;
    procedure Add(const AItemAplicacaoProduto: IItemAplicacaoProduto);
    destructor Destroy; override;
    function GetEnumerator: TItemAplicacaoProdutoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TItemAplicacaoProdutoList;
    property Items[AIndex: Integer]: IItemAplicacaoProduto read GetItems write SetItems; default;
  end;

  TItemAplicacaoProdutoListRec = record
  private
    FList: IItemAplicacaoProdutoList;
  public
    class function Create(const AList: IItemAplicacaoProdutoList): TItemAplicacaoProdutoListRec; static;
    class operator Implicit(AListRec: TItemAplicacaoProdutoListRec): TItemAplicacaoProdutoList;
  end;

  TItemAplicacaoProduto = class(TInterfacedModel, IItemAplicacaoProduto)
  private
	FId: Int64;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
  published
    property Id: Int64 read GetId write SetId;
  end;

implementation

{ TItemAplicacaoProdutoList }

procedure TItemAplicacaoProdutoList.Add(const AItemAplicacaoProduto: IItemAplicacaoProduto);
begin
  FList.Add(AItemAplicacaoProduto);
end;

procedure TItemAplicacaoProdutoList.Clear;
begin
  FList.Clear;
end;

function TItemAplicacaoProdutoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TItemAplicacaoProdutoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TItemAplicacaoProdutoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TItemAplicacaoProdutoList.GetEnumerator: TItemAplicacaoProdutoListEnumerator;
begin
  Result := TItemAplicacaoProdutoListEnumerator.Create(Self);
end;

function TItemAplicacaoProdutoList.GetItems(AIndex: Integer): IItemAplicacaoProduto;
begin
  Result := FList[AIndex] as IItemAplicacaoProduto;
end;

function TItemAplicacaoProdutoList.GetReference: TItemAplicacaoProdutoList;
begin
  Result := Self;
end;

procedure TItemAplicacaoProdutoList.SetItems(AIndex: Integer; const Value: IItemAplicacaoProduto);
begin
  FList[AIndex] := Value;
end;

{ TItemAplicacaoProdutoListEnumerator }

constructor TItemAplicacaoProdutoListEnumerator.Create(AItemAplicacaoProdutoList: TItemAplicacaoProdutoList);
begin
  inherited Create;
  FIndex := -1;
  FItemAplicacaoProdutoList := AItemAplicacaoProdutoList;
end;

function TItemAplicacaoProdutoListEnumerator.GetCurrent: IItemAplicacaoProduto;
begin
  Result := FItemAplicacaoProdutoList[FIndex];
end;

function TItemAplicacaoProdutoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FItemAplicacaoProdutoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TItemAplicacaoProdutoListRec }

class function TItemAplicacaoProdutoListRec.Create(const AList: IItemAplicacaoProdutoList): TItemAplicacaoProdutoListRec;
begin
  FillChar(Result, SizeOf(TItemAplicacaoProdutoListRec), 0);
  Result.FList := AList;
end;

class operator TItemAplicacaoProdutoListRec.Implicit(AListRec: TItemAplicacaoProdutoListRec): TItemAplicacaoProdutoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TItemAplicacaoProduto }

function TItemAplicacaoProduto.GetId: Int64;
begin
  Result := FId;
end;

procedure TItemAplicacaoProduto.SetId(const AId: Int64);
begin
  FId := AId;
end;


end.
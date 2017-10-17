unit SDK.Model.ItemCaracteristicaProduto;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IItemCaracteristicaProduto = interface(IModel)
    ['{4455FB39-B829-4F85-865E-61A3068F6CEB}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    property Id: Int64 read GetId write SetId;
  end;

  TItemCaracteristicaProdutoList = class;

  IItemCaracteristicaProdutoList = interface
	['{38361692-ACF9-445D-B594-2ACF67F1FF49}']
    function GetReference: TItemCaracteristicaProdutoList;
    function GetItems(AIndex: Integer): IItemCaracteristicaProduto;
    procedure SetItems(AIndex: Integer; const Value: IItemCaracteristicaProduto);
    procedure Add(const AItemCaracteristicaProduto: IItemCaracteristicaProduto);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IItemCaracteristicaProduto read GetItems write SetItems; default;
  end;

  TItemCaracteristicaProdutoListEnumerator = class
  private
    FIndex: Integer;
    FItemCaracteristicaProdutoList: TItemCaracteristicaProdutoList;
  public
    constructor Create(AItemCaracteristicaProdutoList: TItemCaracteristicaProdutoList);
    function GetCurrent: IItemCaracteristicaProduto; inline;
    function MoveNext: Boolean;
    property Current: IItemCaracteristicaProduto read GetCurrent;
  end;

  TItemCaracteristicaProdutoList = class(TInterfacedObject, IItemCaracteristicaProdutoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IItemCaracteristicaProduto;
    procedure SetItems(AIndex: Integer; const Value: IItemCaracteristicaProduto);
  public
    constructor Create;
    procedure Add(const AItemCaracteristicaProduto: IItemCaracteristicaProduto);
    destructor Destroy; override;
    function GetEnumerator: TItemCaracteristicaProdutoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TItemCaracteristicaProdutoList;
    property Items[AIndex: Integer]: IItemCaracteristicaProduto read GetItems write SetItems; default;
  end;

  TItemCaracteristicaProdutoListRec = record
  private
    FList: IItemCaracteristicaProdutoList;
  public
    class function Create(const AList: IItemCaracteristicaProdutoList): TItemCaracteristicaProdutoListRec; static;
    class operator Implicit(AListRec: TItemCaracteristicaProdutoListRec): TItemCaracteristicaProdutoList;
  end;

  TItemCaracteristicaProduto = class(TInterfacedModel, IItemCaracteristicaProduto)
  private
	FId: Int64;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
  published
    property Id: Int64 read GetId write SetId;
  end;

implementation

{ TItemCaracteristicaProdutoList }

procedure TItemCaracteristicaProdutoList.Add(const AItemCaracteristicaProduto: IItemCaracteristicaProduto);
begin
  FList.Add(AItemCaracteristicaProduto);
end;

procedure TItemCaracteristicaProdutoList.Clear;
begin
  FList.Clear;
end;

function TItemCaracteristicaProdutoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TItemCaracteristicaProdutoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TItemCaracteristicaProdutoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TItemCaracteristicaProdutoList.GetEnumerator: TItemCaracteristicaProdutoListEnumerator;
begin
  Result := TItemCaracteristicaProdutoListEnumerator.Create(Self);
end;

function TItemCaracteristicaProdutoList.GetItems(AIndex: Integer): IItemCaracteristicaProduto;
begin
  Result := FList[AIndex] as IItemCaracteristicaProduto;
end;

function TItemCaracteristicaProdutoList.GetReference: TItemCaracteristicaProdutoList;
begin
  Result := Self;
end;

procedure TItemCaracteristicaProdutoList.SetItems(AIndex: Integer; const Value: IItemCaracteristicaProduto);
begin
  FList[AIndex] := Value;
end;

{ TItemCaracteristicaProdutoListEnumerator }

constructor TItemCaracteristicaProdutoListEnumerator.Create(AItemCaracteristicaProdutoList: TItemCaracteristicaProdutoList);
begin
  inherited Create;
  FIndex := -1;
  FItemCaracteristicaProdutoList := AItemCaracteristicaProdutoList;
end;

function TItemCaracteristicaProdutoListEnumerator.GetCurrent: IItemCaracteristicaProduto;
begin
  Result := FItemCaracteristicaProdutoList[FIndex];
end;

function TItemCaracteristicaProdutoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FItemCaracteristicaProdutoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TItemCaracteristicaProdutoListRec }

class function TItemCaracteristicaProdutoListRec.Create(const AList: IItemCaracteristicaProdutoList): TItemCaracteristicaProdutoListRec;
begin
  FillChar(Result, SizeOf(TItemCaracteristicaProdutoListRec), 0);
  Result.FList := AList;
end;

class operator TItemCaracteristicaProdutoListRec.Implicit(AListRec: TItemCaracteristicaProdutoListRec): TItemCaracteristicaProdutoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TItemCaracteristicaProduto }

function TItemCaracteristicaProduto.GetId: Int64;
begin
  Result := FId;
end;

procedure TItemCaracteristicaProduto.SetId(const AId: Int64);
begin
  FId := AId;
end;


end.
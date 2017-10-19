unit SDK.Model.RegimeEstadualProduto;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IRegimeEstadualProduto = interface(IModel)
    ['{CC3948AC-235F-4DD7-B5CC-53D7C8081AF6}']
    function GetId: Variant;
    procedure SetId(const AId: Variant);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetRegimeEstadualId: Int64;
    procedure SetRegimeEstadualId(const ARegimeEstadualId: Int64);
    property Id: Variant read GetId write SetId;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property RegimeEstadualId: Int64 read GetRegimeEstadualId write SetRegimeEstadualId;
  end;

  TRegimeEstadualProdutoList = class;

  IRegimeEstadualProdutoList = interface
	['{A4BC7BAA-A461-470E-A4D1-C6A6F9A99E9D}']
    function GetReference: TRegimeEstadualProdutoList;
    function GetItems(AIndex: Integer): IRegimeEstadualProduto;
    procedure SetItems(AIndex: Integer; const Value: IRegimeEstadualProduto);
    procedure Add(const ARegimeEstadualProduto: IRegimeEstadualProduto);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IRegimeEstadualProduto read GetItems write SetItems; default;
  end;

  TRegimeEstadualProdutoListEnumerator = class
  private
    FIndex: Integer;
    FRegimeEstadualProdutoList: TRegimeEstadualProdutoList;
  public
    constructor Create(ARegimeEstadualProdutoList: TRegimeEstadualProdutoList);
    function GetCurrent: IRegimeEstadualProduto; inline;
    function MoveNext: Boolean;
    property Current: IRegimeEstadualProduto read GetCurrent;
  end;

  TRegimeEstadualProdutoList = class(TInterfacedObject, IRegimeEstadualProdutoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IRegimeEstadualProduto;
    procedure SetItems(AIndex: Integer; const Value: IRegimeEstadualProduto);
  public
    constructor Create;
    procedure Add(const ARegimeEstadualProduto: IRegimeEstadualProduto);
    destructor Destroy; override;
    function GetEnumerator: TRegimeEstadualProdutoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TRegimeEstadualProdutoList;
    property Items[AIndex: Integer]: IRegimeEstadualProduto read GetItems write SetItems; default;
  end;

  TRegimeEstadualProdutoListRec = record
  private
    FList: IRegimeEstadualProdutoList;
  public
    class function Create(const AList: IRegimeEstadualProdutoList): TRegimeEstadualProdutoListRec; static;
    class operator Implicit(AListRec: TRegimeEstadualProdutoListRec): TRegimeEstadualProdutoList;
  end;

  TRegimeEstadualProduto = class(TInterfacedModel, IRegimeEstadualProduto)
  private
	FId: Variant;
	FLojaId: Int64;
	FRegimeEstadualId: Int64;
    function GetId: Variant;
    procedure SetId(const AId: Variant);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetRegimeEstadualId: Int64;
    procedure SetRegimeEstadualId(const ARegimeEstadualId: Int64);
  published
    property Id: Variant read GetId write SetId;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property RegimeEstadualId: Int64 read GetRegimeEstadualId write SetRegimeEstadualId;
  end;

implementation

{ TRegimeEstadualProdutoList }

procedure TRegimeEstadualProdutoList.Add(const ARegimeEstadualProduto: IRegimeEstadualProduto);
begin
  FList.Add(ARegimeEstadualProduto);
end;

procedure TRegimeEstadualProdutoList.Clear;
begin
  FList.Clear;
end;

function TRegimeEstadualProdutoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TRegimeEstadualProdutoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TRegimeEstadualProdutoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TRegimeEstadualProdutoList.GetEnumerator: TRegimeEstadualProdutoListEnumerator;
begin
  Result := TRegimeEstadualProdutoListEnumerator.Create(Self);
end;

function TRegimeEstadualProdutoList.GetItems(AIndex: Integer): IRegimeEstadualProduto;
begin
  Result := FList[AIndex] as IRegimeEstadualProduto;
end;

function TRegimeEstadualProdutoList.GetReference: TRegimeEstadualProdutoList;
begin
  Result := Self;
end;

procedure TRegimeEstadualProdutoList.SetItems(AIndex: Integer; const Value: IRegimeEstadualProduto);
begin
  FList[AIndex] := Value;
end;

{ TRegimeEstadualProdutoListEnumerator }

constructor TRegimeEstadualProdutoListEnumerator.Create(ARegimeEstadualProdutoList: TRegimeEstadualProdutoList);
begin
  inherited Create;
  FIndex := -1;
  FRegimeEstadualProdutoList := ARegimeEstadualProdutoList;
end;

function TRegimeEstadualProdutoListEnumerator.GetCurrent: IRegimeEstadualProduto;
begin
  Result := FRegimeEstadualProdutoList[FIndex];
end;

function TRegimeEstadualProdutoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FRegimeEstadualProdutoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TRegimeEstadualProdutoListRec }

class function TRegimeEstadualProdutoListRec.Create(const AList: IRegimeEstadualProdutoList): TRegimeEstadualProdutoListRec;
begin
  FillChar(Result, SizeOf(TRegimeEstadualProdutoListRec), 0);
  Result.FList := AList;
end;

class operator TRegimeEstadualProdutoListRec.Implicit(AListRec: TRegimeEstadualProdutoListRec): TRegimeEstadualProdutoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TRegimeEstadualProduto }

function TRegimeEstadualProduto.GetId: Variant;
begin
  Result := FId;
end;

procedure TRegimeEstadualProduto.SetId(const AId: Variant);
begin
  FId := AId;
end;

function TRegimeEstadualProduto.GetLojaId: Int64;
begin
  Result := FLojaId;
end;

procedure TRegimeEstadualProduto.SetLojaId(const ALojaId: Int64);
begin
  FLojaId := ALojaId;
end;

function TRegimeEstadualProduto.GetRegimeEstadualId: Int64;
begin
  Result := FRegimeEstadualId;
end;

procedure TRegimeEstadualProduto.SetRegimeEstadualId(const ARegimeEstadualId: Int64);
begin
  FRegimeEstadualId := ARegimeEstadualId;
end;


end.
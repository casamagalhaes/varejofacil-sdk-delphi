unit SDK.Model.LocalEstoque;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ILocalEstoque = interface(IModel)
    ['{03FC91BA-4E1C-4D4E-A548-5AA8EB698CF9}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetBloqueio: Boolean;
    procedure SetBloqueio(const ABloqueio: Boolean);
    function GetTipoDeEstoque: TTipoEstoque;
    procedure SetTipoDeEstoque(const ATipoDeEstoque: TTipoEstoque);
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property Bloqueio: Boolean read GetBloqueio write SetBloqueio;
    property TipoDeEstoque: TTipoEstoque read GetTipoDeEstoque write SetTipoDeEstoque;
  end;

  TLocalEstoqueList = class;

  ILocalEstoqueList = interface
	['{0BCCCE0F-114F-4F2B-9D0E-7FF4252F92A8}']
    function GetReference: TLocalEstoqueList;
    function GetItems(AIndex: Integer): ILocalEstoque;
    procedure SetItems(AIndex: Integer; const Value: ILocalEstoque);
    procedure Add(const ALocalEstoque: ILocalEstoque);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ILocalEstoque read GetItems write SetItems; default;
  end;

  TLocalEstoqueListEnumerator = class
  private
    FIndex: Integer;
    FLocalEstoqueList: TLocalEstoqueList;
  public
    constructor Create(ALocalEstoqueList: TLocalEstoqueList);
    function GetCurrent: ILocalEstoque; inline;
    function MoveNext: Boolean;
    property Current: ILocalEstoque read GetCurrent;
  end;

  TLocalEstoqueList = class(TInterfacedObject, ILocalEstoqueList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ILocalEstoque;
    procedure SetItems(AIndex: Integer; const Value: ILocalEstoque);
  public
    constructor Create;
    procedure Add(const ALocalEstoque: ILocalEstoque);
    destructor Destroy; override;
    function GetEnumerator: TLocalEstoqueListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TLocalEstoqueList;
    property Items[AIndex: Integer]: ILocalEstoque read GetItems write SetItems; default;
  end;

  TLocalEstoqueListRec = record
  private
    FList: ILocalEstoqueList;
  public
    class function Create(const AList: ILocalEstoqueList): TLocalEstoqueListRec; static;
    class operator Implicit(AListRec: TLocalEstoqueListRec): TLocalEstoqueList;
  end;

  TLocalEstoque = class(TInterfacedModel, ILocalEstoque)
  private
	FId: Int64;
	FDescricao: TString;
	FBloqueio: Boolean;
	FTipoDeEstoque: TTipoEstoque;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetBloqueio: Boolean;
    procedure SetBloqueio(const ABloqueio: Boolean);
    function GetTipoDeEstoque: TTipoEstoque;
    procedure SetTipoDeEstoque(const ATipoDeEstoque: TTipoEstoque);
  published
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property Bloqueio: Boolean read GetBloqueio write SetBloqueio;
    property TipoDeEstoque: TTipoEstoque read GetTipoDeEstoque write SetTipoDeEstoque;
  end;

implementation

{ TLocalEstoqueList }

procedure TLocalEstoqueList.Add(const ALocalEstoque: ILocalEstoque);
begin
  FList.Add(ALocalEstoque);
end;

procedure TLocalEstoqueList.Clear;
begin
  FList.Clear;
end;

function TLocalEstoqueList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TLocalEstoqueList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TLocalEstoqueList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TLocalEstoqueList.GetEnumerator: TLocalEstoqueListEnumerator;
begin
  Result := TLocalEstoqueListEnumerator.Create(Self);
end;

function TLocalEstoqueList.GetItems(AIndex: Integer): ILocalEstoque;
begin
  Result := FList[AIndex] as ILocalEstoque;
end;

function TLocalEstoqueList.GetReference: TLocalEstoqueList;
begin
  Result := Self;
end;

procedure TLocalEstoqueList.SetItems(AIndex: Integer; const Value: ILocalEstoque);
begin
  FList[AIndex] := Value;
end;

{ TLocalEstoqueListEnumerator }

constructor TLocalEstoqueListEnumerator.Create(ALocalEstoqueList: TLocalEstoqueList);
begin
  inherited Create;
  FIndex := -1;
  FLocalEstoqueList := ALocalEstoqueList;
end;

function TLocalEstoqueListEnumerator.GetCurrent: ILocalEstoque;
begin
  Result := FLocalEstoqueList[FIndex];
end;

function TLocalEstoqueListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FLocalEstoqueList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TLocalEstoqueListRec }

class function TLocalEstoqueListRec.Create(const AList: ILocalEstoqueList): TLocalEstoqueListRec;
begin
  FillChar(Result, SizeOf(TLocalEstoqueListRec), 0);
  Result.FList := AList;
end;

class operator TLocalEstoqueListRec.Implicit(AListRec: TLocalEstoqueListRec): TLocalEstoqueList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TLocalEstoque }

function TLocalEstoque.GetId: Int64;
begin
  Result := FId;
end;

procedure TLocalEstoque.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TLocalEstoque.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TLocalEstoque.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

function TLocalEstoque.GetBloqueio: Boolean;
begin
  Result := FBloqueio;
end;

procedure TLocalEstoque.SetBloqueio(const ABloqueio: Boolean);
begin
  FBloqueio := ABloqueio;
end;

function TLocalEstoque.GetTipoDeEstoque: TTipoEstoque;
begin
  Result := FTipoDeEstoque;
end;

procedure TLocalEstoque.SetTipoDeEstoque(const ATipoDeEstoque: TTipoEstoque);
begin
  FTipoDeEstoque := ATipoDeEstoque;
end;


end.
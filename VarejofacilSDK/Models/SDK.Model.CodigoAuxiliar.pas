﻿unit SDK.Model.CodigoAuxiliar;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ICodigoAuxiliar = interface(IModel)
    ['{06F1D624-1120-481B-AB83-FC94D5DC399F}']
    function GetId: TString;
    procedure SetId(const AId: TString);
    function GetTipo: TTipoProdutoAuxiliar;
    procedure SetTipo(const ATipo: TTipoProdutoAuxiliar);
    function GetFator: Double;
    procedure SetFator(const AFator: Double);
    function GetProdutoId: Variant;
    procedure SetProdutoId(const AProdutoId: Variant);
    property Id: TString read GetId write SetId;
    property Tipo: TTipoProdutoAuxiliar read GetTipo write SetTipo;
    property Fator: Double read GetFator write SetFator;
    property ProdutoId: Variant read GetProdutoId write SetProdutoId;
  end;

  TCodigoAuxiliarList = class;

  ICodigoAuxiliarList = interface
	['{54C7E8AA-5553-46EF-8B52-44B8A2B251D9}']
    function GetReference: TCodigoAuxiliarList;
    function GetItems(AIndex: Integer): ICodigoAuxiliar;
    procedure SetItems(AIndex: Integer; const Value: ICodigoAuxiliar);
    procedure Add(const ACodigoAuxiliar: ICodigoAuxiliar);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ICodigoAuxiliar read GetItems write SetItems; default;
  end;

  TCodigoAuxiliarListEnumerator = class
  private
    FIndex: Integer;
    FCodigoAuxiliarList: TCodigoAuxiliarList;
  public
    constructor Create(ACodigoAuxiliarList: TCodigoAuxiliarList);
    function GetCurrent: ICodigoAuxiliar; inline;
    function MoveNext: Boolean;
    property Current: ICodigoAuxiliar read GetCurrent;
  end;

  TCodigoAuxiliarList = class(TInterfacedObject, ICodigoAuxiliarList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ICodigoAuxiliar;
    procedure SetItems(AIndex: Integer; const Value: ICodigoAuxiliar);
  public
    constructor Create;
    procedure Add(const ACodigoAuxiliar: ICodigoAuxiliar);
    destructor Destroy; override;
    function GetEnumerator: TCodigoAuxiliarListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TCodigoAuxiliarList;
    property Items[AIndex: Integer]: ICodigoAuxiliar read GetItems write SetItems; default;
  end;

  TCodigoAuxiliarListChanges = class
  private
    FListAlterados: TCodigoAuxiliarList;
    FListIdRemovidos: TStrings;
    function GetListAlterados: TCodigoAuxiliarList;
    function GetListIdRemovidos: TStrings;
    procedure SetListAlterados(const Value: TCodigoAuxiliarList);
    procedure SetListIdRemovidos(const Value: TStrings);
  public
    destructor Destroy; override;
    constructor Create;
    property ListAlterados: TCodigoAuxiliarList read GetListAlterados write SetListAlterados;
    property ListIdRemovidos: TStrings read GetListIdRemovidos write SetListIdRemovidos;
  end;


  TCodigoAuxiliarListRec = record
  private
    FList: ICodigoAuxiliarList;
  public
    class function Create(const AList: ICodigoAuxiliarList): TCodigoAuxiliarListRec; static;
    class operator Implicit(AListRec: TCodigoAuxiliarListRec): TCodigoAuxiliarList;
  end;

  TCodigoAuxiliar = class(TInterfacedModel, ICodigoAuxiliar)
  private
	FId: TString;
	FTipo: TTipoProdutoAuxiliar;
	FFator: Double;
	FProdutoId: Variant;
    function GetId: TString;
    procedure SetId(const AId: TString);
    function GetTipo: TTipoProdutoAuxiliar;
    procedure SetTipo(const ATipo: TTipoProdutoAuxiliar);
    function GetFator: Double;
    procedure SetFator(const AFator: Double);
    function GetProdutoId: Variant;
    procedure SetProdutoId(const AProdutoId: Variant);
  published
    property Id: TString read GetId write SetId;
    property Tipo: TTipoProdutoAuxiliar read GetTipo write SetTipo;
    property Fator: Double read GetFator write SetFator;
    property ProdutoId: Variant read GetProdutoId write SetProdutoId;
  end;

implementation

{ TCodigoAuxiliarList }

procedure TCodigoAuxiliarList.Add(const ACodigoAuxiliar: ICodigoAuxiliar);
begin
  FList.Add(ACodigoAuxiliar);
end;

procedure TCodigoAuxiliarList.Clear;
begin
  FList.Clear;
end;

function TCodigoAuxiliarList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TCodigoAuxiliarList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TCodigoAuxiliarList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TCodigoAuxiliarList.GetEnumerator: TCodigoAuxiliarListEnumerator;
begin
  Result := TCodigoAuxiliarListEnumerator.Create(Self);
end;

function TCodigoAuxiliarList.GetItems(AIndex: Integer): ICodigoAuxiliar;
begin
  Result := FList[AIndex] as ICodigoAuxiliar;
end;

function TCodigoAuxiliarList.GetReference: TCodigoAuxiliarList;
begin
  Result := Self;
end;

procedure TCodigoAuxiliarList.SetItems(AIndex: Integer; const Value: ICodigoAuxiliar);
begin
  FList[AIndex] := Value;
end;

{ TCodigoAuxiliarListEnumerator }

constructor TCodigoAuxiliarListEnumerator.Create(ACodigoAuxiliarList: TCodigoAuxiliarList);
begin
  inherited Create;
  FIndex := -1;
  FCodigoAuxiliarList := ACodigoAuxiliarList;
end;

function TCodigoAuxiliarListEnumerator.GetCurrent: ICodigoAuxiliar;
begin
  Result := FCodigoAuxiliarList[FIndex];
end;

function TCodigoAuxiliarListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FCodigoAuxiliarList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TCodigoAuxiliarListRec }

class function TCodigoAuxiliarListRec.Create(const AList: ICodigoAuxiliarList): TCodigoAuxiliarListRec;
begin
  FillChar(Result, SizeOf(TCodigoAuxiliarListRec), 0);
  Result.FList := AList;
end;

class operator TCodigoAuxiliarListRec.Implicit(AListRec: TCodigoAuxiliarListRec): TCodigoAuxiliarList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TCodigoAuxiliar }

function TCodigoAuxiliar.GetId: TString;
begin
  Result := FId;
end;

procedure TCodigoAuxiliar.SetId(const AId: TString);
begin
  FId := AId;
end;

function TCodigoAuxiliar.GetTipo: TTipoProdutoAuxiliar;
begin
  Result := FTipo;
end;

procedure TCodigoAuxiliar.SetTipo(const ATipo: TTipoProdutoAuxiliar);
begin
  FTipo := ATipo;
end;

function TCodigoAuxiliar.GetFator: Double;
begin
  Result := FFator;
end;

procedure TCodigoAuxiliar.SetFator(const AFator: Double);
begin
  FFator := AFator;
end;

function TCodigoAuxiliar.GetProdutoId: Variant;
begin
  Result := FProdutoId;
end;

procedure TCodigoAuxiliar.SetProdutoId(const AProdutoId: Variant);
begin
  FProdutoId := AProdutoId;
end;


{ TCodigoAuxiliarListChanges }

constructor TCodigoAuxiliarListChanges.Create;
begin
  FListAlterados := TCodigoAuxiliarList.Create;
  FListIdRemovidos := TStringList.Create;
end;

destructor TCodigoAuxiliarListChanges.Destroy;
begin
  FreeAndNil(FListAlterados);
  FreeAndNil(FListIdRemovidos);
  inherited;
end;

function TCodigoAuxiliarListChanges.GetListAlterados: TCodigoAuxiliarList;
begin
  Result := FListAlterados;
end;

function TCodigoAuxiliarListChanges.GetListIdRemovidos: TStrings;
begin
  Result := FListIdRemovidos;
end;

procedure TCodigoAuxiliarListChanges.SetListAlterados(
  const Value: TCodigoAuxiliarList);
begin
  FListAlterados := Value;
end;

procedure TCodigoAuxiliarListChanges.SetListIdRemovidos(const Value: TStrings);
begin
  FListIdRemovidos := Value;
end;

end.
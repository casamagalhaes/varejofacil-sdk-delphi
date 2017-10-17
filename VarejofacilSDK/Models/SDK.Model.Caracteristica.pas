unit SDK.Model.Caracteristica;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ICaracteristica = interface(IModel)
    ['{0CEEB4DC-3091-459F-B0CB-FBF49B4917AF}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
  end;

  TCaracteristicaList = class;

  ICaracteristicaList = interface
	['{863DA714-9AEE-4E0F-B723-A76832D52514}']
    function GetReference: TCaracteristicaList;
    function GetItems(AIndex: Integer): ICaracteristica;
    procedure SetItems(AIndex: Integer; const Value: ICaracteristica);
    procedure Add(const ACaracteristica: ICaracteristica);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ICaracteristica read GetItems write SetItems; default;
  end;

  TCaracteristicaListEnumerator = class
  private
    FIndex: Integer;
    FCaracteristicaList: TCaracteristicaList;
  public
    constructor Create(ACaracteristicaList: TCaracteristicaList);
    function GetCurrent: ICaracteristica; inline;
    function MoveNext: Boolean;
    property Current: ICaracteristica read GetCurrent;
  end;

  TCaracteristicaList = class(TInterfacedObject, ICaracteristicaList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ICaracteristica;
    procedure SetItems(AIndex: Integer; const Value: ICaracteristica);
  public
    constructor Create;
    procedure Add(const ACaracteristica: ICaracteristica);
    destructor Destroy; override;
    function GetEnumerator: TCaracteristicaListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TCaracteristicaList;
    property Items[AIndex: Integer]: ICaracteristica read GetItems write SetItems; default;
  end;

  TCaracteristicaListRec = record
  private
    FList: ICaracteristicaList;
  public
    class function Create(const AList: ICaracteristicaList): TCaracteristicaListRec; static;
    class operator Implicit(AListRec: TCaracteristicaListRec): TCaracteristicaList;
  end;

  TCaracteristica = class(TInterfacedModel, ICaracteristica)
  private
	FId: Int64;
	FDescricao: TString;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
  published
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
  end;

implementation

{ TCaracteristicaList }

procedure TCaracteristicaList.Add(const ACaracteristica: ICaracteristica);
begin
  FList.Add(ACaracteristica);
end;

procedure TCaracteristicaList.Clear;
begin
  FList.Clear;
end;

function TCaracteristicaList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TCaracteristicaList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TCaracteristicaList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TCaracteristicaList.GetEnumerator: TCaracteristicaListEnumerator;
begin
  Result := TCaracteristicaListEnumerator.Create(Self);
end;

function TCaracteristicaList.GetItems(AIndex: Integer): ICaracteristica;
begin
  Result := FList[AIndex] as ICaracteristica;
end;

function TCaracteristicaList.GetReference: TCaracteristicaList;
begin
  Result := Self;
end;

procedure TCaracteristicaList.SetItems(AIndex: Integer; const Value: ICaracteristica);
begin
  FList[AIndex] := Value;
end;

{ TCaracteristicaListEnumerator }

constructor TCaracteristicaListEnumerator.Create(ACaracteristicaList: TCaracteristicaList);
begin
  inherited Create;
  FIndex := -1;
  FCaracteristicaList := ACaracteristicaList;
end;

function TCaracteristicaListEnumerator.GetCurrent: ICaracteristica;
begin
  Result := FCaracteristicaList[FIndex];
end;

function TCaracteristicaListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FCaracteristicaList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TCaracteristicaListRec }

class function TCaracteristicaListRec.Create(const AList: ICaracteristicaList): TCaracteristicaListRec;
begin
  FillChar(Result, SizeOf(TCaracteristicaListRec), 0);
  Result.FList := AList;
end;

class operator TCaracteristicaListRec.Implicit(AListRec: TCaracteristicaListRec): TCaracteristicaList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TCaracteristica }

function TCaracteristica.GetId: Int64;
begin
  Result := FId;
end;

procedure TCaracteristica.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TCaracteristica.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TCaracteristica.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;


end.
unit SDK.Model.ItemSangria;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IItemSangria = interface(IModel)
    ['{CA31753A-7E91-4ED4-84DD-D8A2407B49C5}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetOperadorId: Integer;
    procedure SetOperadorId(const AOperadorId: Integer);
    function GetAutorizadorId: Integer;
    procedure SetAutorizadorId(const AAutorizadorId: Integer);
    function GetConciliadorId: Integer;
    procedure SetConciliadorId(const AConciliadorId: Integer);
    function GetFinalizadoraId: Integer;
    procedure SetFinalizadoraId(const AFinalizadoraId: Integer);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
    function GetStatus: TString;
    procedure SetStatus(const AStatus: TString);
    property Id: Int64 read GetId write SetId;
    property OperadorId: Integer read GetOperadorId write SetOperadorId;
    property AutorizadorId: Integer read GetAutorizadorId write SetAutorizadorId;
    property ConciliadorId: Integer read GetConciliadorId write SetConciliadorId;
    property FinalizadoraId: Integer read GetFinalizadoraId write SetFinalizadoraId;
    property Valor: Double read GetValor write SetValor;
    property Status: TString read GetStatus write SetStatus;
  end;

  TItemSangriaList = class;

  IItemSangriaList = interface
	['{6A6E2E52-CB4D-4961-A422-24729302D724}']
    function GetReference: TItemSangriaList;
    function GetItems(AIndex: Integer): IItemSangria;
    procedure SetItems(AIndex: Integer; const Value: IItemSangria);
    procedure Add(const AItemSangria: IItemSangria);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IItemSangria read GetItems write SetItems; default;
  end;

  TItemSangriaListEnumerator = class
  private
    FIndex: Integer;
    FItemSangriaList: TItemSangriaList;
  public
    constructor Create(AItemSangriaList: TItemSangriaList);
    function GetCurrent: IItemSangria; inline;
    function MoveNext: Boolean;
    property Current: IItemSangria read GetCurrent;
  end;

  TItemSangriaList = class(TInterfacedObject, IItemSangriaList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IItemSangria;
    procedure SetItems(AIndex: Integer; const Value: IItemSangria);
  public
    constructor Create;
    procedure Add(const AItemSangria: IItemSangria);
    destructor Destroy; override;
    function GetEnumerator: TItemSangriaListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TItemSangriaList;
    property Items[AIndex: Integer]: IItemSangria read GetItems write SetItems; default;
  end;

  TItemSangriaListRec = record
  private
    FList: IItemSangriaList;
  public
    class function Create(const AList: IItemSangriaList): TItemSangriaListRec; static;
    class operator Implicit(AListRec: TItemSangriaListRec): TItemSangriaList;
  end;

  TItemSangria = class(TInterfacedModel, IItemSangria)
  private
	FId: Int64;
	FOperadorId: Integer;
	FAutorizadorId: Integer;
	FConciliadorId: Integer;
	FFinalizadoraId: Integer;
	FValor: Double;
	FStatus: TString;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetOperadorId: Integer;
    procedure SetOperadorId(const AOperadorId: Integer);
    function GetAutorizadorId: Integer;
    procedure SetAutorizadorId(const AAutorizadorId: Integer);
    function GetConciliadorId: Integer;
    procedure SetConciliadorId(const AConciliadorId: Integer);
    function GetFinalizadoraId: Integer;
    procedure SetFinalizadoraId(const AFinalizadoraId: Integer);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
    function GetStatus: TString;
    procedure SetStatus(const AStatus: TString);
  published
    property Id: Int64 read GetId write SetId;
    property OperadorId: Integer read GetOperadorId write SetOperadorId;
    property AutorizadorId: Integer read GetAutorizadorId write SetAutorizadorId;
    property ConciliadorId: Integer read GetConciliadorId write SetConciliadorId;
    property FinalizadoraId: Integer read GetFinalizadoraId write SetFinalizadoraId;
    property Valor: Double read GetValor write SetValor;
    property Status: TString read GetStatus write SetStatus;
  end;

implementation

{ TItemSangriaList }

procedure TItemSangriaList.Add(const AItemSangria: IItemSangria);
begin
  FList.Add(AItemSangria);
end;

procedure TItemSangriaList.Clear;
begin
  FList.Clear;
end;

function TItemSangriaList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TItemSangriaList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TItemSangriaList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TItemSangriaList.GetEnumerator: TItemSangriaListEnumerator;
begin
  Result := TItemSangriaListEnumerator.Create(Self);
end;

function TItemSangriaList.GetItems(AIndex: Integer): IItemSangria;
begin
  Result := FList[AIndex] as IItemSangria;
end;

function TItemSangriaList.GetReference: TItemSangriaList;
begin
  Result := Self;
end;

procedure TItemSangriaList.SetItems(AIndex: Integer; const Value: IItemSangria);
begin
  FList[AIndex] := Value;
end;

{ TItemSangriaListEnumerator }

constructor TItemSangriaListEnumerator.Create(AItemSangriaList: TItemSangriaList);
begin
  inherited Create;
  FIndex := -1;
  FItemSangriaList := AItemSangriaList;
end;

function TItemSangriaListEnumerator.GetCurrent: IItemSangria;
begin
  Result := FItemSangriaList[FIndex];
end;

function TItemSangriaListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FItemSangriaList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TItemSangriaListRec }

class function TItemSangriaListRec.Create(const AList: IItemSangriaList): TItemSangriaListRec;
begin
  FillChar(Result, SizeOf(TItemSangriaListRec), 0);
  Result.FList := AList;
end;

class operator TItemSangriaListRec.Implicit(AListRec: TItemSangriaListRec): TItemSangriaList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TItemSangria }

function TItemSangria.GetId: Int64;
begin
  Result := FId;
end;

procedure TItemSangria.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TItemSangria.GetOperadorId: Integer;
begin
  Result := FOperadorId;
end;

procedure TItemSangria.SetOperadorId(const AOperadorId: Integer);
begin
  FOperadorId := AOperadorId;
end;

function TItemSangria.GetAutorizadorId: Integer;
begin
  Result := FAutorizadorId;
end;

procedure TItemSangria.SetAutorizadorId(const AAutorizadorId: Integer);
begin
  FAutorizadorId := AAutorizadorId;
end;

function TItemSangria.GetConciliadorId: Integer;
begin
  Result := FConciliadorId;
end;

procedure TItemSangria.SetConciliadorId(const AConciliadorId: Integer);
begin
  FConciliadorId := AConciliadorId;
end;

function TItemSangria.GetFinalizadoraId: Integer;
begin
  Result := FFinalizadoraId;
end;

procedure TItemSangria.SetFinalizadoraId(const AFinalizadoraId: Integer);
begin
  FFinalizadoraId := AFinalizadoraId;
end;

function TItemSangria.GetValor: Double;
begin
  Result := FValor;
end;

procedure TItemSangria.SetValor(const AValor: Double);
begin
  FValor := AValor;
end;

function TItemSangria.GetStatus: TString;
begin
  Result := FStatus;
end;

procedure TItemSangria.SetStatus(const AStatus: TString);
begin
  FStatus := AStatus;
end;


end.
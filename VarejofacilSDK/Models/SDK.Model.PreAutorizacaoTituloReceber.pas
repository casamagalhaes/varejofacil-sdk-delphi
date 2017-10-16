unit SDK.Model.PreAutorizacaoTituloReceber;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IPreAutorizacaoTituloReceber = interface(IModel)
    ['{6AFC573F-3790-4E99-88D4-A5F8EF7467BC}']
    function GetOrdem: Integer;
    procedure SetOrdem(const AOrdem: Integer);
    function GetVencimento: TDateTime;
    procedure SetVencimento(const AVencimento: TDateTime);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
    property Ordem: Integer read GetOrdem write SetOrdem;
    property Vencimento: TDateTime read GetVencimento write SetVencimento;
    property Valor: Double read GetValor write SetValor;
  end;

  TPreAutorizacaoTituloReceberList = class;

  IPreAutorizacaoTituloReceberList = interface
	['{E452E655-86D6-40FD-9657-0731CB408533}']
    function GetReference: TPreAutorizacaoTituloReceberList;
    function GetItems(AIndex: Integer): IPreAutorizacaoTituloReceber;
    procedure SetItems(AIndex: Integer; const Value: IPreAutorizacaoTituloReceber);
    procedure Add(const APreAutorizacaoTituloReceber: IPreAutorizacaoTituloReceber);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IPreAutorizacaoTituloReceber read GetItems write SetItems; default;
  end;

  TPreAutorizacaoTituloReceberListEnumerator = class
  private
    FIndex: Integer;
    FPreAutorizacaoTituloReceberList: TPreAutorizacaoTituloReceberList;
  public
    constructor Create(APreAutorizacaoTituloReceberList: TPreAutorizacaoTituloReceberList);
    function GetCurrent: IPreAutorizacaoTituloReceber; inline;
    function MoveNext: Boolean;
    property Current: IPreAutorizacaoTituloReceber read GetCurrent;
  end;

  TPreAutorizacaoTituloReceberList = class(TInterfacedObject, IPreAutorizacaoTituloReceberList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IPreAutorizacaoTituloReceber;
    procedure SetItems(AIndex: Integer; const Value: IPreAutorizacaoTituloReceber);
  public
    constructor Create;
    procedure Add(const APreAutorizacaoTituloReceber: IPreAutorizacaoTituloReceber);
    destructor Destroy; override;
    function GetEnumerator: TPreAutorizacaoTituloReceberListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TPreAutorizacaoTituloReceberList;
    property Items[AIndex: Integer]: IPreAutorizacaoTituloReceber read GetItems write SetItems; default;
  end;

  TPreAutorizacaoTituloReceberListRec = record
  private
    FList: IPreAutorizacaoTituloReceberList;
  public
    class function Create(const AList: IPreAutorizacaoTituloReceberList): TPreAutorizacaoTituloReceberListRec; static;
    class operator Implicit(AListRec: TPreAutorizacaoTituloReceberListRec): TPreAutorizacaoTituloReceberList;
  end;

  TPreAutorizacaoTituloReceber = class(TInterfacedModel, IPreAutorizacaoTituloReceber)
  private
	FOrdem: Integer;
	FVencimento: TDateTime;
	FValor: Double;
    function GetOrdem: Integer;
    procedure SetOrdem(const AOrdem: Integer);
    function GetVencimento: TDateTime;
    procedure SetVencimento(const AVencimento: TDateTime);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
  public
    property Ordem: Integer read GetOrdem write SetOrdem;
    property Vencimento: TDateTime read GetVencimento write SetVencimento;
    property Valor: Double read GetValor write SetValor;
  end;

implementation

{ TPreAutorizacaoTituloReceberList }

procedure TPreAutorizacaoTituloReceberList.Add(const APreAutorizacaoTituloReceber: IPreAutorizacaoTituloReceber);
begin
  FList.Add(APreAutorizacaoTituloReceber);
end;

procedure TPreAutorizacaoTituloReceberList.Clear;
begin
  FList.Clear;
end;

function TPreAutorizacaoTituloReceberList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TPreAutorizacaoTituloReceberList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TPreAutorizacaoTituloReceberList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TPreAutorizacaoTituloReceberList.GetEnumerator: TPreAutorizacaoTituloReceberListEnumerator;
begin
  Result := TPreAutorizacaoTituloReceberListEnumerator.Create(Self);
end;

function TPreAutorizacaoTituloReceberList.GetItems(AIndex: Integer): IPreAutorizacaoTituloReceber;
begin
  Result := FList[AIndex] as IPreAutorizacaoTituloReceber;
end;

function TPreAutorizacaoTituloReceberList.GetReference: TPreAutorizacaoTituloReceberList;
begin
  Result := Self;
end;

procedure TPreAutorizacaoTituloReceberList.SetItems(AIndex: Integer; const Value: IPreAutorizacaoTituloReceber);
begin
  FList[AIndex] := Value;
end;

{ TPreAutorizacaoTituloReceberListEnumerator }

constructor TPreAutorizacaoTituloReceberListEnumerator.Create(APreAutorizacaoTituloReceberList: TPreAutorizacaoTituloReceberList);
begin
  inherited Create;
  FIndex := -1;
  FPreAutorizacaoTituloReceberList := APreAutorizacaoTituloReceberList;
end;

function TPreAutorizacaoTituloReceberListEnumerator.GetCurrent: IPreAutorizacaoTituloReceber;
begin
  Result := FPreAutorizacaoTituloReceberList[FIndex];
end;

function TPreAutorizacaoTituloReceberListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FPreAutorizacaoTituloReceberList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TPreAutorizacaoTituloReceberListRec }

class function TPreAutorizacaoTituloReceberListRec.Create(const AList: IPreAutorizacaoTituloReceberList): TPreAutorizacaoTituloReceberListRec;
begin
  FillChar(Result, SizeOf(TPreAutorizacaoTituloReceberListRec), 0);
  Result.FList := AList;
end;

class operator TPreAutorizacaoTituloReceberListRec.Implicit(AListRec: TPreAutorizacaoTituloReceberListRec): TPreAutorizacaoTituloReceberList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TPreAutorizacaoTituloReceber }

function TPreAutorizacaoTituloReceber.GetOrdem: Integer;
begin
  Result := FOrdem;
end;

procedure TPreAutorizacaoTituloReceber.SetOrdem(const AOrdem: Integer);
begin
  FOrdem := AOrdem;
end;

function TPreAutorizacaoTituloReceber.GetVencimento: TDateTime;
begin
  Result := FVencimento;
end;

procedure TPreAutorizacaoTituloReceber.SetVencimento(const AVencimento: TDateTime);
begin
  FVencimento := AVencimento;
end;

function TPreAutorizacaoTituloReceber.GetValor: Double;
begin
  Result := FValor;
end;

procedure TPreAutorizacaoTituloReceber.SetValor(const AValor: Double);
begin
  FValor := AValor;
end;


end.
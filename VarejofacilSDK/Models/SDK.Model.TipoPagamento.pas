unit SDK.Model.TipoPagamento;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ITipoPagamento = interface(IModel)
    ['{905FD00E-2461-477C-9FCA-52E50682C3EC}']
    function GetId: TString;
    procedure SetId(const AId: TString);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetValorMaximo: Double;
    procedure SetValorMaximo(const AValorMaximo: Double);
    property Id: TString read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property ValorMaximo: Double read GetValorMaximo write SetValorMaximo;
  end;

  TTipoPagamentoList = class;

  ITipoPagamentoList = interface
	['{5C9FCC3A-68F0-4496-95F0-8FACB5BEDCB7}']
    function GetReference: TTipoPagamentoList;
    function GetItems(AIndex: Integer): ITipoPagamento;
    procedure SetItems(AIndex: Integer; const Value: ITipoPagamento);
    procedure Add(const ATipoPagamento: ITipoPagamento);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ITipoPagamento read GetItems write SetItems; default;
  end;

  TTipoPagamentoListEnumerator = class
  private
    FIndex: Integer;
    FTipoPagamentoList: TTipoPagamentoList;
  public
    constructor Create(ATipoPagamentoList: TTipoPagamentoList);
    function GetCurrent: ITipoPagamento; inline;
    function MoveNext: Boolean;
    property Current: ITipoPagamento read GetCurrent;
  end;

  TTipoPagamentoList = class(TInterfacedObject, ITipoPagamentoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ITipoPagamento;
    procedure SetItems(AIndex: Integer; const Value: ITipoPagamento);
  public
    constructor Create;
    procedure Add(const ATipoPagamento: ITipoPagamento);
    destructor Destroy; override;
    function GetEnumerator: TTipoPagamentoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TTipoPagamentoList;
    property Items[AIndex: Integer]: ITipoPagamento read GetItems write SetItems; default;
  end;

  TTipoPagamentoListRec = record
  private
    FList: ITipoPagamentoList;
  public
    class function Create(const AList: ITipoPagamentoList): TTipoPagamentoListRec; static;
    class operator Implicit(AListRec: TTipoPagamentoListRec): TTipoPagamentoList;
  end;

  TTipoPagamento = class(TInterfacedModel, ITipoPagamento)
  private
	FId: TString;
	FDescricao: TString;
	FValorMaximo: Double;
    function GetId: TString;
    procedure SetId(const AId: TString);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetValorMaximo: Double;
    procedure SetValorMaximo(const AValorMaximo: Double);
  published
    property Id: TString read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property ValorMaximo: Double read GetValorMaximo write SetValorMaximo;
  end;

implementation

{ TTipoPagamentoList }

procedure TTipoPagamentoList.Add(const ATipoPagamento: ITipoPagamento);
begin
  FList.Add(ATipoPagamento);
end;

procedure TTipoPagamentoList.Clear;
begin
  FList.Clear;
end;

function TTipoPagamentoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TTipoPagamentoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TTipoPagamentoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TTipoPagamentoList.GetEnumerator: TTipoPagamentoListEnumerator;
begin
  Result := TTipoPagamentoListEnumerator.Create(Self);
end;

function TTipoPagamentoList.GetItems(AIndex: Integer): ITipoPagamento;
begin
  Result := FList[AIndex] as ITipoPagamento;
end;

function TTipoPagamentoList.GetReference: TTipoPagamentoList;
begin
  Result := Self;
end;

procedure TTipoPagamentoList.SetItems(AIndex: Integer; const Value: ITipoPagamento);
begin
  FList[AIndex] := Value;
end;

{ TTipoPagamentoListEnumerator }

constructor TTipoPagamentoListEnumerator.Create(ATipoPagamentoList: TTipoPagamentoList);
begin
  inherited Create;
  FIndex := -1;
  FTipoPagamentoList := ATipoPagamentoList;
end;

function TTipoPagamentoListEnumerator.GetCurrent: ITipoPagamento;
begin
  Result := FTipoPagamentoList[FIndex];
end;

function TTipoPagamentoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FTipoPagamentoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TTipoPagamentoListRec }

class function TTipoPagamentoListRec.Create(const AList: ITipoPagamentoList): TTipoPagamentoListRec;
begin
  FillChar(Result, SizeOf(TTipoPagamentoListRec), 0);
  Result.FList := AList;
end;

class operator TTipoPagamentoListRec.Implicit(AListRec: TTipoPagamentoListRec): TTipoPagamentoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TTipoPagamento }

function TTipoPagamento.GetId: TString;
begin
  Result := FId;
end;

procedure TTipoPagamento.SetId(const AId: TString);
begin
  FId := AId;
end;

function TTipoPagamento.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TTipoPagamento.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

function TTipoPagamento.GetValorMaximo: Double;
begin
  Result := FValorMaximo;
end;

procedure TTipoPagamento.SetValorMaximo(const AValorMaximo: Double);
begin
  FValorMaximo := AValorMaximo;
end;


end.
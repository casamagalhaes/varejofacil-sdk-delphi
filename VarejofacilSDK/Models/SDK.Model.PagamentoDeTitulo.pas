unit SDK.Model.PagamentoDeTitulo;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IPagamentoDeTitulo = interface(IModel)
    ['{DF8E4B7A-9BA3-4C8C-BBF3-B7D571D5DE43}']
    function GetFormaDePagamentoId: Integer;
    procedure SetFormaDePagamentoId(const AFormaDePagamentoId: Integer);
    function GetContaCorrenteId: Int64;
    procedure SetContaCorrenteId(const AContaCorrenteId: Int64);
    function GetValorDoPagamento: Double;
    procedure SetValorDoPagamento(const AValorDoPagamento: Double);
    property FormaDePagamentoId: Integer read GetFormaDePagamentoId write SetFormaDePagamentoId;
    property ContaCorrenteId: Int64 read GetContaCorrenteId write SetContaCorrenteId;
    property ValorDoPagamento: Double read GetValorDoPagamento write SetValorDoPagamento;
  end;

  TPagamentoDeTituloList = class;

  IPagamentoDeTituloList = interface
	['{3F1000FF-D36B-4C56-AA6A-7CD9D083313A}']
    function GetReference: TPagamentoDeTituloList;
    function GetItems(AIndex: Integer): IPagamentoDeTitulo;
    procedure SetItems(AIndex: Integer; const Value: IPagamentoDeTitulo);
    procedure Add(const APagamentoDeTitulo: IPagamentoDeTitulo);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IPagamentoDeTitulo read GetItems write SetItems; default;
  end;

  TPagamentoDeTituloListEnumerator = class
  private
    FIndex: Integer;
    FPagamentoDeTituloList: TPagamentoDeTituloList;
  public
    constructor Create(APagamentoDeTituloList: TPagamentoDeTituloList);
    function GetCurrent: IPagamentoDeTitulo; inline;
    function MoveNext: Boolean;
    property Current: IPagamentoDeTitulo read GetCurrent;
  end;

  TPagamentoDeTituloList = class(TInterfacedObject, IPagamentoDeTituloList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IPagamentoDeTitulo;
    procedure SetItems(AIndex: Integer; const Value: IPagamentoDeTitulo);
  public
    constructor Create;
    procedure Add(const APagamentoDeTitulo: IPagamentoDeTitulo);
    destructor Destroy; override;
    function GetEnumerator: TPagamentoDeTituloListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TPagamentoDeTituloList;
    property Items[AIndex: Integer]: IPagamentoDeTitulo read GetItems write SetItems; default;
  end;

  TPagamentoDeTituloListRec = record
  private
    FList: IPagamentoDeTituloList;
  public
    class function Create(const AList: IPagamentoDeTituloList): TPagamentoDeTituloListRec; static;
    class operator Implicit(AListRec: TPagamentoDeTituloListRec): TPagamentoDeTituloList;
  end;

  TPagamentoDeTitulo = class(TInterfacedModel, IPagamentoDeTitulo)
  private
	FFormaDePagamentoId: Integer;
	FContaCorrenteId: Int64;
	FValorDoPagamento: Double;
    function GetFormaDePagamentoId: Integer;
    procedure SetFormaDePagamentoId(const AFormaDePagamentoId: Integer);
    function GetContaCorrenteId: Int64;
    procedure SetContaCorrenteId(const AContaCorrenteId: Int64);
    function GetValorDoPagamento: Double;
    procedure SetValorDoPagamento(const AValorDoPagamento: Double);
  public
    property FormaDePagamentoId: Integer read GetFormaDePagamentoId write SetFormaDePagamentoId;
    property ContaCorrenteId: Int64 read GetContaCorrenteId write SetContaCorrenteId;
    property ValorDoPagamento: Double read GetValorDoPagamento write SetValorDoPagamento;
  end;

implementation

{ TPagamentoDeTituloList }

procedure TPagamentoDeTituloList.Add(const APagamentoDeTitulo: IPagamentoDeTitulo);
begin
  FList.Add(APagamentoDeTitulo);
end;

procedure TPagamentoDeTituloList.Clear;
begin
  FList.Clear;
end;

function TPagamentoDeTituloList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TPagamentoDeTituloList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TPagamentoDeTituloList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TPagamentoDeTituloList.GetEnumerator: TPagamentoDeTituloListEnumerator;
begin
  Result := TPagamentoDeTituloListEnumerator.Create(Self);
end;

function TPagamentoDeTituloList.GetItems(AIndex: Integer): IPagamentoDeTitulo;
begin
  Result := FList[AIndex] as IPagamentoDeTitulo;
end;

function TPagamentoDeTituloList.GetReference: TPagamentoDeTituloList;
begin
  Result := Self;
end;

procedure TPagamentoDeTituloList.SetItems(AIndex: Integer; const Value: IPagamentoDeTitulo);
begin
  FList[AIndex] := Value;
end;

{ TPagamentoDeTituloListEnumerator }

constructor TPagamentoDeTituloListEnumerator.Create(APagamentoDeTituloList: TPagamentoDeTituloList);
begin
  inherited Create;
  FIndex := -1;
  FPagamentoDeTituloList := APagamentoDeTituloList;
end;

function TPagamentoDeTituloListEnumerator.GetCurrent: IPagamentoDeTitulo;
begin
  Result := FPagamentoDeTituloList[FIndex];
end;

function TPagamentoDeTituloListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FPagamentoDeTituloList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TPagamentoDeTituloListRec }

class function TPagamentoDeTituloListRec.Create(const AList: IPagamentoDeTituloList): TPagamentoDeTituloListRec;
begin
  FillChar(Result, SizeOf(TPagamentoDeTituloListRec), 0);
  Result.FList := AList;
end;

class operator TPagamentoDeTituloListRec.Implicit(AListRec: TPagamentoDeTituloListRec): TPagamentoDeTituloList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TPagamentoDeTitulo }

function TPagamentoDeTitulo.GetFormaDePagamentoId: Integer;
begin
  Result := FFormaDePagamentoId;
end;

procedure TPagamentoDeTitulo.SetFormaDePagamentoId(const AFormaDePagamentoId: Integer);
begin
  FFormaDePagamentoId := AFormaDePagamentoId;
end;

function TPagamentoDeTitulo.GetContaCorrenteId: Int64;
begin
  Result := FContaCorrenteId;
end;

procedure TPagamentoDeTitulo.SetContaCorrenteId(const AContaCorrenteId: Int64);
begin
  FContaCorrenteId := AContaCorrenteId;
end;

function TPagamentoDeTitulo.GetValorDoPagamento: Double;
begin
  Result := FValorDoPagamento;
end;

procedure TPagamentoDeTitulo.SetValorDoPagamento(const AValorDoPagamento: Double);
begin
  FValorDoPagamento := AValorDoPagamento;
end;


end.
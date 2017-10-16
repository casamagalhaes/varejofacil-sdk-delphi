unit SDK.Model.FormaDePagamento;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IFormaDePagamento = interface(IModel)
    ['{267B0164-717D-4576-A090-2722C052E1DB}']
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetEspecieDeDocumentoId: Int64;
    procedure SetEspecieDeDocumentoId(const AEspecieDeDocumentoId: Int64);
    function GetAgenteFinanceiroId: Int64;
    procedure SetAgenteFinanceiroId(const AAgenteFinanceiroId: Int64);
    function GetCategoriaFinanceiraId: Int64;
    procedure SetCategoriaFinanceiraId(const ACategoriaFinanceiraId: Int64);
    function GetMetodoDePagamento: TMetodoPagamentoEcommerce;
    procedure SetMetodoDePagamento(const AMetodoDePagamento: TMetodoPagamentoEcommerce);
    property Id: Integer read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property EspecieDeDocumentoId: Int64 read GetEspecieDeDocumentoId write SetEspecieDeDocumentoId;
    property AgenteFinanceiroId: Int64 read GetAgenteFinanceiroId write SetAgenteFinanceiroId;
    property CategoriaFinanceiraId: Int64 read GetCategoriaFinanceiraId write SetCategoriaFinanceiraId;
    property MetodoDePagamento: TMetodoPagamentoEcommerce read GetMetodoDePagamento write SetMetodoDePagamento;
  end;

  TFormaDePagamentoList = class;

  IFormaDePagamentoList = interface
	['{D81EDC7C-B62C-4130-A0FA-DBB73893F757}']
    function GetReference: TFormaDePagamentoList;
    function GetItems(AIndex: Integer): IFormaDePagamento;
    procedure SetItems(AIndex: Integer; const Value: IFormaDePagamento);
    procedure Add(const AFormaDePagamento: IFormaDePagamento);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IFormaDePagamento read GetItems write SetItems; default;
  end;

  TFormaDePagamentoListEnumerator = class
  private
    FIndex: Integer;
    FFormaDePagamentoList: TFormaDePagamentoList;
  public
    constructor Create(AFormaDePagamentoList: TFormaDePagamentoList);
    function GetCurrent: IFormaDePagamento; inline;
    function MoveNext: Boolean;
    property Current: IFormaDePagamento read GetCurrent;
  end;

  TFormaDePagamentoList = class(TInterfacedObject, IFormaDePagamentoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IFormaDePagamento;
    procedure SetItems(AIndex: Integer; const Value: IFormaDePagamento);
  public
    constructor Create;
    procedure Add(const AFormaDePagamento: IFormaDePagamento);
    destructor Destroy; override;
    function GetEnumerator: TFormaDePagamentoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TFormaDePagamentoList;
    property Items[AIndex: Integer]: IFormaDePagamento read GetItems write SetItems; default;
  end;

  TFormaDePagamentoListRec = record
  private
    FList: IFormaDePagamentoList;
  public
    class function Create(const AList: IFormaDePagamentoList): TFormaDePagamentoListRec; static;
    class operator Implicit(AListRec: TFormaDePagamentoListRec): TFormaDePagamentoList;
  end;

  TFormaDePagamento = class(TInterfacedModel, IFormaDePagamento)
  private
	FId: Integer;
	FDescricao: TString;
	FEspecieDeDocumentoId: Int64;
	FAgenteFinanceiroId: Int64;
	FCategoriaFinanceiraId: Int64;
	FMetodoDePagamento: TMetodoPagamentoEcommerce;
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetEspecieDeDocumentoId: Int64;
    procedure SetEspecieDeDocumentoId(const AEspecieDeDocumentoId: Int64);
    function GetAgenteFinanceiroId: Int64;
    procedure SetAgenteFinanceiroId(const AAgenteFinanceiroId: Int64);
    function GetCategoriaFinanceiraId: Int64;
    procedure SetCategoriaFinanceiraId(const ACategoriaFinanceiraId: Int64);
    function GetMetodoDePagamento: TMetodoPagamentoEcommerce;
    procedure SetMetodoDePagamento(const AMetodoDePagamento: TMetodoPagamentoEcommerce);
  public
    property Id: Integer read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property EspecieDeDocumentoId: Int64 read GetEspecieDeDocumentoId write SetEspecieDeDocumentoId;
    property AgenteFinanceiroId: Int64 read GetAgenteFinanceiroId write SetAgenteFinanceiroId;
    property CategoriaFinanceiraId: Int64 read GetCategoriaFinanceiraId write SetCategoriaFinanceiraId;
    property MetodoDePagamento: TMetodoPagamentoEcommerce read GetMetodoDePagamento write SetMetodoDePagamento;
  end;

implementation

{ TFormaDePagamentoList }

procedure TFormaDePagamentoList.Add(const AFormaDePagamento: IFormaDePagamento);
begin
  FList.Add(AFormaDePagamento);
end;

procedure TFormaDePagamentoList.Clear;
begin
  FList.Clear;
end;

function TFormaDePagamentoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TFormaDePagamentoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TFormaDePagamentoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TFormaDePagamentoList.GetEnumerator: TFormaDePagamentoListEnumerator;
begin
  Result := TFormaDePagamentoListEnumerator.Create(Self);
end;

function TFormaDePagamentoList.GetItems(AIndex: Integer): IFormaDePagamento;
begin
  Result := FList[AIndex] as IFormaDePagamento;
end;

function TFormaDePagamentoList.GetReference: TFormaDePagamentoList;
begin
  Result := Self;
end;

procedure TFormaDePagamentoList.SetItems(AIndex: Integer; const Value: IFormaDePagamento);
begin
  FList[AIndex] := Value;
end;

{ TFormaDePagamentoListEnumerator }

constructor TFormaDePagamentoListEnumerator.Create(AFormaDePagamentoList: TFormaDePagamentoList);
begin
  inherited Create;
  FIndex := -1;
  FFormaDePagamentoList := AFormaDePagamentoList;
end;

function TFormaDePagamentoListEnumerator.GetCurrent: IFormaDePagamento;
begin
  Result := FFormaDePagamentoList[FIndex];
end;

function TFormaDePagamentoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FFormaDePagamentoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TFormaDePagamentoListRec }

class function TFormaDePagamentoListRec.Create(const AList: IFormaDePagamentoList): TFormaDePagamentoListRec;
begin
  FillChar(Result, SizeOf(TFormaDePagamentoListRec), 0);
  Result.FList := AList;
end;

class operator TFormaDePagamentoListRec.Implicit(AListRec: TFormaDePagamentoListRec): TFormaDePagamentoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TFormaDePagamento }

function TFormaDePagamento.GetId: Integer;
begin
  Result := FId;
end;

procedure TFormaDePagamento.SetId(const AId: Integer);
begin
  FId := AId;
end;

function TFormaDePagamento.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TFormaDePagamento.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

function TFormaDePagamento.GetEspecieDeDocumentoId: Int64;
begin
  Result := FEspecieDeDocumentoId;
end;

procedure TFormaDePagamento.SetEspecieDeDocumentoId(const AEspecieDeDocumentoId: Int64);
begin
  FEspecieDeDocumentoId := AEspecieDeDocumentoId;
end;

function TFormaDePagamento.GetAgenteFinanceiroId: Int64;
begin
  Result := FAgenteFinanceiroId;
end;

procedure TFormaDePagamento.SetAgenteFinanceiroId(const AAgenteFinanceiroId: Int64);
begin
  FAgenteFinanceiroId := AAgenteFinanceiroId;
end;

function TFormaDePagamento.GetCategoriaFinanceiraId: Int64;
begin
  Result := FCategoriaFinanceiraId;
end;

procedure TFormaDePagamento.SetCategoriaFinanceiraId(const ACategoriaFinanceiraId: Int64);
begin
  FCategoriaFinanceiraId := ACategoriaFinanceiraId;
end;

function TFormaDePagamento.GetMetodoDePagamento: TMetodoPagamentoEcommerce;
begin
  Result := FMetodoDePagamento;
end;

procedure TFormaDePagamento.SetMetodoDePagamento(const AMetodoDePagamento: TMetodoPagamentoEcommerce);
begin
  FMetodoDePagamento := AMetodoDePagamento;
end;


end.
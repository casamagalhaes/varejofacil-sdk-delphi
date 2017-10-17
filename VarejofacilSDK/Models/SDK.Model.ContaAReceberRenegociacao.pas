unit SDK.Model.ContaAReceberRenegociacao;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IContaAReceberRenegociacao = interface(IModel)
    ['{20F693A9-BAC5-4D28-902F-9EAA0A3063F0}']
    function GetObservacao: TString;
    procedure SetObservacao(const AObservacao: TString);
    function GetNumeroDoDocumento: TString;
    procedure SetNumeroDoDocumento(const ANumeroDoDocumento: TString);
    function GetDataDeEmissao: TDateTime;
    procedure SetDataDeEmissao(const ADataDeEmissao: TDateTime);
    function GetValorBruto: Double;
    procedure SetValorBruto(const AValorBruto: Double);
    function GetValorDesconto: Double;
    procedure SetValorDesconto(const AValorDesconto: Double);
    function GetValorAcrescimo: Double;
    procedure SetValorAcrescimo(const AValorAcrescimo: Double);
    function GetCondicaoDePagamento: TCondicaoPagamento;
    procedure SetCondicaoDePagamento(const ACondicaoDePagamento: TCondicaoPagamento);
    function GetNumeroDeTitulos: Integer;
    procedure SetNumeroDeTitulos(const ANumeroDeTitulos: Integer);
    function GetPrimeiroVencimento: TDateTime;
    procedure SetPrimeiroVencimento(const APrimeiroVencimento: TDateTime);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetEspecieDeDocumentoId: Int64;
    procedure SetEspecieDeDocumentoId(const AEspecieDeDocumentoId: Int64);
    function GetClienteId: Int64;
    procedure SetClienteId(const AClienteId: Int64);
    function GetAgenteFinanceiroId: Int64;
    procedure SetAgenteFinanceiroId(const AAgenteFinanceiroId: Int64);
    function GetCategoriaFinanceiraId: Int64;
    procedure SetCategoriaFinanceiraId(const ACategoriaFinanceiraId: Int64);
    function GetSequencial: TString;
    procedure SetSequencial(const ASequencial: TString);
    function GetNumeroDoCaixa: TString;
    procedure SetNumeroDoCaixa(const ANumeroDoCaixa: TString);
    function GetIntervaloDeDiasEntreOsTitulos: Integer;
    procedure SetIntervaloDeDiasEntreOsTitulos(const AIntervaloDeDiasEntreOsTitulos: Integer);
    property Observacao: TString read GetObservacao write SetObservacao;
    property NumeroDoDocumento: TString read GetNumeroDoDocumento write SetNumeroDoDocumento;
    property DataDeEmissao: TDateTime read GetDataDeEmissao write SetDataDeEmissao;
    property ValorBruto: Double read GetValorBruto write SetValorBruto;
    property ValorDesconto: Double read GetValorDesconto write SetValorDesconto;
    property ValorAcrescimo: Double read GetValorAcrescimo write SetValorAcrescimo;
    property CondicaoDePagamento: TCondicaoPagamento read GetCondicaoDePagamento write SetCondicaoDePagamento;
    property NumeroDeTitulos: Integer read GetNumeroDeTitulos write SetNumeroDeTitulos;
    property PrimeiroVencimento: TDateTime read GetPrimeiroVencimento write SetPrimeiroVencimento;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property EspecieDeDocumentoId: Int64 read GetEspecieDeDocumentoId write SetEspecieDeDocumentoId;
    property ClienteId: Int64 read GetClienteId write SetClienteId;
    property AgenteFinanceiroId: Int64 read GetAgenteFinanceiroId write SetAgenteFinanceiroId;
    property CategoriaFinanceiraId: Int64 read GetCategoriaFinanceiraId write SetCategoriaFinanceiraId;
    property Sequencial: TString read GetSequencial write SetSequencial;
    property NumeroDoCaixa: TString read GetNumeroDoCaixa write SetNumeroDoCaixa;
    property IntervaloDeDiasEntreOsTitulos: Integer read GetIntervaloDeDiasEntreOsTitulos write SetIntervaloDeDiasEntreOsTitulos;
  end;

  TContaAReceberRenegociacaoList = class;

  IContaAReceberRenegociacaoList = interface
	['{24C2F71C-C4A1-42D4-91E5-7D13DB418387}']
    function GetReference: TContaAReceberRenegociacaoList;
    function GetItems(AIndex: Integer): IContaAReceberRenegociacao;
    procedure SetItems(AIndex: Integer; const Value: IContaAReceberRenegociacao);
    procedure Add(const AContaAReceberRenegociacao: IContaAReceberRenegociacao);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IContaAReceberRenegociacao read GetItems write SetItems; default;
  end;

  TContaAReceberRenegociacaoListEnumerator = class
  private
    FIndex: Integer;
    FContaAReceberRenegociacaoList: TContaAReceberRenegociacaoList;
  public
    constructor Create(AContaAReceberRenegociacaoList: TContaAReceberRenegociacaoList);
    function GetCurrent: IContaAReceberRenegociacao; inline;
    function MoveNext: Boolean;
    property Current: IContaAReceberRenegociacao read GetCurrent;
  end;

  TContaAReceberRenegociacaoList = class(TInterfacedObject, IContaAReceberRenegociacaoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IContaAReceberRenegociacao;
    procedure SetItems(AIndex: Integer; const Value: IContaAReceberRenegociacao);
  public
    constructor Create;
    procedure Add(const AContaAReceberRenegociacao: IContaAReceberRenegociacao);
    destructor Destroy; override;
    function GetEnumerator: TContaAReceberRenegociacaoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TContaAReceberRenegociacaoList;
    property Items[AIndex: Integer]: IContaAReceberRenegociacao read GetItems write SetItems; default;
  end;

  TContaAReceberRenegociacaoListRec = record
  private
    FList: IContaAReceberRenegociacaoList;
  public
    class function Create(const AList: IContaAReceberRenegociacaoList): TContaAReceberRenegociacaoListRec; static;
    class operator Implicit(AListRec: TContaAReceberRenegociacaoListRec): TContaAReceberRenegociacaoList;
  end;

  TContaAReceberRenegociacao = class(TInterfacedModel, IContaAReceberRenegociacao)
  private
	FObservacao: TString;
	FNumeroDoDocumento: TString;
	FDataDeEmissao: TDateTime;
	FValorBruto: Double;
	FValorDesconto: Double;
	FValorAcrescimo: Double;
	FCondicaoDePagamento: TCondicaoPagamento;
	FNumeroDeTitulos: Integer;
	FPrimeiroVencimento: TDateTime;
	FLojaId: Int64;
	FEspecieDeDocumentoId: Int64;
	FClienteId: Int64;
	FAgenteFinanceiroId: Int64;
	FCategoriaFinanceiraId: Int64;
	FSequencial: TString;
	FNumeroDoCaixa: TString;
	FIntervaloDeDiasEntreOsTitulos: Integer;
    function GetObservacao: TString;
    procedure SetObservacao(const AObservacao: TString);
    function GetNumeroDoDocumento: TString;
    procedure SetNumeroDoDocumento(const ANumeroDoDocumento: TString);
    function GetDataDeEmissao: TDateTime;
    procedure SetDataDeEmissao(const ADataDeEmissao: TDateTime);
    function GetValorBruto: Double;
    procedure SetValorBruto(const AValorBruto: Double);
    function GetValorDesconto: Double;
    procedure SetValorDesconto(const AValorDesconto: Double);
    function GetValorAcrescimo: Double;
    procedure SetValorAcrescimo(const AValorAcrescimo: Double);
    function GetCondicaoDePagamento: TCondicaoPagamento;
    procedure SetCondicaoDePagamento(const ACondicaoDePagamento: TCondicaoPagamento);
    function GetNumeroDeTitulos: Integer;
    procedure SetNumeroDeTitulos(const ANumeroDeTitulos: Integer);
    function GetPrimeiroVencimento: TDateTime;
    procedure SetPrimeiroVencimento(const APrimeiroVencimento: TDateTime);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetEspecieDeDocumentoId: Int64;
    procedure SetEspecieDeDocumentoId(const AEspecieDeDocumentoId: Int64);
    function GetClienteId: Int64;
    procedure SetClienteId(const AClienteId: Int64);
    function GetAgenteFinanceiroId: Int64;
    procedure SetAgenteFinanceiroId(const AAgenteFinanceiroId: Int64);
    function GetCategoriaFinanceiraId: Int64;
    procedure SetCategoriaFinanceiraId(const ACategoriaFinanceiraId: Int64);
    function GetSequencial: TString;
    procedure SetSequencial(const ASequencial: TString);
    function GetNumeroDoCaixa: TString;
    procedure SetNumeroDoCaixa(const ANumeroDoCaixa: TString);
    function GetIntervaloDeDiasEntreOsTitulos: Integer;
    procedure SetIntervaloDeDiasEntreOsTitulos(const AIntervaloDeDiasEntreOsTitulos: Integer);
  published
    property Observacao: TString read GetObservacao write SetObservacao;
    property NumeroDoDocumento: TString read GetNumeroDoDocumento write SetNumeroDoDocumento;
    property DataDeEmissao: TDateTime read GetDataDeEmissao write SetDataDeEmissao;
    property ValorBruto: Double read GetValorBruto write SetValorBruto;
    property ValorDesconto: Double read GetValorDesconto write SetValorDesconto;
    property ValorAcrescimo: Double read GetValorAcrescimo write SetValorAcrescimo;
    property CondicaoDePagamento: TCondicaoPagamento read GetCondicaoDePagamento write SetCondicaoDePagamento;
    property NumeroDeTitulos: Integer read GetNumeroDeTitulos write SetNumeroDeTitulos;
    property PrimeiroVencimento: TDateTime read GetPrimeiroVencimento write SetPrimeiroVencimento;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property EspecieDeDocumentoId: Int64 read GetEspecieDeDocumentoId write SetEspecieDeDocumentoId;
    property ClienteId: Int64 read GetClienteId write SetClienteId;
    property AgenteFinanceiroId: Int64 read GetAgenteFinanceiroId write SetAgenteFinanceiroId;
    property CategoriaFinanceiraId: Int64 read GetCategoriaFinanceiraId write SetCategoriaFinanceiraId;
    property Sequencial: TString read GetSequencial write SetSequencial;
    property NumeroDoCaixa: TString read GetNumeroDoCaixa write SetNumeroDoCaixa;
    property IntervaloDeDiasEntreOsTitulos: Integer read GetIntervaloDeDiasEntreOsTitulos write SetIntervaloDeDiasEntreOsTitulos;
  end;

implementation

{ TContaAReceberRenegociacaoList }

procedure TContaAReceberRenegociacaoList.Add(const AContaAReceberRenegociacao: IContaAReceberRenegociacao);
begin
  FList.Add(AContaAReceberRenegociacao);
end;

procedure TContaAReceberRenegociacaoList.Clear;
begin
  FList.Clear;
end;

function TContaAReceberRenegociacaoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TContaAReceberRenegociacaoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TContaAReceberRenegociacaoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TContaAReceberRenegociacaoList.GetEnumerator: TContaAReceberRenegociacaoListEnumerator;
begin
  Result := TContaAReceberRenegociacaoListEnumerator.Create(Self);
end;

function TContaAReceberRenegociacaoList.GetItems(AIndex: Integer): IContaAReceberRenegociacao;
begin
  Result := FList[AIndex] as IContaAReceberRenegociacao;
end;

function TContaAReceberRenegociacaoList.GetReference: TContaAReceberRenegociacaoList;
begin
  Result := Self;
end;

procedure TContaAReceberRenegociacaoList.SetItems(AIndex: Integer; const Value: IContaAReceberRenegociacao);
begin
  FList[AIndex] := Value;
end;

{ TContaAReceberRenegociacaoListEnumerator }

constructor TContaAReceberRenegociacaoListEnumerator.Create(AContaAReceberRenegociacaoList: TContaAReceberRenegociacaoList);
begin
  inherited Create;
  FIndex := -1;
  FContaAReceberRenegociacaoList := AContaAReceberRenegociacaoList;
end;

function TContaAReceberRenegociacaoListEnumerator.GetCurrent: IContaAReceberRenegociacao;
begin
  Result := FContaAReceberRenegociacaoList[FIndex];
end;

function TContaAReceberRenegociacaoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FContaAReceberRenegociacaoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TContaAReceberRenegociacaoListRec }

class function TContaAReceberRenegociacaoListRec.Create(const AList: IContaAReceberRenegociacaoList): TContaAReceberRenegociacaoListRec;
begin
  FillChar(Result, SizeOf(TContaAReceberRenegociacaoListRec), 0);
  Result.FList := AList;
end;

class operator TContaAReceberRenegociacaoListRec.Implicit(AListRec: TContaAReceberRenegociacaoListRec): TContaAReceberRenegociacaoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TContaAReceberRenegociacao }

function TContaAReceberRenegociacao.GetObservacao: TString;
begin
  Result := FObservacao;
end;

procedure TContaAReceberRenegociacao.SetObservacao(const AObservacao: TString);
begin
  FObservacao := AObservacao;
end;

function TContaAReceberRenegociacao.GetNumeroDoDocumento: TString;
begin
  Result := FNumeroDoDocumento;
end;

procedure TContaAReceberRenegociacao.SetNumeroDoDocumento(const ANumeroDoDocumento: TString);
begin
  FNumeroDoDocumento := ANumeroDoDocumento;
end;

function TContaAReceberRenegociacao.GetDataDeEmissao: TDateTime;
begin
  Result := FDataDeEmissao;
end;

procedure TContaAReceberRenegociacao.SetDataDeEmissao(const ADataDeEmissao: TDateTime);
begin
  FDataDeEmissao := ADataDeEmissao;
end;

function TContaAReceberRenegociacao.GetValorBruto: Double;
begin
  Result := FValorBruto;
end;

procedure TContaAReceberRenegociacao.SetValorBruto(const AValorBruto: Double);
begin
  FValorBruto := AValorBruto;
end;

function TContaAReceberRenegociacao.GetValorDesconto: Double;
begin
  Result := FValorDesconto;
end;

procedure TContaAReceberRenegociacao.SetValorDesconto(const AValorDesconto: Double);
begin
  FValorDesconto := AValorDesconto;
end;

function TContaAReceberRenegociacao.GetValorAcrescimo: Double;
begin
  Result := FValorAcrescimo;
end;

procedure TContaAReceberRenegociacao.SetValorAcrescimo(const AValorAcrescimo: Double);
begin
  FValorAcrescimo := AValorAcrescimo;
end;

function TContaAReceberRenegociacao.GetCondicaoDePagamento: TCondicaoPagamento;
begin
  Result := FCondicaoDePagamento;
end;

procedure TContaAReceberRenegociacao.SetCondicaoDePagamento(const ACondicaoDePagamento: TCondicaoPagamento);
begin
  FCondicaoDePagamento := ACondicaoDePagamento;
end;

function TContaAReceberRenegociacao.GetNumeroDeTitulos: Integer;
begin
  Result := FNumeroDeTitulos;
end;

procedure TContaAReceberRenegociacao.SetNumeroDeTitulos(const ANumeroDeTitulos: Integer);
begin
  FNumeroDeTitulos := ANumeroDeTitulos;
end;

function TContaAReceberRenegociacao.GetPrimeiroVencimento: TDateTime;
begin
  Result := FPrimeiroVencimento;
end;

procedure TContaAReceberRenegociacao.SetPrimeiroVencimento(const APrimeiroVencimento: TDateTime);
begin
  FPrimeiroVencimento := APrimeiroVencimento;
end;

function TContaAReceberRenegociacao.GetLojaId: Int64;
begin
  Result := FLojaId;
end;

procedure TContaAReceberRenegociacao.SetLojaId(const ALojaId: Int64);
begin
  FLojaId := ALojaId;
end;

function TContaAReceberRenegociacao.GetEspecieDeDocumentoId: Int64;
begin
  Result := FEspecieDeDocumentoId;
end;

procedure TContaAReceberRenegociacao.SetEspecieDeDocumentoId(const AEspecieDeDocumentoId: Int64);
begin
  FEspecieDeDocumentoId := AEspecieDeDocumentoId;
end;

function TContaAReceberRenegociacao.GetClienteId: Int64;
begin
  Result := FClienteId;
end;

procedure TContaAReceberRenegociacao.SetClienteId(const AClienteId: Int64);
begin
  FClienteId := AClienteId;
end;

function TContaAReceberRenegociacao.GetAgenteFinanceiroId: Int64;
begin
  Result := FAgenteFinanceiroId;
end;

procedure TContaAReceberRenegociacao.SetAgenteFinanceiroId(const AAgenteFinanceiroId: Int64);
begin
  FAgenteFinanceiroId := AAgenteFinanceiroId;
end;

function TContaAReceberRenegociacao.GetCategoriaFinanceiraId: Int64;
begin
  Result := FCategoriaFinanceiraId;
end;

procedure TContaAReceberRenegociacao.SetCategoriaFinanceiraId(const ACategoriaFinanceiraId: Int64);
begin
  FCategoriaFinanceiraId := ACategoriaFinanceiraId;
end;

function TContaAReceberRenegociacao.GetSequencial: TString;
begin
  Result := FSequencial;
end;

procedure TContaAReceberRenegociacao.SetSequencial(const ASequencial: TString);
begin
  FSequencial := ASequencial;
end;

function TContaAReceberRenegociacao.GetNumeroDoCaixa: TString;
begin
  Result := FNumeroDoCaixa;
end;

procedure TContaAReceberRenegociacao.SetNumeroDoCaixa(const ANumeroDoCaixa: TString);
begin
  FNumeroDoCaixa := ANumeroDoCaixa;
end;

function TContaAReceberRenegociacao.GetIntervaloDeDiasEntreOsTitulos: Integer;
begin
  Result := FIntervaloDeDiasEntreOsTitulos;
end;

procedure TContaAReceberRenegociacao.SetIntervaloDeDiasEntreOsTitulos(const AIntervaloDeDiasEntreOsTitulos: Integer);
begin
  FIntervaloDeDiasEntreOsTitulos := AIntervaloDeDiasEntreOsTitulos;
end;


end.
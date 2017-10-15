unit SDK.Model.ContaAReceber;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IContaAReceber = interface(IModel)
    ['{1FC9830D-79E9-4780-B59B-4B8638A26529}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetObservacao: TString;
    procedure SetObservacao(const AObservacao: TString);
    function GetNumeroDocumento: TString;
    procedure SetNumeroDocumento(const ANumeroDocumento: TString);
    function GetDataEmissao: TDateTime;
    procedure SetDataEmissao(const ADataEmissao: TDateTime);
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
    function GetEspecieDocumentoId: Int64;
    procedure SetEspecieDocumentoId(const AEspecieDocumentoId: Int64);
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
    function GetTitulos: TList<TituloAReceber>;
    procedure SetTitulos(const ATitulos: TList<TituloAReceber>);
    function GetGeraTitulos: Tboolean;
    procedure SetGeraTitulos(const AGeraTitulos: Tboolean);
    property Id: Int64 read GetId write SetId;
    property Observacao: TString read GetObservacao write SetObservacao;
    property NumeroDocumento: TString read GetNumeroDocumento write SetNumeroDocumento;
    property DataEmissao: TDateTime read GetDataEmissao write SetDataEmissao;
    property ValorBruto: Double read GetValorBruto write SetValorBruto;
    property ValorDesconto: Double read GetValorDesconto write SetValorDesconto;
    property ValorAcrescimo: Double read GetValorAcrescimo write SetValorAcrescimo;
    property CondicaoDePagamento: TCondicaoPagamento read GetCondicaoDePagamento write SetCondicaoDePagamento;
    property NumeroDeTitulos: Integer read GetNumeroDeTitulos write SetNumeroDeTitulos;
    property PrimeiroVencimento: TDateTime read GetPrimeiroVencimento write SetPrimeiroVencimento;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property EspecieDocumentoId: Int64 read GetEspecieDocumentoId write SetEspecieDocumentoId;
    property ClienteId: Int64 read GetClienteId write SetClienteId;
    property AgenteFinanceiroId: Int64 read GetAgenteFinanceiroId write SetAgenteFinanceiroId;
    property CategoriaFinanceiraId: Int64 read GetCategoriaFinanceiraId write SetCategoriaFinanceiraId;
    property Sequencial: TString read GetSequencial write SetSequencial;
    property NumeroDoCaixa: TString read GetNumeroDoCaixa write SetNumeroDoCaixa;
    property IntervaloDeDiasEntreOsTitulos: Integer read GetIntervaloDeDiasEntreOsTitulos write SetIntervaloDeDiasEntreOsTitulos;
    property Titulos: TList<TituloAReceber> read GetTitulos write SetTitulos;
    property GeraTitulos: Tboolean read GetGeraTitulos write SetGeraTitulos;
  end;

  TContaAReceberList = class;

  IContaAReceberList = interface
	['{8DA53D2E-7A08-40B6-BC45-AF8DCA8C3E5B}']
    function GetReference: TContaAReceberList;
    function GetItems(AIndex: Integer): IContaAReceber;
    procedure SetItems(AIndex: Integer; const Value: IContaAReceber);
    procedure Add(const AContaAReceber: IContaAReceber);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IContaAReceber read GetItems write SetItems; default;
  end;

  TContaAReceberListEnumerator = class
  private
    FIndex: Integer;
    FContaAReceberList: TContaAReceberList;
  public
    constructor Create(AContaAReceberList: TContaAReceberList);
    function GetCurrent: IContaAReceber; inline;
    function MoveNext: Boolean;
    property Current: IContaAReceber read GetCurrent;
  end;

  TContaAReceberList = class(TInterfacedObject, IContaAReceberList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IContaAReceber;
    procedure SetItems(AIndex: Integer; const Value: IContaAReceber);
  public
    constructor Create;
    procedure Add(const AContaAReceber: IContaAReceber);
    destructor Destroy; override;
    function GetEnumerator: TContaAReceberListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TContaAReceberList;
    property Items[AIndex: Integer]: IContaAReceber read GetItems write SetItems; default;
  end;

  TContaAReceberListRec = record
  private
    FList: IContaAReceberList;
  public
    class function Create(const AList: IContaAReceberList): TContaAReceberListRec; static;
    class operator Implicit(AListRec: TContaAReceberListRec): TContaAReceberList;
  end;

  TContaAReceber = class(TInterfacedObject, IContaAReceber)
  private
	FId: Int64;
	FObservacao: TString;
	FNumeroDocumento: TString;
	FDataEmissao: TDateTime;
	FValorBruto: Double;
	FValorDesconto: Double;
	FValorAcrescimo: Double;
	FCondicaoDePagamento: TCondicaoPagamento;
	FNumeroDeTitulos: Integer;
	FPrimeiroVencimento: TDateTime;
	FLojaId: Int64;
	FEspecieDocumentoId: Int64;
	FClienteId: Int64;
	FAgenteFinanceiroId: Int64;
	FCategoriaFinanceiraId: Int64;
	FSequencial: TString;
	FNumeroDoCaixa: TString;
	FIntervaloDeDiasEntreOsTitulos: Integer;
	FTitulos: TList<TituloAReceber>;
	FGeraTitulos: Tboolean;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetObservacao: TString;
    procedure SetObservacao(const AObservacao: TString);
    function GetNumeroDocumento: TString;
    procedure SetNumeroDocumento(const ANumeroDocumento: TString);
    function GetDataEmissao: TDateTime;
    procedure SetDataEmissao(const ADataEmissao: TDateTime);
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
    function GetEspecieDocumentoId: Int64;
    procedure SetEspecieDocumentoId(const AEspecieDocumentoId: Int64);
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
    function GetTitulos: TList<TituloAReceber>;
    procedure SetTitulos(const ATitulos: TList<TituloAReceber>);
    function GetGeraTitulos: Tboolean;
    procedure SetGeraTitulos(const AGeraTitulos: Tboolean);
  public
    property Id: Int64 read GetId write SetId;
    property Observacao: TString read GetObservacao write SetObservacao;
    property NumeroDocumento: TString read GetNumeroDocumento write SetNumeroDocumento;
    property DataEmissao: TDateTime read GetDataEmissao write SetDataEmissao;
    property ValorBruto: Double read GetValorBruto write SetValorBruto;
    property ValorDesconto: Double read GetValorDesconto write SetValorDesconto;
    property ValorAcrescimo: Double read GetValorAcrescimo write SetValorAcrescimo;
    property CondicaoDePagamento: TCondicaoPagamento read GetCondicaoDePagamento write SetCondicaoDePagamento;
    property NumeroDeTitulos: Integer read GetNumeroDeTitulos write SetNumeroDeTitulos;
    property PrimeiroVencimento: TDateTime read GetPrimeiroVencimento write SetPrimeiroVencimento;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property EspecieDocumentoId: Int64 read GetEspecieDocumentoId write SetEspecieDocumentoId;
    property ClienteId: Int64 read GetClienteId write SetClienteId;
    property AgenteFinanceiroId: Int64 read GetAgenteFinanceiroId write SetAgenteFinanceiroId;
    property CategoriaFinanceiraId: Int64 read GetCategoriaFinanceiraId write SetCategoriaFinanceiraId;
    property Sequencial: TString read GetSequencial write SetSequencial;
    property NumeroDoCaixa: TString read GetNumeroDoCaixa write SetNumeroDoCaixa;
    property IntervaloDeDiasEntreOsTitulos: Integer read GetIntervaloDeDiasEntreOsTitulos write SetIntervaloDeDiasEntreOsTitulos;
    property Titulos: TList<TituloAReceber> read GetTitulos write SetTitulos;
    property GeraTitulos: Tboolean read GetGeraTitulos write SetGeraTitulos;
  end;

implementation

{ TContaAReceberList }

procedure TContaAReceberList.Add(const AContaAReceber: IContaAReceber);
begin
  FList.Add(AContaAReceber);
end;

procedure TContaAReceberList.Clear;
begin
  FList.Clear;
end;

function TContaAReceberList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TContaAReceberList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TContaAReceberList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TContaAReceberList.GetEnumerator: TContaAReceberListEnumerator;
begin
  Result := TContaAReceberListEnumerator.Create(Self);
end;

function TContaAReceberList.GetItems(AIndex: Integer): IContaAReceber;
begin
  Result := FList[AIndex] as IContaAReceber;
end;

function TContaAReceberList.GetReference: TContaAReceberList;
begin
  Result := Self;
end;

procedure TContaAReceberList.SetItems(AIndex: Integer; const Value: IContaAReceber);
begin
  FList[AIndex] := Value;
end;

{ TContaAReceberListEnumerator }

constructor TContaAReceberListEnumerator.Create(AContaAReceberList: TContaAReceberList);
begin
  inherited Create;
  FIndex := -1;
  FContaAReceberList := AContaAReceberList;
end;

function TContaAReceberListEnumerator.GetCurrent: IContaAReceber;
begin
  Result := FContaAReceberList[FIndex];
end;

function TContaAReceberListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FContaAReceberList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TContaAReceberListRec }

class function TContaAReceberListRec.Create(const AList: IContaAReceberList): TContaAReceberListRec;
begin
  FillChar(Result, SizeOf(TContaAReceberListRec), 0);
  Result.FList := AList;
end;

class operator TContaAReceberListRec.Implicit(AListRec: TContaAReceberListRec): TContaAReceberList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TContaAReceber }

function TContaAReceber.GetId: Int64;
begin
  Result := FId;
end;

procedure TContaAReceber.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TContaAReceber.GetObservacao: TString;
begin
  Result := FObservacao;
end;

procedure TContaAReceber.SetObservacao(const AObservacao: TString);
begin
  FObservacao := AObservacao;
end;

function TContaAReceber.GetNumeroDocumento: TString;
begin
  Result := FNumeroDocumento;
end;

procedure TContaAReceber.SetNumeroDocumento(const ANumeroDocumento: TString);
begin
  FNumeroDocumento := ANumeroDocumento;
end;

function TContaAReceber.GetDataEmissao: TDateTime;
begin
  Result := FDataEmissao;
end;

procedure TContaAReceber.SetDataEmissao(const ADataEmissao: TDateTime);
begin
  FDataEmissao := ADataEmissao;
end;

function TContaAReceber.GetValorBruto: Double;
begin
  Result := FValorBruto;
end;

procedure TContaAReceber.SetValorBruto(const AValorBruto: Double);
begin
  FValorBruto := AValorBruto;
end;

function TContaAReceber.GetValorDesconto: Double;
begin
  Result := FValorDesconto;
end;

procedure TContaAReceber.SetValorDesconto(const AValorDesconto: Double);
begin
  FValorDesconto := AValorDesconto;
end;

function TContaAReceber.GetValorAcrescimo: Double;
begin
  Result := FValorAcrescimo;
end;

procedure TContaAReceber.SetValorAcrescimo(const AValorAcrescimo: Double);
begin
  FValorAcrescimo := AValorAcrescimo;
end;

function TContaAReceber.GetCondicaoDePagamento: TCondicaoPagamento;
begin
  Result := FCondicaoDePagamento;
end;

procedure TContaAReceber.SetCondicaoDePagamento(const ACondicaoDePagamento: TCondicaoPagamento);
begin
  FCondicaoDePagamento := ACondicaoDePagamento;
end;

function TContaAReceber.GetNumeroDeTitulos: Integer;
begin
  Result := FNumeroDeTitulos;
end;

procedure TContaAReceber.SetNumeroDeTitulos(const ANumeroDeTitulos: Integer);
begin
  FNumeroDeTitulos := ANumeroDeTitulos;
end;

function TContaAReceber.GetPrimeiroVencimento: TDateTime;
begin
  Result := FPrimeiroVencimento;
end;

procedure TContaAReceber.SetPrimeiroVencimento(const APrimeiroVencimento: TDateTime);
begin
  FPrimeiroVencimento := APrimeiroVencimento;
end;

function TContaAReceber.GetLojaId: Int64;
begin
  Result := FLojaId;
end;

procedure TContaAReceber.SetLojaId(const ALojaId: Int64);
begin
  FLojaId := ALojaId;
end;

function TContaAReceber.GetEspecieDocumentoId: Int64;
begin
  Result := FEspecieDocumentoId;
end;

procedure TContaAReceber.SetEspecieDocumentoId(const AEspecieDocumentoId: Int64);
begin
  FEspecieDocumentoId := AEspecieDocumentoId;
end;

function TContaAReceber.GetClienteId: Int64;
begin
  Result := FClienteId;
end;

procedure TContaAReceber.SetClienteId(const AClienteId: Int64);
begin
  FClienteId := AClienteId;
end;

function TContaAReceber.GetAgenteFinanceiroId: Int64;
begin
  Result := FAgenteFinanceiroId;
end;

procedure TContaAReceber.SetAgenteFinanceiroId(const AAgenteFinanceiroId: Int64);
begin
  FAgenteFinanceiroId := AAgenteFinanceiroId;
end;

function TContaAReceber.GetCategoriaFinanceiraId: Int64;
begin
  Result := FCategoriaFinanceiraId;
end;

procedure TContaAReceber.SetCategoriaFinanceiraId(const ACategoriaFinanceiraId: Int64);
begin
  FCategoriaFinanceiraId := ACategoriaFinanceiraId;
end;

function TContaAReceber.GetSequencial: TString;
begin
  Result := FSequencial;
end;

procedure TContaAReceber.SetSequencial(const ASequencial: TString);
begin
  FSequencial := ASequencial;
end;

function TContaAReceber.GetNumeroDoCaixa: TString;
begin
  Result := FNumeroDoCaixa;
end;

procedure TContaAReceber.SetNumeroDoCaixa(const ANumeroDoCaixa: TString);
begin
  FNumeroDoCaixa := ANumeroDoCaixa;
end;

function TContaAReceber.GetIntervaloDeDiasEntreOsTitulos: Integer;
begin
  Result := FIntervaloDeDiasEntreOsTitulos;
end;

procedure TContaAReceber.SetIntervaloDeDiasEntreOsTitulos(const AIntervaloDeDiasEntreOsTitulos: Integer);
begin
  FIntervaloDeDiasEntreOsTitulos := AIntervaloDeDiasEntreOsTitulos;
end;

function TContaAReceber.GetTitulos: TList<TituloAReceber>;
begin
  Result := FTitulos;
end;

procedure TContaAReceber.SetTitulos(const ATitulos: TList<TituloAReceber>);
begin
  FTitulos := ATitulos;
end;

function TContaAReceber.GetGeraTitulos: Tboolean;
begin
  Result := FGeraTitulos;
end;

procedure TContaAReceber.SetGeraTitulos(const AGeraTitulos: Tboolean);
begin
  FGeraTitulos := AGeraTitulos;
end;


end.
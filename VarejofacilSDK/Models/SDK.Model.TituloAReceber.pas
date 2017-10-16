unit SDK.Model.TituloAReceber;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ITituloAReceber = interface(IModel)
    ['{FA81E961-B943-46E2-AD81-5A74DE1DD43A}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetOrdem: Integer;
    procedure SetOrdem(const AOrdem: Integer);
    function GetPrazo: Integer;
    procedure SetPrazo(const APrazo: Integer);
    function GetVencimento: TDateTime;
    procedure SetVencimento(const AVencimento: TDateTime);
    function GetVencimentoOriginal: TDateTime;
    procedure SetVencimentoOriginal(const AVencimentoOriginal: TDateTime);
    function GetLiquidacao: TDateTime;
    procedure SetLiquidacao(const ALiquidacao: TDateTime);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
    function GetValorLiquido: Double;
    procedure SetValorLiquido(const AValorLiquido: Double);
    function GetStatus: TStatusTitulo;
    procedure SetStatus(const AStatus: TStatusTitulo);
    function GetValorDevidoBruto: Double;
    procedure SetValorDevidoBruto(const AValorDevidoBruto: Double);
    function GetAgenteFinanceiroId: Int64;
    procedure SetAgenteFinanceiroId(const AAgenteFinanceiroId: Int64);
    function GetClienteId: Int64;
    procedure SetClienteId(const AClienteId: Int64);
    function GetEspecieDocumentoId: Int64;
    procedure SetEspecieDocumentoId(const AEspecieDocumentoId: Int64);
    function GetCategoriaFinanceiraId: Int64;
    procedure SetCategoriaFinanceiraId(const ACategoriaFinanceiraId: Int64);
    function GetNumeroDocumento: TString;
    procedure SetNumeroDocumento(const ANumeroDocumento: TString);
    property Id: Int64 read GetId write SetId;
    property Ordem: Integer read GetOrdem write SetOrdem;
    property Prazo: Integer read GetPrazo write SetPrazo;
    property Vencimento: TDateTime read GetVencimento write SetVencimento;
    property VencimentoOriginal: TDateTime read GetVencimentoOriginal write SetVencimentoOriginal;
    property Liquidacao: TDateTime read GetLiquidacao write SetLiquidacao;
    property Valor: Double read GetValor write SetValor;
    property ValorLiquido: Double read GetValorLiquido write SetValorLiquido;
    property Status: TStatusTitulo read GetStatus write SetStatus;
    property ValorDevidoBruto: Double read GetValorDevidoBruto write SetValorDevidoBruto;
    property AgenteFinanceiroId: Int64 read GetAgenteFinanceiroId write SetAgenteFinanceiroId;
    property ClienteId: Int64 read GetClienteId write SetClienteId;
    property EspecieDocumentoId: Int64 read GetEspecieDocumentoId write SetEspecieDocumentoId;
    property CategoriaFinanceiraId: Int64 read GetCategoriaFinanceiraId write SetCategoriaFinanceiraId;
    property NumeroDocumento: TString read GetNumeroDocumento write SetNumeroDocumento;
  end;

  TTituloAReceberList = class;

  ITituloAReceberList = interface
	['{15181D29-EDD6-4DCF-B29B-A94368F0B570}']
    function GetReference: TTituloAReceberList;
    function GetItems(AIndex: Integer): ITituloAReceber;
    procedure SetItems(AIndex: Integer; const Value: ITituloAReceber);
    procedure Add(const ATituloAReceber: ITituloAReceber);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ITituloAReceber read GetItems write SetItems; default;
  end;

  TTituloAReceberListEnumerator = class
  private
    FIndex: Integer;
    FTituloAReceberList: TTituloAReceberList;
  public
    constructor Create(ATituloAReceberList: TTituloAReceberList);
    function GetCurrent: ITituloAReceber; inline;
    function MoveNext: Boolean;
    property Current: ITituloAReceber read GetCurrent;
  end;

  TTituloAReceberList = class(TInterfacedObject, ITituloAReceberList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ITituloAReceber;
    procedure SetItems(AIndex: Integer; const Value: ITituloAReceber);
  public
    constructor Create;
    procedure Add(const ATituloAReceber: ITituloAReceber);
    destructor Destroy; override;
    function GetEnumerator: TTituloAReceberListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TTituloAReceberList;
    property Items[AIndex: Integer]: ITituloAReceber read GetItems write SetItems; default;
  end;

  TTituloAReceberListRec = record
  private
    FList: ITituloAReceberList;
  public
    class function Create(const AList: ITituloAReceberList): TTituloAReceberListRec; static;
    class operator Implicit(AListRec: TTituloAReceberListRec): TTituloAReceberList;
  end;

  TTituloAReceber = class(TInterfacedModel, ITituloAReceber)
  private
	FId: Int64;
	FOrdem: Integer;
	FPrazo: Integer;
	FVencimento: TDateTime;
	FVencimentoOriginal: TDateTime;
	FLiquidacao: TDateTime;
	FValor: Double;
	FValorLiquido: Double;
	FStatus: TStatusTitulo;
	FValorDevidoBruto: Double;
	FAgenteFinanceiroId: Int64;
	FClienteId: Int64;
	FEspecieDocumentoId: Int64;
	FCategoriaFinanceiraId: Int64;
	FNumeroDocumento: TString;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetOrdem: Integer;
    procedure SetOrdem(const AOrdem: Integer);
    function GetPrazo: Integer;
    procedure SetPrazo(const APrazo: Integer);
    function GetVencimento: TDateTime;
    procedure SetVencimento(const AVencimento: TDateTime);
    function GetVencimentoOriginal: TDateTime;
    procedure SetVencimentoOriginal(const AVencimentoOriginal: TDateTime);
    function GetLiquidacao: TDateTime;
    procedure SetLiquidacao(const ALiquidacao: TDateTime);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
    function GetValorLiquido: Double;
    procedure SetValorLiquido(const AValorLiquido: Double);
    function GetStatus: TStatusTitulo;
    procedure SetStatus(const AStatus: TStatusTitulo);
    function GetValorDevidoBruto: Double;
    procedure SetValorDevidoBruto(const AValorDevidoBruto: Double);
    function GetAgenteFinanceiroId: Int64;
    procedure SetAgenteFinanceiroId(const AAgenteFinanceiroId: Int64);
    function GetClienteId: Int64;
    procedure SetClienteId(const AClienteId: Int64);
    function GetEspecieDocumentoId: Int64;
    procedure SetEspecieDocumentoId(const AEspecieDocumentoId: Int64);
    function GetCategoriaFinanceiraId: Int64;
    procedure SetCategoriaFinanceiraId(const ACategoriaFinanceiraId: Int64);
    function GetNumeroDocumento: TString;
    procedure SetNumeroDocumento(const ANumeroDocumento: TString);
  public
    property Id: Int64 read GetId write SetId;
    property Ordem: Integer read GetOrdem write SetOrdem;
    property Prazo: Integer read GetPrazo write SetPrazo;
    property Vencimento: TDateTime read GetVencimento write SetVencimento;
    property VencimentoOriginal: TDateTime read GetVencimentoOriginal write SetVencimentoOriginal;
    property Liquidacao: TDateTime read GetLiquidacao write SetLiquidacao;
    property Valor: Double read GetValor write SetValor;
    property ValorLiquido: Double read GetValorLiquido write SetValorLiquido;
    property Status: TStatusTitulo read GetStatus write SetStatus;
    property ValorDevidoBruto: Double read GetValorDevidoBruto write SetValorDevidoBruto;
    property AgenteFinanceiroId: Int64 read GetAgenteFinanceiroId write SetAgenteFinanceiroId;
    property ClienteId: Int64 read GetClienteId write SetClienteId;
    property EspecieDocumentoId: Int64 read GetEspecieDocumentoId write SetEspecieDocumentoId;
    property CategoriaFinanceiraId: Int64 read GetCategoriaFinanceiraId write SetCategoriaFinanceiraId;
    property NumeroDocumento: TString read GetNumeroDocumento write SetNumeroDocumento;
  end;

implementation

{ TTituloAReceberList }

procedure TTituloAReceberList.Add(const ATituloAReceber: ITituloAReceber);
begin
  FList.Add(ATituloAReceber);
end;

procedure TTituloAReceberList.Clear;
begin
  FList.Clear;
end;

function TTituloAReceberList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TTituloAReceberList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TTituloAReceberList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TTituloAReceberList.GetEnumerator: TTituloAReceberListEnumerator;
begin
  Result := TTituloAReceberListEnumerator.Create(Self);
end;

function TTituloAReceberList.GetItems(AIndex: Integer): ITituloAReceber;
begin
  Result := FList[AIndex] as ITituloAReceber;
end;

function TTituloAReceberList.GetReference: TTituloAReceberList;
begin
  Result := Self;
end;

procedure TTituloAReceberList.SetItems(AIndex: Integer; const Value: ITituloAReceber);
begin
  FList[AIndex] := Value;
end;

{ TTituloAReceberListEnumerator }

constructor TTituloAReceberListEnumerator.Create(ATituloAReceberList: TTituloAReceberList);
begin
  inherited Create;
  FIndex := -1;
  FTituloAReceberList := ATituloAReceberList;
end;

function TTituloAReceberListEnumerator.GetCurrent: ITituloAReceber;
begin
  Result := FTituloAReceberList[FIndex];
end;

function TTituloAReceberListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FTituloAReceberList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TTituloAReceberListRec }

class function TTituloAReceberListRec.Create(const AList: ITituloAReceberList): TTituloAReceberListRec;
begin
  FillChar(Result, SizeOf(TTituloAReceberListRec), 0);
  Result.FList := AList;
end;

class operator TTituloAReceberListRec.Implicit(AListRec: TTituloAReceberListRec): TTituloAReceberList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TTituloAReceber }

function TTituloAReceber.GetId: Int64;
begin
  Result := FId;
end;

procedure TTituloAReceber.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TTituloAReceber.GetOrdem: Integer;
begin
  Result := FOrdem;
end;

procedure TTituloAReceber.SetOrdem(const AOrdem: Integer);
begin
  FOrdem := AOrdem;
end;

function TTituloAReceber.GetPrazo: Integer;
begin
  Result := FPrazo;
end;

procedure TTituloAReceber.SetPrazo(const APrazo: Integer);
begin
  FPrazo := APrazo;
end;

function TTituloAReceber.GetVencimento: TDateTime;
begin
  Result := FVencimento;
end;

procedure TTituloAReceber.SetVencimento(const AVencimento: TDateTime);
begin
  FVencimento := AVencimento;
end;

function TTituloAReceber.GetVencimentoOriginal: TDateTime;
begin
  Result := FVencimentoOriginal;
end;

procedure TTituloAReceber.SetVencimentoOriginal(const AVencimentoOriginal: TDateTime);
begin
  FVencimentoOriginal := AVencimentoOriginal;
end;

function TTituloAReceber.GetLiquidacao: TDateTime;
begin
  Result := FLiquidacao;
end;

procedure TTituloAReceber.SetLiquidacao(const ALiquidacao: TDateTime);
begin
  FLiquidacao := ALiquidacao;
end;

function TTituloAReceber.GetValor: Double;
begin
  Result := FValor;
end;

procedure TTituloAReceber.SetValor(const AValor: Double);
begin
  FValor := AValor;
end;

function TTituloAReceber.GetValorLiquido: Double;
begin
  Result := FValorLiquido;
end;

procedure TTituloAReceber.SetValorLiquido(const AValorLiquido: Double);
begin
  FValorLiquido := AValorLiquido;
end;

function TTituloAReceber.GetStatus: TStatusTitulo;
begin
  Result := FStatus;
end;

procedure TTituloAReceber.SetStatus(const AStatus: TStatusTitulo);
begin
  FStatus := AStatus;
end;

function TTituloAReceber.GetValorDevidoBruto: Double;
begin
  Result := FValorDevidoBruto;
end;

procedure TTituloAReceber.SetValorDevidoBruto(const AValorDevidoBruto: Double);
begin
  FValorDevidoBruto := AValorDevidoBruto;
end;

function TTituloAReceber.GetAgenteFinanceiroId: Int64;
begin
  Result := FAgenteFinanceiroId;
end;

procedure TTituloAReceber.SetAgenteFinanceiroId(const AAgenteFinanceiroId: Int64);
begin
  FAgenteFinanceiroId := AAgenteFinanceiroId;
end;

function TTituloAReceber.GetClienteId: Int64;
begin
  Result := FClienteId;
end;

procedure TTituloAReceber.SetClienteId(const AClienteId: Int64);
begin
  FClienteId := AClienteId;
end;

function TTituloAReceber.GetEspecieDocumentoId: Int64;
begin
  Result := FEspecieDocumentoId;
end;

procedure TTituloAReceber.SetEspecieDocumentoId(const AEspecieDocumentoId: Int64);
begin
  FEspecieDocumentoId := AEspecieDocumentoId;
end;

function TTituloAReceber.GetCategoriaFinanceiraId: Int64;
begin
  Result := FCategoriaFinanceiraId;
end;

procedure TTituloAReceber.SetCategoriaFinanceiraId(const ACategoriaFinanceiraId: Int64);
begin
  FCategoriaFinanceiraId := ACategoriaFinanceiraId;
end;

function TTituloAReceber.GetNumeroDocumento: TString;
begin
  Result := FNumeroDocumento;
end;

procedure TTituloAReceber.SetNumeroDocumento(const ANumeroDocumento: TString);
begin
  FNumeroDocumento := ANumeroDocumento;
end;


end.
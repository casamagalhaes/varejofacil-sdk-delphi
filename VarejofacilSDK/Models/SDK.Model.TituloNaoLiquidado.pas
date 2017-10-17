unit SDK.Model.TituloNaoLiquidado;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ITituloNaoLiquidado = interface(IModel)
    ['{B11CFDA5-43CA-45C2-9ADB-820F9C33E3DE}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetNumero: TString;
    procedure SetNumero(const ANumero: TString);
    function GetClienteId: Int64;
    procedure SetClienteId(const AClienteId: Int64);
    function GetNomeCliente: TString;
    procedure SetNomeCliente(const ANomeCliente: TString);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetDescricaoLoja: TString;
    procedure SetDescricaoLoja(const ADescricaoLoja: TString);
    function GetEmissao: TDateTime;
    procedure SetEmissao(const AEmissao: TDateTime);
    function GetVencimento: TDateTime;
    procedure SetVencimento(const AVencimento: TDateTime);
    function GetPagamento: TDateTime;
    procedure SetPagamento(const APagamento: TDateTime);
    function GetValorNominal: Double;
    procedure SetValorNominal(const AValorNominal: Double);
    function GetMultaPaga: Double;
    procedure SetMultaPaga(const AMultaPaga: Double);
    function GetJurosPago: Double;
    procedure SetJurosPago(const AJurosPago: Double);
    function GetValorPago: Double;
    procedure SetValorPago(const AValorPago: Double);
    function GetSaldo: Double;
    procedure SetSaldo(const ASaldo: Double);
    function GetAtraso: Integer;
    procedure SetAtraso(const AAtraso: Integer);
    function GetMulta: Double;
    procedure SetMulta(const AMulta: Double);
    function GetJuros: Double;
    procedure SetJuros(const AJuros: Double);
    function GetValorDevido: Double;
    procedure SetValorDevido(const AValorDevido: Double);
    property Id: Int64 read GetId write SetId;
    property Numero: TString read GetNumero write SetNumero;
    property ClienteId: Int64 read GetClienteId write SetClienteId;
    property NomeCliente: TString read GetNomeCliente write SetNomeCliente;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property DescricaoLoja: TString read GetDescricaoLoja write SetDescricaoLoja;
    property Emissao: TDateTime read GetEmissao write SetEmissao;
    property Vencimento: TDateTime read GetVencimento write SetVencimento;
    property Pagamento: TDateTime read GetPagamento write SetPagamento;
    property ValorNominal: Double read GetValorNominal write SetValorNominal;
    property MultaPaga: Double read GetMultaPaga write SetMultaPaga;
    property JurosPago: Double read GetJurosPago write SetJurosPago;
    property ValorPago: Double read GetValorPago write SetValorPago;
    property Saldo: Double read GetSaldo write SetSaldo;
    property Atraso: Integer read GetAtraso write SetAtraso;
    property Multa: Double read GetMulta write SetMulta;
    property Juros: Double read GetJuros write SetJuros;
    property ValorDevido: Double read GetValorDevido write SetValorDevido;
  end;

  TTituloNaoLiquidadoList = class;

  ITituloNaoLiquidadoList = interface
	['{8777182D-1A4B-4F33-AF5B-36BA93DAED61}']
    function GetReference: TTituloNaoLiquidadoList;
    function GetItems(AIndex: Integer): ITituloNaoLiquidado;
    procedure SetItems(AIndex: Integer; const Value: ITituloNaoLiquidado);
    procedure Add(const ATituloNaoLiquidado: ITituloNaoLiquidado);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ITituloNaoLiquidado read GetItems write SetItems; default;
  end;

  TTituloNaoLiquidadoListEnumerator = class
  private
    FIndex: Integer;
    FTituloNaoLiquidadoList: TTituloNaoLiquidadoList;
  public
    constructor Create(ATituloNaoLiquidadoList: TTituloNaoLiquidadoList);
    function GetCurrent: ITituloNaoLiquidado; inline;
    function MoveNext: Boolean;
    property Current: ITituloNaoLiquidado read GetCurrent;
  end;

  TTituloNaoLiquidadoList = class(TInterfacedObject, ITituloNaoLiquidadoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ITituloNaoLiquidado;
    procedure SetItems(AIndex: Integer; const Value: ITituloNaoLiquidado);
  public
    constructor Create;
    procedure Add(const ATituloNaoLiquidado: ITituloNaoLiquidado);
    destructor Destroy; override;
    function GetEnumerator: TTituloNaoLiquidadoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TTituloNaoLiquidadoList;
    property Items[AIndex: Integer]: ITituloNaoLiquidado read GetItems write SetItems; default;
  end;

  TTituloNaoLiquidadoListRec = record
  private
    FList: ITituloNaoLiquidadoList;
  public
    class function Create(const AList: ITituloNaoLiquidadoList): TTituloNaoLiquidadoListRec; static;
    class operator Implicit(AListRec: TTituloNaoLiquidadoListRec): TTituloNaoLiquidadoList;
  end;

  TTituloNaoLiquidado = class(TInterfacedModel, ITituloNaoLiquidado)
  private
	FId: Int64;
	FNumero: TString;
	FClienteId: Int64;
	FNomeCliente: TString;
	FLojaId: Int64;
	FDescricaoLoja: TString;
	FEmissao: TDateTime;
	FVencimento: TDateTime;
	FPagamento: TDateTime;
	FValorNominal: Double;
	FMultaPaga: Double;
	FJurosPago: Double;
	FValorPago: Double;
	FSaldo: Double;
	FAtraso: Integer;
	FMulta: Double;
	FJuros: Double;
	FValorDevido: Double;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetNumero: TString;
    procedure SetNumero(const ANumero: TString);
    function GetClienteId: Int64;
    procedure SetClienteId(const AClienteId: Int64);
    function GetNomeCliente: TString;
    procedure SetNomeCliente(const ANomeCliente: TString);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetDescricaoLoja: TString;
    procedure SetDescricaoLoja(const ADescricaoLoja: TString);
    function GetEmissao: TDateTime;
    procedure SetEmissao(const AEmissao: TDateTime);
    function GetVencimento: TDateTime;
    procedure SetVencimento(const AVencimento: TDateTime);
    function GetPagamento: TDateTime;
    procedure SetPagamento(const APagamento: TDateTime);
    function GetValorNominal: Double;
    procedure SetValorNominal(const AValorNominal: Double);
    function GetMultaPaga: Double;
    procedure SetMultaPaga(const AMultaPaga: Double);
    function GetJurosPago: Double;
    procedure SetJurosPago(const AJurosPago: Double);
    function GetValorPago: Double;
    procedure SetValorPago(const AValorPago: Double);
    function GetSaldo: Double;
    procedure SetSaldo(const ASaldo: Double);
    function GetAtraso: Integer;
    procedure SetAtraso(const AAtraso: Integer);
    function GetMulta: Double;
    procedure SetMulta(const AMulta: Double);
    function GetJuros: Double;
    procedure SetJuros(const AJuros: Double);
    function GetValorDevido: Double;
    procedure SetValorDevido(const AValorDevido: Double);
  published
    property Id: Int64 read GetId write SetId;
    property Numero: TString read GetNumero write SetNumero;
    property ClienteId: Int64 read GetClienteId write SetClienteId;
    property NomeCliente: TString read GetNomeCliente write SetNomeCliente;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property DescricaoLoja: TString read GetDescricaoLoja write SetDescricaoLoja;
    property Emissao: TDateTime read GetEmissao write SetEmissao;
    property Vencimento: TDateTime read GetVencimento write SetVencimento;
    property Pagamento: TDateTime read GetPagamento write SetPagamento;
    property ValorNominal: Double read GetValorNominal write SetValorNominal;
    property MultaPaga: Double read GetMultaPaga write SetMultaPaga;
    property JurosPago: Double read GetJurosPago write SetJurosPago;
    property ValorPago: Double read GetValorPago write SetValorPago;
    property Saldo: Double read GetSaldo write SetSaldo;
    property Atraso: Integer read GetAtraso write SetAtraso;
    property Multa: Double read GetMulta write SetMulta;
    property Juros: Double read GetJuros write SetJuros;
    property ValorDevido: Double read GetValorDevido write SetValorDevido;
  end;

implementation

{ TTituloNaoLiquidadoList }

procedure TTituloNaoLiquidadoList.Add(const ATituloNaoLiquidado: ITituloNaoLiquidado);
begin
  FList.Add(ATituloNaoLiquidado);
end;

procedure TTituloNaoLiquidadoList.Clear;
begin
  FList.Clear;
end;

function TTituloNaoLiquidadoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TTituloNaoLiquidadoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TTituloNaoLiquidadoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TTituloNaoLiquidadoList.GetEnumerator: TTituloNaoLiquidadoListEnumerator;
begin
  Result := TTituloNaoLiquidadoListEnumerator.Create(Self);
end;

function TTituloNaoLiquidadoList.GetItems(AIndex: Integer): ITituloNaoLiquidado;
begin
  Result := FList[AIndex] as ITituloNaoLiquidado;
end;

function TTituloNaoLiquidadoList.GetReference: TTituloNaoLiquidadoList;
begin
  Result := Self;
end;

procedure TTituloNaoLiquidadoList.SetItems(AIndex: Integer; const Value: ITituloNaoLiquidado);
begin
  FList[AIndex] := Value;
end;

{ TTituloNaoLiquidadoListEnumerator }

constructor TTituloNaoLiquidadoListEnumerator.Create(ATituloNaoLiquidadoList: TTituloNaoLiquidadoList);
begin
  inherited Create;
  FIndex := -1;
  FTituloNaoLiquidadoList := ATituloNaoLiquidadoList;
end;

function TTituloNaoLiquidadoListEnumerator.GetCurrent: ITituloNaoLiquidado;
begin
  Result := FTituloNaoLiquidadoList[FIndex];
end;

function TTituloNaoLiquidadoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FTituloNaoLiquidadoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TTituloNaoLiquidadoListRec }

class function TTituloNaoLiquidadoListRec.Create(const AList: ITituloNaoLiquidadoList): TTituloNaoLiquidadoListRec;
begin
  FillChar(Result, SizeOf(TTituloNaoLiquidadoListRec), 0);
  Result.FList := AList;
end;

class operator TTituloNaoLiquidadoListRec.Implicit(AListRec: TTituloNaoLiquidadoListRec): TTituloNaoLiquidadoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TTituloNaoLiquidado }

function TTituloNaoLiquidado.GetId: Int64;
begin
  Result := FId;
end;

procedure TTituloNaoLiquidado.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TTituloNaoLiquidado.GetNumero: TString;
begin
  Result := FNumero;
end;

procedure TTituloNaoLiquidado.SetNumero(const ANumero: TString);
begin
  FNumero := ANumero;
end;

function TTituloNaoLiquidado.GetClienteId: Int64;
begin
  Result := FClienteId;
end;

procedure TTituloNaoLiquidado.SetClienteId(const AClienteId: Int64);
begin
  FClienteId := AClienteId;
end;

function TTituloNaoLiquidado.GetNomeCliente: TString;
begin
  Result := FNomeCliente;
end;

procedure TTituloNaoLiquidado.SetNomeCliente(const ANomeCliente: TString);
begin
  FNomeCliente := ANomeCliente;
end;

function TTituloNaoLiquidado.GetLojaId: Int64;
begin
  Result := FLojaId;
end;

procedure TTituloNaoLiquidado.SetLojaId(const ALojaId: Int64);
begin
  FLojaId := ALojaId;
end;

function TTituloNaoLiquidado.GetDescricaoLoja: TString;
begin
  Result := FDescricaoLoja;
end;

procedure TTituloNaoLiquidado.SetDescricaoLoja(const ADescricaoLoja: TString);
begin
  FDescricaoLoja := ADescricaoLoja;
end;

function TTituloNaoLiquidado.GetEmissao: TDateTime;
begin
  Result := FEmissao;
end;

procedure TTituloNaoLiquidado.SetEmissao(const AEmissao: TDateTime);
begin
  FEmissao := AEmissao;
end;

function TTituloNaoLiquidado.GetVencimento: TDateTime;
begin
  Result := FVencimento;
end;

procedure TTituloNaoLiquidado.SetVencimento(const AVencimento: TDateTime);
begin
  FVencimento := AVencimento;
end;

function TTituloNaoLiquidado.GetPagamento: TDateTime;
begin
  Result := FPagamento;
end;

procedure TTituloNaoLiquidado.SetPagamento(const APagamento: TDateTime);
begin
  FPagamento := APagamento;
end;

function TTituloNaoLiquidado.GetValorNominal: Double;
begin
  Result := FValorNominal;
end;

procedure TTituloNaoLiquidado.SetValorNominal(const AValorNominal: Double);
begin
  FValorNominal := AValorNominal;
end;

function TTituloNaoLiquidado.GetMultaPaga: Double;
begin
  Result := FMultaPaga;
end;

procedure TTituloNaoLiquidado.SetMultaPaga(const AMultaPaga: Double);
begin
  FMultaPaga := AMultaPaga;
end;

function TTituloNaoLiquidado.GetJurosPago: Double;
begin
  Result := FJurosPago;
end;

procedure TTituloNaoLiquidado.SetJurosPago(const AJurosPago: Double);
begin
  FJurosPago := AJurosPago;
end;

function TTituloNaoLiquidado.GetValorPago: Double;
begin
  Result := FValorPago;
end;

procedure TTituloNaoLiquidado.SetValorPago(const AValorPago: Double);
begin
  FValorPago := AValorPago;
end;

function TTituloNaoLiquidado.GetSaldo: Double;
begin
  Result := FSaldo;
end;

procedure TTituloNaoLiquidado.SetSaldo(const ASaldo: Double);
begin
  FSaldo := ASaldo;
end;

function TTituloNaoLiquidado.GetAtraso: Integer;
begin
  Result := FAtraso;
end;

procedure TTituloNaoLiquidado.SetAtraso(const AAtraso: Integer);
begin
  FAtraso := AAtraso;
end;

function TTituloNaoLiquidado.GetMulta: Double;
begin
  Result := FMulta;
end;

procedure TTituloNaoLiquidado.SetMulta(const AMulta: Double);
begin
  FMulta := AMulta;
end;

function TTituloNaoLiquidado.GetJuros: Double;
begin
  Result := FJuros;
end;

procedure TTituloNaoLiquidado.SetJuros(const AJuros: Double);
begin
  FJuros := AJuros;
end;

function TTituloNaoLiquidado.GetValorDevido: Double;
begin
  Result := FValorDevido;
end;

procedure TTituloNaoLiquidado.SetValorDevido(const AValorDevido: Double);
begin
  FValorDevido := AValorDevido;
end;


end.
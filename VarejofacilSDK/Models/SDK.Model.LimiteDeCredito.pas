unit SDK.Model.LimiteDeCredito;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ILimiteDeCredito = interface(IModel)
    ['{AEEBF1D1-A3D8-4FEC-A3EC-522B9003E18B}']
    function GetCodigoDoCliente: Int64;
    procedure SetCodigoDoCliente(const ACodigoDoCliente: Int64);
    function GetNomeDoCliente: TString;
    procedure SetNomeDoCliente(const ANomeDoCliente: TString);
    function GetInscricaoEstadual: TString;
    procedure SetInscricaoEstadual(const AInscricaoEstadual: TString);
    function GetNumeroDocumento: TString;
    procedure SetNumeroDocumento(const ANumeroDocumento: TString);
    function GetTelefones: TString;
    procedure SetTelefones(const ATelefones: TString);
    function GetLogradouro: TString;
    procedure SetLogradouro(const ALogradouro: TString);
    function GetNumero: TString;
    procedure SetNumero(const ANumero: TString);
    function GetBairro: TString;
    procedure SetBairro(const ABairro: TString);
    function GetUf: TString;
    procedure SetUf(const AUf: TString);
    function GetCidade: TString;
    procedure SetCidade(const ACidade: TString);
    function GetCodigoDaFinalizadora: Integer;
    procedure SetCodigoDaFinalizadora(const ACodigoDaFinalizadora: Integer);
    function GetDescricaoDaFinalizadora: TString;
    procedure SetDescricaoDaFinalizadora(const ADescricaoDaFinalizadora: TString);
    function GetLimiteDeCredito: Double;
    procedure SetLimiteDeCredito(const ALimiteDeCredito: Double);
    function GetLimiteDisponivel: Double;
    procedure SetLimiteDisponivel(const ALimiteDisponivel: Double);
    function GetSituacao: TSituacaoLimiteCliente;
    procedure SetSituacao(const ASituacao: TSituacaoLimiteCliente);
    function GetStatusCliente: TStatusBloqueioCliente;
    procedure SetStatusCliente(const AStatusCliente: TStatusBloqueioCliente);
    property CodigoDoCliente: Int64 read GetCodigoDoCliente write SetCodigoDoCliente;
    property NomeDoCliente: TString read GetNomeDoCliente write SetNomeDoCliente;
    property InscricaoEstadual: TString read GetInscricaoEstadual write SetInscricaoEstadual;
    property NumeroDocumento: TString read GetNumeroDocumento write SetNumeroDocumento;
    property Telefones: TString read GetTelefones write SetTelefones;
    property Logradouro: TString read GetLogradouro write SetLogradouro;
    property Numero: TString read GetNumero write SetNumero;
    property Bairro: TString read GetBairro write SetBairro;
    property Uf: TString read GetUf write SetUf;
    property Cidade: TString read GetCidade write SetCidade;
    property CodigoDaFinalizadora: Integer read GetCodigoDaFinalizadora write SetCodigoDaFinalizadora;
    property DescricaoDaFinalizadora: TString read GetDescricaoDaFinalizadora write SetDescricaoDaFinalizadora;
    property LimiteDeCredito: Double read GetLimiteDeCredito write SetLimiteDeCredito;
    property LimiteDisponivel: Double read GetLimiteDisponivel write SetLimiteDisponivel;
    property Situacao: TSituacaoLimiteCliente read GetSituacao write SetSituacao;
    property StatusCliente: TStatusBloqueioCliente read GetStatusCliente write SetStatusCliente;
  end;

  TLimiteDeCreditoList = class;

  ILimiteDeCreditoList = interface
	['{563C1287-F01A-49C9-B89A-98B575369455}']
    function GetReference: TLimiteDeCreditoList;
    function GetItems(AIndex: Integer): ILimiteDeCredito;
    procedure SetItems(AIndex: Integer; const Value: ILimiteDeCredito);
    procedure Add(const ALimiteDeCredito: ILimiteDeCredito);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ILimiteDeCredito read GetItems write SetItems; default;
  end;

  TLimiteDeCreditoListEnumerator = class
  private
    FIndex: Integer;
    FLimiteDeCreditoList: TLimiteDeCreditoList;
  public
    constructor Create(ALimiteDeCreditoList: TLimiteDeCreditoList);
    function GetCurrent: ILimiteDeCredito; inline;
    function MoveNext: Boolean;
    property Current: ILimiteDeCredito read GetCurrent;
  end;

  TLimiteDeCreditoList = class(TInterfacedObject, ILimiteDeCreditoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ILimiteDeCredito;
    procedure SetItems(AIndex: Integer; const Value: ILimiteDeCredito);
  public
    constructor Create;
    procedure Add(const ALimiteDeCredito: ILimiteDeCredito);
    destructor Destroy; override;
    function GetEnumerator: TLimiteDeCreditoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TLimiteDeCreditoList;
    property Items[AIndex: Integer]: ILimiteDeCredito read GetItems write SetItems; default;
  end;

  TLimiteDeCreditoListRec = record
  private
    FList: ILimiteDeCreditoList;
  public
    class function Create(const AList: ILimiteDeCreditoList): TLimiteDeCreditoListRec; static;
    class operator Implicit(AListRec: TLimiteDeCreditoListRec): TLimiteDeCreditoList;
  end;

  TLimiteDeCredito = class(TInterfacedModel, ILimiteDeCredito)
  private
	FCodigoDoCliente: Int64;
	FNomeDoCliente: TString;
	FInscricaoEstadual: TString;
	FNumeroDocumento: TString;
	FTelefones: TString;
	FLogradouro: TString;
	FNumero: TString;
	FBairro: TString;
	FUf: TString;
	FCidade: TString;
	FCodigoDaFinalizadora: Integer;
	FDescricaoDaFinalizadora: TString;
	FLimiteDeCredito: Double;
	FLimiteDisponivel: Double;
	FSituacao: TSituacaoLimiteCliente;
	FStatusCliente: TStatusBloqueioCliente;
    function GetCodigoDoCliente: Int64;
    procedure SetCodigoDoCliente(const ACodigoDoCliente: Int64);
    function GetNomeDoCliente: TString;
    procedure SetNomeDoCliente(const ANomeDoCliente: TString);
    function GetInscricaoEstadual: TString;
    procedure SetInscricaoEstadual(const AInscricaoEstadual: TString);
    function GetNumeroDocumento: TString;
    procedure SetNumeroDocumento(const ANumeroDocumento: TString);
    function GetTelefones: TString;
    procedure SetTelefones(const ATelefones: TString);
    function GetLogradouro: TString;
    procedure SetLogradouro(const ALogradouro: TString);
    function GetNumero: TString;
    procedure SetNumero(const ANumero: TString);
    function GetBairro: TString;
    procedure SetBairro(const ABairro: TString);
    function GetUf: TString;
    procedure SetUf(const AUf: TString);
    function GetCidade: TString;
    procedure SetCidade(const ACidade: TString);
    function GetCodigoDaFinalizadora: Integer;
    procedure SetCodigoDaFinalizadora(const ACodigoDaFinalizadora: Integer);
    function GetDescricaoDaFinalizadora: TString;
    procedure SetDescricaoDaFinalizadora(const ADescricaoDaFinalizadora: TString);
    function GetLimiteDeCredito: Double;
    procedure SetLimiteDeCredito(const ALimiteDeCredito: Double);
    function GetLimiteDisponivel: Double;
    procedure SetLimiteDisponivel(const ALimiteDisponivel: Double);
    function GetSituacao: TSituacaoLimiteCliente;
    procedure SetSituacao(const ASituacao: TSituacaoLimiteCliente);
    function GetStatusCliente: TStatusBloqueioCliente;
    procedure SetStatusCliente(const AStatusCliente: TStatusBloqueioCliente);
  published
    property CodigoDoCliente: Int64 read GetCodigoDoCliente write SetCodigoDoCliente;
    property NomeDoCliente: TString read GetNomeDoCliente write SetNomeDoCliente;
    property InscricaoEstadual: TString read GetInscricaoEstadual write SetInscricaoEstadual;
    property NumeroDocumento: TString read GetNumeroDocumento write SetNumeroDocumento;
    property Telefones: TString read GetTelefones write SetTelefones;
    property Logradouro: TString read GetLogradouro write SetLogradouro;
    property Numero: TString read GetNumero write SetNumero;
    property Bairro: TString read GetBairro write SetBairro;
    property Uf: TString read GetUf write SetUf;
    property Cidade: TString read GetCidade write SetCidade;
    property CodigoDaFinalizadora: Integer read GetCodigoDaFinalizadora write SetCodigoDaFinalizadora;
    property DescricaoDaFinalizadora: TString read GetDescricaoDaFinalizadora write SetDescricaoDaFinalizadora;
    property LimiteDeCredito: Double read GetLimiteDeCredito write SetLimiteDeCredito;
    property LimiteDisponivel: Double read GetLimiteDisponivel write SetLimiteDisponivel;
    property Situacao: TSituacaoLimiteCliente read GetSituacao write SetSituacao;
    property StatusCliente: TStatusBloqueioCliente read GetStatusCliente write SetStatusCliente;
  end;

implementation

{ TLimiteDeCreditoList }

procedure TLimiteDeCreditoList.Add(const ALimiteDeCredito: ILimiteDeCredito);
begin
  FList.Add(ALimiteDeCredito);
end;

procedure TLimiteDeCreditoList.Clear;
begin
  FList.Clear;
end;

function TLimiteDeCreditoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TLimiteDeCreditoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TLimiteDeCreditoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TLimiteDeCreditoList.GetEnumerator: TLimiteDeCreditoListEnumerator;
begin
  Result := TLimiteDeCreditoListEnumerator.Create(Self);
end;

function TLimiteDeCreditoList.GetItems(AIndex: Integer): ILimiteDeCredito;
begin
  Result := FList[AIndex] as ILimiteDeCredito;
end;

function TLimiteDeCreditoList.GetReference: TLimiteDeCreditoList;
begin
  Result := Self;
end;

procedure TLimiteDeCreditoList.SetItems(AIndex: Integer; const Value: ILimiteDeCredito);
begin
  FList[AIndex] := Value;
end;

{ TLimiteDeCreditoListEnumerator }

constructor TLimiteDeCreditoListEnumerator.Create(ALimiteDeCreditoList: TLimiteDeCreditoList);
begin
  inherited Create;
  FIndex := -1;
  FLimiteDeCreditoList := ALimiteDeCreditoList;
end;

function TLimiteDeCreditoListEnumerator.GetCurrent: ILimiteDeCredito;
begin
  Result := FLimiteDeCreditoList[FIndex];
end;

function TLimiteDeCreditoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FLimiteDeCreditoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TLimiteDeCreditoListRec }

class function TLimiteDeCreditoListRec.Create(const AList: ILimiteDeCreditoList): TLimiteDeCreditoListRec;
begin
  FillChar(Result, SizeOf(TLimiteDeCreditoListRec), 0);
  Result.FList := AList;
end;

class operator TLimiteDeCreditoListRec.Implicit(AListRec: TLimiteDeCreditoListRec): TLimiteDeCreditoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TLimiteDeCredito }

function TLimiteDeCredito.GetCodigoDoCliente: Int64;
begin
  Result := FCodigoDoCliente;
end;

procedure TLimiteDeCredito.SetCodigoDoCliente(const ACodigoDoCliente: Int64);
begin
  FCodigoDoCliente := ACodigoDoCliente;
end;

function TLimiteDeCredito.GetNomeDoCliente: TString;
begin
  Result := FNomeDoCliente;
end;

procedure TLimiteDeCredito.SetNomeDoCliente(const ANomeDoCliente: TString);
begin
  FNomeDoCliente := ANomeDoCliente;
end;

function TLimiteDeCredito.GetInscricaoEstadual: TString;
begin
  Result := FInscricaoEstadual;
end;

procedure TLimiteDeCredito.SetInscricaoEstadual(const AInscricaoEstadual: TString);
begin
  FInscricaoEstadual := AInscricaoEstadual;
end;

function TLimiteDeCredito.GetNumeroDocumento: TString;
begin
  Result := FNumeroDocumento;
end;

procedure TLimiteDeCredito.SetNumeroDocumento(const ANumeroDocumento: TString);
begin
  FNumeroDocumento := ANumeroDocumento;
end;

function TLimiteDeCredito.GetTelefones: TString;
begin
  Result := FTelefones;
end;

procedure TLimiteDeCredito.SetTelefones(const ATelefones: TString);
begin
  FTelefones := ATelefones;
end;

function TLimiteDeCredito.GetLogradouro: TString;
begin
  Result := FLogradouro;
end;

procedure TLimiteDeCredito.SetLogradouro(const ALogradouro: TString);
begin
  FLogradouro := ALogradouro;
end;

function TLimiteDeCredito.GetNumero: TString;
begin
  Result := FNumero;
end;

procedure TLimiteDeCredito.SetNumero(const ANumero: TString);
begin
  FNumero := ANumero;
end;

function TLimiteDeCredito.GetBairro: TString;
begin
  Result := FBairro;
end;

procedure TLimiteDeCredito.SetBairro(const ABairro: TString);
begin
  FBairro := ABairro;
end;

function TLimiteDeCredito.GetUf: TString;
begin
  Result := FUf;
end;

procedure TLimiteDeCredito.SetUf(const AUf: TString);
begin
  FUf := AUf;
end;

function TLimiteDeCredito.GetCidade: TString;
begin
  Result := FCidade;
end;

procedure TLimiteDeCredito.SetCidade(const ACidade: TString);
begin
  FCidade := ACidade;
end;

function TLimiteDeCredito.GetCodigoDaFinalizadora: Integer;
begin
  Result := FCodigoDaFinalizadora;
end;

procedure TLimiteDeCredito.SetCodigoDaFinalizadora(const ACodigoDaFinalizadora: Integer);
begin
  FCodigoDaFinalizadora := ACodigoDaFinalizadora;
end;

function TLimiteDeCredito.GetDescricaoDaFinalizadora: TString;
begin
  Result := FDescricaoDaFinalizadora;
end;

procedure TLimiteDeCredito.SetDescricaoDaFinalizadora(const ADescricaoDaFinalizadora: TString);
begin
  FDescricaoDaFinalizadora := ADescricaoDaFinalizadora;
end;

function TLimiteDeCredito.GetLimiteDeCredito: Double;
begin
  Result := FLimiteDeCredito;
end;

procedure TLimiteDeCredito.SetLimiteDeCredito(const ALimiteDeCredito: Double);
begin
  FLimiteDeCredito := ALimiteDeCredito;
end;

function TLimiteDeCredito.GetLimiteDisponivel: Double;
begin
  Result := FLimiteDisponivel;
end;

procedure TLimiteDeCredito.SetLimiteDisponivel(const ALimiteDisponivel: Double);
begin
  FLimiteDisponivel := ALimiteDisponivel;
end;

function TLimiteDeCredito.GetSituacao: TSituacaoLimiteCliente;
begin
  Result := FSituacao;
end;

procedure TLimiteDeCredito.SetSituacao(const ASituacao: TSituacaoLimiteCliente);
begin
  FSituacao := ASituacao;
end;

function TLimiteDeCredito.GetStatusCliente: TStatusBloqueioCliente;
begin
  Result := FStatusCliente;
end;

procedure TLimiteDeCredito.SetStatusCliente(const AStatusCliente: TStatusBloqueioCliente);
begin
  FStatusCliente := AStatusCliente;
end;


end.
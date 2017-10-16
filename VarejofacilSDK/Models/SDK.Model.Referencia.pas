unit SDK.Model.Referencia;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IReferencia = interface(IModel)
    ['{AD4880C4-FD2D-4C47-92F2-8F1DA32F32ED}']
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetNome: TString;
    procedure SetNome(const ANome: TString);
    function GetNumeroCartao: TString;
    procedure SetNumeroCartao(const ANumeroCartao: TString);
    function GetTipoReferencia: TTipoReferencia;
    procedure SetTipoReferencia(const ATipoReferencia: TTipoReferencia);
    function GetValidadeCartao: TString;
    procedure SetValidadeCartao(const AValidadeCartao: TString);
    function GetContaCorrente: TString;
    procedure SetContaCorrente(const AContaCorrente: TString);
    function GetAgencia: TString;
    procedure SetAgencia(const AAgencia: TString);
    function GetSetor: TString;
    procedure SetSetor(const ASetor: TString);
    function GetDataDeAbertura: TString;
    procedure SetDataDeAbertura(const ADataDeAbertura: TString);
    function GetEndereco: TString;
    procedure SetEndereco(const AEndereco: TString);
    function GetBairro: TString;
    procedure SetBairro(const ABairro: TString);
    function GetCidade: TString;
    procedure SetCidade(const ACidade: TString);
    function GetCep: TString;
    procedure SetCep(const ACep: TString);
    function GetEstado: TString;
    procedure SetEstado(const AEstado: TString);
    function GetTelefone: TString;
    procedure SetTelefone(const ATelefone: TString);
    function GetTelefone2: TString;
    procedure SetTelefone2(const ATelefone2: TString);
    function GetObservacao: TString;
    procedure SetObservacao(const AObservacao: TString);
    function GetSexo: TString;
    procedure SetSexo(const ASexo: TString);
    function GetSituacaoSerasa: TString;
    procedure SetSituacaoSerasa(const ASituacaoSerasa: TString);
    function GetSituacaoSpc: TString;
    procedure SetSituacaoSpc(const ASituacaoSpc: TString);
    function GetCargo: TString;
    procedure SetCargo(const ACargo: TString);
    function GetContato: TString;
    procedure SetContato(const AContato: TString);
    function GetSalario: Double;
    procedure SetSalario(const ASalario: Double);
    function GetOutraRenda: TString;
    procedure SetOutraRenda(const AOutraRenda: TString);
    function GetAdministradora: TString;
    procedure SetAdministradora(const AAdministradora: TString);
    function GetNomeEmpresa: TString;
    procedure SetNomeEmpresa(const ANomeEmpresa: TString);
    function GetDataAdmissao: TString;
    procedure SetDataAdmissao(const ADataAdmissao: TString);
    property Id: Integer read GetId write SetId;
    property Nome: TString read GetNome write SetNome;
    property NumeroCartao: TString read GetNumeroCartao write SetNumeroCartao;
    property TipoReferencia: TTipoReferencia read GetTipoReferencia write SetTipoReferencia;
    property ValidadeCartao: TString read GetValidadeCartao write SetValidadeCartao;
    property ContaCorrente: TString read GetContaCorrente write SetContaCorrente;
    property Agencia: TString read GetAgencia write SetAgencia;
    property Setor: TString read GetSetor write SetSetor;
    property DataDeAbertura: TString read GetDataDeAbertura write SetDataDeAbertura;
    property Endereco: TString read GetEndereco write SetEndereco;
    property Bairro: TString read GetBairro write SetBairro;
    property Cidade: TString read GetCidade write SetCidade;
    property Cep: TString read GetCep write SetCep;
    property Estado: TString read GetEstado write SetEstado;
    property Telefone: TString read GetTelefone write SetTelefone;
    property Telefone2: TString read GetTelefone2 write SetTelefone2;
    property Observacao: TString read GetObservacao write SetObservacao;
    property Sexo: TString read GetSexo write SetSexo;
    property SituacaoSerasa: TString read GetSituacaoSerasa write SetSituacaoSerasa;
    property SituacaoSpc: TString read GetSituacaoSpc write SetSituacaoSpc;
    property Cargo: TString read GetCargo write SetCargo;
    property Contato: TString read GetContato write SetContato;
    property Salario: Double read GetSalario write SetSalario;
    property OutraRenda: TString read GetOutraRenda write SetOutraRenda;
    property Administradora: TString read GetAdministradora write SetAdministradora;
    property NomeEmpresa: TString read GetNomeEmpresa write SetNomeEmpresa;
    property DataAdmissao: TString read GetDataAdmissao write SetDataAdmissao;
  end;

  TReferenciaList = class;

  IReferenciaList = interface
	['{8594C2C8-AF52-429E-A3F5-09B58AB094A3}']
    function GetReference: TReferenciaList;
    function GetItems(AIndex: Integer): IReferencia;
    procedure SetItems(AIndex: Integer; const Value: IReferencia);
    procedure Add(const AReferencia: IReferencia);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IReferencia read GetItems write SetItems; default;
  end;

  TReferenciaListEnumerator = class
  private
    FIndex: Integer;
    FReferenciaList: TReferenciaList;
  public
    constructor Create(AReferenciaList: TReferenciaList);
    function GetCurrent: IReferencia; inline;
    function MoveNext: Boolean;
    property Current: IReferencia read GetCurrent;
  end;

  TReferenciaList = class(TInterfacedObject, IReferenciaList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IReferencia;
    procedure SetItems(AIndex: Integer; const Value: IReferencia);
  public
    constructor Create;
    procedure Add(const AReferencia: IReferencia);
    destructor Destroy; override;
    function GetEnumerator: TReferenciaListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TReferenciaList;
    property Items[AIndex: Integer]: IReferencia read GetItems write SetItems; default;
  end;

  TReferenciaListRec = record
  private
    FList: IReferenciaList;
  public
    class function Create(const AList: IReferenciaList): TReferenciaListRec; static;
    class operator Implicit(AListRec: TReferenciaListRec): TReferenciaList;
  end;

  TReferencia = class(TInterfacedModel, IReferencia)
  private
	FId: Integer;
	FNome: TString;
	FNumeroCartao: TString;
	FTipoReferencia: TTipoReferencia;
	FValidadeCartao: TString;
	FContaCorrente: TString;
	FAgencia: TString;
	FSetor: TString;
	FDataDeAbertura: TString;
	FEndereco: TString;
	FBairro: TString;
	FCidade: TString;
	FCep: TString;
	FEstado: TString;
	FTelefone: TString;
	FTelefone2: TString;
	FObservacao: TString;
	FSexo: TString;
	FSituacaoSerasa: TString;
	FSituacaoSpc: TString;
	FCargo: TString;
	FContato: TString;
	FSalario: Double;
	FOutraRenda: TString;
	FAdministradora: TString;
	FNomeEmpresa: TString;
	FDataAdmissao: TString;
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetNome: TString;
    procedure SetNome(const ANome: TString);
    function GetNumeroCartao: TString;
    procedure SetNumeroCartao(const ANumeroCartao: TString);
    function GetTipoReferencia: TTipoReferencia;
    procedure SetTipoReferencia(const ATipoReferencia: TTipoReferencia);
    function GetValidadeCartao: TString;
    procedure SetValidadeCartao(const AValidadeCartao: TString);
    function GetContaCorrente: TString;
    procedure SetContaCorrente(const AContaCorrente: TString);
    function GetAgencia: TString;
    procedure SetAgencia(const AAgencia: TString);
    function GetSetor: TString;
    procedure SetSetor(const ASetor: TString);
    function GetDataDeAbertura: TString;
    procedure SetDataDeAbertura(const ADataDeAbertura: TString);
    function GetEndereco: TString;
    procedure SetEndereco(const AEndereco: TString);
    function GetBairro: TString;
    procedure SetBairro(const ABairro: TString);
    function GetCidade: TString;
    procedure SetCidade(const ACidade: TString);
    function GetCep: TString;
    procedure SetCep(const ACep: TString);
    function GetEstado: TString;
    procedure SetEstado(const AEstado: TString);
    function GetTelefone: TString;
    procedure SetTelefone(const ATelefone: TString);
    function GetTelefone2: TString;
    procedure SetTelefone2(const ATelefone2: TString);
    function GetObservacao: TString;
    procedure SetObservacao(const AObservacao: TString);
    function GetSexo: TString;
    procedure SetSexo(const ASexo: TString);
    function GetSituacaoSerasa: TString;
    procedure SetSituacaoSerasa(const ASituacaoSerasa: TString);
    function GetSituacaoSpc: TString;
    procedure SetSituacaoSpc(const ASituacaoSpc: TString);
    function GetCargo: TString;
    procedure SetCargo(const ACargo: TString);
    function GetContato: TString;
    procedure SetContato(const AContato: TString);
    function GetSalario: Double;
    procedure SetSalario(const ASalario: Double);
    function GetOutraRenda: TString;
    procedure SetOutraRenda(const AOutraRenda: TString);
    function GetAdministradora: TString;
    procedure SetAdministradora(const AAdministradora: TString);
    function GetNomeEmpresa: TString;
    procedure SetNomeEmpresa(const ANomeEmpresa: TString);
    function GetDataAdmissao: TString;
    procedure SetDataAdmissao(const ADataAdmissao: TString);
  public
    property Id: Integer read GetId write SetId;
    property Nome: TString read GetNome write SetNome;
    property NumeroCartao: TString read GetNumeroCartao write SetNumeroCartao;
    property TipoReferencia: TTipoReferencia read GetTipoReferencia write SetTipoReferencia;
    property ValidadeCartao: TString read GetValidadeCartao write SetValidadeCartao;
    property ContaCorrente: TString read GetContaCorrente write SetContaCorrente;
    property Agencia: TString read GetAgencia write SetAgencia;
    property Setor: TString read GetSetor write SetSetor;
    property DataDeAbertura: TString read GetDataDeAbertura write SetDataDeAbertura;
    property Endereco: TString read GetEndereco write SetEndereco;
    property Bairro: TString read GetBairro write SetBairro;
    property Cidade: TString read GetCidade write SetCidade;
    property Cep: TString read GetCep write SetCep;
    property Estado: TString read GetEstado write SetEstado;
    property Telefone: TString read GetTelefone write SetTelefone;
    property Telefone2: TString read GetTelefone2 write SetTelefone2;
    property Observacao: TString read GetObservacao write SetObservacao;
    property Sexo: TString read GetSexo write SetSexo;
    property SituacaoSerasa: TString read GetSituacaoSerasa write SetSituacaoSerasa;
    property SituacaoSpc: TString read GetSituacaoSpc write SetSituacaoSpc;
    property Cargo: TString read GetCargo write SetCargo;
    property Contato: TString read GetContato write SetContato;
    property Salario: Double read GetSalario write SetSalario;
    property OutraRenda: TString read GetOutraRenda write SetOutraRenda;
    property Administradora: TString read GetAdministradora write SetAdministradora;
    property NomeEmpresa: TString read GetNomeEmpresa write SetNomeEmpresa;
    property DataAdmissao: TString read GetDataAdmissao write SetDataAdmissao;
  end;

implementation

{ TReferenciaList }

procedure TReferenciaList.Add(const AReferencia: IReferencia);
begin
  FList.Add(AReferencia);
end;

procedure TReferenciaList.Clear;
begin
  FList.Clear;
end;

function TReferenciaList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TReferenciaList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TReferenciaList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TReferenciaList.GetEnumerator: TReferenciaListEnumerator;
begin
  Result := TReferenciaListEnumerator.Create(Self);
end;

function TReferenciaList.GetItems(AIndex: Integer): IReferencia;
begin
  Result := FList[AIndex] as IReferencia;
end;

function TReferenciaList.GetReference: TReferenciaList;
begin
  Result := Self;
end;

procedure TReferenciaList.SetItems(AIndex: Integer; const Value: IReferencia);
begin
  FList[AIndex] := Value;
end;

{ TReferenciaListEnumerator }

constructor TReferenciaListEnumerator.Create(AReferenciaList: TReferenciaList);
begin
  inherited Create;
  FIndex := -1;
  FReferenciaList := AReferenciaList;
end;

function TReferenciaListEnumerator.GetCurrent: IReferencia;
begin
  Result := FReferenciaList[FIndex];
end;

function TReferenciaListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FReferenciaList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TReferenciaListRec }

class function TReferenciaListRec.Create(const AList: IReferenciaList): TReferenciaListRec;
begin
  FillChar(Result, SizeOf(TReferenciaListRec), 0);
  Result.FList := AList;
end;

class operator TReferenciaListRec.Implicit(AListRec: TReferenciaListRec): TReferenciaList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TReferencia }

function TReferencia.GetId: Integer;
begin
  Result := FId;
end;

procedure TReferencia.SetId(const AId: Integer);
begin
  FId := AId;
end;

function TReferencia.GetNome: TString;
begin
  Result := FNome;
end;

procedure TReferencia.SetNome(const ANome: TString);
begin
  FNome := ANome;
end;

function TReferencia.GetNumeroCartao: TString;
begin
  Result := FNumeroCartao;
end;

procedure TReferencia.SetNumeroCartao(const ANumeroCartao: TString);
begin
  FNumeroCartao := ANumeroCartao;
end;

function TReferencia.GetTipoReferencia: TTipoReferencia;
begin
  Result := FTipoReferencia;
end;

procedure TReferencia.SetTipoReferencia(const ATipoReferencia: TTipoReferencia);
begin
  FTipoReferencia := ATipoReferencia;
end;

function TReferencia.GetValidadeCartao: TString;
begin
  Result := FValidadeCartao;
end;

procedure TReferencia.SetValidadeCartao(const AValidadeCartao: TString);
begin
  FValidadeCartao := AValidadeCartao;
end;

function TReferencia.GetContaCorrente: TString;
begin
  Result := FContaCorrente;
end;

procedure TReferencia.SetContaCorrente(const AContaCorrente: TString);
begin
  FContaCorrente := AContaCorrente;
end;

function TReferencia.GetAgencia: TString;
begin
  Result := FAgencia;
end;

procedure TReferencia.SetAgencia(const AAgencia: TString);
begin
  FAgencia := AAgencia;
end;

function TReferencia.GetSetor: TString;
begin
  Result := FSetor;
end;

procedure TReferencia.SetSetor(const ASetor: TString);
begin
  FSetor := ASetor;
end;

function TReferencia.GetDataDeAbertura: TString;
begin
  Result := FDataDeAbertura;
end;

procedure TReferencia.SetDataDeAbertura(const ADataDeAbertura: TString);
begin
  FDataDeAbertura := ADataDeAbertura;
end;

function TReferencia.GetEndereco: TString;
begin
  Result := FEndereco;
end;

procedure TReferencia.SetEndereco(const AEndereco: TString);
begin
  FEndereco := AEndereco;
end;

function TReferencia.GetBairro: TString;
begin
  Result := FBairro;
end;

procedure TReferencia.SetBairro(const ABairro: TString);
begin
  FBairro := ABairro;
end;

function TReferencia.GetCidade: TString;
begin
  Result := FCidade;
end;

procedure TReferencia.SetCidade(const ACidade: TString);
begin
  FCidade := ACidade;
end;

function TReferencia.GetCep: TString;
begin
  Result := FCep;
end;

procedure TReferencia.SetCep(const ACep: TString);
begin
  FCep := ACep;
end;

function TReferencia.GetEstado: TString;
begin
  Result := FEstado;
end;

procedure TReferencia.SetEstado(const AEstado: TString);
begin
  FEstado := AEstado;
end;

function TReferencia.GetTelefone: TString;
begin
  Result := FTelefone;
end;

procedure TReferencia.SetTelefone(const ATelefone: TString);
begin
  FTelefone := ATelefone;
end;

function TReferencia.GetTelefone2: TString;
begin
  Result := FTelefone2;
end;

procedure TReferencia.SetTelefone2(const ATelefone2: TString);
begin
  FTelefone2 := ATelefone2;
end;

function TReferencia.GetObservacao: TString;
begin
  Result := FObservacao;
end;

procedure TReferencia.SetObservacao(const AObservacao: TString);
begin
  FObservacao := AObservacao;
end;

function TReferencia.GetSexo: TString;
begin
  Result := FSexo;
end;

procedure TReferencia.SetSexo(const ASexo: TString);
begin
  FSexo := ASexo;
end;

function TReferencia.GetSituacaoSerasa: TString;
begin
  Result := FSituacaoSerasa;
end;

procedure TReferencia.SetSituacaoSerasa(const ASituacaoSerasa: TString);
begin
  FSituacaoSerasa := ASituacaoSerasa;
end;

function TReferencia.GetSituacaoSpc: TString;
begin
  Result := FSituacaoSpc;
end;

procedure TReferencia.SetSituacaoSpc(const ASituacaoSpc: TString);
begin
  FSituacaoSpc := ASituacaoSpc;
end;

function TReferencia.GetCargo: TString;
begin
  Result := FCargo;
end;

procedure TReferencia.SetCargo(const ACargo: TString);
begin
  FCargo := ACargo;
end;

function TReferencia.GetContato: TString;
begin
  Result := FContato;
end;

procedure TReferencia.SetContato(const AContato: TString);
begin
  FContato := AContato;
end;

function TReferencia.GetSalario: Double;
begin
  Result := FSalario;
end;

procedure TReferencia.SetSalario(const ASalario: Double);
begin
  FSalario := ASalario;
end;

function TReferencia.GetOutraRenda: TString;
begin
  Result := FOutraRenda;
end;

procedure TReferencia.SetOutraRenda(const AOutraRenda: TString);
begin
  FOutraRenda := AOutraRenda;
end;

function TReferencia.GetAdministradora: TString;
begin
  Result := FAdministradora;
end;

procedure TReferencia.SetAdministradora(const AAdministradora: TString);
begin
  FAdministradora := AAdministradora;
end;

function TReferencia.GetNomeEmpresa: TString;
begin
  Result := FNomeEmpresa;
end;

procedure TReferencia.SetNomeEmpresa(const ANomeEmpresa: TString);
begin
  FNomeEmpresa := ANomeEmpresa;
end;

function TReferencia.GetDataAdmissao: TString;
begin
  Result := FDataAdmissao;
end;

procedure TReferencia.SetDataAdmissao(const ADataAdmissao: TString);
begin
  FDataAdmissao := ADataAdmissao;
end;


end.
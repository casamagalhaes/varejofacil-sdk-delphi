unit SDK.Model.Finalizacao;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IFinalizacao = interface(IModel)
    ['{3C1633BB-D67C-4BEA-AB0C-C7C9F7DD3655}']
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetFinalizadoraId: Integer;
    procedure SetFinalizadoraId(const AFinalizadoraId: Integer);
    function GetDataVencimento: TDateTime;
    procedure SetDataVencimento(const ADataVencimento: TDateTime);
    function GetSequencial: TString;
    procedure SetSequencial(const ASequencial: TString);
    function GetCodigoOrigem: TString;
    procedure SetCodigoOrigem(const ACodigoOrigem: TString);
    function GetCodigoPlano: TString;
    procedure SetCodigoPlano(const ACodigoPlano: TString);
    function GetAtualizaLimiteCredito: TString;
    procedure SetAtualizaLimiteCredito(const AAtualizaLimiteCredito: TString);
    function GetVerificaLimiteCredito: TString;
    procedure SetVerificaLimiteCredito(const AVerificaLimiteCredito: TString);
    function GetTextoLivre1: TString;
    procedure SetTextoLivre1(const ATextoLivre1: TString);
    function GetTextoLivre2: TString;
    procedure SetTextoLivre2(const ATextoLivre2: TString);
    function GetTextoLivre3: TString;
    procedure SetTextoLivre3(const ATextoLivre3: TString);
    function GetTextoLivre4: TString;
    procedure SetTextoLivre4(const ATextoLivre4: TString);
    function GetTipo: TString;
    procedure SetTipo(const ATipo: TString);
    function GetGeraFidelidade: TString;
    procedure SetGeraFidelidade(const AGeraFidelidade: TString);
    function GetCodigoAgente: TString;
    procedure SetCodigoAgente(const ACodigoAgente: TString);
    function GetSolicitaPlano: TString;
    procedure SetSolicitaPlano(const ASolicitaPlano: TString);
    function GetEspecializacao: TString;
    procedure SetEspecializacao(const AEspecializacao: TString);
    function GetQuantidadeParcelas: TString;
    procedure SetQuantidadeParcelas(const AQuantidadeParcelas: TString);
    function GetEmitenteCheque: TString;
    procedure SetEmitenteCheque(const AEmitenteCheque: TString);
    function GetTipoTroco: TString;
    procedure SetTipoTroco(const ATipoTroco: TString);
    function GetNumeroCartao: TString;
    procedure SetNumeroCartao(const ANumeroCartao: TString);
    function GetLeituraCmc7: TString;
    procedure SetLeituraCmc7(const ALeituraCmc7: TString);
    function GetPlanoReducao: TString;
    procedure SetPlanoReducao(const APlanoReducao: TString);
    function GetGeraContaReceber: TString;
    procedure SetGeraContaReceber(const AGeraContaReceber: TString);
    function GetSangriaDetalhada: TString;
    procedure SetSangriaDetalhada(const ASangriaDetalhada: TString);
    function GetNumeroValeCompra: TString;
    procedure SetNumeroValeCompra(const ANumeroValeCompra: TString);
    function GetAutorizacaoCartao: TString;
    procedure SetAutorizacaoCartao(const AAutorizacaoCartao: TString);
    function GetBandeira: TString;
    procedure SetBandeira(const ABandeira: TString);
    function GetModalidade: TString;
    procedure SetModalidade(const AModalidade: TString);
    function GetRedeAdquirente: TString;
    procedure SetRedeAdquirente(const ARedeAdquirente: TString);
    function GetNsu: TString;
    procedure SetNsu(const ANsu: TString);
    function GetNsuAutorizacao: TString;
    procedure SetNsuAutorizacao(const ANsuAutorizacao: TString);
    function GetNumeroBinCartao: TString;
    procedure SetNumeroBinCartao(const ANumeroBinCartao: TString);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
    function GetTroco: Double;
    procedure SetTroco(const ATroco: Double);
    function GetJurosPlano: Double;
    procedure SetJurosPlano(const AJurosPlano: Double);
    function GetDescontoMoeda: Double;
    procedure SetDescontoMoeda(const ADescontoMoeda: Double);
    function GetTrocoDoacao: Double;
    procedure SetTrocoDoacao(const ATrocoDoacao: Double);
    property Id: Integer read GetId write SetId;
    property FinalizadoraId: Integer read GetFinalizadoraId write SetFinalizadoraId;
    property DataVencimento: TDateTime read GetDataVencimento write SetDataVencimento;
    property Sequencial: TString read GetSequencial write SetSequencial;
    property CodigoOrigem: TString read GetCodigoOrigem write SetCodigoOrigem;
    property CodigoPlano: TString read GetCodigoPlano write SetCodigoPlano;
    property AtualizaLimiteCredito: TString read GetAtualizaLimiteCredito write SetAtualizaLimiteCredito;
    property VerificaLimiteCredito: TString read GetVerificaLimiteCredito write SetVerificaLimiteCredito;
    property TextoLivre1: TString read GetTextoLivre1 write SetTextoLivre1;
    property TextoLivre2: TString read GetTextoLivre2 write SetTextoLivre2;
    property TextoLivre3: TString read GetTextoLivre3 write SetTextoLivre3;
    property TextoLivre4: TString read GetTextoLivre4 write SetTextoLivre4;
    property Tipo: TString read GetTipo write SetTipo;
    property GeraFidelidade: TString read GetGeraFidelidade write SetGeraFidelidade;
    property CodigoAgente: TString read GetCodigoAgente write SetCodigoAgente;
    property SolicitaPlano: TString read GetSolicitaPlano write SetSolicitaPlano;
    property Especializacao: TString read GetEspecializacao write SetEspecializacao;
    property QuantidadeParcelas: TString read GetQuantidadeParcelas write SetQuantidadeParcelas;
    property EmitenteCheque: TString read GetEmitenteCheque write SetEmitenteCheque;
    property TipoTroco: TString read GetTipoTroco write SetTipoTroco;
    property NumeroCartao: TString read GetNumeroCartao write SetNumeroCartao;
    property LeituraCmc7: TString read GetLeituraCmc7 write SetLeituraCmc7;
    property PlanoReducao: TString read GetPlanoReducao write SetPlanoReducao;
    property GeraContaReceber: TString read GetGeraContaReceber write SetGeraContaReceber;
    property SangriaDetalhada: TString read GetSangriaDetalhada write SetSangriaDetalhada;
    property NumeroValeCompra: TString read GetNumeroValeCompra write SetNumeroValeCompra;
    property AutorizacaoCartao: TString read GetAutorizacaoCartao write SetAutorizacaoCartao;
    property Bandeira: TString read GetBandeira write SetBandeira;
    property Modalidade: TString read GetModalidade write SetModalidade;
    property RedeAdquirente: TString read GetRedeAdquirente write SetRedeAdquirente;
    property Nsu: TString read GetNsu write SetNsu;
    property NsuAutorizacao: TString read GetNsuAutorizacao write SetNsuAutorizacao;
    property NumeroBinCartao: TString read GetNumeroBinCartao write SetNumeroBinCartao;
    property Valor: Double read GetValor write SetValor;
    property Troco: Double read GetTroco write SetTroco;
    property JurosPlano: Double read GetJurosPlano write SetJurosPlano;
    property DescontoMoeda: Double read GetDescontoMoeda write SetDescontoMoeda;
    property TrocoDoacao: Double read GetTrocoDoacao write SetTrocoDoacao;
  end;

  TFinalizacaoList = class;

  IFinalizacaoList = interface
	['{707C8A84-5914-4F65-A5E9-84BDE5075F84}']
    function GetReference: TFinalizacaoList;
    function GetItems(AIndex: Integer): IFinalizacao;
    procedure SetItems(AIndex: Integer; const Value: IFinalizacao);
    procedure Add(const AFinalizacao: IFinalizacao);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IFinalizacao read GetItems write SetItems; default;
  end;

  TFinalizacaoListEnumerator = class
  private
    FIndex: Integer;
    FFinalizacaoList: TFinalizacaoList;
  public
    constructor Create(AFinalizacaoList: TFinalizacaoList);
    function GetCurrent: IFinalizacao; inline;
    function MoveNext: Boolean;
    property Current: IFinalizacao read GetCurrent;
  end;

  TFinalizacaoList = class(TInterfacedObject, IFinalizacaoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IFinalizacao;
    procedure SetItems(AIndex: Integer; const Value: IFinalizacao);
  public
    constructor Create;
    procedure Add(const AFinalizacao: IFinalizacao);
    destructor Destroy; override;
    function GetEnumerator: TFinalizacaoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TFinalizacaoList;
    property Items[AIndex: Integer]: IFinalizacao read GetItems write SetItems; default;
  end;

  TFinalizacaoListRec = record
  private
    FList: IFinalizacaoList;
  public
    class function Create(const AList: IFinalizacaoList): TFinalizacaoListRec; static;
    class operator Implicit(AListRec: TFinalizacaoListRec): TFinalizacaoList;
  end;

  TFinalizacao = class(TInterfacedModel, IFinalizacao)
  private
	FId: Integer;
	FFinalizadoraId: Integer;
	FDataVencimento: TDateTime;
	FSequencial: TString;
	FCodigoOrigem: TString;
	FCodigoPlano: TString;
	FAtualizaLimiteCredito: TString;
	FVerificaLimiteCredito: TString;
	FTextoLivre1: TString;
	FTextoLivre2: TString;
	FTextoLivre3: TString;
	FTextoLivre4: TString;
	FTipo: TString;
	FGeraFidelidade: TString;
	FCodigoAgente: TString;
	FSolicitaPlano: TString;
	FEspecializacao: TString;
	FQuantidadeParcelas: TString;
	FEmitenteCheque: TString;
	FTipoTroco: TString;
	FNumeroCartao: TString;
	FLeituraCmc7: TString;
	FPlanoReducao: TString;
	FGeraContaReceber: TString;
	FSangriaDetalhada: TString;
	FNumeroValeCompra: TString;
	FAutorizacaoCartao: TString;
	FBandeira: TString;
	FModalidade: TString;
	FRedeAdquirente: TString;
	FNsu: TString;
	FNsuAutorizacao: TString;
	FNumeroBinCartao: TString;
	FValor: Double;
	FTroco: Double;
	FJurosPlano: Double;
	FDescontoMoeda: Double;
	FTrocoDoacao: Double;
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetFinalizadoraId: Integer;
    procedure SetFinalizadoraId(const AFinalizadoraId: Integer);
    function GetDataVencimento: TDateTime;
    procedure SetDataVencimento(const ADataVencimento: TDateTime);
    function GetSequencial: TString;
    procedure SetSequencial(const ASequencial: TString);
    function GetCodigoOrigem: TString;
    procedure SetCodigoOrigem(const ACodigoOrigem: TString);
    function GetCodigoPlano: TString;
    procedure SetCodigoPlano(const ACodigoPlano: TString);
    function GetAtualizaLimiteCredito: TString;
    procedure SetAtualizaLimiteCredito(const AAtualizaLimiteCredito: TString);
    function GetVerificaLimiteCredito: TString;
    procedure SetVerificaLimiteCredito(const AVerificaLimiteCredito: TString);
    function GetTextoLivre1: TString;
    procedure SetTextoLivre1(const ATextoLivre1: TString);
    function GetTextoLivre2: TString;
    procedure SetTextoLivre2(const ATextoLivre2: TString);
    function GetTextoLivre3: TString;
    procedure SetTextoLivre3(const ATextoLivre3: TString);
    function GetTextoLivre4: TString;
    procedure SetTextoLivre4(const ATextoLivre4: TString);
    function GetTipo: TString;
    procedure SetTipo(const ATipo: TString);
    function GetGeraFidelidade: TString;
    procedure SetGeraFidelidade(const AGeraFidelidade: TString);
    function GetCodigoAgente: TString;
    procedure SetCodigoAgente(const ACodigoAgente: TString);
    function GetSolicitaPlano: TString;
    procedure SetSolicitaPlano(const ASolicitaPlano: TString);
    function GetEspecializacao: TString;
    procedure SetEspecializacao(const AEspecializacao: TString);
    function GetQuantidadeParcelas: TString;
    procedure SetQuantidadeParcelas(const AQuantidadeParcelas: TString);
    function GetEmitenteCheque: TString;
    procedure SetEmitenteCheque(const AEmitenteCheque: TString);
    function GetTipoTroco: TString;
    procedure SetTipoTroco(const ATipoTroco: TString);
    function GetNumeroCartao: TString;
    procedure SetNumeroCartao(const ANumeroCartao: TString);
    function GetLeituraCmc7: TString;
    procedure SetLeituraCmc7(const ALeituraCmc7: TString);
    function GetPlanoReducao: TString;
    procedure SetPlanoReducao(const APlanoReducao: TString);
    function GetGeraContaReceber: TString;
    procedure SetGeraContaReceber(const AGeraContaReceber: TString);
    function GetSangriaDetalhada: TString;
    procedure SetSangriaDetalhada(const ASangriaDetalhada: TString);
    function GetNumeroValeCompra: TString;
    procedure SetNumeroValeCompra(const ANumeroValeCompra: TString);
    function GetAutorizacaoCartao: TString;
    procedure SetAutorizacaoCartao(const AAutorizacaoCartao: TString);
    function GetBandeira: TString;
    procedure SetBandeira(const ABandeira: TString);
    function GetModalidade: TString;
    procedure SetModalidade(const AModalidade: TString);
    function GetRedeAdquirente: TString;
    procedure SetRedeAdquirente(const ARedeAdquirente: TString);
    function GetNsu: TString;
    procedure SetNsu(const ANsu: TString);
    function GetNsuAutorizacao: TString;
    procedure SetNsuAutorizacao(const ANsuAutorizacao: TString);
    function GetNumeroBinCartao: TString;
    procedure SetNumeroBinCartao(const ANumeroBinCartao: TString);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
    function GetTroco: Double;
    procedure SetTroco(const ATroco: Double);
    function GetJurosPlano: Double;
    procedure SetJurosPlano(const AJurosPlano: Double);
    function GetDescontoMoeda: Double;
    procedure SetDescontoMoeda(const ADescontoMoeda: Double);
    function GetTrocoDoacao: Double;
    procedure SetTrocoDoacao(const ATrocoDoacao: Double);
  published
    property Id: Integer read GetId write SetId;
    property FinalizadoraId: Integer read GetFinalizadoraId write SetFinalizadoraId;
    property DataVencimento: TDateTime read GetDataVencimento write SetDataVencimento;
    property Sequencial: TString read GetSequencial write SetSequencial;
    property CodigoOrigem: TString read GetCodigoOrigem write SetCodigoOrigem;
    property CodigoPlano: TString read GetCodigoPlano write SetCodigoPlano;
    property AtualizaLimiteCredito: TString read GetAtualizaLimiteCredito write SetAtualizaLimiteCredito;
    property VerificaLimiteCredito: TString read GetVerificaLimiteCredito write SetVerificaLimiteCredito;
    property TextoLivre1: TString read GetTextoLivre1 write SetTextoLivre1;
    property TextoLivre2: TString read GetTextoLivre2 write SetTextoLivre2;
    property TextoLivre3: TString read GetTextoLivre3 write SetTextoLivre3;
    property TextoLivre4: TString read GetTextoLivre4 write SetTextoLivre4;
    property Tipo: TString read GetTipo write SetTipo;
    property GeraFidelidade: TString read GetGeraFidelidade write SetGeraFidelidade;
    property CodigoAgente: TString read GetCodigoAgente write SetCodigoAgente;
    property SolicitaPlano: TString read GetSolicitaPlano write SetSolicitaPlano;
    property Especializacao: TString read GetEspecializacao write SetEspecializacao;
    property QuantidadeParcelas: TString read GetQuantidadeParcelas write SetQuantidadeParcelas;
    property EmitenteCheque: TString read GetEmitenteCheque write SetEmitenteCheque;
    property TipoTroco: TString read GetTipoTroco write SetTipoTroco;
    property NumeroCartao: TString read GetNumeroCartao write SetNumeroCartao;
    property LeituraCmc7: TString read GetLeituraCmc7 write SetLeituraCmc7;
    property PlanoReducao: TString read GetPlanoReducao write SetPlanoReducao;
    property GeraContaReceber: TString read GetGeraContaReceber write SetGeraContaReceber;
    property SangriaDetalhada: TString read GetSangriaDetalhada write SetSangriaDetalhada;
    property NumeroValeCompra: TString read GetNumeroValeCompra write SetNumeroValeCompra;
    property AutorizacaoCartao: TString read GetAutorizacaoCartao write SetAutorizacaoCartao;
    property Bandeira: TString read GetBandeira write SetBandeira;
    property Modalidade: TString read GetModalidade write SetModalidade;
    property RedeAdquirente: TString read GetRedeAdquirente write SetRedeAdquirente;
    property Nsu: TString read GetNsu write SetNsu;
    property NsuAutorizacao: TString read GetNsuAutorizacao write SetNsuAutorizacao;
    property NumeroBinCartao: TString read GetNumeroBinCartao write SetNumeroBinCartao;
    property Valor: Double read GetValor write SetValor;
    property Troco: Double read GetTroco write SetTroco;
    property JurosPlano: Double read GetJurosPlano write SetJurosPlano;
    property DescontoMoeda: Double read GetDescontoMoeda write SetDescontoMoeda;
    property TrocoDoacao: Double read GetTrocoDoacao write SetTrocoDoacao;
  end;

implementation

{ TFinalizacaoList }

procedure TFinalizacaoList.Add(const AFinalizacao: IFinalizacao);
begin
  FList.Add(AFinalizacao);
end;

procedure TFinalizacaoList.Clear;
begin
  FList.Clear;
end;

function TFinalizacaoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TFinalizacaoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TFinalizacaoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TFinalizacaoList.GetEnumerator: TFinalizacaoListEnumerator;
begin
  Result := TFinalizacaoListEnumerator.Create(Self);
end;

function TFinalizacaoList.GetItems(AIndex: Integer): IFinalizacao;
begin
  Result := FList[AIndex] as IFinalizacao;
end;

function TFinalizacaoList.GetReference: TFinalizacaoList;
begin
  Result := Self;
end;

procedure TFinalizacaoList.SetItems(AIndex: Integer; const Value: IFinalizacao);
begin
  FList[AIndex] := Value;
end;

{ TFinalizacaoListEnumerator }

constructor TFinalizacaoListEnumerator.Create(AFinalizacaoList: TFinalizacaoList);
begin
  inherited Create;
  FIndex := -1;
  FFinalizacaoList := AFinalizacaoList;
end;

function TFinalizacaoListEnumerator.GetCurrent: IFinalizacao;
begin
  Result := FFinalizacaoList[FIndex];
end;

function TFinalizacaoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FFinalizacaoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TFinalizacaoListRec }

class function TFinalizacaoListRec.Create(const AList: IFinalizacaoList): TFinalizacaoListRec;
begin
  FillChar(Result, SizeOf(TFinalizacaoListRec), 0);
  Result.FList := AList;
end;

class operator TFinalizacaoListRec.Implicit(AListRec: TFinalizacaoListRec): TFinalizacaoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TFinalizacao }

function TFinalizacao.GetId: Integer;
begin
  Result := FId;
end;

procedure TFinalizacao.SetId(const AId: Integer);
begin
  FId := AId;
end;

function TFinalizacao.GetFinalizadoraId: Integer;
begin
  Result := FFinalizadoraId;
end;

procedure TFinalizacao.SetFinalizadoraId(const AFinalizadoraId: Integer);
begin
  FFinalizadoraId := AFinalizadoraId;
end;

function TFinalizacao.GetDataVencimento: TDateTime;
begin
  Result := FDataVencimento;
end;

procedure TFinalizacao.SetDataVencimento(const ADataVencimento: TDateTime);
begin
  FDataVencimento := ADataVencimento;
end;

function TFinalizacao.GetSequencial: TString;
begin
  Result := FSequencial;
end;

procedure TFinalizacao.SetSequencial(const ASequencial: TString);
begin
  FSequencial := ASequencial;
end;

function TFinalizacao.GetCodigoOrigem: TString;
begin
  Result := FCodigoOrigem;
end;

procedure TFinalizacao.SetCodigoOrigem(const ACodigoOrigem: TString);
begin
  FCodigoOrigem := ACodigoOrigem;
end;

function TFinalizacao.GetCodigoPlano: TString;
begin
  Result := FCodigoPlano;
end;

procedure TFinalizacao.SetCodigoPlano(const ACodigoPlano: TString);
begin
  FCodigoPlano := ACodigoPlano;
end;

function TFinalizacao.GetAtualizaLimiteCredito: TString;
begin
  Result := FAtualizaLimiteCredito;
end;

procedure TFinalizacao.SetAtualizaLimiteCredito(const AAtualizaLimiteCredito: TString);
begin
  FAtualizaLimiteCredito := AAtualizaLimiteCredito;
end;

function TFinalizacao.GetVerificaLimiteCredito: TString;
begin
  Result := FVerificaLimiteCredito;
end;

procedure TFinalizacao.SetVerificaLimiteCredito(const AVerificaLimiteCredito: TString);
begin
  FVerificaLimiteCredito := AVerificaLimiteCredito;
end;

function TFinalizacao.GetTextoLivre1: TString;
begin
  Result := FTextoLivre1;
end;

procedure TFinalizacao.SetTextoLivre1(const ATextoLivre1: TString);
begin
  FTextoLivre1 := ATextoLivre1;
end;

function TFinalizacao.GetTextoLivre2: TString;
begin
  Result := FTextoLivre2;
end;

procedure TFinalizacao.SetTextoLivre2(const ATextoLivre2: TString);
begin
  FTextoLivre2 := ATextoLivre2;
end;

function TFinalizacao.GetTextoLivre3: TString;
begin
  Result := FTextoLivre3;
end;

procedure TFinalizacao.SetTextoLivre3(const ATextoLivre3: TString);
begin
  FTextoLivre3 := ATextoLivre3;
end;

function TFinalizacao.GetTextoLivre4: TString;
begin
  Result := FTextoLivre4;
end;

procedure TFinalizacao.SetTextoLivre4(const ATextoLivre4: TString);
begin
  FTextoLivre4 := ATextoLivre4;
end;

function TFinalizacao.GetTipo: TString;
begin
  Result := FTipo;
end;

procedure TFinalizacao.SetTipo(const ATipo: TString);
begin
  FTipo := ATipo;
end;

function TFinalizacao.GetGeraFidelidade: TString;
begin
  Result := FGeraFidelidade;
end;

procedure TFinalizacao.SetGeraFidelidade(const AGeraFidelidade: TString);
begin
  FGeraFidelidade := AGeraFidelidade;
end;

function TFinalizacao.GetCodigoAgente: TString;
begin
  Result := FCodigoAgente;
end;

procedure TFinalizacao.SetCodigoAgente(const ACodigoAgente: TString);
begin
  FCodigoAgente := ACodigoAgente;
end;

function TFinalizacao.GetSolicitaPlano: TString;
begin
  Result := FSolicitaPlano;
end;

procedure TFinalizacao.SetSolicitaPlano(const ASolicitaPlano: TString);
begin
  FSolicitaPlano := ASolicitaPlano;
end;

function TFinalizacao.GetEspecializacao: TString;
begin
  Result := FEspecializacao;
end;

procedure TFinalizacao.SetEspecializacao(const AEspecializacao: TString);
begin
  FEspecializacao := AEspecializacao;
end;

function TFinalizacao.GetQuantidadeParcelas: TString;
begin
  Result := FQuantidadeParcelas;
end;

procedure TFinalizacao.SetQuantidadeParcelas(const AQuantidadeParcelas: TString);
begin
  FQuantidadeParcelas := AQuantidadeParcelas;
end;

function TFinalizacao.GetEmitenteCheque: TString;
begin
  Result := FEmitenteCheque;
end;

procedure TFinalizacao.SetEmitenteCheque(const AEmitenteCheque: TString);
begin
  FEmitenteCheque := AEmitenteCheque;
end;

function TFinalizacao.GetTipoTroco: TString;
begin
  Result := FTipoTroco;
end;

procedure TFinalizacao.SetTipoTroco(const ATipoTroco: TString);
begin
  FTipoTroco := ATipoTroco;
end;

function TFinalizacao.GetNumeroCartao: TString;
begin
  Result := FNumeroCartao;
end;

procedure TFinalizacao.SetNumeroCartao(const ANumeroCartao: TString);
begin
  FNumeroCartao := ANumeroCartao;
end;

function TFinalizacao.GetLeituraCmc7: TString;
begin
  Result := FLeituraCmc7;
end;

procedure TFinalizacao.SetLeituraCmc7(const ALeituraCmc7: TString);
begin
  FLeituraCmc7 := ALeituraCmc7;
end;

function TFinalizacao.GetPlanoReducao: TString;
begin
  Result := FPlanoReducao;
end;

procedure TFinalizacao.SetPlanoReducao(const APlanoReducao: TString);
begin
  FPlanoReducao := APlanoReducao;
end;

function TFinalizacao.GetGeraContaReceber: TString;
begin
  Result := FGeraContaReceber;
end;

procedure TFinalizacao.SetGeraContaReceber(const AGeraContaReceber: TString);
begin
  FGeraContaReceber := AGeraContaReceber;
end;

function TFinalizacao.GetSangriaDetalhada: TString;
begin
  Result := FSangriaDetalhada;
end;

procedure TFinalizacao.SetSangriaDetalhada(const ASangriaDetalhada: TString);
begin
  FSangriaDetalhada := ASangriaDetalhada;
end;

function TFinalizacao.GetNumeroValeCompra: TString;
begin
  Result := FNumeroValeCompra;
end;

procedure TFinalizacao.SetNumeroValeCompra(const ANumeroValeCompra: TString);
begin
  FNumeroValeCompra := ANumeroValeCompra;
end;

function TFinalizacao.GetAutorizacaoCartao: TString;
begin
  Result := FAutorizacaoCartao;
end;

procedure TFinalizacao.SetAutorizacaoCartao(const AAutorizacaoCartao: TString);
begin
  FAutorizacaoCartao := AAutorizacaoCartao;
end;

function TFinalizacao.GetBandeira: TString;
begin
  Result := FBandeira;
end;

procedure TFinalizacao.SetBandeira(const ABandeira: TString);
begin
  FBandeira := ABandeira;
end;

function TFinalizacao.GetModalidade: TString;
begin
  Result := FModalidade;
end;

procedure TFinalizacao.SetModalidade(const AModalidade: TString);
begin
  FModalidade := AModalidade;
end;

function TFinalizacao.GetRedeAdquirente: TString;
begin
  Result := FRedeAdquirente;
end;

procedure TFinalizacao.SetRedeAdquirente(const ARedeAdquirente: TString);
begin
  FRedeAdquirente := ARedeAdquirente;
end;

function TFinalizacao.GetNsu: TString;
begin
  Result := FNsu;
end;

procedure TFinalizacao.SetNsu(const ANsu: TString);
begin
  FNsu := ANsu;
end;

function TFinalizacao.GetNsuAutorizacao: TString;
begin
  Result := FNsuAutorizacao;
end;

procedure TFinalizacao.SetNsuAutorizacao(const ANsuAutorizacao: TString);
begin
  FNsuAutorizacao := ANsuAutorizacao;
end;

function TFinalizacao.GetNumeroBinCartao: TString;
begin
  Result := FNumeroBinCartao;
end;

procedure TFinalizacao.SetNumeroBinCartao(const ANumeroBinCartao: TString);
begin
  FNumeroBinCartao := ANumeroBinCartao;
end;

function TFinalizacao.GetValor: Double;
begin
  Result := FValor;
end;

procedure TFinalizacao.SetValor(const AValor: Double);
begin
  FValor := AValor;
end;

function TFinalizacao.GetTroco: Double;
begin
  Result := FTroco;
end;

procedure TFinalizacao.SetTroco(const ATroco: Double);
begin
  FTroco := ATroco;
end;

function TFinalizacao.GetJurosPlano: Double;
begin
  Result := FJurosPlano;
end;

procedure TFinalizacao.SetJurosPlano(const AJurosPlano: Double);
begin
  FJurosPlano := AJurosPlano;
end;

function TFinalizacao.GetDescontoMoeda: Double;
begin
  Result := FDescontoMoeda;
end;

procedure TFinalizacao.SetDescontoMoeda(const ADescontoMoeda: Double);
begin
  FDescontoMoeda := ADescontoMoeda;
end;

function TFinalizacao.GetTrocoDoacao: Double;
begin
  Result := FTrocoDoacao;
end;

procedure TFinalizacao.SetTrocoDoacao(const ATrocoDoacao: Double);
begin
  FTrocoDoacao := ATrocoDoacao;
end;


end.
unit SDK.Model.Devolucao;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IDevolucao = interface(IModel)
    ['{7481E823-C9CB-4F0F-950E-806E69593E3C}']
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetOperadorId: Int64;
    procedure SetOperadorId(const AOperadorId: Int64);
    function GetData: TDateTime;
    procedure SetData(const AData: TDateTime);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
    function GetAcrescimo: Double;
    procedure SetAcrescimo(const AAcrescimo: Double);
    function GetDesconto: Double;
    procedure SetDesconto(const ADesconto: Double);
    function GetNomeCliente: TString;
    procedure SetNomeCliente(const ANomeCliente: TString);
    function GetCpfCgc: TString;
    procedure SetCpfCgc(const ACpfCgc: TString);
    function GetRg: TString;
    procedure SetRg(const ARg: TString);
    function GetTelefone: TString;
    procedure SetTelefone(const ATelefone: TString);
    function GetBairro: TString;
    procedure SetBairro(const ABairro: TString);
    function GetEndereco: TString;
    procedure SetEndereco(const AEndereco: TString);
    function GetNumero: TString;
    procedure SetNumero(const ANumero: TString);
    function GetMotivacao: TString;
    procedure SetMotivacao(const AMotivacao: TString);
    function GetAutorizadorId: Integer;
    procedure SetAutorizadorId(const AAutorizadorId: Integer);
    function GetStatus: TString;
    procedure SetStatus(const AStatus: TString);
    function GetSequencial: TString;
    procedure SetSequencial(const ASequencial: TString);
    function GetCaixa: TString;
    procedure SetCaixa(const ACaixa: TString);
    function GetDataTransacao: TDateTime;
    procedure SetDataTransacao(const ADataTransacao: TDateTime);
    function GetLog: TString;
    procedure SetLog(const ALog: TString);
    function GetModeloImpressora: TModeloImpressora;
    procedure SetModeloImpressora(const AModeloImpressora: TModeloImpressora);
    function GetItensDevolucao: TList<ItemDevolucao>;
    procedure SetItensDevolucao(const AItensDevolucao: TList<ItemDevolucao>);
    property Id: Integer read GetId write SetId;
    property OperadorId: Int64 read GetOperadorId write SetOperadorId;
    property Data: TDateTime read GetData write SetData;
    property Valor: Double read GetValor write SetValor;
    property Acrescimo: Double read GetAcrescimo write SetAcrescimo;
    property Desconto: Double read GetDesconto write SetDesconto;
    property NomeCliente: TString read GetNomeCliente write SetNomeCliente;
    property CpfCgc: TString read GetCpfCgc write SetCpfCgc;
    property Rg: TString read GetRg write SetRg;
    property Telefone: TString read GetTelefone write SetTelefone;
    property Bairro: TString read GetBairro write SetBairro;
    property Endereco: TString read GetEndereco write SetEndereco;
    property Numero: TString read GetNumero write SetNumero;
    property Motivacao: TString read GetMotivacao write SetMotivacao;
    property AutorizadorId: Integer read GetAutorizadorId write SetAutorizadorId;
    property Status: TString read GetStatus write SetStatus;
    property Sequencial: TString read GetSequencial write SetSequencial;
    property Caixa: TString read GetCaixa write SetCaixa;
    property DataTransacao: TDateTime read GetDataTransacao write SetDataTransacao;
    property Log: TString read GetLog write SetLog;
    property ModeloImpressora: TModeloImpressora read GetModeloImpressora write SetModeloImpressora;
    property ItensDevolucao: TList<ItemDevolucao> read GetItensDevolucao write SetItensDevolucao;
  end;

  TDevolucaoList = class;

  IDevolucaoList = interface
	['{32BFEB33-C088-4BD2-B9C9-043BD377624A}']
    function GetReference: TDevolucaoList;
    function GetItems(AIndex: Integer): IDevolucao;
    procedure SetItems(AIndex: Integer; const Value: IDevolucao);
    procedure Add(const ADevolucao: IDevolucao);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IDevolucao read GetItems write SetItems; default;
  end;

  TDevolucaoListEnumerator = class
  private
    FIndex: Integer;
    FDevolucaoList: TDevolucaoList;
  public
    constructor Create(ADevolucaoList: TDevolucaoList);
    function GetCurrent: IDevolucao; inline;
    function MoveNext: Boolean;
    property Current: IDevolucao read GetCurrent;
  end;

  TDevolucaoList = class(TInterfacedObject, IDevolucaoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IDevolucao;
    procedure SetItems(AIndex: Integer; const Value: IDevolucao);
  public
    constructor Create;
    procedure Add(const ADevolucao: IDevolucao);
    destructor Destroy; override;
    function GetEnumerator: TDevolucaoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TDevolucaoList;
    property Items[AIndex: Integer]: IDevolucao read GetItems write SetItems; default;
  end;

  TDevolucaoListRec = record
  private
    FList: IDevolucaoList;
  public
    class function Create(const AList: IDevolucaoList): TDevolucaoListRec; static;
    class operator Implicit(AListRec: TDevolucaoListRec): TDevolucaoList;
  end;

  TDevolucao = class(TInterfacedObject, IDevolucao)
  private
	FId: Integer;
	FOperadorId: Int64;
	FData: TDateTime;
	FValor: Double;
	FAcrescimo: Double;
	FDesconto: Double;
	FNomeCliente: TString;
	FCpfCgc: TString;
	FRg: TString;
	FTelefone: TString;
	FBairro: TString;
	FEndereco: TString;
	FNumero: TString;
	FMotivacao: TString;
	FAutorizadorId: Integer;
	FStatus: TString;
	FSequencial: TString;
	FCaixa: TString;
	FDataTransacao: TDateTime;
	FLog: TString;
	FModeloImpressora: TModeloImpressora;
	FItensDevolucao: TList<ItemDevolucao>;
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetOperadorId: Int64;
    procedure SetOperadorId(const AOperadorId: Int64);
    function GetData: TDateTime;
    procedure SetData(const AData: TDateTime);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
    function GetAcrescimo: Double;
    procedure SetAcrescimo(const AAcrescimo: Double);
    function GetDesconto: Double;
    procedure SetDesconto(const ADesconto: Double);
    function GetNomeCliente: TString;
    procedure SetNomeCliente(const ANomeCliente: TString);
    function GetCpfCgc: TString;
    procedure SetCpfCgc(const ACpfCgc: TString);
    function GetRg: TString;
    procedure SetRg(const ARg: TString);
    function GetTelefone: TString;
    procedure SetTelefone(const ATelefone: TString);
    function GetBairro: TString;
    procedure SetBairro(const ABairro: TString);
    function GetEndereco: TString;
    procedure SetEndereco(const AEndereco: TString);
    function GetNumero: TString;
    procedure SetNumero(const ANumero: TString);
    function GetMotivacao: TString;
    procedure SetMotivacao(const AMotivacao: TString);
    function GetAutorizadorId: Integer;
    procedure SetAutorizadorId(const AAutorizadorId: Integer);
    function GetStatus: TString;
    procedure SetStatus(const AStatus: TString);
    function GetSequencial: TString;
    procedure SetSequencial(const ASequencial: TString);
    function GetCaixa: TString;
    procedure SetCaixa(const ACaixa: TString);
    function GetDataTransacao: TDateTime;
    procedure SetDataTransacao(const ADataTransacao: TDateTime);
    function GetLog: TString;
    procedure SetLog(const ALog: TString);
    function GetModeloImpressora: TModeloImpressora;
    procedure SetModeloImpressora(const AModeloImpressora: TModeloImpressora);
    function GetItensDevolucao: TList<ItemDevolucao>;
    procedure SetItensDevolucao(const AItensDevolucao: TList<ItemDevolucao>);
  public
    property Id: Integer read GetId write SetId;
    property OperadorId: Int64 read GetOperadorId write SetOperadorId;
    property Data: TDateTime read GetData write SetData;
    property Valor: Double read GetValor write SetValor;
    property Acrescimo: Double read GetAcrescimo write SetAcrescimo;
    property Desconto: Double read GetDesconto write SetDesconto;
    property NomeCliente: TString read GetNomeCliente write SetNomeCliente;
    property CpfCgc: TString read GetCpfCgc write SetCpfCgc;
    property Rg: TString read GetRg write SetRg;
    property Telefone: TString read GetTelefone write SetTelefone;
    property Bairro: TString read GetBairro write SetBairro;
    property Endereco: TString read GetEndereco write SetEndereco;
    property Numero: TString read GetNumero write SetNumero;
    property Motivacao: TString read GetMotivacao write SetMotivacao;
    property AutorizadorId: Integer read GetAutorizadorId write SetAutorizadorId;
    property Status: TString read GetStatus write SetStatus;
    property Sequencial: TString read GetSequencial write SetSequencial;
    property Caixa: TString read GetCaixa write SetCaixa;
    property DataTransacao: TDateTime read GetDataTransacao write SetDataTransacao;
    property Log: TString read GetLog write SetLog;
    property ModeloImpressora: TModeloImpressora read GetModeloImpressora write SetModeloImpressora;
    property ItensDevolucao: TList<ItemDevolucao> read GetItensDevolucao write SetItensDevolucao;
  end;

implementation

{ TDevolucaoList }

procedure TDevolucaoList.Add(const ADevolucao: IDevolucao);
begin
  FList.Add(ADevolucao);
end;

procedure TDevolucaoList.Clear;
begin
  FList.Clear;
end;

function TDevolucaoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TDevolucaoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TDevolucaoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TDevolucaoList.GetEnumerator: TDevolucaoListEnumerator;
begin
  Result := TDevolucaoListEnumerator.Create(Self);
end;

function TDevolucaoList.GetItems(AIndex: Integer): IDevolucao;
begin
  Result := FList[AIndex] as IDevolucao;
end;

function TDevolucaoList.GetReference: TDevolucaoList;
begin
  Result := Self;
end;

procedure TDevolucaoList.SetItems(AIndex: Integer; const Value: IDevolucao);
begin
  FList[AIndex] := Value;
end;

{ TDevolucaoListEnumerator }

constructor TDevolucaoListEnumerator.Create(ADevolucaoList: TDevolucaoList);
begin
  inherited Create;
  FIndex := -1;
  FDevolucaoList := ADevolucaoList;
end;

function TDevolucaoListEnumerator.GetCurrent: IDevolucao;
begin
  Result := FDevolucaoList[FIndex];
end;

function TDevolucaoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FDevolucaoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TDevolucaoListRec }

class function TDevolucaoListRec.Create(const AList: IDevolucaoList): TDevolucaoListRec;
begin
  FillChar(Result, SizeOf(TDevolucaoListRec), 0);
  Result.FList := AList;
end;

class operator TDevolucaoListRec.Implicit(AListRec: TDevolucaoListRec): TDevolucaoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TDevolucao }

function TDevolucao.GetId: Integer;
begin
  Result := FId;
end;

procedure TDevolucao.SetId(const AId: Integer);
begin
  FId := AId;
end;

function TDevolucao.GetOperadorId: Int64;
begin
  Result := FOperadorId;
end;

procedure TDevolucao.SetOperadorId(const AOperadorId: Int64);
begin
  FOperadorId := AOperadorId;
end;

function TDevolucao.GetData: TDateTime;
begin
  Result := FData;
end;

procedure TDevolucao.SetData(const AData: TDateTime);
begin
  FData := AData;
end;

function TDevolucao.GetValor: Double;
begin
  Result := FValor;
end;

procedure TDevolucao.SetValor(const AValor: Double);
begin
  FValor := AValor;
end;

function TDevolucao.GetAcrescimo: Double;
begin
  Result := FAcrescimo;
end;

procedure TDevolucao.SetAcrescimo(const AAcrescimo: Double);
begin
  FAcrescimo := AAcrescimo;
end;

function TDevolucao.GetDesconto: Double;
begin
  Result := FDesconto;
end;

procedure TDevolucao.SetDesconto(const ADesconto: Double);
begin
  FDesconto := ADesconto;
end;

function TDevolucao.GetNomeCliente: TString;
begin
  Result := FNomeCliente;
end;

procedure TDevolucao.SetNomeCliente(const ANomeCliente: TString);
begin
  FNomeCliente := ANomeCliente;
end;

function TDevolucao.GetCpfCgc: TString;
begin
  Result := FCpfCgc;
end;

procedure TDevolucao.SetCpfCgc(const ACpfCgc: TString);
begin
  FCpfCgc := ACpfCgc;
end;

function TDevolucao.GetRg: TString;
begin
  Result := FRg;
end;

procedure TDevolucao.SetRg(const ARg: TString);
begin
  FRg := ARg;
end;

function TDevolucao.GetTelefone: TString;
begin
  Result := FTelefone;
end;

procedure TDevolucao.SetTelefone(const ATelefone: TString);
begin
  FTelefone := ATelefone;
end;

function TDevolucao.GetBairro: TString;
begin
  Result := FBairro;
end;

procedure TDevolucao.SetBairro(const ABairro: TString);
begin
  FBairro := ABairro;
end;

function TDevolucao.GetEndereco: TString;
begin
  Result := FEndereco;
end;

procedure TDevolucao.SetEndereco(const AEndereco: TString);
begin
  FEndereco := AEndereco;
end;

function TDevolucao.GetNumero: TString;
begin
  Result := FNumero;
end;

procedure TDevolucao.SetNumero(const ANumero: TString);
begin
  FNumero := ANumero;
end;

function TDevolucao.GetMotivacao: TString;
begin
  Result := FMotivacao;
end;

procedure TDevolucao.SetMotivacao(const AMotivacao: TString);
begin
  FMotivacao := AMotivacao;
end;

function TDevolucao.GetAutorizadorId: Integer;
begin
  Result := FAutorizadorId;
end;

procedure TDevolucao.SetAutorizadorId(const AAutorizadorId: Integer);
begin
  FAutorizadorId := AAutorizadorId;
end;

function TDevolucao.GetStatus: TString;
begin
  Result := FStatus;
end;

procedure TDevolucao.SetStatus(const AStatus: TString);
begin
  FStatus := AStatus;
end;

function TDevolucao.GetSequencial: TString;
begin
  Result := FSequencial;
end;

procedure TDevolucao.SetSequencial(const ASequencial: TString);
begin
  FSequencial := ASequencial;
end;

function TDevolucao.GetCaixa: TString;
begin
  Result := FCaixa;
end;

procedure TDevolucao.SetCaixa(const ACaixa: TString);
begin
  FCaixa := ACaixa;
end;

function TDevolucao.GetDataTransacao: TDateTime;
begin
  Result := FDataTransacao;
end;

procedure TDevolucao.SetDataTransacao(const ADataTransacao: TDateTime);
begin
  FDataTransacao := ADataTransacao;
end;

function TDevolucao.GetLog: TString;
begin
  Result := FLog;
end;

procedure TDevolucao.SetLog(const ALog: TString);
begin
  FLog := ALog;
end;

function TDevolucao.GetModeloImpressora: TModeloImpressora;
begin
  Result := FModeloImpressora;
end;

procedure TDevolucao.SetModeloImpressora(const AModeloImpressora: TModeloImpressora);
begin
  FModeloImpressora := AModeloImpressora;
end;

function TDevolucao.GetItensDevolucao: TList<ItemDevolucao>;
begin
  Result := FItensDevolucao;
end;

procedure TDevolucao.SetItensDevolucao(const AItensDevolucao: TList<ItemDevolucao>);
begin
  FItensDevolucao := AItensDevolucao;
end;


end.
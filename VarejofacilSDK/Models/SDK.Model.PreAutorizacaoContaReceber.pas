unit SDK.Model.PreAutorizacaoContaReceber;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums, SDK.Model.PreAutorizacaoTituloReceber;

type

  IPreAutorizacaoContaReceber = interface(IModel)
    ['{A92ADB3F-6285-46ED-860C-11E56BCE9088}']
    function GetData: TDateTime;
    procedure SetData(const AData: TDateTime);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetCaixa: TString;
    procedure SetCaixa(const ACaixa: TString);
    function GetFuncionarioId: Int64;
    procedure SetFuncionarioId(const AFuncionarioId: Int64);
    function GetClienteId: Int64;
    procedure SetClienteId(const AClienteId: Int64);
    function GetDocumento: TString;
    procedure SetDocumento(const ADocumento: TString);
    function GetCartao: TString;
    procedure SetCartao(const ACartao: TString);
    function GetNumero: TString;
    procedure SetNumero(const ANumero: TString);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
    function GetQuantidadeDeParcelas: Integer;
    procedure SetQuantidadeDeParcelas(const AQuantidadeDeParcelas: Integer);
    function GetFinalizadoraId: Integer;
    procedure SetFinalizadoraId(const AFinalizadoraId: Integer);
    function GetObservacao: TString;
    procedure SetObservacao(const AObservacao: TString);
    function GetTitulos: TPreAutorizacaoTituloReceberList;
    procedure SetTitulos(const ATitulos: TPreAutorizacaoTituloReceberList);
    property Data: TDateTime read GetData write SetData;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property Caixa: TString read GetCaixa write SetCaixa;
    property FuncionarioId: Int64 read GetFuncionarioId write SetFuncionarioId;
    property ClienteId: Int64 read GetClienteId write SetClienteId;
    property Documento: TString read GetDocumento write SetDocumento;
    property Cartao: TString read GetCartao write SetCartao;
    property Numero: TString read GetNumero write SetNumero;
    property Valor: Double read GetValor write SetValor;
    property QuantidadeDeParcelas: Integer read GetQuantidadeDeParcelas write SetQuantidadeDeParcelas;
    property FinalizadoraId: Integer read GetFinalizadoraId write SetFinalizadoraId;
    property Observacao: TString read GetObservacao write SetObservacao;
    property Titulos: TPreAutorizacaoTituloReceberList read GetTitulos write SetTitulos;
  end;

  TPreAutorizacaoContaReceberList = class;

  IPreAutorizacaoContaReceberList = interface
	['{8E2A566D-356D-4460-AF82-3DAD02AA6F9B}']
    function GetReference: TPreAutorizacaoContaReceberList;
    function GetItems(AIndex: Integer): IPreAutorizacaoContaReceber;
    procedure SetItems(AIndex: Integer; const Value: IPreAutorizacaoContaReceber);
    procedure Add(const APreAutorizacaoContaReceber: IPreAutorizacaoContaReceber);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IPreAutorizacaoContaReceber read GetItems write SetItems; default;
  end;

  TPreAutorizacaoContaReceberListEnumerator = class
  private
    FIndex: Integer;
    FPreAutorizacaoContaReceberList: TPreAutorizacaoContaReceberList;
  public
    constructor Create(APreAutorizacaoContaReceberList: TPreAutorizacaoContaReceberList);
    function GetCurrent: IPreAutorizacaoContaReceber; inline;
    function MoveNext: Boolean;
    property Current: IPreAutorizacaoContaReceber read GetCurrent;
  end;

  TPreAutorizacaoContaReceberList = class(TInterfacedObject, IPreAutorizacaoContaReceberList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IPreAutorizacaoContaReceber;
    procedure SetItems(AIndex: Integer; const Value: IPreAutorizacaoContaReceber);
  public
    constructor Create;
    procedure Add(const APreAutorizacaoContaReceber: IPreAutorizacaoContaReceber);
    destructor Destroy; override;
    function GetEnumerator: TPreAutorizacaoContaReceberListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TPreAutorizacaoContaReceberList;
    property Items[AIndex: Integer]: IPreAutorizacaoContaReceber read GetItems write SetItems; default;
  end;

  TPreAutorizacaoContaReceberListRec = record
  private
    FList: IPreAutorizacaoContaReceberList;
  public
    class function Create(const AList: IPreAutorizacaoContaReceberList): TPreAutorizacaoContaReceberListRec; static;
    class operator Implicit(AListRec: TPreAutorizacaoContaReceberListRec): TPreAutorizacaoContaReceberList;
  end;

  TPreAutorizacaoContaReceber = class(TInterfacedModel, IPreAutorizacaoContaReceber)
  private
	FData: TDateTime;
	FLojaId: Int64;
	FCaixa: TString;
	FFuncionarioId: Int64;
	FClienteId: Int64;
	FDocumento: TString;
	FCartao: TString;
	FNumero: TString;
	FValor: Double;
	FQuantidadeDeParcelas: Integer;
	FFinalizadoraId: Integer;
	FObservacao: TString;
	FTitulos: TPreAutorizacaoTituloReceberList;
    function GetData: TDateTime;
    procedure SetData(const AData: TDateTime);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetCaixa: TString;
    procedure SetCaixa(const ACaixa: TString);
    function GetFuncionarioId: Int64;
    procedure SetFuncionarioId(const AFuncionarioId: Int64);
    function GetClienteId: Int64;
    procedure SetClienteId(const AClienteId: Int64);
    function GetDocumento: TString;
    procedure SetDocumento(const ADocumento: TString);
    function GetCartao: TString;
    procedure SetCartao(const ACartao: TString);
    function GetNumero: TString;
    procedure SetNumero(const ANumero: TString);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
    function GetQuantidadeDeParcelas: Integer;
    procedure SetQuantidadeDeParcelas(const AQuantidadeDeParcelas: Integer);
    function GetFinalizadoraId: Integer;
    procedure SetFinalizadoraId(const AFinalizadoraId: Integer);
    function GetObservacao: TString;
    procedure SetObservacao(const AObservacao: TString);
    function GetTitulos: TPreAutorizacaoTituloReceberList;
    procedure SetTitulos(const ATitulos: TPreAutorizacaoTituloReceberList);
  public
    property Data: TDateTime read GetData write SetData;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property Caixa: TString read GetCaixa write SetCaixa;
    property FuncionarioId: Int64 read GetFuncionarioId write SetFuncionarioId;
    property ClienteId: Int64 read GetClienteId write SetClienteId;
    property Documento: TString read GetDocumento write SetDocumento;
    property Cartao: TString read GetCartao write SetCartao;
    property Numero: TString read GetNumero write SetNumero;
    property Valor: Double read GetValor write SetValor;
    property QuantidadeDeParcelas: Integer read GetQuantidadeDeParcelas write SetQuantidadeDeParcelas;
    property FinalizadoraId: Integer read GetFinalizadoraId write SetFinalizadoraId;
    property Observacao: TString read GetObservacao write SetObservacao;
    property Titulos: TPreAutorizacaoTituloReceberList read GetTitulos write SetTitulos;
  end;

implementation

{ TPreAutorizacaoContaReceberList }

procedure TPreAutorizacaoContaReceberList.Add(const APreAutorizacaoContaReceber: IPreAutorizacaoContaReceber);
begin
  FList.Add(APreAutorizacaoContaReceber);
end;

procedure TPreAutorizacaoContaReceberList.Clear;
begin
  FList.Clear;
end;

function TPreAutorizacaoContaReceberList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TPreAutorizacaoContaReceberList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TPreAutorizacaoContaReceberList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TPreAutorizacaoContaReceberList.GetEnumerator: TPreAutorizacaoContaReceberListEnumerator;
begin
  Result := TPreAutorizacaoContaReceberListEnumerator.Create(Self);
end;

function TPreAutorizacaoContaReceberList.GetItems(AIndex: Integer): IPreAutorizacaoContaReceber;
begin
  Result := FList[AIndex] as IPreAutorizacaoContaReceber;
end;

function TPreAutorizacaoContaReceberList.GetReference: TPreAutorizacaoContaReceberList;
begin
  Result := Self;
end;

procedure TPreAutorizacaoContaReceberList.SetItems(AIndex: Integer; const Value: IPreAutorizacaoContaReceber);
begin
  FList[AIndex] := Value;
end;

{ TPreAutorizacaoContaReceberListEnumerator }

constructor TPreAutorizacaoContaReceberListEnumerator.Create(APreAutorizacaoContaReceberList: TPreAutorizacaoContaReceberList);
begin
  inherited Create;
  FIndex := -1;
  FPreAutorizacaoContaReceberList := APreAutorizacaoContaReceberList;
end;

function TPreAutorizacaoContaReceberListEnumerator.GetCurrent: IPreAutorizacaoContaReceber;
begin
  Result := FPreAutorizacaoContaReceberList[FIndex];
end;

function TPreAutorizacaoContaReceberListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FPreAutorizacaoContaReceberList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TPreAutorizacaoContaReceberListRec }

class function TPreAutorizacaoContaReceberListRec.Create(const AList: IPreAutorizacaoContaReceberList): TPreAutorizacaoContaReceberListRec;
begin
  FillChar(Result, SizeOf(TPreAutorizacaoContaReceberListRec), 0);
  Result.FList := AList;
end;

class operator TPreAutorizacaoContaReceberListRec.Implicit(AListRec: TPreAutorizacaoContaReceberListRec): TPreAutorizacaoContaReceberList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TPreAutorizacaoContaReceber }

function TPreAutorizacaoContaReceber.GetData: TDateTime;
begin
  Result := FData;
end;

procedure TPreAutorizacaoContaReceber.SetData(const AData: TDateTime);
begin
  FData := AData;
end;

function TPreAutorizacaoContaReceber.GetLojaId: Int64;
begin
  Result := FLojaId;
end;

procedure TPreAutorizacaoContaReceber.SetLojaId(const ALojaId: Int64);
begin
  FLojaId := ALojaId;
end;

function TPreAutorizacaoContaReceber.GetCaixa: TString;
begin
  Result := FCaixa;
end;

procedure TPreAutorizacaoContaReceber.SetCaixa(const ACaixa: TString);
begin
  FCaixa := ACaixa;
end;

function TPreAutorizacaoContaReceber.GetFuncionarioId: Int64;
begin
  Result := FFuncionarioId;
end;

procedure TPreAutorizacaoContaReceber.SetFuncionarioId(const AFuncionarioId: Int64);
begin
  FFuncionarioId := AFuncionarioId;
end;

function TPreAutorizacaoContaReceber.GetClienteId: Int64;
begin
  Result := FClienteId;
end;

procedure TPreAutorizacaoContaReceber.SetClienteId(const AClienteId: Int64);
begin
  FClienteId := AClienteId;
end;

function TPreAutorizacaoContaReceber.GetDocumento: TString;
begin
  Result := FDocumento;
end;

procedure TPreAutorizacaoContaReceber.SetDocumento(const ADocumento: TString);
begin
  FDocumento := ADocumento;
end;

function TPreAutorizacaoContaReceber.GetCartao: TString;
begin
  Result := FCartao;
end;

procedure TPreAutorizacaoContaReceber.SetCartao(const ACartao: TString);
begin
  FCartao := ACartao;
end;

function TPreAutorizacaoContaReceber.GetNumero: TString;
begin
  Result := FNumero;
end;

procedure TPreAutorizacaoContaReceber.SetNumero(const ANumero: TString);
begin
  FNumero := ANumero;
end;

function TPreAutorizacaoContaReceber.GetValor: Double;
begin
  Result := FValor;
end;

procedure TPreAutorizacaoContaReceber.SetValor(const AValor: Double);
begin
  FValor := AValor;
end;

function TPreAutorizacaoContaReceber.GetQuantidadeDeParcelas: Integer;
begin
  Result := FQuantidadeDeParcelas;
end;

procedure TPreAutorizacaoContaReceber.SetQuantidadeDeParcelas(const AQuantidadeDeParcelas: Integer);
begin
  FQuantidadeDeParcelas := AQuantidadeDeParcelas;
end;

function TPreAutorizacaoContaReceber.GetFinalizadoraId: Integer;
begin
  Result := FFinalizadoraId;
end;

procedure TPreAutorizacaoContaReceber.SetFinalizadoraId(const AFinalizadoraId: Integer);
begin
  FFinalizadoraId := AFinalizadoraId;
end;

function TPreAutorizacaoContaReceber.GetObservacao: TString;
begin
  Result := FObservacao;
end;

procedure TPreAutorizacaoContaReceber.SetObservacao(const AObservacao: TString);
begin
  FObservacao := AObservacao;
end;

function TPreAutorizacaoContaReceber.GetTitulos: TPreAutorizacaoTituloReceberList;
begin
  Result := FTitulos;
end;

procedure TPreAutorizacaoContaReceber.SetTitulos(const ATitulos: TPreAutorizacaoTituloReceberList);
begin
  FTitulos := ATitulos;
end;


end.
unit SDK.Model.TransacaoConvenio;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ITransacaoConvenio = interface(IModel)
    ['{3C5CFF5F-89CC-4295-96EF-093499A1DC41}']
    function GetSequencial: TString;
    procedure SetSequencial(const ASequencial: TString);
    function GetNumeroCaixa: TString;
    procedure SetNumeroCaixa(const ANumeroCaixa: TString);
    function GetData: TDateTime;
    procedure SetData(const AData: TDateTime);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetClienteId: Int64;
    procedure SetClienteId(const AClienteId: Int64);
    function GetDocumento: TString;
    procedure SetDocumento(const ADocumento: TString);
    function GetCartao: TString;
    procedure SetCartao(const ACartao: TString);
    function GetOperadorId: Int64;
    procedure SetOperadorId(const AOperadorId: Int64);
    function GetFinalizadoraId: Integer;
    procedure SetFinalizadoraId(const AFinalizadoraId: Integer);
    function GetCoo: Int64;
    procedure SetCoo(const ACoo: Int64);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
    function GetSenha: TString;
    procedure SetSenha(const ASenha: TString);
    property Sequencial: TString read GetSequencial write SetSequencial;
    property NumeroCaixa: TString read GetNumeroCaixa write SetNumeroCaixa;
    property Data: TDateTime read GetData write SetData;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property ClienteId: Int64 read GetClienteId write SetClienteId;
    property Documento: TString read GetDocumento write SetDocumento;
    property Cartao: TString read GetCartao write SetCartao;
    property OperadorId: Int64 read GetOperadorId write SetOperadorId;
    property FinalizadoraId: Integer read GetFinalizadoraId write SetFinalizadoraId;
    property Coo: Int64 read GetCoo write SetCoo;
    property Valor: Double read GetValor write SetValor;
    property Senha: TString read GetSenha write SetSenha;
  end;

  TTransacaoConvenioList = class;

  ITransacaoConvenioList = interface
	['{B84B9567-98C2-4398-BCF8-85E1FDBE51F7}']
    function GetReference: TTransacaoConvenioList;
    function GetItems(AIndex: Integer): ITransacaoConvenio;
    procedure SetItems(AIndex: Integer; const Value: ITransacaoConvenio);
    procedure Add(const ATransacaoConvenio: ITransacaoConvenio);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ITransacaoConvenio read GetItems write SetItems; default;
  end;

  TTransacaoConvenioListEnumerator = class
  private
    FIndex: Integer;
    FTransacaoConvenioList: TTransacaoConvenioList;
  public
    constructor Create(ATransacaoConvenioList: TTransacaoConvenioList);
    function GetCurrent: ITransacaoConvenio; inline;
    function MoveNext: Boolean;
    property Current: ITransacaoConvenio read GetCurrent;
  end;

  TTransacaoConvenioList = class(TInterfacedObject, ITransacaoConvenioList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ITransacaoConvenio;
    procedure SetItems(AIndex: Integer; const Value: ITransacaoConvenio);
  public
    constructor Create;
    procedure Add(const ATransacaoConvenio: ITransacaoConvenio);
    destructor Destroy; override;
    function GetEnumerator: TTransacaoConvenioListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TTransacaoConvenioList;
    property Items[AIndex: Integer]: ITransacaoConvenio read GetItems write SetItems; default;
  end;

  TTransacaoConvenioListRec = record
  private
    FList: ITransacaoConvenioList;
  public
    class function Create(const AList: ITransacaoConvenioList): TTransacaoConvenioListRec; static;
    class operator Implicit(AListRec: TTransacaoConvenioListRec): TTransacaoConvenioList;
  end;

  TTransacaoConvenio = class(TInterfacedModel, ITransacaoConvenio)
  private
	FSequencial: TString;
	FNumeroCaixa: TString;
	FData: TDateTime;
	FLojaId: Int64;
	FClienteId: Int64;
	FDocumento: TString;
	FCartao: TString;
	FOperadorId: Int64;
	FFinalizadoraId: Integer;
	FCoo: Int64;
	FValor: Double;
	FSenha: TString;
    function GetSequencial: TString;
    procedure SetSequencial(const ASequencial: TString);
    function GetNumeroCaixa: TString;
    procedure SetNumeroCaixa(const ANumeroCaixa: TString);
    function GetData: TDateTime;
    procedure SetData(const AData: TDateTime);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetClienteId: Int64;
    procedure SetClienteId(const AClienteId: Int64);
    function GetDocumento: TString;
    procedure SetDocumento(const ADocumento: TString);
    function GetCartao: TString;
    procedure SetCartao(const ACartao: TString);
    function GetOperadorId: Int64;
    procedure SetOperadorId(const AOperadorId: Int64);
    function GetFinalizadoraId: Integer;
    procedure SetFinalizadoraId(const AFinalizadoraId: Integer);
    function GetCoo: Int64;
    procedure SetCoo(const ACoo: Int64);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
    function GetSenha: TString;
    procedure SetSenha(const ASenha: TString);
  public
    property Sequencial: TString read GetSequencial write SetSequencial;
    property NumeroCaixa: TString read GetNumeroCaixa write SetNumeroCaixa;
    property Data: TDateTime read GetData write SetData;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property ClienteId: Int64 read GetClienteId write SetClienteId;
    property Documento: TString read GetDocumento write SetDocumento;
    property Cartao: TString read GetCartao write SetCartao;
    property OperadorId: Int64 read GetOperadorId write SetOperadorId;
    property FinalizadoraId: Integer read GetFinalizadoraId write SetFinalizadoraId;
    property Coo: Int64 read GetCoo write SetCoo;
    property Valor: Double read GetValor write SetValor;
    property Senha: TString read GetSenha write SetSenha;
  end;

implementation

{ TTransacaoConvenioList }

procedure TTransacaoConvenioList.Add(const ATransacaoConvenio: ITransacaoConvenio);
begin
  FList.Add(ATransacaoConvenio);
end;

procedure TTransacaoConvenioList.Clear;
begin
  FList.Clear;
end;

function TTransacaoConvenioList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TTransacaoConvenioList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TTransacaoConvenioList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TTransacaoConvenioList.GetEnumerator: TTransacaoConvenioListEnumerator;
begin
  Result := TTransacaoConvenioListEnumerator.Create(Self);
end;

function TTransacaoConvenioList.GetItems(AIndex: Integer): ITransacaoConvenio;
begin
  Result := FList[AIndex] as ITransacaoConvenio;
end;

function TTransacaoConvenioList.GetReference: TTransacaoConvenioList;
begin
  Result := Self;
end;

procedure TTransacaoConvenioList.SetItems(AIndex: Integer; const Value: ITransacaoConvenio);
begin
  FList[AIndex] := Value;
end;

{ TTransacaoConvenioListEnumerator }

constructor TTransacaoConvenioListEnumerator.Create(ATransacaoConvenioList: TTransacaoConvenioList);
begin
  inherited Create;
  FIndex := -1;
  FTransacaoConvenioList := ATransacaoConvenioList;
end;

function TTransacaoConvenioListEnumerator.GetCurrent: ITransacaoConvenio;
begin
  Result := FTransacaoConvenioList[FIndex];
end;

function TTransacaoConvenioListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FTransacaoConvenioList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TTransacaoConvenioListRec }

class function TTransacaoConvenioListRec.Create(const AList: ITransacaoConvenioList): TTransacaoConvenioListRec;
begin
  FillChar(Result, SizeOf(TTransacaoConvenioListRec), 0);
  Result.FList := AList;
end;

class operator TTransacaoConvenioListRec.Implicit(AListRec: TTransacaoConvenioListRec): TTransacaoConvenioList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TTransacaoConvenio }

function TTransacaoConvenio.GetSequencial: TString;
begin
  Result := FSequencial;
end;

procedure TTransacaoConvenio.SetSequencial(const ASequencial: TString);
begin
  FSequencial := ASequencial;
end;

function TTransacaoConvenio.GetNumeroCaixa: TString;
begin
  Result := FNumeroCaixa;
end;

procedure TTransacaoConvenio.SetNumeroCaixa(const ANumeroCaixa: TString);
begin
  FNumeroCaixa := ANumeroCaixa;
end;

function TTransacaoConvenio.GetData: TDateTime;
begin
  Result := FData;
end;

procedure TTransacaoConvenio.SetData(const AData: TDateTime);
begin
  FData := AData;
end;

function TTransacaoConvenio.GetLojaId: Int64;
begin
  Result := FLojaId;
end;

procedure TTransacaoConvenio.SetLojaId(const ALojaId: Int64);
begin
  FLojaId := ALojaId;
end;

function TTransacaoConvenio.GetClienteId: Int64;
begin
  Result := FClienteId;
end;

procedure TTransacaoConvenio.SetClienteId(const AClienteId: Int64);
begin
  FClienteId := AClienteId;
end;

function TTransacaoConvenio.GetDocumento: TString;
begin
  Result := FDocumento;
end;

procedure TTransacaoConvenio.SetDocumento(const ADocumento: TString);
begin
  FDocumento := ADocumento;
end;

function TTransacaoConvenio.GetCartao: TString;
begin
  Result := FCartao;
end;

procedure TTransacaoConvenio.SetCartao(const ACartao: TString);
begin
  FCartao := ACartao;
end;

function TTransacaoConvenio.GetOperadorId: Int64;
begin
  Result := FOperadorId;
end;

procedure TTransacaoConvenio.SetOperadorId(const AOperadorId: Int64);
begin
  FOperadorId := AOperadorId;
end;

function TTransacaoConvenio.GetFinalizadoraId: Integer;
begin
  Result := FFinalizadoraId;
end;

procedure TTransacaoConvenio.SetFinalizadoraId(const AFinalizadoraId: Integer);
begin
  FFinalizadoraId := AFinalizadoraId;
end;

function TTransacaoConvenio.GetCoo: Int64;
begin
  Result := FCoo;
end;

procedure TTransacaoConvenio.SetCoo(const ACoo: Int64);
begin
  FCoo := ACoo;
end;

function TTransacaoConvenio.GetValor: Double;
begin
  Result := FValor;
end;

procedure TTransacaoConvenio.SetValor(const AValor: Double);
begin
  FValor := AValor;
end;

function TTransacaoConvenio.GetSenha: TString;
begin
  Result := FSenha;
end;

procedure TTransacaoConvenio.SetSenha(const ASenha: TString);
begin
  FSenha := ASenha;
end;


end.
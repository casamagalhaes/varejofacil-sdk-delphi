unit SDK.Model.ItemRecebimento;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IItemRecebimento = interface(IModel)
    ['{B00D3681-0616-4361-9837-42D33143DC38}']
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetDocumento: TString;
    procedure SetDocumento(const ADocumento: TString);
    function GetRecebimentoId: TString;
    procedure SetRecebimentoId(const ARecebimentoId: TString);
    function GetCodigoProposta: TString;
    procedure SetCodigoProposta(const ACodigoProposta: TString);
    function GetData: TDateTime;
    procedure SetData(const AData: TDateTime);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
    function GetValorDocumento: Double;
    procedure SetValorDocumento(const AValorDocumento: Double);
    function GetValorDevido: Double;
    procedure SetValorDevido(const AValorDevido: Double);
    function GetAcrescimo: Double;
    procedure SetAcrescimo(const AAcrescimo: Double);
    function GetDesconto: Double;
    procedure SetDesconto(const ADesconto: Double);
    function GetJuros: Double;
    procedure SetJuros(const AJuros: Double);
    function GetDiasAtraso: Integer;
    procedure SetDiasAtraso(const ADiasAtraso: Integer);
    function GetTipoRecebimento: TString;
    procedure SetTipoRecebimento(const ATipoRecebimento: TString);
    function GetLojaOrigem: TString;
    procedure SetLojaOrigem(const ALojaOrigem: TString);
    function GetClienteId: Integer;
    procedure SetClienteId(const AClienteId: Integer);
    function GetCodigoAuxiliar: Integer;
    procedure SetCodigoAuxiliar(const ACodigoAuxiliar: Integer);
    function GetPlanoContaReduzido: TString;
    procedure SetPlanoContaReduzido(const APlanoContaReduzido: TString);
    function GetContaReceberId: Integer;
    procedure SetContaReceberId(const AContaReceberId: Integer);
    property Id: Integer read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property Documento: TString read GetDocumento write SetDocumento;
    property RecebimentoId: TString read GetRecebimentoId write SetRecebimentoId;
    property CodigoProposta: TString read GetCodigoProposta write SetCodigoProposta;
    property Data: TDateTime read GetData write SetData;
    property Valor: Double read GetValor write SetValor;
    property ValorDocumento: Double read GetValorDocumento write SetValorDocumento;
    property ValorDevido: Double read GetValorDevido write SetValorDevido;
    property Acrescimo: Double read GetAcrescimo write SetAcrescimo;
    property Desconto: Double read GetDesconto write SetDesconto;
    property Juros: Double read GetJuros write SetJuros;
    property DiasAtraso: Integer read GetDiasAtraso write SetDiasAtraso;
    property TipoRecebimento: TString read GetTipoRecebimento write SetTipoRecebimento;
    property LojaOrigem: TString read GetLojaOrigem write SetLojaOrigem;
    property ClienteId: Integer read GetClienteId write SetClienteId;
    property CodigoAuxiliar: Integer read GetCodigoAuxiliar write SetCodigoAuxiliar;
    property PlanoContaReduzido: TString read GetPlanoContaReduzido write SetPlanoContaReduzido;
    property ContaReceberId: Integer read GetContaReceberId write SetContaReceberId;
  end;

  TItemRecebimentoList = class;

  IItemRecebimentoList = interface
	['{9DCB3B05-7A7D-49E8-9668-85B139630BAF}']
    function GetReference: TItemRecebimentoList;
    function GetItems(AIndex: Integer): IItemRecebimento;
    procedure SetItems(AIndex: Integer; const Value: IItemRecebimento);
    procedure Add(const AItemRecebimento: IItemRecebimento);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IItemRecebimento read GetItems write SetItems; default;
  end;

  TItemRecebimentoListEnumerator = class
  private
    FIndex: Integer;
    FItemRecebimentoList: TItemRecebimentoList;
  public
    constructor Create(AItemRecebimentoList: TItemRecebimentoList);
    function GetCurrent: IItemRecebimento; inline;
    function MoveNext: Boolean;
    property Current: IItemRecebimento read GetCurrent;
  end;

  TItemRecebimentoList = class(TInterfacedObject, IItemRecebimentoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IItemRecebimento;
    procedure SetItems(AIndex: Integer; const Value: IItemRecebimento);
  public
    constructor Create;
    procedure Add(const AItemRecebimento: IItemRecebimento);
    destructor Destroy; override;
    function GetEnumerator: TItemRecebimentoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TItemRecebimentoList;
    property Items[AIndex: Integer]: IItemRecebimento read GetItems write SetItems; default;
  end;

  TItemRecebimentoListRec = record
  private
    FList: IItemRecebimentoList;
  public
    class function Create(const AList: IItemRecebimentoList): TItemRecebimentoListRec; static;
    class operator Implicit(AListRec: TItemRecebimentoListRec): TItemRecebimentoList;
  end;

  TItemRecebimento = class(TInterfacedModel, IItemRecebimento)
  private
	FId: Integer;
	FDescricao: TString;
	FDocumento: TString;
	FRecebimentoId: TString;
	FCodigoProposta: TString;
	FData: TDateTime;
	FValor: Double;
	FValorDocumento: Double;
	FValorDevido: Double;
	FAcrescimo: Double;
	FDesconto: Double;
	FJuros: Double;
	FDiasAtraso: Integer;
	FTipoRecebimento: TString;
	FLojaOrigem: TString;
	FClienteId: Integer;
	FCodigoAuxiliar: Integer;
	FPlanoContaReduzido: TString;
	FContaReceberId: Integer;
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetDocumento: TString;
    procedure SetDocumento(const ADocumento: TString);
    function GetRecebimentoId: TString;
    procedure SetRecebimentoId(const ARecebimentoId: TString);
    function GetCodigoProposta: TString;
    procedure SetCodigoProposta(const ACodigoProposta: TString);
    function GetData: TDateTime;
    procedure SetData(const AData: TDateTime);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
    function GetValorDocumento: Double;
    procedure SetValorDocumento(const AValorDocumento: Double);
    function GetValorDevido: Double;
    procedure SetValorDevido(const AValorDevido: Double);
    function GetAcrescimo: Double;
    procedure SetAcrescimo(const AAcrescimo: Double);
    function GetDesconto: Double;
    procedure SetDesconto(const ADesconto: Double);
    function GetJuros: Double;
    procedure SetJuros(const AJuros: Double);
    function GetDiasAtraso: Integer;
    procedure SetDiasAtraso(const ADiasAtraso: Integer);
    function GetTipoRecebimento: TString;
    procedure SetTipoRecebimento(const ATipoRecebimento: TString);
    function GetLojaOrigem: TString;
    procedure SetLojaOrigem(const ALojaOrigem: TString);
    function GetClienteId: Integer;
    procedure SetClienteId(const AClienteId: Integer);
    function GetCodigoAuxiliar: Integer;
    procedure SetCodigoAuxiliar(const ACodigoAuxiliar: Integer);
    function GetPlanoContaReduzido: TString;
    procedure SetPlanoContaReduzido(const APlanoContaReduzido: TString);
    function GetContaReceberId: Integer;
    procedure SetContaReceberId(const AContaReceberId: Integer);
  public
    property Id: Integer read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property Documento: TString read GetDocumento write SetDocumento;
    property RecebimentoId: TString read GetRecebimentoId write SetRecebimentoId;
    property CodigoProposta: TString read GetCodigoProposta write SetCodigoProposta;
    property Data: TDateTime read GetData write SetData;
    property Valor: Double read GetValor write SetValor;
    property ValorDocumento: Double read GetValorDocumento write SetValorDocumento;
    property ValorDevido: Double read GetValorDevido write SetValorDevido;
    property Acrescimo: Double read GetAcrescimo write SetAcrescimo;
    property Desconto: Double read GetDesconto write SetDesconto;
    property Juros: Double read GetJuros write SetJuros;
    property DiasAtraso: Integer read GetDiasAtraso write SetDiasAtraso;
    property TipoRecebimento: TString read GetTipoRecebimento write SetTipoRecebimento;
    property LojaOrigem: TString read GetLojaOrigem write SetLojaOrigem;
    property ClienteId: Integer read GetClienteId write SetClienteId;
    property CodigoAuxiliar: Integer read GetCodigoAuxiliar write SetCodigoAuxiliar;
    property PlanoContaReduzido: TString read GetPlanoContaReduzido write SetPlanoContaReduzido;
    property ContaReceberId: Integer read GetContaReceberId write SetContaReceberId;
  end;

implementation

{ TItemRecebimentoList }

procedure TItemRecebimentoList.Add(const AItemRecebimento: IItemRecebimento);
begin
  FList.Add(AItemRecebimento);
end;

procedure TItemRecebimentoList.Clear;
begin
  FList.Clear;
end;

function TItemRecebimentoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TItemRecebimentoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TItemRecebimentoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TItemRecebimentoList.GetEnumerator: TItemRecebimentoListEnumerator;
begin
  Result := TItemRecebimentoListEnumerator.Create(Self);
end;

function TItemRecebimentoList.GetItems(AIndex: Integer): IItemRecebimento;
begin
  Result := FList[AIndex] as IItemRecebimento;
end;

function TItemRecebimentoList.GetReference: TItemRecebimentoList;
begin
  Result := Self;
end;

procedure TItemRecebimentoList.SetItems(AIndex: Integer; const Value: IItemRecebimento);
begin
  FList[AIndex] := Value;
end;

{ TItemRecebimentoListEnumerator }

constructor TItemRecebimentoListEnumerator.Create(AItemRecebimentoList: TItemRecebimentoList);
begin
  inherited Create;
  FIndex := -1;
  FItemRecebimentoList := AItemRecebimentoList;
end;

function TItemRecebimentoListEnumerator.GetCurrent: IItemRecebimento;
begin
  Result := FItemRecebimentoList[FIndex];
end;

function TItemRecebimentoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FItemRecebimentoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TItemRecebimentoListRec }

class function TItemRecebimentoListRec.Create(const AList: IItemRecebimentoList): TItemRecebimentoListRec;
begin
  FillChar(Result, SizeOf(TItemRecebimentoListRec), 0);
  Result.FList := AList;
end;

class operator TItemRecebimentoListRec.Implicit(AListRec: TItemRecebimentoListRec): TItemRecebimentoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TItemRecebimento }

function TItemRecebimento.GetId: Integer;
begin
  Result := FId;
end;

procedure TItemRecebimento.SetId(const AId: Integer);
begin
  FId := AId;
end;

function TItemRecebimento.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TItemRecebimento.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

function TItemRecebimento.GetDocumento: TString;
begin
  Result := FDocumento;
end;

procedure TItemRecebimento.SetDocumento(const ADocumento: TString);
begin
  FDocumento := ADocumento;
end;

function TItemRecebimento.GetRecebimentoId: TString;
begin
  Result := FRecebimentoId;
end;

procedure TItemRecebimento.SetRecebimentoId(const ARecebimentoId: TString);
begin
  FRecebimentoId := ARecebimentoId;
end;

function TItemRecebimento.GetCodigoProposta: TString;
begin
  Result := FCodigoProposta;
end;

procedure TItemRecebimento.SetCodigoProposta(const ACodigoProposta: TString);
begin
  FCodigoProposta := ACodigoProposta;
end;

function TItemRecebimento.GetData: TDateTime;
begin
  Result := FData;
end;

procedure TItemRecebimento.SetData(const AData: TDateTime);
begin
  FData := AData;
end;

function TItemRecebimento.GetValor: Double;
begin
  Result := FValor;
end;

procedure TItemRecebimento.SetValor(const AValor: Double);
begin
  FValor := AValor;
end;

function TItemRecebimento.GetValorDocumento: Double;
begin
  Result := FValorDocumento;
end;

procedure TItemRecebimento.SetValorDocumento(const AValorDocumento: Double);
begin
  FValorDocumento := AValorDocumento;
end;

function TItemRecebimento.GetValorDevido: Double;
begin
  Result := FValorDevido;
end;

procedure TItemRecebimento.SetValorDevido(const AValorDevido: Double);
begin
  FValorDevido := AValorDevido;
end;

function TItemRecebimento.GetAcrescimo: Double;
begin
  Result := FAcrescimo;
end;

procedure TItemRecebimento.SetAcrescimo(const AAcrescimo: Double);
begin
  FAcrescimo := AAcrescimo;
end;

function TItemRecebimento.GetDesconto: Double;
begin
  Result := FDesconto;
end;

procedure TItemRecebimento.SetDesconto(const ADesconto: Double);
begin
  FDesconto := ADesconto;
end;

function TItemRecebimento.GetJuros: Double;
begin
  Result := FJuros;
end;

procedure TItemRecebimento.SetJuros(const AJuros: Double);
begin
  FJuros := AJuros;
end;

function TItemRecebimento.GetDiasAtraso: Integer;
begin
  Result := FDiasAtraso;
end;

procedure TItemRecebimento.SetDiasAtraso(const ADiasAtraso: Integer);
begin
  FDiasAtraso := ADiasAtraso;
end;

function TItemRecebimento.GetTipoRecebimento: TString;
begin
  Result := FTipoRecebimento;
end;

procedure TItemRecebimento.SetTipoRecebimento(const ATipoRecebimento: TString);
begin
  FTipoRecebimento := ATipoRecebimento;
end;

function TItemRecebimento.GetLojaOrigem: TString;
begin
  Result := FLojaOrigem;
end;

procedure TItemRecebimento.SetLojaOrigem(const ALojaOrigem: TString);
begin
  FLojaOrigem := ALojaOrigem;
end;

function TItemRecebimento.GetClienteId: Integer;
begin
  Result := FClienteId;
end;

procedure TItemRecebimento.SetClienteId(const AClienteId: Integer);
begin
  FClienteId := AClienteId;
end;

function TItemRecebimento.GetCodigoAuxiliar: Integer;
begin
  Result := FCodigoAuxiliar;
end;

procedure TItemRecebimento.SetCodigoAuxiliar(const ACodigoAuxiliar: Integer);
begin
  FCodigoAuxiliar := ACodigoAuxiliar;
end;

function TItemRecebimento.GetPlanoContaReduzido: TString;
begin
  Result := FPlanoContaReduzido;
end;

procedure TItemRecebimento.SetPlanoContaReduzido(const APlanoContaReduzido: TString);
begin
  FPlanoContaReduzido := APlanoContaReduzido;
end;

function TItemRecebimento.GetContaReceberId: Integer;
begin
  Result := FContaReceberId;
end;

procedure TItemRecebimento.SetContaReceberId(const AContaReceberId: Integer);
begin
  FContaReceberId := AContaReceberId;
end;


end.
unit SDK.Model.ImpostoFederal;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IImpostoFederal = interface(IModel)
    ['{B5A12532-AC26-48F2-8BBF-392C1416D53D}']
    function GetId: TString;
    procedure SetId(const AId: TString);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetRetencao: Double;
    procedure SetRetencao(const ARetencao: Double);
    function GetObservacao: TString;
    procedure SetObservacao(const AObservacao: TString);
    function GetTipoIncidencia: TTipoIncidencia;
    procedure SetTipoIncidencia(const ATipoIncidencia: TTipoIncidencia);
    function GetTipoImposto: TTipoImposto;
    procedure SetTipoImposto(const ATipoImposto: TTipoImposto);
    function GetCstEntrada: Integer;
    procedure SetCstEntrada(const ACstEntrada: Integer);
    function GetCstSaida: Integer;
    procedure SetCstSaida(const ACstSaida: Integer);
    function GetAliquotaEntrada: Double;
    procedure SetAliquotaEntrada(const AAliquotaEntrada: Double);
    function GetAliquotaSaida: Double;
    procedure SetAliquotaSaida(const AAliquotaSaida: Double);
    function GetCstEntradaPresumido: Integer;
    procedure SetCstEntradaPresumido(const ACstEntradaPresumido: Integer);
    function GetCstSaidaPresumido: Integer;
    procedure SetCstSaidaPresumido(const ACstSaidaPresumido: Integer);
    function GetAliquotaEntradaPresumido: Double;
    procedure SetAliquotaEntradaPresumido(const AAliquotaEntradaPresumido: Double);
    function GetAliquotaSaidaPresumido: Double;
    procedure SetAliquotaSaidaPresumido(const AAliquotaSaidaPresumido: Double);
    function GetCstEntradaSimples: Integer;
    procedure SetCstEntradaSimples(const ACstEntradaSimples: Integer);
    function GetCstSaidaSimples: Integer;
    procedure SetCstSaidaSimples(const ACstSaidaSimples: Integer);
    property Id: TString read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property Retencao: Double read GetRetencao write SetRetencao;
    property Observacao: TString read GetObservacao write SetObservacao;
    property TipoIncidencia: TTipoIncidencia read GetTipoIncidencia write SetTipoIncidencia;
    property TipoImposto: TTipoImposto read GetTipoImposto write SetTipoImposto;
    property CstEntrada: Integer read GetCstEntrada write SetCstEntrada;
    property CstSaida: Integer read GetCstSaida write SetCstSaida;
    property AliquotaEntrada: Double read GetAliquotaEntrada write SetAliquotaEntrada;
    property AliquotaSaida: Double read GetAliquotaSaida write SetAliquotaSaida;
    property CstEntradaPresumido: Integer read GetCstEntradaPresumido write SetCstEntradaPresumido;
    property CstSaidaPresumido: Integer read GetCstSaidaPresumido write SetCstSaidaPresumido;
    property AliquotaEntradaPresumido: Double read GetAliquotaEntradaPresumido write SetAliquotaEntradaPresumido;
    property AliquotaSaidaPresumido: Double read GetAliquotaSaidaPresumido write SetAliquotaSaidaPresumido;
    property CstEntradaSimples: Integer read GetCstEntradaSimples write SetCstEntradaSimples;
    property CstSaidaSimples: Integer read GetCstSaidaSimples write SetCstSaidaSimples;
  end;

  TImpostoFederalList = class;

  IImpostoFederalList = interface
	['{468EFBD2-E9B6-4732-BFA4-AAB5B56C60F1}']
    function GetReference: TImpostoFederalList;
    function GetItems(AIndex: Integer): IImpostoFederal;
    procedure SetItems(AIndex: Integer; const Value: IImpostoFederal);
    procedure Add(const AImpostoFederal: IImpostoFederal);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IImpostoFederal read GetItems write SetItems; default;
  end;

  TImpostoFederalListEnumerator = class
  private
    FIndex: Integer;
    FImpostoFederalList: TImpostoFederalList;
  public
    constructor Create(AImpostoFederalList: TImpostoFederalList);
    function GetCurrent: IImpostoFederal; inline;
    function MoveNext: Boolean;
    property Current: IImpostoFederal read GetCurrent;
  end;

  TImpostoFederalList = class(TInterfacedObject, IImpostoFederalList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IImpostoFederal;
    procedure SetItems(AIndex: Integer; const Value: IImpostoFederal);
  public
    constructor Create;
    procedure Add(const AImpostoFederal: IImpostoFederal);
    destructor Destroy; override;
    function GetEnumerator: TImpostoFederalListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TImpostoFederalList;
    property Items[AIndex: Integer]: IImpostoFederal read GetItems write SetItems; default;
  end;

  TImpostoFederalListRec = record
  private
    FList: IImpostoFederalList;
  public
    class function Create(const AList: IImpostoFederalList): TImpostoFederalListRec; static;
    class operator Implicit(AListRec: TImpostoFederalListRec): TImpostoFederalList;
  end;

  TImpostoFederal = class(TInterfacedModel, IImpostoFederal)
  private
	FId: TString;
	FDescricao: TString;
	FRetencao: Double;
	FObservacao: TString;
	FTipoIncidencia: TTipoIncidencia;
	FTipoImposto: TTipoImposto;
	FCstEntrada: Integer;
	FCstSaida: Integer;
	FAliquotaEntrada: Double;
	FAliquotaSaida: Double;
	FCstEntradaPresumido: Integer;
	FCstSaidaPresumido: Integer;
	FAliquotaEntradaPresumido: Double;
	FAliquotaSaidaPresumido: Double;
	FCstEntradaSimples: Integer;
	FCstSaidaSimples: Integer;
    function GetId: TString;
    procedure SetId(const AId: TString);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetRetencao: Double;
    procedure SetRetencao(const ARetencao: Double);
    function GetObservacao: TString;
    procedure SetObservacao(const AObservacao: TString);
    function GetTipoIncidencia: TTipoIncidencia;
    procedure SetTipoIncidencia(const ATipoIncidencia: TTipoIncidencia);
    function GetTipoImposto: TTipoImposto;
    procedure SetTipoImposto(const ATipoImposto: TTipoImposto);
    function GetCstEntrada: Integer;
    procedure SetCstEntrada(const ACstEntrada: Integer);
    function GetCstSaida: Integer;
    procedure SetCstSaida(const ACstSaida: Integer);
    function GetAliquotaEntrada: Double;
    procedure SetAliquotaEntrada(const AAliquotaEntrada: Double);
    function GetAliquotaSaida: Double;
    procedure SetAliquotaSaida(const AAliquotaSaida: Double);
    function GetCstEntradaPresumido: Integer;
    procedure SetCstEntradaPresumido(const ACstEntradaPresumido: Integer);
    function GetCstSaidaPresumido: Integer;
    procedure SetCstSaidaPresumido(const ACstSaidaPresumido: Integer);
    function GetAliquotaEntradaPresumido: Double;
    procedure SetAliquotaEntradaPresumido(const AAliquotaEntradaPresumido: Double);
    function GetAliquotaSaidaPresumido: Double;
    procedure SetAliquotaSaidaPresumido(const AAliquotaSaidaPresumido: Double);
    function GetCstEntradaSimples: Integer;
    procedure SetCstEntradaSimples(const ACstEntradaSimples: Integer);
    function GetCstSaidaSimples: Integer;
    procedure SetCstSaidaSimples(const ACstSaidaSimples: Integer);
  public
    property Id: TString read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property Retencao: Double read GetRetencao write SetRetencao;
    property Observacao: TString read GetObservacao write SetObservacao;
    property TipoIncidencia: TTipoIncidencia read GetTipoIncidencia write SetTipoIncidencia;
    property TipoImposto: TTipoImposto read GetTipoImposto write SetTipoImposto;
    property CstEntrada: Integer read GetCstEntrada write SetCstEntrada;
    property CstSaida: Integer read GetCstSaida write SetCstSaida;
    property AliquotaEntrada: Double read GetAliquotaEntrada write SetAliquotaEntrada;
    property AliquotaSaida: Double read GetAliquotaSaida write SetAliquotaSaida;
    property CstEntradaPresumido: Integer read GetCstEntradaPresumido write SetCstEntradaPresumido;
    property CstSaidaPresumido: Integer read GetCstSaidaPresumido write SetCstSaidaPresumido;
    property AliquotaEntradaPresumido: Double read GetAliquotaEntradaPresumido write SetAliquotaEntradaPresumido;
    property AliquotaSaidaPresumido: Double read GetAliquotaSaidaPresumido write SetAliquotaSaidaPresumido;
    property CstEntradaSimples: Integer read GetCstEntradaSimples write SetCstEntradaSimples;
    property CstSaidaSimples: Integer read GetCstSaidaSimples write SetCstSaidaSimples;
  end;

implementation

{ TImpostoFederalList }

procedure TImpostoFederalList.Add(const AImpostoFederal: IImpostoFederal);
begin
  FList.Add(AImpostoFederal);
end;

procedure TImpostoFederalList.Clear;
begin
  FList.Clear;
end;

function TImpostoFederalList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TImpostoFederalList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TImpostoFederalList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TImpostoFederalList.GetEnumerator: TImpostoFederalListEnumerator;
begin
  Result := TImpostoFederalListEnumerator.Create(Self);
end;

function TImpostoFederalList.GetItems(AIndex: Integer): IImpostoFederal;
begin
  Result := FList[AIndex] as IImpostoFederal;
end;

function TImpostoFederalList.GetReference: TImpostoFederalList;
begin
  Result := Self;
end;

procedure TImpostoFederalList.SetItems(AIndex: Integer; const Value: IImpostoFederal);
begin
  FList[AIndex] := Value;
end;

{ TImpostoFederalListEnumerator }

constructor TImpostoFederalListEnumerator.Create(AImpostoFederalList: TImpostoFederalList);
begin
  inherited Create;
  FIndex := -1;
  FImpostoFederalList := AImpostoFederalList;
end;

function TImpostoFederalListEnumerator.GetCurrent: IImpostoFederal;
begin
  Result := FImpostoFederalList[FIndex];
end;

function TImpostoFederalListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FImpostoFederalList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TImpostoFederalListRec }

class function TImpostoFederalListRec.Create(const AList: IImpostoFederalList): TImpostoFederalListRec;
begin
  FillChar(Result, SizeOf(TImpostoFederalListRec), 0);
  Result.FList := AList;
end;

class operator TImpostoFederalListRec.Implicit(AListRec: TImpostoFederalListRec): TImpostoFederalList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TImpostoFederal }

function TImpostoFederal.GetId: TString;
begin
  Result := FId;
end;

procedure TImpostoFederal.SetId(const AId: TString);
begin
  FId := AId;
end;

function TImpostoFederal.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TImpostoFederal.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

function TImpostoFederal.GetRetencao: Double;
begin
  Result := FRetencao;
end;

procedure TImpostoFederal.SetRetencao(const ARetencao: Double);
begin
  FRetencao := ARetencao;
end;

function TImpostoFederal.GetObservacao: TString;
begin
  Result := FObservacao;
end;

procedure TImpostoFederal.SetObservacao(const AObservacao: TString);
begin
  FObservacao := AObservacao;
end;

function TImpostoFederal.GetTipoIncidencia: TTipoIncidencia;
begin
  Result := FTipoIncidencia;
end;

procedure TImpostoFederal.SetTipoIncidencia(const ATipoIncidencia: TTipoIncidencia);
begin
  FTipoIncidencia := ATipoIncidencia;
end;

function TImpostoFederal.GetTipoImposto: TTipoImposto;
begin
  Result := FTipoImposto;
end;

procedure TImpostoFederal.SetTipoImposto(const ATipoImposto: TTipoImposto);
begin
  FTipoImposto := ATipoImposto;
end;

function TImpostoFederal.GetCstEntrada: Integer;
begin
  Result := FCstEntrada;
end;

procedure TImpostoFederal.SetCstEntrada(const ACstEntrada: Integer);
begin
  FCstEntrada := ACstEntrada;
end;

function TImpostoFederal.GetCstSaida: Integer;
begin
  Result := FCstSaida;
end;

procedure TImpostoFederal.SetCstSaida(const ACstSaida: Integer);
begin
  FCstSaida := ACstSaida;
end;

function TImpostoFederal.GetAliquotaEntrada: Double;
begin
  Result := FAliquotaEntrada;
end;

procedure TImpostoFederal.SetAliquotaEntrada(const AAliquotaEntrada: Double);
begin
  FAliquotaEntrada := AAliquotaEntrada;
end;

function TImpostoFederal.GetAliquotaSaida: Double;
begin
  Result := FAliquotaSaida;
end;

procedure TImpostoFederal.SetAliquotaSaida(const AAliquotaSaida: Double);
begin
  FAliquotaSaida := AAliquotaSaida;
end;

function TImpostoFederal.GetCstEntradaPresumido: Integer;
begin
  Result := FCstEntradaPresumido;
end;

procedure TImpostoFederal.SetCstEntradaPresumido(const ACstEntradaPresumido: Integer);
begin
  FCstEntradaPresumido := ACstEntradaPresumido;
end;

function TImpostoFederal.GetCstSaidaPresumido: Integer;
begin
  Result := FCstSaidaPresumido;
end;

procedure TImpostoFederal.SetCstSaidaPresumido(const ACstSaidaPresumido: Integer);
begin
  FCstSaidaPresumido := ACstSaidaPresumido;
end;

function TImpostoFederal.GetAliquotaEntradaPresumido: Double;
begin
  Result := FAliquotaEntradaPresumido;
end;

procedure TImpostoFederal.SetAliquotaEntradaPresumido(const AAliquotaEntradaPresumido: Double);
begin
  FAliquotaEntradaPresumido := AAliquotaEntradaPresumido;
end;

function TImpostoFederal.GetAliquotaSaidaPresumido: Double;
begin
  Result := FAliquotaSaidaPresumido;
end;

procedure TImpostoFederal.SetAliquotaSaidaPresumido(const AAliquotaSaidaPresumido: Double);
begin
  FAliquotaSaidaPresumido := AAliquotaSaidaPresumido;
end;

function TImpostoFederal.GetCstEntradaSimples: Integer;
begin
  Result := FCstEntradaSimples;
end;

procedure TImpostoFederal.SetCstEntradaSimples(const ACstEntradaSimples: Integer);
begin
  FCstEntradaSimples := ACstEntradaSimples;
end;

function TImpostoFederal.GetCstSaidaSimples: Integer;
begin
  Result := FCstSaidaSimples;
end;

procedure TImpostoFederal.SetCstSaidaSimples(const ACstSaidaSimples: Integer);
begin
  FCstSaidaSimples := ACstSaidaSimples;
end;


end.
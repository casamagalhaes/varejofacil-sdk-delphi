unit SDK.Model.ImpostoFederalGeral;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IImpostoFederalGeral = interface(IModel)
    ['{55DD3EE0-58B1-400D-8BDB-CBF61E7CF0CF}']
    function GetId: Variant;
    procedure SetId(const AId: Variant);
    function GetCstEntrada: Integer;
    procedure SetCstEntrada(const ACstEntrada: Integer);
    function GetCstSaida: Integer;
    procedure SetCstSaida(const ACstSaida: Integer);
    function GetAliquotaEntrada: Double;
    procedure SetAliquotaEntrada(const AAliquotaEntrada: Double);
    function GetAliquotaSaida: Double;
    procedure SetAliquotaSaida(const AAliquotaSaida: Double);
    function GetCstEntradaPresumido: Variant;
    procedure SetCstEntradaPresumido(const ACstEntradaPresumido: Variant);
    function GetCstSaidaPresumido: Variant;
    procedure SetCstSaidaPresumido(const ACstSaidaPresumido: Variant);
    function GetAliquotaEntradaPresumido: Double;
    procedure SetAliquotaEntradaPresumido(const AAliquotaEntradaPresumido: Double);
    function GetAliquotaSaidaPresumido: Double;
    procedure SetAliquotaSaidaPresumido(const AAliquotaSaidaPresumido: Double);
    function GetCstEntradaSimples: Variant;
    procedure SetCstEntradaSimples(const ACstEntradaSimples: Variant);
    function GetCstSaidaSimples: Variant;
    procedure SetCstSaidaSimples(const ACstSaidaSimples: Variant);

    property Id: Variant read GetId write SetId;
    property CstEntrada: Integer read GetCstEntrada write SetCstEntrada;
    property CstSaida: Integer read GetCstSaida write SetCstSaida;
    property AliquotaEntrada: Double read GetAliquotaEntrada write SetAliquotaEntrada;
    property AliquotaSaida: Double read GetAliquotaSaida write SetAliquotaSaida;
    property CstEntradaPresumido: Variant read GetCstEntradaPresumido write SetCstEntradaPresumido;
    property CstSaidaPresumido: Variant read GetCstSaidaPresumido write SetCstSaidaPresumido;
    property AliquotaEntradaPresumido: Double read GetAliquotaEntradaPresumido write SetAliquotaEntradaPresumido;
    property AliquotaSaidaPresumido: Double read GetAliquotaSaidaPresumido write SetAliquotaSaidaPresumido;
    property CstEntradaSimples: Variant read GetCstEntradaSimples write SetCstEntradaSimples;
    property CstSaidaSimples: Variant read GetCstSaidaSimples write SetCstSaidaSimples;
  end;

  TImpostoFederalGeralList = class;

  IImpostoFederalGeralList = interface
    ['{E15B3C2B-3CC1-4EDD-A186-2B6EAFC33A76}']
    function GetReference: TImpostoFederalGeralList;
    function GetItems(AIndex: Integer): IImpostoFederalGeral;
    procedure SetItems(AIndex: Integer; const Value: IImpostoFederalGeral);
    procedure Add(const AImpostoFederalGeral: IImpostoFederalGeral);
    procedure Clear;                                                       
    function Count: Integer;
    property Items[AIndex: Integer]: IImpostoFederalGeral read GetItems write SetItems; default;
  end;

  TImpostoFederalGeralListEnumerator = class
  private
    FIndex: Integer;
    FImpostoFederalGeralList: TImpostoFederalGeralList;
  public
    constructor Create(AImpostoFederalGeralList: TImpostoFederalGeralList);
    function GetCurrent: IImpostoFederalGeral; inline;
    function MoveNext: Boolean;
    property Current: IImpostoFederalGeral read GetCurrent;
  end;

  TImpostoFederalGeralList = class(TInterfacedObject, IImpostoFederalGeralList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IImpostoFederalGeral;
    procedure SetItems(AIndex: Integer; const Value: IImpostoFederalGeral);
  public
    constructor Create;
    procedure Add(const AImpostoFederalGeral: IImpostoFederalGeral);
    destructor Destroy; override;
    function GetEnumerator: TImpostoFederalGeralListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TImpostoFederalGeralList;
    property Items[AIndex: Integer]: IImpostoFederalGeral read GetItems write SetItems; default;
  end;

  TImpostoFederalGeralListRec = record
  private
    FList: IImpostoFederalGeralList;
  public
    class function Create(const AList: IImpostoFederalGeralList): TImpostoFederalGeralListRec; static;
    class operator Implicit(AListRec: TImpostoFederalGeralListRec): TImpostoFederalGeralList;
  end;

  TImpostoFederalGeral = class(TInterfacedModel, IImpostoFederalGeral)
  private
    FId: Variant;
    FCstEntrada: Integer;
    FCstSaida: Integer;
    FAliquotaEntrada: Double;
    FAliquotaSaida: Double;
    FCstEntradaPresumido: Variant;
    FCstSaidaPresumido: Variant;
    FAliquotaEntradaPresumido: Double;
    FAliquotaSaidaPresumido: Double;
    FCstEntradaSimples: Variant;
    FCstSaidaSimples: Variant;
    function GetId: Variant;
    procedure SetId(const AId: Variant);
    function GetCstEntrada: Integer;
    procedure SetCstEntrada(const ACstEntrada: Integer);
    function GetCstSaida: Integer;
    procedure SetCstSaida(const ACstSaida: Integer);
    function GetAliquotaEntrada: Double;
    procedure SetAliquotaEntrada(const AAliquotaEntrada: Double);
    function GetAliquotaSaida: Double;
    procedure SetAliquotaSaida(const AAliquotaSaida: Double);
    function GetCstEntradaPresumido: Variant;
    procedure SetCstEntradaPresumido(const ACstEntradaPresumido: Variant);
    function GetCstSaidaPresumido: Variant;
    procedure SetCstSaidaPresumido(const ACstSaidaPresumido: Variant);
    function GetAliquotaEntradaPresumido: Double;
    procedure SetAliquotaEntradaPresumido(const AAliquotaEntradaPresumido: Double);
    function GetAliquotaSaidaPresumido: Double;
    procedure SetAliquotaSaidaPresumido(const AAliquotaSaidaPresumido: Double);
    function GetCstEntradaSimples: Variant;
    procedure SetCstEntradaSimples(const ACstEntradaSimples: Variant);
    function GetCstSaidaSimples: Variant;
    procedure SetCstSaidaSimples(const ACstSaidaSimples: Variant);
  published
    property Id: Variant read GetId write SetId;
    property CstEntrada: Integer read GetCstEntrada write SetCstEntrada;
    property CstSaida: Integer read GetCstSaida write SetCstSaida;
    property AliquotaEntrada: Double read GetAliquotaEntrada write SetAliquotaEntrada;
    property AliquotaSaida: Double read GetAliquotaSaida write SetAliquotaSaida;
    property CstEntradaPresumido: Variant read GetCstEntradaPresumido write SetCstEntradaPresumido;
    property CstSaidaPresumido: Variant read GetCstSaidaPresumido write SetCstSaidaPresumido;
    property AliquotaEntradaPresumido: Double read GetAliquotaEntradaPresumido write SetAliquotaEntradaPresumido;
    property AliquotaSaidaPresumido: Double read GetAliquotaSaidaPresumido write SetAliquotaSaidaPresumido;
    property CstEntradaSimples: Variant read GetCstEntradaSimples write SetCstEntradaSimples;
    property CstSaidaSimples: Variant read GetCstSaidaSimples write SetCstSaidaSimples;
  end;

implementation

{ TImpostoFederalGeralList }

procedure TImpostoFederalGeralList.Add(const AImpostoFederalGeral: IImpostoFederalGeral);
begin
  FList.Add(AImpostoFederalGeral);
end;

procedure TImpostoFederalGeralList.Clear;
begin
  FList.Clear;
end;

function TImpostoFederalGeralList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TImpostoFederalGeralList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TImpostoFederalGeralList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TImpostoFederalGeralList.GetEnumerator: TImpostoFederalGeralListEnumerator;
begin
  Result := TImpostoFederalGeralListEnumerator.Create(Self);
end;

function TImpostoFederalGeralList.GetItems(AIndex: Integer): IImpostoFederalGeral;
begin
  Result := FList[AIndex] as IImpostoFederalGeral;
end;

function TImpostoFederalGeralList.GetReference: TImpostoFederalGeralList;
begin
  Result := Self;
end;

procedure TImpostoFederalGeralList.SetItems(AIndex: Integer; const Value: IImpostoFederalGeral);
begin
  FList[AIndex] := Value;
end;

{ TImpostoFederalGeralListEnumerator }

constructor TImpostoFederalGeralListEnumerator.Create(AImpostoFederalGeralList: TImpostoFederalGeralList);
begin
  inherited Create;
  FIndex := -1;
  FImpostoFederalGeralList := AImpostoFederalGeralList;
end;

function TImpostoFederalGeralListEnumerator.GetCurrent: IImpostoFederalGeral;
begin
  Result := FImpostoFederalGeralList[FIndex];
end;

function TImpostoFederalGeralListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FImpostoFederalGeralList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TImpostoFederalGeralListRec }

class function TImpostoFederalGeralListRec.Create(const AList: IImpostoFederalGeralList): TImpostoFederalGeralListRec;
begin
  FillChar(Result, SizeOf(TImpostoFederalGeralListRec), 0);
  Result.FList := AList;
end;

class operator TImpostoFederalGeralListRec.Implicit(AListRec: TImpostoFederalGeralListRec): TImpostoFederalGeralList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TImpostoFederalGeral }

function TImpostoFederalGeral.GetId: Variant;
begin
  Result := FId;
end;

procedure TImpostoFederalGeral.SetId(const AId: Variant);
begin
  FId := AId;
end;

function TImpostoFederalGeral.GetCstEntrada: Integer;
begin
  Result := FCstEntrada;
end;

procedure TImpostoFederalGeral.SetCstEntrada(const ACstEntrada: Integer);
begin
  FCstEntrada := ACstEntrada;
end;

function TImpostoFederalGeral.GetCstSaida: Integer;
begin
  Result := FCstSaida;
end;

procedure TImpostoFederalGeral.SetCstSaida(const ACstSaida: Integer);
begin
  FCstSaida := ACstSaida;
end;

function TImpostoFederalGeral.GetAliquotaEntrada: Double;
begin
  Result := FAliquotaEntrada;
end;

procedure TImpostoFederalGeral.SetAliquotaEntrada(const AAliquotaEntrada: Double);
begin
  FAliquotaEntrada := AAliquotaEntrada;
end;

function TImpostoFederalGeral.GetAliquotaSaida: Double;
begin
  Result := FAliquotaSaida;
end;

procedure TImpostoFederalGeral.SetAliquotaSaida(const AAliquotaSaida: Double);
begin
  FAliquotaSaida := AAliquotaSaida;
end;

function TImpostoFederalGeral.GetCstEntradaPresumido: Variant;
begin
  Result := FCstEntradaPresumido;
end;

procedure TImpostoFederalGeral.SetCstEntradaPresumido(const ACstEntradaPresumido: Variant);
begin
  FCstEntradaPresumido := ACstEntradaPresumido;
end;

function TImpostoFederalGeral.GetCstSaidaPresumido: Variant;
begin
  Result := FCstSaidaPresumido;
end;

procedure TImpostoFederalGeral.SetCstSaidaPresumido(const ACstSaidaPresumido: Variant);
begin
  FCstSaidaPresumido := ACstSaidaPresumido;
end;

function TImpostoFederalGeral.GetAliquotaEntradaPresumido: Double;
begin
  Result := FAliquotaEntradaPresumido;
end;

procedure TImpostoFederalGeral.SetAliquotaEntradaPresumido(const AAliquotaEntradaPresumido: Double);
begin
  FAliquotaEntradaPresumido := AAliquotaEntradaPresumido;
end;

function TImpostoFederalGeral.GetAliquotaSaidaPresumido: Double;
begin
  Result := FAliquotaSaidaPresumido;
end;

procedure TImpostoFederalGeral.SetAliquotaSaidaPresumido(const AAliquotaSaidaPresumido: Double);
begin
  FAliquotaSaidaPresumido := AAliquotaSaidaPresumido;
end;

function TImpostoFederalGeral.GetCstEntradaSimples: Variant;
begin
  Result := FCstEntradaSimples;
end;

procedure TImpostoFederalGeral.SetCstEntradaSimples(const ACstEntradaSimples: Variant);
begin
  FCstEntradaSimples := ACstEntradaSimples;
end;

function TImpostoFederalGeral.GetCstSaidaSimples: Variant;
begin
  Result := FCstSaidaSimples;
end;

procedure TImpostoFederalGeral.SetCstSaidaSimples(const ACstSaidaSimples: Variant);
begin
  FCstSaidaSimples := ACstSaidaSimples;
end;

initialization
  RegisterClass(TImpostoFederalGeral);

end.

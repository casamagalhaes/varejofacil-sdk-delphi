unit SDK.Model.ItemConferencia;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums, SDK.Model.CodigoAuxiliar;

type

  IItemConferencia = interface(IModel)
  ['{2BD421F4-9F13-4647-97FC-BFA0B1A0D697}']
    function GetId: Int64;
    function GetConferenciaId: Int64;
    function GetProdutoId: Int64;
    function GetCodigoAuxiliar: ICodigoAuxiliar;
    function GetQuantidadeConferida: Double;
    function GetEhFracionavel: Boolean;
    function GetQuantidadeItensDaEmbalagem: Double;
    function GetUnidadeDeMedida: TString;
    procedure SetId(const Value: Int64);
    procedure SetConferenciaId(const Value: Int64);
    procedure SetProdutoId(const Value: Int64);
    procedure SetCodigoAuxiliar(const Value: ICodigoAuxiliar);
    procedure SetQuantidadeConferida(const Value: Double);
    procedure SetEhFracionavel(const Value: Boolean);
    procedure SetQuantidadeItensDaEmbalagem(const Value: Double);
    procedure SetUnidadeDeMedida(const Value: TString);
    property Id: Int64 read GetId write SetId;
    property ConferenciaId: Int64 read GetConferenciaId write SetConferenciaId;
    property ProdutoId: Int64 read GetProdutoId write SetProdutoId;
    property CodigoAuxiliar: ICodigoAuxiliar read GetCodigoAuxiliar write SetCodigoAuxiliar;
    property QuantidadeConferida: Double read GetQuantidadeConferida write SetQuantidadeConferida;      
    property EhFracionavel: Boolean read GetEhFracionavel write SetEhFracionavel;
    property QuantidadeItensDaEmbalagem: Double read GetQuantidadeItensDaEmbalagem write SetQuantidadeItensDaEmbalagem;
    property UnidadeDeMedida: TString read GetUnidadeDeMedida write SetUnidadeDeMedida;
  end;

  TItemConferenciaList = class;

  IItemConferenciaList = interface
	['{E0E739A8-397E-450D-927C-A4A903D25E25}']
    function GetReference: TItemConferenciaList;
    function GetItems(AIndex: Integer): IItemConferencia;
    procedure SetItems(AIndex: Integer; const Value: IItemConferencia);
    procedure Add(const AInventario: IItemConferencia);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IItemConferencia read GetItems write SetItems; default;
  end;

  TItemConferenciaListEnumerator = class
  private
    FIndex: Integer;
    FItemConferenciaList: TItemConferenciaList;
  public
    constructor Create(AItemInventarioList: TItemConferenciaList);
    function GetCurrent: IItemConferencia; inline;
    function MoveNext: Boolean;
    property Current: IItemConferencia read GetCurrent;
  end;

  TItemConferenciaList = class(TInterfacedObject, IItemConferenciaList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IItemConferencia;
    procedure SetItems(AIndex: Integer; const Value: IItemConferencia);
  public
    constructor Create;
    procedure Add(const AItemConferencia: IItemConferencia);
    destructor Destroy; override;
    function GetEnumerator: TItemConferenciaListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TItemConferenciaList;
    property Items[AIndex: Integer]: IItemConferencia read GetItems write SetItems; default;
  end;

  TItemInventarioListRec = record
  private
    FList: IItemConferenciaList;
  public
    class function Create(const AList: IItemConferenciaList): TItemInventarioListRec; static;
    class operator Implicit(AListRec: TItemInventarioListRec): TItemConferenciaList;
  end;

  TItemConferencia = class(TInterfacedModel, IItemConferencia)
  private
    FId: Int64;
    FConferenciaId: Int64;
    FProdutoId: Int64;
    FCodigoAuxiliar: ICodigoAuxiliar;
    FQuantidadeConferida: Double;
    FEhFracionavel: Boolean;
    FQuantidadeItensDaEmbalagem: Double;
    FUnidadeDeMedida: TString;
    function GetCodigoAuxiliar: ICodigoAuxiliar;
    function GetId: Int64;
    function GetConferenciaId: Int64;
    function GetQuantidadeConferida: Double;
    function GetProdutoId: Int64;
    procedure SetCodigoAuxiliar(const Value: ICodigoAuxiliar);
    procedure SetId(const Value: Int64);
    procedure SetConferenciaId(const Value: Int64);
    procedure SetQuantidadeConferida(const Value: Double);
    procedure SetProdutoId(const Value: Int64);
    function GetEhFracionavel: Boolean;
    procedure SetEhFracionavel(const Value: Boolean);
    function GetQuantidadeItensDaEmbalagem: Double;
    procedure SetQuantidadeItensDaEmbalagem(const Value: Double);
    function GetUnidadeDeMedida: TString;
    procedure SetUnidadeDeMedida(const Value: TString);
  published
    property Id: Int64 read GetId write SetId;
    property ConferenciaId: Int64 read GetConferenciaId write SetConferenciaId;
    property ProdutoId: Int64 read GetProdutoId write SetProdutoId;
    property CodigoAuxiliar: ICodigoAuxiliar read GetCodigoAuxiliar write SetCodigoAuxiliar;
    property QuantidadeConferida: Double read GetQuantidadeConferida write SetQuantidadeConferida;
    property EhFracionavel: Boolean read GetEhFracionavel write SetEhFracionavel;      
    property QuantidadeItensDaEmbalagem: Double read GetQuantidadeItensDaEmbalagem write SetQuantidadeItensDaEmbalagem;
    property UnidadeDeMedida: TString read GetUnidadeDeMedida write SetUnidadeDeMedida;
  end;

implementation

{ TItemConferencia }

function TItemConferencia.GetCodigoAuxiliar: ICodigoAuxiliar;
begin
  Result := FCodigoAuxiliar;
end;

function TItemConferencia.GetId: Int64;
begin
  Result := FId;
end;

function TItemConferencia.GetConferenciaId: Int64;
begin
  Result := FConferenciaId;
end;

function TItemConferencia.GetEhFracionavel: Boolean;
begin
  Result := FEhFracionavel;
end;

function TItemConferencia.GetQuantidadeConferida: Double;
begin
  Result := FQuantidadeConferida;
end;

function TItemConferencia.GetQuantidadeItensDaEmbalagem: Double;
begin
  Result := FQuantidadeItensDaEmbalagem;
end;

function TItemConferencia.GetUnidadeDeMedida: TString;
begin
  Result := FUnidadeDeMedida;
end;

function TItemConferencia.GetProdutoId: Int64;
begin
  Result := FProdutoId;
end;

procedure TItemConferencia.SetCodigoAuxiliar(const Value: ICodigoAuxiliar);
begin
  FCodigoAuxiliar := Value;
end;

procedure TItemConferencia.SetId(const Value: Int64);
begin
  FId := Value;
end;

procedure TItemConferencia.SetConferenciaId(const Value: Int64);
begin
  FConferenciaId := Value;
end;

procedure TItemConferencia.SetEhFracionavel(const Value: Boolean);
begin
  FEhFracionavel := Value;
end;

procedure TItemConferencia.SetQuantidadeConferida(const Value: Double);
begin
  FQuantidadeConferida := Value;
end;     

procedure TItemConferencia.SetQuantidadeItensDaEmbalagem(const Value: Double);
begin
  FQuantidadeItensDaEmbalagem := Value;
end;

procedure TItemConferencia.SetUnidadeDeMedida(const Value: TString);
begin
  FUnidadeDeMedida := Value;
end;

procedure TItemConferencia.SetProdutoId(const Value: Int64);
begin
  FProdutoId := Value;      
end;

{ TItemConferenciaListEnumerator }

constructor TItemConferenciaListEnumerator.Create(
  AItemInventarioList: TItemConferenciaList);
begin
  inherited Create;
  FIndex := -1;
  FItemConferenciaList := AItemInventarioList;
end;

function TItemConferenciaListEnumerator.GetCurrent: IItemConferencia;
begin
  Result := FItemConferenciaList[FIndex];
end;

function TItemConferenciaListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FItemConferenciaList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TItemConferenciaList }

procedure TItemConferenciaList.Add(const AItemConferencia: IItemConferencia);
begin
  FList.Add(AItemConferencia);
end;

procedure TItemConferenciaList.Clear;
begin
  FList.Clear;
end;

function TItemConferenciaList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TItemConferenciaList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TItemConferenciaList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TItemConferenciaList.GetEnumerator: TItemConferenciaListEnumerator;
begin
  Result := TItemConferenciaListEnumerator.Create(Self);
end;

function TItemConferenciaList.GetItems(AIndex: Integer): IItemConferencia;
begin
  Result := FList[AIndex] as IItemConferencia;
end;

function TItemConferenciaList.GetReference: TItemConferenciaList;
begin
  Result := Self;
end;

procedure TItemConferenciaList.SetItems(AIndex: Integer;
  const Value: IItemConferencia);
begin
  FList[AIndex] := Value; 
end;

{ TItemInventarioListRec }

class function TItemInventarioListRec.Create(
  const AList: IItemConferenciaList): TItemInventarioListRec;
begin
  FillChar(Result, SizeOf(TItemInventarioListRec), 0);
  Result.FList := AList;
end;

class operator TItemInventarioListRec.Implicit(
  AListRec: TItemInventarioListRec): TItemConferenciaList;
begin
  Result := AListRec.FList.GetReference;
end;

end.

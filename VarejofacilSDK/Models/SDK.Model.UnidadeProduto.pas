unit SDK.Model.UnidadeProduto;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IUnidadeProduto = interface(IModel)
    ['{2383D2F2-D6B8-49C5-802C-7DA5C748D58D}']
    function GetId: TString;
    procedure SetId(const AId: TString);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetFatorMedida: Double;
    procedure SetFatorMedida(const AFatorMedida: Double);
    property Id: TString read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property FatorMedida: Double read GetFatorMedida write SetFatorMedida;
  end;

  TUnidadeProdutoList = class;

  IUnidadeProdutoList = interface
	['{37EBF36D-1D6A-488F-8AEC-768CD36ACAF2}']
    function GetReference: TUnidadeProdutoList;
    function GetItems(AIndex: Integer): IUnidadeProduto;
    procedure SetItems(AIndex: Integer; const Value: IUnidadeProduto);
    procedure Add(const AUnidadeProduto: IUnidadeProduto);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IUnidadeProduto read GetItems write SetItems; default;
  end;

  TUnidadeProdutoListEnumerator = class
  private
    FIndex: Integer;
    FUnidadeProdutoList: TUnidadeProdutoList;
  public
    constructor Create(AUnidadeProdutoList: TUnidadeProdutoList);
    function GetCurrent: IUnidadeProduto; inline;
    function MoveNext: Boolean;
    property Current: IUnidadeProduto read GetCurrent;
  end;

  TUnidadeProdutoList = class(TInterfacedObject, IUnidadeProdutoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IUnidadeProduto;
    procedure SetItems(AIndex: Integer; const Value: IUnidadeProduto);
  public
    constructor Create;
    procedure Add(const AUnidadeProduto: IUnidadeProduto);
    destructor Destroy; override;
    function GetEnumerator: TUnidadeProdutoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TUnidadeProdutoList;
    property Items[AIndex: Integer]: IUnidadeProduto read GetItems write SetItems; default;
  end;

  TUnidadeProdutoListRec = record
  private
    FList: IUnidadeProdutoList;
  public
    class function Create(const AList: IUnidadeProdutoList): TUnidadeProdutoListRec; static;
    class operator Implicit(AListRec: TUnidadeProdutoListRec): TUnidadeProdutoList;
  end;

  TUnidadeProduto = class(TInterfacedModel, IUnidadeProduto)
  private
	FId: TString;
	FDescricao: TString;
	FFatorMedida: Double;
    function GetId: TString;
    procedure SetId(const AId: TString);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetFatorMedida: Double;
    procedure SetFatorMedida(const AFatorMedida: Double);
  published
    property Id: TString read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property FatorMedida: Double read GetFatorMedida write SetFatorMedida;
  end;

implementation

{ TUnidadeProdutoList }

procedure TUnidadeProdutoList.Add(const AUnidadeProduto: IUnidadeProduto);
begin
  FList.Add(AUnidadeProduto);
end;

procedure TUnidadeProdutoList.Clear;
begin
  FList.Clear;
end;

function TUnidadeProdutoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TUnidadeProdutoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TUnidadeProdutoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TUnidadeProdutoList.GetEnumerator: TUnidadeProdutoListEnumerator;
begin
  Result := TUnidadeProdutoListEnumerator.Create(Self);
end;

function TUnidadeProdutoList.GetItems(AIndex: Integer): IUnidadeProduto;
begin
  Result := FList[AIndex] as IUnidadeProduto;
end;

function TUnidadeProdutoList.GetReference: TUnidadeProdutoList;
begin
  Result := Self;
end;

procedure TUnidadeProdutoList.SetItems(AIndex: Integer; const Value: IUnidadeProduto);
begin
  FList[AIndex] := Value;
end;

{ TUnidadeProdutoListEnumerator }

constructor TUnidadeProdutoListEnumerator.Create(AUnidadeProdutoList: TUnidadeProdutoList);
begin
  inherited Create;
  FIndex := -1;
  FUnidadeProdutoList := AUnidadeProdutoList;
end;

function TUnidadeProdutoListEnumerator.GetCurrent: IUnidadeProduto;
begin
  Result := FUnidadeProdutoList[FIndex];
end;

function TUnidadeProdutoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FUnidadeProdutoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TUnidadeProdutoListRec }

class function TUnidadeProdutoListRec.Create(const AList: IUnidadeProdutoList): TUnidadeProdutoListRec;
begin
  FillChar(Result, SizeOf(TUnidadeProdutoListRec), 0);
  Result.FList := AList;
end;

class operator TUnidadeProdutoListRec.Implicit(AListRec: TUnidadeProdutoListRec): TUnidadeProdutoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TUnidadeProduto }

function TUnidadeProduto.GetId: TString;
begin
  Result := FId;
end;

procedure TUnidadeProduto.SetId(const AId: TString);
begin
  FId := AId;
end;

function TUnidadeProduto.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TUnidadeProduto.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

function TUnidadeProduto.GetFatorMedida: Double;
begin
  Result := FFatorMedida;
end;

procedure TUnidadeProduto.SetFatorMedida(const AFatorMedida: Double);
begin
  FFatorMedida := AFatorMedida;
end;


end.
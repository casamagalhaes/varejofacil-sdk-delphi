unit SDK.Model.CategoriaFinanceira;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ICategoriaFinanceira = interface(IModel)
    ['{A931459B-2215-4DED-B9D1-939BEC4A6EDF}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetCodigoDaCategoriaPai: Int64;
    procedure SetCodigoDaCategoriaPai(const ACodigoDaCategoriaPai: Int64);
    function GetCodigoContabilExterno: Int64;
    procedure SetCodigoContabilExterno(const ACodigoContabilExterno: Int64);
    function GetInativa: Boolean;
    procedure SetInativa(const AInativa: Boolean);
    function GetPosicao: Integer;
    procedure SetPosicao(const APosicao: Integer);
    function GetClassificacaoDaCategoria: TClassificacaoCategoria;
    procedure SetClassificacaoDaCategoria(const AClassificacaoDaCategoria: TClassificacaoCategoria);
    function GetTipoDeCategoria: TTipoCategoria;
    procedure SetTipoDeCategoria(const ATipoDeCategoria: TTipoCategoria);
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property CodigoDaCategoriaPai: Int64 read GetCodigoDaCategoriaPai write SetCodigoDaCategoriaPai;
    property CodigoContabilExterno: Int64 read GetCodigoContabilExterno write SetCodigoContabilExterno;
    property Inativa: Boolean read GetInativa write SetInativa;
    property Posicao: Integer read GetPosicao write SetPosicao;
    property ClassificacaoDaCategoria: TClassificacaoCategoria read GetClassificacaoDaCategoria write SetClassificacaoDaCategoria;
    property TipoDeCategoria: TTipoCategoria read GetTipoDeCategoria write SetTipoDeCategoria;
  end;

  TCategoriaFinanceiraList = class;

  ICategoriaFinanceiraList = interface
	['{B9B458BB-B107-42A3-B443-A8153EF51F55}']
    function GetReference: TCategoriaFinanceiraList;
    function GetItems(AIndex: Integer): ICategoriaFinanceira;
    procedure SetItems(AIndex: Integer; const Value: ICategoriaFinanceira);
    procedure Add(const ACategoriaFinanceira: ICategoriaFinanceira);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ICategoriaFinanceira read GetItems write SetItems; default;
  end;

  TCategoriaFinanceiraListEnumerator = class
  private
    FIndex: Integer;
    FCategoriaFinanceiraList: TCategoriaFinanceiraList;
  public
    constructor Create(ACategoriaFinanceiraList: TCategoriaFinanceiraList);
    function GetCurrent: ICategoriaFinanceira; inline;
    function MoveNext: Boolean;
    property Current: ICategoriaFinanceira read GetCurrent;
  end;

  TCategoriaFinanceiraList = class(TInterfacedObject, ICategoriaFinanceiraList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ICategoriaFinanceira;
    procedure SetItems(AIndex: Integer; const Value: ICategoriaFinanceira);
  public
    constructor Create;
    procedure Add(const ACategoriaFinanceira: ICategoriaFinanceira);
    destructor Destroy; override;
    function GetEnumerator: TCategoriaFinanceiraListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TCategoriaFinanceiraList;
    property Items[AIndex: Integer]: ICategoriaFinanceira read GetItems write SetItems; default;
  end;

  TCategoriaFinanceiraListRec = record
  private
    FList: ICategoriaFinanceiraList;
  public
    class function Create(const AList: ICategoriaFinanceiraList): TCategoriaFinanceiraListRec; static;
    class operator Implicit(AListRec: TCategoriaFinanceiraListRec): TCategoriaFinanceiraList;
  end;

  TCategoriaFinanceira = class(TInterfacedModel, ICategoriaFinanceira)
  private
	FId: Int64;
	FDescricao: TString;
	FCodigoDaCategoriaPai: Int64;
	FCodigoContabilExterno: Int64;
	FInativa: Boolean;
	FPosicao: Integer;
	FClassificacaoDaCategoria: TClassificacaoCategoria;
	FTipoDeCategoria: TTipoCategoria;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetCodigoDaCategoriaPai: Int64;
    procedure SetCodigoDaCategoriaPai(const ACodigoDaCategoriaPai: Int64);
    function GetCodigoContabilExterno: Int64;
    procedure SetCodigoContabilExterno(const ACodigoContabilExterno: Int64);
    function GetInativa: Boolean;
    procedure SetInativa(const AInativa: Boolean);
    function GetPosicao: Integer;
    procedure SetPosicao(const APosicao: Integer);
    function GetClassificacaoDaCategoria: TClassificacaoCategoria;
    procedure SetClassificacaoDaCategoria(const AClassificacaoDaCategoria: TClassificacaoCategoria);
    function GetTipoDeCategoria: TTipoCategoria;
    procedure SetTipoDeCategoria(const ATipoDeCategoria: TTipoCategoria);
  public
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property CodigoDaCategoriaPai: Int64 read GetCodigoDaCategoriaPai write SetCodigoDaCategoriaPai;
    property CodigoContabilExterno: Int64 read GetCodigoContabilExterno write SetCodigoContabilExterno;
    property Inativa: Boolean read GetInativa write SetInativa;
    property Posicao: Integer read GetPosicao write SetPosicao;
    property ClassificacaoDaCategoria: TClassificacaoCategoria read GetClassificacaoDaCategoria write SetClassificacaoDaCategoria;
    property TipoDeCategoria: TTipoCategoria read GetTipoDeCategoria write SetTipoDeCategoria;
  end;

implementation

{ TCategoriaFinanceiraList }

procedure TCategoriaFinanceiraList.Add(const ACategoriaFinanceira: ICategoriaFinanceira);
begin
  FList.Add(ACategoriaFinanceira);
end;

procedure TCategoriaFinanceiraList.Clear;
begin
  FList.Clear;
end;

function TCategoriaFinanceiraList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TCategoriaFinanceiraList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TCategoriaFinanceiraList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TCategoriaFinanceiraList.GetEnumerator: TCategoriaFinanceiraListEnumerator;
begin
  Result := TCategoriaFinanceiraListEnumerator.Create(Self);
end;

function TCategoriaFinanceiraList.GetItems(AIndex: Integer): ICategoriaFinanceira;
begin
  Result := FList[AIndex] as ICategoriaFinanceira;
end;

function TCategoriaFinanceiraList.GetReference: TCategoriaFinanceiraList;
begin
  Result := Self;
end;

procedure TCategoriaFinanceiraList.SetItems(AIndex: Integer; const Value: ICategoriaFinanceira);
begin
  FList[AIndex] := Value;
end;

{ TCategoriaFinanceiraListEnumerator }

constructor TCategoriaFinanceiraListEnumerator.Create(ACategoriaFinanceiraList: TCategoriaFinanceiraList);
begin
  inherited Create;
  FIndex := -1;
  FCategoriaFinanceiraList := ACategoriaFinanceiraList;
end;

function TCategoriaFinanceiraListEnumerator.GetCurrent: ICategoriaFinanceira;
begin
  Result := FCategoriaFinanceiraList[FIndex];
end;

function TCategoriaFinanceiraListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FCategoriaFinanceiraList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TCategoriaFinanceiraListRec }

class function TCategoriaFinanceiraListRec.Create(const AList: ICategoriaFinanceiraList): TCategoriaFinanceiraListRec;
begin
  FillChar(Result, SizeOf(TCategoriaFinanceiraListRec), 0);
  Result.FList := AList;
end;

class operator TCategoriaFinanceiraListRec.Implicit(AListRec: TCategoriaFinanceiraListRec): TCategoriaFinanceiraList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TCategoriaFinanceira }

function TCategoriaFinanceira.GetId: Int64;
begin
  Result := FId;
end;

procedure TCategoriaFinanceira.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TCategoriaFinanceira.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TCategoriaFinanceira.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

function TCategoriaFinanceira.GetCodigoDaCategoriaPai: Int64;
begin
  Result := FCodigoDaCategoriaPai;
end;

procedure TCategoriaFinanceira.SetCodigoDaCategoriaPai(const ACodigoDaCategoriaPai: Int64);
begin
  FCodigoDaCategoriaPai := ACodigoDaCategoriaPai;
end;

function TCategoriaFinanceira.GetCodigoContabilExterno: Int64;
begin
  Result := FCodigoContabilExterno;
end;

procedure TCategoriaFinanceira.SetCodigoContabilExterno(const ACodigoContabilExterno: Int64);
begin
  FCodigoContabilExterno := ACodigoContabilExterno;
end;

function TCategoriaFinanceira.GetInativa: Boolean;
begin
  Result := FInativa;
end;

procedure TCategoriaFinanceira.SetInativa(const AInativa: Boolean);
begin
  FInativa := AInativa;
end;

function TCategoriaFinanceira.GetPosicao: Integer;
begin
  Result := FPosicao;
end;

procedure TCategoriaFinanceira.SetPosicao(const APosicao: Integer);
begin
  FPosicao := APosicao;
end;

function TCategoriaFinanceira.GetClassificacaoDaCategoria: TClassificacaoCategoria;
begin
  Result := FClassificacaoDaCategoria;
end;

procedure TCategoriaFinanceira.SetClassificacaoDaCategoria(const AClassificacaoDaCategoria: TClassificacaoCategoria);
begin
  FClassificacaoDaCategoria := AClassificacaoDaCategoria;
end;

function TCategoriaFinanceira.GetTipoDeCategoria: TTipoCategoria;
begin
  Result := FTipoDeCategoria;
end;

procedure TCategoriaFinanceira.SetTipoDeCategoria(const ATipoDeCategoria: TTipoCategoria);
begin
  FTipoDeCategoria := ATipoDeCategoria;
end;


end.
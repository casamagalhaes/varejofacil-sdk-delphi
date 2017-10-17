unit SDK.Model.ProdutoDaPremiacao;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IProdutoDaPremiacao = interface(IModel)
    ['{0B2E8470-947F-4159-9B57-6EE9C7F71436}']
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetProdutoId: Int64;
    procedure SetProdutoId(const AProdutoId: Int64);
    function GetQuantidadeDePontos: Double;
    procedure SetQuantidadeDePontos(const AQuantidadeDePontos: Double);
    property Id: Integer read GetId write SetId;
    property ProdutoId: Int64 read GetProdutoId write SetProdutoId;
    property QuantidadeDePontos: Double read GetQuantidadeDePontos write SetQuantidadeDePontos;
  end;

  TProdutoDaPremiacaoList = class;

  IProdutoDaPremiacaoList = interface
	['{76F7797F-3D73-44B6-8AF1-2767647EE8F8}']
    function GetReference: TProdutoDaPremiacaoList;
    function GetItems(AIndex: Integer): IProdutoDaPremiacao;
    procedure SetItems(AIndex: Integer; const Value: IProdutoDaPremiacao);
    procedure Add(const AProdutoDaPremiacao: IProdutoDaPremiacao);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IProdutoDaPremiacao read GetItems write SetItems; default;
  end;

  TProdutoDaPremiacaoListEnumerator = class
  private
    FIndex: Integer;
    FProdutoDaPremiacaoList: TProdutoDaPremiacaoList;
  public
    constructor Create(AProdutoDaPremiacaoList: TProdutoDaPremiacaoList);
    function GetCurrent: IProdutoDaPremiacao; inline;
    function MoveNext: Boolean;
    property Current: IProdutoDaPremiacao read GetCurrent;
  end;

  TProdutoDaPremiacaoList = class(TInterfacedObject, IProdutoDaPremiacaoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IProdutoDaPremiacao;
    procedure SetItems(AIndex: Integer; const Value: IProdutoDaPremiacao);
  public
    constructor Create;
    procedure Add(const AProdutoDaPremiacao: IProdutoDaPremiacao);
    destructor Destroy; override;
    function GetEnumerator: TProdutoDaPremiacaoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TProdutoDaPremiacaoList;
    property Items[AIndex: Integer]: IProdutoDaPremiacao read GetItems write SetItems; default;
  end;

  TProdutoDaPremiacaoListRec = record
  private
    FList: IProdutoDaPremiacaoList;
  public
    class function Create(const AList: IProdutoDaPremiacaoList): TProdutoDaPremiacaoListRec; static;
    class operator Implicit(AListRec: TProdutoDaPremiacaoListRec): TProdutoDaPremiacaoList;
  end;

  TProdutoDaPremiacao = class(TInterfacedModel, IProdutoDaPremiacao)
  private
	FId: Integer;
	FProdutoId: Int64;
	FQuantidadeDePontos: Double;
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetProdutoId: Int64;
    procedure SetProdutoId(const AProdutoId: Int64);
    function GetQuantidadeDePontos: Double;
    procedure SetQuantidadeDePontos(const AQuantidadeDePontos: Double);
  published
    property Id: Integer read GetId write SetId;
    property ProdutoId: Int64 read GetProdutoId write SetProdutoId;
    property QuantidadeDePontos: Double read GetQuantidadeDePontos write SetQuantidadeDePontos;
  end;

implementation

{ TProdutoDaPremiacaoList }

procedure TProdutoDaPremiacaoList.Add(const AProdutoDaPremiacao: IProdutoDaPremiacao);
begin
  FList.Add(AProdutoDaPremiacao);
end;

procedure TProdutoDaPremiacaoList.Clear;
begin
  FList.Clear;
end;

function TProdutoDaPremiacaoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TProdutoDaPremiacaoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TProdutoDaPremiacaoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TProdutoDaPremiacaoList.GetEnumerator: TProdutoDaPremiacaoListEnumerator;
begin
  Result := TProdutoDaPremiacaoListEnumerator.Create(Self);
end;

function TProdutoDaPremiacaoList.GetItems(AIndex: Integer): IProdutoDaPremiacao;
begin
  Result := FList[AIndex] as IProdutoDaPremiacao;
end;

function TProdutoDaPremiacaoList.GetReference: TProdutoDaPremiacaoList;
begin
  Result := Self;
end;

procedure TProdutoDaPremiacaoList.SetItems(AIndex: Integer; const Value: IProdutoDaPremiacao);
begin
  FList[AIndex] := Value;
end;

{ TProdutoDaPremiacaoListEnumerator }

constructor TProdutoDaPremiacaoListEnumerator.Create(AProdutoDaPremiacaoList: TProdutoDaPremiacaoList);
begin
  inherited Create;
  FIndex := -1;
  FProdutoDaPremiacaoList := AProdutoDaPremiacaoList;
end;

function TProdutoDaPremiacaoListEnumerator.GetCurrent: IProdutoDaPremiacao;
begin
  Result := FProdutoDaPremiacaoList[FIndex];
end;

function TProdutoDaPremiacaoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FProdutoDaPremiacaoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TProdutoDaPremiacaoListRec }

class function TProdutoDaPremiacaoListRec.Create(const AList: IProdutoDaPremiacaoList): TProdutoDaPremiacaoListRec;
begin
  FillChar(Result, SizeOf(TProdutoDaPremiacaoListRec), 0);
  Result.FList := AList;
end;

class operator TProdutoDaPremiacaoListRec.Implicit(AListRec: TProdutoDaPremiacaoListRec): TProdutoDaPremiacaoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TProdutoDaPremiacao }

function TProdutoDaPremiacao.GetId: Integer;
begin
  Result := FId;
end;

procedure TProdutoDaPremiacao.SetId(const AId: Integer);
begin
  FId := AId;
end;

function TProdutoDaPremiacao.GetProdutoId: Int64;
begin
  Result := FProdutoId;
end;

procedure TProdutoDaPremiacao.SetProdutoId(const AProdutoId: Int64);
begin
  FProdutoId := AProdutoId;
end;

function TProdutoDaPremiacao.GetQuantidadeDePontos: Double;
begin
  Result := FQuantidadeDePontos;
end;

procedure TProdutoDaPremiacao.SetQuantidadeDePontos(const AQuantidadeDePontos: Double);
begin
  FQuantidadeDePontos := AQuantidadeDePontos;
end;


end.
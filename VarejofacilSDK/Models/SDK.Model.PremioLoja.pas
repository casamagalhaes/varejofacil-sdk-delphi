unit SDK.Model.PremioLoja;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IPremioLoja = interface(IModel)
    ['{78A6DC58-B975-4375-A8CA-1FFC1EE1CF13}']
    function GetId: TString;
    procedure SetId(const AId: TString);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetProdutoId: Int64;
    procedure SetProdutoId(const AProdutoId: Int64);
    function GetDataDeCadastro: TDateTime;
    procedure SetDataDeCadastro(const ADataDeCadastro: TDateTime);
    function GetPontosRequeridos: Integer;
    procedure SetPontosRequeridos(const APontosRequeridos: Integer);
    function GetQuantidadeEmEstoque: Integer;
    procedure SetQuantidadeEmEstoque(const AQuantidadeEmEstoque: Integer);
    function GetIdNetpoints: Integer;
    procedure SetIdNetpoints(const AIdNetpoints: Integer);
    property Id: TString read GetId write SetId;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property ProdutoId: Int64 read GetProdutoId write SetProdutoId;
    property DataDeCadastro: TDateTime read GetDataDeCadastro write SetDataDeCadastro;
    property PontosRequeridos: Integer read GetPontosRequeridos write SetPontosRequeridos;
    property QuantidadeEmEstoque: Integer read GetQuantidadeEmEstoque write SetQuantidadeEmEstoque;
    property IdNetpoints: Integer read GetIdNetpoints write SetIdNetpoints;
  end;

  TPremioLojaList = class;

  IPremioLojaList = interface
	['{366F4486-9B84-48AC-82A6-29467A4176F1}']
    function GetReference: TPremioLojaList;
    function GetItems(AIndex: Integer): IPremioLoja;
    procedure SetItems(AIndex: Integer; const Value: IPremioLoja);
    procedure Add(const APremioLoja: IPremioLoja);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IPremioLoja read GetItems write SetItems; default;
  end;

  TPremioLojaListEnumerator = class
  private
    FIndex: Integer;
    FPremioLojaList: TPremioLojaList;
  public
    constructor Create(APremioLojaList: TPremioLojaList);
    function GetCurrent: IPremioLoja; inline;
    function MoveNext: Boolean;
    property Current: IPremioLoja read GetCurrent;
  end;

  TPremioLojaList = class(TInterfacedObject, IPremioLojaList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IPremioLoja;
    procedure SetItems(AIndex: Integer; const Value: IPremioLoja);
  public
    constructor Create;
    procedure Add(const APremioLoja: IPremioLoja);
    destructor Destroy; override;
    function GetEnumerator: TPremioLojaListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TPremioLojaList;
    property Items[AIndex: Integer]: IPremioLoja read GetItems write SetItems; default;
  end;

  TPremioLojaListRec = record
  private
    FList: IPremioLojaList;
  public
    class function Create(const AList: IPremioLojaList): TPremioLojaListRec; static;
    class operator Implicit(AListRec: TPremioLojaListRec): TPremioLojaList;
  end;

  TPremioLoja = class(TInterfacedModel, IPremioLoja)
  private
	FId: TString;
	FLojaId: Int64;
	FProdutoId: Int64;
	FDataDeCadastro: TDateTime;
	FPontosRequeridos: Integer;
	FQuantidadeEmEstoque: Integer;
	FIdNetpoints: Integer;
    function GetId: TString;
    procedure SetId(const AId: TString);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetProdutoId: Int64;
    procedure SetProdutoId(const AProdutoId: Int64);
    function GetDataDeCadastro: TDateTime;
    procedure SetDataDeCadastro(const ADataDeCadastro: TDateTime);
    function GetPontosRequeridos: Integer;
    procedure SetPontosRequeridos(const APontosRequeridos: Integer);
    function GetQuantidadeEmEstoque: Integer;
    procedure SetQuantidadeEmEstoque(const AQuantidadeEmEstoque: Integer);
    function GetIdNetpoints: Integer;
    procedure SetIdNetpoints(const AIdNetpoints: Integer);
  published
    property Id: TString read GetId write SetId;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property ProdutoId: Int64 read GetProdutoId write SetProdutoId;
    property DataDeCadastro: TDateTime read GetDataDeCadastro write SetDataDeCadastro;
    property PontosRequeridos: Integer read GetPontosRequeridos write SetPontosRequeridos;
    property QuantidadeEmEstoque: Integer read GetQuantidadeEmEstoque write SetQuantidadeEmEstoque;
    property IdNetpoints: Integer read GetIdNetpoints write SetIdNetpoints;
  end;

implementation

{ TPremioLojaList }

procedure TPremioLojaList.Add(const APremioLoja: IPremioLoja);
begin
  FList.Add(APremioLoja);
end;

procedure TPremioLojaList.Clear;
begin
  FList.Clear;
end;

function TPremioLojaList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TPremioLojaList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TPremioLojaList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TPremioLojaList.GetEnumerator: TPremioLojaListEnumerator;
begin
  Result := TPremioLojaListEnumerator.Create(Self);
end;

function TPremioLojaList.GetItems(AIndex: Integer): IPremioLoja;
begin
  Result := FList[AIndex] as IPremioLoja;
end;

function TPremioLojaList.GetReference: TPremioLojaList;
begin
  Result := Self;
end;

procedure TPremioLojaList.SetItems(AIndex: Integer; const Value: IPremioLoja);
begin
  FList[AIndex] := Value;
end;

{ TPremioLojaListEnumerator }

constructor TPremioLojaListEnumerator.Create(APremioLojaList: TPremioLojaList);
begin
  inherited Create;
  FIndex := -1;
  FPremioLojaList := APremioLojaList;
end;

function TPremioLojaListEnumerator.GetCurrent: IPremioLoja;
begin
  Result := FPremioLojaList[FIndex];
end;

function TPremioLojaListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FPremioLojaList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TPremioLojaListRec }

class function TPremioLojaListRec.Create(const AList: IPremioLojaList): TPremioLojaListRec;
begin
  FillChar(Result, SizeOf(TPremioLojaListRec), 0);
  Result.FList := AList;
end;

class operator TPremioLojaListRec.Implicit(AListRec: TPremioLojaListRec): TPremioLojaList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TPremioLoja }

function TPremioLoja.GetId: TString;
begin
  Result := FId;
end;

procedure TPremioLoja.SetId(const AId: TString);
begin
  FId := AId;
end;

function TPremioLoja.GetLojaId: Int64;
begin
  Result := FLojaId;
end;

procedure TPremioLoja.SetLojaId(const ALojaId: Int64);
begin
  FLojaId := ALojaId;
end;

function TPremioLoja.GetProdutoId: Int64;
begin
  Result := FProdutoId;
end;

procedure TPremioLoja.SetProdutoId(const AProdutoId: Int64);
begin
  FProdutoId := AProdutoId;
end;

function TPremioLoja.GetDataDeCadastro: TDateTime;
begin
  Result := FDataDeCadastro;
end;

procedure TPremioLoja.SetDataDeCadastro(const ADataDeCadastro: TDateTime);
begin
  FDataDeCadastro := ADataDeCadastro;
end;

function TPremioLoja.GetPontosRequeridos: Integer;
begin
  Result := FPontosRequeridos;
end;

procedure TPremioLoja.SetPontosRequeridos(const APontosRequeridos: Integer);
begin
  FPontosRequeridos := APontosRequeridos;
end;

function TPremioLoja.GetQuantidadeEmEstoque: Integer;
begin
  Result := FQuantidadeEmEstoque;
end;

procedure TPremioLoja.SetQuantidadeEmEstoque(const AQuantidadeEmEstoque: Integer);
begin
  FQuantidadeEmEstoque := AQuantidadeEmEstoque;
end;

function TPremioLoja.GetIdNetpoints: Integer;
begin
  Result := FIdNetpoints;
end;

procedure TPremioLoja.SetIdNetpoints(const AIdNetpoints: Integer);
begin
  FIdNetpoints := AIdNetpoints;
end;


end.
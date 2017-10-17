unit SDK.Model.PautaDoProduto;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IPautaDoProduto = interface(IModel)
    ['{42AE68C9-AC9F-46F1-92D3-5FCE7C0700BA}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetUf: TString;
    procedure SetUf(const AUf: TString);
    function GetTipoDePauta: TTipoPauta;
    procedure SetTipoDePauta(const ATipoDePauta: TTipoPauta);
    function GetValorDePauta: Double;
    procedure SetValorDePauta(const AValorDePauta: Double);
    property Id: Int64 read GetId write SetId;
    property Uf: TString read GetUf write SetUf;
    property TipoDePauta: TTipoPauta read GetTipoDePauta write SetTipoDePauta;
    property ValorDePauta: Double read GetValorDePauta write SetValorDePauta;
  end;

  TPautaDoProdutoList = class;

  IPautaDoProdutoList = interface
	['{77B75B55-D0D4-48F5-A301-877FDE77016C}']
    function GetReference: TPautaDoProdutoList;
    function GetItems(AIndex: Integer): IPautaDoProduto;
    procedure SetItems(AIndex: Integer; const Value: IPautaDoProduto);
    procedure Add(const APautaDoProduto: IPautaDoProduto);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IPautaDoProduto read GetItems write SetItems; default;
  end;

  TPautaDoProdutoListEnumerator = class
  private
    FIndex: Integer;
    FPautaDoProdutoList: TPautaDoProdutoList;
  public
    constructor Create(APautaDoProdutoList: TPautaDoProdutoList);
    function GetCurrent: IPautaDoProduto; inline;
    function MoveNext: Boolean;
    property Current: IPautaDoProduto read GetCurrent;
  end;

  TPautaDoProdutoList = class(TInterfacedObject, IPautaDoProdutoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IPautaDoProduto;
    procedure SetItems(AIndex: Integer; const Value: IPautaDoProduto);
  public
    constructor Create;
    procedure Add(const APautaDoProduto: IPautaDoProduto);
    destructor Destroy; override;
    function GetEnumerator: TPautaDoProdutoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TPautaDoProdutoList;
    property Items[AIndex: Integer]: IPautaDoProduto read GetItems write SetItems; default;
  end;

  TPautaDoProdutoListRec = record
  private
    FList: IPautaDoProdutoList;
  public
    class function Create(const AList: IPautaDoProdutoList): TPautaDoProdutoListRec; static;
    class operator Implicit(AListRec: TPautaDoProdutoListRec): TPautaDoProdutoList;
  end;

  TPautaDoProduto = class(TInterfacedModel, IPautaDoProduto)
  private
	FId: Int64;
	FUf: TString;
	FTipoDePauta: TTipoPauta;
	FValorDePauta: Double;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetUf: TString;
    procedure SetUf(const AUf: TString);
    function GetTipoDePauta: TTipoPauta;
    procedure SetTipoDePauta(const ATipoDePauta: TTipoPauta);
    function GetValorDePauta: Double;
    procedure SetValorDePauta(const AValorDePauta: Double);
  published
    property Id: Int64 read GetId write SetId;
    property Uf: TString read GetUf write SetUf;
    property TipoDePauta: TTipoPauta read GetTipoDePauta write SetTipoDePauta;
    property ValorDePauta: Double read GetValorDePauta write SetValorDePauta;
  end;

implementation

{ TPautaDoProdutoList }

procedure TPautaDoProdutoList.Add(const APautaDoProduto: IPautaDoProduto);
begin
  FList.Add(APautaDoProduto);
end;

procedure TPautaDoProdutoList.Clear;
begin
  FList.Clear;
end;

function TPautaDoProdutoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TPautaDoProdutoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TPautaDoProdutoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TPautaDoProdutoList.GetEnumerator: TPautaDoProdutoListEnumerator;
begin
  Result := TPautaDoProdutoListEnumerator.Create(Self);
end;

function TPautaDoProdutoList.GetItems(AIndex: Integer): IPautaDoProduto;
begin
  Result := FList[AIndex] as IPautaDoProduto;
end;

function TPautaDoProdutoList.GetReference: TPautaDoProdutoList;
begin
  Result := Self;
end;

procedure TPautaDoProdutoList.SetItems(AIndex: Integer; const Value: IPautaDoProduto);
begin
  FList[AIndex] := Value;
end;

{ TPautaDoProdutoListEnumerator }

constructor TPautaDoProdutoListEnumerator.Create(APautaDoProdutoList: TPautaDoProdutoList);
begin
  inherited Create;
  FIndex := -1;
  FPautaDoProdutoList := APautaDoProdutoList;
end;

function TPautaDoProdutoListEnumerator.GetCurrent: IPautaDoProduto;
begin
  Result := FPautaDoProdutoList[FIndex];
end;

function TPautaDoProdutoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FPautaDoProdutoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TPautaDoProdutoListRec }

class function TPautaDoProdutoListRec.Create(const AList: IPautaDoProdutoList): TPautaDoProdutoListRec;
begin
  FillChar(Result, SizeOf(TPautaDoProdutoListRec), 0);
  Result.FList := AList;
end;

class operator TPautaDoProdutoListRec.Implicit(AListRec: TPautaDoProdutoListRec): TPautaDoProdutoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TPautaDoProduto }

function TPautaDoProduto.GetId: Int64;
begin
  Result := FId;
end;

procedure TPautaDoProduto.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TPautaDoProduto.GetUf: TString;
begin
  Result := FUf;
end;

procedure TPautaDoProduto.SetUf(const AUf: TString);
begin
  FUf := AUf;
end;

function TPautaDoProduto.GetTipoDePauta: TTipoPauta;
begin
  Result := FTipoDePauta;
end;

procedure TPautaDoProduto.SetTipoDePauta(const ATipoDePauta: TTipoPauta);
begin
  FTipoDePauta := ATipoDePauta;
end;

function TPautaDoProduto.GetValorDePauta: Double;
begin
  Result := FValorDePauta;
end;

procedure TPautaDoProduto.SetValorDePauta(const AValorDePauta: Double);
begin
  FValorDePauta := AValorDePauta;
end;


end.
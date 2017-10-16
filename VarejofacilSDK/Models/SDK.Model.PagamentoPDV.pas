unit SDK.Model.PagamentoPDV;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IPagamentoPDV = interface(IModel)
    ['{5965F225-D4B5-4E07-A911-967FED7ABB1A}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetCategoriaId: Int64;
    procedure SetCategoriaId(const ACategoriaId: Int64);
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property CategoriaId: Int64 read GetCategoriaId write SetCategoriaId;
  end;

  TPagamentoPDVList = class;

  IPagamentoPDVList = interface
	['{7371E064-3B1C-4858-9E0B-D8F2147CC00F}']
    function GetReference: TPagamentoPDVList;
    function GetItems(AIndex: Integer): IPagamentoPDV;
    procedure SetItems(AIndex: Integer; const Value: IPagamentoPDV);
    procedure Add(const APagamentoPDV: IPagamentoPDV);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IPagamentoPDV read GetItems write SetItems; default;
  end;

  TPagamentoPDVListEnumerator = class
  private
    FIndex: Integer;
    FPagamentoPDVList: TPagamentoPDVList;
  public
    constructor Create(APagamentoPDVList: TPagamentoPDVList);
    function GetCurrent: IPagamentoPDV; inline;
    function MoveNext: Boolean;
    property Current: IPagamentoPDV read GetCurrent;
  end;

  TPagamentoPDVList = class(TInterfacedObject, IPagamentoPDVList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IPagamentoPDV;
    procedure SetItems(AIndex: Integer; const Value: IPagamentoPDV);
  public
    constructor Create;
    procedure Add(const APagamentoPDV: IPagamentoPDV);
    destructor Destroy; override;
    function GetEnumerator: TPagamentoPDVListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TPagamentoPDVList;
    property Items[AIndex: Integer]: IPagamentoPDV read GetItems write SetItems; default;
  end;

  TPagamentoPDVListRec = record
  private
    FList: IPagamentoPDVList;
  public
    class function Create(const AList: IPagamentoPDVList): TPagamentoPDVListRec; static;
    class operator Implicit(AListRec: TPagamentoPDVListRec): TPagamentoPDVList;
  end;

  TPagamentoPDV = class(TInterfacedModel, IPagamentoPDV)
  private
	FId: Int64;
	FDescricao: TString;
	FCategoriaId: Int64;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetCategoriaId: Int64;
    procedure SetCategoriaId(const ACategoriaId: Int64);
  public
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property CategoriaId: Int64 read GetCategoriaId write SetCategoriaId;
  end;

implementation

{ TPagamentoPDVList }

procedure TPagamentoPDVList.Add(const APagamentoPDV: IPagamentoPDV);
begin
  FList.Add(APagamentoPDV);
end;

procedure TPagamentoPDVList.Clear;
begin
  FList.Clear;
end;

function TPagamentoPDVList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TPagamentoPDVList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TPagamentoPDVList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TPagamentoPDVList.GetEnumerator: TPagamentoPDVListEnumerator;
begin
  Result := TPagamentoPDVListEnumerator.Create(Self);
end;

function TPagamentoPDVList.GetItems(AIndex: Integer): IPagamentoPDV;
begin
  Result := FList[AIndex] as IPagamentoPDV;
end;

function TPagamentoPDVList.GetReference: TPagamentoPDVList;
begin
  Result := Self;
end;

procedure TPagamentoPDVList.SetItems(AIndex: Integer; const Value: IPagamentoPDV);
begin
  FList[AIndex] := Value;
end;

{ TPagamentoPDVListEnumerator }

constructor TPagamentoPDVListEnumerator.Create(APagamentoPDVList: TPagamentoPDVList);
begin
  inherited Create;
  FIndex := -1;
  FPagamentoPDVList := APagamentoPDVList;
end;

function TPagamentoPDVListEnumerator.GetCurrent: IPagamentoPDV;
begin
  Result := FPagamentoPDVList[FIndex];
end;

function TPagamentoPDVListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FPagamentoPDVList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TPagamentoPDVListRec }

class function TPagamentoPDVListRec.Create(const AList: IPagamentoPDVList): TPagamentoPDVListRec;
begin
  FillChar(Result, SizeOf(TPagamentoPDVListRec), 0);
  Result.FList := AList;
end;

class operator TPagamentoPDVListRec.Implicit(AListRec: TPagamentoPDVListRec): TPagamentoPDVList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TPagamentoPDV }

function TPagamentoPDV.GetId: Int64;
begin
  Result := FId;
end;

procedure TPagamentoPDV.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TPagamentoPDV.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TPagamentoPDV.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

function TPagamentoPDV.GetCategoriaId: Int64;
begin
  Result := FCategoriaId;
end;

procedure TPagamentoPDV.SetCategoriaId(const ACategoriaId: Int64);
begin
  FCategoriaId := ACategoriaId;
end;


end.
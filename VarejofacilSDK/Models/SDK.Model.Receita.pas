unit SDK.Model.Receita;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IReceita = interface(IModel)
    ['{0F780D98-73D8-4E74-99DB-EB74F5081ACE}']
    function GetProdutoId: Int64;
    procedure SetProdutoId(const AProdutoId: Int64);
    function GetTextoReceita: TString;
    procedure SetTextoReceita(const ATextoReceita: TString);
    property ProdutoId: Int64 read GetProdutoId write SetProdutoId;
    property TextoReceita: TString read GetTextoReceita write SetTextoReceita;
  end;

  TReceitaList = class;

  IReceitaList = interface
	['{1C042104-98D1-4089-A66D-13BC2DED0A30}']
    function GetReference: TReceitaList;
    function GetItems(AIndex: Integer): IReceita;
    procedure SetItems(AIndex: Integer; const Value: IReceita);
    procedure Add(const AReceita: IReceita);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IReceita read GetItems write SetItems; default;
  end;

  TReceitaListEnumerator = class
  private
    FIndex: Integer;
    FReceitaList: TReceitaList;
  public
    constructor Create(AReceitaList: TReceitaList);
    function GetCurrent: IReceita; inline;
    function MoveNext: Boolean;
    property Current: IReceita read GetCurrent;
  end;

  TReceitaList = class(TInterfacedObject, IReceitaList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IReceita;
    procedure SetItems(AIndex: Integer; const Value: IReceita);
  public
    constructor Create;
    procedure Add(const AReceita: IReceita);
    destructor Destroy; override;
    function GetEnumerator: TReceitaListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TReceitaList;
    property Items[AIndex: Integer]: IReceita read GetItems write SetItems; default;
  end;

  TReceitaListRec = record
  private
    FList: IReceitaList;
  public
    class function Create(const AList: IReceitaList): TReceitaListRec; static;
    class operator Implicit(AListRec: TReceitaListRec): TReceitaList;
  end;

  TReceita = class(TInterfacedModel, IReceita)
  private
	FProdutoId: Int64;
	FTextoReceita: TString;
    function GetProdutoId: Int64;
    procedure SetProdutoId(const AProdutoId: Int64);
    function GetTextoReceita: TString;
    procedure SetTextoReceita(const ATextoReceita: TString);
  public
    property ProdutoId: Int64 read GetProdutoId write SetProdutoId;
    property TextoReceita: TString read GetTextoReceita write SetTextoReceita;
  end;

implementation

{ TReceitaList }

procedure TReceitaList.Add(const AReceita: IReceita);
begin
  FList.Add(AReceita);
end;

procedure TReceitaList.Clear;
begin
  FList.Clear;
end;

function TReceitaList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TReceitaList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TReceitaList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TReceitaList.GetEnumerator: TReceitaListEnumerator;
begin
  Result := TReceitaListEnumerator.Create(Self);
end;

function TReceitaList.GetItems(AIndex: Integer): IReceita;
begin
  Result := FList[AIndex] as IReceita;
end;

function TReceitaList.GetReference: TReceitaList;
begin
  Result := Self;
end;

procedure TReceitaList.SetItems(AIndex: Integer; const Value: IReceita);
begin
  FList[AIndex] := Value;
end;

{ TReceitaListEnumerator }

constructor TReceitaListEnumerator.Create(AReceitaList: TReceitaList);
begin
  inherited Create;
  FIndex := -1;
  FReceitaList := AReceitaList;
end;

function TReceitaListEnumerator.GetCurrent: IReceita;
begin
  Result := FReceitaList[FIndex];
end;

function TReceitaListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FReceitaList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TReceitaListRec }

class function TReceitaListRec.Create(const AList: IReceitaList): TReceitaListRec;
begin
  FillChar(Result, SizeOf(TReceitaListRec), 0);
  Result.FList := AList;
end;

class operator TReceitaListRec.Implicit(AListRec: TReceitaListRec): TReceitaList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TReceita }

function TReceita.GetProdutoId: Int64;
begin
  Result := FProdutoId;
end;

procedure TReceita.SetProdutoId(const AProdutoId: Int64);
begin
  FProdutoId := AProdutoId;
end;

function TReceita.GetTextoReceita: TString;
begin
  Result := FTextoReceita;
end;

procedure TReceita.SetTextoReceita(const ATextoReceita: TString);
begin
  FTextoReceita := ATextoReceita;
end;


end.
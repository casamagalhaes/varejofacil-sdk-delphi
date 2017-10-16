unit SDK.Model.Genero;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IGenero = interface(IModel)
    ['{7CD166C7-95DE-4532-BCCB-4AEB3F33BDEE}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetDescricaoCompleta: TString;
    procedure SetDescricaoCompleta(const ADescricaoCompleta: TString);
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property DescricaoCompleta: TString read GetDescricaoCompleta write SetDescricaoCompleta;
  end;

  TGeneroList = class;

  IGeneroList = interface
	['{065170F0-429C-4588-95A4-5764680B84FA}']
    function GetReference: TGeneroList;
    function GetItems(AIndex: Integer): IGenero;
    procedure SetItems(AIndex: Integer; const Value: IGenero);
    procedure Add(const AGenero: IGenero);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IGenero read GetItems write SetItems; default;
  end;

  TGeneroListEnumerator = class
  private
    FIndex: Integer;
    FGeneroList: TGeneroList;
  public
    constructor Create(AGeneroList: TGeneroList);
    function GetCurrent: IGenero; inline;
    function MoveNext: Boolean;
    property Current: IGenero read GetCurrent;
  end;

  TGeneroList = class(TInterfacedObject, IGeneroList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IGenero;
    procedure SetItems(AIndex: Integer; const Value: IGenero);
  public
    constructor Create;
    procedure Add(const AGenero: IGenero);
    destructor Destroy; override;
    function GetEnumerator: TGeneroListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TGeneroList;
    property Items[AIndex: Integer]: IGenero read GetItems write SetItems; default;
  end;

  TGeneroListRec = record
  private
    FList: IGeneroList;
  public
    class function Create(const AList: IGeneroList): TGeneroListRec; static;
    class operator Implicit(AListRec: TGeneroListRec): TGeneroList;
  end;

  TGenero = class(TInterfacedModel, IGenero)
  private
	FId: Int64;
	FDescricao: TString;
	FDescricaoCompleta: TString;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetDescricaoCompleta: TString;
    procedure SetDescricaoCompleta(const ADescricaoCompleta: TString);
  public
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property DescricaoCompleta: TString read GetDescricaoCompleta write SetDescricaoCompleta;
  end;

implementation

{ TGeneroList }

procedure TGeneroList.Add(const AGenero: IGenero);
begin
  FList.Add(AGenero);
end;

procedure TGeneroList.Clear;
begin
  FList.Clear;
end;

function TGeneroList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TGeneroList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TGeneroList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TGeneroList.GetEnumerator: TGeneroListEnumerator;
begin
  Result := TGeneroListEnumerator.Create(Self);
end;

function TGeneroList.GetItems(AIndex: Integer): IGenero;
begin
  Result := FList[AIndex] as IGenero;
end;

function TGeneroList.GetReference: TGeneroList;
begin
  Result := Self;
end;

procedure TGeneroList.SetItems(AIndex: Integer; const Value: IGenero);
begin
  FList[AIndex] := Value;
end;

{ TGeneroListEnumerator }

constructor TGeneroListEnumerator.Create(AGeneroList: TGeneroList);
begin
  inherited Create;
  FIndex := -1;
  FGeneroList := AGeneroList;
end;

function TGeneroListEnumerator.GetCurrent: IGenero;
begin
  Result := FGeneroList[FIndex];
end;

function TGeneroListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FGeneroList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TGeneroListRec }

class function TGeneroListRec.Create(const AList: IGeneroList): TGeneroListRec;
begin
  FillChar(Result, SizeOf(TGeneroListRec), 0);
  Result.FList := AList;
end;

class operator TGeneroListRec.Implicit(AListRec: TGeneroListRec): TGeneroList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TGenero }

function TGenero.GetId: Int64;
begin
  Result := FId;
end;

procedure TGenero.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TGenero.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TGenero.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

function TGenero.GetDescricaoCompleta: TString;
begin
  Result := FDescricaoCompleta;
end;

procedure TGenero.SetDescricaoCompleta(const ADescricaoCompleta: TString);
begin
  FDescricaoCompleta := ADescricaoCompleta;
end;


end.
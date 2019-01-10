unit SDK.Model.Cest;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ICest = interface(IModel)
    ['{F597B6CF-E638-4C6A-9B20-FDB707A69133}']
    function GetId: Variant;
    procedure SetId(const AId: Variant);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    property Id: Variant read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
  end;

  TCestList = class;

  ICestList = interface
	['{FFCF4308-C4EA-4AEE-9DA8-62C5712B855A}']
    function GetReference: TCestList;
    function GetItems(AIndex: Integer): ICest;
    procedure SetItems(AIndex: Integer; const Value: ICest);
    procedure Add(const ACest: ICest);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ICest read GetItems write SetItems; default;
  end;

  TCestListEnumerator = class
  private
    FIndex: Integer;
    FCestList: TCestList;
  public
    constructor Create(ACestList: TCestList);
    function GetCurrent: ICest; inline;
    function MoveNext: Boolean;
    property Current: ICest read GetCurrent;
  end;

  TCestList = class(TInterfacedObject, ICestList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ICest;
    procedure SetItems(AIndex: Integer; const Value: ICest);
  public
    constructor Create;
    procedure Add(const ACest: ICest);
    destructor Destroy; override;
    function GetEnumerator: TCestListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TCestList;
    property Items[AIndex: Integer]: ICest read GetItems write SetItems; default;
  end;

  TCestListRec = record
  private
    FList: ICestList;
  public
    class function Create(const AList: ICestList): TCestListRec; static;
    class operator Implicit(AListRec: TCestListRec): TCestList;
  end;

  TCest = class(TInterfacedModel, ICest)
  private
	FId: Variant;
	FDescricao: TString;
    function GetId: Variant;
    procedure SetId(const AId: Variant);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
  published
    property Id: Variant read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
  end;

implementation

{ TCestList }

procedure TCestList.Add(const ACest: ICest);
begin
  FList.Add(ACest);
end;

procedure TCestList.Clear;
begin
  FList.Clear;
end;

function TCestList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TCestList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TCestList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TCestList.GetEnumerator: TCestListEnumerator;
begin
  Result := TCestListEnumerator.Create(Self);
end;

function TCestList.GetItems(AIndex: Integer): ICest;
begin
  Result := FList[AIndex] as ICest;
end;

function TCestList.GetReference: TCestList;
begin
  Result := Self;
end;

procedure TCestList.SetItems(AIndex: Integer; const Value: ICest);
begin
  FList[AIndex] := Value;
end;

{ TCestListEnumerator }

constructor TCestListEnumerator.Create(ACestList: TCestList);
begin
  inherited Create;
  FIndex := -1;
  FCestList := ACestList;
end;

function TCestListEnumerator.GetCurrent: ICest;
begin
  Result := FCestList[FIndex];
end;

function TCestListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FCestList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TCestListRec }

class function TCestListRec.Create(const AList: ICestList): TCestListRec;
begin
  FillChar(Result, SizeOf(TCestListRec), 0);
  Result.FList := AList;
end;

class operator TCestListRec.Implicit(AListRec: TCestListRec): TCestList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TCest }

function TCest.GetId: Variant;
begin
  Result := FId;
end;

procedure TCest.SetId(const AId: Variant);
begin
  FId := AId;
end;

function TCest.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TCest.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;


end.
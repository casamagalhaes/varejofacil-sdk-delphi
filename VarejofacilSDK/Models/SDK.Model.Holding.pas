unit SDK.Model.Holding;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IHolding = interface(IModel)
    ['{D71C967B-359F-485A-AF58-A31864949DE1}']
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    property Id: Integer read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
  end;

  THoldingList = class;

  IHoldingList = interface
	['{CC35AAE7-BD67-4A4D-B065-BADDFACA4237}']
    function GetReference: THoldingList;
    function GetItems(AIndex: Integer): IHolding;
    procedure SetItems(AIndex: Integer; const Value: IHolding);
    procedure Add(const AHolding: IHolding);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IHolding read GetItems write SetItems; default;
  end;

  THoldingListEnumerator = class
  private
    FIndex: Integer;
    FHoldingList: THoldingList;
  public
    constructor Create(AHoldingList: THoldingList);
    function GetCurrent: IHolding; inline;
    function MoveNext: Boolean;
    property Current: IHolding read GetCurrent;
  end;

  THoldingList = class(TInterfacedObject, IHoldingList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IHolding;
    procedure SetItems(AIndex: Integer; const Value: IHolding);
  public
    constructor Create;
    procedure Add(const AHolding: IHolding);
    destructor Destroy; override;
    function GetEnumerator: THoldingListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: THoldingList;
    property Items[AIndex: Integer]: IHolding read GetItems write SetItems; default;
  end;

  THoldingListRec = record
  private
    FList: IHoldingList;
  public
    class function Create(const AList: IHoldingList): THoldingListRec; static;
    class operator Implicit(AListRec: THoldingListRec): THoldingList;
  end;

  THolding = class(TInterfacedModel, IHolding)
  private
	FId: Integer;
	FDescricao: TString;
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
  published
    property Id: Integer read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
  end;

implementation

{ THoldingList }

procedure THoldingList.Add(const AHolding: IHolding);
begin
  FList.Add(AHolding);
end;

procedure THoldingList.Clear;
begin
  FList.Clear;
end;

function THoldingList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor THoldingList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor THoldingList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function THoldingList.GetEnumerator: THoldingListEnumerator;
begin
  Result := THoldingListEnumerator.Create(Self);
end;

function THoldingList.GetItems(AIndex: Integer): IHolding;
begin
  Result := FList[AIndex] as IHolding;
end;

function THoldingList.GetReference: THoldingList;
begin
  Result := Self;
end;

procedure THoldingList.SetItems(AIndex: Integer; const Value: IHolding);
begin
  FList[AIndex] := Value;
end;

{ THoldingListEnumerator }

constructor THoldingListEnumerator.Create(AHoldingList: THoldingList);
begin
  inherited Create;
  FIndex := -1;
  FHoldingList := AHoldingList;
end;

function THoldingListEnumerator.GetCurrent: IHolding;
begin
  Result := FHoldingList[FIndex];
end;

function THoldingListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FHoldingList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ THoldingListRec }

class function THoldingListRec.Create(const AList: IHoldingList): THoldingListRec;
begin
  FillChar(Result, SizeOf(THoldingListRec), 0);
  Result.FList := AList;
end;

class operator THoldingListRec.Implicit(AListRec: THoldingListRec): THoldingList;
begin
  Result := AListRec.FList.GetReference;
end;

{ THolding }

function THolding.GetId: Integer;
begin
  Result := FId;
end;

procedure THolding.SetId(const AId: Integer);
begin
  FId := AId;
end;

function THolding.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure THolding.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;


end.
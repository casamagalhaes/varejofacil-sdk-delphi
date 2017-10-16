unit SDK.Model.ItemImpostoFederal;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IItemImpostoFederal = interface(IModel)
    ['{081091E4-8D9B-47C6-8AD0-C155C1BDEC97}']
    function GetId: TString;
    procedure SetId(const AId: TString);
    property Id: TString read GetId write SetId;
  end;

  TItemImpostoFederalList = class;

  IItemImpostoFederalList = interface
	['{B3BC9992-A76A-4E19-97AA-3184F88330A9}']
    function GetReference: TItemImpostoFederalList;
    function GetItems(AIndex: Integer): IItemImpostoFederal;
    procedure SetItems(AIndex: Integer; const Value: IItemImpostoFederal);
    procedure Add(const AItemImpostoFederal: IItemImpostoFederal);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IItemImpostoFederal read GetItems write SetItems; default;
  end;

  TItemImpostoFederalListEnumerator = class
  private
    FIndex: Integer;
    FItemImpostoFederalList: TItemImpostoFederalList;
  public
    constructor Create(AItemImpostoFederalList: TItemImpostoFederalList);
    function GetCurrent: IItemImpostoFederal; inline;
    function MoveNext: Boolean;
    property Current: IItemImpostoFederal read GetCurrent;
  end;

  TItemImpostoFederalList = class(TInterfacedObject, IItemImpostoFederalList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IItemImpostoFederal;
    procedure SetItems(AIndex: Integer; const Value: IItemImpostoFederal);
  public
    constructor Create;
    procedure Add(const AItemImpostoFederal: IItemImpostoFederal);
    destructor Destroy; override;
    function GetEnumerator: TItemImpostoFederalListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TItemImpostoFederalList;
    property Items[AIndex: Integer]: IItemImpostoFederal read GetItems write SetItems; default;
  end;

  TItemImpostoFederalListRec = record
  private
    FList: IItemImpostoFederalList;
  public
    class function Create(const AList: IItemImpostoFederalList): TItemImpostoFederalListRec; static;
    class operator Implicit(AListRec: TItemImpostoFederalListRec): TItemImpostoFederalList;
  end;

  TItemImpostoFederal = class(TInterfacedModel, IItemImpostoFederal)
  private
	FId: TString;
    function GetId: TString;
    procedure SetId(const AId: TString);
  public
    property Id: TString read GetId write SetId;
  end;

implementation

{ TItemImpostoFederalList }

procedure TItemImpostoFederalList.Add(const AItemImpostoFederal: IItemImpostoFederal);
begin
  FList.Add(AItemImpostoFederal);
end;

procedure TItemImpostoFederalList.Clear;
begin
  FList.Clear;
end;

function TItemImpostoFederalList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TItemImpostoFederalList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TItemImpostoFederalList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TItemImpostoFederalList.GetEnumerator: TItemImpostoFederalListEnumerator;
begin
  Result := TItemImpostoFederalListEnumerator.Create(Self);
end;

function TItemImpostoFederalList.GetItems(AIndex: Integer): IItemImpostoFederal;
begin
  Result := FList[AIndex] as IItemImpostoFederal;
end;

function TItemImpostoFederalList.GetReference: TItemImpostoFederalList;
begin
  Result := Self;
end;

procedure TItemImpostoFederalList.SetItems(AIndex: Integer; const Value: IItemImpostoFederal);
begin
  FList[AIndex] := Value;
end;

{ TItemImpostoFederalListEnumerator }

constructor TItemImpostoFederalListEnumerator.Create(AItemImpostoFederalList: TItemImpostoFederalList);
begin
  inherited Create;
  FIndex := -1;
  FItemImpostoFederalList := AItemImpostoFederalList;
end;

function TItemImpostoFederalListEnumerator.GetCurrent: IItemImpostoFederal;
begin
  Result := FItemImpostoFederalList[FIndex];
end;

function TItemImpostoFederalListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FItemImpostoFederalList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TItemImpostoFederalListRec }

class function TItemImpostoFederalListRec.Create(const AList: IItemImpostoFederalList): TItemImpostoFederalListRec;
begin
  FillChar(Result, SizeOf(TItemImpostoFederalListRec), 0);
  Result.FList := AList;
end;

class operator TItemImpostoFederalListRec.Implicit(AListRec: TItemImpostoFederalListRec): TItemImpostoFederalList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TItemImpostoFederal }

function TItemImpostoFederal.GetId: TString;
begin
  Result := FId;
end;

procedure TItemImpostoFederal.SetId(const AId: TString);
begin
  FId := AId;
end;


end.
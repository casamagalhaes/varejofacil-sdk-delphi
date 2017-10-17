unit SDK.Model.PagueLeveItem;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IPagueLeveItem = interface(IModel)
    ['{4673FEEE-84D4-4A03-A20B-A1799AC34EF0}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    property Id: Int64 read GetId write SetId;
  end;

  TPagueLeveItemList = class;

  IPagueLeveItemList = interface
	['{5B23D412-B280-4980-93C0-12007F395567}']
    function GetReference: TPagueLeveItemList;
    function GetItems(AIndex: Integer): IPagueLeveItem;
    procedure SetItems(AIndex: Integer; const Value: IPagueLeveItem);
    procedure Add(const APagueLeveItem: IPagueLeveItem);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IPagueLeveItem read GetItems write SetItems; default;
  end;

  TPagueLeveItemListEnumerator = class
  private
    FIndex: Integer;
    FPagueLeveItemList: TPagueLeveItemList;
  public
    constructor Create(APagueLeveItemList: TPagueLeveItemList);
    function GetCurrent: IPagueLeveItem; inline;
    function MoveNext: Boolean;
    property Current: IPagueLeveItem read GetCurrent;
  end;

  TPagueLeveItemList = class(TInterfacedObject, IPagueLeveItemList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IPagueLeveItem;
    procedure SetItems(AIndex: Integer; const Value: IPagueLeveItem);
  public
    constructor Create;
    procedure Add(const APagueLeveItem: IPagueLeveItem);
    destructor Destroy; override;
    function GetEnumerator: TPagueLeveItemListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TPagueLeveItemList;
    property Items[AIndex: Integer]: IPagueLeveItem read GetItems write SetItems; default;
  end;

  TPagueLeveItemListRec = record
  private
    FList: IPagueLeveItemList;
  public
    class function Create(const AList: IPagueLeveItemList): TPagueLeveItemListRec; static;
    class operator Implicit(AListRec: TPagueLeveItemListRec): TPagueLeveItemList;
  end;

  TPagueLeveItem = class(TInterfacedModel, IPagueLeveItem)
  private
	FId: Int64;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
  published
    property Id: Int64 read GetId write SetId;
  end;

implementation

{ TPagueLeveItemList }

procedure TPagueLeveItemList.Add(const APagueLeveItem: IPagueLeveItem);
begin
  FList.Add(APagueLeveItem);
end;

procedure TPagueLeveItemList.Clear;
begin
  FList.Clear;
end;

function TPagueLeveItemList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TPagueLeveItemList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TPagueLeveItemList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TPagueLeveItemList.GetEnumerator: TPagueLeveItemListEnumerator;
begin
  Result := TPagueLeveItemListEnumerator.Create(Self);
end;

function TPagueLeveItemList.GetItems(AIndex: Integer): IPagueLeveItem;
begin
  Result := FList[AIndex] as IPagueLeveItem;
end;

function TPagueLeveItemList.GetReference: TPagueLeveItemList;
begin
  Result := Self;
end;

procedure TPagueLeveItemList.SetItems(AIndex: Integer; const Value: IPagueLeveItem);
begin
  FList[AIndex] := Value;
end;

{ TPagueLeveItemListEnumerator }

constructor TPagueLeveItemListEnumerator.Create(APagueLeveItemList: TPagueLeveItemList);
begin
  inherited Create;
  FIndex := -1;
  FPagueLeveItemList := APagueLeveItemList;
end;

function TPagueLeveItemListEnumerator.GetCurrent: IPagueLeveItem;
begin
  Result := FPagueLeveItemList[FIndex];
end;

function TPagueLeveItemListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FPagueLeveItemList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TPagueLeveItemListRec }

class function TPagueLeveItemListRec.Create(const AList: IPagueLeveItemList): TPagueLeveItemListRec;
begin
  FillChar(Result, SizeOf(TPagueLeveItemListRec), 0);
  Result.FList := AList;
end;

class operator TPagueLeveItemListRec.Implicit(AListRec: TPagueLeveItemListRec): TPagueLeveItemList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TPagueLeveItem }

function TPagueLeveItem.GetId: Int64;
begin
  Result := FId;
end;

procedure TPagueLeveItem.SetId(const AId: Int64);
begin
  FId := AId;
end;


end.
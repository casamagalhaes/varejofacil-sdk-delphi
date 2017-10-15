unit SDK.Model.%MODEL_NAME%;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  I%MODEL_NAME% = interface(IModel)
    ['%NEW_GUID%']%BEGIN_LOOP(FIELDS)%
    function Get%FIELD.NAME%: %FIELD.TYPE%;
    procedure Set%FIELD.NAME%(const A%FIELD.NAME%: %FIELD.TYPE%);%END_LOOP%%BEGIN_LOOP(FIELDS)%
    property %FIELD.NAME%: %FIELD.TYPE% read Get%FIELD.NAME% write Set%FIELD.NAME%;%END_LOOP%
  end;

  T%MODEL_NAME%List = class;

  I%MODEL_NAME%List = interface
	['%NEW_GUID%']
    function GetReference: T%MODEL_NAME%List;
    function GetItems(AIndex: Integer): I%MODEL_NAME%;
    procedure SetItems(AIndex: Integer; const Value: I%MODEL_NAME%);
    procedure Add(const A%MODEL_NAME%: I%MODEL_NAME%);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: I%MODEL_NAME% read GetItems write SetItems; default;
  end;

  T%MODEL_NAME%ListEnumerator = class
  private
    FIndex: Integer;
    F%MODEL_NAME%List: T%MODEL_NAME%List;
  public
    constructor Create(A%MODEL_NAME%List: T%MODEL_NAME%List);
    function GetCurrent: I%MODEL_NAME%; inline;
    function MoveNext: Boolean;
    property Current: I%MODEL_NAME% read GetCurrent;
  end;

  T%MODEL_NAME%List = class(TInterfacedObject, I%MODEL_NAME%List)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): I%MODEL_NAME%;
    procedure SetItems(AIndex: Integer; const Value: I%MODEL_NAME%);
  public
    constructor Create;
    procedure Add(const A%MODEL_NAME%: I%MODEL_NAME%);
    destructor Destroy; override;
    function GetEnumerator: T%MODEL_NAME%ListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: T%MODEL_NAME%List;
    property Items[AIndex: Integer]: I%MODEL_NAME% read GetItems write SetItems; default;
  end;

  T%MODEL_NAME%ListRec = record
  private
    FList: I%MODEL_NAME%List;
  public
    class function Create(const AList: I%MODEL_NAME%List): T%MODEL_NAME%ListRec; static;
    class operator Implicit(AListRec: T%MODEL_NAME%ListRec): T%MODEL_NAME%List;
  end;

  T%MODEL_NAME% = class(TInterfacedObject, I%MODEL_NAME%)
  private%BEGIN_LOOP(FIELDS)%
	F%FIELD.NAME%: %FIELD.TYPE%;%END_LOOP%%BEGIN_LOOP(FIELDS)%
    function Get%FIELD.NAME%: %FIELD.TYPE%;
    procedure Set%FIELD.NAME%(const A%FIELD.NAME%: %FIELD.TYPE%);%END_LOOP%
  public%BEGIN_LOOP(FIELDS)%
    property %FIELD.NAME%: %FIELD.TYPE% read Get%FIELD.NAME% write Set%FIELD.NAME%;%END_LOOP%
  end;

implementation

{ T%MODEL_NAME%List }

procedure T%MODEL_NAME%List.Add(const A%MODEL_NAME%: I%MODEL_NAME%);
begin
  FList.Add(A%MODEL_NAME%);
end;

procedure T%MODEL_NAME%List.Clear;
begin
  FList.Clear;
end;

function T%MODEL_NAME%List.Count: Integer;
begin
  Result := FList.Count;
end;

constructor T%MODEL_NAME%List.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor T%MODEL_NAME%List.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function T%MODEL_NAME%List.GetEnumerator: T%MODEL_NAME%ListEnumerator;
begin
  Result := T%MODEL_NAME%ListEnumerator.Create(Self);
end;

function T%MODEL_NAME%List.GetItems(AIndex: Integer): I%MODEL_NAME%;
begin
  Result := FList[AIndex] as I%MODEL_NAME%;
end;

function T%MODEL_NAME%List.GetReference: T%MODEL_NAME%List;
begin
  Result := Self;
end;

procedure T%MODEL_NAME%List.SetItems(AIndex: Integer; const Value: I%MODEL_NAME%);
begin
  FList[AIndex] := Value;
end;

{ T%MODEL_NAME%ListEnumerator }

constructor T%MODEL_NAME%ListEnumerator.Create(A%MODEL_NAME%List: T%MODEL_NAME%List);
begin
  inherited Create;
  FIndex := -1;
  F%MODEL_NAME%List := A%MODEL_NAME%List;
end;

function T%MODEL_NAME%ListEnumerator.GetCurrent: I%MODEL_NAME%;
begin
  Result := F%MODEL_NAME%List[FIndex];
end;

function T%MODEL_NAME%ListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < F%MODEL_NAME%List.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ T%MODEL_NAME%ListRec }

class function T%MODEL_NAME%ListRec.Create(const AList: I%MODEL_NAME%List): T%MODEL_NAME%ListRec;
begin
  FillChar(Result, SizeOf(T%MODEL_NAME%ListRec), 0);
  Result.FList := AList;
end;

class operator T%MODEL_NAME%ListRec.Implicit(AListRec: T%MODEL_NAME%ListRec): T%MODEL_NAME%List;
begin
  Result := AListRec.FList.GetReference;
end;

{ T%MODEL_NAME% }
%BEGIN_LOOP(FIELDS)%
function T%MODEL_NAME%.Get%FIELD.NAME%: %FIELD.TYPE%;
begin
  Result := F%FIELD.NAME%;
end;

procedure T%MODEL_NAME%.Set%FIELD.NAME%(const A%FIELD.NAME%: %FIELD.TYPE%);
begin
  F%FIELD.NAME% := A%FIELD.NAME%;
end;
%END_LOOP%

end.
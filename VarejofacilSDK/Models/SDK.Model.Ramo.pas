unit SDK.Model.Ramo;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IRamo = interface(IModel)
    ['{D0EA4865-AAA9-499B-8AFC-4F347C3B630A}']
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    property Id: Integer read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
  end;

  TRamoList = class;

  IRamoList = interface
	['{8A5C95B6-CBF2-4515-8D2A-A7277C4F2105}']
    function GetReference: TRamoList;
    function GetItems(AIndex: Integer): IRamo;
    procedure SetItems(AIndex: Integer; const Value: IRamo);
    procedure Add(const ARamo: IRamo);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IRamo read GetItems write SetItems; default;
  end;

  TRamoListEnumerator = class
  private
    FIndex: Integer;
    FRamoList: TRamoList;
  public
    constructor Create(ARamoList: TRamoList);
    function GetCurrent: IRamo; inline;
    function MoveNext: Boolean;
    property Current: IRamo read GetCurrent;
  end;

  TRamoList = class(TInterfacedObject, IRamoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IRamo;
    procedure SetItems(AIndex: Integer; const Value: IRamo);
  public
    constructor Create;
    procedure Add(const ARamo: IRamo);
    destructor Destroy; override;
    function GetEnumerator: TRamoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TRamoList;
    property Items[AIndex: Integer]: IRamo read GetItems write SetItems; default;
  end;

  TRamoListRec = record
  private
    FList: IRamoList;
  public
    class function Create(const AList: IRamoList): TRamoListRec; static;
    class operator Implicit(AListRec: TRamoListRec): TRamoList;
  end;

  TRamo = class(TInterfacedObject, IRamo)
  private
	FId: Integer;
	FDescricao: TString;
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
  public
    property Id: Integer read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
  end;

implementation

{ TRamoList }

procedure TRamoList.Add(const ARamo: IRamo);
begin
  FList.Add(ARamo);
end;

procedure TRamoList.Clear;
begin
  FList.Clear;
end;

function TRamoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TRamoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TRamoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TRamoList.GetEnumerator: TRamoListEnumerator;
begin
  Result := TRamoListEnumerator.Create(Self);
end;

function TRamoList.GetItems(AIndex: Integer): IRamo;
begin
  Result := FList[AIndex] as IRamo;
end;

function TRamoList.GetReference: TRamoList;
begin
  Result := Self;
end;

procedure TRamoList.SetItems(AIndex: Integer; const Value: IRamo);
begin
  FList[AIndex] := Value;
end;

{ TRamoListEnumerator }

constructor TRamoListEnumerator.Create(ARamoList: TRamoList);
begin
  inherited Create;
  FIndex := -1;
  FRamoList := ARamoList;
end;

function TRamoListEnumerator.GetCurrent: IRamo;
begin
  Result := FRamoList[FIndex];
end;

function TRamoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FRamoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TRamoListRec }

class function TRamoListRec.Create(const AList: IRamoList): TRamoListRec;
begin
  FillChar(Result, SizeOf(TRamoListRec), 0);
  Result.FList := AList;
end;

class operator TRamoListRec.Implicit(AListRec: TRamoListRec): TRamoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TRamo }

function TRamo.GetId: Integer;
begin
  Result := FId;
end;

procedure TRamo.SetId(const AId: Integer);
begin
  FId := AId;
end;

function TRamo.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TRamo.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;


end.
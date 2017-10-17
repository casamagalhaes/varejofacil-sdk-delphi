unit SDK.Model.LojaView;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ILojaView = interface(IModel)
    ['{2ED98CCF-1EC0-4D3F-A282-D589756E952D}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    property Id: Int64 read GetId write SetId;
  end;

  TLojaViewList = class;

  ILojaViewList = interface
	['{B58AB35F-6A52-4937-A02E-813B2DF1AB65}']
    function GetReference: TLojaViewList;
    function GetItems(AIndex: Integer): ILojaView;
    procedure SetItems(AIndex: Integer; const Value: ILojaView);
    procedure Add(const ALojaView: ILojaView);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ILojaView read GetItems write SetItems; default;
  end;

  TLojaViewListEnumerator = class
  private
    FIndex: Integer;
    FLojaViewList: TLojaViewList;
  public
    constructor Create(ALojaViewList: TLojaViewList);
    function GetCurrent: ILojaView; inline;
    function MoveNext: Boolean;
    property Current: ILojaView read GetCurrent;
  end;

  TLojaViewList = class(TInterfacedObject, ILojaViewList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ILojaView;
    procedure SetItems(AIndex: Integer; const Value: ILojaView);
  public
    constructor Create;
    procedure Add(const ALojaView: ILojaView);
    destructor Destroy; override;
    function GetEnumerator: TLojaViewListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TLojaViewList;
    property Items[AIndex: Integer]: ILojaView read GetItems write SetItems; default;
  end;

  TLojaViewListRec = record
  private
    FList: ILojaViewList;
  public
    class function Create(const AList: ILojaViewList): TLojaViewListRec; static;
    class operator Implicit(AListRec: TLojaViewListRec): TLojaViewList;
  end;

  TLojaView = class(TInterfacedModel, ILojaView)
  private
	FId: Int64;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
  published
    property Id: Int64 read GetId write SetId;
  end;

implementation

{ TLojaViewList }

procedure TLojaViewList.Add(const ALojaView: ILojaView);
begin
  FList.Add(ALojaView);
end;

procedure TLojaViewList.Clear;
begin
  FList.Clear;
end;

function TLojaViewList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TLojaViewList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TLojaViewList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TLojaViewList.GetEnumerator: TLojaViewListEnumerator;
begin
  Result := TLojaViewListEnumerator.Create(Self);
end;

function TLojaViewList.GetItems(AIndex: Integer): ILojaView;
begin
  Result := FList[AIndex] as ILojaView;
end;

function TLojaViewList.GetReference: TLojaViewList;
begin
  Result := Self;
end;

procedure TLojaViewList.SetItems(AIndex: Integer; const Value: ILojaView);
begin
  FList[AIndex] := Value;
end;

{ TLojaViewListEnumerator }

constructor TLojaViewListEnumerator.Create(ALojaViewList: TLojaViewList);
begin
  inherited Create;
  FIndex := -1;
  FLojaViewList := ALojaViewList;
end;

function TLojaViewListEnumerator.GetCurrent: ILojaView;
begin
  Result := FLojaViewList[FIndex];
end;

function TLojaViewListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FLojaViewList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TLojaViewListRec }

class function TLojaViewListRec.Create(const AList: ILojaViewList): TLojaViewListRec;
begin
  FillChar(Result, SizeOf(TLojaViewListRec), 0);
  Result.FList := AList;
end;

class operator TLojaViewListRec.Implicit(AListRec: TLojaViewListRec): TLojaViewList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TLojaView }

function TLojaView.GetId: Int64;
begin
  Result := FId;
end;

procedure TLojaView.SetId(const AId: Int64);
begin
  FId := AId;
end;


end.
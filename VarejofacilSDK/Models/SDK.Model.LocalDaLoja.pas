unit SDK.Model.LocalDaLoja;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ILocalDaLoja = interface(IModel)
    ['{1E12025C-F62E-43A8-A9F5-D59707208847}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetLocalId: Int64;
    procedure SetLocalId(const ALocalId: Int64);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetPadrao: Boolean;
    procedure SetPadrao(const APadrao: Boolean);
    function GetInsumo: Boolean;
    procedure SetInsumo(const AInsumo: Boolean);
    property Id: Int64 read GetId write SetId;
    property LocalId: Int64 read GetLocalId write SetLocalId;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property Padrao: Boolean read GetPadrao write SetPadrao;
    property Insumo: Boolean read GetInsumo write SetInsumo;
  end;

  TLocalDaLojaList = class;

  ILocalDaLojaList = interface
	['{8436D4FB-42C9-45E5-83A1-A0201A3763E8}']
    function GetReference: TLocalDaLojaList;
    function GetItems(AIndex: Integer): ILocalDaLoja;
    procedure SetItems(AIndex: Integer; const Value: ILocalDaLoja);
    procedure Add(const ALocalDaLoja: ILocalDaLoja);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ILocalDaLoja read GetItems write SetItems; default;
  end;

  TLocalDaLojaListEnumerator = class
  private
    FIndex: Integer;
    FLocalDaLojaList: TLocalDaLojaList;
  public
    constructor Create(ALocalDaLojaList: TLocalDaLojaList);
    function GetCurrent: ILocalDaLoja; inline;
    function MoveNext: Boolean;
    property Current: ILocalDaLoja read GetCurrent;
  end;

  TLocalDaLojaList = class(TInterfacedObject, ILocalDaLojaList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ILocalDaLoja;
    procedure SetItems(AIndex: Integer; const Value: ILocalDaLoja);
  public
    constructor Create;
    procedure Add(const ALocalDaLoja: ILocalDaLoja);
    destructor Destroy; override;
    function GetEnumerator: TLocalDaLojaListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TLocalDaLojaList;
    property Items[AIndex: Integer]: ILocalDaLoja read GetItems write SetItems; default;
  end;

  TLocalDaLojaListRec = record
  private
    FList: ILocalDaLojaList;
  public
    class function Create(const AList: ILocalDaLojaList): TLocalDaLojaListRec; static;
    class operator Implicit(AListRec: TLocalDaLojaListRec): TLocalDaLojaList;
  end;

  TLocalDaLoja = class(TInterfacedModel, ILocalDaLoja)
  private
	FId: Int64;
	FLocalId: Int64;
	FLojaId: Int64;
	FPadrao: Boolean;
	FInsumo: Boolean;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetLocalId: Int64;
    procedure SetLocalId(const ALocalId: Int64);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetPadrao: Boolean;
    procedure SetPadrao(const APadrao: Boolean);
    function GetInsumo: Boolean;
    procedure SetInsumo(const AInsumo: Boolean);
  published
    property Id: Int64 read GetId write SetId;
    property LocalId: Int64 read GetLocalId write SetLocalId;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property Padrao: Boolean read GetPadrao write SetPadrao;
    property Insumo: Boolean read GetInsumo write SetInsumo;
  end;

implementation

{ TLocalDaLojaList }

procedure TLocalDaLojaList.Add(const ALocalDaLoja: ILocalDaLoja);
begin
  FList.Add(ALocalDaLoja);
end;

procedure TLocalDaLojaList.Clear;
begin
  FList.Clear;
end;

function TLocalDaLojaList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TLocalDaLojaList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TLocalDaLojaList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TLocalDaLojaList.GetEnumerator: TLocalDaLojaListEnumerator;
begin
  Result := TLocalDaLojaListEnumerator.Create(Self);
end;

function TLocalDaLojaList.GetItems(AIndex: Integer): ILocalDaLoja;
begin
  Result := FList[AIndex] as ILocalDaLoja;
end;

function TLocalDaLojaList.GetReference: TLocalDaLojaList;
begin
  Result := Self;
end;

procedure TLocalDaLojaList.SetItems(AIndex: Integer; const Value: ILocalDaLoja);
begin
  FList[AIndex] := Value;
end;

{ TLocalDaLojaListEnumerator }

constructor TLocalDaLojaListEnumerator.Create(ALocalDaLojaList: TLocalDaLojaList);
begin
  inherited Create;
  FIndex := -1;
  FLocalDaLojaList := ALocalDaLojaList;
end;

function TLocalDaLojaListEnumerator.GetCurrent: ILocalDaLoja;
begin
  Result := FLocalDaLojaList[FIndex];
end;

function TLocalDaLojaListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FLocalDaLojaList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TLocalDaLojaListRec }

class function TLocalDaLojaListRec.Create(const AList: ILocalDaLojaList): TLocalDaLojaListRec;
begin
  FillChar(Result, SizeOf(TLocalDaLojaListRec), 0);
  Result.FList := AList;
end;

class operator TLocalDaLojaListRec.Implicit(AListRec: TLocalDaLojaListRec): TLocalDaLojaList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TLocalDaLoja }

function TLocalDaLoja.GetId: Int64;
begin
  Result := FId;
end;

procedure TLocalDaLoja.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TLocalDaLoja.GetLocalId: Int64;
begin
  Result := FLocalId;
end;

procedure TLocalDaLoja.SetLocalId(const ALocalId: Int64);
begin
  FLocalId := ALocalId;
end;

function TLocalDaLoja.GetLojaId: Int64;
begin
  Result := FLojaId;
end;

procedure TLocalDaLoja.SetLojaId(const ALojaId: Int64);
begin
  FLojaId := ALojaId;
end;

function TLocalDaLoja.GetPadrao: Boolean;
begin
  Result := FPadrao;
end;

procedure TLocalDaLoja.SetPadrao(const APadrao: Boolean);
begin
  FPadrao := APadrao;
end;

function TLocalDaLoja.GetInsumo: Boolean;
begin
  Result := FInsumo;
end;

procedure TLocalDaLoja.SetInsumo(const AInsumo: Boolean);
begin
  FInsumo := AInsumo;
end;


end.
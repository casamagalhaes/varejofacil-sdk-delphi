unit SDK.Model.Usuario;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IUsuario = interface(IModel)
    ['{B974A226-F2F3-478D-BA69-B8ED956BE8EF}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    property Id: Int64 read GetId write SetId;
  end;

  TUsuarioList = class;

  IUsuarioList = interface
	['{BDE2838F-781D-4678-887A-FC4434FB1F62}']
    function GetReference: TUsuarioList;
    function GetItems(AIndex: Integer): IUsuario;
    procedure SetItems(AIndex: Integer; const Value: IUsuario);
    procedure Add(const AUsuario: IUsuario);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IUsuario read GetItems write SetItems; default;
  end;

  TUsuarioListEnumerator = class
  private
    FIndex: Integer;
    FUsuarioList: TUsuarioList;
  public
    constructor Create(AUsuarioList: TUsuarioList);
    function GetCurrent: IUsuario; inline;
    function MoveNext: Boolean;
    property Current: IUsuario read GetCurrent;
  end;

  TUsuarioList = class(TInterfacedObject, IUsuarioList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IUsuario;
    procedure SetItems(AIndex: Integer; const Value: IUsuario);
  public
    constructor Create;
    procedure Add(const AUsuario: IUsuario);
    destructor Destroy; override;
    function GetEnumerator: TUsuarioListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TUsuarioList;
    property Items[AIndex: Integer]: IUsuario read GetItems write SetItems; default;
  end;

  TUsuarioListRec = record
  private
    FList: IUsuarioList;
  public
    class function Create(const AList: IUsuarioList): TUsuarioListRec; static;
    class operator Implicit(AListRec: TUsuarioListRec): TUsuarioList;
  end;

  TUsuario = class(TInterfacedModel, IUsuario)
  private
	FId: Int64;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
  public
    property Id: Int64 read GetId write SetId;
  end;

implementation

{ TUsuarioList }

procedure TUsuarioList.Add(const AUsuario: IUsuario);
begin
  FList.Add(AUsuario);
end;

procedure TUsuarioList.Clear;
begin
  FList.Clear;
end;

function TUsuarioList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TUsuarioList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TUsuarioList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TUsuarioList.GetEnumerator: TUsuarioListEnumerator;
begin
  Result := TUsuarioListEnumerator.Create(Self);
end;

function TUsuarioList.GetItems(AIndex: Integer): IUsuario;
begin
  Result := FList[AIndex] as IUsuario;
end;

function TUsuarioList.GetReference: TUsuarioList;
begin
  Result := Self;
end;

procedure TUsuarioList.SetItems(AIndex: Integer; const Value: IUsuario);
begin
  FList[AIndex] := Value;
end;

{ TUsuarioListEnumerator }

constructor TUsuarioListEnumerator.Create(AUsuarioList: TUsuarioList);
begin
  inherited Create;
  FIndex := -1;
  FUsuarioList := AUsuarioList;
end;

function TUsuarioListEnumerator.GetCurrent: IUsuario;
begin
  Result := FUsuarioList[FIndex];
end;

function TUsuarioListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FUsuarioList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TUsuarioListRec }

class function TUsuarioListRec.Create(const AList: IUsuarioList): TUsuarioListRec;
begin
  FillChar(Result, SizeOf(TUsuarioListRec), 0);
  Result.FList := AList;
end;

class operator TUsuarioListRec.Implicit(AListRec: TUsuarioListRec): TUsuarioList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TUsuario }

function TUsuario.GetId: Int64;
begin
  Result := FId;
end;

procedure TUsuario.SetId(const AId: Int64);
begin
  FId := AId;
end;


end.
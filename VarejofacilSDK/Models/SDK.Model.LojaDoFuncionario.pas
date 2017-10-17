unit SDK.Model.LojaDoFuncionario;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ILojaDoFuncionario = interface(IModel)
    ['{661ECF58-C71A-438B-A5C1-1C5024BDB4ED}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetAtivo: Boolean;
    procedure SetAtivo(const AAtivo: Boolean);
    property Id: Int64 read GetId write SetId;
    property Ativo: Boolean read GetAtivo write SetAtivo;
  end;

  TLojaDoFuncionarioList = class;

  ILojaDoFuncionarioList = interface
	['{2BAC4334-E269-4389-92B5-73B76BDB3D6F}']
    function GetReference: TLojaDoFuncionarioList;
    function GetItems(AIndex: Integer): ILojaDoFuncionario;
    procedure SetItems(AIndex: Integer; const Value: ILojaDoFuncionario);
    procedure Add(const ALojaDoFuncionario: ILojaDoFuncionario);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ILojaDoFuncionario read GetItems write SetItems; default;
  end;

  TLojaDoFuncionarioListEnumerator = class
  private
    FIndex: Integer;
    FLojaDoFuncionarioList: TLojaDoFuncionarioList;
  public
    constructor Create(ALojaDoFuncionarioList: TLojaDoFuncionarioList);
    function GetCurrent: ILojaDoFuncionario; inline;
    function MoveNext: Boolean;
    property Current: ILojaDoFuncionario read GetCurrent;
  end;

  TLojaDoFuncionarioList = class(TInterfacedObject, ILojaDoFuncionarioList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ILojaDoFuncionario;
    procedure SetItems(AIndex: Integer; const Value: ILojaDoFuncionario);
  public
    constructor Create;
    procedure Add(const ALojaDoFuncionario: ILojaDoFuncionario);
    destructor Destroy; override;
    function GetEnumerator: TLojaDoFuncionarioListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TLojaDoFuncionarioList;
    property Items[AIndex: Integer]: ILojaDoFuncionario read GetItems write SetItems; default;
  end;

  TLojaDoFuncionarioListRec = record
  private
    FList: ILojaDoFuncionarioList;
  public
    class function Create(const AList: ILojaDoFuncionarioList): TLojaDoFuncionarioListRec; static;
    class operator Implicit(AListRec: TLojaDoFuncionarioListRec): TLojaDoFuncionarioList;
  end;

  TLojaDoFuncionario = class(TInterfacedModel, ILojaDoFuncionario)
  private
	FId: Int64;
	FAtivo: Boolean;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetAtivo: Boolean;
    procedure SetAtivo(const AAtivo: Boolean);
  published
    property Id: Int64 read GetId write SetId;
    property Ativo: Boolean read GetAtivo write SetAtivo;
  end;

implementation

{ TLojaDoFuncionarioList }

procedure TLojaDoFuncionarioList.Add(const ALojaDoFuncionario: ILojaDoFuncionario);
begin
  FList.Add(ALojaDoFuncionario);
end;

procedure TLojaDoFuncionarioList.Clear;
begin
  FList.Clear;
end;

function TLojaDoFuncionarioList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TLojaDoFuncionarioList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TLojaDoFuncionarioList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TLojaDoFuncionarioList.GetEnumerator: TLojaDoFuncionarioListEnumerator;
begin
  Result := TLojaDoFuncionarioListEnumerator.Create(Self);
end;

function TLojaDoFuncionarioList.GetItems(AIndex: Integer): ILojaDoFuncionario;
begin
  Result := FList[AIndex] as ILojaDoFuncionario;
end;

function TLojaDoFuncionarioList.GetReference: TLojaDoFuncionarioList;
begin
  Result := Self;
end;

procedure TLojaDoFuncionarioList.SetItems(AIndex: Integer; const Value: ILojaDoFuncionario);
begin
  FList[AIndex] := Value;
end;

{ TLojaDoFuncionarioListEnumerator }

constructor TLojaDoFuncionarioListEnumerator.Create(ALojaDoFuncionarioList: TLojaDoFuncionarioList);
begin
  inherited Create;
  FIndex := -1;
  FLojaDoFuncionarioList := ALojaDoFuncionarioList;
end;

function TLojaDoFuncionarioListEnumerator.GetCurrent: ILojaDoFuncionario;
begin
  Result := FLojaDoFuncionarioList[FIndex];
end;

function TLojaDoFuncionarioListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FLojaDoFuncionarioList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TLojaDoFuncionarioListRec }

class function TLojaDoFuncionarioListRec.Create(const AList: ILojaDoFuncionarioList): TLojaDoFuncionarioListRec;
begin
  FillChar(Result, SizeOf(TLojaDoFuncionarioListRec), 0);
  Result.FList := AList;
end;

class operator TLojaDoFuncionarioListRec.Implicit(AListRec: TLojaDoFuncionarioListRec): TLojaDoFuncionarioList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TLojaDoFuncionario }

function TLojaDoFuncionario.GetId: Int64;
begin
  Result := FId;
end;

procedure TLojaDoFuncionario.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TLojaDoFuncionario.GetAtivo: Boolean;
begin
  Result := FAtivo;
end;

procedure TLojaDoFuncionario.SetAtivo(const AAtivo: Boolean);
begin
  FAtivo := AAtivo;
end;


end.
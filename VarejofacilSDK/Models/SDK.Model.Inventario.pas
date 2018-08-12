unit SDK.Model.Inventario;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type
  IInventario = interface(IModel)
  ['{EB19E648-48A5-4A97-8EAE-5CAA8BC2C1FE}']
    function GetId: Int64;
    function GetDescricao: TString;
    function GetLocalId: Int64;
    function GetLojaId: Int64;
    function GetDataAbertura: TDateTime;
    procedure SetID(const Value: Int64);
    procedure SetDescricao(const Value: TString);
    procedure SetLocalId(const Value: Int64);
    procedure SetLojaId(const Value: Int64);
    procedure SetDataAbertura(const Value: TDateTime);
    property Id: Int64 read GetId write SetID;
    property Descricao: TString read GetDescricao write SetDescricao;
    property LocalId: Int64 read GetLocalId write SetLocalId;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property DataAbertura: TDateTime read GetDataAbertura write SetDataAbertura;
  end;
  
  TInventarioList = class;

  IInventarioList = interface
	['{5CC54225-35FA-4132-AB95-AE68C31AF4E4}']
    function GetReference: TInventarioList;
    function GetItems(AIndex: Integer): IInventario;
    procedure SetItems(AIndex: Integer; const Value: IInventario);
    procedure Add(const AInventario: IInventario);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IInventario read GetItems write SetItems; default;
  end;

  TInventarioListEnumerator = class
  private
    FIndex: Integer;
    FInventarioList: TInventarioList;
  public
    constructor Create(AInventarioList: TInventarioList);
    function GetCurrent: IInventario; inline;
    function MoveNext: Boolean;
    property Current: IInventario read GetCurrent;
  end;

  TInventarioList = class(TInterfacedObject, IInventarioList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IInventario;
    procedure SetItems(AIndex: Integer; const Value: IInventario);
  public
    constructor Create;
    procedure Add(const AInventario: IInventario);
    destructor Destroy; override;
    function GetEnumerator: TInventarioListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TInventarioList;
    property Items[AIndex: Integer]: IInventario read GetItems write SetItems; default;
  end;
                             
  TInventarioListRec = record
  private
    FList: IInventarioList;
  public
    class function Create(const AList: IInventarioList): TInventarioListRec; static;
    class operator Implicit(AListRec: TInventarioListRec): TInventarioList;
  end;

  TInventario = class(TInterfacedModel, IInventario)
  private
    FId: Int64;
    FDescricao: TString;
    FLocalId: Int64;
    FLojaId: Int64;
    FDataAbertura: TDateTime;
    function GetDataAbertura: TDateTime;
    function GetDescricao: TString;
    function GetId: Int64;
    function GetLocalId: Int64;
    function GetLojaId: Int64;
    procedure SetDataAbertura(const Value: TDateTime);
    procedure SetDescricao(const Value: TString);
    procedure SetID(const Value: Int64);
    procedure SetLocalId(const Value: Int64);
    procedure SetLojaId(const Value: Int64);
  public
    property Id: Int64 read GetId write SetID;
    property Descricao: TString read GetDescricao write SetDescricao;
    property LocalId: Int64 read GetLocalId write SetLocalId;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property DataAbertura: TDateTime read GetDataAbertura write SetDataAbertura;

  end;

{ TInventario }
implementation

function TInventario.GetDataAbertura: TDateTime;
begin
  Result := FDataAbertura;
end;

function TInventario.GetDescricao: TString;
begin
  Result := FDescricao;
end;

function TInventario.GetId: Int64;
begin
  Result := FId;
end;

function TInventario.GetLocalId: Int64;
begin
  Result := FLocalId;
end;

function TInventario.GetLojaId: Int64;
begin
  Result := FLojaId;
end;

procedure TInventario.SetDataAbertura(const Value: TDateTime);
begin
  FDataAbertura := Value;
end;

procedure TInventario.SetDescricao(const Value: TString);
begin
  FDescricao := Value;
end;

procedure TInventario.SetID(const Value: Int64);
begin
  FId := Value;
end;

procedure TInventario.SetLocalId(const Value: Int64);
begin
  FLocalId := Value;
end;

procedure TInventario.SetLojaId(const Value: Int64);
begin
  FLojaId := Value;
end;

{ TInventarioListEnumerator }

constructor TInventarioListEnumerator.Create(AInventarioList: TInventarioList);
begin
  inherited Create;
  FIndex := -1;
  FInventarioList := AInventarioList;
end;

function TInventarioListEnumerator.GetCurrent: IInventario;
begin
  Result := FInventarioList[FIndex];
end;

function TInventarioListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FInventarioList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TInventarioList }

procedure TInventarioList.Add(const AInventario: IInventario);
begin
  FList.Add(AInventario);
end;

procedure TInventarioList.Clear;
begin
  FList.Clear;
end;

function TInventarioList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TInventarioList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TInventarioList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TInventarioList.GetEnumerator: TInventarioListEnumerator;
begin
  Result := TInventarioListEnumerator.Create(Self);
end;

function TInventarioList.GetItems(AIndex: Integer): IInventario;
begin
  Result := FList[AIndex] as IInventario;
end;

function TInventarioList.GetReference: TInventarioList;
begin
  Result := Self;
end;

procedure TInventarioList.SetItems(AIndex: Integer; const Value: IInventario);
begin
  FList[AIndex] := Value;
end;

{ TInventarioListRec }

class function TInventarioListRec.Create(
  const AList: IInventarioList): TInventarioListRec;
begin
  FillChar(Result, SizeOf(TInventarioListRec), 0);
  Result.FList := AList;
end;

class operator TInventarioListRec.Implicit(
  AListRec: TInventarioListRec): TInventarioList;
begin
  Result := AListRec.FList.GetReference;
end;

end.

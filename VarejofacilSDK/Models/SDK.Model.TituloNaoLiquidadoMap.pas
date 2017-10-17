unit SDK.Model.TituloNaoLiquidadoMap;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums, SDK.Model.TituloNaoLiquidado;

type

  ITituloNaoLiquidadoMap = interface(IModel)
    ['{8B9FEB04-0880-4309-88A1-CCAB9AA05BC2}']
    function GetDataConsulta: TDateTime;
    procedure SetDataConsulta(const ADataConsulta: TDateTime);
    function GetTitulos: TTituloNaoLiquidadoList;
    procedure SetTitulos(const ATitulos: TTituloNaoLiquidadoList);
    property DataConsulta: TDateTime read GetDataConsulta write SetDataConsulta;
    property Titulos: TTituloNaoLiquidadoList read GetTitulos write SetTitulos;
  end;

  TTituloNaoLiquidadoMapList = class;

  ITituloNaoLiquidadoMapList = interface
	['{2CB43354-6A47-4DB1-AC71-FEEE4E46FE14}']
    function GetReference: TTituloNaoLiquidadoMapList;
    function GetItems(AIndex: Integer): ITituloNaoLiquidadoMap;
    procedure SetItems(AIndex: Integer; const Value: ITituloNaoLiquidadoMap);
    procedure Add(const ATituloNaoLiquidadoMap: ITituloNaoLiquidadoMap);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ITituloNaoLiquidadoMap read GetItems write SetItems; default;
  end;

  TTituloNaoLiquidadoMapListEnumerator = class
  private
    FIndex: Integer;
    FTituloNaoLiquidadoMapList: TTituloNaoLiquidadoMapList;
  public
    constructor Create(ATituloNaoLiquidadoMapList: TTituloNaoLiquidadoMapList);
    function GetCurrent: ITituloNaoLiquidadoMap; inline;
    function MoveNext: Boolean;
    property Current: ITituloNaoLiquidadoMap read GetCurrent;
  end;

  TTituloNaoLiquidadoMapList = class(TInterfacedObject, ITituloNaoLiquidadoMapList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ITituloNaoLiquidadoMap;
    procedure SetItems(AIndex: Integer; const Value: ITituloNaoLiquidadoMap);
  public
    constructor Create;
    procedure Add(const ATituloNaoLiquidadoMap: ITituloNaoLiquidadoMap);
    destructor Destroy; override;
    function GetEnumerator: TTituloNaoLiquidadoMapListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TTituloNaoLiquidadoMapList;
    property Items[AIndex: Integer]: ITituloNaoLiquidadoMap read GetItems write SetItems; default;
  end;

  TTituloNaoLiquidadoMapListRec = record
  private
    FList: ITituloNaoLiquidadoMapList;
  public
    class function Create(const AList: ITituloNaoLiquidadoMapList): TTituloNaoLiquidadoMapListRec; static;
    class operator Implicit(AListRec: TTituloNaoLiquidadoMapListRec): TTituloNaoLiquidadoMapList;
  end;

  TTituloNaoLiquidadoMap = class(TInterfacedModel, ITituloNaoLiquidadoMap)
  private
	FDataConsulta: TDateTime;
	FTitulos: TTituloNaoLiquidadoList;
    function GetDataConsulta: TDateTime;
    procedure SetDataConsulta(const ADataConsulta: TDateTime);
    function GetTitulos: TTituloNaoLiquidadoList;
    procedure SetTitulos(const ATitulos: TTituloNaoLiquidadoList);
  published
    property DataConsulta: TDateTime read GetDataConsulta write SetDataConsulta;
    property Titulos: TTituloNaoLiquidadoList read GetTitulos write SetTitulos;
  end;

implementation

{ TTituloNaoLiquidadoMapList }

procedure TTituloNaoLiquidadoMapList.Add(const ATituloNaoLiquidadoMap: ITituloNaoLiquidadoMap);
begin
  FList.Add(ATituloNaoLiquidadoMap);
end;

procedure TTituloNaoLiquidadoMapList.Clear;
begin
  FList.Clear;
end;

function TTituloNaoLiquidadoMapList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TTituloNaoLiquidadoMapList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TTituloNaoLiquidadoMapList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TTituloNaoLiquidadoMapList.GetEnumerator: TTituloNaoLiquidadoMapListEnumerator;
begin
  Result := TTituloNaoLiquidadoMapListEnumerator.Create(Self);
end;

function TTituloNaoLiquidadoMapList.GetItems(AIndex: Integer): ITituloNaoLiquidadoMap;
begin
  Result := FList[AIndex] as ITituloNaoLiquidadoMap;
end;

function TTituloNaoLiquidadoMapList.GetReference: TTituloNaoLiquidadoMapList;
begin
  Result := Self;
end;

procedure TTituloNaoLiquidadoMapList.SetItems(AIndex: Integer; const Value: ITituloNaoLiquidadoMap);
begin
  FList[AIndex] := Value;
end;

{ TTituloNaoLiquidadoMapListEnumerator }

constructor TTituloNaoLiquidadoMapListEnumerator.Create(ATituloNaoLiquidadoMapList: TTituloNaoLiquidadoMapList);
begin
  inherited Create;
  FIndex := -1;
  FTituloNaoLiquidadoMapList := ATituloNaoLiquidadoMapList;
end;

function TTituloNaoLiquidadoMapListEnumerator.GetCurrent: ITituloNaoLiquidadoMap;
begin
  Result := FTituloNaoLiquidadoMapList[FIndex];
end;

function TTituloNaoLiquidadoMapListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FTituloNaoLiquidadoMapList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TTituloNaoLiquidadoMapListRec }

class function TTituloNaoLiquidadoMapListRec.Create(const AList: ITituloNaoLiquidadoMapList): TTituloNaoLiquidadoMapListRec;
begin
  FillChar(Result, SizeOf(TTituloNaoLiquidadoMapListRec), 0);
  Result.FList := AList;
end;

class operator TTituloNaoLiquidadoMapListRec.Implicit(AListRec: TTituloNaoLiquidadoMapListRec): TTituloNaoLiquidadoMapList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TTituloNaoLiquidadoMap }

function TTituloNaoLiquidadoMap.GetDataConsulta: TDateTime;
begin
  Result := FDataConsulta;
end;

procedure TTituloNaoLiquidadoMap.SetDataConsulta(const ADataConsulta: TDateTime);
begin
  FDataConsulta := ADataConsulta;
end;

function TTituloNaoLiquidadoMap.GetTitulos: TTituloNaoLiquidadoList;
begin
  Result := FTitulos;
end;

procedure TTituloNaoLiquidadoMap.SetTitulos(const ATitulos: TTituloNaoLiquidadoList);
begin
  FTitulos := ATitulos;
end;


end.
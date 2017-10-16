unit SDK.Model.CancelamentoDeTituloAReceber;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ICancelamentoDeTituloAReceber = interface(IModel)
    ['{092862A3-57D5-4F46-9410-4CCAC228B034}']
    function GetDataDeCancelamento: TDateTime;
    procedure SetDataDeCancelamento(const ADataDeCancelamento: TDateTime);
    function GetMotivo: TString;
    procedure SetMotivo(const AMotivo: TString);
    property DataDeCancelamento: TDateTime read GetDataDeCancelamento write SetDataDeCancelamento;
    property Motivo: TString read GetMotivo write SetMotivo;
  end;

  TCancelamentoDeTituloAReceberList = class;

  ICancelamentoDeTituloAReceberList = interface
	['{8F275A6B-532F-4780-B9A0-B689EBF1CC94}']
    function GetReference: TCancelamentoDeTituloAReceberList;
    function GetItems(AIndex: Integer): ICancelamentoDeTituloAReceber;
    procedure SetItems(AIndex: Integer; const Value: ICancelamentoDeTituloAReceber);
    procedure Add(const ACancelamentoDeTituloAReceber: ICancelamentoDeTituloAReceber);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ICancelamentoDeTituloAReceber read GetItems write SetItems; default;
  end;

  TCancelamentoDeTituloAReceberListEnumerator = class
  private
    FIndex: Integer;
    FCancelamentoDeTituloAReceberList: TCancelamentoDeTituloAReceberList;
  public
    constructor Create(ACancelamentoDeTituloAReceberList: TCancelamentoDeTituloAReceberList);
    function GetCurrent: ICancelamentoDeTituloAReceber; inline;
    function MoveNext: Boolean;
    property Current: ICancelamentoDeTituloAReceber read GetCurrent;
  end;

  TCancelamentoDeTituloAReceberList = class(TInterfacedObject, ICancelamentoDeTituloAReceberList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ICancelamentoDeTituloAReceber;
    procedure SetItems(AIndex: Integer; const Value: ICancelamentoDeTituloAReceber);
  public
    constructor Create;
    procedure Add(const ACancelamentoDeTituloAReceber: ICancelamentoDeTituloAReceber);
    destructor Destroy; override;
    function GetEnumerator: TCancelamentoDeTituloAReceberListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TCancelamentoDeTituloAReceberList;
    property Items[AIndex: Integer]: ICancelamentoDeTituloAReceber read GetItems write SetItems; default;
  end;

  TCancelamentoDeTituloAReceberListRec = record
  private
    FList: ICancelamentoDeTituloAReceberList;
  public
    class function Create(const AList: ICancelamentoDeTituloAReceberList): TCancelamentoDeTituloAReceberListRec; static;
    class operator Implicit(AListRec: TCancelamentoDeTituloAReceberListRec): TCancelamentoDeTituloAReceberList;
  end;

  TCancelamentoDeTituloAReceber = class(TInterfacedModel, ICancelamentoDeTituloAReceber)
  private
	FDataDeCancelamento: TDateTime;
	FMotivo: TString;
    function GetDataDeCancelamento: TDateTime;
    procedure SetDataDeCancelamento(const ADataDeCancelamento: TDateTime);
    function GetMotivo: TString;
    procedure SetMotivo(const AMotivo: TString);
  public
    property DataDeCancelamento: TDateTime read GetDataDeCancelamento write SetDataDeCancelamento;
    property Motivo: TString read GetMotivo write SetMotivo;
  end;

implementation

{ TCancelamentoDeTituloAReceberList }

procedure TCancelamentoDeTituloAReceberList.Add(const ACancelamentoDeTituloAReceber: ICancelamentoDeTituloAReceber);
begin
  FList.Add(ACancelamentoDeTituloAReceber);
end;

procedure TCancelamentoDeTituloAReceberList.Clear;
begin
  FList.Clear;
end;

function TCancelamentoDeTituloAReceberList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TCancelamentoDeTituloAReceberList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TCancelamentoDeTituloAReceberList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TCancelamentoDeTituloAReceberList.GetEnumerator: TCancelamentoDeTituloAReceberListEnumerator;
begin
  Result := TCancelamentoDeTituloAReceberListEnumerator.Create(Self);
end;

function TCancelamentoDeTituloAReceberList.GetItems(AIndex: Integer): ICancelamentoDeTituloAReceber;
begin
  Result := FList[AIndex] as ICancelamentoDeTituloAReceber;
end;

function TCancelamentoDeTituloAReceberList.GetReference: TCancelamentoDeTituloAReceberList;
begin
  Result := Self;
end;

procedure TCancelamentoDeTituloAReceberList.SetItems(AIndex: Integer; const Value: ICancelamentoDeTituloAReceber);
begin
  FList[AIndex] := Value;
end;

{ TCancelamentoDeTituloAReceberListEnumerator }

constructor TCancelamentoDeTituloAReceberListEnumerator.Create(ACancelamentoDeTituloAReceberList: TCancelamentoDeTituloAReceberList);
begin
  inherited Create;
  FIndex := -1;
  FCancelamentoDeTituloAReceberList := ACancelamentoDeTituloAReceberList;
end;

function TCancelamentoDeTituloAReceberListEnumerator.GetCurrent: ICancelamentoDeTituloAReceber;
begin
  Result := FCancelamentoDeTituloAReceberList[FIndex];
end;

function TCancelamentoDeTituloAReceberListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FCancelamentoDeTituloAReceberList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TCancelamentoDeTituloAReceberListRec }

class function TCancelamentoDeTituloAReceberListRec.Create(const AList: ICancelamentoDeTituloAReceberList): TCancelamentoDeTituloAReceberListRec;
begin
  FillChar(Result, SizeOf(TCancelamentoDeTituloAReceberListRec), 0);
  Result.FList := AList;
end;

class operator TCancelamentoDeTituloAReceberListRec.Implicit(AListRec: TCancelamentoDeTituloAReceberListRec): TCancelamentoDeTituloAReceberList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TCancelamentoDeTituloAReceber }

function TCancelamentoDeTituloAReceber.GetDataDeCancelamento: TDateTime;
begin
  Result := FDataDeCancelamento;
end;

procedure TCancelamentoDeTituloAReceber.SetDataDeCancelamento(const ADataDeCancelamento: TDateTime);
begin
  FDataDeCancelamento := ADataDeCancelamento;
end;

function TCancelamentoDeTituloAReceber.GetMotivo: TString;
begin
  Result := FMotivo;
end;

procedure TCancelamentoDeTituloAReceber.SetMotivo(const AMotivo: TString);
begin
  FMotivo := AMotivo;
end;


end.
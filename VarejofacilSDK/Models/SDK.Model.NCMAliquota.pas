unit SDK.Model.NCMAliquota;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  INCMAliquota = interface(IModel)
    ['{6E95BAD1-87D1-434C-AEB7-10369271A31A}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetUf: TString;
    procedure SetUf(const AUf: TString);
    function GetImportado: Double;
    procedure SetImportado(const AImportado: Double);
    function GetNacional: Double;
    procedure SetNacional(const ANacional: Double);
    function GetEstadual: Double;
    procedure SetEstadual(const AEstadual: Double);
    function GetMunicipal: Double;
    procedure SetMunicipal(const AMunicipal: Double);
    property Id: Int64 read GetId write SetId;
    property Uf: TString read GetUf write SetUf;
    property Importado: Double read GetImportado write SetImportado;
    property Nacional: Double read GetNacional write SetNacional;
    property Estadual: Double read GetEstadual write SetEstadual;
    property Municipal: Double read GetMunicipal write SetMunicipal;
  end;

  TNCMAliquotaList = class;

  INCMAliquotaList = interface
	['{4ABE63E1-20C6-4A86-B4BE-57652AC925BD}']
    function GetReference: TNCMAliquotaList;
    function GetItems(AIndex: Integer): INCMAliquota;
    procedure SetItems(AIndex: Integer; const Value: INCMAliquota);
    procedure Add(const ANCMAliquota: INCMAliquota);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: INCMAliquota read GetItems write SetItems; default;
  end;

  TNCMAliquotaListEnumerator = class
  private
    FIndex: Integer;
    FNCMAliquotaList: TNCMAliquotaList;
  public
    constructor Create(ANCMAliquotaList: TNCMAliquotaList);
    function GetCurrent: INCMAliquota; inline;
    function MoveNext: Boolean;
    property Current: INCMAliquota read GetCurrent;
  end;

  TNCMAliquotaList = class(TInterfacedObject, INCMAliquotaList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): INCMAliquota;
    procedure SetItems(AIndex: Integer; const Value: INCMAliquota);
  public
    constructor Create;
    procedure Add(const ANCMAliquota: INCMAliquota);
    destructor Destroy; override;
    function GetEnumerator: TNCMAliquotaListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TNCMAliquotaList;
    property Items[AIndex: Integer]: INCMAliquota read GetItems write SetItems; default;
  end;

  TNCMAliquotaListRec = record
  private
    FList: INCMAliquotaList;
  public
    class function Create(const AList: INCMAliquotaList): TNCMAliquotaListRec; static;
    class operator Implicit(AListRec: TNCMAliquotaListRec): TNCMAliquotaList;
  end;

  TNCMAliquota = class(TInterfacedModel, INCMAliquota)
  private
	FId: Int64;
	FUf: TString;
	FImportado: Double;
	FNacional: Double;
	FEstadual: Double;
	FMunicipal: Double;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetUf: TString;
    procedure SetUf(const AUf: TString);
    function GetImportado: Double;
    procedure SetImportado(const AImportado: Double);
    function GetNacional: Double;
    procedure SetNacional(const ANacional: Double);
    function GetEstadual: Double;
    procedure SetEstadual(const AEstadual: Double);
    function GetMunicipal: Double;
    procedure SetMunicipal(const AMunicipal: Double);
  published
    property Id: Int64 read GetId write SetId;
    property Uf: TString read GetUf write SetUf;
    property Importado: Double read GetImportado write SetImportado;
    property Nacional: Double read GetNacional write SetNacional;
    property Estadual: Double read GetEstadual write SetEstadual;
    property Municipal: Double read GetMunicipal write SetMunicipal;
  end;

implementation

{ TNCMAliquotaList }

procedure TNCMAliquotaList.Add(const ANCMAliquota: INCMAliquota);
begin
  FList.Add(ANCMAliquota);
end;

procedure TNCMAliquotaList.Clear;
begin
  FList.Clear;
end;

function TNCMAliquotaList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TNCMAliquotaList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TNCMAliquotaList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TNCMAliquotaList.GetEnumerator: TNCMAliquotaListEnumerator;
begin
  Result := TNCMAliquotaListEnumerator.Create(Self);
end;

function TNCMAliquotaList.GetItems(AIndex: Integer): INCMAliquota;
begin
  Result := FList[AIndex] as INCMAliquota;
end;

function TNCMAliquotaList.GetReference: TNCMAliquotaList;
begin
  Result := Self;
end;

procedure TNCMAliquotaList.SetItems(AIndex: Integer; const Value: INCMAliquota);
begin
  FList[AIndex] := Value;
end;

{ TNCMAliquotaListEnumerator }

constructor TNCMAliquotaListEnumerator.Create(ANCMAliquotaList: TNCMAliquotaList);
begin
  inherited Create;
  FIndex := -1;
  FNCMAliquotaList := ANCMAliquotaList;
end;

function TNCMAliquotaListEnumerator.GetCurrent: INCMAliquota;
begin
  Result := FNCMAliquotaList[FIndex];
end;

function TNCMAliquotaListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FNCMAliquotaList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TNCMAliquotaListRec }

class function TNCMAliquotaListRec.Create(const AList: INCMAliquotaList): TNCMAliquotaListRec;
begin
  FillChar(Result, SizeOf(TNCMAliquotaListRec), 0);
  Result.FList := AList;
end;

class operator TNCMAliquotaListRec.Implicit(AListRec: TNCMAliquotaListRec): TNCMAliquotaList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TNCMAliquota }

function TNCMAliquota.GetId: Int64;
begin
  Result := FId;
end;

procedure TNCMAliquota.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TNCMAliquota.GetUf: TString;
begin
  Result := FUf;
end;

procedure TNCMAliquota.SetUf(const AUf: TString);
begin
  FUf := AUf;
end;

function TNCMAliquota.GetImportado: Double;
begin
  Result := FImportado;
end;

procedure TNCMAliquota.SetImportado(const AImportado: Double);
begin
  FImportado := AImportado;
end;

function TNCMAliquota.GetNacional: Double;
begin
  Result := FNacional;
end;

procedure TNCMAliquota.SetNacional(const ANacional: Double);
begin
  FNacional := ANacional;
end;

function TNCMAliquota.GetEstadual: Double;
begin
  Result := FEstadual;
end;

procedure TNCMAliquota.SetEstadual(const AEstadual: Double);
begin
  FEstadual := AEstadual;
end;

function TNCMAliquota.GetMunicipal: Double;
begin
  Result := FMunicipal;
end;

procedure TNCMAliquota.SetMunicipal(const AMunicipal: Double);
begin
  FMunicipal := AMunicipal;
end;


end.
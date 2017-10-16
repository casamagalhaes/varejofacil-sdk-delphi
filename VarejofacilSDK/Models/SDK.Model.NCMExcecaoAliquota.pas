unit SDK.Model.NCMExcecaoAliquota;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  INCMExcecaoAliquota = interface(IModel)
    ['{381C52D8-57FD-4CE5-A7C3-E3DB404790FF}']
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

  TNCMExcecaoAliquotaList = class;

  INCMExcecaoAliquotaList = interface
	['{798AA416-423D-4CC0-96C4-E94F9A87756A}']
    function GetReference: TNCMExcecaoAliquotaList;
    function GetItems(AIndex: Integer): INCMExcecaoAliquota;
    procedure SetItems(AIndex: Integer; const Value: INCMExcecaoAliquota);
    procedure Add(const ANCMExcecaoAliquota: INCMExcecaoAliquota);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: INCMExcecaoAliquota read GetItems write SetItems; default;
  end;

  TNCMExcecaoAliquotaListEnumerator = class
  private
    FIndex: Integer;
    FNCMExcecaoAliquotaList: TNCMExcecaoAliquotaList;
  public
    constructor Create(ANCMExcecaoAliquotaList: TNCMExcecaoAliquotaList);
    function GetCurrent: INCMExcecaoAliquota; inline;
    function MoveNext: Boolean;
    property Current: INCMExcecaoAliquota read GetCurrent;
  end;

  TNCMExcecaoAliquotaList = class(TInterfacedObject, INCMExcecaoAliquotaList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): INCMExcecaoAliquota;
    procedure SetItems(AIndex: Integer; const Value: INCMExcecaoAliquota);
  public
    constructor Create;
    procedure Add(const ANCMExcecaoAliquota: INCMExcecaoAliquota);
    destructor Destroy; override;
    function GetEnumerator: TNCMExcecaoAliquotaListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TNCMExcecaoAliquotaList;
    property Items[AIndex: Integer]: INCMExcecaoAliquota read GetItems write SetItems; default;
  end;

  TNCMExcecaoAliquotaListRec = record
  private
    FList: INCMExcecaoAliquotaList;
  public
    class function Create(const AList: INCMExcecaoAliquotaList): TNCMExcecaoAliquotaListRec; static;
    class operator Implicit(AListRec: TNCMExcecaoAliquotaListRec): TNCMExcecaoAliquotaList;
  end;

  TNCMExcecaoAliquota = class(TInterfacedModel, INCMExcecaoAliquota)
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
  public
    property Id: Int64 read GetId write SetId;
    property Uf: TString read GetUf write SetUf;
    property Importado: Double read GetImportado write SetImportado;
    property Nacional: Double read GetNacional write SetNacional;
    property Estadual: Double read GetEstadual write SetEstadual;
    property Municipal: Double read GetMunicipal write SetMunicipal;
  end;

implementation

{ TNCMExcecaoAliquotaList }

procedure TNCMExcecaoAliquotaList.Add(const ANCMExcecaoAliquota: INCMExcecaoAliquota);
begin
  FList.Add(ANCMExcecaoAliquota);
end;

procedure TNCMExcecaoAliquotaList.Clear;
begin
  FList.Clear;
end;

function TNCMExcecaoAliquotaList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TNCMExcecaoAliquotaList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TNCMExcecaoAliquotaList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TNCMExcecaoAliquotaList.GetEnumerator: TNCMExcecaoAliquotaListEnumerator;
begin
  Result := TNCMExcecaoAliquotaListEnumerator.Create(Self);
end;

function TNCMExcecaoAliquotaList.GetItems(AIndex: Integer): INCMExcecaoAliquota;
begin
  Result := FList[AIndex] as INCMExcecaoAliquota;
end;

function TNCMExcecaoAliquotaList.GetReference: TNCMExcecaoAliquotaList;
begin
  Result := Self;
end;

procedure TNCMExcecaoAliquotaList.SetItems(AIndex: Integer; const Value: INCMExcecaoAliquota);
begin
  FList[AIndex] := Value;
end;

{ TNCMExcecaoAliquotaListEnumerator }

constructor TNCMExcecaoAliquotaListEnumerator.Create(ANCMExcecaoAliquotaList: TNCMExcecaoAliquotaList);
begin
  inherited Create;
  FIndex := -1;
  FNCMExcecaoAliquotaList := ANCMExcecaoAliquotaList;
end;

function TNCMExcecaoAliquotaListEnumerator.GetCurrent: INCMExcecaoAliquota;
begin
  Result := FNCMExcecaoAliquotaList[FIndex];
end;

function TNCMExcecaoAliquotaListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FNCMExcecaoAliquotaList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TNCMExcecaoAliquotaListRec }

class function TNCMExcecaoAliquotaListRec.Create(const AList: INCMExcecaoAliquotaList): TNCMExcecaoAliquotaListRec;
begin
  FillChar(Result, SizeOf(TNCMExcecaoAliquotaListRec), 0);
  Result.FList := AList;
end;

class operator TNCMExcecaoAliquotaListRec.Implicit(AListRec: TNCMExcecaoAliquotaListRec): TNCMExcecaoAliquotaList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TNCMExcecaoAliquota }

function TNCMExcecaoAliquota.GetId: Int64;
begin
  Result := FId;
end;

procedure TNCMExcecaoAliquota.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TNCMExcecaoAliquota.GetUf: TString;
begin
  Result := FUf;
end;

procedure TNCMExcecaoAliquota.SetUf(const AUf: TString);
begin
  FUf := AUf;
end;

function TNCMExcecaoAliquota.GetImportado: Double;
begin
  Result := FImportado;
end;

procedure TNCMExcecaoAliquota.SetImportado(const AImportado: Double);
begin
  FImportado := AImportado;
end;

function TNCMExcecaoAliquota.GetNacional: Double;
begin
  Result := FNacional;
end;

procedure TNCMExcecaoAliquota.SetNacional(const ANacional: Double);
begin
  FNacional := ANacional;
end;

function TNCMExcecaoAliquota.GetEstadual: Double;
begin
  Result := FEstadual;
end;

procedure TNCMExcecaoAliquota.SetEstadual(const AEstadual: Double);
begin
  FEstadual := AEstadual;
end;

function TNCMExcecaoAliquota.GetMunicipal: Double;
begin
  Result := FMunicipal;
end;

procedure TNCMExcecaoAliquota.SetMunicipal(const AMunicipal: Double);
begin
  FMunicipal := AMunicipal;
end;


end.
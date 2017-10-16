unit SDK.Model.NCM;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  INCM = interface(IModel)
    ['{B6E40182-550D-435C-8887-21C19BA1921C}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetAliquotaIPI: Double;
    procedure SetAliquotaIPI(const AAliquotaIPI: Double);
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property AliquotaIPI: Double read GetAliquotaIPI write SetAliquotaIPI;
  end;

  TNCMList = class;

  INCMList = interface
	['{A63BC240-425C-4059-8999-4D11A7901C48}']
    function GetReference: TNCMList;
    function GetItems(AIndex: Integer): INCM;
    procedure SetItems(AIndex: Integer; const Value: INCM);
    procedure Add(const ANCM: INCM);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: INCM read GetItems write SetItems; default;
  end;

  TNCMListEnumerator = class
  private
    FIndex: Integer;
    FNCMList: TNCMList;
  public
    constructor Create(ANCMList: TNCMList);
    function GetCurrent: INCM; inline;
    function MoveNext: Boolean;
    property Current: INCM read GetCurrent;
  end;

  TNCMList = class(TInterfacedObject, INCMList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): INCM;
    procedure SetItems(AIndex: Integer; const Value: INCM);
  public
    constructor Create;
    procedure Add(const ANCM: INCM);
    destructor Destroy; override;
    function GetEnumerator: TNCMListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TNCMList;
    property Items[AIndex: Integer]: INCM read GetItems write SetItems; default;
  end;

  TNCMListRec = record
  private
    FList: INCMList;
  public
    class function Create(const AList: INCMList): TNCMListRec; static;
    class operator Implicit(AListRec: TNCMListRec): TNCMList;
  end;

  TNCM = class(TInterfacedModel, INCM)
  private
	FId: Int64;
	FDescricao: TString;
	FAliquotaIPI: Double;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetAliquotaIPI: Double;
    procedure SetAliquotaIPI(const AAliquotaIPI: Double);
  public
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property AliquotaIPI: Double read GetAliquotaIPI write SetAliquotaIPI;
  end;

implementation

{ TNCMList }

procedure TNCMList.Add(const ANCM: INCM);
begin
  FList.Add(ANCM);
end;

procedure TNCMList.Clear;
begin
  FList.Clear;
end;

function TNCMList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TNCMList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TNCMList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TNCMList.GetEnumerator: TNCMListEnumerator;
begin
  Result := TNCMListEnumerator.Create(Self);
end;

function TNCMList.GetItems(AIndex: Integer): INCM;
begin
  Result := FList[AIndex] as INCM;
end;

function TNCMList.GetReference: TNCMList;
begin
  Result := Self;
end;

procedure TNCMList.SetItems(AIndex: Integer; const Value: INCM);
begin
  FList[AIndex] := Value;
end;

{ TNCMListEnumerator }

constructor TNCMListEnumerator.Create(ANCMList: TNCMList);
begin
  inherited Create;
  FIndex := -1;
  FNCMList := ANCMList;
end;

function TNCMListEnumerator.GetCurrent: INCM;
begin
  Result := FNCMList[FIndex];
end;

function TNCMListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FNCMList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TNCMListRec }

class function TNCMListRec.Create(const AList: INCMList): TNCMListRec;
begin
  FillChar(Result, SizeOf(TNCMListRec), 0);
  Result.FList := AList;
end;

class operator TNCMListRec.Implicit(AListRec: TNCMListRec): TNCMList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TNCM }

function TNCM.GetId: Int64;
begin
  Result := FId;
end;

procedure TNCM.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TNCM.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TNCM.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

function TNCM.GetAliquotaIPI: Double;
begin
  Result := FAliquotaIPI;
end;

procedure TNCM.SetAliquotaIPI(const AAliquotaIPI: Double);
begin
  FAliquotaIPI := AAliquotaIPI;
end;


end.
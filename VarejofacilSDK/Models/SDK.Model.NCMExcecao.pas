unit SDK.Model.NCMExcecao;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums, SDK.Model.NCMExcecaoAliquota;

type

  INCMExcecao = interface(IModel)
    ['{EC57EAF5-05DC-4FB5-A68D-BB0DA82C4F5F}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetAliquotaIPI: Double;
    procedure SetAliquotaIPI(const AAliquotaIPI: Double);
    function GetAliquotas: TNCMExcecaoAliquotaList;
    procedure SetAliquotas(const AAliquotas: TNCMExcecaoAliquotaList);
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property AliquotaIPI: Double read GetAliquotaIPI write SetAliquotaIPI;
    property Aliquotas: TNCMExcecaoAliquotaList read GetAliquotas write SetAliquotas;
  end;

  TNCMExcecaoList = class;

  INCMExcecaoList = interface
	['{0F8E4D4F-CA8C-4D0B-A27A-62839BCDDAFA}']
    function GetReference: TNCMExcecaoList;
    function GetItems(AIndex: Integer): INCMExcecao;
    procedure SetItems(AIndex: Integer; const Value: INCMExcecao);
    procedure Add(const ANCMExcecao: INCMExcecao);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: INCMExcecao read GetItems write SetItems; default;
  end;

  TNCMExcecaoListEnumerator = class
  private
    FIndex: Integer;
    FNCMExcecaoList: TNCMExcecaoList;
  public
    constructor Create(ANCMExcecaoList: TNCMExcecaoList);
    function GetCurrent: INCMExcecao; inline;
    function MoveNext: Boolean;
    property Current: INCMExcecao read GetCurrent;
  end;

  TNCMExcecaoList = class(TInterfacedObject, INCMExcecaoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): INCMExcecao;
    procedure SetItems(AIndex: Integer; const Value: INCMExcecao);
  public
    constructor Create;
    procedure Add(const ANCMExcecao: INCMExcecao);
    destructor Destroy; override;
    function GetEnumerator: TNCMExcecaoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TNCMExcecaoList;
    property Items[AIndex: Integer]: INCMExcecao read GetItems write SetItems; default;
  end;

  TNCMExcecaoListRec = record
  private
    FList: INCMExcecaoList;
  public
    class function Create(const AList: INCMExcecaoList): TNCMExcecaoListRec; static;
    class operator Implicit(AListRec: TNCMExcecaoListRec): TNCMExcecaoList;
  end;

  TNCMExcecao = class(TInterfacedModel, INCMExcecao)
  private
	FId: Int64;
	FDescricao: TString;
	FAliquotaIPI: Double;
	FAliquotas: TNCMExcecaoAliquotaList;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetAliquotaIPI: Double;
    procedure SetAliquotaIPI(const AAliquotaIPI: Double);
    function GetAliquotas: TNCMExcecaoAliquotaList;
    procedure SetAliquotas(const AAliquotas: TNCMExcecaoAliquotaList);
  public
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property AliquotaIPI: Double read GetAliquotaIPI write SetAliquotaIPI;
    property Aliquotas: TNCMExcecaoAliquotaList read GetAliquotas write SetAliquotas;
  end;

implementation

{ TNCMExcecaoList }

procedure TNCMExcecaoList.Add(const ANCMExcecao: INCMExcecao);
begin
  FList.Add(ANCMExcecao);
end;

procedure TNCMExcecaoList.Clear;
begin
  FList.Clear;
end;

function TNCMExcecaoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TNCMExcecaoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TNCMExcecaoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TNCMExcecaoList.GetEnumerator: TNCMExcecaoListEnumerator;
begin
  Result := TNCMExcecaoListEnumerator.Create(Self);
end;

function TNCMExcecaoList.GetItems(AIndex: Integer): INCMExcecao;
begin
  Result := FList[AIndex] as INCMExcecao;
end;

function TNCMExcecaoList.GetReference: TNCMExcecaoList;
begin
  Result := Self;
end;

procedure TNCMExcecaoList.SetItems(AIndex: Integer; const Value: INCMExcecao);
begin
  FList[AIndex] := Value;
end;

{ TNCMExcecaoListEnumerator }

constructor TNCMExcecaoListEnumerator.Create(ANCMExcecaoList: TNCMExcecaoList);
begin
  inherited Create;
  FIndex := -1;
  FNCMExcecaoList := ANCMExcecaoList;
end;

function TNCMExcecaoListEnumerator.GetCurrent: INCMExcecao;
begin
  Result := FNCMExcecaoList[FIndex];
end;

function TNCMExcecaoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FNCMExcecaoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TNCMExcecaoListRec }

class function TNCMExcecaoListRec.Create(const AList: INCMExcecaoList): TNCMExcecaoListRec;
begin
  FillChar(Result, SizeOf(TNCMExcecaoListRec), 0);
  Result.FList := AList;
end;

class operator TNCMExcecaoListRec.Implicit(AListRec: TNCMExcecaoListRec): TNCMExcecaoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TNCMExcecao }

function TNCMExcecao.GetId: Int64;
begin
  Result := FId;
end;

procedure TNCMExcecao.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TNCMExcecao.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TNCMExcecao.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

function TNCMExcecao.GetAliquotaIPI: Double;
begin
  Result := FAliquotaIPI;
end;

procedure TNCMExcecao.SetAliquotaIPI(const AAliquotaIPI: Double);
begin
  FAliquotaIPI := AAliquotaIPI;
end;

function TNCMExcecao.GetAliquotas: TNCMExcecaoAliquotaList;
begin
  Result := FAliquotas;
end;

procedure TNCMExcecao.SetAliquotas(const AAliquotas: TNCMExcecaoAliquotaList);
begin
  FAliquotas := AAliquotas;
end;


end.
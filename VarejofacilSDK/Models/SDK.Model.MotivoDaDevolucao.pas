unit SDK.Model.MotivoDaDevolucao;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IMotivoDaDevolucao = interface(IModel)
    ['{00910C63-9A00-4F87-ADF5-3A88BF94960E}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
  end;

  TMotivoDaDevolucaoList = class;

  IMotivoDaDevolucaoList = interface
	['{5311819F-7BCA-4EE2-BFC4-F8B6D59B39A1}']
    function GetReference: TMotivoDaDevolucaoList;
    function GetItems(AIndex: Integer): IMotivoDaDevolucao;
    procedure SetItems(AIndex: Integer; const Value: IMotivoDaDevolucao);
    procedure Add(const AMotivoDaDevolucao: IMotivoDaDevolucao);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IMotivoDaDevolucao read GetItems write SetItems; default;
  end;

  TMotivoDaDevolucaoListEnumerator = class
  private
    FIndex: Integer;
    FMotivoDaDevolucaoList: TMotivoDaDevolucaoList;
  public
    constructor Create(AMotivoDaDevolucaoList: TMotivoDaDevolucaoList);
    function GetCurrent: IMotivoDaDevolucao; inline;
    function MoveNext: Boolean;
    property Current: IMotivoDaDevolucao read GetCurrent;
  end;

  TMotivoDaDevolucaoList = class(TInterfacedObject, IMotivoDaDevolucaoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IMotivoDaDevolucao;
    procedure SetItems(AIndex: Integer; const Value: IMotivoDaDevolucao);
  public
    constructor Create;
    procedure Add(const AMotivoDaDevolucao: IMotivoDaDevolucao);
    destructor Destroy; override;
    function GetEnumerator: TMotivoDaDevolucaoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TMotivoDaDevolucaoList;
    property Items[AIndex: Integer]: IMotivoDaDevolucao read GetItems write SetItems; default;
  end;

  TMotivoDaDevolucaoListRec = record
  private
    FList: IMotivoDaDevolucaoList;
  public
    class function Create(const AList: IMotivoDaDevolucaoList): TMotivoDaDevolucaoListRec; static;
    class operator Implicit(AListRec: TMotivoDaDevolucaoListRec): TMotivoDaDevolucaoList;
  end;

  TMotivoDaDevolucao = class(TInterfacedModel, IMotivoDaDevolucao)
  private
	FId: Int64;
	FDescricao: TString;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
  published
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
  end;

implementation

{ TMotivoDaDevolucaoList }

procedure TMotivoDaDevolucaoList.Add(const AMotivoDaDevolucao: IMotivoDaDevolucao);
begin
  FList.Add(AMotivoDaDevolucao);
end;

procedure TMotivoDaDevolucaoList.Clear;
begin
  FList.Clear;
end;

function TMotivoDaDevolucaoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TMotivoDaDevolucaoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TMotivoDaDevolucaoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TMotivoDaDevolucaoList.GetEnumerator: TMotivoDaDevolucaoListEnumerator;
begin
  Result := TMotivoDaDevolucaoListEnumerator.Create(Self);
end;

function TMotivoDaDevolucaoList.GetItems(AIndex: Integer): IMotivoDaDevolucao;
begin
  Result := FList[AIndex] as IMotivoDaDevolucao;
end;

function TMotivoDaDevolucaoList.GetReference: TMotivoDaDevolucaoList;
begin
  Result := Self;
end;

procedure TMotivoDaDevolucaoList.SetItems(AIndex: Integer; const Value: IMotivoDaDevolucao);
begin
  FList[AIndex] := Value;
end;

{ TMotivoDaDevolucaoListEnumerator }

constructor TMotivoDaDevolucaoListEnumerator.Create(AMotivoDaDevolucaoList: TMotivoDaDevolucaoList);
begin
  inherited Create;
  FIndex := -1;
  FMotivoDaDevolucaoList := AMotivoDaDevolucaoList;
end;

function TMotivoDaDevolucaoListEnumerator.GetCurrent: IMotivoDaDevolucao;
begin
  Result := FMotivoDaDevolucaoList[FIndex];
end;

function TMotivoDaDevolucaoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FMotivoDaDevolucaoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TMotivoDaDevolucaoListRec }

class function TMotivoDaDevolucaoListRec.Create(const AList: IMotivoDaDevolucaoList): TMotivoDaDevolucaoListRec;
begin
  FillChar(Result, SizeOf(TMotivoDaDevolucaoListRec), 0);
  Result.FList := AList;
end;

class operator TMotivoDaDevolucaoListRec.Implicit(AListRec: TMotivoDaDevolucaoListRec): TMotivoDaDevolucaoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TMotivoDaDevolucao }

function TMotivoDaDevolucao.GetId: Int64;
begin
  Result := FId;
end;

procedure TMotivoDaDevolucao.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TMotivoDaDevolucao.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TMotivoDaDevolucao.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;


end.
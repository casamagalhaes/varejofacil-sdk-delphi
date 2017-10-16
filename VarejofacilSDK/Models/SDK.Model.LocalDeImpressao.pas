unit SDK.Model.LocalDeImpressao;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ILocalDeImpressao = interface(IModel)
    ['{661E773B-F7E2-4FA7-9373-49C9408B3F93}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
  end;

  TLocalDeImpressaoList = class;

  ILocalDeImpressaoList = interface
	['{6874E65E-20D8-4135-ABE4-3BC85C60416B}']
    function GetReference: TLocalDeImpressaoList;
    function GetItems(AIndex: Integer): ILocalDeImpressao;
    procedure SetItems(AIndex: Integer; const Value: ILocalDeImpressao);
    procedure Add(const ALocalDeImpressao: ILocalDeImpressao);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ILocalDeImpressao read GetItems write SetItems; default;
  end;

  TLocalDeImpressaoListEnumerator = class
  private
    FIndex: Integer;
    FLocalDeImpressaoList: TLocalDeImpressaoList;
  public
    constructor Create(ALocalDeImpressaoList: TLocalDeImpressaoList);
    function GetCurrent: ILocalDeImpressao; inline;
    function MoveNext: Boolean;
    property Current: ILocalDeImpressao read GetCurrent;
  end;

  TLocalDeImpressaoList = class(TInterfacedObject, ILocalDeImpressaoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ILocalDeImpressao;
    procedure SetItems(AIndex: Integer; const Value: ILocalDeImpressao);
  public
    constructor Create;
    procedure Add(const ALocalDeImpressao: ILocalDeImpressao);
    destructor Destroy; override;
    function GetEnumerator: TLocalDeImpressaoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TLocalDeImpressaoList;
    property Items[AIndex: Integer]: ILocalDeImpressao read GetItems write SetItems; default;
  end;

  TLocalDeImpressaoListRec = record
  private
    FList: ILocalDeImpressaoList;
  public
    class function Create(const AList: ILocalDeImpressaoList): TLocalDeImpressaoListRec; static;
    class operator Implicit(AListRec: TLocalDeImpressaoListRec): TLocalDeImpressaoList;
  end;

  TLocalDeImpressao = class(TInterfacedModel, ILocalDeImpressao)
  private
	FId: Int64;
	FDescricao: TString;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
  public
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
  end;

implementation

{ TLocalDeImpressaoList }

procedure TLocalDeImpressaoList.Add(const ALocalDeImpressao: ILocalDeImpressao);
begin
  FList.Add(ALocalDeImpressao);
end;

procedure TLocalDeImpressaoList.Clear;
begin
  FList.Clear;
end;

function TLocalDeImpressaoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TLocalDeImpressaoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TLocalDeImpressaoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TLocalDeImpressaoList.GetEnumerator: TLocalDeImpressaoListEnumerator;
begin
  Result := TLocalDeImpressaoListEnumerator.Create(Self);
end;

function TLocalDeImpressaoList.GetItems(AIndex: Integer): ILocalDeImpressao;
begin
  Result := FList[AIndex] as ILocalDeImpressao;
end;

function TLocalDeImpressaoList.GetReference: TLocalDeImpressaoList;
begin
  Result := Self;
end;

procedure TLocalDeImpressaoList.SetItems(AIndex: Integer; const Value: ILocalDeImpressao);
begin
  FList[AIndex] := Value;
end;

{ TLocalDeImpressaoListEnumerator }

constructor TLocalDeImpressaoListEnumerator.Create(ALocalDeImpressaoList: TLocalDeImpressaoList);
begin
  inherited Create;
  FIndex := -1;
  FLocalDeImpressaoList := ALocalDeImpressaoList;
end;

function TLocalDeImpressaoListEnumerator.GetCurrent: ILocalDeImpressao;
begin
  Result := FLocalDeImpressaoList[FIndex];
end;

function TLocalDeImpressaoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FLocalDeImpressaoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TLocalDeImpressaoListRec }

class function TLocalDeImpressaoListRec.Create(const AList: ILocalDeImpressaoList): TLocalDeImpressaoListRec;
begin
  FillChar(Result, SizeOf(TLocalDeImpressaoListRec), 0);
  Result.FList := AList;
end;

class operator TLocalDeImpressaoListRec.Implicit(AListRec: TLocalDeImpressaoListRec): TLocalDeImpressaoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TLocalDeImpressao }

function TLocalDeImpressao.GetId: Int64;
begin
  Result := FId;
end;

procedure TLocalDeImpressao.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TLocalDeImpressao.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TLocalDeImpressao.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;


end.
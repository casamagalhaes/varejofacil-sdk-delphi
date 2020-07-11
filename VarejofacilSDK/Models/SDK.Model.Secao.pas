unit SDK.Model.Secao;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ISecao = interface(IModel)
    ['{04BC5296-0522-42A8-B650-713CC86D771F}']
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    property Id: Integer read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
  end;

  TSecaoList = class;

  ISecaoList = interface
	['{9494FC25-C90C-4010-B9AA-7A918B1E31A2}']
    function GetReference: TSecaoList;
    function GetItems(AIndex: Integer): ISecao;
    procedure SetItems(AIndex: Integer; const Value: ISecao);
    procedure Add(const ASecao: ISecao);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ISecao read GetItems write SetItems; default;
  end;

  TSecaoListEnumerator = class
  private
    FIndex: Integer;
    FSecaoList: TSecaoList;
  public
    constructor Create(ASecaoList: TSecaoList);
    function GetCurrent: ISecao; inline;
    function MoveNext: Boolean;
    property Current: ISecao read GetCurrent;
  end;

  TSecaoList = class(TInterfacedObject, ISecaoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ISecao;
    procedure SetItems(AIndex: Integer; const Value: ISecao);
  public
    constructor Create;
    procedure Add(const ASecao: ISecao);
    destructor Destroy; override;
    function GetEnumerator: TSecaoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TSecaoList;
    property Items[AIndex: Integer]: ISecao read GetItems write SetItems; default;
  end;

  TSecaoListRec = record
  private
    FList: ISecaoList;
  public
    class function Create(const AList: ISecaoList): TSecaoListRec; static;
    class operator Implicit(AListRec: TSecaoListRec): TSecaoList;
  end;

  TSecao = class(TInterfacedModel, ISecao)
  private
  	FId: Integer;
	  FDescricao: TString;
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
  published
    property Id: Integer read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
  end;

implementation

{ TSecaoList }

procedure TSecaoList.Add(const ASecao: ISecao);
begin
  FList.Add(ASecao);
end;

procedure TSecaoList.Clear;
begin
  FList.Clear;
end;

function TSecaoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TSecaoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TSecaoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TSecaoList.GetEnumerator: TSecaoListEnumerator;
begin
  Result := TSecaoListEnumerator.Create(Self);
end;

function TSecaoList.GetItems(AIndex: Integer): ISecao;
begin
  Result := FList[AIndex] as ISecao;
end;

function TSecaoList.GetReference: TSecaoList;
begin
  Result := Self;
end;

procedure TSecaoList.SetItems(AIndex: Integer; const Value: ISecao);
begin
  FList[AIndex] := Value;
end;

{ TSecaoListEnumerator }

constructor TSecaoListEnumerator.Create(ASecaoList: TSecaoList);
begin
  inherited Create;
  FIndex := -1;
  FSecaoList := ASecaoList;
end;

function TSecaoListEnumerator.GetCurrent: ISecao;
begin
  Result := FSecaoList[FIndex];
end;

function TSecaoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FSecaoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TSecaoListRec }

class function TSecaoListRec.Create(const AList: ISecaoList): TSecaoListRec;
begin
  FillChar(Result, SizeOf(TSecaoListRec), 0);
  Result.FList := AList;
end;

class operator TSecaoListRec.Implicit(AListRec: TSecaoListRec): TSecaoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TSecao }

function TSecao.GetId: Integer;
begin
  Result := FId;
end;

procedure TSecao.SetId(const AId: Integer);
begin
  FId := AId;
end;

function TSecao.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TSecao.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;


end.
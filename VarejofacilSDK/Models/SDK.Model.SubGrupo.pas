unit SDK.Model.SubGrupo;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ISubGrupo = interface(IModel)
    ['{DFD8B362-76C9-4E0A-AAAB-E1E348B82D22}']
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    property Id: Integer read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
  end;

  TSubGrupoList = class;

  ISubGrupoList = interface
	['{40BEE597-647D-46BE-9BDF-15B530674C7C}']
    function GetReference: TSubGrupoList;
    function GetItems(AIndex: Integer): ISubGrupo;
    procedure SetItems(AIndex: Integer; const Value: ISubGrupo);
    procedure Add(const ASubGrupo: ISubGrupo);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ISubGrupo read GetItems write SetItems; default;
  end;

  TSubGrupoListEnumerator = class
  private
    FIndex: Integer;
    FSubGrupoList: TSubGrupoList;
  public
    constructor Create(ASubGrupoList: TSubGrupoList);
    function GetCurrent: ISubGrupo; inline;
    function MoveNext: Boolean;
    property Current: ISubGrupo read GetCurrent;
  end;

  TSubGrupoList = class(TInterfacedObject, ISubGrupoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ISubGrupo;
    procedure SetItems(AIndex: Integer; const Value: ISubGrupo);
  public
    constructor Create;
    procedure Add(const ASubGrupo: ISubGrupo);
    destructor Destroy; override;
    function GetEnumerator: TSubGrupoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TSubGrupoList;
    property Items[AIndex: Integer]: ISubGrupo read GetItems write SetItems; default;
  end;

  TSubGrupoListRec = record
  private
    FList: ISubGrupoList;
  public
    class function Create(const AList: ISubGrupoList): TSubGrupoListRec; static;
    class operator Implicit(AListRec: TSubGrupoListRec): TSubGrupoList;
  end;

  TSubGrupo = class(TInterfacedModel, ISubGrupo)
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

{ TSubGrupoList }

procedure TSubGrupoList.Add(const ASubGrupo: ISubGrupo);
begin
  FList.Add(ASubGrupo);
end;

procedure TSubGrupoList.Clear;
begin
  FList.Clear;
end;

function TSubGrupoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TSubGrupoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TSubGrupoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TSubGrupoList.GetEnumerator: TSubGrupoListEnumerator;
begin
  Result := TSubGrupoListEnumerator.Create(Self);
end;

function TSubGrupoList.GetItems(AIndex: Integer): ISubGrupo;
begin
  Result := FList[AIndex] as ISubGrupo;
end;

function TSubGrupoList.GetReference: TSubGrupoList;
begin
  Result := Self;
end;

procedure TSubGrupoList.SetItems(AIndex: Integer; const Value: ISubGrupo);
begin
  FList[AIndex] := Value;
end;

{ TSubGrupoListEnumerator }

constructor TSubGrupoListEnumerator.Create(ASubGrupoList: TSubGrupoList);
begin
  inherited Create;
  FIndex := -1;
  FSubGrupoList := ASubGrupoList;
end;

function TSubGrupoListEnumerator.GetCurrent: ISubGrupo;
begin
  Result := FSubGrupoList[FIndex];
end;

function TSubGrupoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FSubGrupoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TSubGrupoListRec }

class function TSubGrupoListRec.Create(const AList: ISubGrupoList): TSubGrupoListRec;
begin
  FillChar(Result, SizeOf(TSubGrupoListRec), 0);
  Result.FList := AList;
end;

class operator TSubGrupoListRec.Implicit(AListRec: TSubGrupoListRec): TSubGrupoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TSubGrupo }

function TSubGrupo.GetId: Integer;
begin
  Result := FId;
end;

procedure TSubGrupo.SetId(const AId: Integer);
begin
  FId := AId;
end;

function TSubGrupo.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TSubGrupo.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;


end.
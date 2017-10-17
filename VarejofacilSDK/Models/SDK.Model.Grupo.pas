unit SDK.Model.Grupo;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IGrupo = interface(IModel)
    ['{75B56B60-B7C6-4A3C-A7B5-61696F146C61}']
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetSecaoId: Integer;
    procedure SetSecaoId(const ASecaoId: Integer);
    property Id: Integer read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property SecaoId: Integer read GetSecaoId write SetSecaoId;
  end;

  TGrupoList = class;

  IGrupoList = interface
	['{6085EDEC-1DA4-4966-8AA8-63B26F9C1B66}']
    function GetReference: TGrupoList;
    function GetItems(AIndex: Integer): IGrupo;
    procedure SetItems(AIndex: Integer; const Value: IGrupo);
    procedure Add(const AGrupo: IGrupo);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IGrupo read GetItems write SetItems; default;
  end;

  TGrupoListEnumerator = class
  private
    FIndex: Integer;
    FGrupoList: TGrupoList;
  public
    constructor Create(AGrupoList: TGrupoList);
    function GetCurrent: IGrupo; inline;
    function MoveNext: Boolean;
    property Current: IGrupo read GetCurrent;
  end;

  TGrupoList = class(TInterfacedObject, IGrupoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IGrupo;
    procedure SetItems(AIndex: Integer; const Value: IGrupo);
  public
    constructor Create;
    procedure Add(const AGrupo: IGrupo);
    destructor Destroy; override;
    function GetEnumerator: TGrupoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TGrupoList;
    property Items[AIndex: Integer]: IGrupo read GetItems write SetItems; default;
  end;

  TGrupoListRec = record
  private
    FList: IGrupoList;
  public
    class function Create(const AList: IGrupoList): TGrupoListRec; static;
    class operator Implicit(AListRec: TGrupoListRec): TGrupoList;
  end;

  TGrupo = class(TInterfacedModel, IGrupo)
  private
	FId: Integer;
	FDescricao: TString;
	FSecaoId: Integer;
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetSecaoId: Integer;
    procedure SetSecaoId(const ASecaoId: Integer);
  published
    property Id: Integer read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property SecaoId: Integer read GetSecaoId write SetSecaoId;
  end;

implementation

{ TGrupoList }

procedure TGrupoList.Add(const AGrupo: IGrupo);
begin
  FList.Add(AGrupo);
end;

procedure TGrupoList.Clear;
begin
  FList.Clear;
end;

function TGrupoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TGrupoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TGrupoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TGrupoList.GetEnumerator: TGrupoListEnumerator;
begin
  Result := TGrupoListEnumerator.Create(Self);
end;

function TGrupoList.GetItems(AIndex: Integer): IGrupo;
begin
  Result := FList[AIndex] as IGrupo;
end;

function TGrupoList.GetReference: TGrupoList;
begin
  Result := Self;
end;

procedure TGrupoList.SetItems(AIndex: Integer; const Value: IGrupo);
begin
  FList[AIndex] := Value;
end;

{ TGrupoListEnumerator }

constructor TGrupoListEnumerator.Create(AGrupoList: TGrupoList);
begin
  inherited Create;
  FIndex := -1;
  FGrupoList := AGrupoList;
end;

function TGrupoListEnumerator.GetCurrent: IGrupo;
begin
  Result := FGrupoList[FIndex];
end;

function TGrupoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FGrupoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TGrupoListRec }

class function TGrupoListRec.Create(const AList: IGrupoList): TGrupoListRec;
begin
  FillChar(Result, SizeOf(TGrupoListRec), 0);
  Result.FList := AList;
end;

class operator TGrupoListRec.Implicit(AListRec: TGrupoListRec): TGrupoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TGrupo }

function TGrupo.GetId: Integer;
begin
  Result := FId;
end;

procedure TGrupo.SetId(const AId: Integer);
begin
  FId := AId;
end;

function TGrupo.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TGrupo.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

function TGrupo.GetSecaoId: Integer;
begin
  Result := FSecaoId;
end;

procedure TGrupo.SetSecaoId(const ASecaoId: Integer);
begin
  FSecaoId := ASecaoId;
end;


end.
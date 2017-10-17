unit SDK.Model.Aplicacao;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IAplicacao = interface(IModel)
    ['{90999EE7-D1D6-475A-8A19-E1B12CB44427}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
  end;

  TAplicacaoList = class;

  IAplicacaoList = interface
	['{9162333C-D05D-4CFE-9B8C-53EB748940AD}']
    function GetReference: TAplicacaoList;
    function GetItems(AIndex: Integer): IAplicacao;
    procedure SetItems(AIndex: Integer; const Value: IAplicacao);
    procedure Add(const AAplicacao: IAplicacao);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IAplicacao read GetItems write SetItems; default;
  end;

  TAplicacaoListEnumerator = class
  private
    FIndex: Integer;
    FAplicacaoList: TAplicacaoList;
  public
    constructor Create(AAplicacaoList: TAplicacaoList);
    function GetCurrent: IAplicacao; inline;
    function MoveNext: Boolean;
    property Current: IAplicacao read GetCurrent;
  end;

  TAplicacaoList = class(TInterfacedObject, IAplicacaoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IAplicacao;
    procedure SetItems(AIndex: Integer; const Value: IAplicacao);
  public
    constructor Create;
    procedure Add(const AAplicacao: IAplicacao);
    destructor Destroy; override;
    function GetEnumerator: TAplicacaoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TAplicacaoList;
    property Items[AIndex: Integer]: IAplicacao read GetItems write SetItems; default;
  end;

  TAplicacaoListRec = record
  private
    FList: IAplicacaoList;
  public
    class function Create(const AList: IAplicacaoList): TAplicacaoListRec; static;
    class operator Implicit(AListRec: TAplicacaoListRec): TAplicacaoList;
  end;

  TAplicacao = class(TInterfacedModel, IAplicacao)
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

{ TAplicacaoList }

procedure TAplicacaoList.Add(const AAplicacao: IAplicacao);
begin
  FList.Add(AAplicacao);
end;

procedure TAplicacaoList.Clear;
begin
  FList.Clear;
end;

function TAplicacaoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TAplicacaoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TAplicacaoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TAplicacaoList.GetEnumerator: TAplicacaoListEnumerator;
begin
  Result := TAplicacaoListEnumerator.Create(Self);
end;

function TAplicacaoList.GetItems(AIndex: Integer): IAplicacao;
begin
  Result := FList[AIndex] as IAplicacao;
end;

function TAplicacaoList.GetReference: TAplicacaoList;
begin
  Result := Self;
end;

procedure TAplicacaoList.SetItems(AIndex: Integer; const Value: IAplicacao);
begin
  FList[AIndex] := Value;
end;

{ TAplicacaoListEnumerator }

constructor TAplicacaoListEnumerator.Create(AAplicacaoList: TAplicacaoList);
begin
  inherited Create;
  FIndex := -1;
  FAplicacaoList := AAplicacaoList;
end;

function TAplicacaoListEnumerator.GetCurrent: IAplicacao;
begin
  Result := FAplicacaoList[FIndex];
end;

function TAplicacaoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FAplicacaoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TAplicacaoListRec }

class function TAplicacaoListRec.Create(const AList: IAplicacaoList): TAplicacaoListRec;
begin
  FillChar(Result, SizeOf(TAplicacaoListRec), 0);
  Result.FList := AList;
end;

class operator TAplicacaoListRec.Implicit(AListRec: TAplicacaoListRec): TAplicacaoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TAplicacao }

function TAplicacao.GetId: Int64;
begin
  Result := FId;
end;

procedure TAplicacao.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TAplicacao.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TAplicacao.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;


end.
unit SDK.Model.TipoAjuste;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ITipoAjuste = interface(IModel)
    ['{41946302-CB0F-4C11-BEAB-3C64868A9ED4}']
    function GetId: Int64;
    function GetDescricao: TString;
    function GetTipoDeOperacao: TTipoOperacao;
    procedure SetId(const AId: Int64);
    procedure SetDescricao(const ADescricao: TString);
    procedure SetTipoDeOperacao(const ATipoDeOperacao: TTipoOperacao);
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property TipoDeOperacao: TTipoOperacao read GetTipoDeOperacao write SetTipoDeOperacao;
  end;

  TTipoAjusteList = class;

  ITipoAjusteList = interface
    ['{586D4894-6D95-48EE-8D11-6FFD152C3626}']
    function GetReference: TTipoAjusteList;
    function GetItems(AIndex: Integer): ITipoAjuste;
    procedure SetItems(AIndex: Integer; const ITipoAjuste: ITipoAjuste);
    procedure Add(const ATipoAjuste: ITipoAjuste);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ITipoAjuste read GetItems write SetItems; default;
  end;

  TTipoAjusteListEnumerator = class
  private
    FIndex: Integer;
    FTipoAjusteList: TTipoAjusteList;
  public
    constructor Create(ATipoAjusteList: TTipoAjusteList);
    function GetCurrent: ITipoAjuste; inline;
    function MoveNext: Boolean;
    property Current: ITipoAjuste read GetCurrent;
  end;

  TTipoAjusteList = class(TInterfacedObject, ITipoAjusteList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ITipoAjuste;
    procedure SetItems(AIndex: Integer; const Value: ITipoAjuste);
  public
    constructor Create;
    procedure Add(const ATipoAjuste: ITipoAjuste);
    destructor Destroy; override;
    function GetEnumerator: TTipoAjusteListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TTipoAjusteList;
    property Items[AIndex: Integer]: ITipoAjuste read GetItems write SetItems; default;
  end;

  TTipoAjusteListRec = record
  private
    FList: ITipoAjusteList;
  public
    class function Create(const AList: ITipoAjusteList): TTipoAjusteListRec; static;
    class operator Implicit(AListRec: TTipoAjusteListRec): TTipoAjusteList;
  end;


  TTipoAjuste = class(TInterfacedModel, ITipoAjuste)
  private
    FId: Int64;
    FDescricao: TString;
    FTipoDeOperacao: TTipoOperacao;
    function GetId: Int64;
    function GetDescricao: TString;
    function GetTipoDeOperacao: TTipoOperacao;
    procedure SetId(const AId: Int64);
    procedure SetDescricao(const ADescricao: TString);
    procedure SetTipoDeOperacao(const ATipoDeOperacao: TTipoOperacao);
  published
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property TipoDeOperacao: TTipoOperacao read GetTipoDeOperacao write SetTipoDeOperacao;
  end;



implementation

{ TTipoAjusteListRec }

class function TTipoAjusteListRec.Create(
  const AList: ITipoAjusteList): TTipoAjusteListRec;
begin
  FillChar(Result, SizeOf(TTipoAjusteListRec), 0);
  Result.FList := AList;
end;

class operator TTipoAjusteListRec.Implicit(
  AListRec: TTipoAjusteListRec): TTipoAjusteList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TTipoAjusteList }

procedure TTipoAjusteList.Add(const ATipoAjuste: ITipoAjuste);
begin
  FList.Add(ATipoAjuste);
end;

procedure TTipoAjusteList.Clear;
begin
  FList.Clear;
end;

function TTipoAjusteList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TTipoAjusteList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TTipoAjusteList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TTipoAjusteList.GetEnumerator: TTipoAjusteListEnumerator;
begin
  Result := TTipoAjusteListEnumerator.Create(Self);
end;

function TTipoAjusteList.GetItems(AIndex: Integer): ITipoAjuste;
begin
  Result := FList[AIndex] as ITipoAjuste;
end;

function TTipoAjusteList.GetReference: TTipoAjusteList;
begin
  Result := Self;
end;

procedure TTipoAjusteList.SetItems(AIndex: Integer;
  const Value: ITipoAjuste);
begin
  FList[AIndex] := Value;
end;

{ TTipoAjusteListEnumerator }

constructor TTipoAjusteListEnumerator.Create(ATipoAjusteList: TTipoAjusteList);
begin
  inherited Create;
  FIndex := -1;
  FTipoAjusteList := ATipoAjusteList;
end;

function TTipoAjusteListEnumerator.GetCurrent: ITipoAjuste;
begin
  Result := FTipoAjusteList[FIndex];
end;

function TTipoAjusteListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FTipoAjusteList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TTipoAjuste }

function TTipoAjuste.GetDescricao: TString;
begin
  Result := FDescricao;
end;

function TTipoAjuste.GetId: Int64;
begin
  Result := FId;
end;

function TTipoAjuste.GetTipoDeOperacao: TTipoOperacao;
begin
  Result := FTipoDeOperacao;
end;

procedure TTipoAjuste.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

procedure TTipoAjuste.SetId(const AId: Int64);
begin
  FId := AId;
end;

procedure TTipoAjuste.SetTipoDeOperacao(const ATipoDeOperacao: TTipoOperacao);
begin
  FTipoDeOperacao := ATipoDeOperacao;
end;

end.


unit SDK.Model.AjusteEstoque;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums, SDK.Model.ItemAjusteEstoque;

type

  IAjusteEstoque = interface(IModel)
    ['{1C240A6F-5F76-4D67-B962-91F586738C99}']
    function GetId: TString;
    function GetLojaId: Int64;
    function GetLocalId: Int64;
    function GetDataDaMovimentacao: TDateTime;
    function GetFuncionarioId: Int64;
    function GetTipoDeAjusteId: Int64;
    function GetTipoDeOperacao: TTipoOperacao;
    function GetObservacao: TString;
    function GetItens: TItemAjusteDeEstoqueList;
    procedure SetId(const AId: TString);
    procedure SetLojaId(const ALojaId: Int64);
    procedure SetLocalId(const ALocalId: Int64);
    procedure SetFuncionarioId(const AFuncionarioId: Int64);
    procedure SetDataDaMovimentacao(const ADataDaMovimentacao: TDateTime);
    procedure SetTipoDeAjusteId(const ATipoDeAjusteId: Int64);
    procedure SetTipoDeOperacao(const ATipoOperacao: TTipoOperacao);
    procedure SetObservacao(const AObservacao: TString);
    procedure SetItens(const AItens: TItemAjusteDeEstoqueList);
    property Id: TString read GetId write SetId;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property LocalId: Int64 read GetLocalId write SetLocalId;
    property DataDaMovimentacao: TDateTime read GetDataDaMovimentacao write SetDataDaMovimentacao;
    property FuncionarioId: Int64 read GetFuncionarioId write SetFuncionarioId;
    property TipoDeAjusteId: Int64 read GetTipoDeAjusteId write SetTipoDeAjusteId;
    property TipoDeOperacao: TTipoOperacao read GetTipoDeOperacao write SetTipoDeOperacao;
    property Observacao: TString read GetObservacao write SetObservacao;
    property Itens: TItemAjusteDeEstoqueList read GetItens write SetItens;
  end;

  TAjusteEstoqueList = class;

  IAjusteEstoqueList = interface
    ['{299E1813-784E-496B-9C65-489E23439CFF}']
    function GetReference: TAjusteEstoqueList;
    function GetItems(AIndex: Integer): IAjusteEstoque;
    procedure SetItems(AIndex: Integer; const IAjusteEstoque: IAjusteEstoque);
    procedure Add(const AAjusteEstoque: IAjusteEstoque);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IAjusteEstoque read GetItems write SetItems; default;
  end;

  TAjusteEstoqueListEnumerator = class
  private
    FIndex: Integer;
    FAjusteEstoqueList: TAjusteEstoqueList;
  public
    constructor Create(AjusteEstoqueList: TAjusteEstoqueList);
    function GetCurrent: IAjusteEstoque; inline;
    function MoveNext: Boolean;
    property Current: IAjusteEstoque read GetCurrent;
  end;

  TAjusteEstoqueList = class(TInterfacedObject, IAjusteEstoqueList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IAjusteEstoque;
    procedure SetItems(AIndex: Integer; const Value: IAjusteEstoque);
  public
    constructor Create;
    procedure Add(const AAjusteEstoque: IAjusteEstoque);
    destructor Destroy; override;
    function GetEnumerator: TAjusteEstoqueListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TAjusteEstoqueList;
    property Items[AIndex: Integer]: IAjusteEstoque read GetItems write SetItems; default;
  end;

  TAjusteEstoqueListRec = record
  private
    FList: IAjusteEstoqueList;
  public
    class function Create(const AList: IAjusteEstoqueList): TAjusteEstoqueListRec; static;
    class operator Implicit(AListRec: TAjusteEstoqueListRec): TAjusteEstoqueList;
  end;

  TAjusteEstoque = class(TInterfacedModel, IAjusteEstoque)
  private
    FId: TString;
    FLojaId: Int64;
    FLocalId: Int64;
    FDataDaMovimentacao: TDateTime;
    FFuncionarioId: Int64;
    FTipoDeAjusteId: Int64;
    FTipoDeOperacao: TTipoOperacao;
    FObservacao: TString;
    FItens: TItemAjusteDeEstoqueList;
    function GetId: TString;
    function GetLojaId: Int64;
    function GetLocalId: Int64;
    function GetDataDaMovimentacao: TDateTime;
    function GetFuncionarioId: Int64;
    function GetTipoDeAjusteId: Int64;
    function GetTipoDeOperacao: TTipoOperacao;
    function GetItens: TItemAjusteDeEstoqueList;
    function GetObservacao: TString;
    procedure SetId(const AId: TString);
    procedure SetLojaId(const ALojaId: Int64);
    procedure SetLocalId(const ALocalId: Int64);
    procedure SetFuncionarioId(const AFuncionarioId: Int64);
    procedure SetDataDaMovimentacao(const ADataDaMovimentacao: TDateTime);
    procedure SetTipoDeAjusteId(const ATipoDeAjusteId: Int64);
    procedure SetItens(const AItens: TItemAjusteDeEstoqueList);
    procedure SetTipoDeOperacao(const ATipoOperacao: TTipoOperacao);
    procedure SetObservacao(const AObservacao: TString);
  published
    property Id: TString read GetId write SetId;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property LocalId: Int64 read GetLocalId write SetLocalId;
    property DataDaMovimentacao: TDateTime read GetDataDaMovimentacao write SetDataDaMovimentacao;
    property FuncionarioId: Int64 read GetFuncionarioId write SetFuncionarioId;
    property TipoDeAjusteId: Int64 read GetTipoDeAjusteId write SetTipoDeAjusteId;
    property TipoDeOperacao: TTipoOperacao read GetTipoDeOperacao write SetTipoDeOperacao;
    property Observacao: TString read GetObservacao write SetObservacao;
    property Itens: TItemAjusteDeEstoqueList read GetItens write SetItens;
  end;



implementation

{ TAjusteEstoqueListRec }

class function TAjusteEstoqueListRec.Create(
  const AList: IAjusteEstoqueList): TAjusteEstoqueListRec;
begin
  FillChar(Result, SizeOf(TAjusteEstoqueListRec), 0);
  Result.FList := AList;
end;

class operator TAjusteEstoqueListRec.Implicit(
  AListRec: TAjusteEstoqueListRec): TAjusteEstoqueList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TAjusteEstoqueList }

procedure TAjusteEstoqueList.Add(const AAjusteEstoque: IAjusteEstoque);
begin
  FList.Add(AAjusteEstoque);
end;

procedure TAjusteEstoqueList.Clear;
begin
  FList.Clear;
end;

function TAjusteEstoqueList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TAjusteEstoqueList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TAjusteEstoqueList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TAjusteEstoqueList.GetEnumerator: TAjusteEstoqueListEnumerator;
begin
  Result := TAjusteEstoqueListEnumerator.Create(Self);
end;

function TAjusteEstoqueList.GetItems(AIndex: Integer): IAjusteEstoque;
begin
  Result := FList[AIndex] as IAjusteEstoque;
end;

function TAjusteEstoqueList.GetReference: TAjusteEstoqueList;
begin
  Result := Self;
end;

procedure TAjusteEstoqueList.SetItems(AIndex: Integer;
  const Value: IAjusteEstoque);
begin
  FList[AIndex] := Value;
end;

{ TAjusteEstoqueListEnumerator }

constructor TAjusteEstoqueListEnumerator.Create(
  AjusteEstoqueList: TAjusteEstoqueList);
begin
  inherited Create;
  FIndex := -1;
  FAjusteEstoqueList := AjusteEstoqueList;
end;

function TAjusteEstoqueListEnumerator.GetCurrent: IAjusteEstoque;
begin
  Result := FAjusteEstoqueList[FIndex];
end;

function TAjusteEstoqueListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FAjusteEstoqueList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TAjusteEstoque }

function TAjusteEstoque.GetDataDaMovimentacao: TDateTime;
begin
  Result := FDataDaMovimentacao;
end;

function TAjusteEstoque.GetFuncionarioId: Int64;
begin
  Result := FFuncionarioId;
end;

function TAjusteEstoque.GetId: TString;
begin
  Result := FId;
end;

function TAjusteEstoque.GetItens: TItemAjusteDeEstoqueList;
begin
  Result := FItens;
end;

function TAjusteEstoque.GetLocalId: Int64;
begin
  Result := FLocalId;
end;

function TAjusteEstoque.GetLojaId: Int64;
begin
  Result := FLojaId;
end;

function TAjusteEstoque.GetObservacao: TString;
begin
  Result := FObservacao;
end;

function TAjusteEstoque.GetTipoDeAjusteId: Int64;
begin
  Result := FTipoDeAjusteId;
end;

function TAjusteEstoque.GetTipoDeOperacao: TTipoOperacao;
begin
  Result := FTipoDeOperacao;
end;

procedure TAjusteEstoque.SetDataDaMovimentacao(
  const ADataDaMovimentacao: TDateTime);
begin
  FDataDaMovimentacao := ADataDaMovimentacao;
end;

procedure TAjusteEstoque.SetFuncionarioId(const AFuncionarioId: Int64);
begin
  FFuncionarioId := AFuncionarioId;
end;

procedure TAjusteEstoque.SetId(const AId: TString);
begin
  FId := AId;
end;

procedure TAjusteEstoque.SetItens(const AItens: TItemAjusteDeEstoqueList);
begin
  FItens := AItens;
end;

procedure TAjusteEstoque.SetLocalId(const ALocalId: Int64);
begin
  FLocalId := ALocalId;
end;

procedure TAjusteEstoque.SetLojaId(const ALojaId: Int64);
begin
  FLojaId := ALojaId;
end;

procedure TAjusteEstoque.SetObservacao(const AObservacao: TString);
begin
  FObservacao := AObservacao;
end;

procedure TAjusteEstoque.SetTipoDeAjusteId(const ATipoDeAjusteId: Int64);
begin
  FTipoDeAjusteId := ATipoDeAjusteId;
end;

procedure TAjusteEstoque.SetTipoDeOperacao(const ATipoOperacao: TTipoOperacao);
begin
  FTipoDeOperacao := ATipoOperacao;
end;

end.

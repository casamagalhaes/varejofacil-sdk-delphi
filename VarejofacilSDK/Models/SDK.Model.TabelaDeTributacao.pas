unit SDK.Model.TabelaDeTributacao;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ITabelaDeTributacao = interface(IModel)
    ['{2AE804E7-6C85-48D7-85AB-CC2839D0DBD6}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetRegimeEstadualId: Int64;
    procedure SetRegimeEstadualId(const ARegimeEstadualId: Int64);
    function GetSituacaoFiscalId: Integer;
    procedure SetSituacaoFiscalId(const ASituacaoFiscalId: Integer);
    function GetFiguraFiscalId: Integer;
    procedure SetFiguraFiscalId(const AFiguraFiscalId: Integer);
    function GetUf: TString;
    procedure SetUf(const AUf: TString);
    function GetInicioDaVigencia: TDateTime;
    procedure SetInicioDaVigencia(const AInicioDaVigencia: TDateTime);
    function GetFinalDaVigencia: TDateTime;
    procedure SetFinalDaVigencia(const AFinalDaVigencia: TDateTime);
    function GetTipoDeOperacao: TTipoOperacao;
    procedure SetTipoDeOperacao(const ATipoDeOperacao: TTipoOperacao);
    function GetDecreto: TString;
    procedure SetDecreto(const ADecreto: TString);
    property Id: Int64 read GetId write SetId;
    property RegimeEstadualId: Int64 read GetRegimeEstadualId write SetRegimeEstadualId;
    property SituacaoFiscalId: Integer read GetSituacaoFiscalId write SetSituacaoFiscalId;
    property FiguraFiscalId: Integer read GetFiguraFiscalId write SetFiguraFiscalId;
    property Uf: TString read GetUf write SetUf;
    property InicioDaVigencia: TDateTime read GetInicioDaVigencia write SetInicioDaVigencia;
    property FinalDaVigencia: TDateTime read GetFinalDaVigencia write SetFinalDaVigencia;
    property TipoDeOperacao: TTipoOperacao read GetTipoDeOperacao write SetTipoDeOperacao;
    property Decreto: TString read GetDecreto write SetDecreto;
  end;

  TTabelaDeTributacaoList = class;

  ITabelaDeTributacaoList = interface
	['{A6351411-62BC-4977-AF19-6AF84DE285A3}']
    function GetReference: TTabelaDeTributacaoList;
    function GetItems(AIndex: Integer): ITabelaDeTributacao;
    procedure SetItems(AIndex: Integer; const Value: ITabelaDeTributacao);
    procedure Add(const ATabelaDeTributacao: ITabelaDeTributacao);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ITabelaDeTributacao read GetItems write SetItems; default;
  end;

  TTabelaDeTributacaoListEnumerator = class
  private
    FIndex: Integer;
    FTabelaDeTributacaoList: TTabelaDeTributacaoList;
  public
    constructor Create(ATabelaDeTributacaoList: TTabelaDeTributacaoList);
    function GetCurrent: ITabelaDeTributacao; inline;
    function MoveNext: Boolean;
    property Current: ITabelaDeTributacao read GetCurrent;
  end;

  TTabelaDeTributacaoList = class(TInterfacedObject, ITabelaDeTributacaoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ITabelaDeTributacao;
    procedure SetItems(AIndex: Integer; const Value: ITabelaDeTributacao);
  public
    constructor Create;
    procedure Add(const ATabelaDeTributacao: ITabelaDeTributacao);
    destructor Destroy; override;
    function GetEnumerator: TTabelaDeTributacaoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TTabelaDeTributacaoList;
    property Items[AIndex: Integer]: ITabelaDeTributacao read GetItems write SetItems; default;
  end;

  TTabelaDeTributacaoListRec = record
  private
    FList: ITabelaDeTributacaoList;
  public
    class function Create(const AList: ITabelaDeTributacaoList): TTabelaDeTributacaoListRec; static;
    class operator Implicit(AListRec: TTabelaDeTributacaoListRec): TTabelaDeTributacaoList;
  end;

  TTabelaDeTributacao = class(TInterfacedModel, ITabelaDeTributacao)
  private
	FId: Int64;
	FRegimeEstadualId: Int64;
	FSituacaoFiscalId: Integer;
	FFiguraFiscalId: Integer;
	FUf: TString;
	FInicioDaVigencia: TDateTime;
	FFinalDaVigencia: TDateTime;
	FTipoDeOperacao: TTipoOperacao;
	FDecreto: TString;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetRegimeEstadualId: Int64;
    procedure SetRegimeEstadualId(const ARegimeEstadualId: Int64);
    function GetSituacaoFiscalId: Integer;
    procedure SetSituacaoFiscalId(const ASituacaoFiscalId: Integer);
    function GetFiguraFiscalId: Integer;
    procedure SetFiguraFiscalId(const AFiguraFiscalId: Integer);
    function GetUf: TString;
    procedure SetUf(const AUf: TString);
    function GetInicioDaVigencia: TDateTime;
    procedure SetInicioDaVigencia(const AInicioDaVigencia: TDateTime);
    function GetFinalDaVigencia: TDateTime;
    procedure SetFinalDaVigencia(const AFinalDaVigencia: TDateTime);
    function GetTipoDeOperacao: TTipoOperacao;
    procedure SetTipoDeOperacao(const ATipoDeOperacao: TTipoOperacao);
    function GetDecreto: TString;
    procedure SetDecreto(const ADecreto: TString);
  public
    property Id: Int64 read GetId write SetId;
    property RegimeEstadualId: Int64 read GetRegimeEstadualId write SetRegimeEstadualId;
    property SituacaoFiscalId: Integer read GetSituacaoFiscalId write SetSituacaoFiscalId;
    property FiguraFiscalId: Integer read GetFiguraFiscalId write SetFiguraFiscalId;
    property Uf: TString read GetUf write SetUf;
    property InicioDaVigencia: TDateTime read GetInicioDaVigencia write SetInicioDaVigencia;
    property FinalDaVigencia: TDateTime read GetFinalDaVigencia write SetFinalDaVigencia;
    property TipoDeOperacao: TTipoOperacao read GetTipoDeOperacao write SetTipoDeOperacao;
    property Decreto: TString read GetDecreto write SetDecreto;
  end;

implementation

{ TTabelaDeTributacaoList }

procedure TTabelaDeTributacaoList.Add(const ATabelaDeTributacao: ITabelaDeTributacao);
begin
  FList.Add(ATabelaDeTributacao);
end;

procedure TTabelaDeTributacaoList.Clear;
begin
  FList.Clear;
end;

function TTabelaDeTributacaoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TTabelaDeTributacaoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TTabelaDeTributacaoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TTabelaDeTributacaoList.GetEnumerator: TTabelaDeTributacaoListEnumerator;
begin
  Result := TTabelaDeTributacaoListEnumerator.Create(Self);
end;

function TTabelaDeTributacaoList.GetItems(AIndex: Integer): ITabelaDeTributacao;
begin
  Result := FList[AIndex] as ITabelaDeTributacao;
end;

function TTabelaDeTributacaoList.GetReference: TTabelaDeTributacaoList;
begin
  Result := Self;
end;

procedure TTabelaDeTributacaoList.SetItems(AIndex: Integer; const Value: ITabelaDeTributacao);
begin
  FList[AIndex] := Value;
end;

{ TTabelaDeTributacaoListEnumerator }

constructor TTabelaDeTributacaoListEnumerator.Create(ATabelaDeTributacaoList: TTabelaDeTributacaoList);
begin
  inherited Create;
  FIndex := -1;
  FTabelaDeTributacaoList := ATabelaDeTributacaoList;
end;

function TTabelaDeTributacaoListEnumerator.GetCurrent: ITabelaDeTributacao;
begin
  Result := FTabelaDeTributacaoList[FIndex];
end;

function TTabelaDeTributacaoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FTabelaDeTributacaoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TTabelaDeTributacaoListRec }

class function TTabelaDeTributacaoListRec.Create(const AList: ITabelaDeTributacaoList): TTabelaDeTributacaoListRec;
begin
  FillChar(Result, SizeOf(TTabelaDeTributacaoListRec), 0);
  Result.FList := AList;
end;

class operator TTabelaDeTributacaoListRec.Implicit(AListRec: TTabelaDeTributacaoListRec): TTabelaDeTributacaoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TTabelaDeTributacao }

function TTabelaDeTributacao.GetId: Int64;
begin
  Result := FId;
end;

procedure TTabelaDeTributacao.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TTabelaDeTributacao.GetRegimeEstadualId: Int64;
begin
  Result := FRegimeEstadualId;
end;

procedure TTabelaDeTributacao.SetRegimeEstadualId(const ARegimeEstadualId: Int64);
begin
  FRegimeEstadualId := ARegimeEstadualId;
end;

function TTabelaDeTributacao.GetSituacaoFiscalId: Integer;
begin
  Result := FSituacaoFiscalId;
end;

procedure TTabelaDeTributacao.SetSituacaoFiscalId(const ASituacaoFiscalId: Integer);
begin
  FSituacaoFiscalId := ASituacaoFiscalId;
end;

function TTabelaDeTributacao.GetFiguraFiscalId: Integer;
begin
  Result := FFiguraFiscalId;
end;

procedure TTabelaDeTributacao.SetFiguraFiscalId(const AFiguraFiscalId: Integer);
begin
  FFiguraFiscalId := AFiguraFiscalId;
end;

function TTabelaDeTributacao.GetUf: TString;
begin
  Result := FUf;
end;

procedure TTabelaDeTributacao.SetUf(const AUf: TString);
begin
  FUf := AUf;
end;

function TTabelaDeTributacao.GetInicioDaVigencia: TDateTime;
begin
  Result := FInicioDaVigencia;
end;

procedure TTabelaDeTributacao.SetInicioDaVigencia(const AInicioDaVigencia: TDateTime);
begin
  FInicioDaVigencia := AInicioDaVigencia;
end;

function TTabelaDeTributacao.GetFinalDaVigencia: TDateTime;
begin
  Result := FFinalDaVigencia;
end;

procedure TTabelaDeTributacao.SetFinalDaVigencia(const AFinalDaVigencia: TDateTime);
begin
  FFinalDaVigencia := AFinalDaVigencia;
end;

function TTabelaDeTributacao.GetTipoDeOperacao: TTipoOperacao;
begin
  Result := FTipoDeOperacao;
end;

procedure TTabelaDeTributacao.SetTipoDeOperacao(const ATipoDeOperacao: TTipoOperacao);
begin
  FTipoDeOperacao := ATipoDeOperacao;
end;

function TTabelaDeTributacao.GetDecreto: TString;
begin
  Result := FDecreto;
end;

procedure TTabelaDeTributacao.SetDecreto(const ADecreto: TString);
begin
  FDecreto := ADecreto;
end;


end.
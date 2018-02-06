unit SDK.Model.TabelaTributaria;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums, SDK.Model.ItemTabelaTributaria;

type

  ITabelaTributaria = interface(IModel)
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
    function GetItens: TItemTabelaTributariaList;
    procedure SetItens(const AItens: TItemTabelaTributariaList);
    property Id: Int64 read GetId write SetId;
    property RegimeEstadualId: Int64 read GetRegimeEstadualId write SetRegimeEstadualId;
    property SituacaoFiscalId: Integer read GetSituacaoFiscalId write SetSituacaoFiscalId;
    property FiguraFiscalId: Integer read GetFiguraFiscalId write SetFiguraFiscalId;
    property Uf: TString read GetUf write SetUf;
    property InicioDaVigencia: TDateTime read GetInicioDaVigencia write SetInicioDaVigencia;
    property FinalDaVigencia: TDateTime read GetFinalDaVigencia write SetFinalDaVigencia;
    property TipoDeOperacao: TTipoOperacao read GetTipoDeOperacao write SetTipoDeOperacao;
    property Decreto: TString read GetDecreto write SetDecreto;
    property Itens: TItemTabelaTributariaList read GetItens write SetItens;
  end;

  TTabelaTributariaList = class;

  ITabelaTributariaList = interface
	['{A6351411-62BC-4977-AF19-6AF84DE285A3}']
    function GetReference: TTabelaTributariaList;
    function GetItems(AIndex: Integer): ITabelaTributaria;
    procedure SetItems(AIndex: Integer; const Value: ITabelaTributaria);
    procedure Add(const ATabelaTributaria: ITabelaTributaria);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ITabelaTributaria read GetItems write SetItems; default;
  end;

  TTabelaTributariaListEnumerator = class
  private
    FIndex: Integer;
    FTabelaTributariaList: TTabelaTributariaList;
  public
    constructor Create(ATabelaTributariaList: TTabelaTributariaList);
    function GetCurrent: ITabelaTributaria; inline;
    function MoveNext: Boolean;
    property Current: ITabelaTributaria read GetCurrent;
  end;

  TTabelaTributariaList = class(TInterfacedObject, ITabelaTributariaList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ITabelaTributaria;
    procedure SetItems(AIndex: Integer; const Value: ITabelaTributaria);
  public
    constructor Create;
    procedure Add(const ATabelaTributaria: ITabelaTributaria);
    destructor Destroy; override;
    function GetEnumerator: TTabelaTributariaListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TTabelaTributariaList;
    property Items[AIndex: Integer]: ITabelaTributaria read GetItems write SetItems; default;
  end;

  TTabelaTributariaListRec = record
  private
    FList: ITabelaTributariaList;
  public
    class function Create(const AList: ITabelaTributariaList): TTabelaTributariaListRec; static;
    class operator Implicit(AListRec: TTabelaTributariaListRec): TTabelaTributariaList;
  end;

  TTabelaTributaria = class(TInterfacedModel, ITabelaTributaria)
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
	FItens: TItemTabelaTributariaList;
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
    function GetItens: TItemTabelaTributariaList;
    procedure SetItens(const AItens: TItemTabelaTributariaList);
  published
    property Id: Int64 read GetId write SetId;
    property RegimeEstadualId: Int64 read GetRegimeEstadualId write SetRegimeEstadualId;
    property SituacaoFiscalId: Integer read GetSituacaoFiscalId write SetSituacaoFiscalId;
    property FiguraFiscalId: Integer read GetFiguraFiscalId write SetFiguraFiscalId;
    property Uf: TString read GetUf write SetUf;
    property InicioDaVigencia: TDateTime read GetInicioDaVigencia write SetInicioDaVigencia;
    property FinalDaVigencia: TDateTime read GetFinalDaVigencia write SetFinalDaVigencia;
    property TipoDeOperacao: TTipoOperacao read GetTipoDeOperacao write SetTipoDeOperacao;
    property Decreto: TString read GetDecreto write SetDecreto;
    property Itens: TItemTabelaTributariaList read GetItens write SetItens;
  end;

implementation

{ TTabelaTributariaList }

procedure TTabelaTributariaList.Add(const ATabelaTributaria: ITabelaTributaria);
begin
  FList.Add(ATabelaTributaria);
end;

procedure TTabelaTributariaList.Clear;
begin
  FList.Clear;
end;

function TTabelaTributariaList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TTabelaTributariaList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TTabelaTributariaList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TTabelaTributariaList.GetEnumerator: TTabelaTributariaListEnumerator;
begin
  Result := TTabelaTributariaListEnumerator.Create(Self);
end;

function TTabelaTributariaList.GetItems(AIndex: Integer): ITabelaTributaria;
begin
  Result := FList[AIndex] as ITabelaTributaria;
end;

function TTabelaTributariaList.GetReference: TTabelaTributariaList;
begin
  Result := Self;
end;

procedure TTabelaTributariaList.SetItems(AIndex: Integer; const Value: ITabelaTributaria);
begin
  FList[AIndex] := Value;
end;

{ TTabelaTributariaListEnumerator }

constructor TTabelaTributariaListEnumerator.Create(ATabelaTributariaList: TTabelaTributariaList);
begin
  inherited Create;
  FIndex := -1;
  FTabelaTributariaList := ATabelaTributariaList;
end;

function TTabelaTributariaListEnumerator.GetCurrent: ITabelaTributaria;
begin
  Result := FTabelaTributariaList[FIndex];
end;

function TTabelaTributariaListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FTabelaTributariaList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TTabelaTributariaListRec }

class function TTabelaTributariaListRec.Create(const AList: ITabelaTributariaList): TTabelaTributariaListRec;
begin
  FillChar(Result, SizeOf(TTabelaTributariaListRec), 0);
  Result.FList := AList;
end;

class operator TTabelaTributariaListRec.Implicit(AListRec: TTabelaTributariaListRec): TTabelaTributariaList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TTabelaTributaria }

function TTabelaTributaria.GetId: Int64;
begin
  Result := FId;
end;

procedure TTabelaTributaria.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TTabelaTributaria.GetRegimeEstadualId: Int64;
begin
  Result := FRegimeEstadualId;
end;

procedure TTabelaTributaria.SetRegimeEstadualId(const ARegimeEstadualId: Int64);
begin
  FRegimeEstadualId := ARegimeEstadualId;
end;

function TTabelaTributaria.GetSituacaoFiscalId: Integer;
begin
  Result := FSituacaoFiscalId;
end;

procedure TTabelaTributaria.SetSituacaoFiscalId(const ASituacaoFiscalId: Integer);
begin
  FSituacaoFiscalId := ASituacaoFiscalId;
end;

function TTabelaTributaria.GetFiguraFiscalId: Integer;
begin
  Result := FFiguraFiscalId;
end;

procedure TTabelaTributaria.SetFiguraFiscalId(const AFiguraFiscalId: Integer);
begin
  FFiguraFiscalId := AFiguraFiscalId;
end;

function TTabelaTributaria.GetUf: TString;
begin
  Result := FUf;
end;

procedure TTabelaTributaria.SetUf(const AUf: TString);
begin
  FUf := AUf;
end;

function TTabelaTributaria.GetInicioDaVigencia: TDateTime;
begin
  Result := FInicioDaVigencia;
end;

procedure TTabelaTributaria.SetInicioDaVigencia(const AInicioDaVigencia: TDateTime);
begin
  FInicioDaVigencia := AInicioDaVigencia;
end;

function TTabelaTributaria.GetFinalDaVigencia: TDateTime;
begin
  Result := FFinalDaVigencia;
end;

procedure TTabelaTributaria.SetFinalDaVigencia(const AFinalDaVigencia: TDateTime);
begin
  FFinalDaVigencia := AFinalDaVigencia;
end;

function TTabelaTributaria.GetTipoDeOperacao: TTipoOperacao;
begin
  Result := FTipoDeOperacao;
end;

procedure TTabelaTributaria.SetTipoDeOperacao(const ATipoDeOperacao: TTipoOperacao);
begin
  FTipoDeOperacao := ATipoDeOperacao;
end;

function TTabelaTributaria.GetDecreto: TString;
begin
  Result := FDecreto;
end;

procedure TTabelaTributaria.SetDecreto(const ADecreto: TString);
begin
  FDecreto := ADecreto;
end;

function TTabelaTributaria.GetItens: TItemTabelaTributariaList;
begin
  Result := FItens;
end;

procedure TTabelaTributaria.SetItens(const AItens: TItemTabelaTributariaList);
begin
  FItens := AItens;
end;

end.
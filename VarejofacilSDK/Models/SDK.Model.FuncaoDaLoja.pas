unit SDK.Model.FuncaoDaLoja;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IFuncaoDaLoja = interface(IModel)
    ['{58F953E3-CB0E-486F-9102-36579C049886}']
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetFuncaoId: Integer;
    procedure SetFuncaoId(const AFuncaoId: Integer);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetSolicitaAutorizacao: Boolean;
    procedure SetSolicitaAutorizacao(const ASolicitaAutorizacao: Boolean);
    function GetHabilitaF1: Boolean;
    procedure SetHabilitaF1(const AHabilitaF1: Boolean);
    function GetAcesso: TString;
    procedure SetAcesso(const AAcesso: TString);
    property Id: Integer read GetId write SetId;
    property FuncaoId: Integer read GetFuncaoId write SetFuncaoId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property SolicitaAutorizacao: Boolean read GetSolicitaAutorizacao write SetSolicitaAutorizacao;
    property HabilitaF1: Boolean read GetHabilitaF1 write SetHabilitaF1;
    property Acesso: TString read GetAcesso write SetAcesso;
  end;

  TFuncaoDaLojaList = class;

  IFuncaoDaLojaList = interface
	['{F79613A0-4970-468F-95E6-714293D4A65C}']
    function GetReference: TFuncaoDaLojaList;
    function GetItems(AIndex: Integer): IFuncaoDaLoja;
    procedure SetItems(AIndex: Integer; const Value: IFuncaoDaLoja);
    procedure Add(const AFuncaoDaLoja: IFuncaoDaLoja);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IFuncaoDaLoja read GetItems write SetItems; default;
  end;

  TFuncaoDaLojaListEnumerator = class
  private
    FIndex: Integer;
    FFuncaoDaLojaList: TFuncaoDaLojaList;
  public
    constructor Create(AFuncaoDaLojaList: TFuncaoDaLojaList);
    function GetCurrent: IFuncaoDaLoja; inline;
    function MoveNext: Boolean;
    property Current: IFuncaoDaLoja read GetCurrent;
  end;

  TFuncaoDaLojaList = class(TInterfacedObject, IFuncaoDaLojaList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IFuncaoDaLoja;
    procedure SetItems(AIndex: Integer; const Value: IFuncaoDaLoja);
  public
    constructor Create;
    procedure Add(const AFuncaoDaLoja: IFuncaoDaLoja);
    destructor Destroy; override;
    function GetEnumerator: TFuncaoDaLojaListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TFuncaoDaLojaList;
    property Items[AIndex: Integer]: IFuncaoDaLoja read GetItems write SetItems; default;
  end;

  TFuncaoDaLojaListRec = record
  private
    FList: IFuncaoDaLojaList;
  public
    class function Create(const AList: IFuncaoDaLojaList): TFuncaoDaLojaListRec; static;
    class operator Implicit(AListRec: TFuncaoDaLojaListRec): TFuncaoDaLojaList;
  end;

  TFuncaoDaLoja = class(TInterfacedModel, IFuncaoDaLoja)
  private
	FId: Integer;
	FFuncaoId: Integer;
	FDescricao: TString;
	FLojaId: Int64;
	FSolicitaAutorizacao: Boolean;
	FHabilitaF1: Boolean;
	FAcesso: TString;
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetFuncaoId: Integer;
    procedure SetFuncaoId(const AFuncaoId: Integer);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetSolicitaAutorizacao: Boolean;
    procedure SetSolicitaAutorizacao(const ASolicitaAutorizacao: Boolean);
    function GetHabilitaF1: Boolean;
    procedure SetHabilitaF1(const AHabilitaF1: Boolean);
    function GetAcesso: TString;
    procedure SetAcesso(const AAcesso: TString);
  public
    property Id: Integer read GetId write SetId;
    property FuncaoId: Integer read GetFuncaoId write SetFuncaoId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property SolicitaAutorizacao: Boolean read GetSolicitaAutorizacao write SetSolicitaAutorizacao;
    property HabilitaF1: Boolean read GetHabilitaF1 write SetHabilitaF1;
    property Acesso: TString read GetAcesso write SetAcesso;
  end;

implementation

{ TFuncaoDaLojaList }

procedure TFuncaoDaLojaList.Add(const AFuncaoDaLoja: IFuncaoDaLoja);
begin
  FList.Add(AFuncaoDaLoja);
end;

procedure TFuncaoDaLojaList.Clear;
begin
  FList.Clear;
end;

function TFuncaoDaLojaList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TFuncaoDaLojaList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TFuncaoDaLojaList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TFuncaoDaLojaList.GetEnumerator: TFuncaoDaLojaListEnumerator;
begin
  Result := TFuncaoDaLojaListEnumerator.Create(Self);
end;

function TFuncaoDaLojaList.GetItems(AIndex: Integer): IFuncaoDaLoja;
begin
  Result := FList[AIndex] as IFuncaoDaLoja;
end;

function TFuncaoDaLojaList.GetReference: TFuncaoDaLojaList;
begin
  Result := Self;
end;

procedure TFuncaoDaLojaList.SetItems(AIndex: Integer; const Value: IFuncaoDaLoja);
begin
  FList[AIndex] := Value;
end;

{ TFuncaoDaLojaListEnumerator }

constructor TFuncaoDaLojaListEnumerator.Create(AFuncaoDaLojaList: TFuncaoDaLojaList);
begin
  inherited Create;
  FIndex := -1;
  FFuncaoDaLojaList := AFuncaoDaLojaList;
end;

function TFuncaoDaLojaListEnumerator.GetCurrent: IFuncaoDaLoja;
begin
  Result := FFuncaoDaLojaList[FIndex];
end;

function TFuncaoDaLojaListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FFuncaoDaLojaList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TFuncaoDaLojaListRec }

class function TFuncaoDaLojaListRec.Create(const AList: IFuncaoDaLojaList): TFuncaoDaLojaListRec;
begin
  FillChar(Result, SizeOf(TFuncaoDaLojaListRec), 0);
  Result.FList := AList;
end;

class operator TFuncaoDaLojaListRec.Implicit(AListRec: TFuncaoDaLojaListRec): TFuncaoDaLojaList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TFuncaoDaLoja }

function TFuncaoDaLoja.GetId: Integer;
begin
  Result := FId;
end;

procedure TFuncaoDaLoja.SetId(const AId: Integer);
begin
  FId := AId;
end;

function TFuncaoDaLoja.GetFuncaoId: Integer;
begin
  Result := FFuncaoId;
end;

procedure TFuncaoDaLoja.SetFuncaoId(const AFuncaoId: Integer);
begin
  FFuncaoId := AFuncaoId;
end;

function TFuncaoDaLoja.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TFuncaoDaLoja.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

function TFuncaoDaLoja.GetLojaId: Int64;
begin
  Result := FLojaId;
end;

procedure TFuncaoDaLoja.SetLojaId(const ALojaId: Int64);
begin
  FLojaId := ALojaId;
end;

function TFuncaoDaLoja.GetSolicitaAutorizacao: Boolean;
begin
  Result := FSolicitaAutorizacao;
end;

procedure TFuncaoDaLoja.SetSolicitaAutorizacao(const ASolicitaAutorizacao: Boolean);
begin
  FSolicitaAutorizacao := ASolicitaAutorizacao;
end;

function TFuncaoDaLoja.GetHabilitaF1: Boolean;
begin
  Result := FHabilitaF1;
end;

procedure TFuncaoDaLoja.SetHabilitaF1(const AHabilitaF1: Boolean);
begin
  FHabilitaF1 := AHabilitaF1;
end;

function TFuncaoDaLoja.GetAcesso: TString;
begin
  Result := FAcesso;
end;

procedure TFuncaoDaLoja.SetAcesso(const AAcesso: TString);
begin
  FAcesso := AAcesso;
end;


end.
unit SDK.Model.PagueLeve;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IPagueLeve = interface(IModel)
    ['{307FD472-B2F0-4698-BBC7-8507D3BF9997}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetQuantidade: Int64;
    procedure SetQuantidade(const AQuantidade: Int64);
    function GetInicio: TDateTime;
    procedure SetInicio(const AInicio: TDateTime);
    function GetFim: TDateTime;
    procedure SetFim(const AFim: TDateTime);
    function GetTipoDePreco: TString;
    procedure SetTipoDePreco(const ATipoDePreco: TString);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
    function GetTipoDeValor: TString;
    procedure SetTipoDeValor(const ATipoDeValor: TString);
    function GetStatus: TStatusDaPromocao;
    procedure SetStatus(const AStatus: TStatusDaPromocao);
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property Quantidade: Int64 read GetQuantidade write SetQuantidade;
    property Inicio: TDateTime read GetInicio write SetInicio;
    property Fim: TDateTime read GetFim write SetFim;
    property TipoDePreco: TString read GetTipoDePreco write SetTipoDePreco;
    property Valor: Double read GetValor write SetValor;
    property TipoDeValor: TString read GetTipoDeValor write SetTipoDeValor;
    property Status: TStatusDaPromocao read GetStatus write SetStatus;
  end;

  TPagueLeveList = class;

  IPagueLeveList = interface
	['{C3D9690D-D3B9-418A-9C19-C93758E7A270}']
    function GetReference: TPagueLeveList;
    function GetItems(AIndex: Integer): IPagueLeve;
    procedure SetItems(AIndex: Integer; const Value: IPagueLeve);
    procedure Add(const APagueLeve: IPagueLeve);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IPagueLeve read GetItems write SetItems; default;
  end;

  TPagueLeveListEnumerator = class
  private
    FIndex: Integer;
    FPagueLeveList: TPagueLeveList;
  public
    constructor Create(APagueLeveList: TPagueLeveList);
    function GetCurrent: IPagueLeve; inline;
    function MoveNext: Boolean;
    property Current: IPagueLeve read GetCurrent;
  end;

  TPagueLeveList = class(TInterfacedObject, IPagueLeveList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IPagueLeve;
    procedure SetItems(AIndex: Integer; const Value: IPagueLeve);
  public
    constructor Create;
    procedure Add(const APagueLeve: IPagueLeve);
    destructor Destroy; override;
    function GetEnumerator: TPagueLeveListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TPagueLeveList;
    property Items[AIndex: Integer]: IPagueLeve read GetItems write SetItems; default;
  end;

  TPagueLeveListRec = record
  private
    FList: IPagueLeveList;
  public
    class function Create(const AList: IPagueLeveList): TPagueLeveListRec; static;
    class operator Implicit(AListRec: TPagueLeveListRec): TPagueLeveList;
  end;

  TPagueLeve = class(TInterfacedModel, IPagueLeve)
  private
	FId: Int64;
	FDescricao: TString;
	FQuantidade: Int64;
	FInicio: TDateTime;
	FFim: TDateTime;
	FTipoDePreco: TString;
	FValor: Double;
	FTipoDeValor: TString;
	FStatus: TStatusDaPromocao;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetQuantidade: Int64;
    procedure SetQuantidade(const AQuantidade: Int64);
    function GetInicio: TDateTime;
    procedure SetInicio(const AInicio: TDateTime);
    function GetFim: TDateTime;
    procedure SetFim(const AFim: TDateTime);
    function GetTipoDePreco: TString;
    procedure SetTipoDePreco(const ATipoDePreco: TString);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
    function GetTipoDeValor: TString;
    procedure SetTipoDeValor(const ATipoDeValor: TString);
    function GetStatus: TStatusDaPromocao;
    procedure SetStatus(const AStatus: TStatusDaPromocao);
  public
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property Quantidade: Int64 read GetQuantidade write SetQuantidade;
    property Inicio: TDateTime read GetInicio write SetInicio;
    property Fim: TDateTime read GetFim write SetFim;
    property TipoDePreco: TString read GetTipoDePreco write SetTipoDePreco;
    property Valor: Double read GetValor write SetValor;
    property TipoDeValor: TString read GetTipoDeValor write SetTipoDeValor;
    property Status: TStatusDaPromocao read GetStatus write SetStatus;
  end;

implementation

{ TPagueLeveList }

procedure TPagueLeveList.Add(const APagueLeve: IPagueLeve);
begin
  FList.Add(APagueLeve);
end;

procedure TPagueLeveList.Clear;
begin
  FList.Clear;
end;

function TPagueLeveList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TPagueLeveList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TPagueLeveList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TPagueLeveList.GetEnumerator: TPagueLeveListEnumerator;
begin
  Result := TPagueLeveListEnumerator.Create(Self);
end;

function TPagueLeveList.GetItems(AIndex: Integer): IPagueLeve;
begin
  Result := FList[AIndex] as IPagueLeve;
end;

function TPagueLeveList.GetReference: TPagueLeveList;
begin
  Result := Self;
end;

procedure TPagueLeveList.SetItems(AIndex: Integer; const Value: IPagueLeve);
begin
  FList[AIndex] := Value;
end;

{ TPagueLeveListEnumerator }

constructor TPagueLeveListEnumerator.Create(APagueLeveList: TPagueLeveList);
begin
  inherited Create;
  FIndex := -1;
  FPagueLeveList := APagueLeveList;
end;

function TPagueLeveListEnumerator.GetCurrent: IPagueLeve;
begin
  Result := FPagueLeveList[FIndex];
end;

function TPagueLeveListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FPagueLeveList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TPagueLeveListRec }

class function TPagueLeveListRec.Create(const AList: IPagueLeveList): TPagueLeveListRec;
begin
  FillChar(Result, SizeOf(TPagueLeveListRec), 0);
  Result.FList := AList;
end;

class operator TPagueLeveListRec.Implicit(AListRec: TPagueLeveListRec): TPagueLeveList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TPagueLeve }

function TPagueLeve.GetId: Int64;
begin
  Result := FId;
end;

procedure TPagueLeve.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TPagueLeve.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TPagueLeve.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

function TPagueLeve.GetQuantidade: Int64;
begin
  Result := FQuantidade;
end;

procedure TPagueLeve.SetQuantidade(const AQuantidade: Int64);
begin
  FQuantidade := AQuantidade;
end;

function TPagueLeve.GetInicio: TDateTime;
begin
  Result := FInicio;
end;

procedure TPagueLeve.SetInicio(const AInicio: TDateTime);
begin
  FInicio := AInicio;
end;

function TPagueLeve.GetFim: TDateTime;
begin
  Result := FFim;
end;

procedure TPagueLeve.SetFim(const AFim: TDateTime);
begin
  FFim := AFim;
end;

function TPagueLeve.GetTipoDePreco: TString;
begin
  Result := FTipoDePreco;
end;

procedure TPagueLeve.SetTipoDePreco(const ATipoDePreco: TString);
begin
  FTipoDePreco := ATipoDePreco;
end;

function TPagueLeve.GetValor: Double;
begin
  Result := FValor;
end;

procedure TPagueLeve.SetValor(const AValor: Double);
begin
  FValor := AValor;
end;

function TPagueLeve.GetTipoDeValor: TString;
begin
  Result := FTipoDeValor;
end;

procedure TPagueLeve.SetTipoDeValor(const ATipoDeValor: TString);
begin
  FTipoDeValor := ATipoDeValor;
end;

function TPagueLeve.GetStatus: TStatusDaPromocao;
begin
  Result := FStatus;
end;

procedure TPagueLeve.SetStatus(const AStatus: TStatusDaPromocao);
begin
  FStatus := AStatus;
end;


end.
unit SDK.Model.RegimeEstadualTributario;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IRegimeEstadualTributario = interface(IModel)
    ['{BC91FF4F-CA33-4856-A84A-A9C529876B6E}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetClassificacao: TString;
    procedure SetClassificacao(const AClassificacao: TString);
    function GetLoja: Boolean;
    procedure SetLoja(const ALoja: Boolean);
    function GetFornecedor: Boolean;
    procedure SetFornecedor(const AFornecedor: Boolean);
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property Classificacao: TString read GetClassificacao write SetClassificacao;
    property Loja: Boolean read GetLoja write SetLoja;
    property Fornecedor: Boolean read GetFornecedor write SetFornecedor;
  end;

  TRegimeEstadualTributarioList = class;

  IRegimeEstadualTributarioList = interface
	['{FE024801-592D-4B9F-B1B6-1B82381FECFF}']
    function GetReference: TRegimeEstadualTributarioList;
    function GetItems(AIndex: Integer): IRegimeEstadualTributario;
    procedure SetItems(AIndex: Integer; const Value: IRegimeEstadualTributario);
    procedure Add(const ARegimeEstadualTributario: IRegimeEstadualTributario);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IRegimeEstadualTributario read GetItems write SetItems; default;
  end;

  TRegimeEstadualTributarioListEnumerator = class
  private
    FIndex: Integer;
    FRegimeEstadualTributarioList: TRegimeEstadualTributarioList;
  public
    constructor Create(ARegimeEstadualTributarioList: TRegimeEstadualTributarioList);
    function GetCurrent: IRegimeEstadualTributario; inline;
    function MoveNext: Boolean;
    property Current: IRegimeEstadualTributario read GetCurrent;
  end;

  TRegimeEstadualTributarioList = class(TInterfacedObject, IRegimeEstadualTributarioList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IRegimeEstadualTributario;
    procedure SetItems(AIndex: Integer; const Value: IRegimeEstadualTributario);
  public
    constructor Create;
    procedure Add(const ARegimeEstadualTributario: IRegimeEstadualTributario);
    destructor Destroy; override;
    function GetEnumerator: TRegimeEstadualTributarioListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TRegimeEstadualTributarioList;
    property Items[AIndex: Integer]: IRegimeEstadualTributario read GetItems write SetItems; default;
  end;

  TRegimeEstadualTributarioListRec = record
  private
    FList: IRegimeEstadualTributarioList;
  public
    class function Create(const AList: IRegimeEstadualTributarioList): TRegimeEstadualTributarioListRec; static;
    class operator Implicit(AListRec: TRegimeEstadualTributarioListRec): TRegimeEstadualTributarioList;
  end;

  TRegimeEstadualTributario = class(TInterfacedModel, IRegimeEstadualTributario)
  private
	FId: Int64;
	FDescricao: TString;
	FClassificacao: TString;
	FLoja: Boolean;
	FFornecedor: Boolean;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetClassificacao: TString;
    procedure SetClassificacao(const AClassificacao: TString);
    function GetLoja: Boolean;
    procedure SetLoja(const ALoja: Boolean);
    function GetFornecedor: Boolean;
    procedure SetFornecedor(const AFornecedor: Boolean);
  published
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property Classificacao: TString read GetClassificacao write SetClassificacao;
    property Loja: Boolean read GetLoja write SetLoja;
    property Fornecedor: Boolean read GetFornecedor write SetFornecedor;
  end;

implementation

{ TRegimeEstadualTributarioList }

procedure TRegimeEstadualTributarioList.Add(const ARegimeEstadualTributario: IRegimeEstadualTributario);
begin
  FList.Add(ARegimeEstadualTributario);
end;

procedure TRegimeEstadualTributarioList.Clear;
begin
  FList.Clear;
end;

function TRegimeEstadualTributarioList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TRegimeEstadualTributarioList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TRegimeEstadualTributarioList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TRegimeEstadualTributarioList.GetEnumerator: TRegimeEstadualTributarioListEnumerator;
begin
  Result := TRegimeEstadualTributarioListEnumerator.Create(Self);
end;

function TRegimeEstadualTributarioList.GetItems(AIndex: Integer): IRegimeEstadualTributario;
begin
  Result := FList[AIndex] as IRegimeEstadualTributario;
end;

function TRegimeEstadualTributarioList.GetReference: TRegimeEstadualTributarioList;
begin
  Result := Self;
end;

procedure TRegimeEstadualTributarioList.SetItems(AIndex: Integer; const Value: IRegimeEstadualTributario);
begin
  FList[AIndex] := Value;
end;

{ TRegimeEstadualTributarioListEnumerator }

constructor TRegimeEstadualTributarioListEnumerator.Create(ARegimeEstadualTributarioList: TRegimeEstadualTributarioList);
begin
  inherited Create;
  FIndex := -1;
  FRegimeEstadualTributarioList := ARegimeEstadualTributarioList;
end;

function TRegimeEstadualTributarioListEnumerator.GetCurrent: IRegimeEstadualTributario;
begin
  Result := FRegimeEstadualTributarioList[FIndex];
end;

function TRegimeEstadualTributarioListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FRegimeEstadualTributarioList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TRegimeEstadualTributarioListRec }

class function TRegimeEstadualTributarioListRec.Create(const AList: IRegimeEstadualTributarioList): TRegimeEstadualTributarioListRec;
begin
  FillChar(Result, SizeOf(TRegimeEstadualTributarioListRec), 0);
  Result.FList := AList;
end;

class operator TRegimeEstadualTributarioListRec.Implicit(AListRec: TRegimeEstadualTributarioListRec): TRegimeEstadualTributarioList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TRegimeEstadualTributario }

function TRegimeEstadualTributario.GetId: Int64;
begin
  Result := FId;
end;

procedure TRegimeEstadualTributario.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TRegimeEstadualTributario.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TRegimeEstadualTributario.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

function TRegimeEstadualTributario.GetClassificacao: TString;
begin
  Result := FClassificacao;
end;

procedure TRegimeEstadualTributario.SetClassificacao(const AClassificacao: TString);
begin
  FClassificacao := AClassificacao;
end;

function TRegimeEstadualTributario.GetLoja: Boolean;
begin
  Result := FLoja;
end;

procedure TRegimeEstadualTributario.SetLoja(const ALoja: Boolean);
begin
  FLoja := ALoja;
end;

function TRegimeEstadualTributario.GetFornecedor: Boolean;
begin
  Result := FFornecedor;
end;

procedure TRegimeEstadualTributario.SetFornecedor(const AFornecedor: Boolean);
begin
  FFornecedor := AFornecedor;
end;


end.
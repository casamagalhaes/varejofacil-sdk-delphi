unit SDK.Model.Tributacao;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ITributacao = interface(IModel)
    ['{2B8CFD2B-75D4-4E64-B466-BA9CC9A9748C}']
    function GetId: TString;
    procedure SetId(const AId: TString);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetSimbologia: TString;
    procedure SetSimbologia(const ASimbologia: TString);
    function GetCodigo: TString;
    procedure SetCodigo(const ACodigo: TString);
    function GetAliquotaNF: Double;
    procedure SetAliquotaNF(const AAliquotaNF: Double);
    function GetReducao: Double;
    procedure SetReducao(const AReducao: Double);
    function GetCstNotasFiscais: TString;
    procedure SetCstNotasFiscais(const ACstNotasFiscais: TString);
    function GetCsosnNF: TString;
    procedure SetCsosnNF(const ACsosnNF: TString);
    function GetCfopNF: TString;
    procedure SetCfopNF(const ACfopNF: TString);
    function GetSimbologiaCF: TString;
    procedure SetSimbologiaCF(const ASimbologiaCF: TString);
    function GetCstCuponsFiscais: TString;
    procedure SetCstCuponsFiscais(const ACstCuponsFiscais: TString);
    function GetCsosnCF: TString;
    procedure SetCsosnCF(const ACsosnCF: TString);
    function GetCfopCF: TString;
    procedure SetCfopCF(const ACfopCF: TString);
    function GetAliquotaECF: Double;
    procedure SetAliquotaECF(const AAliquotaECF: Double);
    property Id: TString read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property Simbologia: TString read GetSimbologia write SetSimbologia;
    property Codigo: TString read GetCodigo write SetCodigo;
    property AliquotaNF: Double read GetAliquotaNF write SetAliquotaNF;
    property Reducao: Double read GetReducao write SetReducao;
    property CstNotasFiscais: TString read GetCstNotasFiscais write SetCstNotasFiscais;
    property CsosnNF: TString read GetCsosnNF write SetCsosnNF;
    property CfopNF: TString read GetCfopNF write SetCfopNF;
    property SimbologiaCF: TString read GetSimbologiaCF write SetSimbologiaCF;
    property CstCuponsFiscais: TString read GetCstCuponsFiscais write SetCstCuponsFiscais;
    property CsosnCF: TString read GetCsosnCF write SetCsosnCF;
    property CfopCF: TString read GetCfopCF write SetCfopCF;
    property AliquotaECF: Double read GetAliquotaECF write SetAliquotaECF;
  end;

  TTributacaoList = class;

  ITributacaoList = interface
	['{16A850E3-FDC2-4216-8F20-4B3971B6D313}']
    function GetReference: TTributacaoList;
    function GetItems(AIndex: Integer): ITributacao;
    procedure SetItems(AIndex: Integer; const Value: ITributacao);
    procedure Add(const ATributacao: ITributacao);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ITributacao read GetItems write SetItems; default;
  end;

  TTributacaoListEnumerator = class
  private
    FIndex: Integer;
    FTributacaoList: TTributacaoList;
  public
    constructor Create(ATributacaoList: TTributacaoList);
    function GetCurrent: ITributacao; inline;
    function MoveNext: Boolean;
    property Current: ITributacao read GetCurrent;
  end;

  TTributacaoList = class(TInterfacedObject, ITributacaoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ITributacao;
    procedure SetItems(AIndex: Integer; const Value: ITributacao);
  public
    constructor Create;
    procedure Add(const ATributacao: ITributacao);
    destructor Destroy; override;
    function GetEnumerator: TTributacaoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TTributacaoList;
    property Items[AIndex: Integer]: ITributacao read GetItems write SetItems; default;
  end;

  TTributacaoListRec = record
  private
    FList: ITributacaoList;
  public
    class function Create(const AList: ITributacaoList): TTributacaoListRec; static;
    class operator Implicit(AListRec: TTributacaoListRec): TTributacaoList;
  end;

  TTributacao = class(TInterfacedModel, ITributacao)
  private
	FId: TString;
	FDescricao: TString;
	FSimbologia: TString;
	FCodigo: TString;
	FAliquotaNF: Double;
	FReducao: Double;
	FCstNotasFiscais: TString;
	FCsosnNF: TString;
	FCfopNF: TString;
	FSimbologiaCF: TString;
	FCstCuponsFiscais: TString;
	FCsosnCF: TString;
	FCfopCF: TString;
	FAliquotaECF: Double;
    function GetId: TString;
    procedure SetId(const AId: TString);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetSimbologia: TString;
    procedure SetSimbologia(const ASimbologia: TString);
    function GetCodigo: TString;
    procedure SetCodigo(const ACodigo: TString);
    function GetAliquotaNF: Double;
    procedure SetAliquotaNF(const AAliquotaNF: Double);
    function GetReducao: Double;
    procedure SetReducao(const AReducao: Double);
    function GetCstNotasFiscais: TString;
    procedure SetCstNotasFiscais(const ACstNotasFiscais: TString);
    function GetCsosnNF: TString;
    procedure SetCsosnNF(const ACsosnNF: TString);
    function GetCfopNF: TString;
    procedure SetCfopNF(const ACfopNF: TString);
    function GetSimbologiaCF: TString;
    procedure SetSimbologiaCF(const ASimbologiaCF: TString);
    function GetCstCuponsFiscais: TString;
    procedure SetCstCuponsFiscais(const ACstCuponsFiscais: TString);
    function GetCsosnCF: TString;
    procedure SetCsosnCF(const ACsosnCF: TString);
    function GetCfopCF: TString;
    procedure SetCfopCF(const ACfopCF: TString);
    function GetAliquotaECF: Double;
    procedure SetAliquotaECF(const AAliquotaECF: Double);
  public
    property Id: TString read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property Simbologia: TString read GetSimbologia write SetSimbologia;
    property Codigo: TString read GetCodigo write SetCodigo;
    property AliquotaNF: Double read GetAliquotaNF write SetAliquotaNF;
    property Reducao: Double read GetReducao write SetReducao;
    property CstNotasFiscais: TString read GetCstNotasFiscais write SetCstNotasFiscais;
    property CsosnNF: TString read GetCsosnNF write SetCsosnNF;
    property CfopNF: TString read GetCfopNF write SetCfopNF;
    property SimbologiaCF: TString read GetSimbologiaCF write SetSimbologiaCF;
    property CstCuponsFiscais: TString read GetCstCuponsFiscais write SetCstCuponsFiscais;
    property CsosnCF: TString read GetCsosnCF write SetCsosnCF;
    property CfopCF: TString read GetCfopCF write SetCfopCF;
    property AliquotaECF: Double read GetAliquotaECF write SetAliquotaECF;
  end;

implementation

{ TTributacaoList }

procedure TTributacaoList.Add(const ATributacao: ITributacao);
begin
  FList.Add(ATributacao);
end;

procedure TTributacaoList.Clear;
begin
  FList.Clear;
end;

function TTributacaoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TTributacaoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TTributacaoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TTributacaoList.GetEnumerator: TTributacaoListEnumerator;
begin
  Result := TTributacaoListEnumerator.Create(Self);
end;

function TTributacaoList.GetItems(AIndex: Integer): ITributacao;
begin
  Result := FList[AIndex] as ITributacao;
end;

function TTributacaoList.GetReference: TTributacaoList;
begin
  Result := Self;
end;

procedure TTributacaoList.SetItems(AIndex: Integer; const Value: ITributacao);
begin
  FList[AIndex] := Value;
end;

{ TTributacaoListEnumerator }

constructor TTributacaoListEnumerator.Create(ATributacaoList: TTributacaoList);
begin
  inherited Create;
  FIndex := -1;
  FTributacaoList := ATributacaoList;
end;

function TTributacaoListEnumerator.GetCurrent: ITributacao;
begin
  Result := FTributacaoList[FIndex];
end;

function TTributacaoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FTributacaoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TTributacaoListRec }

class function TTributacaoListRec.Create(const AList: ITributacaoList): TTributacaoListRec;
begin
  FillChar(Result, SizeOf(TTributacaoListRec), 0);
  Result.FList := AList;
end;

class operator TTributacaoListRec.Implicit(AListRec: TTributacaoListRec): TTributacaoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TTributacao }

function TTributacao.GetId: TString;
begin
  Result := FId;
end;

procedure TTributacao.SetId(const AId: TString);
begin
  FId := AId;
end;

function TTributacao.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TTributacao.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

function TTributacao.GetSimbologia: TString;
begin
  Result := FSimbologia;
end;

procedure TTributacao.SetSimbologia(const ASimbologia: TString);
begin
  FSimbologia := ASimbologia;
end;

function TTributacao.GetCodigo: TString;
begin
  Result := FCodigo;
end;

procedure TTributacao.SetCodigo(const ACodigo: TString);
begin
  FCodigo := ACodigo;
end;

function TTributacao.GetAliquotaNF: Double;
begin
  Result := FAliquotaNF;
end;

procedure TTributacao.SetAliquotaNF(const AAliquotaNF: Double);
begin
  FAliquotaNF := AAliquotaNF;
end;

function TTributacao.GetReducao: Double;
begin
  Result := FReducao;
end;

procedure TTributacao.SetReducao(const AReducao: Double);
begin
  FReducao := AReducao;
end;

function TTributacao.GetCstNotasFiscais: TString;
begin
  Result := FCstNotasFiscais;
end;

procedure TTributacao.SetCstNotasFiscais(const ACstNotasFiscais: TString);
begin
  FCstNotasFiscais := ACstNotasFiscais;
end;

function TTributacao.GetCsosnNF: TString;
begin
  Result := FCsosnNF;
end;

procedure TTributacao.SetCsosnNF(const ACsosnNF: TString);
begin
  FCsosnNF := ACsosnNF;
end;

function TTributacao.GetCfopNF: TString;
begin
  Result := FCfopNF;
end;

procedure TTributacao.SetCfopNF(const ACfopNF: TString);
begin
  FCfopNF := ACfopNF;
end;

function TTributacao.GetSimbologiaCF: TString;
begin
  Result := FSimbologiaCF;
end;

procedure TTributacao.SetSimbologiaCF(const ASimbologiaCF: TString);
begin
  FSimbologiaCF := ASimbologiaCF;
end;

function TTributacao.GetCstCuponsFiscais: TString;
begin
  Result := FCstCuponsFiscais;
end;

procedure TTributacao.SetCstCuponsFiscais(const ACstCuponsFiscais: TString);
begin
  FCstCuponsFiscais := ACstCuponsFiscais;
end;

function TTributacao.GetCsosnCF: TString;
begin
  Result := FCsosnCF;
end;

procedure TTributacao.SetCsosnCF(const ACsosnCF: TString);
begin
  FCsosnCF := ACsosnCF;
end;

function TTributacao.GetCfopCF: TString;
begin
  Result := FCfopCF;
end;

procedure TTributacao.SetCfopCF(const ACfopCF: TString);
begin
  FCfopCF := ACfopCF;
end;

function TTributacao.GetAliquotaECF: Double;
begin
  Result := FAliquotaECF;
end;

procedure TTributacao.SetAliquotaECF(const AAliquotaECF: Double);
begin
  FAliquotaECF := AAliquotaECF;
end;


end.
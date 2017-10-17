unit SDK.Model.ItemDaTabelaDeTributacao;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IItemDaTabelaDeTributacao = interface(IModel)
    ['{9C62A73B-ADE3-4DC9-A1AB-C866D7DD011B}']
    function GetUf: TString;
    procedure SetUf(const AUf: TString);
    function GetClassificacaoDePessoa: TClassificacaoPessoa;
    procedure SetClassificacaoDePessoa(const AClassificacaoDePessoa: TClassificacaoPessoa);
    function GetTributadoNF: Double;
    procedure SetTributadoNF(const ATributadoNF: Double);
    function GetIsentoNF: Double;
    procedure SetIsentoNF(const AIsentoNF: Double);
    function GetOutrosNF: Double;
    procedure SetOutrosNF(const AOutrosNF: Double);
    function GetAliquota: Double;
    procedure SetAliquota(const AAliquota: Double);
    function GetAgregado: Double;
    procedure SetAgregado(const AAgregado: Double);
    function GetTributadoICMS: Double;
    procedure SetTributadoICMS(const ATributadoICMS: Double);
    function GetCargaLiquida: Double;
    procedure SetCargaLiquida(const ACargaLiquida: Double);
    function GetAliquotaInterna: Double;
    procedure SetAliquotaInterna(const AAliquotaInterna: Double);
    function GetFecop: Double;
    procedure SetFecop(const AFecop: Double);
    function GetCstId: Integer;
    procedure SetCstId(const ACstId: Integer);
    function GetCstDocumentoFiscalId: Integer;
    procedure SetCstDocumentoFiscalId(const ACstDocumentoFiscalId: Integer);
    function GetCstCuponsFiscaisId: Integer;
    procedure SetCstCuponsFiscaisId(const ACstCuponsFiscaisId: Integer);
    function GetCsosn: TCSOSN;
    procedure SetCsosn(const ACsosn: TCSOSN);
    function GetCsosnDocumentoFiscal: TCSOSN;
    procedure SetCsosnDocumentoFiscal(const ACsosnDocumentoFiscal: TCSOSN);
    function GetTributacao: TString;
    procedure SetTributacao(const ATributacao: TString);
    function GetCfopId: Int64;
    procedure SetCfopId(const ACfopId: Int64);
    function GetCfopCuponsFiscaisId: Int64;
    procedure SetCfopCuponsFiscaisId(const ACfopCuponsFiscaisId: Int64);
    property Uf: TString read GetUf write SetUf;
    property ClassificacaoDePessoa: TClassificacaoPessoa read GetClassificacaoDePessoa write SetClassificacaoDePessoa;
    property TributadoNF: Double read GetTributadoNF write SetTributadoNF;
    property IsentoNF: Double read GetIsentoNF write SetIsentoNF;
    property OutrosNF: Double read GetOutrosNF write SetOutrosNF;
    property Aliquota: Double read GetAliquota write SetAliquota;
    property Agregado: Double read GetAgregado write SetAgregado;
    property TributadoICMS: Double read GetTributadoICMS write SetTributadoICMS;
    property CargaLiquida: Double read GetCargaLiquida write SetCargaLiquida;
    property AliquotaInterna: Double read GetAliquotaInterna write SetAliquotaInterna;
    property Fecop: Double read GetFecop write SetFecop;
    property CstId: Integer read GetCstId write SetCstId;
    property CstDocumentoFiscalId: Integer read GetCstDocumentoFiscalId write SetCstDocumentoFiscalId;
    property CstCuponsFiscaisId: Integer read GetCstCuponsFiscaisId write SetCstCuponsFiscaisId;
    property Csosn: TCSOSN read GetCsosn write SetCsosn;
    property CsosnDocumentoFiscal: TCSOSN read GetCsosnDocumentoFiscal write SetCsosnDocumentoFiscal;
    property Tributacao: TString read GetTributacao write SetTributacao;
    property CfopId: Int64 read GetCfopId write SetCfopId;
    property CfopCuponsFiscaisId: Int64 read GetCfopCuponsFiscaisId write SetCfopCuponsFiscaisId;
  end;

  TItemDaTabelaDeTributacaoList = class;

  IItemDaTabelaDeTributacaoList = interface
	['{F5364F44-87D7-4022-99A4-48A620C904FB}']
    function GetReference: TItemDaTabelaDeTributacaoList;
    function GetItems(AIndex: Integer): IItemDaTabelaDeTributacao;
    procedure SetItems(AIndex: Integer; const Value: IItemDaTabelaDeTributacao);
    procedure Add(const AItemDaTabelaDeTributacao: IItemDaTabelaDeTributacao);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IItemDaTabelaDeTributacao read GetItems write SetItems; default;
  end;

  TItemDaTabelaDeTributacaoListEnumerator = class
  private
    FIndex: Integer;
    FItemDaTabelaDeTributacaoList: TItemDaTabelaDeTributacaoList;
  public
    constructor Create(AItemDaTabelaDeTributacaoList: TItemDaTabelaDeTributacaoList);
    function GetCurrent: IItemDaTabelaDeTributacao; inline;
    function MoveNext: Boolean;
    property Current: IItemDaTabelaDeTributacao read GetCurrent;
  end;

  TItemDaTabelaDeTributacaoList = class(TInterfacedObject, IItemDaTabelaDeTributacaoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IItemDaTabelaDeTributacao;
    procedure SetItems(AIndex: Integer; const Value: IItemDaTabelaDeTributacao);
  public
    constructor Create;
    procedure Add(const AItemDaTabelaDeTributacao: IItemDaTabelaDeTributacao);
    destructor Destroy; override;
    function GetEnumerator: TItemDaTabelaDeTributacaoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TItemDaTabelaDeTributacaoList;
    property Items[AIndex: Integer]: IItemDaTabelaDeTributacao read GetItems write SetItems; default;
  end;

  TItemDaTabelaDeTributacaoListRec = record
  private
    FList: IItemDaTabelaDeTributacaoList;
  public
    class function Create(const AList: IItemDaTabelaDeTributacaoList): TItemDaTabelaDeTributacaoListRec; static;
    class operator Implicit(AListRec: TItemDaTabelaDeTributacaoListRec): TItemDaTabelaDeTributacaoList;
  end;

  TItemDaTabelaDeTributacao = class(TInterfacedModel, IItemDaTabelaDeTributacao)
  private
	FUf: TString;
	FClassificacaoDePessoa: TClassificacaoPessoa;
	FTributadoNF: Double;
	FIsentoNF: Double;
	FOutrosNF: Double;
	FAliquota: Double;
	FAgregado: Double;
	FTributadoICMS: Double;
	FCargaLiquida: Double;
	FAliquotaInterna: Double;
	FFecop: Double;
	FCstId: Integer;
	FCstDocumentoFiscalId: Integer;
	FCstCuponsFiscaisId: Integer;
	FCsosn: TCSOSN;
	FCsosnDocumentoFiscal: TCSOSN;
	FTributacao: TString;
	FCfopId: Int64;
	FCfopCuponsFiscaisId: Int64;
    function GetUf: TString;
    procedure SetUf(const AUf: TString);
    function GetClassificacaoDePessoa: TClassificacaoPessoa;
    procedure SetClassificacaoDePessoa(const AClassificacaoDePessoa: TClassificacaoPessoa);
    function GetTributadoNF: Double;
    procedure SetTributadoNF(const ATributadoNF: Double);
    function GetIsentoNF: Double;
    procedure SetIsentoNF(const AIsentoNF: Double);
    function GetOutrosNF: Double;
    procedure SetOutrosNF(const AOutrosNF: Double);
    function GetAliquota: Double;
    procedure SetAliquota(const AAliquota: Double);
    function GetAgregado: Double;
    procedure SetAgregado(const AAgregado: Double);
    function GetTributadoICMS: Double;
    procedure SetTributadoICMS(const ATributadoICMS: Double);
    function GetCargaLiquida: Double;
    procedure SetCargaLiquida(const ACargaLiquida: Double);
    function GetAliquotaInterna: Double;
    procedure SetAliquotaInterna(const AAliquotaInterna: Double);
    function GetFecop: Double;
    procedure SetFecop(const AFecop: Double);
    function GetCstId: Integer;
    procedure SetCstId(const ACstId: Integer);
    function GetCstDocumentoFiscalId: Integer;
    procedure SetCstDocumentoFiscalId(const ACstDocumentoFiscalId: Integer);
    function GetCstCuponsFiscaisId: Integer;
    procedure SetCstCuponsFiscaisId(const ACstCuponsFiscaisId: Integer);
    function GetCsosn: TCSOSN;
    procedure SetCsosn(const ACsosn: TCSOSN);
    function GetCsosnDocumentoFiscal: TCSOSN;
    procedure SetCsosnDocumentoFiscal(const ACsosnDocumentoFiscal: TCSOSN);
    function GetTributacao: TString;
    procedure SetTributacao(const ATributacao: TString);
    function GetCfopId: Int64;
    procedure SetCfopId(const ACfopId: Int64);
    function GetCfopCuponsFiscaisId: Int64;
    procedure SetCfopCuponsFiscaisId(const ACfopCuponsFiscaisId: Int64);
  published
    property Uf: TString read GetUf write SetUf;
    property ClassificacaoDePessoa: TClassificacaoPessoa read GetClassificacaoDePessoa write SetClassificacaoDePessoa;
    property TributadoNF: Double read GetTributadoNF write SetTributadoNF;
    property IsentoNF: Double read GetIsentoNF write SetIsentoNF;
    property OutrosNF: Double read GetOutrosNF write SetOutrosNF;
    property Aliquota: Double read GetAliquota write SetAliquota;
    property Agregado: Double read GetAgregado write SetAgregado;
    property TributadoICMS: Double read GetTributadoICMS write SetTributadoICMS;
    property CargaLiquida: Double read GetCargaLiquida write SetCargaLiquida;
    property AliquotaInterna: Double read GetAliquotaInterna write SetAliquotaInterna;
    property Fecop: Double read GetFecop write SetFecop;
    property CstId: Integer read GetCstId write SetCstId;
    property CstDocumentoFiscalId: Integer read GetCstDocumentoFiscalId write SetCstDocumentoFiscalId;
    property CstCuponsFiscaisId: Integer read GetCstCuponsFiscaisId write SetCstCuponsFiscaisId;
    property Csosn: TCSOSN read GetCsosn write SetCsosn;
    property CsosnDocumentoFiscal: TCSOSN read GetCsosnDocumentoFiscal write SetCsosnDocumentoFiscal;
    property Tributacao: TString read GetTributacao write SetTributacao;
    property CfopId: Int64 read GetCfopId write SetCfopId;
    property CfopCuponsFiscaisId: Int64 read GetCfopCuponsFiscaisId write SetCfopCuponsFiscaisId;
  end;

implementation

{ TItemDaTabelaDeTributacaoList }

procedure TItemDaTabelaDeTributacaoList.Add(const AItemDaTabelaDeTributacao: IItemDaTabelaDeTributacao);
begin
  FList.Add(AItemDaTabelaDeTributacao);
end;

procedure TItemDaTabelaDeTributacaoList.Clear;
begin
  FList.Clear;
end;

function TItemDaTabelaDeTributacaoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TItemDaTabelaDeTributacaoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TItemDaTabelaDeTributacaoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TItemDaTabelaDeTributacaoList.GetEnumerator: TItemDaTabelaDeTributacaoListEnumerator;
begin
  Result := TItemDaTabelaDeTributacaoListEnumerator.Create(Self);
end;

function TItemDaTabelaDeTributacaoList.GetItems(AIndex: Integer): IItemDaTabelaDeTributacao;
begin
  Result := FList[AIndex] as IItemDaTabelaDeTributacao;
end;

function TItemDaTabelaDeTributacaoList.GetReference: TItemDaTabelaDeTributacaoList;
begin
  Result := Self;
end;

procedure TItemDaTabelaDeTributacaoList.SetItems(AIndex: Integer; const Value: IItemDaTabelaDeTributacao);
begin
  FList[AIndex] := Value;
end;

{ TItemDaTabelaDeTributacaoListEnumerator }

constructor TItemDaTabelaDeTributacaoListEnumerator.Create(AItemDaTabelaDeTributacaoList: TItemDaTabelaDeTributacaoList);
begin
  inherited Create;
  FIndex := -1;
  FItemDaTabelaDeTributacaoList := AItemDaTabelaDeTributacaoList;
end;

function TItemDaTabelaDeTributacaoListEnumerator.GetCurrent: IItemDaTabelaDeTributacao;
begin
  Result := FItemDaTabelaDeTributacaoList[FIndex];
end;

function TItemDaTabelaDeTributacaoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FItemDaTabelaDeTributacaoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TItemDaTabelaDeTributacaoListRec }

class function TItemDaTabelaDeTributacaoListRec.Create(const AList: IItemDaTabelaDeTributacaoList): TItemDaTabelaDeTributacaoListRec;
begin
  FillChar(Result, SizeOf(TItemDaTabelaDeTributacaoListRec), 0);
  Result.FList := AList;
end;

class operator TItemDaTabelaDeTributacaoListRec.Implicit(AListRec: TItemDaTabelaDeTributacaoListRec): TItemDaTabelaDeTributacaoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TItemDaTabelaDeTributacao }

function TItemDaTabelaDeTributacao.GetUf: TString;
begin
  Result := FUf;
end;

procedure TItemDaTabelaDeTributacao.SetUf(const AUf: TString);
begin
  FUf := AUf;
end;

function TItemDaTabelaDeTributacao.GetClassificacaoDePessoa: TClassificacaoPessoa;
begin
  Result := FClassificacaoDePessoa;
end;

procedure TItemDaTabelaDeTributacao.SetClassificacaoDePessoa(const AClassificacaoDePessoa: TClassificacaoPessoa);
begin
  FClassificacaoDePessoa := AClassificacaoDePessoa;
end;

function TItemDaTabelaDeTributacao.GetTributadoNF: Double;
begin
  Result := FTributadoNF;
end;

procedure TItemDaTabelaDeTributacao.SetTributadoNF(const ATributadoNF: Double);
begin
  FTributadoNF := ATributadoNF;
end;

function TItemDaTabelaDeTributacao.GetIsentoNF: Double;
begin
  Result := FIsentoNF;
end;

procedure TItemDaTabelaDeTributacao.SetIsentoNF(const AIsentoNF: Double);
begin
  FIsentoNF := AIsentoNF;
end;

function TItemDaTabelaDeTributacao.GetOutrosNF: Double;
begin
  Result := FOutrosNF;
end;

procedure TItemDaTabelaDeTributacao.SetOutrosNF(const AOutrosNF: Double);
begin
  FOutrosNF := AOutrosNF;
end;

function TItemDaTabelaDeTributacao.GetAliquota: Double;
begin
  Result := FAliquota;
end;

procedure TItemDaTabelaDeTributacao.SetAliquota(const AAliquota: Double);
begin
  FAliquota := AAliquota;
end;

function TItemDaTabelaDeTributacao.GetAgregado: Double;
begin
  Result := FAgregado;
end;

procedure TItemDaTabelaDeTributacao.SetAgregado(const AAgregado: Double);
begin
  FAgregado := AAgregado;
end;

function TItemDaTabelaDeTributacao.GetTributadoICMS: Double;
begin
  Result := FTributadoICMS;
end;

procedure TItemDaTabelaDeTributacao.SetTributadoICMS(const ATributadoICMS: Double);
begin
  FTributadoICMS := ATributadoICMS;
end;

function TItemDaTabelaDeTributacao.GetCargaLiquida: Double;
begin
  Result := FCargaLiquida;
end;

procedure TItemDaTabelaDeTributacao.SetCargaLiquida(const ACargaLiquida: Double);
begin
  FCargaLiquida := ACargaLiquida;
end;

function TItemDaTabelaDeTributacao.GetAliquotaInterna: Double;
begin
  Result := FAliquotaInterna;
end;

procedure TItemDaTabelaDeTributacao.SetAliquotaInterna(const AAliquotaInterna: Double);
begin
  FAliquotaInterna := AAliquotaInterna;
end;

function TItemDaTabelaDeTributacao.GetFecop: Double;
begin
  Result := FFecop;
end;

procedure TItemDaTabelaDeTributacao.SetFecop(const AFecop: Double);
begin
  FFecop := AFecop;
end;

function TItemDaTabelaDeTributacao.GetCstId: Integer;
begin
  Result := FCstId;
end;

procedure TItemDaTabelaDeTributacao.SetCstId(const ACstId: Integer);
begin
  FCstId := ACstId;
end;

function TItemDaTabelaDeTributacao.GetCstDocumentoFiscalId: Integer;
begin
  Result := FCstDocumentoFiscalId;
end;

procedure TItemDaTabelaDeTributacao.SetCstDocumentoFiscalId(const ACstDocumentoFiscalId: Integer);
begin
  FCstDocumentoFiscalId := ACstDocumentoFiscalId;
end;

function TItemDaTabelaDeTributacao.GetCstCuponsFiscaisId: Integer;
begin
  Result := FCstCuponsFiscaisId;
end;

procedure TItemDaTabelaDeTributacao.SetCstCuponsFiscaisId(const ACstCuponsFiscaisId: Integer);
begin
  FCstCuponsFiscaisId := ACstCuponsFiscaisId;
end;

function TItemDaTabelaDeTributacao.GetCsosn: TCSOSN;
begin
  Result := FCsosn;
end;

procedure TItemDaTabelaDeTributacao.SetCsosn(const ACsosn: TCSOSN);
begin
  FCsosn := ACsosn;
end;

function TItemDaTabelaDeTributacao.GetCsosnDocumentoFiscal: TCSOSN;
begin
  Result := FCsosnDocumentoFiscal;
end;

procedure TItemDaTabelaDeTributacao.SetCsosnDocumentoFiscal(const ACsosnDocumentoFiscal: TCSOSN);
begin
  FCsosnDocumentoFiscal := ACsosnDocumentoFiscal;
end;

function TItemDaTabelaDeTributacao.GetTributacao: TString;
begin
  Result := FTributacao;
end;

procedure TItemDaTabelaDeTributacao.SetTributacao(const ATributacao: TString);
begin
  FTributacao := ATributacao;
end;

function TItemDaTabelaDeTributacao.GetCfopId: Int64;
begin
  Result := FCfopId;
end;

procedure TItemDaTabelaDeTributacao.SetCfopId(const ACfopId: Int64);
begin
  FCfopId := ACfopId;
end;

function TItemDaTabelaDeTributacao.GetCfopCuponsFiscaisId: Int64;
begin
  Result := FCfopCuponsFiscaisId;
end;

procedure TItemDaTabelaDeTributacao.SetCfopCuponsFiscaisId(const ACfopCuponsFiscaisId: Int64);
begin
  FCfopCuponsFiscaisId := ACfopCuponsFiscaisId;
end;


end.
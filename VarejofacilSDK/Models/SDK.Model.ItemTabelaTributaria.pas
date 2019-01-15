unit SDK.Model.ItemTabelaTributaria;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IItemTabelaTributaria = interface(IModel)
    ['{9C62A73B-ADE3-4DC9-A1AB-C866D7DD011B}']
    function GetId: Variant;
    procedure SetId(const AId: Variant);
    function GetUf: TString;
    procedure SetUf(const AUf: TString);
    function GetClassificacaoDePessoa: TClassificacaoDePessoa;
    procedure SetClassificacaoDePessoa(const AClassificacaoDePessoa: TClassificacaoDePessoa);
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
    function GetFecopST: Double;
    procedure SetFecopST(const AFecopST: Double);
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
    function GetCfopId: Variant;
    procedure SetCfopId(const ACfopId: Variant);
    function GetCfopCuponsFiscaisId: Variant;
    procedure SetCfopCuponsFiscaisId(const ACfopCuponsFiscaisId: Variant);
    property Uf: TString read GetUf write SetUf;
    property ClassificacaoDePessoa: TClassificacaoDePessoa read GetClassificacaoDePessoa write SetClassificacaoDePessoa;
    property TributadoNF: Double read GetTributadoNF write SetTributadoNF;
    property IsentoNF: Double read GetIsentoNF write SetIsentoNF;
    property OutrosNF: Double read GetOutrosNF write SetOutrosNF;
    property Aliquota: Double read GetAliquota write SetAliquota;
    property Agregado: Double read GetAgregado write SetAgregado;
    property TributadoICMS: Double read GetTributadoICMS write SetTributadoICMS;
    property CargaLiquida: Double read GetCargaLiquida write SetCargaLiquida;
    property AliquotaInterna: Double read GetAliquotaInterna write SetAliquotaInterna;
    property Fecop: Double read GetFecop write SetFecop;
    property FecopST: Double read GetFecopST write SetFecopST;
    property CstId: Integer read GetCstId write SetCstId;
    property CstDocumentoFiscalId: Integer read GetCstDocumentoFiscalId write SetCstDocumentoFiscalId;
    property CstCuponsFiscaisId: Integer read GetCstCuponsFiscaisId write SetCstCuponsFiscaisId;
    property Csosn: TCSOSN read GetCsosn write SetCsosn;
    property CsosnDocumentoFiscal: TCSOSN read GetCsosnDocumentoFiscal write SetCsosnDocumentoFiscal;
    property Tributacao: TString read GetTributacao write SetTributacao;
    property CfopId: Variant read GetCfopId write SetCfopId;
    property CfopCuponsFiscaisId: Variant read GetCfopCuponsFiscaisId write SetCfopCuponsFiscaisId;
  end;

  TItemTabelaTributariaList = class;

  IItemTabelaTributariaList = interface
	['{F5364F44-87D7-4022-99A4-48A620C904FB}']
    function GetReference: TItemTabelaTributariaList;
    function GetItems(AIndex: Integer): IItemTabelaTributaria;
    procedure SetItems(AIndex: Integer; const Value: IItemTabelaTributaria);
    procedure Add(const AItemTabelaTributaria: IItemTabelaTributaria);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IItemTabelaTributaria read GetItems write SetItems; default;
  end;

  TItemTabelaTributariaListEnumerator = class
  private
    FIndex: Integer;
    FItemTabelaTributariaList: TItemTabelaTributariaList;
  public
    constructor Create(AItemTabelaTributariaList: TItemTabelaTributariaList);
    function GetCurrent: IItemTabelaTributaria; inline;
    function MoveNext: Boolean;
    property Current: IItemTabelaTributaria read GetCurrent;
  end;

  TItemTabelaTributariaList = class(TInterfacedObject, IItemTabelaTributariaList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IItemTabelaTributaria;
    procedure SetItems(AIndex: Integer; const Value: IItemTabelaTributaria);
  public
    constructor Create;
    procedure Add(const AItemTabelaTributaria: IItemTabelaTributaria);
    destructor Destroy; override;
    function GetEnumerator: TItemTabelaTributariaListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TItemTabelaTributariaList;
    property Items[AIndex: Integer]: IItemTabelaTributaria read GetItems write SetItems; default;
  end;

  TItemTabelaTributariaListRec = record
  private
    FList: IItemTabelaTributariaList;
  public
    class function Create(const AList: IItemTabelaTributariaList): TItemTabelaTributariaListRec; static;
    class operator Implicit(AListRec: TItemTabelaTributariaListRec): TItemTabelaTributariaList;
  end;

  TItemTabelaTributaria = class(TInterfacedModel, IItemTabelaTributaria)
  private
  FId: Variant;
	FUf: TString;
	FClassificacaoDePessoa: TClassificacaoDePessoa;
	FTributadoNF: Double;
	FIsentoNF: Double;
	FOutrosNF: Double;
	FAliquota: Double;
	FAgregado: Double;
	FTributadoICMS: Double;
	FCargaLiquida: Double;
	FAliquotaInterna: Double;
	FFecop: Double;
  FFecopST: Double;
	FCstId: Integer;
	FCstDocumentoFiscalId: Integer;
	FCstCuponsFiscaisId: Integer;
	FCsosn: TCSOSN;
	FCsosnDocumentoFiscal: TCSOSN;
	FTributacao: TString;
	FCfopId: Variant;
	FCfopCuponsFiscaisId: Variant;
    function GetId: Variant;
    procedure SetId(const AId: Variant);
    function GetUf: TString;
    procedure SetUf(const AUf: TString);
    function GetClassificacaoDePessoa: TClassificacaoDePessoa;
    procedure SetClassificacaoDePessoa(const AClassificacaoDePessoa: TClassificacaoDePessoa);
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
    function GetFecopST: Double;
    procedure SetFecopST(const AFecopST: Double);
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
    function GetCfopId: Variant;
    procedure SetCfopId(const ACfopId: Variant);
    function GetCfopCuponsFiscaisId: Variant;
    procedure SetCfopCuponsFiscaisId(const ACfopCuponsFiscaisId: Variant);
  published
    property Id: Variant read GetId write SetId;
    property Uf: TString read GetUf write SetUf;
    property ClassificacaoDePessoa: TClassificacaoDePessoa read GetClassificacaoDePessoa write SetClassificacaoDePessoa;
    property TributadoNF: Double read GetTributadoNF write SetTributadoNF;
    property IsentoNF: Double read GetIsentoNF write SetIsentoNF;
    property OutrosNF: Double read GetOutrosNF write SetOutrosNF;
    property Aliquota: Double read GetAliquota write SetAliquota;
    property Agregado: Double read GetAgregado write SetAgregado;
    property TributadoICMS: Double read GetTributadoICMS write SetTributadoICMS;
    property CargaLiquida: Double read GetCargaLiquida write SetCargaLiquida;
    property AliquotaInterna: Double read GetAliquotaInterna write SetAliquotaInterna;
    property Fecop: Double read GetFecop write SetFecop;
    property FecopST: Double read GetFecopST write SetFecopST;
    property CstId: Integer read GetCstId write SetCstId;
    property CstDocumentoFiscalId: Integer read GetCstDocumentoFiscalId write SetCstDocumentoFiscalId;
    property CstCuponsFiscaisId: Integer read GetCstCuponsFiscaisId write SetCstCuponsFiscaisId;
    property Csosn: TCSOSN read GetCsosn write SetCsosn;
    property CsosnDocumentoFiscal: TCSOSN read GetCsosnDocumentoFiscal write SetCsosnDocumentoFiscal;
    property Tributacao: TString read GetTributacao write SetTributacao;
    property CfopId: Variant read GetCfopId write SetCfopId;
    property CfopCuponsFiscaisId: Variant read GetCfopCuponsFiscaisId write SetCfopCuponsFiscaisId;
  end;

implementation

{ TItemTabelaTributariaList }

procedure TItemTabelaTributariaList.Add(const AItemTabelaTributaria: IItemTabelaTributaria);
begin
  FList.Add(AItemTabelaTributaria);
end;

procedure TItemTabelaTributariaList.Clear;
begin
  FList.Clear;
end;

function TItemTabelaTributariaList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TItemTabelaTributariaList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TItemTabelaTributariaList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TItemTabelaTributariaList.GetEnumerator: TItemTabelaTributariaListEnumerator;
begin
  Result := TItemTabelaTributariaListEnumerator.Create(Self);
end;

function TItemTabelaTributariaList.GetItems(AIndex: Integer): IItemTabelaTributaria;
begin
  Result := FList[AIndex] as IItemTabelaTributaria;
end;

function TItemTabelaTributariaList.GetReference: TItemTabelaTributariaList;
begin
  Result := Self;
end;

procedure TItemTabelaTributariaList.SetItems(AIndex: Integer; const Value: IItemTabelaTributaria);
begin
  FList[AIndex] := Value;
end;

{ TItemTabelaTributariaListEnumerator }

constructor TItemTabelaTributariaListEnumerator.Create(AItemTabelaTributariaList: TItemTabelaTributariaList);
begin
  inherited Create;
  FIndex := -1;
  FItemTabelaTributariaList := AItemTabelaTributariaList;
end;

function TItemTabelaTributariaListEnumerator.GetCurrent: IItemTabelaTributaria;
begin
  Result := FItemTabelaTributariaList[FIndex];
end;

function TItemTabelaTributariaListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FItemTabelaTributariaList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TItemTabelaTributariaListRec }

class function TItemTabelaTributariaListRec.Create(const AList: IItemTabelaTributariaList): TItemTabelaTributariaListRec;
begin
  FillChar(Result, SizeOf(TItemTabelaTributariaListRec), 0);
  Result.FList := AList;
end;

class operator TItemTabelaTributariaListRec.Implicit(AListRec: TItemTabelaTributariaListRec): TItemTabelaTributariaList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TItemTabelaTributaria }

function TItemTabelaTributaria.GetUf: TString;
begin
  Result := FUf;
end;

procedure TItemTabelaTributaria.SetUf(const AUf: TString);
begin
  FUf := AUf;
end;

function TItemTabelaTributaria.GetClassificacaoDePessoa: TClassificacaoDePessoa;
begin
  Result := FClassificacaoDePessoa;
end;

procedure TItemTabelaTributaria.SetClassificacaoDePessoa(const AClassificacaoDePessoa: TClassificacaoDePessoa);
begin
  FClassificacaoDePessoa := AClassificacaoDePessoa;
end;

function TItemTabelaTributaria.GetTributadoNF: Double;
begin
  Result := FTributadoNF;
end;

procedure TItemTabelaTributaria.SetTributadoNF(const ATributadoNF: Double);
begin
  FTributadoNF := ATributadoNF;
end;

function TItemTabelaTributaria.GetId: Variant;
begin
  Result := FId;
end;

procedure TItemTabelaTributaria.SetId(const AId: Variant);
begin
  FId := AId;
end;

function TItemTabelaTributaria.GetIsentoNF: Double;
begin
  Result := FIsentoNF;
end;

procedure TItemTabelaTributaria.SetIsentoNF(const AIsentoNF: Double);
begin
  FIsentoNF := AIsentoNF;
end;

function TItemTabelaTributaria.GetOutrosNF: Double;
begin
  Result := FOutrosNF;
end;

procedure TItemTabelaTributaria.SetOutrosNF(const AOutrosNF: Double);
begin
  FOutrosNF := AOutrosNF;
end;

function TItemTabelaTributaria.GetAliquota: Double;
begin
  Result := FAliquota;
end;

procedure TItemTabelaTributaria.SetAliquota(const AAliquota: Double);
begin
  FAliquota := AAliquota;
end;

function TItemTabelaTributaria.GetAgregado: Double;
begin
  Result := FAgregado;
end;

procedure TItemTabelaTributaria.SetAgregado(const AAgregado: Double);
begin
  FAgregado := AAgregado;
end;

function TItemTabelaTributaria.GetTributadoICMS: Double;
begin
  Result := FTributadoICMS;
end;

procedure TItemTabelaTributaria.SetTributadoICMS(const ATributadoICMS: Double);
begin
  FTributadoICMS := ATributadoICMS;
end;

function TItemTabelaTributaria.GetCargaLiquida: Double;
begin
  Result := FCargaLiquida;
end;

procedure TItemTabelaTributaria.SetCargaLiquida(const ACargaLiquida: Double);
begin
  FCargaLiquida := ACargaLiquida;
end;

function TItemTabelaTributaria.GetAliquotaInterna: Double;
begin
  Result := FAliquotaInterna;
end;

procedure TItemTabelaTributaria.SetAliquotaInterna(const AAliquotaInterna: Double);
begin
  FAliquotaInterna := AAliquotaInterna;
end;

function TItemTabelaTributaria.GetFecop: Double;
begin
  Result := FFecop;
end;

procedure TItemTabelaTributaria.SetFecop(const AFecop: Double);
begin
  FFecop := AFecop;
end;

function TItemTabelaTributaria.GetFecopST: Double;
begin
  Result := FFecopST;
end;

procedure TItemTabelaTributaria.SetFecopST(const AFecopST: Double);
begin
  FFecopST := AFecopST;
end;

function TItemTabelaTributaria.GetCstId: Integer;
begin
  Result := FCstId;
end;

procedure TItemTabelaTributaria.SetCstId(const ACstId: Integer);
begin
  FCstId := ACstId;
end;

function TItemTabelaTributaria.GetCstDocumentoFiscalId: Integer;
begin
  Result := FCstDocumentoFiscalId;
end;

procedure TItemTabelaTributaria.SetCstDocumentoFiscalId(const ACstDocumentoFiscalId: Integer);
begin
  FCstDocumentoFiscalId := ACstDocumentoFiscalId;
end;

function TItemTabelaTributaria.GetCstCuponsFiscaisId: Integer;
begin
  Result := FCstCuponsFiscaisId;
end;

procedure TItemTabelaTributaria.SetCstCuponsFiscaisId(const ACstCuponsFiscaisId: Integer);
begin
  FCstCuponsFiscaisId := ACstCuponsFiscaisId;
end;

function TItemTabelaTributaria.GetCsosn: TCSOSN;
begin
  Result := FCsosn;
end;

procedure TItemTabelaTributaria.SetCsosn(const ACsosn: TCSOSN);
begin
  FCsosn := ACsosn;
end;

function TItemTabelaTributaria.GetCsosnDocumentoFiscal: TCSOSN;
begin
  Result := FCsosnDocumentoFiscal;
end;

procedure TItemTabelaTributaria.SetCsosnDocumentoFiscal(const ACsosnDocumentoFiscal: TCSOSN);
begin
  FCsosnDocumentoFiscal := ACsosnDocumentoFiscal;
end;

function TItemTabelaTributaria.GetTributacao: TString;
begin
  Result := FTributacao;
end;

procedure TItemTabelaTributaria.SetTributacao(const ATributacao: TString);
begin
  FTributacao := ATributacao;
end;

function TItemTabelaTributaria.GetCfopId: Variant;
begin
  Result := FCfopId;
end;

procedure TItemTabelaTributaria.SetCfopId(const ACfopId: Variant);
begin
  FCfopId := ACfopId;
end;

function TItemTabelaTributaria.GetCfopCuponsFiscaisId: Variant;
begin
  Result := FCfopCuponsFiscaisId;
end;

procedure TItemTabelaTributaria.SetCfopCuponsFiscaisId(const ACfopCuponsFiscaisId: Variant);
begin
  FCfopCuponsFiscaisId := ACfopCuponsFiscaisId;
end;


end.

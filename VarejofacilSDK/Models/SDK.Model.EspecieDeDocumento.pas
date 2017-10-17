unit SDK.Model.EspecieDeDocumento;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IEspecieDeDocumento = interface(IModel)
    ['{EE1A1B13-8D79-4B28-934B-CFE38F058222}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetSigla: TString;
    procedure SetSigla(const ASigla: TString);
    function GetGenero: TGeneroEspecieDocumento;
    procedure SetGenero(const AGenero: TGeneroEspecieDocumento);
    function GetModalidade: TModalidadeEspeciePagamento;
    procedure SetModalidade(const AModalidade: TModalidadeEspeciePagamento);
    function GetDiasParaIncidenciaDeJuros: Integer;
    procedure SetDiasParaIncidenciaDeJuros(const ADiasParaIncidenciaDeJuros: Integer);
    function GetMoraDiariaPorAtraso: Double;
    procedure SetMoraDiariaPorAtraso(const AMoraDiariaPorAtraso: Double);
    function GetDiasParaIncidenciaDeMulta: Integer;
    procedure SetDiasParaIncidenciaDeMulta(const ADiasParaIncidenciaDeMulta: Integer);
    function GetValorMultaPorAtraso: Double;
    procedure SetValorMultaPorAtraso(const AValorMultaPorAtraso: Double);
    function GetEmiteDocumentoVinculado: Boolean;
    procedure SetEmiteDocumentoVinculado(const AEmiteDocumentoVinculado: Boolean);
    function GetQuantidadeDeVias: Integer;
    procedure SetQuantidadeDeVias(const AQuantidadeDeVias: Integer);
    function GetQuantidadeDeAutenticacoes: Integer;
    procedure SetQuantidadeDeAutenticacoes(const AQuantidadeDeAutenticacoes: Integer);
    function GetTipo: TTipoControleDocumento;
    procedure SetTipo(const ATipo: TTipoControleDocumento);
    function GetTipoValorMoraDiaria: TTipoEntrada;
    procedure SetTipoValorMoraDiaria(const ATipoValorMoraDiaria: TTipoEntrada);
    function GetTipoValorMulta: TTipoEntrada;
    procedure SetTipoValorMulta(const ATipoValorMulta: TTipoEntrada);
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property Sigla: TString read GetSigla write SetSigla;
    property Genero: TGeneroEspecieDocumento read GetGenero write SetGenero;
    property Modalidade: TModalidadeEspeciePagamento read GetModalidade write SetModalidade;
    property DiasParaIncidenciaDeJuros: Integer read GetDiasParaIncidenciaDeJuros write SetDiasParaIncidenciaDeJuros;
    property MoraDiariaPorAtraso: Double read GetMoraDiariaPorAtraso write SetMoraDiariaPorAtraso;
    property DiasParaIncidenciaDeMulta: Integer read GetDiasParaIncidenciaDeMulta write SetDiasParaIncidenciaDeMulta;
    property ValorMultaPorAtraso: Double read GetValorMultaPorAtraso write SetValorMultaPorAtraso;
    property EmiteDocumentoVinculado: Boolean read GetEmiteDocumentoVinculado write SetEmiteDocumentoVinculado;
    property QuantidadeDeVias: Integer read GetQuantidadeDeVias write SetQuantidadeDeVias;
    property QuantidadeDeAutenticacoes: Integer read GetQuantidadeDeAutenticacoes write SetQuantidadeDeAutenticacoes;
    property Tipo: TTipoControleDocumento read GetTipo write SetTipo;
    property TipoValorMoraDiaria: TTipoEntrada read GetTipoValorMoraDiaria write SetTipoValorMoraDiaria;
    property TipoValorMulta: TTipoEntrada read GetTipoValorMulta write SetTipoValorMulta;
  end;

  TEspecieDeDocumentoList = class;

  IEspecieDeDocumentoList = interface
	['{E0700F64-C7CA-4A92-BB85-46B966AC918D}']
    function GetReference: TEspecieDeDocumentoList;
    function GetItems(AIndex: Integer): IEspecieDeDocumento;
    procedure SetItems(AIndex: Integer; const Value: IEspecieDeDocumento);
    procedure Add(const AEspecieDeDocumento: IEspecieDeDocumento);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IEspecieDeDocumento read GetItems write SetItems; default;
  end;

  TEspecieDeDocumentoListEnumerator = class
  private
    FIndex: Integer;
    FEspecieDeDocumentoList: TEspecieDeDocumentoList;
  public
    constructor Create(AEspecieDeDocumentoList: TEspecieDeDocumentoList);
    function GetCurrent: IEspecieDeDocumento; inline;
    function MoveNext: Boolean;
    property Current: IEspecieDeDocumento read GetCurrent;
  end;

  TEspecieDeDocumentoList = class(TInterfacedObject, IEspecieDeDocumentoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IEspecieDeDocumento;
    procedure SetItems(AIndex: Integer; const Value: IEspecieDeDocumento);
  public
    constructor Create;
    procedure Add(const AEspecieDeDocumento: IEspecieDeDocumento);
    destructor Destroy; override;
    function GetEnumerator: TEspecieDeDocumentoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TEspecieDeDocumentoList;
    property Items[AIndex: Integer]: IEspecieDeDocumento read GetItems write SetItems; default;
  end;

  TEspecieDeDocumentoListRec = record
  private
    FList: IEspecieDeDocumentoList;
  public
    class function Create(const AList: IEspecieDeDocumentoList): TEspecieDeDocumentoListRec; static;
    class operator Implicit(AListRec: TEspecieDeDocumentoListRec): TEspecieDeDocumentoList;
  end;

  TEspecieDeDocumento = class(TInterfacedModel, IEspecieDeDocumento)
  private
	FId: Int64;
	FDescricao: TString;
	FSigla: TString;
	FGenero: TGeneroEspecieDocumento;
	FModalidade: TModalidadeEspeciePagamento;
	FDiasParaIncidenciaDeJuros: Integer;
	FMoraDiariaPorAtraso: Double;
	FDiasParaIncidenciaDeMulta: Integer;
	FValorMultaPorAtraso: Double;
	FEmiteDocumentoVinculado: Boolean;
	FQuantidadeDeVias: Integer;
	FQuantidadeDeAutenticacoes: Integer;
	FTipo: TTipoControleDocumento;
	FTipoValorMoraDiaria: TTipoEntrada;
	FTipoValorMulta: TTipoEntrada;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetSigla: TString;
    procedure SetSigla(const ASigla: TString);
    function GetGenero: TGeneroEspecieDocumento;
    procedure SetGenero(const AGenero: TGeneroEspecieDocumento);
    function GetModalidade: TModalidadeEspeciePagamento;
    procedure SetModalidade(const AModalidade: TModalidadeEspeciePagamento);
    function GetDiasParaIncidenciaDeJuros: Integer;
    procedure SetDiasParaIncidenciaDeJuros(const ADiasParaIncidenciaDeJuros: Integer);
    function GetMoraDiariaPorAtraso: Double;
    procedure SetMoraDiariaPorAtraso(const AMoraDiariaPorAtraso: Double);
    function GetDiasParaIncidenciaDeMulta: Integer;
    procedure SetDiasParaIncidenciaDeMulta(const ADiasParaIncidenciaDeMulta: Integer);
    function GetValorMultaPorAtraso: Double;
    procedure SetValorMultaPorAtraso(const AValorMultaPorAtraso: Double);
    function GetEmiteDocumentoVinculado: Boolean;
    procedure SetEmiteDocumentoVinculado(const AEmiteDocumentoVinculado: Boolean);
    function GetQuantidadeDeVias: Integer;
    procedure SetQuantidadeDeVias(const AQuantidadeDeVias: Integer);
    function GetQuantidadeDeAutenticacoes: Integer;
    procedure SetQuantidadeDeAutenticacoes(const AQuantidadeDeAutenticacoes: Integer);
    function GetTipo: TTipoControleDocumento;
    procedure SetTipo(const ATipo: TTipoControleDocumento);
    function GetTipoValorMoraDiaria: TTipoEntrada;
    procedure SetTipoValorMoraDiaria(const ATipoValorMoraDiaria: TTipoEntrada);
    function GetTipoValorMulta: TTipoEntrada;
    procedure SetTipoValorMulta(const ATipoValorMulta: TTipoEntrada);
  published
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property Sigla: TString read GetSigla write SetSigla;
    property Genero: TGeneroEspecieDocumento read GetGenero write SetGenero;
    property Modalidade: TModalidadeEspeciePagamento read GetModalidade write SetModalidade;
    property DiasParaIncidenciaDeJuros: Integer read GetDiasParaIncidenciaDeJuros write SetDiasParaIncidenciaDeJuros;
    property MoraDiariaPorAtraso: Double read GetMoraDiariaPorAtraso write SetMoraDiariaPorAtraso;
    property DiasParaIncidenciaDeMulta: Integer read GetDiasParaIncidenciaDeMulta write SetDiasParaIncidenciaDeMulta;
    property ValorMultaPorAtraso: Double read GetValorMultaPorAtraso write SetValorMultaPorAtraso;
    property EmiteDocumentoVinculado: Boolean read GetEmiteDocumentoVinculado write SetEmiteDocumentoVinculado;
    property QuantidadeDeVias: Integer read GetQuantidadeDeVias write SetQuantidadeDeVias;
    property QuantidadeDeAutenticacoes: Integer read GetQuantidadeDeAutenticacoes write SetQuantidadeDeAutenticacoes;
    property Tipo: TTipoControleDocumento read GetTipo write SetTipo;
    property TipoValorMoraDiaria: TTipoEntrada read GetTipoValorMoraDiaria write SetTipoValorMoraDiaria;
    property TipoValorMulta: TTipoEntrada read GetTipoValorMulta write SetTipoValorMulta;
  end;

implementation

{ TEspecieDeDocumentoList }

procedure TEspecieDeDocumentoList.Add(const AEspecieDeDocumento: IEspecieDeDocumento);
begin
  FList.Add(AEspecieDeDocumento);
end;

procedure TEspecieDeDocumentoList.Clear;
begin
  FList.Clear;
end;

function TEspecieDeDocumentoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TEspecieDeDocumentoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TEspecieDeDocumentoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TEspecieDeDocumentoList.GetEnumerator: TEspecieDeDocumentoListEnumerator;
begin
  Result := TEspecieDeDocumentoListEnumerator.Create(Self);
end;

function TEspecieDeDocumentoList.GetItems(AIndex: Integer): IEspecieDeDocumento;
begin
  Result := FList[AIndex] as IEspecieDeDocumento;
end;

function TEspecieDeDocumentoList.GetReference: TEspecieDeDocumentoList;
begin
  Result := Self;
end;

procedure TEspecieDeDocumentoList.SetItems(AIndex: Integer; const Value: IEspecieDeDocumento);
begin
  FList[AIndex] := Value;
end;

{ TEspecieDeDocumentoListEnumerator }

constructor TEspecieDeDocumentoListEnumerator.Create(AEspecieDeDocumentoList: TEspecieDeDocumentoList);
begin
  inherited Create;
  FIndex := -1;
  FEspecieDeDocumentoList := AEspecieDeDocumentoList;
end;

function TEspecieDeDocumentoListEnumerator.GetCurrent: IEspecieDeDocumento;
begin
  Result := FEspecieDeDocumentoList[FIndex];
end;

function TEspecieDeDocumentoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FEspecieDeDocumentoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TEspecieDeDocumentoListRec }

class function TEspecieDeDocumentoListRec.Create(const AList: IEspecieDeDocumentoList): TEspecieDeDocumentoListRec;
begin
  FillChar(Result, SizeOf(TEspecieDeDocumentoListRec), 0);
  Result.FList := AList;
end;

class operator TEspecieDeDocumentoListRec.Implicit(AListRec: TEspecieDeDocumentoListRec): TEspecieDeDocumentoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TEspecieDeDocumento }

function TEspecieDeDocumento.GetId: Int64;
begin
  Result := FId;
end;

procedure TEspecieDeDocumento.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TEspecieDeDocumento.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TEspecieDeDocumento.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

function TEspecieDeDocumento.GetSigla: TString;
begin
  Result := FSigla;
end;

procedure TEspecieDeDocumento.SetSigla(const ASigla: TString);
begin
  FSigla := ASigla;
end;

function TEspecieDeDocumento.GetGenero: TGeneroEspecieDocumento;
begin
  Result := FGenero;
end;

procedure TEspecieDeDocumento.SetGenero(const AGenero: TGeneroEspecieDocumento);
begin
  FGenero := AGenero;
end;

function TEspecieDeDocumento.GetModalidade: TModalidadeEspeciePagamento;
begin
  Result := FModalidade;
end;

procedure TEspecieDeDocumento.SetModalidade(const AModalidade: TModalidadeEspeciePagamento);
begin
  FModalidade := AModalidade;
end;

function TEspecieDeDocumento.GetDiasParaIncidenciaDeJuros: Integer;
begin
  Result := FDiasParaIncidenciaDeJuros;
end;

procedure TEspecieDeDocumento.SetDiasParaIncidenciaDeJuros(const ADiasParaIncidenciaDeJuros: Integer);
begin
  FDiasParaIncidenciaDeJuros := ADiasParaIncidenciaDeJuros;
end;

function TEspecieDeDocumento.GetMoraDiariaPorAtraso: Double;
begin
  Result := FMoraDiariaPorAtraso;
end;

procedure TEspecieDeDocumento.SetMoraDiariaPorAtraso(const AMoraDiariaPorAtraso: Double);
begin
  FMoraDiariaPorAtraso := AMoraDiariaPorAtraso;
end;

function TEspecieDeDocumento.GetDiasParaIncidenciaDeMulta: Integer;
begin
  Result := FDiasParaIncidenciaDeMulta;
end;

procedure TEspecieDeDocumento.SetDiasParaIncidenciaDeMulta(const ADiasParaIncidenciaDeMulta: Integer);
begin
  FDiasParaIncidenciaDeMulta := ADiasParaIncidenciaDeMulta;
end;

function TEspecieDeDocumento.GetValorMultaPorAtraso: Double;
begin
  Result := FValorMultaPorAtraso;
end;

procedure TEspecieDeDocumento.SetValorMultaPorAtraso(const AValorMultaPorAtraso: Double);
begin
  FValorMultaPorAtraso := AValorMultaPorAtraso;
end;

function TEspecieDeDocumento.GetEmiteDocumentoVinculado: Boolean;
begin
  Result := FEmiteDocumentoVinculado;
end;

procedure TEspecieDeDocumento.SetEmiteDocumentoVinculado(const AEmiteDocumentoVinculado: Boolean);
begin
  FEmiteDocumentoVinculado := AEmiteDocumentoVinculado;
end;

function TEspecieDeDocumento.GetQuantidadeDeVias: Integer;
begin
  Result := FQuantidadeDeVias;
end;

procedure TEspecieDeDocumento.SetQuantidadeDeVias(const AQuantidadeDeVias: Integer);
begin
  FQuantidadeDeVias := AQuantidadeDeVias;
end;

function TEspecieDeDocumento.GetQuantidadeDeAutenticacoes: Integer;
begin
  Result := FQuantidadeDeAutenticacoes;
end;

procedure TEspecieDeDocumento.SetQuantidadeDeAutenticacoes(const AQuantidadeDeAutenticacoes: Integer);
begin
  FQuantidadeDeAutenticacoes := AQuantidadeDeAutenticacoes;
end;

function TEspecieDeDocumento.GetTipo: TTipoControleDocumento;
begin
  Result := FTipo;
end;

procedure TEspecieDeDocumento.SetTipo(const ATipo: TTipoControleDocumento);
begin
  FTipo := ATipo;
end;

function TEspecieDeDocumento.GetTipoValorMoraDiaria: TTipoEntrada;
begin
  Result := FTipoValorMoraDiaria;
end;

procedure TEspecieDeDocumento.SetTipoValorMoraDiaria(const ATipoValorMoraDiaria: TTipoEntrada);
begin
  FTipoValorMoraDiaria := ATipoValorMoraDiaria;
end;

function TEspecieDeDocumento.GetTipoValorMulta: TTipoEntrada;
begin
  Result := FTipoValorMulta;
end;

procedure TEspecieDeDocumento.SetTipoValorMulta(const ATipoValorMulta: TTipoEntrada);
begin
  FTipoValorMulta := ATipoValorMulta;
end;


end.
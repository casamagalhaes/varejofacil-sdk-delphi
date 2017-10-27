unit SDK.Model.Endereco;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IEndereco = interface(IModel)
    ['{1A80306B-1BD9-4B49-8868-FA76B86F6830}']
    function GetCep: TString;
    procedure SetCep(const ACep: TString);
    function GetUf: TString;
    procedure SetUf(const AUf: TString);
    function GetCodigoIbge: Int64;
    procedure SetCodigoIbge(const ACodigoIbge: Int64);
    function GetMunicipio: TString;
    procedure SetMunicipio(const AMunicipio: TString);
    function GetLogradouro: TString;
    procedure SetLogradouro(const ALogradouro: TString);
    function GetNumero: TString;
    procedure SetNumero(const ANumero: TString);
    function GetBairro: TString;
    procedure SetBairro(const ABairro: TString);
    function GetComplemento: TString;
    procedure SetComplemento(const AComplemento: TString);
    function GetPontoDeReferencia: TString;
    procedure SetPontoDeReferencia(const APontoDeReferencia: TString);
    function GetTipoDeEndereco: TTipoEndereco;
    procedure SetTipoDeEndereco(const ATipoDeEndereco: TTipoEndereco);
    function GetCodigoDoPais: Integer;
    procedure SetCodigoDoPais(const ACodigoDoPais: Integer);
    function GetDataDeSuspensao: TDateTime;
    procedure SetDataDeSuspensao(const ADataDeSuspensao: TDateTime);
    function GetRestricoes: TString;
    procedure SetRestricoes(const ARestricoes: TString);
    property Cep: TString read GetCep write SetCep;
    property Uf: TString read GetUf write SetUf;
    property CodigoIbge: Int64 read GetCodigoIbge write SetCodigoIbge;
    property Municipio: TString read GetMunicipio write SetMunicipio;
    property Logradouro: TString read GetLogradouro write SetLogradouro;
    property Numero: TString read GetNumero write SetNumero;
    property Bairro: TString read GetBairro write SetBairro;
    property Complemento: TString read GetComplemento write SetComplemento;
    property PontoDeReferencia: TString read GetPontoDeReferencia write SetPontoDeReferencia;
    property TipoDeEndereco: TTipoEndereco read GetTipoDeEndereco write SetTipoDeEndereco;
    property CodigoDoPais: Integer read GetCodigoDoPais write SetCodigoDoPais;
    property DataDeSuspensao: TDateTime read GetDataDeSuspensao write SetDataDeSuspensao;
    property Restricoes: TString read GetRestricoes write SetRestricoes;
  end;

  TEnderecoList = class;

  IEnderecoList = interface
	['{439925BA-8020-4A6E-9E5D-CF78024DB50D}']
    function GetReference: TEnderecoList;
    function GetItems(AIndex: Integer): IEndereco;
    procedure SetItems(AIndex: Integer; const Value: IEndereco);
    procedure Add(const AEndereco: IEndereco);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IEndereco read GetItems write SetItems; default;
  end;

  TEnderecoListEnumerator = class
  private
    FIndex: Integer;
    FEnderecoList: TEnderecoList;
  public
    constructor Create(AEnderecoList: TEnderecoList);
    function GetCurrent: IEndereco; inline;
    function MoveNext: Boolean;
    property Current: IEndereco read GetCurrent;
  end;

  TEnderecoList = class(TInterfacedObject, IEnderecoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IEndereco;
    procedure SetItems(AIndex: Integer; const Value: IEndereco);
  public
    constructor Create;
    procedure Add(const AEndereco: IEndereco);
    destructor Destroy; override;
    function GetEnumerator: TEnderecoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TEnderecoList;
    property Items[AIndex: Integer]: IEndereco read GetItems write SetItems; default;
  end;

  TEnderecoListRec = record
  private
    FList: IEnderecoList;
  public
    class function Create(const AList: IEnderecoList): TEnderecoListRec; static;
    class operator Implicit(AListRec: TEnderecoListRec): TEnderecoList;
  end;

  TEndereco = class(TInterfacedModel, IEndereco)
  private
	FCep: TString;
	FUf: TString;
	FCodigoIbge: Int64;
	FMunicipio: TString;
	FLogradouro: TString;
	FNumero: TString;
	FBairro: TString;
	FComplemento: TString;
	FPontoDeReferencia: TString;
	FTipoDeEndereco: TTipoEndereco;
	FCodigoDoPais: Integer;
	FDataDeSuspensao: TDateTime;
	FRestricoes: TString;
    function GetCep: TString;
    procedure SetCep(const ACep: TString);
    function GetUf: TString;
    procedure SetUf(const AUf: TString);
    function GetCodigoIbge: Int64;
    procedure SetCodigoIbge(const ACodigoIbge: Int64);
    function GetMunicipio: TString;
    procedure SetMunicipio(const AMunicipio: TString);
    function GetLogradouro: TString;
    procedure SetLogradouro(const ALogradouro: TString);
    function GetNumero: TString;
    procedure SetNumero(const ANumero: TString);
    function GetBairro: TString;
    procedure SetBairro(const ABairro: TString);
    function GetComplemento: TString;
    procedure SetComplemento(const AComplemento: TString);
    function GetPontoDeReferencia: TString;
    procedure SetPontoDeReferencia(const APontoDeReferencia: TString);
    function GetTipoDeEndereco: TTipoEndereco;
    procedure SetTipoDeEndereco(const ATipoDeEndereco: TTipoEndereco);
    function GetCodigoDoPais: Integer;
    procedure SetCodigoDoPais(const ACodigoDoPais: Integer);
    function GetDataDeSuspensao: TDateTime;
    procedure SetDataDeSuspensao(const ADataDeSuspensao: TDateTime);
    function GetRestricoes: TString;
    procedure SetRestricoes(const ARestricoes: TString);
  published
    property Cep: TString read GetCep write SetCep;
    property Uf: TString read GetUf write SetUf;
    property CodigoIbge: Int64 read GetCodigoIbge write SetCodigoIbge;
    property Municipio: TString read GetMunicipio write SetMunicipio;
    property Logradouro: TString read GetLogradouro write SetLogradouro;
    property Numero: TString read GetNumero write SetNumero;
    property Bairro: TString read GetBairro write SetBairro;
    property Complemento: TString read GetComplemento write SetComplemento;
    property PontoDeReferencia: TString read GetPontoDeReferencia write SetPontoDeReferencia;
    property TipoDeEndereco: TTipoEndereco read GetTipoDeEndereco write SetTipoDeEndereco;
    property CodigoDoPais: Integer read GetCodigoDoPais write SetCodigoDoPais;
    property DataDeSuspensao: TDateTime read GetDataDeSuspensao write SetDataDeSuspensao;
    property Restricoes: TString read GetRestricoes write SetRestricoes;
  end;

implementation

{ TEnderecoList }

procedure TEnderecoList.Add(const AEndereco: IEndereco);
begin
  FList.Add(AEndereco);
end;

procedure TEnderecoList.Clear;
begin
  FList.Clear;
end;

function TEnderecoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TEnderecoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TEnderecoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TEnderecoList.GetEnumerator: TEnderecoListEnumerator;
begin
  Result := TEnderecoListEnumerator.Create(Self);
end;

function TEnderecoList.GetItems(AIndex: Integer): IEndereco;
begin
  Result := FList[AIndex] as IEndereco;
end;

function TEnderecoList.GetReference: TEnderecoList;
begin
  Result := Self;
end;

procedure TEnderecoList.SetItems(AIndex: Integer; const Value: IEndereco);
begin
  FList[AIndex] := Value;
end;

{ TEnderecoListEnumerator }

constructor TEnderecoListEnumerator.Create(AEnderecoList: TEnderecoList);
begin
  inherited Create;
  FIndex := -1;
  FEnderecoList := AEnderecoList;
end;

function TEnderecoListEnumerator.GetCurrent: IEndereco;
begin
  Result := FEnderecoList[FIndex];
end;

function TEnderecoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FEnderecoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TEnderecoListRec }

class function TEnderecoListRec.Create(const AList: IEnderecoList): TEnderecoListRec;
begin
  FillChar(Result, SizeOf(TEnderecoListRec), 0);
  Result.FList := AList;
end;

class operator TEnderecoListRec.Implicit(AListRec: TEnderecoListRec): TEnderecoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TEndereco }

function TEndereco.GetCep: TString;
begin
  Result := FCep;
end;

procedure TEndereco.SetCep(const ACep: TString);
begin
  FCep := ACep;
end;

function TEndereco.GetUf: TString;
begin
  Result := FUf;
end;

procedure TEndereco.SetUf(const AUf: TString);
begin
  FUf := AUf;
end;

function TEndereco.GetCodigoIbge: Int64;
begin
  Result := FCodigoIbge;
end;

procedure TEndereco.SetCodigoIbge(const ACodigoIbge: Int64);
begin
  FCodigoIbge := ACodigoIbge;
end;

function TEndereco.GetMunicipio: TString;
begin
  Result := FMunicipio;
end;

procedure TEndereco.SetMunicipio(const AMunicipio: TString);
begin
  FMunicipio := AMunicipio;
end;

function TEndereco.GetLogradouro: TString;
begin
  Result := FLogradouro;
end;

procedure TEndereco.SetLogradouro(const ALogradouro: TString);
begin
  FLogradouro := ALogradouro;
end;

function TEndereco.GetNumero: TString;
begin
  Result := FNumero;
end;

procedure TEndereco.SetNumero(const ANumero: TString);
begin
  FNumero := ANumero;
end;

function TEndereco.GetBairro: TString;
begin
  Result := FBairro;
end;

procedure TEndereco.SetBairro(const ABairro: TString);
begin
  FBairro := ABairro;
end;

function TEndereco.GetComplemento: TString;
begin
  Result := FComplemento;
end;

procedure TEndereco.SetComplemento(const AComplemento: TString);
begin
  FComplemento := AComplemento;
end;

function TEndereco.GetPontoDeReferencia: TString;
begin
  Result := FPontoDeReferencia;
end;

procedure TEndereco.SetPontoDeReferencia(const APontoDeReferencia: TString);
begin
  FPontoDeReferencia := APontoDeReferencia;
end;

function TEndereco.GetTipoDeEndereco: TTipoEndereco;
begin
  Result := FTipoDeEndereco;
end;

procedure TEndereco.SetTipoDeEndereco(const ATipoDeEndereco: TTipoEndereco);
begin
  FTipoDeEndereco := ATipoDeEndereco;
end;

function TEndereco.GetCodigoDoPais: Integer;
begin
  Result := FCodigoDoPais;
end;

procedure TEndereco.SetCodigoDoPais(const ACodigoDoPais: Integer);
begin
  FCodigoDoPais := ACodigoDoPais;
end;

function TEndereco.GetDataDeSuspensao: TDateTime;
begin
  Result := FDataDeSuspensao;
end;

procedure TEndereco.SetDataDeSuspensao(const ADataDeSuspensao: TDateTime);
begin
  FDataDeSuspensao := ADataDeSuspensao;
end;

function TEndereco.GetRestricoes: TString;
begin
  Result := FRestricoes;
end;

procedure TEndereco.SetRestricoes(const ARestricoes: TString);
begin
  FRestricoes := ARestricoes;
end;

initialization
  RegisterClass(TEndereco);

end.
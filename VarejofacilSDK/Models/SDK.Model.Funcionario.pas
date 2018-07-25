unit SDK.Model.Funcionario;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums, SDK.Model.Endereco;

type

  IFuncionario = interface(IModel)
    ['{63CCD3AC-F6D2-4138-BABA-2142A421C3A2}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetRamal: TString;
    procedure SetRamal(const ARamal: TString);
    function GetCargoSysPDVWeb: TString;
    procedure SetCargoSysPDVWeb(const ACargoSysPDVWeb: TString);
    function GetDataDeNascimento: TDateTime;
    procedure SetDataDeNascimento(const ADataDeNascimento: TDateTime);
    function GetCargoSysPDV: TString;
    procedure SetCargoSysPDV(const ACargoSysPDV: TString);
    function GetTipoDoPrecoPadrao: TString;
    procedure SetTipoDoPrecoPadrao(const ATipoDoPrecoPadrao: TString);
    function GetLimiteDeDesconto: Double;
    procedure SetLimiteDeDesconto(const ALimiteDeDesconto: Double);
    function GetPercentualComissao1: Double;
    procedure SetPercentualComissao1(const APercentualComissao1: Double);
    function GetPercentualComissao2: Double;
    procedure SetPercentualComissao2(const APercentualComissao2: Double);
    function GetPercentualComissao3: Double;
    procedure SetPercentualComissao3(const APercentualComissao3: Double);
    function GetRecebeComissaoPorMetas: Boolean;
    procedure SetRecebeComissaoPorMetas(const ARecebeComissaoPorMetas: Boolean);
    function GetInativo: Boolean;
    procedure SetInativo(const AInativo: Boolean);
    function GetHash: TString;
    procedure SetHash(const AHash: TString);
    function GetSetorId: Int64;
    procedure SetSetorId(const ASetorId: Int64);
    function GetNumeroDoDocumento: TString;
    procedure SetNumeroDoDocumento(const ANumeroDoDocumento: TString);
    function GetNumeroDeIdentificacao: TString;
    procedure SetNumeroDeIdentificacao(const ANumeroDeIdentificacao: TString);
    function GetOrgaoExpedidor: TString;
    procedure SetOrgaoExpedidor(const AOrgaoExpedidor: TString);
    function GetCei: TString;
    procedure SetCei(const ACei: TString);
    function GetInscricaoMunicipal: TString;
    procedure SetInscricaoMunicipal(const AInscricaoMunicipal: TString);
    function GetNome: TString;
    procedure SetNome(const ANome: TString);
    function GetFantasia: TString;
    procedure SetFantasia(const AFantasia: TString);
    function GetTelefone1: TString;
    procedure SetTelefone1(const ATelefone1: TString);
    function GetTelefone2: TString;
    procedure SetTelefone2(const ATelefone2: TString);
    function GetFax: TString;
    procedure SetFax(const AFax: TString);
    function GetEmail: TString;
    procedure SetEmail(const AEmail: TString);
    function GetHomePage: TString;
    procedure SetHomePage(const AHomePage: TString);
    function GetRedeSocial: TString;
    procedure SetRedeSocial(const ARedeSocial: TString);
    function GetTwitter: TString;
    procedure SetTwitter(const ATwitter: TString);
    function GetComunicadorDeMensagensInstantaneas: TString;
    procedure SetComunicadorDeMensagensInstantaneas(const AComunicadorDeMensagensInstantaneas: TString);
    function GetSuframa: TString;
    procedure SetSuframa(const ASuframa: TString);
    function GetEndereco: IEndereco;
    procedure SetEndereco(const AEndereco: IEndereco);
    function GetTipo: TTipoPessoa;
    procedure SetTipo(const ATipo: TTipoPessoa);
    function GetHoldingId: Integer;
    procedure SetHoldingId(const AHoldingId: Integer);
    property Id: Int64 read GetId write SetId;
    property Ramal: TString read GetRamal write SetRamal;
    property CargoSysPDVWeb: TString read GetCargoSysPDVWeb write SetCargoSysPDVWeb;
    property DataDeNascimento: TDateTime read GetDataDeNascimento write SetDataDeNascimento;
    property CargoSysPDV: TString read GetCargoSysPDV write SetCargoSysPDV;
    property TipoDoPrecoPadrao: TString read GetTipoDoPrecoPadrao write SetTipoDoPrecoPadrao;
    property LimiteDeDesconto: Double read GetLimiteDeDesconto write SetLimiteDeDesconto;
    property PercentualComissao1: Double read GetPercentualComissao1 write SetPercentualComissao1;
    property PercentualComissao2: Double read GetPercentualComissao2 write SetPercentualComissao2;
    property PercentualComissao3: Double read GetPercentualComissao3 write SetPercentualComissao3;
    property RecebeComissaoPorMetas: Boolean read GetRecebeComissaoPorMetas write SetRecebeComissaoPorMetas;
    property Inativo: Boolean read GetInativo write SetInativo;
    property Hash: TString read GetHash write SetHash;
    property SetorId: Int64 read GetSetorId write SetSetorId;
    property NumeroDoDocumento: TString read GetNumeroDoDocumento write SetNumeroDoDocumento;
    property NumeroDeIdentificacao: TString read GetNumeroDeIdentificacao write SetNumeroDeIdentificacao;
    property OrgaoExpedidor: TString read GetOrgaoExpedidor write SetOrgaoExpedidor;
    property Cei: TString read GetCei write SetCei;
    property InscricaoMunicipal: TString read GetInscricaoMunicipal write SetInscricaoMunicipal;
    property Nome: TString read GetNome write SetNome;
    property Fantasia: TString read GetFantasia write SetFantasia;
    property Telefone1: TString read GetTelefone1 write SetTelefone1;
    property Telefone2: TString read GetTelefone2 write SetTelefone2;
    property Fax: TString read GetFax write SetFax;
    property Email: TString read GetEmail write SetEmail;
    property HomePage: TString read GetHomePage write SetHomePage;
    property RedeSocial: TString read GetRedeSocial write SetRedeSocial;
    property Twitter: TString read GetTwitter write SetTwitter;
    property ComunicadorDeMensagensInstantaneas: TString read GetComunicadorDeMensagensInstantaneas write SetComunicadorDeMensagensInstantaneas;
    property Suframa: TString read GetSuframa write SetSuframa;
    property Endereco: IEndereco read GetEndereco write SetEndereco;
    property Tipo: TTipoPessoa read GetTipo write SetTipo;
    property HoldingId: Integer read GetHoldingId write SetHoldingId;
  end;

  TFuncionarioList = class;

  IFuncionarioList = interface
	['{2E31C137-85AB-44E5-A6F2-1F0DF91A2A05}']
    function GetReference: TFuncionarioList;
    function GetItems(AIndex: Integer): IFuncionario;
    procedure SetItems(AIndex: Integer; const Value: IFuncionario);
    procedure Add(const AFuncionario: IFuncionario);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IFuncionario read GetItems write SetItems; default;
  end;

  TFuncionarioListEnumerator = class
  private
    FIndex: Integer;
    FFuncionarioList: TFuncionarioList;
  public
    constructor Create(AFuncionarioList: TFuncionarioList);
    function GetCurrent: IFuncionario; inline;
    function MoveNext: Boolean;
    property Current: IFuncionario read GetCurrent;
  end;

  TFuncionarioList = class(TInterfacedObject, IFuncionarioList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IFuncionario;
    procedure SetItems(AIndex: Integer; const Value: IFuncionario);
  public
    constructor Create;
    procedure Add(const AFuncionario: IFuncionario);
    destructor Destroy; override;
    function GetEnumerator: TFuncionarioListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TFuncionarioList;
    property Items[AIndex: Integer]: IFuncionario read GetItems write SetItems; default;
  end;

  TFuncionarioListRec = record
  private
    FList: IFuncionarioList;
  public
    class function Create(const AList: IFuncionarioList): TFuncionarioListRec; static;
    class operator Implicit(AListRec: TFuncionarioListRec): TFuncionarioList;
  end;

  TFuncionario = class(TInterfacedModel, IFuncionario)
  private
	FId: Int64;
	FRamal: TString;
	FCargoSysPDVWeb: TString;
	FDataDeNascimento: TDateTime;
	FCargoSysPDV: TString;
	FTipoDoPrecoPadrao: TString;
	FLimiteDeDesconto: Double;
	FPercentualComissao1: Double;
	FPercentualComissao2: Double;
	FPercentualComissao3: Double;
	FRecebeComissaoPorMetas: Boolean;
	FInativo: Boolean;
	FHash: TString;
	FSetorId: Int64;
	FNumeroDoDocumento: TString;
	FNumeroDeIdentificacao: TString;
	FOrgaoExpedidor: TString;
	FCei: TString;
	FInscricaoMunicipal: TString;
	FNome: TString;
	FFantasia: TString;
	FTelefone1: TString;
	FTelefone2: TString;
	FFax: TString;
	FEmail: TString;
	FHomePage: TString;
	FRedeSocial: TString;
	FTwitter: TString;
	FComunicadorDeMensagensInstantaneas: TString;
	FSuframa: TString;
	FEndereco: IEndereco;
	FTipo: TTipoPessoa;
	FHoldingId: Integer;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetRamal: TString;
    procedure SetRamal(const ARamal: TString);
    function GetCargoSysPDVWeb: TString;
    procedure SetCargoSysPDVWeb(const ACargoSysPDVWeb: TString);
    function GetDataDeNascimento: TDateTime;
    procedure SetDataDeNascimento(const ADataDeNascimento: TDateTime);
    function GetCargoSysPDV: TString;
    procedure SetCargoSysPDV(const ACargoSysPDV: TString);
    function GetTipoDoPrecoPadrao: TString;
    procedure SetTipoDoPrecoPadrao(const ATipoDoPrecoPadrao: TString);
    function GetLimiteDeDesconto: Double;
    procedure SetLimiteDeDesconto(const ALimiteDeDesconto: Double);
    function GetPercentualComissao1: Double;
    procedure SetPercentualComissao1(const APercentualComissao1: Double);
    function GetPercentualComissao2: Double;
    procedure SetPercentualComissao2(const APercentualComissao2: Double);
    function GetPercentualComissao3: Double;
    procedure SetPercentualComissao3(const APercentualComissao3: Double);
    function GetRecebeComissaoPorMetas: Boolean;
    procedure SetRecebeComissaoPorMetas(const ARecebeComissaoPorMetas: Boolean);
    function GetInativo: Boolean;
    procedure SetInativo(const AInativo: Boolean);
    function GetHash: TString;
    procedure SetHash(const AHash: TString);
    function GetSetorId: Int64;
    procedure SetSetorId(const ASetorId: Int64);
    function GetNumeroDoDocumento: TString;
    procedure SetNumeroDoDocumento(const ANumeroDoDocumento: TString);
    function GetNumeroDeIdentificacao: TString;
    procedure SetNumeroDeIdentificacao(const ANumeroDeIdentificacao: TString);
    function GetOrgaoExpedidor: TString;
    procedure SetOrgaoExpedidor(const AOrgaoExpedidor: TString);
    function GetCei: TString;
    procedure SetCei(const ACei: TString);
    function GetInscricaoMunicipal: TString;
    procedure SetInscricaoMunicipal(const AInscricaoMunicipal: TString);
    function GetNome: TString;
    procedure SetNome(const ANome: TString);
    function GetFantasia: TString;
    procedure SetFantasia(const AFantasia: TString);
    function GetTelefone1: TString;
    procedure SetTelefone1(const ATelefone1: TString);
    function GetTelefone2: TString;
    procedure SetTelefone2(const ATelefone2: TString);
    function GetFax: TString;
    procedure SetFax(const AFax: TString);
    function GetEmail: TString;
    procedure SetEmail(const AEmail: TString);
    function GetHomePage: TString;
    procedure SetHomePage(const AHomePage: TString);
    function GetRedeSocial: TString;
    procedure SetRedeSocial(const ARedeSocial: TString);
    function GetTwitter: TString;
    procedure SetTwitter(const ATwitter: TString);
    function GetComunicadorDeMensagensInstantaneas: TString;
    procedure SetComunicadorDeMensagensInstantaneas(const AComunicadorDeMensagensInstantaneas: TString);
    function GetSuframa: TString;
    procedure SetSuframa(const ASuframa: TString);
    function GetEndereco: IEndereco;
    procedure SetEndereco(const AEndereco: IEndereco);
    function GetTipo: TTipoPessoa;
    procedure SetTipo(const ATipo: TTipoPessoa);
    function GetHoldingId: Integer;
    procedure SetHoldingId(const AHoldingId: Integer);
  published
    property Id: Int64 read GetId write SetId;
    property Ramal: TString read GetRamal write SetRamal;
    property CargoSysPDVWeb: TString read GetCargoSysPDVWeb write SetCargoSysPDVWeb;
    property DataDeNascimento: TDateTime read GetDataDeNascimento write SetDataDeNascimento;
    property CargoSysPDV: TString read GetCargoSysPDV write SetCargoSysPDV;
    property TipoDoPrecoPadrao: TString read GetTipoDoPrecoPadrao write SetTipoDoPrecoPadrao;
    property LimiteDeDesconto: Double read GetLimiteDeDesconto write SetLimiteDeDesconto;
    property PercentualComissao1: Double read GetPercentualComissao1 write SetPercentualComissao1;
    property PercentualComissao2: Double read GetPercentualComissao2 write SetPercentualComissao2;
    property PercentualComissao3: Double read GetPercentualComissao3 write SetPercentualComissao3;
    property RecebeComissaoPorMetas: Boolean read GetRecebeComissaoPorMetas write SetRecebeComissaoPorMetas;
    property Inativo: Boolean read GetInativo write SetInativo;
    property Hash: TString read GetHash write SetHash;
    property SetorId: Int64 read GetSetorId write SetSetorId;
    property NumeroDoDocumento: TString read GetNumeroDoDocumento write SetNumeroDoDocumento;
    property NumeroDeIdentificacao: TString read GetNumeroDeIdentificacao write SetNumeroDeIdentificacao;
    property OrgaoExpedidor: TString read GetOrgaoExpedidor write SetOrgaoExpedidor;
    property Cei: TString read GetCei write SetCei;
    property InscricaoMunicipal: TString read GetInscricaoMunicipal write SetInscricaoMunicipal;
    property Nome: TString read GetNome write SetNome;
    property Fantasia: TString read GetFantasia write SetFantasia;
    property Telefone1: TString read GetTelefone1 write SetTelefone1;
    property Telefone2: TString read GetTelefone2 write SetTelefone2;
    property Fax: TString read GetFax write SetFax;
    property Email: TString read GetEmail write SetEmail;
    property HomePage: TString read GetHomePage write SetHomePage;
    property RedeSocial: TString read GetRedeSocial write SetRedeSocial;
    property Twitter: TString read GetTwitter write SetTwitter;
    property ComunicadorDeMensagensInstantaneas: TString read GetComunicadorDeMensagensInstantaneas write SetComunicadorDeMensagensInstantaneas;
    property Suframa: TString read GetSuframa write SetSuframa;
    property Endereco: IEndereco read GetEndereco write SetEndereco;
    property Tipo: TTipoPessoa read GetTipo write SetTipo;
    property HoldingId: Integer read GetHoldingId write SetHoldingId;
  end;

implementation

{ TFuncionarioList }

procedure TFuncionarioList.Add(const AFuncionario: IFuncionario);
begin
  FList.Add(AFuncionario);
end;

procedure TFuncionarioList.Clear;
begin
  FList.Clear;
end;

function TFuncionarioList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TFuncionarioList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TFuncionarioList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TFuncionarioList.GetEnumerator: TFuncionarioListEnumerator;
begin
  Result := TFuncionarioListEnumerator.Create(Self);
end;

function TFuncionarioList.GetItems(AIndex: Integer): IFuncionario;
begin
  Result := FList[AIndex] as IFuncionario;
end;

function TFuncionarioList.GetReference: TFuncionarioList;
begin
  Result := Self;
end;

procedure TFuncionarioList.SetItems(AIndex: Integer; const Value: IFuncionario);
begin
  FList[AIndex] := Value;
end;

{ TFuncionarioListEnumerator }

constructor TFuncionarioListEnumerator.Create(AFuncionarioList: TFuncionarioList);
begin
  inherited Create;
  FIndex := -1;
  FFuncionarioList := AFuncionarioList;
end;

function TFuncionarioListEnumerator.GetCurrent: IFuncionario;
begin
  Result := FFuncionarioList[FIndex];
end;

function TFuncionarioListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FFuncionarioList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TFuncionarioListRec }

class function TFuncionarioListRec.Create(const AList: IFuncionarioList): TFuncionarioListRec;
begin
  FillChar(Result, SizeOf(TFuncionarioListRec), 0);
  Result.FList := AList;
end;

class operator TFuncionarioListRec.Implicit(AListRec: TFuncionarioListRec): TFuncionarioList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TFuncionario }

function TFuncionario.GetId: Int64;
begin
  Result := FId;
end;

procedure TFuncionario.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TFuncionario.GetRamal: TString;
begin
  Result := FRamal;
end;

procedure TFuncionario.SetRamal(const ARamal: TString);
begin
  FRamal := ARamal;
end;

function TFuncionario.GetCargoSysPDVWeb: TString;
begin
  Result := FCargoSysPDVWeb;
end;

procedure TFuncionario.SetCargoSysPDVWeb(const ACargoSysPDVWeb: TString);
begin
  FCargoSysPDVWeb := ACargoSysPDVWeb;
end;

function TFuncionario.GetDataDeNascimento: TDateTime;
begin
  Result := FDataDeNascimento;
end;

procedure TFuncionario.SetDataDeNascimento(const ADataDeNascimento: TDateTime);
begin
  FDataDeNascimento := ADataDeNascimento;
end;

function TFuncionario.GetCargoSysPDV: TString;
begin
  Result := FCargoSysPDV;
end;

procedure TFuncionario.SetCargoSysPDV(const ACargoSysPDV: TString);
begin
  FCargoSysPDV := ACargoSysPDV;
end;

function TFuncionario.GetTipoDoPrecoPadrao: TString;
begin
  Result := FTipoDoPrecoPadrao;
end;

procedure TFuncionario.SetTipoDoPrecoPadrao(const ATipoDoPrecoPadrao: TString);
begin
  FTipoDoPrecoPadrao := ATipoDoPrecoPadrao;
end;

function TFuncionario.GetLimiteDeDesconto: Double;
begin
  Result := FLimiteDeDesconto;
end;

procedure TFuncionario.SetLimiteDeDesconto(const ALimiteDeDesconto: Double);
begin
  FLimiteDeDesconto := ALimiteDeDesconto;
end;

function TFuncionario.GetPercentualComissao1: Double;
begin
  Result := FPercentualComissao1;
end;

procedure TFuncionario.SetPercentualComissao1(const APercentualComissao1: Double);
begin
  FPercentualComissao1 := APercentualComissao1;
end;

function TFuncionario.GetPercentualComissao2: Double;
begin
  Result := FPercentualComissao2;
end;

procedure TFuncionario.SetPercentualComissao2(const APercentualComissao2: Double);
begin
  FPercentualComissao2 := APercentualComissao2;
end;

function TFuncionario.GetPercentualComissao3: Double;
begin
  Result := FPercentualComissao3;
end;

procedure TFuncionario.SetPercentualComissao3(const APercentualComissao3: Double);
begin
  FPercentualComissao3 := APercentualComissao3;
end;

function TFuncionario.GetRecebeComissaoPorMetas: Boolean;
begin
  Result := FRecebeComissaoPorMetas;
end;

procedure TFuncionario.SetRecebeComissaoPorMetas(const ARecebeComissaoPorMetas: Boolean);
begin
  FRecebeComissaoPorMetas := ARecebeComissaoPorMetas;
end;

function TFuncionario.GetInativo: Boolean;
begin
  Result := FInativo;
end;

procedure TFuncionario.SetInativo(const AInativo: Boolean);
begin
  FInativo := AInativo;
end;

function TFuncionario.GetHash: TString;
begin
  Result := FHash;
end;

procedure TFuncionario.SetHash(const AHash: TString);
begin
  FHash := AHash;
end;

function TFuncionario.GetSetorId: Int64;
begin
  Result := FSetorId;
end;

procedure TFuncionario.SetSetorId(const ASetorId: Int64);
begin
  FSetorId := ASetorId;
end;

function TFuncionario.GetNumeroDoDocumento: TString;
begin
  Result := FNumeroDoDocumento;
end;

procedure TFuncionario.SetNumeroDoDocumento(const ANumeroDoDocumento: TString);
begin
  FNumeroDoDocumento := ANumeroDoDocumento;
end;

function TFuncionario.GetNumeroDeIdentificacao: TString;
begin
  Result := FNumeroDeIdentificacao;
end;

procedure TFuncionario.SetNumeroDeIdentificacao(const ANumeroDeIdentificacao: TString);
begin
  FNumeroDeIdentificacao := ANumeroDeIdentificacao;
end;

function TFuncionario.GetOrgaoExpedidor: TString;
begin
  Result := FOrgaoExpedidor;
end;

procedure TFuncionario.SetOrgaoExpedidor(const AOrgaoExpedidor: TString);
begin
  FOrgaoExpedidor := AOrgaoExpedidor;
end;

function TFuncionario.GetCei: TString;
begin
  Result := FCei;
end;

procedure TFuncionario.SetCei(const ACei: TString);
begin
  FCei := ACei;
end;

function TFuncionario.GetInscricaoMunicipal: TString;
begin
  Result := FInscricaoMunicipal;
end;

procedure TFuncionario.SetInscricaoMunicipal(const AInscricaoMunicipal: TString);
begin
  FInscricaoMunicipal := AInscricaoMunicipal;
end;

function TFuncionario.GetNome: TString;
begin
  Result := FNome;
end;

procedure TFuncionario.SetNome(const ANome: TString);
begin
  FNome := ANome;
end;

function TFuncionario.GetFantasia: TString;
begin
  Result := FFantasia;
end;

procedure TFuncionario.SetFantasia(const AFantasia: TString);
begin
  FFantasia := AFantasia;
end;

function TFuncionario.GetTelefone1: TString;
begin
  Result := FTelefone1;
end;

procedure TFuncionario.SetTelefone1(const ATelefone1: TString);
begin
  FTelefone1 := ATelefone1;
end;

function TFuncionario.GetTelefone2: TString;
begin
  Result := FTelefone2;
end;

procedure TFuncionario.SetTelefone2(const ATelefone2: TString);
begin
  FTelefone2 := ATelefone2;
end;

function TFuncionario.GetFax: TString;
begin
  Result := FFax;
end;

procedure TFuncionario.SetFax(const AFax: TString);
begin
  FFax := AFax;
end;

function TFuncionario.GetEmail: TString;
begin
  Result := FEmail;
end;

procedure TFuncionario.SetEmail(const AEmail: TString);
begin
  FEmail := AEmail;
end;

function TFuncionario.GetHomePage: TString;
begin
  Result := FHomePage;
end;

procedure TFuncionario.SetHomePage(const AHomePage: TString);
begin
  FHomePage := AHomePage;
end;

function TFuncionario.GetRedeSocial: TString;
begin
  Result := FRedeSocial;
end;

procedure TFuncionario.SetRedeSocial(const ARedeSocial: TString);
begin
  FRedeSocial := ARedeSocial;
end;

function TFuncionario.GetTwitter: TString;
begin
  Result := FTwitter;
end;

procedure TFuncionario.SetTwitter(const ATwitter: TString);
begin
  FTwitter := ATwitter;
end;

function TFuncionario.GetComunicadorDeMensagensInstantaneas: TString;
begin
  Result := FComunicadorDeMensagensInstantaneas;
end;

procedure TFuncionario.SetComunicadorDeMensagensInstantaneas(const AComunicadorDeMensagensInstantaneas: TString);
begin
  FComunicadorDeMensagensInstantaneas := AComunicadorDeMensagensInstantaneas;
end;

function TFuncionario.GetSuframa: TString;
begin
  Result := FSuframa;
end;

procedure TFuncionario.SetSuframa(const ASuframa: TString);
begin
  FSuframa := ASuframa;
end;

function TFuncionario.GetEndereco: IEndereco;
begin
  Result := FEndereco;
end;

procedure TFuncionario.SetEndereco(const AEndereco: IEndereco);
begin
  FEndereco := AEndereco;
end;

function TFuncionario.GetTipo: TTipoPessoa;
begin
  Result := FTipo;
end;

procedure TFuncionario.SetTipo(const ATipo: TTipoPessoa);
begin
  FTipo := ATipo;
end;

function TFuncionario.GetHoldingId: Integer;
begin
  Result := FHoldingId;
end;

procedure TFuncionario.SetHoldingId(const AHoldingId: Integer);
begin
  FHoldingId := AHoldingId;
end;


end.
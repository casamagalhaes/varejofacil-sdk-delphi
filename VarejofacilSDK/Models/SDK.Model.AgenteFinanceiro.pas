unit SDK.Model.AgenteFinanceiro;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums, SDK.Model.Endereco;

type

  IAgenteFinanceiro = interface(IModel)
    ['{296BCB4E-8609-45DB-A734-7115F4404B9C}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetCodigoDoBanco: TString;
    procedure SetCodigoDoBanco(const ACodigoDoBanco: TString);
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
    function GetEndereco: TEndereco;
    procedure SetEndereco(const AEndereco: TEndereco);
    function GetTipo: TTipoPessoa;
    procedure SetTipo(const ATipo: TTipoPessoa);
    function GetHoldingId: Integer;
    procedure SetHoldingId(const AHoldingId: Integer);
    property Id: Int64 read GetId write SetId;
    property CodigoDoBanco: TString read GetCodigoDoBanco write SetCodigoDoBanco;
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
    property Endereco: TEndereco read GetEndereco write SetEndereco;
    property Tipo: TTipoPessoa read GetTipo write SetTipo;
    property HoldingId: Integer read GetHoldingId write SetHoldingId;
  end;

  TAgenteFinanceiroList = class;

  IAgenteFinanceiroList = interface
	['{ADFEC82F-36E1-4933-894E-E9DE8D2DF5B5}']
    function GetReference: TAgenteFinanceiroList;
    function GetItems(AIndex: Integer): IAgenteFinanceiro;
    procedure SetItems(AIndex: Integer; const Value: IAgenteFinanceiro);
    procedure Add(const AAgenteFinanceiro: IAgenteFinanceiro);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IAgenteFinanceiro read GetItems write SetItems; default;
  end;

  TAgenteFinanceiroListEnumerator = class
  private
    FIndex: Integer;
    FAgenteFinanceiroList: TAgenteFinanceiroList;
  public
    constructor Create(AAgenteFinanceiroList: TAgenteFinanceiroList);
    function GetCurrent: IAgenteFinanceiro; inline;
    function MoveNext: Boolean;
    property Current: IAgenteFinanceiro read GetCurrent;
  end;

  TAgenteFinanceiroList = class(TInterfacedObject, IAgenteFinanceiroList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IAgenteFinanceiro;
    procedure SetItems(AIndex: Integer; const Value: IAgenteFinanceiro);
  public
    constructor Create;
    procedure Add(const AAgenteFinanceiro: IAgenteFinanceiro);
    destructor Destroy; override;
    function GetEnumerator: TAgenteFinanceiroListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TAgenteFinanceiroList;
    property Items[AIndex: Integer]: IAgenteFinanceiro read GetItems write SetItems; default;
  end;

  TAgenteFinanceiroListRec = record
  private
    FList: IAgenteFinanceiroList;
  public
    class function Create(const AList: IAgenteFinanceiroList): TAgenteFinanceiroListRec; static;
    class operator Implicit(AListRec: TAgenteFinanceiroListRec): TAgenteFinanceiroList;
  end;

  TAgenteFinanceiro = class(TInterfacedModel, IAgenteFinanceiro)
  private
	FId: Int64;
	FCodigoDoBanco: TString;
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
	FEndereco: TEndereco;
	FTipo: TTipoPessoa;
	FHoldingId: Integer;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetCodigoDoBanco: TString;
    procedure SetCodigoDoBanco(const ACodigoDoBanco: TString);
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
    function GetEndereco: TEndereco;
    procedure SetEndereco(const AEndereco: TEndereco);
    function GetTipo: TTipoPessoa;
    procedure SetTipo(const ATipo: TTipoPessoa);
    function GetHoldingId: Integer;
    procedure SetHoldingId(const AHoldingId: Integer);
  public
    property Id: Int64 read GetId write SetId;
    property CodigoDoBanco: TString read GetCodigoDoBanco write SetCodigoDoBanco;
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
    property Endereco: TEndereco read GetEndereco write SetEndereco;
    property Tipo: TTipoPessoa read GetTipo write SetTipo;
    property HoldingId: Integer read GetHoldingId write SetHoldingId;
  end;

implementation

{ TAgenteFinanceiroList }

procedure TAgenteFinanceiroList.Add(const AAgenteFinanceiro: IAgenteFinanceiro);
begin
  FList.Add(AAgenteFinanceiro);
end;

procedure TAgenteFinanceiroList.Clear;
begin
  FList.Clear;
end;

function TAgenteFinanceiroList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TAgenteFinanceiroList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TAgenteFinanceiroList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TAgenteFinanceiroList.GetEnumerator: TAgenteFinanceiroListEnumerator;
begin
  Result := TAgenteFinanceiroListEnumerator.Create(Self);
end;

function TAgenteFinanceiroList.GetItems(AIndex: Integer): IAgenteFinanceiro;
begin
  Result := FList[AIndex] as IAgenteFinanceiro;
end;

function TAgenteFinanceiroList.GetReference: TAgenteFinanceiroList;
begin
  Result := Self;
end;

procedure TAgenteFinanceiroList.SetItems(AIndex: Integer; const Value: IAgenteFinanceiro);
begin
  FList[AIndex] := Value;
end;

{ TAgenteFinanceiroListEnumerator }

constructor TAgenteFinanceiroListEnumerator.Create(AAgenteFinanceiroList: TAgenteFinanceiroList);
begin
  inherited Create;
  FIndex := -1;
  FAgenteFinanceiroList := AAgenteFinanceiroList;
end;

function TAgenteFinanceiroListEnumerator.GetCurrent: IAgenteFinanceiro;
begin
  Result := FAgenteFinanceiroList[FIndex];
end;

function TAgenteFinanceiroListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FAgenteFinanceiroList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TAgenteFinanceiroListRec }

class function TAgenteFinanceiroListRec.Create(const AList: IAgenteFinanceiroList): TAgenteFinanceiroListRec;
begin
  FillChar(Result, SizeOf(TAgenteFinanceiroListRec), 0);
  Result.FList := AList;
end;

class operator TAgenteFinanceiroListRec.Implicit(AListRec: TAgenteFinanceiroListRec): TAgenteFinanceiroList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TAgenteFinanceiro }

function TAgenteFinanceiro.GetId: Int64;
begin
  Result := FId;
end;

procedure TAgenteFinanceiro.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TAgenteFinanceiro.GetCodigoDoBanco: TString;
begin
  Result := FCodigoDoBanco;
end;

procedure TAgenteFinanceiro.SetCodigoDoBanco(const ACodigoDoBanco: TString);
begin
  FCodigoDoBanco := ACodigoDoBanco;
end;

function TAgenteFinanceiro.GetNumeroDoDocumento: TString;
begin
  Result := FNumeroDoDocumento;
end;

procedure TAgenteFinanceiro.SetNumeroDoDocumento(const ANumeroDoDocumento: TString);
begin
  FNumeroDoDocumento := ANumeroDoDocumento;
end;

function TAgenteFinanceiro.GetNumeroDeIdentificacao: TString;
begin
  Result := FNumeroDeIdentificacao;
end;

procedure TAgenteFinanceiro.SetNumeroDeIdentificacao(const ANumeroDeIdentificacao: TString);
begin
  FNumeroDeIdentificacao := ANumeroDeIdentificacao;
end;

function TAgenteFinanceiro.GetOrgaoExpedidor: TString;
begin
  Result := FOrgaoExpedidor;
end;

procedure TAgenteFinanceiro.SetOrgaoExpedidor(const AOrgaoExpedidor: TString);
begin
  FOrgaoExpedidor := AOrgaoExpedidor;
end;

function TAgenteFinanceiro.GetCei: TString;
begin
  Result := FCei;
end;

procedure TAgenteFinanceiro.SetCei(const ACei: TString);
begin
  FCei := ACei;
end;

function TAgenteFinanceiro.GetInscricaoMunicipal: TString;
begin
  Result := FInscricaoMunicipal;
end;

procedure TAgenteFinanceiro.SetInscricaoMunicipal(const AInscricaoMunicipal: TString);
begin
  FInscricaoMunicipal := AInscricaoMunicipal;
end;

function TAgenteFinanceiro.GetNome: TString;
begin
  Result := FNome;
end;

procedure TAgenteFinanceiro.SetNome(const ANome: TString);
begin
  FNome := ANome;
end;

function TAgenteFinanceiro.GetFantasia: TString;
begin
  Result := FFantasia;
end;

procedure TAgenteFinanceiro.SetFantasia(const AFantasia: TString);
begin
  FFantasia := AFantasia;
end;

function TAgenteFinanceiro.GetTelefone1: TString;
begin
  Result := FTelefone1;
end;

procedure TAgenteFinanceiro.SetTelefone1(const ATelefone1: TString);
begin
  FTelefone1 := ATelefone1;
end;

function TAgenteFinanceiro.GetTelefone2: TString;
begin
  Result := FTelefone2;
end;

procedure TAgenteFinanceiro.SetTelefone2(const ATelefone2: TString);
begin
  FTelefone2 := ATelefone2;
end;

function TAgenteFinanceiro.GetFax: TString;
begin
  Result := FFax;
end;

procedure TAgenteFinanceiro.SetFax(const AFax: TString);
begin
  FFax := AFax;
end;

function TAgenteFinanceiro.GetEmail: TString;
begin
  Result := FEmail;
end;

procedure TAgenteFinanceiro.SetEmail(const AEmail: TString);
begin
  FEmail := AEmail;
end;

function TAgenteFinanceiro.GetHomePage: TString;
begin
  Result := FHomePage;
end;

procedure TAgenteFinanceiro.SetHomePage(const AHomePage: TString);
begin
  FHomePage := AHomePage;
end;

function TAgenteFinanceiro.GetRedeSocial: TString;
begin
  Result := FRedeSocial;
end;

procedure TAgenteFinanceiro.SetRedeSocial(const ARedeSocial: TString);
begin
  FRedeSocial := ARedeSocial;
end;

function TAgenteFinanceiro.GetTwitter: TString;
begin
  Result := FTwitter;
end;

procedure TAgenteFinanceiro.SetTwitter(const ATwitter: TString);
begin
  FTwitter := ATwitter;
end;

function TAgenteFinanceiro.GetComunicadorDeMensagensInstantaneas: TString;
begin
  Result := FComunicadorDeMensagensInstantaneas;
end;

procedure TAgenteFinanceiro.SetComunicadorDeMensagensInstantaneas(const AComunicadorDeMensagensInstantaneas: TString);
begin
  FComunicadorDeMensagensInstantaneas := AComunicadorDeMensagensInstantaneas;
end;

function TAgenteFinanceiro.GetSuframa: TString;
begin
  Result := FSuframa;
end;

procedure TAgenteFinanceiro.SetSuframa(const ASuframa: TString);
begin
  FSuframa := ASuframa;
end;

function TAgenteFinanceiro.GetEndereco: TEndereco;
begin
  Result := FEndereco;
end;

procedure TAgenteFinanceiro.SetEndereco(const AEndereco: TEndereco);
begin
  FEndereco := AEndereco;
end;

function TAgenteFinanceiro.GetTipo: TTipoPessoa;
begin
  Result := FTipo;
end;

procedure TAgenteFinanceiro.SetTipo(const ATipo: TTipoPessoa);
begin
  FTipo := ATipo;
end;

function TAgenteFinanceiro.GetHoldingId: Integer;
begin
  Result := FHoldingId;
end;

procedure TAgenteFinanceiro.SetHoldingId(const AHoldingId: Integer);
begin
  FHoldingId := AHoldingId;
end;


end.
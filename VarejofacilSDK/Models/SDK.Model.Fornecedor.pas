unit SDK.Model.Fornecedor;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums, SDK.Model.Endereco;

type

  IFornecedor = interface(IModel)
    ['{AA61516C-0D8E-4771-80A0-7E33B185A76D}']
    function GetId: Variant;
    procedure SetId(const AId: Variant);
    function GetContato: TString;
    procedure SetContato(const AContato: TString);
    function GetObservacao: TString;
    procedure SetObservacao(const AObservacao: TString);
    function GetTabelaPrazo: TTabelaPrazo;
    procedure SetTabelaPrazo(const ATabelaPrazo: TTabelaPrazo);
    function GetPrazo: Integer;
    procedure SetPrazo(const APrazo: Integer);
    function GetEhIsentoDePisCofins: Boolean;
    procedure SetEhIsentoDePisCofins(const AEhIsentoDePisCofins: Boolean);
    function GetTipoDeFornecedor: TTipoFornecedor;
    procedure SetTipoDeFornecedor(const ATipoDeFornecedor: TTipoFornecedor);
    function GetPrazoDeEntrega: Integer;
    procedure SetPrazoDeEntrega(const APrazoDeEntrega: Integer);
    function GetTipoDeFrete: TTipoFreteNota;
    procedure SetTipoDeFrete(const ATipoDeFrete: TTipoFreteNota);
    function GetTransportadora: Boolean;
    procedure SetTransportadora(const ATransportadora: Boolean);
    function GetServico: Boolean;
    procedure SetServico(const AServico: Boolean);
    function GetRegimeEstadualTributarioId: Variant;
    procedure SetRegimeEstadualTributarioId(const ARegimeEstadualTributarioId: Variant);
    function GetProdutorRural: Boolean;
    procedure SetProdutorRural(const AProdutorRural: Boolean);
    function GetInscricaoEstadual: TString;
    procedure SetInscricaoEstadual(const AInscricaoEstadual: TString);
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
    function GetTipoDePessoa: TTipoPessoa;
    procedure SetTipoDePessoa(const ATipoDePessoa: TTipoPessoa);
    function GetHoldingId: Integer;
    procedure SetHoldingId(const AHoldingId: Integer);
    property Id: Variant read GetId write SetId;
    property Contato: TString read GetContato write SetContato;
    property Observacao: TString read GetObservacao write SetObservacao;
    property TabelaPrazo: TTabelaPrazo read GetTabelaPrazo write SetTabelaPrazo;
    property Prazo: Integer read GetPrazo write SetPrazo;
    property EhIsentoDePisCofins: Boolean read GetEhIsentoDePisCofins write SetEhIsentoDePisCofins;
    property TipoDeFornecedor: TTipoFornecedor read GetTipoDeFornecedor write SetTipoDeFornecedor;
    property PrazoDeEntrega: Integer read GetPrazoDeEntrega write SetPrazoDeEntrega;
    property TipoDeFrete: TTipoFreteNota read GetTipoDeFrete write SetTipoDeFrete;
    property Transportadora: Boolean read GetTransportadora write SetTransportadora;
    property Servico: Boolean read GetServico write SetServico;
    property RegimeEstadualTributarioId: Variant read GetRegimeEstadualTributarioId write SetRegimeEstadualTributarioId;
    property ProdutorRural: Boolean read GetProdutorRural write SetProdutorRural;
    property InscricaoEstadual: TString read GetInscricaoEstadual write SetInscricaoEstadual;
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
    property TipoDePessoa: TTipoPessoa read GetTipoDePessoa write SetTipoDePessoa;
    property HoldingId: Integer read GetHoldingId write SetHoldingId;
  end;

  TFornecedorList = class;

  IFornecedorList = interface
	['{CCC3CE7F-F560-44D4-B08B-1831107B580B}']
    function GetReference: TFornecedorList;
    function GetItems(AIndex: Integer): IFornecedor;
    procedure SetItems(AIndex: Integer; const Value: IFornecedor);
    procedure Add(const AFornecedor: IFornecedor);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IFornecedor read GetItems write SetItems; default;
  end;

  TFornecedorListEnumerator = class
  private
    FIndex: Integer;
    FFornecedorList: TFornecedorList;
  public
    constructor Create(AFornecedorList: TFornecedorList);
    function GetCurrent: IFornecedor; inline;
    function MoveNext: Boolean;
    property Current: IFornecedor read GetCurrent;
  end;

  TFornecedorList = class(TInterfacedObject, IFornecedorList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IFornecedor;
    procedure SetItems(AIndex: Integer; const Value: IFornecedor);
  public
    constructor Create;
    procedure Add(const AFornecedor: IFornecedor);
    destructor Destroy; override;
    function GetEnumerator: TFornecedorListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TFornecedorList;
    property Items[AIndex: Integer]: IFornecedor read GetItems write SetItems; default;
  end;

  TFornecedorListRec = record
  private
    FList: IFornecedorList;
  public
    class function Create(const AList: IFornecedorList): TFornecedorListRec; static;
    class operator Implicit(AListRec: TFornecedorListRec): TFornecedorList;
  end;

  TFornecedor = class(TInterfacedModel, IFornecedor)
  private
	FId: Variant;
	FContato: TString;
	FObservacao: TString;
	FTabelaPrazo: TTabelaPrazo;
	FPrazo: Integer;
	FEhIsentoDePisCofins: Boolean;
	FTipoDeFornecedor: TTipoFornecedor;
	FPrazoDeEntrega: Integer;
	FTipoDeFrete: TTipoFreteNota;
	FTransportadora: Boolean;
	FServico: Boolean;
	FRegimeEstadualTributarioId: Variant;
	FProdutorRural: Boolean;
	FInscricaoEstadual: TString;
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
	FTipoDePessoa: TTipoPessoa;
	FHoldingId: Integer;
    function GetId: Variant;
    procedure SetId(const AId: Variant);
    function GetContato: TString;
    procedure SetContato(const AContato: TString);
    function GetObservacao: TString;
    procedure SetObservacao(const AObservacao: TString);
    function GetTabelaPrazo: TTabelaPrazo;
    procedure SetTabelaPrazo(const ATabelaPrazo: TTabelaPrazo);
    function GetPrazo: Integer;
    procedure SetPrazo(const APrazo: Integer);
    function GetEhIsentoDePisCofins: Boolean;
    procedure SetEhIsentoDePisCofins(const AEhIsentoDePisCofins: Boolean);
    function GetTipoDeFornecedor: TTipoFornecedor;
    procedure SetTipoDeFornecedor(const ATipoDeFornecedor: TTipoFornecedor);
    function GetPrazoDeEntrega: Integer;
    procedure SetPrazoDeEntrega(const APrazoDeEntrega: Integer);
    function GetTipoDeFrete: TTipoFreteNota;
    procedure SetTipoDeFrete(const ATipoDeFrete: TTipoFreteNota);
    function GetTransportadora: Boolean;
    procedure SetTransportadora(const ATransportadora: Boolean);
    function GetServico: Boolean;
    procedure SetServico(const AServico: Boolean);
    function GetRegimeEstadualTributarioId: Variant;
    procedure SetRegimeEstadualTributarioId(const ARegimeEstadualTributarioId: Variant);
    function GetProdutorRural: Boolean;
    procedure SetProdutorRural(const AProdutorRural: Boolean);
    function GetInscricaoEstadual: TString;
    procedure SetInscricaoEstadual(const AInscricaoEstadual: TString);
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
    function GetTipoDePessoa: TTipoPessoa;
    procedure SetTipoDePessoa(const ATipoDePessoa: TTipoPessoa);
    function GetHoldingId: Integer;
    procedure SetHoldingId(const AHoldingId: Integer);
  published
    property Id: Variant read GetId write SetId;
    property Contato: TString read GetContato write SetContato;
    property Observacao: TString read GetObservacao write SetObservacao;
    property TabelaPrazo: TTabelaPrazo read GetTabelaPrazo write SetTabelaPrazo;
    property Prazo: Integer read GetPrazo write SetPrazo;
    property EhIsentoDePisCofins: Boolean read GetEhIsentoDePisCofins write SetEhIsentoDePisCofins;
    property TipoDeFornecedor: TTipoFornecedor read GetTipoDeFornecedor write SetTipoDeFornecedor;
    property PrazoDeEntrega: Integer read GetPrazoDeEntrega write SetPrazoDeEntrega;
    property TipoDeFrete: TTipoFreteNota read GetTipoDeFrete write SetTipoDeFrete;
    property Transportadora: Boolean read GetTransportadora write SetTransportadora;
    property Servico: Boolean read GetServico write SetServico;
    property RegimeEstadualTributarioId: Variant read GetRegimeEstadualTributarioId write SetRegimeEstadualTributarioId;
    property ProdutorRural: Boolean read GetProdutorRural write SetProdutorRural;
    property InscricaoEstadual: TString read GetInscricaoEstadual write SetInscricaoEstadual;
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
    property TipoDePessoa: TTipoPessoa read GetTipoDePessoa write SetTipoDePessoa;
    property HoldingId: Integer read GetHoldingId write SetHoldingId;
  end;

implementation

{ TFornecedorList }

procedure TFornecedorList.Add(const AFornecedor: IFornecedor);
begin
  FList.Add(AFornecedor);
end;

procedure TFornecedorList.Clear;
begin
  FList.Clear;
end;

function TFornecedorList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TFornecedorList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TFornecedorList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TFornecedorList.GetEnumerator: TFornecedorListEnumerator;
begin
  Result := TFornecedorListEnumerator.Create(Self);
end;

function TFornecedorList.GetItems(AIndex: Integer): IFornecedor;
begin
  Result := FList[AIndex] as IFornecedor;
end;

function TFornecedorList.GetReference: TFornecedorList;
begin
  Result := Self;
end;

procedure TFornecedorList.SetItems(AIndex: Integer; const Value: IFornecedor);
begin
  FList[AIndex] := Value;
end;

{ TFornecedorListEnumerator }

constructor TFornecedorListEnumerator.Create(AFornecedorList: TFornecedorList);
begin
  inherited Create;
  FIndex := -1;
  FFornecedorList := AFornecedorList;
end;

function TFornecedorListEnumerator.GetCurrent: IFornecedor;
begin
  Result := FFornecedorList[FIndex];
end;

function TFornecedorListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FFornecedorList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TFornecedorListRec }

class function TFornecedorListRec.Create(const AList: IFornecedorList): TFornecedorListRec;
begin
  FillChar(Result, SizeOf(TFornecedorListRec), 0);
  Result.FList := AList;
end;

class operator TFornecedorListRec.Implicit(AListRec: TFornecedorListRec): TFornecedorList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TFornecedor }

function TFornecedor.GetId: Variant;
begin
  Result := FId;
end;

procedure TFornecedor.SetId(const AId: Variant);
begin
  FId := AId;
end;

function TFornecedor.GetContato: TString;
begin
  Result := FContato;
end;

procedure TFornecedor.SetContato(const AContato: TString);
begin
  FContato := AContato;
end;

function TFornecedor.GetObservacao: TString;
begin
  Result := FObservacao;
end;

procedure TFornecedor.SetObservacao(const AObservacao: TString);
begin
  FObservacao := AObservacao;
end;

function TFornecedor.GetTabelaPrazo: TTabelaPrazo;
begin
  Result := FTabelaPrazo;
end;

procedure TFornecedor.SetTabelaPrazo(const ATabelaPrazo: TTabelaPrazo);
begin
  FTabelaPrazo := ATabelaPrazo;
end;

function TFornecedor.GetPrazo: Integer;
begin
  Result := FPrazo;
end;

procedure TFornecedor.SetPrazo(const APrazo: Integer);
begin
  FPrazo := APrazo;
end;

function TFornecedor.GetEhIsentoDePisCofins: Boolean;
begin
  Result := FEhIsentoDePisCofins;
end;

procedure TFornecedor.SetEhIsentoDePisCofins(const AEhIsentoDePisCofins: Boolean);
begin
  FEhIsentoDePisCofins := AEhIsentoDePisCofins;
end;

function TFornecedor.GetTipoDeFornecedor: TTipoFornecedor;
begin
  Result := FTipoDeFornecedor;
end;

procedure TFornecedor.SetTipoDeFornecedor(const ATipoDeFornecedor: TTipoFornecedor);
begin
  FTipoDeFornecedor := ATipoDeFornecedor;
end;

function TFornecedor.GetPrazoDeEntrega: Integer;
begin
  Result := FPrazoDeEntrega;
end;

procedure TFornecedor.SetPrazoDeEntrega(const APrazoDeEntrega: Integer);
begin
  FPrazoDeEntrega := APrazoDeEntrega;
end;

function TFornecedor.GetTipoDeFrete: TTipoFreteNota;
begin
  Result := FTipoDeFrete;
end;

procedure TFornecedor.SetTipoDeFrete(const ATipoDeFrete: TTipoFreteNota);
begin
  FTipoDeFrete := ATipoDeFrete;
end;

function TFornecedor.GetTransportadora: Boolean;
begin
  Result := FTransportadora;
end;

procedure TFornecedor.SetTransportadora(const ATransportadora: Boolean);
begin
  FTransportadora := ATransportadora;
end;

function TFornecedor.GetServico: Boolean;
begin
  Result := FServico;
end;

procedure TFornecedor.SetServico(const AServico: Boolean);
begin
  FServico := AServico;
end;

function TFornecedor.GetRegimeEstadualTributarioId: Variant;
begin
  Result := FRegimeEstadualTributarioId;
end;

procedure TFornecedor.SetRegimeEstadualTributarioId(const ARegimeEstadualTributarioId: Variant);
begin
  FRegimeEstadualTributarioId := ARegimeEstadualTributarioId;
end;

function TFornecedor.GetProdutorRural: Boolean;
begin
  Result := FProdutorRural;
end;

procedure TFornecedor.SetProdutorRural(const AProdutorRural: Boolean);
begin
  FProdutorRural := AProdutorRural;
end;

function TFornecedor.GetInscricaoEstadual: TString;
begin
  Result := FInscricaoEstadual;
end;

procedure TFornecedor.SetInscricaoEstadual(const AInscricaoEstadual: TString);
begin
  FInscricaoEstadual := AInscricaoEstadual;
end;

function TFornecedor.GetNumeroDoDocumento: TString;
begin
  Result := FNumeroDoDocumento;
end;

procedure TFornecedor.SetNumeroDoDocumento(const ANumeroDoDocumento: TString);
begin
  FNumeroDoDocumento := ANumeroDoDocumento;
end;

function TFornecedor.GetNumeroDeIdentificacao: TString;
begin
  Result := FNumeroDeIdentificacao;
end;

procedure TFornecedor.SetNumeroDeIdentificacao(const ANumeroDeIdentificacao: TString);
begin
  FNumeroDeIdentificacao := ANumeroDeIdentificacao;
end;

function TFornecedor.GetOrgaoExpedidor: TString;
begin
  Result := FOrgaoExpedidor;
end;

procedure TFornecedor.SetOrgaoExpedidor(const AOrgaoExpedidor: TString);
begin
  FOrgaoExpedidor := AOrgaoExpedidor;
end;

function TFornecedor.GetCei: TString;
begin
  Result := FCei;
end;

procedure TFornecedor.SetCei(const ACei: TString);
begin
  FCei := ACei;
end;

function TFornecedor.GetInscricaoMunicipal: TString;
begin
  Result := FInscricaoMunicipal;
end;

procedure TFornecedor.SetInscricaoMunicipal(const AInscricaoMunicipal: TString);
begin
  FInscricaoMunicipal := AInscricaoMunicipal;
end;

function TFornecedor.GetNome: TString;
begin
  Result := FNome;
end;

procedure TFornecedor.SetNome(const ANome: TString);
begin
  FNome := ANome;
end;

function TFornecedor.GetFantasia: TString;
begin
  Result := FFantasia;
end;

procedure TFornecedor.SetFantasia(const AFantasia: TString);
begin
  FFantasia := AFantasia;
end;

function TFornecedor.GetTelefone1: TString;
begin
  Result := FTelefone1;
end;

procedure TFornecedor.SetTelefone1(const ATelefone1: TString);
begin
  FTelefone1 := ATelefone1;
end;

function TFornecedor.GetTelefone2: TString;
begin
  Result := FTelefone2;
end;

procedure TFornecedor.SetTelefone2(const ATelefone2: TString);
begin
  FTelefone2 := ATelefone2;
end;

function TFornecedor.GetFax: TString;
begin
  Result := FFax;
end;

procedure TFornecedor.SetFax(const AFax: TString);
begin
  FFax := AFax;
end;

function TFornecedor.GetEmail: TString;
begin
  Result := FEmail;
end;

procedure TFornecedor.SetEmail(const AEmail: TString);
begin
  FEmail := AEmail;
end;

function TFornecedor.GetHomePage: TString;
begin
  Result := FHomePage;
end;

procedure TFornecedor.SetHomePage(const AHomePage: TString);
begin
  FHomePage := AHomePage;
end;

function TFornecedor.GetRedeSocial: TString;
begin
  Result := FRedeSocial;
end;

procedure TFornecedor.SetRedeSocial(const ARedeSocial: TString);
begin
  FRedeSocial := ARedeSocial;
end;

function TFornecedor.GetTwitter: TString;
begin
  Result := FTwitter;
end;

procedure TFornecedor.SetTwitter(const ATwitter: TString);
begin
  FTwitter := ATwitter;
end;

function TFornecedor.GetComunicadorDeMensagensInstantaneas: TString;
begin
  Result := FComunicadorDeMensagensInstantaneas;
end;

procedure TFornecedor.SetComunicadorDeMensagensInstantaneas(const AComunicadorDeMensagensInstantaneas: TString);
begin
  FComunicadorDeMensagensInstantaneas := AComunicadorDeMensagensInstantaneas;
end;

function TFornecedor.GetSuframa: TString;
begin
  Result := FSuframa;
end;

procedure TFornecedor.SetSuframa(const ASuframa: TString);
begin
  FSuframa := ASuframa;
end;

function TFornecedor.GetEndereco: IEndereco;
begin
  Result := FEndereco;
end;

procedure TFornecedor.SetEndereco(const AEndereco: IEndereco);
begin
  FEndereco := AEndereco;
end;

function TFornecedor.GetTipoDePessoa: TTipoPessoa;
begin
  Result := FTipoDePessoa;
end;

procedure TFornecedor.SetTipoDePessoa(const ATipoDePessoa: TTipoPessoa);
begin
  FTipoDePessoa := ATipoDePessoa;
end;

function TFornecedor.GetHoldingId: Integer;
begin
  Result := FHoldingId;
end;

procedure TFornecedor.SetHoldingId(const AHoldingId: Integer);
begin
  FHoldingId := AHoldingId;
end;


end.
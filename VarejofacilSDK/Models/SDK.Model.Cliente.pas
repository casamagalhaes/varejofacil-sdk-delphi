unit SDK.Model.Cliente;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ICliente = interface(IModel)
    ['{3274B1D8-56E4-4965-A0FA-3684BAB7064F}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetSenha: TString;
    procedure SetSenha(const ASenha: TString);
    function GetOrigemDeAlteracao: TString;
    procedure SetOrigemDeAlteracao(const AOrigemDeAlteracao: TString);
    function GetChaveDaRetaguarda: Integer;
    procedure SetChaveDaRetaguarda(const AChaveDaRetaguarda: Integer);
    function GetVersaoDaRetaguarda: Integer;
    procedure SetVersaoDaRetaguarda(const AVersaoDaRetaguarda: Integer);
    function GetTipoDeCliente: TTipoCliente;
    procedure SetTipoDeCliente(const ATipoDeCliente: TTipoCliente);
    function GetVersao: Int64;
    procedure SetVersao(const AVersao: Int64);
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
    function GetTipoDePessoa: TTipoPessoa;
    procedure SetTipoDePessoa(const ATipoDePessoa: TTipoPessoa);
    function GetHoldingId: Integer;
    procedure SetHoldingId(const AHoldingId: Integer);
    function GetDataDeNascimento: TDateTime;
    procedure SetDataDeNascimento(const ADataDeNascimento: TDateTime);
    function GetEstadoCivil: TEstadoCivil;
    procedure SetEstadoCivil(const AEstadoCivil: TEstadoCivil);
    function GetSexo: TSexo;
    procedure SetSexo(const ASexo: TSexo);
    function GetOrgaoPublico: TString;
    procedure SetOrgaoPublico(const AOrgaoPublico: TString);
    function GetClienteRetemISS: TString;
    procedure SetClienteRetemISS(const AClienteRetemISS: TString);
    function GetAtividade: TString;
    procedure SetAtividade(const AAtividade: TString);
    function GetPessoaParaContato: TString;
    procedure SetPessoaParaContato(const APessoaParaContato: TString);
    function GetNaturalidade: TString;
    procedure SetNaturalidade(const ANaturalidade: TString);
    function GetObservacao: TString;
    procedure SetObservacao(const AObservacao: TString);
    function GetRenda: Double;
    procedure SetRenda(const ARenda: Double);
    function GetOutraRenda: Double;
    procedure SetOutraRenda(const AOutraRenda: Double);
    function GetTipoDeResidencia: TTipoResidencia;
    procedure SetTipoDeResidencia(const ATipoDeResidencia: TTipoResidencia);
    function GetTempoDeResidencia: TString;
    procedure SetTempoDeResidencia(const ATempoDeResidencia: TString);
    function GetTempoDeTrabalhoNaEmpresaAtual: TString;
    procedure SetTempoDeTrabalhoNaEmpresaAtual(const ATempoDeTrabalhoNaEmpresaAtual: TString);
    function GetComprovanteDeRenda: TString;
    procedure SetComprovanteDeRenda(const AComprovanteDeRenda: TString);
    function GetComprovanteDeResidencia: TString;
    procedure SetComprovanteDeResidencia(const AComprovanteDeResidencia: TString);
    function GetSituacaoDaAprovacao: TSituacaoAprovacao;
    procedure SetSituacaoDaAprovacao(const ASituacaoDaAprovacao: TSituacaoAprovacao);
    function GetTabelaPrazo: TTabelaPrazo;
    procedure SetTabelaPrazo(const ATabelaPrazo: TTabelaPrazo);
    function GetPrazo: Integer;
    procedure SetPrazo(const APrazo: Integer);
    function GetTipoDePreco: Integer;
    procedure SetTipoDePreco(const ATipoDePreco: Integer);
    function GetDataDeBloqueio: TDateTime;
    procedure SetDataDeBloqueio(const ADataDeBloqueio: TDateTime);
    function GetTipoDeBloqueio: TString;
    procedure SetTipoDeBloqueio(const ATipoDeBloqueio: TString);
    function GetDescontoConcedidoAoCliente: Double;
    procedure SetDescontoConcedidoAoCliente(const ADescontoConcedidoAoCliente: Double);
    function GetDiaDeFechamento: TString;
    procedure SetDiaDeFechamento(const ADiaDeFechamento: TString);
    function GetStatusId: Integer;
    procedure SetStatusId(const AStatusId: Integer);
    function GetRamoId: Integer;
    procedure SetRamoId(const ARamoId: Integer);
    function GetTipoContribuinte: TTipoContribuinte;
    procedure SetTipoContribuinte(const ATipoContribuinte: TTipoContribuinte);
    property Id: Int64 read GetId write SetId;
    property Senha: TString read GetSenha write SetSenha;
    property OrigemDeAlteracao: TString read GetOrigemDeAlteracao write SetOrigemDeAlteracao;
    property ChaveDaRetaguarda: Integer read GetChaveDaRetaguarda write SetChaveDaRetaguarda;
    property VersaoDaRetaguarda: Integer read GetVersaoDaRetaguarda write SetVersaoDaRetaguarda;
    property TipoDeCliente: TTipoCliente read GetTipoDeCliente write SetTipoDeCliente;
    property Versao: Int64 read GetVersao write SetVersao;
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
    property TipoDePessoa: TTipoPessoa read GetTipoDePessoa write SetTipoDePessoa;
    property HoldingId: Integer read GetHoldingId write SetHoldingId;
    property DataDeNascimento: TDateTime read GetDataDeNascimento write SetDataDeNascimento;
    property EstadoCivil: TEstadoCivil read GetEstadoCivil write SetEstadoCivil;
    property Sexo: TSexo read GetSexo write SetSexo;
    property OrgaoPublico: TString read GetOrgaoPublico write SetOrgaoPublico;
    property ClienteRetemISS: TString read GetClienteRetemISS write SetClienteRetemISS;
    property Atividade: TString read GetAtividade write SetAtividade;
    property PessoaParaContato: TString read GetPessoaParaContato write SetPessoaParaContato;
    property Naturalidade: TString read GetNaturalidade write SetNaturalidade;
    property Observacao: TString read GetObservacao write SetObservacao;
    property Renda: Double read GetRenda write SetRenda;
    property OutraRenda: Double read GetOutraRenda write SetOutraRenda;
    property TipoDeResidencia: TTipoResidencia read GetTipoDeResidencia write SetTipoDeResidencia;
    property TempoDeResidencia: TString read GetTempoDeResidencia write SetTempoDeResidencia;
    property TempoDeTrabalhoNaEmpresaAtual: TString read GetTempoDeTrabalhoNaEmpresaAtual write SetTempoDeTrabalhoNaEmpresaAtual;
    property ComprovanteDeRenda: TString read GetComprovanteDeRenda write SetComprovanteDeRenda;
    property ComprovanteDeResidencia: TString read GetComprovanteDeResidencia write SetComprovanteDeResidencia;
    property SituacaoDaAprovacao: TSituacaoAprovacao read GetSituacaoDaAprovacao write SetSituacaoDaAprovacao;
    property TabelaPrazo: TTabelaPrazo read GetTabelaPrazo write SetTabelaPrazo;
    property Prazo: Integer read GetPrazo write SetPrazo;
    property TipoDePreco: Integer read GetTipoDePreco write SetTipoDePreco;
    property DataDeBloqueio: TDateTime read GetDataDeBloqueio write SetDataDeBloqueio;
    property TipoDeBloqueio: TString read GetTipoDeBloqueio write SetTipoDeBloqueio;
    property DescontoConcedidoAoCliente: Double read GetDescontoConcedidoAoCliente write SetDescontoConcedidoAoCliente;
    property DiaDeFechamento: TString read GetDiaDeFechamento write SetDiaDeFechamento;
    property StatusId: Integer read GetStatusId write SetStatusId;
    property RamoId: Integer read GetRamoId write SetRamoId;
    property TipoContribuinte: TTipoContribuinte read GetTipoContribuinte write SetTipoContribuinte;
  end;

  TClienteList = class;

  IClienteList = interface
	['{9529A742-A053-4B8E-9CB5-3FAEE7E6BD41}']
    function GetReference: TClienteList;
    function GetItems(AIndex: Integer): ICliente;
    procedure SetItems(AIndex: Integer; const Value: ICliente);
    procedure Add(const ACliente: ICliente);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ICliente read GetItems write SetItems; default;
  end;

  TClienteListEnumerator = class
  private
    FIndex: Integer;
    FClienteList: TClienteList;
  public
    constructor Create(AClienteList: TClienteList);
    function GetCurrent: ICliente; inline;
    function MoveNext: Boolean;
    property Current: ICliente read GetCurrent;
  end;

  TClienteList = class(TInterfacedObject, IClienteList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ICliente;
    procedure SetItems(AIndex: Integer; const Value: ICliente);
  public
    constructor Create;
    procedure Add(const ACliente: ICliente);
    destructor Destroy; override;
    function GetEnumerator: TClienteListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TClienteList;
    property Items[AIndex: Integer]: ICliente read GetItems write SetItems; default;
  end;

  TClienteListRec = record
  private
    FList: IClienteList;
  public
    class function Create(const AList: IClienteList): TClienteListRec; static;
    class operator Implicit(AListRec: TClienteListRec): TClienteList;
  end;

  TCliente = class(TInterfacedModel, ICliente)
  private
    FId: Int64;
    FSenha: TString;
    FOrigemDeAlteracao: TString;
    FChaveDaRetaguarda: Integer;
    FVersaoDaRetaguarda: Integer;
    FTipoDeCliente: TTipoCliente;
    FVersao: Int64;
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
    FTipoDePessoa: TTipoPessoa;
    FHoldingId: Integer;
    FDataDeNascimento: TDateTime;
    FEstadoCivil: TEstadoCivil;
    FSexo: TSexo;
    FOrgaoPublico: TString;
    FClienteRetemISS: TString;
    FAtividade: TString;
    FPessoaParaContato: TString;
    FNaturalidade: TString;
    FObservacao: TString;
    FRenda: Double;
    FOutraRenda: Double;
    FTipoDeResidencia: TTipoResidencia;
    FTempoDeResidencia: TString;
    FTempoDeTrabalhoNaEmpresaAtual: TString;
    FComprovanteDeRenda: TString;
    FComprovanteDeResidencia: TString;
    FSituacaoDaAprovacao: TSituacaoAprovacao;
    FTabelaPrazo: TTabelaPrazo;
    FPrazo: Integer;
    FTipoDePreco: Integer;
    FDataDeBloqueio: TDateTime;
    FTipoDeBloqueio: TString;
    FDescontoConcedidoAoCliente: Double;
    FDiaDeFechamento: TString;
    FStatusId: Integer;
    FRamoId: Integer;
    FTipoContribuinte: TTipoContribuinte;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetSenha: TString;
    procedure SetSenha(const ASenha: TString);
    function GetOrigemDeAlteracao: TString;
    procedure SetOrigemDeAlteracao(const AOrigemDeAlteracao: TString);
    function GetChaveDaRetaguarda: Integer;
    procedure SetChaveDaRetaguarda(const AChaveDaRetaguarda: Integer);
    function GetVersaoDaRetaguarda: Integer;
    procedure SetVersaoDaRetaguarda(const AVersaoDaRetaguarda: Integer);
    function GetTipoDeCliente: TTipoCliente;
    procedure SetTipoDeCliente(const ATipoDeCliente: TTipoCliente);
    function GetVersao: Int64;
    procedure SetVersao(const AVersao: Int64);
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
    function GetTipoDePessoa: TTipoPessoa;
    procedure SetTipoDePessoa(const ATipoDePessoa: TTipoPessoa);
    function GetHoldingId: Integer;
    procedure SetHoldingId(const AHoldingId: Integer);
    function GetDataDeNascimento: TDateTime;
    procedure SetDataDeNascimento(const ADataDeNascimento: TDateTime);
    function GetEstadoCivil: TEstadoCivil;
    procedure SetEstadoCivil(const AEstadoCivil: TEstadoCivil);
    function GetSexo: TSexo;
    procedure SetSexo(const ASexo: TSexo);
    function GetOrgaoPublico: TString;
    procedure SetOrgaoPublico(const AOrgaoPublico: TString);
    function GetClienteRetemISS: TString;
    procedure SetClienteRetemISS(const AClienteRetemISS: TString);
    function GetAtividade: TString;
    procedure SetAtividade(const AAtividade: TString);
    function GetPessoaParaContato: TString;
    procedure SetPessoaParaContato(const APessoaParaContato: TString);
    function GetNaturalidade: TString;
    procedure SetNaturalidade(const ANaturalidade: TString);
    function GetObservacao: TString;
    procedure SetObservacao(const AObservacao: TString);
    function GetRenda: Double;
    procedure SetRenda(const ARenda: Double);
    function GetOutraRenda: Double;
    procedure SetOutraRenda(const AOutraRenda: Double);
    function GetTipoDeResidencia: TTipoResidencia;
    procedure SetTipoDeResidencia(const ATipoDeResidencia: TTipoResidencia);
    function GetTempoDeResidencia: TString;
    procedure SetTempoDeResidencia(const ATempoDeResidencia: TString);
    function GetTempoDeTrabalhoNaEmpresaAtual: TString;
    procedure SetTempoDeTrabalhoNaEmpresaAtual(const ATempoDeTrabalhoNaEmpresaAtual: TString);
    function GetComprovanteDeRenda: TString;
    procedure SetComprovanteDeRenda(const AComprovanteDeRenda: TString);
    function GetComprovanteDeResidencia: TString;
    procedure SetComprovanteDeResidencia(const AComprovanteDeResidencia: TString);
    function GetSituacaoDaAprovacao: TSituacaoAprovacao;
    procedure SetSituacaoDaAprovacao(const ASituacaoDaAprovacao: TSituacaoAprovacao);
    function GetTabelaPrazo: TTabelaPrazo;
    procedure SetTabelaPrazo(const ATabelaPrazo: TTabelaPrazo);
    function GetPrazo: Integer;
    procedure SetPrazo(const APrazo: Integer);
    function GetTipoDePreco: Integer;
    procedure SetTipoDePreco(const ATipoDePreco: Integer);
    function GetDataDeBloqueio: TDateTime;
    procedure SetDataDeBloqueio(const ADataDeBloqueio: TDateTime);
    function GetTipoDeBloqueio: TString;
    procedure SetTipoDeBloqueio(const ATipoDeBloqueio: TString);
    function GetDescontoConcedidoAoCliente: Double;
    procedure SetDescontoConcedidoAoCliente(const ADescontoConcedidoAoCliente: Double);
    function GetDiaDeFechamento: TString;
    procedure SetDiaDeFechamento(const ADiaDeFechamento: TString);
    function GetStatusId: Integer;
    procedure SetStatusId(const AStatusId: Integer);
    function GetRamoId: Integer;
    procedure SetRamoId(const ARamoId: Integer);
    function GetTipoContribuinte: TTipoContribuinte;
    procedure SetTipoContribuinte(const Value: TTipoContribuinte);
  published
    property Id: Int64 read GetId write SetId;
    property Senha: TString read GetSenha write SetSenha;
    property OrigemDeAlteracao: TString read GetOrigemDeAlteracao write SetOrigemDeAlteracao;
    property ChaveDaRetaguarda: Integer read GetChaveDaRetaguarda write SetChaveDaRetaguarda;
    property VersaoDaRetaguarda: Integer read GetVersaoDaRetaguarda write SetVersaoDaRetaguarda;
    property TipoDeCliente: TTipoCliente read GetTipoDeCliente write SetTipoDeCliente;
    property Versao: Int64 read GetVersao write SetVersao;
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
    property TipoDePessoa: TTipoPessoa read GetTipoDePessoa write SetTipoDePessoa;
    property HoldingId: Integer read GetHoldingId write SetHoldingId;
    property DataDeNascimento: TDateTime read GetDataDeNascimento write SetDataDeNascimento;
    property EstadoCivil: TEstadoCivil read GetEstadoCivil write SetEstadoCivil;
    property Sexo: TSexo read GetSexo write SetSexo;
    property OrgaoPublico: TString read GetOrgaoPublico write SetOrgaoPublico;
    property ClienteRetemISS: TString read GetClienteRetemISS write SetClienteRetemISS;
    property Atividade: TString read GetAtividade write SetAtividade;
    property PessoaParaContato: TString read GetPessoaParaContato write SetPessoaParaContato;
    property Naturalidade: TString read GetNaturalidade write SetNaturalidade;
    property Observacao: TString read GetObservacao write SetObservacao;
    property Renda: Double read GetRenda write SetRenda;
    property OutraRenda: Double read GetOutraRenda write SetOutraRenda;
    property TipoDeResidencia: TTipoResidencia read GetTipoDeResidencia write SetTipoDeResidencia;
    property TempoDeResidencia: TString read GetTempoDeResidencia write SetTempoDeResidencia;
    property TempoDeTrabalhoNaEmpresaAtual: TString read GetTempoDeTrabalhoNaEmpresaAtual write SetTempoDeTrabalhoNaEmpresaAtual;
    property ComprovanteDeRenda: TString read GetComprovanteDeRenda write SetComprovanteDeRenda;
    property ComprovanteDeResidencia: TString read GetComprovanteDeResidencia write SetComprovanteDeResidencia;
    property SituacaoDaAprovacao: TSituacaoAprovacao read GetSituacaoDaAprovacao write SetSituacaoDaAprovacao;
    property TabelaPrazo: TTabelaPrazo read GetTabelaPrazo write SetTabelaPrazo;
    property Prazo: Integer read GetPrazo write SetPrazo;
    property TipoDePreco: Integer read GetTipoDePreco write SetTipoDePreco;
    property DataDeBloqueio: TDateTime read GetDataDeBloqueio write SetDataDeBloqueio;
    property TipoDeBloqueio: TString read GetTipoDeBloqueio write SetTipoDeBloqueio;
    property DescontoConcedidoAoCliente: Double read GetDescontoConcedidoAoCliente write SetDescontoConcedidoAoCliente;
    property DiaDeFechamento: TString read GetDiaDeFechamento write SetDiaDeFechamento;
    property StatusId: Integer read GetStatusId write SetStatusId;
    property RamoId: Integer read GetRamoId write SetRamoId;
    property TipoContribuinte: TTipoContribuinte read GetTipoContribuinte write SetTipoContribuinte;
  end;

implementation

{ TClienteList }

procedure TClienteList.Add(const ACliente: ICliente);
begin
  FList.Add(ACliente);
end;

procedure TClienteList.Clear;
begin
  FList.Clear;
end;

function TClienteList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TClienteList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TClienteList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TClienteList.GetEnumerator: TClienteListEnumerator;
begin
  Result := TClienteListEnumerator.Create(Self);
end;

function TClienteList.GetItems(AIndex: Integer): ICliente;
begin
  Result := FList[AIndex] as ICliente;
end;

function TClienteList.GetReference: TClienteList;
begin
  Result := Self;
end;

procedure TClienteList.SetItems(AIndex: Integer; const Value: ICliente);
begin
  FList[AIndex] := Value;
end;

{ TClienteListEnumerator }

constructor TClienteListEnumerator.Create(AClienteList: TClienteList);
begin
  inherited Create;
  FIndex := -1;
  FClienteList := AClienteList;
end;

function TClienteListEnumerator.GetCurrent: ICliente;
begin
  Result := FClienteList[FIndex];
end;

function TClienteListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FClienteList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TClienteListRec }

class function TClienteListRec.Create(const AList: IClienteList): TClienteListRec;
begin
  FillChar(Result, SizeOf(TClienteListRec), 0);
  Result.FList := AList;
end;

class operator TClienteListRec.Implicit(AListRec: TClienteListRec): TClienteList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TCliente }

function TCliente.GetId: Int64;
begin
  Result := FId;
end;

procedure TCliente.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TCliente.GetSenha: TString;
begin
  Result := FSenha;
end;

procedure TCliente.SetSenha(const ASenha: TString);
begin
  FSenha := ASenha;
end;

function TCliente.GetOrigemDeAlteracao: TString;
begin
  Result := FOrigemDeAlteracao;
end;

procedure TCliente.SetOrigemDeAlteracao(const AOrigemDeAlteracao: TString);
begin
  FOrigemDeAlteracao := AOrigemDeAlteracao;
end;

function TCliente.GetChaveDaRetaguarda: Integer;
begin
  Result := FChaveDaRetaguarda;
end;

procedure TCliente.SetChaveDaRetaguarda(const AChaveDaRetaguarda: Integer);
begin
  FChaveDaRetaguarda := AChaveDaRetaguarda;
end;

function TCliente.GetVersaoDaRetaguarda: Integer;
begin
  Result := FVersaoDaRetaguarda;
end;

procedure TCliente.SetVersaoDaRetaguarda(const AVersaoDaRetaguarda: Integer);
begin
  FVersaoDaRetaguarda := AVersaoDaRetaguarda;
end;

function TCliente.GetTipoDeCliente: TTipoCliente;
begin
  Result := FTipoDeCliente;
end;

procedure TCliente.SetTipoDeCliente(const ATipoDeCliente: TTipoCliente);
begin
  FTipoDeCliente := ATipoDeCliente;
end;

function TCliente.GetVersao: Int64;
begin
  Result := FVersao;
end;

procedure TCliente.SetVersao(const AVersao: Int64);
begin
  FVersao := AVersao;
end;

function TCliente.GetNumeroDoDocumento: TString;
begin
  Result := FNumeroDoDocumento;
end;

procedure TCliente.SetNumeroDoDocumento(const ANumeroDoDocumento: TString);
begin
  FNumeroDoDocumento := ANumeroDoDocumento;
end;

function TCliente.GetNumeroDeIdentificacao: TString;
begin
  Result := FNumeroDeIdentificacao;
end;

procedure TCliente.SetNumeroDeIdentificacao(const ANumeroDeIdentificacao: TString);
begin
  FNumeroDeIdentificacao := ANumeroDeIdentificacao;
end;

function TCliente.GetOrgaoExpedidor: TString;
begin
  Result := FOrgaoExpedidor;
end;

procedure TCliente.SetOrgaoExpedidor(const AOrgaoExpedidor: TString);
begin
  FOrgaoExpedidor := AOrgaoExpedidor;
end;

function TCliente.GetCei: TString;
begin
  Result := FCei;
end;

procedure TCliente.SetCei(const ACei: TString);
begin
  FCei := ACei;
end;

function TCliente.GetInscricaoMunicipal: TString;
begin
  Result := FInscricaoMunicipal;
end;

procedure TCliente.SetInscricaoMunicipal(const AInscricaoMunicipal: TString);
begin
  FInscricaoMunicipal := AInscricaoMunicipal;
end;

function TCliente.GetNome: TString;
begin
  Result := FNome;
end;

procedure TCliente.SetNome(const ANome: TString);
begin
  FNome := ANome;
end;

function TCliente.GetFantasia: TString;
begin
  Result := FFantasia;
end;

procedure TCliente.SetFantasia(const AFantasia: TString);
begin
  FFantasia := AFantasia;
end;

function TCliente.GetTelefone1: TString;
begin
  Result := FTelefone1;
end;

procedure TCliente.SetTelefone1(const ATelefone1: TString);
begin
  FTelefone1 := ATelefone1;
end;

function TCliente.GetTelefone2: TString;
begin
  Result := FTelefone2;
end;

procedure TCliente.SetTelefone2(const ATelefone2: TString);
begin
  FTelefone2 := ATelefone2;
end;

function TCliente.GetFax: TString;
begin
  Result := FFax;
end;

procedure TCliente.SetFax(const AFax: TString);
begin
  FFax := AFax;
end;

function TCliente.GetEmail: TString;
begin
  Result := FEmail;
end;

procedure TCliente.SetEmail(const AEmail: TString);
begin
  FEmail := AEmail;
end;

function TCliente.GetHomePage: TString;
begin
  Result := FHomePage;
end;

procedure TCliente.SetHomePage(const AHomePage: TString);
begin
  FHomePage := AHomePage;
end;

function TCliente.GetRedeSocial: TString;
begin
  Result := FRedeSocial;
end;

procedure TCliente.SetRedeSocial(const ARedeSocial: TString);
begin
  FRedeSocial := ARedeSocial;
end;

function TCliente.GetTwitter: TString;
begin
  Result := FTwitter;
end;

procedure TCliente.SetTwitter(const ATwitter: TString);
begin
  FTwitter := ATwitter;
end;

function TCliente.GetComunicadorDeMensagensInstantaneas: TString;
begin
  Result := FComunicadorDeMensagensInstantaneas;
end;

procedure TCliente.SetComunicadorDeMensagensInstantaneas(const AComunicadorDeMensagensInstantaneas: TString);
begin
  FComunicadorDeMensagensInstantaneas := AComunicadorDeMensagensInstantaneas;
end;

function TCliente.GetSuframa: TString;
begin
  Result := FSuframa;
end;

procedure TCliente.SetSuframa(const ASuframa: TString);
begin
  FSuframa := ASuframa;
end;

function TCliente.GetTipoDePessoa: TTipoPessoa;
begin
  Result := FTipoDePessoa;
end;

procedure TCliente.SetTipoDePessoa(const ATipoDePessoa: TTipoPessoa);
begin
  FTipoDePessoa := ATipoDePessoa;
end;

function TCliente.GetHoldingId: Integer;
begin
  Result := FHoldingId;
end;

procedure TCliente.SetHoldingId(const AHoldingId: Integer);
begin
  FHoldingId := AHoldingId;
end;

function TCliente.GetDataDeNascimento: TDateTime;
begin
  Result := FDataDeNascimento;
end;

procedure TCliente.SetDataDeNascimento(const ADataDeNascimento: TDateTime);
begin
  FDataDeNascimento := ADataDeNascimento;
end;

function TCliente.GetEstadoCivil: TEstadoCivil;
begin
  Result := FEstadoCivil;
end;

procedure TCliente.SetEstadoCivil(const AEstadoCivil: TEstadoCivil);
begin
  FEstadoCivil := AEstadoCivil;
end;

function TCliente.GetSexo: TSexo;
begin
  Result := FSexo;
end;

procedure TCliente.SetSexo(const ASexo: TSexo);
begin
  FSexo := ASexo;
end;

function TCliente.GetOrgaoPublico: TString;
begin
  Result := FOrgaoPublico;
end;

procedure TCliente.SetOrgaoPublico(const AOrgaoPublico: TString);
begin
  FOrgaoPublico := AOrgaoPublico;
end;

function TCliente.GetClienteRetemISS: TString;
begin
  Result := FClienteRetemISS;
end;

procedure TCliente.SetClienteRetemISS(const AClienteRetemISS: TString);
begin
  FClienteRetemISS := AClienteRetemISS;
end;

function TCliente.GetAtividade: TString;
begin
  Result := FAtividade;
end;

procedure TCliente.SetAtividade(const AAtividade: TString);
begin
  FAtividade := AAtividade;
end;

function TCliente.GetPessoaParaContato: TString;
begin
  Result := FPessoaParaContato;
end;

procedure TCliente.SetPessoaParaContato(const APessoaParaContato: TString);
begin
  FPessoaParaContato := APessoaParaContato;
end;

function TCliente.GetNaturalidade: TString;
begin
  Result := FNaturalidade;
end;

procedure TCliente.SetNaturalidade(const ANaturalidade: TString);
begin
  FNaturalidade := ANaturalidade;
end;

function TCliente.GetObservacao: TString;
begin
  Result := FObservacao;
end;

procedure TCliente.SetObservacao(const AObservacao: TString);
begin
  FObservacao := AObservacao;
end;

function TCliente.GetRenda: Double;
begin
  Result := FRenda;
end;

procedure TCliente.SetRenda(const ARenda: Double);
begin
  FRenda := ARenda;
end;

function TCliente.GetOutraRenda: Double;
begin
  Result := FOutraRenda;
end;

procedure TCliente.SetOutraRenda(const AOutraRenda: Double);
begin
  FOutraRenda := AOutraRenda;
end;

function TCliente.GetTipoDeResidencia: TTipoResidencia;
begin
  Result := FTipoDeResidencia;
end;

procedure TCliente.SetTipoDeResidencia(const ATipoDeResidencia: TTipoResidencia);
begin
  FTipoDeResidencia := ATipoDeResidencia;
end;

function TCliente.GetTempoDeResidencia: TString;
begin
  Result := FTempoDeResidencia;
end;

procedure TCliente.SetTempoDeResidencia(const ATempoDeResidencia: TString);
begin
  FTempoDeResidencia := ATempoDeResidencia;
end;

function TCliente.GetTempoDeTrabalhoNaEmpresaAtual: TString;
begin
  Result := FTempoDeTrabalhoNaEmpresaAtual;
end;

procedure TCliente.SetTempoDeTrabalhoNaEmpresaAtual(const ATempoDeTrabalhoNaEmpresaAtual: TString);
begin
  FTempoDeTrabalhoNaEmpresaAtual := ATempoDeTrabalhoNaEmpresaAtual;
end;

function TCliente.GetComprovanteDeRenda: TString;
begin
  Result := FComprovanteDeRenda;
end;

procedure TCliente.SetComprovanteDeRenda(const AComprovanteDeRenda: TString);
begin
  FComprovanteDeRenda := AComprovanteDeRenda;
end;

function TCliente.GetComprovanteDeResidencia: TString;
begin
  Result := FComprovanteDeResidencia;
end;

procedure TCliente.SetComprovanteDeResidencia(const AComprovanteDeResidencia: TString);
begin
  FComprovanteDeResidencia := AComprovanteDeResidencia;
end;

function TCliente.GetSituacaoDaAprovacao: TSituacaoAprovacao;
begin
  Result := FSituacaoDaAprovacao;
end;

procedure TCliente.SetSituacaoDaAprovacao(const ASituacaoDaAprovacao: TSituacaoAprovacao);
begin
  FSituacaoDaAprovacao := ASituacaoDaAprovacao;
end;

function TCliente.GetTabelaPrazo: TTabelaPrazo;
begin
  Result := FTabelaPrazo;
end;

procedure TCliente.SetTabelaPrazo(const ATabelaPrazo: TTabelaPrazo);
begin
  FTabelaPrazo := ATabelaPrazo;
end;

function TCliente.GetPrazo: Integer;
begin
  Result := FPrazo;
end;

procedure TCliente.SetPrazo(const APrazo: Integer);
begin
  FPrazo := APrazo;
end;

function TCliente.GetTipoDePreco: Integer;
begin
  Result := FTipoDePreco;
end;

procedure TCliente.SetTipoDePreco(const ATipoDePreco: Integer);
begin
  FTipoDePreco := ATipoDePreco;
end;

function TCliente.GetDataDeBloqueio: TDateTime;
begin
  Result := FDataDeBloqueio;
end;

procedure TCliente.SetDataDeBloqueio(const ADataDeBloqueio: TDateTime);
begin
  FDataDeBloqueio := ADataDeBloqueio;
end;

function TCliente.GetTipoContribuinte: TTipoContribuinte;
begin
  Result := FTipoContribuinte;
end;

function TCliente.GetTipoDeBloqueio: TString;
begin
  Result := FTipoDeBloqueio;
end;

procedure TCliente.SetTipoContribuinte(const Value: TTipoContribuinte);
begin
  FTipoContribuinte := Value;
end;

procedure TCliente.SetTipoDeBloqueio(const ATipoDeBloqueio: TString);
begin
  FTipoDeBloqueio := ATipoDeBloqueio;
end;

function TCliente.GetDescontoConcedidoAoCliente: Double;
begin
  Result := FDescontoConcedidoAoCliente;
end;

procedure TCliente.SetDescontoConcedidoAoCliente(const ADescontoConcedidoAoCliente: Double);
begin
  FDescontoConcedidoAoCliente := ADescontoConcedidoAoCliente;
end;

function TCliente.GetDiaDeFechamento: TString;
begin
  Result := FDiaDeFechamento;
end;

procedure TCliente.SetDiaDeFechamento(const ADiaDeFechamento: TString);
begin
  FDiaDeFechamento := ADiaDeFechamento;
end;

function TCliente.GetStatusId: Integer;
begin
  Result := FStatusId;
end;

procedure TCliente.SetStatusId(const AStatusId: Integer);
begin
  FStatusId := AStatusId;
end;

function TCliente.GetRamoId: Integer;
begin
  Result := FRamoId;
end;

procedure TCliente.SetRamoId(const ARamoId: Integer);
begin
  FRamoId := ARamoId;
end;


end.
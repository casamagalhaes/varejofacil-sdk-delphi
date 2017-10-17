unit SDK.Model.ItemVenda;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IItemVenda = interface(IModel)
    ['{1B3A14C2-C5AF-41C0-957A-1A5E99592F43}']
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetProdutoId: Int64;
    procedure SetProdutoId(const AProdutoId: Int64);
    function GetFuncionarioVendedorId: Integer;
    procedure SetFuncionarioVendedorId(const AFuncionarioVendedorId: Integer);
    function GetFuncionarioAutorizadorId: Integer;
    procedure SetFuncionarioAutorizadorId(const AFuncionarioAutorizadorId: Integer);
    function GetFuncionarioCaptacaoPrevendaId: TString;
    procedure SetFuncionarioCaptacaoPrevendaId(const AFuncionarioCaptacaoPrevendaId: TString);
    function GetFuncionarioProducaoId: TString;
    procedure SetFuncionarioProducaoId(const AFuncionarioProducaoId: TString);
    function GetQuantidadeVenda: Double;
    procedure SetQuantidadeVenda(const AQuantidadeVenda: Double);
    function GetValorUnidade: Double;
    procedure SetValorUnidade(const AValorUnidade: Double);
    function GetValorAcrescimo: Double;
    procedure SetValorAcrescimo(const AValorAcrescimo: Double);
    function GetValorDesconto: Double;
    procedure SetValorDesconto(const AValorDesconto: Double);
    function GetValorTotal: Double;
    procedure SetValorTotal(const AValorTotal: Double);
    function GetPrecoVenda: Double;
    procedure SetPrecoVenda(const APrecoVenda: Double);
    function GetValorServico: Double;
    procedure SetValorServico(const AValorServico: Double);
    function GetFatorBonificacao: Double;
    procedure SetFatorBonificacao(const AFatorBonificacao: Double);
    function GetPrecoCusto: Double;
    procedure SetPrecoCusto(const APrecoCusto: Double);
    function GetPrecoCustoMedio: Double;
    procedure SetPrecoCustoMedio(const APrecoCustoMedio: Double);
    function GetPrecoCustoFiscal: Double;
    procedure SetPrecoCustoFiscal(const APrecoCustoFiscal: Double);
    function GetTributacaoAliquota: Double;
    procedure SetTributacaoAliquota(const ATributacaoAliquota: Double);
    function GetTributacaoValorReducao: Double;
    procedure SetTributacaoValorReducao(const ATributacaoValorReducao: Double);
    function GetValorDoDescontoMegaCaixa: Double;
    procedure SetValorDoDescontoMegaCaixa(const AValorDoDescontoMegaCaixa: Double);
    function GetAliquotaPIS: Double;
    procedure SetAliquotaPIS(const AAliquotaPIS: Double);
    function GetAliquotaCOFINS: Double;
    procedure SetAliquotaCOFINS(const AAliquotaCOFINS: Double);
    function GetTaxaEntrega: Boolean;
    procedure SetTaxaEntrega(const ATaxaEntrega: Boolean);
    function GetParticipouPromocaoDesconto: Boolean;
    procedure SetParticipouPromocaoDesconto(const AParticipouPromocaoDesconto: Boolean);
    function GetTipoBonificacao: TString;
    procedure SetTipoBonificacao(const ATipoBonificacao: TString);
    function GetTipo: TString;
    procedure SetTipo(const ATipo: TString);
    function GetSerieProduto: TString;
    procedure SetSerieProduto(const ASerieProduto: TString);
    function GetTributacao: TString;
    procedure SetTributacao(const ATributacao: TString);
    function GetTributacaoSimbologia: TString;
    procedure SetTributacaoSimbologia(const ATributacaoSimbologia: TString);
    function GetTipoPreco: TString;
    procedure SetTipoPreco(const ATipoPreco: TString);
    function GetTipoDeDescontoAplicado: TString;
    procedure SetTipoDeDescontoAplicado(const ATipoDeDescontoAplicado: TString);
    function GetCsosn: TString;
    procedure SetCsosn(const ACsosn: TString);
    function GetCstPIS: TString;
    procedure SetCstPIS(const ACstPIS: TString);
    function GetCstCOFINS: TString;
    procedure SetCstCOFINS(const ACstCOFINS: TString);
    function GetNatureza: TString;
    procedure SetNatureza(const ANatureza: TString);
    function GetNcm: TString;
    procedure SetNcm(const ANcm: TString);
    function GetNcmExcecao: TString;
    procedure SetNcmExcecao(const ANcmExcecao: TString);
    function GetTabelaA: TString;
    procedure SetTabelaA(const ATabelaA: TString);
    function GetTabelaB: TString;
    procedure SetTabelaB(const ATabelaB: TString);
    function GetCfop: TString;
    procedure SetCfop(const ACfop: TString);
    property Id: Integer read GetId write SetId;
    property ProdutoId: Int64 read GetProdutoId write SetProdutoId;
    property FuncionarioVendedorId: Integer read GetFuncionarioVendedorId write SetFuncionarioVendedorId;
    property FuncionarioAutorizadorId: Integer read GetFuncionarioAutorizadorId write SetFuncionarioAutorizadorId;
    property FuncionarioCaptacaoPrevendaId: TString read GetFuncionarioCaptacaoPrevendaId write SetFuncionarioCaptacaoPrevendaId;
    property FuncionarioProducaoId: TString read GetFuncionarioProducaoId write SetFuncionarioProducaoId;
    property QuantidadeVenda: Double read GetQuantidadeVenda write SetQuantidadeVenda;
    property ValorUnidade: Double read GetValorUnidade write SetValorUnidade;
    property ValorAcrescimo: Double read GetValorAcrescimo write SetValorAcrescimo;
    property ValorDesconto: Double read GetValorDesconto write SetValorDesconto;
    property ValorTotal: Double read GetValorTotal write SetValorTotal;
    property PrecoVenda: Double read GetPrecoVenda write SetPrecoVenda;
    property ValorServico: Double read GetValorServico write SetValorServico;
    property FatorBonificacao: Double read GetFatorBonificacao write SetFatorBonificacao;
    property PrecoCusto: Double read GetPrecoCusto write SetPrecoCusto;
    property PrecoCustoMedio: Double read GetPrecoCustoMedio write SetPrecoCustoMedio;
    property PrecoCustoFiscal: Double read GetPrecoCustoFiscal write SetPrecoCustoFiscal;
    property TributacaoAliquota: Double read GetTributacaoAliquota write SetTributacaoAliquota;
    property TributacaoValorReducao: Double read GetTributacaoValorReducao write SetTributacaoValorReducao;
    property ValorDoDescontoMegaCaixa: Double read GetValorDoDescontoMegaCaixa write SetValorDoDescontoMegaCaixa;
    property AliquotaPIS: Double read GetAliquotaPIS write SetAliquotaPIS;
    property AliquotaCOFINS: Double read GetAliquotaCOFINS write SetAliquotaCOFINS;
    property TaxaEntrega: Boolean read GetTaxaEntrega write SetTaxaEntrega;
    property ParticipouPromocaoDesconto: Boolean read GetParticipouPromocaoDesconto write SetParticipouPromocaoDesconto;
    property TipoBonificacao: TString read GetTipoBonificacao write SetTipoBonificacao;
    property Tipo: TString read GetTipo write SetTipo;
    property SerieProduto: TString read GetSerieProduto write SetSerieProduto;
    property Tributacao: TString read GetTributacao write SetTributacao;
    property TributacaoSimbologia: TString read GetTributacaoSimbologia write SetTributacaoSimbologia;
    property TipoPreco: TString read GetTipoPreco write SetTipoPreco;
    property TipoDeDescontoAplicado: TString read GetTipoDeDescontoAplicado write SetTipoDeDescontoAplicado;
    property Csosn: TString read GetCsosn write SetCsosn;
    property CstPIS: TString read GetCstPIS write SetCstPIS;
    property CstCOFINS: TString read GetCstCOFINS write SetCstCOFINS;
    property Natureza: TString read GetNatureza write SetNatureza;
    property Ncm: TString read GetNcm write SetNcm;
    property NcmExcecao: TString read GetNcmExcecao write SetNcmExcecao;
    property TabelaA: TString read GetTabelaA write SetTabelaA;
    property TabelaB: TString read GetTabelaB write SetTabelaB;
    property Cfop: TString read GetCfop write SetCfop;
  end;

  TItemVendaList = class;

  IItemVendaList = interface
	['{0BB40F33-5716-45E0-84E0-ED4F99ED6352}']
    function GetReference: TItemVendaList;
    function GetItems(AIndex: Integer): IItemVenda;
    procedure SetItems(AIndex: Integer; const Value: IItemVenda);
    procedure Add(const AItemVenda: IItemVenda);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IItemVenda read GetItems write SetItems; default;
  end;

  TItemVendaListEnumerator = class
  private
    FIndex: Integer;
    FItemVendaList: TItemVendaList;
  public
    constructor Create(AItemVendaList: TItemVendaList);
    function GetCurrent: IItemVenda; inline;
    function MoveNext: Boolean;
    property Current: IItemVenda read GetCurrent;
  end;

  TItemVendaList = class(TInterfacedObject, IItemVendaList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IItemVenda;
    procedure SetItems(AIndex: Integer; const Value: IItemVenda);
  public
    constructor Create;
    procedure Add(const AItemVenda: IItemVenda);
    destructor Destroy; override;
    function GetEnumerator: TItemVendaListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TItemVendaList;
    property Items[AIndex: Integer]: IItemVenda read GetItems write SetItems; default;
  end;

  TItemVendaListRec = record
  private
    FList: IItemVendaList;
  public
    class function Create(const AList: IItemVendaList): TItemVendaListRec; static;
    class operator Implicit(AListRec: TItemVendaListRec): TItemVendaList;
  end;

  TItemVenda = class(TInterfacedModel, IItemVenda)
  private
	FId: Integer;
	FProdutoId: Int64;
	FFuncionarioVendedorId: Integer;
	FFuncionarioAutorizadorId: Integer;
	FFuncionarioCaptacaoPrevendaId: TString;
	FFuncionarioProducaoId: TString;
	FQuantidadeVenda: Double;
	FValorUnidade: Double;
	FValorAcrescimo: Double;
	FValorDesconto: Double;
	FValorTotal: Double;
	FPrecoVenda: Double;
	FValorServico: Double;
	FFatorBonificacao: Double;
	FPrecoCusto: Double;
	FPrecoCustoMedio: Double;
	FPrecoCustoFiscal: Double;
	FTributacaoAliquota: Double;
	FTributacaoValorReducao: Double;
	FValorDoDescontoMegaCaixa: Double;
	FAliquotaPIS: Double;
	FAliquotaCOFINS: Double;
	FTaxaEntrega: Boolean;
	FParticipouPromocaoDesconto: Boolean;
	FTipoBonificacao: TString;
	FTipo: TString;
	FSerieProduto: TString;
	FTributacao: TString;
	FTributacaoSimbologia: TString;
	FTipoPreco: TString;
	FTipoDeDescontoAplicado: TString;
	FCsosn: TString;
	FCstPIS: TString;
	FCstCOFINS: TString;
	FNatureza: TString;
	FNcm: TString;
	FNcmExcecao: TString;
	FTabelaA: TString;
	FTabelaB: TString;
	FCfop: TString;
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetProdutoId: Int64;
    procedure SetProdutoId(const AProdutoId: Int64);
    function GetFuncionarioVendedorId: Integer;
    procedure SetFuncionarioVendedorId(const AFuncionarioVendedorId: Integer);
    function GetFuncionarioAutorizadorId: Integer;
    procedure SetFuncionarioAutorizadorId(const AFuncionarioAutorizadorId: Integer);
    function GetFuncionarioCaptacaoPrevendaId: TString;
    procedure SetFuncionarioCaptacaoPrevendaId(const AFuncionarioCaptacaoPrevendaId: TString);
    function GetFuncionarioProducaoId: TString;
    procedure SetFuncionarioProducaoId(const AFuncionarioProducaoId: TString);
    function GetQuantidadeVenda: Double;
    procedure SetQuantidadeVenda(const AQuantidadeVenda: Double);
    function GetValorUnidade: Double;
    procedure SetValorUnidade(const AValorUnidade: Double);
    function GetValorAcrescimo: Double;
    procedure SetValorAcrescimo(const AValorAcrescimo: Double);
    function GetValorDesconto: Double;
    procedure SetValorDesconto(const AValorDesconto: Double);
    function GetValorTotal: Double;
    procedure SetValorTotal(const AValorTotal: Double);
    function GetPrecoVenda: Double;
    procedure SetPrecoVenda(const APrecoVenda: Double);
    function GetValorServico: Double;
    procedure SetValorServico(const AValorServico: Double);
    function GetFatorBonificacao: Double;
    procedure SetFatorBonificacao(const AFatorBonificacao: Double);
    function GetPrecoCusto: Double;
    procedure SetPrecoCusto(const APrecoCusto: Double);
    function GetPrecoCustoMedio: Double;
    procedure SetPrecoCustoMedio(const APrecoCustoMedio: Double);
    function GetPrecoCustoFiscal: Double;
    procedure SetPrecoCustoFiscal(const APrecoCustoFiscal: Double);
    function GetTributacaoAliquota: Double;
    procedure SetTributacaoAliquota(const ATributacaoAliquota: Double);
    function GetTributacaoValorReducao: Double;
    procedure SetTributacaoValorReducao(const ATributacaoValorReducao: Double);
    function GetValorDoDescontoMegaCaixa: Double;
    procedure SetValorDoDescontoMegaCaixa(const AValorDoDescontoMegaCaixa: Double);
    function GetAliquotaPIS: Double;
    procedure SetAliquotaPIS(const AAliquotaPIS: Double);
    function GetAliquotaCOFINS: Double;
    procedure SetAliquotaCOFINS(const AAliquotaCOFINS: Double);
    function GetTaxaEntrega: Boolean;
    procedure SetTaxaEntrega(const ATaxaEntrega: Boolean);
    function GetParticipouPromocaoDesconto: Boolean;
    procedure SetParticipouPromocaoDesconto(const AParticipouPromocaoDesconto: Boolean);
    function GetTipoBonificacao: TString;
    procedure SetTipoBonificacao(const ATipoBonificacao: TString);
    function GetTipo: TString;
    procedure SetTipo(const ATipo: TString);
    function GetSerieProduto: TString;
    procedure SetSerieProduto(const ASerieProduto: TString);
    function GetTributacao: TString;
    procedure SetTributacao(const ATributacao: TString);
    function GetTributacaoSimbologia: TString;
    procedure SetTributacaoSimbologia(const ATributacaoSimbologia: TString);
    function GetTipoPreco: TString;
    procedure SetTipoPreco(const ATipoPreco: TString);
    function GetTipoDeDescontoAplicado: TString;
    procedure SetTipoDeDescontoAplicado(const ATipoDeDescontoAplicado: TString);
    function GetCsosn: TString;
    procedure SetCsosn(const ACsosn: TString);
    function GetCstPIS: TString;
    procedure SetCstPIS(const ACstPIS: TString);
    function GetCstCOFINS: TString;
    procedure SetCstCOFINS(const ACstCOFINS: TString);
    function GetNatureza: TString;
    procedure SetNatureza(const ANatureza: TString);
    function GetNcm: TString;
    procedure SetNcm(const ANcm: TString);
    function GetNcmExcecao: TString;
    procedure SetNcmExcecao(const ANcmExcecao: TString);
    function GetTabelaA: TString;
    procedure SetTabelaA(const ATabelaA: TString);
    function GetTabelaB: TString;
    procedure SetTabelaB(const ATabelaB: TString);
    function GetCfop: TString;
    procedure SetCfop(const ACfop: TString);
  published
    property Id: Integer read GetId write SetId;
    property ProdutoId: Int64 read GetProdutoId write SetProdutoId;
    property FuncionarioVendedorId: Integer read GetFuncionarioVendedorId write SetFuncionarioVendedorId;
    property FuncionarioAutorizadorId: Integer read GetFuncionarioAutorizadorId write SetFuncionarioAutorizadorId;
    property FuncionarioCaptacaoPrevendaId: TString read GetFuncionarioCaptacaoPrevendaId write SetFuncionarioCaptacaoPrevendaId;
    property FuncionarioProducaoId: TString read GetFuncionarioProducaoId write SetFuncionarioProducaoId;
    property QuantidadeVenda: Double read GetQuantidadeVenda write SetQuantidadeVenda;
    property ValorUnidade: Double read GetValorUnidade write SetValorUnidade;
    property ValorAcrescimo: Double read GetValorAcrescimo write SetValorAcrescimo;
    property ValorDesconto: Double read GetValorDesconto write SetValorDesconto;
    property ValorTotal: Double read GetValorTotal write SetValorTotal;
    property PrecoVenda: Double read GetPrecoVenda write SetPrecoVenda;
    property ValorServico: Double read GetValorServico write SetValorServico;
    property FatorBonificacao: Double read GetFatorBonificacao write SetFatorBonificacao;
    property PrecoCusto: Double read GetPrecoCusto write SetPrecoCusto;
    property PrecoCustoMedio: Double read GetPrecoCustoMedio write SetPrecoCustoMedio;
    property PrecoCustoFiscal: Double read GetPrecoCustoFiscal write SetPrecoCustoFiscal;
    property TributacaoAliquota: Double read GetTributacaoAliquota write SetTributacaoAliquota;
    property TributacaoValorReducao: Double read GetTributacaoValorReducao write SetTributacaoValorReducao;
    property ValorDoDescontoMegaCaixa: Double read GetValorDoDescontoMegaCaixa write SetValorDoDescontoMegaCaixa;
    property AliquotaPIS: Double read GetAliquotaPIS write SetAliquotaPIS;
    property AliquotaCOFINS: Double read GetAliquotaCOFINS write SetAliquotaCOFINS;
    property TaxaEntrega: Boolean read GetTaxaEntrega write SetTaxaEntrega;
    property ParticipouPromocaoDesconto: Boolean read GetParticipouPromocaoDesconto write SetParticipouPromocaoDesconto;
    property TipoBonificacao: TString read GetTipoBonificacao write SetTipoBonificacao;
    property Tipo: TString read GetTipo write SetTipo;
    property SerieProduto: TString read GetSerieProduto write SetSerieProduto;
    property Tributacao: TString read GetTributacao write SetTributacao;
    property TributacaoSimbologia: TString read GetTributacaoSimbologia write SetTributacaoSimbologia;
    property TipoPreco: TString read GetTipoPreco write SetTipoPreco;
    property TipoDeDescontoAplicado: TString read GetTipoDeDescontoAplicado write SetTipoDeDescontoAplicado;
    property Csosn: TString read GetCsosn write SetCsosn;
    property CstPIS: TString read GetCstPIS write SetCstPIS;
    property CstCOFINS: TString read GetCstCOFINS write SetCstCOFINS;
    property Natureza: TString read GetNatureza write SetNatureza;
    property Ncm: TString read GetNcm write SetNcm;
    property NcmExcecao: TString read GetNcmExcecao write SetNcmExcecao;
    property TabelaA: TString read GetTabelaA write SetTabelaA;
    property TabelaB: TString read GetTabelaB write SetTabelaB;
    property Cfop: TString read GetCfop write SetCfop;
  end;

implementation

{ TItemVendaList }

procedure TItemVendaList.Add(const AItemVenda: IItemVenda);
begin
  FList.Add(AItemVenda);
end;

procedure TItemVendaList.Clear;
begin
  FList.Clear;
end;

function TItemVendaList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TItemVendaList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TItemVendaList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TItemVendaList.GetEnumerator: TItemVendaListEnumerator;
begin
  Result := TItemVendaListEnumerator.Create(Self);
end;

function TItemVendaList.GetItems(AIndex: Integer): IItemVenda;
begin
  Result := FList[AIndex] as IItemVenda;
end;

function TItemVendaList.GetReference: TItemVendaList;
begin
  Result := Self;
end;

procedure TItemVendaList.SetItems(AIndex: Integer; const Value: IItemVenda);
begin
  FList[AIndex] := Value;
end;

{ TItemVendaListEnumerator }

constructor TItemVendaListEnumerator.Create(AItemVendaList: TItemVendaList);
begin
  inherited Create;
  FIndex := -1;
  FItemVendaList := AItemVendaList;
end;

function TItemVendaListEnumerator.GetCurrent: IItemVenda;
begin
  Result := FItemVendaList[FIndex];
end;

function TItemVendaListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FItemVendaList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TItemVendaListRec }

class function TItemVendaListRec.Create(const AList: IItemVendaList): TItemVendaListRec;
begin
  FillChar(Result, SizeOf(TItemVendaListRec), 0);
  Result.FList := AList;
end;

class operator TItemVendaListRec.Implicit(AListRec: TItemVendaListRec): TItemVendaList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TItemVenda }

function TItemVenda.GetId: Integer;
begin
  Result := FId;
end;

procedure TItemVenda.SetId(const AId: Integer);
begin
  FId := AId;
end;

function TItemVenda.GetProdutoId: Int64;
begin
  Result := FProdutoId;
end;

procedure TItemVenda.SetProdutoId(const AProdutoId: Int64);
begin
  FProdutoId := AProdutoId;
end;

function TItemVenda.GetFuncionarioVendedorId: Integer;
begin
  Result := FFuncionarioVendedorId;
end;

procedure TItemVenda.SetFuncionarioVendedorId(const AFuncionarioVendedorId: Integer);
begin
  FFuncionarioVendedorId := AFuncionarioVendedorId;
end;

function TItemVenda.GetFuncionarioAutorizadorId: Integer;
begin
  Result := FFuncionarioAutorizadorId;
end;

procedure TItemVenda.SetFuncionarioAutorizadorId(const AFuncionarioAutorizadorId: Integer);
begin
  FFuncionarioAutorizadorId := AFuncionarioAutorizadorId;
end;

function TItemVenda.GetFuncionarioCaptacaoPrevendaId: TString;
begin
  Result := FFuncionarioCaptacaoPrevendaId;
end;

procedure TItemVenda.SetFuncionarioCaptacaoPrevendaId(const AFuncionarioCaptacaoPrevendaId: TString);
begin
  FFuncionarioCaptacaoPrevendaId := AFuncionarioCaptacaoPrevendaId;
end;

function TItemVenda.GetFuncionarioProducaoId: TString;
begin
  Result := FFuncionarioProducaoId;
end;

procedure TItemVenda.SetFuncionarioProducaoId(const AFuncionarioProducaoId: TString);
begin
  FFuncionarioProducaoId := AFuncionarioProducaoId;
end;

function TItemVenda.GetQuantidadeVenda: Double;
begin
  Result := FQuantidadeVenda;
end;

procedure TItemVenda.SetQuantidadeVenda(const AQuantidadeVenda: Double);
begin
  FQuantidadeVenda := AQuantidadeVenda;
end;

function TItemVenda.GetValorUnidade: Double;
begin
  Result := FValorUnidade;
end;

procedure TItemVenda.SetValorUnidade(const AValorUnidade: Double);
begin
  FValorUnidade := AValorUnidade;
end;

function TItemVenda.GetValorAcrescimo: Double;
begin
  Result := FValorAcrescimo;
end;

procedure TItemVenda.SetValorAcrescimo(const AValorAcrescimo: Double);
begin
  FValorAcrescimo := AValorAcrescimo;
end;

function TItemVenda.GetValorDesconto: Double;
begin
  Result := FValorDesconto;
end;

procedure TItemVenda.SetValorDesconto(const AValorDesconto: Double);
begin
  FValorDesconto := AValorDesconto;
end;

function TItemVenda.GetValorTotal: Double;
begin
  Result := FValorTotal;
end;

procedure TItemVenda.SetValorTotal(const AValorTotal: Double);
begin
  FValorTotal := AValorTotal;
end;

function TItemVenda.GetPrecoVenda: Double;
begin
  Result := FPrecoVenda;
end;

procedure TItemVenda.SetPrecoVenda(const APrecoVenda: Double);
begin
  FPrecoVenda := APrecoVenda;
end;

function TItemVenda.GetValorServico: Double;
begin
  Result := FValorServico;
end;

procedure TItemVenda.SetValorServico(const AValorServico: Double);
begin
  FValorServico := AValorServico;
end;

function TItemVenda.GetFatorBonificacao: Double;
begin
  Result := FFatorBonificacao;
end;

procedure TItemVenda.SetFatorBonificacao(const AFatorBonificacao: Double);
begin
  FFatorBonificacao := AFatorBonificacao;
end;

function TItemVenda.GetPrecoCusto: Double;
begin
  Result := FPrecoCusto;
end;

procedure TItemVenda.SetPrecoCusto(const APrecoCusto: Double);
begin
  FPrecoCusto := APrecoCusto;
end;

function TItemVenda.GetPrecoCustoMedio: Double;
begin
  Result := FPrecoCustoMedio;
end;

procedure TItemVenda.SetPrecoCustoMedio(const APrecoCustoMedio: Double);
begin
  FPrecoCustoMedio := APrecoCustoMedio;
end;

function TItemVenda.GetPrecoCustoFiscal: Double;
begin
  Result := FPrecoCustoFiscal;
end;

procedure TItemVenda.SetPrecoCustoFiscal(const APrecoCustoFiscal: Double);
begin
  FPrecoCustoFiscal := APrecoCustoFiscal;
end;

function TItemVenda.GetTributacaoAliquota: Double;
begin
  Result := FTributacaoAliquota;
end;

procedure TItemVenda.SetTributacaoAliquota(const ATributacaoAliquota: Double);
begin
  FTributacaoAliquota := ATributacaoAliquota;
end;

function TItemVenda.GetTributacaoValorReducao: Double;
begin
  Result := FTributacaoValorReducao;
end;

procedure TItemVenda.SetTributacaoValorReducao(const ATributacaoValorReducao: Double);
begin
  FTributacaoValorReducao := ATributacaoValorReducao;
end;

function TItemVenda.GetValorDoDescontoMegaCaixa: Double;
begin
  Result := FValorDoDescontoMegaCaixa;
end;

procedure TItemVenda.SetValorDoDescontoMegaCaixa(const AValorDoDescontoMegaCaixa: Double);
begin
  FValorDoDescontoMegaCaixa := AValorDoDescontoMegaCaixa;
end;

function TItemVenda.GetAliquotaPIS: Double;
begin
  Result := FAliquotaPIS;
end;

procedure TItemVenda.SetAliquotaPIS(const AAliquotaPIS: Double);
begin
  FAliquotaPIS := AAliquotaPIS;
end;

function TItemVenda.GetAliquotaCOFINS: Double;
begin
  Result := FAliquotaCOFINS;
end;

procedure TItemVenda.SetAliquotaCOFINS(const AAliquotaCOFINS: Double);
begin
  FAliquotaCOFINS := AAliquotaCOFINS;
end;

function TItemVenda.GetTaxaEntrega: Boolean;
begin
  Result := FTaxaEntrega;
end;

procedure TItemVenda.SetTaxaEntrega(const ATaxaEntrega: Boolean);
begin
  FTaxaEntrega := ATaxaEntrega;
end;

function TItemVenda.GetParticipouPromocaoDesconto: Boolean;
begin
  Result := FParticipouPromocaoDesconto;
end;

procedure TItemVenda.SetParticipouPromocaoDesconto(const AParticipouPromocaoDesconto: Boolean);
begin
  FParticipouPromocaoDesconto := AParticipouPromocaoDesconto;
end;

function TItemVenda.GetTipoBonificacao: TString;
begin
  Result := FTipoBonificacao;
end;

procedure TItemVenda.SetTipoBonificacao(const ATipoBonificacao: TString);
begin
  FTipoBonificacao := ATipoBonificacao;
end;

function TItemVenda.GetTipo: TString;
begin
  Result := FTipo;
end;

procedure TItemVenda.SetTipo(const ATipo: TString);
begin
  FTipo := ATipo;
end;

function TItemVenda.GetSerieProduto: TString;
begin
  Result := FSerieProduto;
end;

procedure TItemVenda.SetSerieProduto(const ASerieProduto: TString);
begin
  FSerieProduto := ASerieProduto;
end;

function TItemVenda.GetTributacao: TString;
begin
  Result := FTributacao;
end;

procedure TItemVenda.SetTributacao(const ATributacao: TString);
begin
  FTributacao := ATributacao;
end;

function TItemVenda.GetTributacaoSimbologia: TString;
begin
  Result := FTributacaoSimbologia;
end;

procedure TItemVenda.SetTributacaoSimbologia(const ATributacaoSimbologia: TString);
begin
  FTributacaoSimbologia := ATributacaoSimbologia;
end;

function TItemVenda.GetTipoPreco: TString;
begin
  Result := FTipoPreco;
end;

procedure TItemVenda.SetTipoPreco(const ATipoPreco: TString);
begin
  FTipoPreco := ATipoPreco;
end;

function TItemVenda.GetTipoDeDescontoAplicado: TString;
begin
  Result := FTipoDeDescontoAplicado;
end;

procedure TItemVenda.SetTipoDeDescontoAplicado(const ATipoDeDescontoAplicado: TString);
begin
  FTipoDeDescontoAplicado := ATipoDeDescontoAplicado;
end;

function TItemVenda.GetCsosn: TString;
begin
  Result := FCsosn;
end;

procedure TItemVenda.SetCsosn(const ACsosn: TString);
begin
  FCsosn := ACsosn;
end;

function TItemVenda.GetCstPIS: TString;
begin
  Result := FCstPIS;
end;

procedure TItemVenda.SetCstPIS(const ACstPIS: TString);
begin
  FCstPIS := ACstPIS;
end;

function TItemVenda.GetCstCOFINS: TString;
begin
  Result := FCstCOFINS;
end;

procedure TItemVenda.SetCstCOFINS(const ACstCOFINS: TString);
begin
  FCstCOFINS := ACstCOFINS;
end;

function TItemVenda.GetNatureza: TString;
begin
  Result := FNatureza;
end;

procedure TItemVenda.SetNatureza(const ANatureza: TString);
begin
  FNatureza := ANatureza;
end;

function TItemVenda.GetNcm: TString;
begin
  Result := FNcm;
end;

procedure TItemVenda.SetNcm(const ANcm: TString);
begin
  FNcm := ANcm;
end;

function TItemVenda.GetNcmExcecao: TString;
begin
  Result := FNcmExcecao;
end;

procedure TItemVenda.SetNcmExcecao(const ANcmExcecao: TString);
begin
  FNcmExcecao := ANcmExcecao;
end;

function TItemVenda.GetTabelaA: TString;
begin
  Result := FTabelaA;
end;

procedure TItemVenda.SetTabelaA(const ATabelaA: TString);
begin
  FTabelaA := ATabelaA;
end;

function TItemVenda.GetTabelaB: TString;
begin
  Result := FTabelaB;
end;

procedure TItemVenda.SetTabelaB(const ATabelaB: TString);
begin
  FTabelaB := ATabelaB;
end;

function TItemVenda.GetCfop: TString;
begin
  Result := FCfop;
end;

procedure TItemVenda.SetCfop(const ACfop: TString);
begin
  FCfop := ACfop;
end;


end.
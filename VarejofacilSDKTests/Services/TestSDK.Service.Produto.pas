unit TestSDK.Service.Produto;

interface

uses
  TestFramework, SysUtils, SDK.Service, SDK.XML, SDK.Service.Produto,
  SDK.Model.Produto, XMLIntf, SDK.Types, SDK.TestCase, SDK.Model.ImpostoFederal, SDK.Enums, SDK.Service.ImpostoFederal,
  SDK.Service.Genero, SDK.Service.Secao, SDK.Model.ItemImpostoFederal, SDK.Model.Genero, SDK.Model.Secao,
  SDK.Model.NCM, SDK.Service.NCM, SDK.Model.UnidadeProduto, SDK.Service.UnidadeProduto, SDK.Service.MarcaProduto,
  SDK.Model.MarcaDoProduto, SDK.Model.Loja, SDK.Service.Loja;

type

  TTestProdutoService = class(TSDKTestCase)
  strict private
    FProdutoService: TProdutoService;
    FImpostosFederaisService: TImpostoFederalService;
    FGeneroService: TGeneroService;
    FSecaoService: TSecaoService;
    FNCMService: TNCMService;
    FUnidadeService: TUnidadeProdutoService;
    FMarcaProdutoService: TMarcaProdutoService;
    FLojaService: TLojaService;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestBasicOperations;
  end;

implementation

uses
  SDK.Model.RegimeEstadualProduto;

procedure TTestProdutoService.SetUp;
begin
  FProdutoService := TProdutoService.Create(GetClient);
  FImpostosFederaisService := TImpostoFederalService.Create(GetClient);
  FGeneroService := TGeneroService.Create(GetClient);
  FSecaoService := TSecaoService.Create(GetClient);
  FNCMService := TNCMService.Create(GetClient);
  FUnidadeService := TUnidadeProdutoService.Create(GetClient);
  FMarcaProdutoService := TMarcaProdutoService.Create(GetClient);
  FLojaService := TLojaService.Create(GetClient);
end;

procedure TTestProdutoService.TearDown;
begin
  FreeAndNil(FProdutoService);
  FreeAndNil(FImpostosFederaisService);
  FreeAndNil(FGeneroService);
  FreeAndNil(FSecaoService);
  FreeAndNil(FNCMService);
  FreeAndNil(FUnidadeService);
  FreeAndNil(FMarcaProdutoService);
  FreeAndNil(FLojaService);
end;

procedure TTestProdutoService.TestBasicOperations;
var
  ProdutoList: TProdutoList;
  Produto, ProdutoInserted, ProdutoUpdated: IProduto;
  RegimesDoProduto: TRegimeEstadualProdutoList;
  ItensImpostosFederais: TItemImpostoFederalList;
  ItemImpostoFederal: IItemImpostoFederal;
  Unidades: TUnidadeProdutoList;
  Generos: TGeneroList;
  Genero: IGenero;
  Secao: ISecao;
  NCMs: TNCMList;
  NCM: INCM;
  Marca: IMarcaDoProduto;
  PIS, COFINS: IImpostoFederal;
  RegimeProduto: IRegimeEstadualProduto;
  Lojas: ILojaList;
  Id: Variant;
  Result: TServiceCommandResult;
begin
  ProdutoList := FProdutoService.GetAll();

  Produto := TProduto.Create;

  //Preenchendo campos com valores aleatórios
  FillWithRandomValues(Produto);

  Produto.Id := 9999;

  //Buscando gênero
  Generos := FGeneroService.GetAll(0, 1, ['+id']);
  Genero := Generos[0];
  Genero.Descricao := 'ZÉ SERVIÇIN';
  FGeneroService.Update(IntToStr(Genero.Id), Genero);
  Produto.GeneroId := Genero.Id;

  //Criando seção
  FSecaoService.Delete('999');
  Secao := TSecao.Create;
  Secao.Id := 999;
  Secao.Descricao := 'SECAO TESTE';
  FSecaoService.Insert(Secao);
  Produto.SecaoId := Secao.Id;

  //Buscando NCM
  NCMs := FNCMService.GetAll(0, 1);
  NCM := NCMs[0];
  Produto.NomeclaturaMercosulId := IntToStr(NCM.Id);

  //Buscando unidades
  Unidades := FUnidadeService.GetAll(0, 2);
  Produto.UnidadeDeVenda := Unidades[0].Id;
  Produto.UnidadeDeCompra := Unidades[1].Id;
  Produto.UnidadeDeReferencia := EmptyStr;
  Produto.UnidadeDeTransferencia := EmptyStr;

  //Buscando marcas
  FMarcaProdutoService.Delete('99');
  Marca := TMarcaDoProduto.Create;
  Marca.Id := 99;
  Marca.Descricao := 'MARCA TESTE';
  FMarcaProdutoService.Insert(Marca);
  Produto.MarcaId := Marca.Id;

  //Criando impostos federais
  FImpostosFederaisService.Delete('91');
  PIS := TImpostoFederal.Create;
  PIS.Id := '91';
  PIS.Descricao := 'Teste';
  PIS.Retencao := 100;
  PIS.Observacao := 'Obs';
  PIS.TipoIncidencia := tiSAIDA;
  PIS.TipoImposto := tiPIS;
  PIS.CstEntrada := 99;
  PIS.CstSaida := 7;
  PIS.AliquotaEntrada := 99.99;
  PIS.AliquotaSaida := 88.88;
  PIS.CstEntradaPresumido := 99;

  FImpostosFederaisService.Delete('92');
  COFINS := TImpostoFederal.Create;
  COFINS.Id := '92';
  COFINS.Descricao := 'Teste';
  COFINS.Retencao := 100;
  COFINS.Observacao := 'Obs';
  COFINS.TipoIncidencia := tiSAIDA;
  COFINS.TipoImposto := tiCOFINS;
  COFINS.CstEntrada := 99;
  COFINS.CstSaida := 7;
  COFINS.AliquotaEntrada := 99.99;
  COFINS.AliquotaSaida := 88.88;
  COFINS.CstEntradaPresumido := 99;

  FImpostosFederaisService.Insert(PIS);
  FImpostosFederaisService.Insert(COFINS);

  ItensImpostosFederais := TItemImpostoFederalList.Create;
  ItemImpostoFederal := TItemImpostoFederal.Create;
  ItemImpostoFederal.Id := PIS.Id;
  ItensImpostosFederais.Add(ItemImpostoFederal);
  ItemImpostoFederal := TItemImpostoFederal.Create;
  ItemImpostoFederal.Id := COFINS.Id;
  ItensImpostosFederais.Add(ItemImpostoFederal);

  Produto.ItensImpostosFederais := ItensImpostosFederais;

  //Buscando regimes estaduais
  Lojas := FLojaService.GetAll(0, 1);
  RegimeProduto := TRegimeEstadualProduto.Create;
  RegimeProduto.RegimeEstadualId := 1;
  RegimeProduto.LojaId := Lojas[0].Id;

  RegimesDoProduto := TRegimeEstadualProdutoList.Create;
  RegimesDoProduto.Add(RegimeProduto);

  Produto.RegimesDoProduto := RegimesDoProduto;

  //Selecionando natureza da receita
  //Produto.NaturezaId := '1';
  Produto.NaturezaDeImpostoFederalId := 1;

  //Selecionando situação fiscal
  Produto.SituacaoFiscalId := 1;
  Produto.SituacaoFiscalSaidaId := 1;

  Produto.TextoDaReceita := EmptyStr;
  Produto.IncentivoZonaFranca := EmptyStr;
  Produto.ForaDeLinha := 'N';

  //Inserindo o produto
  Result := FProdutoService.Insert(Produto);

  //Insert
  Assert(Result.Successful, 'Erro no insert do Produto');

  //Get
  ProdutoInserted := FProdutoService.Get(Produto.Id);
  Assert(Assigned(ProdutoInserted), 'Erro no get do Produto');
  AssertAllPropertiesAreEqual(Produto, ProdutoInserted, 'Produto não inserido corretamente.', ['TributacaoId']);

  ProdutoInserted.Descricao := 'ALTEREI O PRODUTO';

  //Update
  Assert(FProdutoService.Update(ProdutoInserted.Id, ProdutoInserted).Successful, 'Erro no update do Produto.');
  ProdutoUpdated := FProdutoService.Get(Id);
  AssertAllPropertiesAreEqual(ProdutoInserted, ProdutoUpdated, 'Produto não alterado corretamente.');
end;

initialization
  RegisterTest(TTestProdutoService.Suite);

end.


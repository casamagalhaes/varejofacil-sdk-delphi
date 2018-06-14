# Varejofacil Delphi SDK

![Varejofacil](https://www.casamagalhaes.com.br/images/varejofacil_logo_segmento_240x130.png)

Os componentes da SDK permitem a comunicação com a API do varejofacil.

### Projetos

  - **VarejofacilSDK**: Modelos e serviços do varejofacil
  - **VarejofacilSDKCodeGenerator**: Gerador de modelos e serviços
  - **VarejofacilSDKTests**: Testes unitários e de integração

### Instalação
Compile os fontes do SDK para gerar as dcus em apenas um diretório ou adicione os seguintes diretórios diretamente na library path
```
...\VarejofacilSDK\
...\VarejofacilSDK\Models
...\VarejofacilSDK\Services
```

### Conceitos básicos

- Os modelos seguem a nomenclatura SDK.Model.* (Por ex.: SDK.Model.Fornecedor)
- Os serviços seguem a nomenclatura SDK.Service.* (Por ex.: SDK.Service.Fornecedor)
- Para um serviço ser utilizado, é necessário instanciar um TClient, que recebe o endereço do servidor, usuário e senha
- Métodos de insert e update retornam uma classe de resultado que contém erros de validação na propriedade FailReasons caso ocorram, essa classe se chama TServiceCommandResult
- Serviços podem levantar exceções caso hajam entidades sendo inseridas ou deletadas em conflito
- Filtragem deve ser feita através da linguagem [Fiql](http://fiql-parser.readthedocs.io/en/stable/usage.html) 

### Utilização

Buscando todos os modelos
```delphi
var
 Fornecedor: IFornecedor;
 Fornecedores: TFornecedorList;
 FornecedorService: TFornecedorService;
 Client: IClient;

begin
   Client := TClient.Create('https://suaempresa.varejofacil.com', 'administrador', '123');
   FornecedorService := TFornecedorService.Create(Client);
   try
     Fornecedores := FornecedorService.GetAll;
     for Fornecedor in Fornecedores do
     begin
       //TODO: Fazer alguma coisa com fornecedor
     end;
   finally
     FornecedorService.Free;
   end;
end.

```
Filtrando a query utilizando [Fiql](http://fiql-parser.readthedocs.io/en/stable/usage.html) com paginação e ordenação
```delphi
var
 Fornecedor: IFornecedor;
 Fornecedores: TFornecedorList;
 FornecedorService: TFornecedorService;
 Client: IClient;

begin
   Client := TClient.Create('https://suaempresa.varejofacil.com', 'administrador', '123');
   FornecedorService := TFornecedorService.Create(Client);
   try
     Fornecedores := FornecedorService.Filter('id=in=(002,003)', 5, 10, ['+id']);
     for Fornecedor in Fornecedores do
     begin
       //TODO: Fazer algo com o fornecedor
     end;
   finally
     FornecedorService.Free;
   end;
end.

```
Alterando um modelo
```delphi
var
 Fornecedor: IFornecedor;
 FornecedorService: TFornecedorService;
 Client: IClient;

begin
   Client := TClient.Create('https://suaempresa.varejofacil.com', 'administrador', '123');
   FornecedorService := TFornecedorService.Create(Client);
   try
     Fornecedor := FornecedorService.Get('0001');
     Fornecedor.Descricao := 'Descricao Alterada';
     FornecedorService.Update(Fornecedor.Id, Fornecedor);
   finally
     FornecedorService.Free;
   end;
end.

```
Inserindo um modelo
```delphi
var
 Fornecedor: IFornecedor;
 FornecedorService: TFornecedorService;
 Client: IClient;

begin
   Client := TClient.Create('https://suaempresa.varejofacil.com', 'administrador', '123');
   FornecedorService := TFornecedorService.Create(Client);
   try
     Fornecedor := TFornecedor.Create;
     Fornecedor.Descricao := 'Elgin';
     FornecedorService.Insert(Fornecedor);
   finally
     FornecedorService.Free;
   end;
end.
```
Deletando um modelo
```delphi
var
 FornecedorService: TFornecedorService;
 Client: IClient;

begin
   Client := TClient.Create('https://suaempresa.varejofacil.com', 'administrador', '123');
   FornecedorService := TFornecedorService.Create(Client);
   try
     FornecedorService.Delete('0001');
   finally
     FornecedorService.Free;
   end;
end.

```

**Observação**: https://suaempresa.varejofacil.com é um endereço fictício que representa a url para a instância do seu varejofacil.


#### Exemplo de uso

Utilizando a SDK para inserir um novo produto

```delphi
var
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
  Produto := TProduto.Create;

  //Preenchendo campos com valores aleatórios
  FillWithRandomValues(Produto);

  Produto.Id := 9999;

  //Buscando gênero
  Generos := FGeneroService.GetAll(0, 1);
  Genero := Generos[0];
  Produto.GeneroId := Genero.Id;

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

  //Criando seção
  FSecaoService.Delete('999');
  Secao := TSecao.Create;
  Secao.Id := 999;
  Secao.Descricao := 'SECAO TESTE';
  FSecaoService.Insert(Secao);
  Produto.SecaoId := Secao.Id;

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

  //Get
  ProdutoInserted := FProdutoService.Get(Produto.Id);

  ProdutoInserted.Descricao := 'ALTEREI O PRODUTO';

  //Update
  FProdutoService.Update(ProdutoInserted.Id, ProdutoInserted);  
```

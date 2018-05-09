program VarejofacilSDKCliDXE7;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  SDK.Types,
  SDK.Enums,
  SDK.Client,
  SDK.SortParams,
  SDK.XML,
  SDK.Model.NCM,
  SDK.Service.NCM,
  SDK.Service,
  SDK.Model.Secao,
  SDK.Model.Produto,
  SDK.Model.Preco,
  SDK.Service.Secao,
  SDK.Service.Produto,
  SDK.Service.Preco,
  SDK.Model.ItemImpostoFederal,
  SDK.Model.EstoqueDoProduto,
  ActiveX,
  Variants;

var
  Client: IClient;
  ProdutoService: TProdutoService;
  Produtos: TProdutoList;
  Produto, ProdutoInserido: IProduto;
  Res: TServiceCommandResult;
  Impostos: TItemImpostoFederalList;
  ItemImpostoFederal: TItemImpostoFederal;
  Precos: TPrecoList;
  PrecoService: TPrecoService;
  Preco: IPreco;
  Estoques: TEstoqueDoProdutoList;
  EstoqueItem: TEstoqueDoProduto;

begin
  CoInitialize(nil);
  TRY
    ReportMemoryLeaksOnShutdown := False;
    try
//      Client := TClient.Create('http://172.16.13.82:8080', 'admin', 'admin');
      Client := TClient.Create('https://cadastrafacil.varejofacil.com', 'admin', 'admin');
      ProdutoService := TProdutoService.Create(Client);

      Produtos := ProdutoService.Filter('descricao==*CULAS*');

      Produto := ProdutoService.Get('429');

      Estoques := TEstoqueDoProdutoList.Create;
      EstoqueItem := TEstoqueDoProduto.Create;
      EstoqueItem.LojaId := 1;
      EstoqueItem.EstoqueMinimo := 10;
      EstoqueItem.EstoqueMaximo := 300;
      Estoques.Add(EstoqueItem);
      Produto.EstoquesDoProduto := Estoques;
      Res := ProdutoService.Update(Produto.Id, Produto);
      WriteLn(Res.Successful);
      WriteLn(Res.Location);
      WriteLn(Res.FailReasons.Text);
      ReadLn;

      Produto.Id := Null;
      Produto.Descricao := 'ALTERANDO PRODUTO';
      Produto.DescricaoReduzida := 'ALTERANDO PRODUTO';

      Impostos := TItemImpostoFederalList.Create;

      ItemImpostoFederal := TItemImpostoFederal.Create;
      ItemImpostoFederal.Id := '01';

      Impostos.Add(ItemImpostoFederal);

      ItemImpostoFederal := TItemImpostoFederal.Create;
      ItemImpostoFederal.Id := '05';

      Impostos.Add(ItemImpostoFederal);

      Produto.NaturezaDeImpostoFederalId := 1;

      Produto.ItensImpostosFederais := Impostos;

      Estoques := TEstoqueDoProdutoList.Create;
      EstoqueItem := TEstoqueDoProduto.Create;
      EstoqueItem.LojaId := 1;
      EstoqueItem.EstoqueMinimo := 10;
      EstoqueItem.EstoqueMaximo := 300;
      Estoques.Add(EstoqueItem);
      Produto.EstoquesDoProduto := Estoques;

      Res := ProdutoService.Insert(Produto);
//
//      PrecoService := TPrecoService.Create(Client);
//      Precos := PrecoService.Filter(Format('produtoId==%s', [Res.Location]));
//      for Preco in Precos do
//      begin
//        Preco.PrecoVenda1 := 10;
//        PrecoService.Update(IntToStr(Preco.Id), Preco);
//      end;

      ProdutoInserido := ProdutoService.Get(res.Location);
      Estoques := ProdutoInserido.EstoquesDoProduto;
      Estoques[0].EstoqueMinimo := 400;
      Estoques[0].EstoqueMaximo := 800;

      Res := ProdutoService.Update(ProdutoInserido.Id, ProdutoInserido);


      WriteLn(Res.Successful);
      WriteLn(Res.Location);
      WriteLn(Res.FailReasons.Text);
    except
      on E: Exception do
        Writeln(E.ClassName, ': ', E.Message);
    end;
    ReadLn;
  FINALLY
    CoUninitialize;
  END;
end.
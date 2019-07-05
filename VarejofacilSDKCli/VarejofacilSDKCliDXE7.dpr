program VarejofacilSDKCliDXE7;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  SDK.Types,
  System.DateUtils,
  SDK.Service,
  SDK.Enums,
  SDK.Client,
  SDK.SortParams,
  SDK.XML,
  SDK.Model.Produto,
  SDK.Service.Produto,
  ActiveX,
  Variants;

var
  Client: IClient;
  ProdutoService: TProdutoService;
  Produtos: TProdutoList;
  Produto: IProduto;
  I: Integer;
  Response: IBatchResponse;
  ProdutosAlterados: TProdutoList;
begin
  CoInitialize(nil);
  try
    ReportMemoryLeaksOnShutdown := False;
    try
      Client := TClient.Create('http://172.16.13.71:8080', '392d755ffde39e65597f73d759a4b3f2');
      ProdutoService := TProdutoService.Create(Client);
      Produtos := ProdutoService.GetAll(1, 300);
      ProdutosAlterados := TProdutoList.Create;
      try
        for I := 0 to Produtos.Count - 1 do
        begin
          Produto := Produtos[I];
          Writeln(Produto.Id + '-' + Produto.Descricao);
          Produto.QtdMaximaVenda := 60;
          ProdutosAlterados.Add(Produto);
        end;
        Response := ProdutoService.BatchUpdate(ProdutosAlterados);
        Writeln('Sucesso: ' + IntToStr(Response.Successes.Count));
        Writeln('Erros:' + IntToStr(Response.Errors.Count));
      finally
        FreeAndNil(ProdutosAlterados);
      end;
    except
      on E: Exception do
        Writeln(E.ClassName, ': ', E.Message);
    end;
    ReadLn;
  finally
    CoUninitialize;
  end;
end.
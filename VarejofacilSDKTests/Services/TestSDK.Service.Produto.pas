unit TestSDK.Service.Produto;

interface

uses
  TestFramework, SysUtils, SDK.Service, SDK.XML, SDK.Service.Produto,
  SDK.Model.Produto, XMLIntf, SDK.Types, SDK.TestCase;

type

  TTestProdutoService = class(TSDKTestCase)
  strict private
    FProdutoService: TProdutoService;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestBasicOperations;
  end;

implementation

procedure TTestProdutoService.SetUp;
begin
  FProdutoService := TProdutoService.Create(GetClient);
end;

procedure TTestProdutoService.TearDown;
begin
  FreeAndNil(FProdutoService);
end;

procedure TTestProdutoService.TestBasicOperations;
var
  Produto, ProdutoInserted, ProdutoUpdated, ProdutoDeleted: IProduto;
  Id: Variant;
begin
  Produto := TProduto.Create;
  FillWithRandomValues(Produto);
  Id := Produto.Id;

  //Insert
  Assert(FProdutoService.Insert(Produto) <> EmptyStr, 'Erro no insert do Produto');

  //Get
  ProdutoInserted := FProdutoService.Get(Id);
  Assert(Assigned(ProdutoInserted), 'Erro no get do Produto');
  AssertAllPropertiesAreEqual(Produto, ProdutoInserted, 'Produto não inserido corretamente.');
  FillWithRandomValues(ProdutoInserted);
  ProdutoInserted.Id := Id;

  //Update
  Assert(FProdutoService.Update(Id, ProdutoInserted), 'Erro no update do Produto.');
  ProdutoUpdated := FProdutoService.Get(Id);
  AssertAllPropertiesAreEqual(ProdutoInserted, ProdutoUpdated, 'Produto não alterado corretamente.');

  //Delete
  Assert(FProdutoService.Delete(Id), 'Erro no delete do Produto');
  ProdutoDeleted := FProdutoService.Get(Id);
  Assert(not Assigned(ProdutoDeleted), 'Produto não apagado corretamente.');
end;

initialization
  RegisterTest(TTestProdutoService.Suite);

end.


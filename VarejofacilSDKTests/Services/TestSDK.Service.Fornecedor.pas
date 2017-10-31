unit TestSDK.Service.Fornecedor;

interface

uses
  TestFramework, SysUtils, SDK.Service, SDK.XML, SDK.Service.Fornecedor,
  SDK.Model.Fornecedor, XMLIntf, SDK.Types, SDK.TestCase, SDK.Client;

type

  TTestFornecedorService = class(TSDKTestCase)
  strict private
    FFornecedorService: TFornecedorService;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestBasicOperations;
  end;

implementation

procedure TTestFornecedorService.SetUp;
begin
  FFornecedorService := TFornecedorService.Create(GetClient);
end;

procedure TTestFornecedorService.TearDown;
begin
  FreeAndNil(FFornecedorService);
end;

procedure TTestFornecedorService.TestBasicOperations;
var
  Fornecedor: IFornecedor;
  Fornecedores: TFornecedorList;
  FornecedorService: TFornecedorService;
  Client: IClient;
begin
   Client := TClient.Create('http://atacarejojordao.varejofacil.com', 'admin', 'admin');
   FornecedorService := TFornecedorService.Create(Client);
  try
    Fornecedores := FornecedorService.GetAll;
    for Fornecedor in Fornecedores do
    begin
      Assert(Fornecedor.Id > 0, 'Fornecedor não encontrado');
    end;
  finally
    FornecedorService.Free;
  end;
end;

initialization
  RegisterTest(TTestFornecedorService.Suite);

end.


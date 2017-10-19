unit TestSDK.Service.Genero;

interface

uses
  TestFramework, SysUtils, SDK.Service, SDK.XML, SDK.Service.Genero,
  SDK.Model.Genero, XMLIntf, SDK.Types, SDK.TestCase;

type

  TTestGeneroService = class(TSDKTestCase)
  strict private
    FGeneroService: TGeneroService;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestBasicOperations;
  end;

implementation

procedure TTestGeneroService.SetUp;
begin
  FGeneroService := TGeneroService.Create(GetClient);
end;

procedure TTestGeneroService.TearDown;
begin
  FreeAndNil(FGeneroService);
end;

procedure TTestGeneroService.TestBasicOperations;
var
  Genero, GeneroInserted, GeneroUpdated, GeneroDeleted: IGenero;
  Id: Variant;
begin
  Id := 1;

  //Insert
  //Assert(FGeneroService.Insert(Genero) <> EmptyStr, 'Erro no insert do Genero');

  //Get
  GeneroInserted := FGeneroService.Get(Id);
  Assert(Assigned(GeneroInserted), 'Erro no get do Genero');
end;

initialization
  RegisterTest(TTestGeneroService.Suite);

end.


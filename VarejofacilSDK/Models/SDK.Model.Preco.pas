unit SDK.Model.Preco;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IPreco = interface(IModel)
    ['{50AD038E-3A6C-4DED-9443-BB04040E7E92}']
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetProdutoId: Int64;
    procedure SetProdutoId(const AProdutoId: Int64);
    function GetPrecoVenda1: Double;
    procedure SetPrecoVenda1(const APrecoVenda1: Double);
    function GetPrecoOferta1: Double;
    procedure SetPrecoOferta1(const APrecoOferta1: Double);
    function GetMargemPreco1: Double;
    procedure SetMargemPreco1(const AMargemPreco1: Double);
    function GetPrecoVenda2: Double;
    procedure SetPrecoVenda2(const APrecoVenda2: Double);
    function GetPrecoOferta2: Double;
    procedure SetPrecoOferta2(const APrecoOferta2: Double);
    function GetMargemPreco2: Double;
    procedure SetMargemPreco2(const AMargemPreco2: Double);
    function GetQuantidadeMinimaPreco2: Double;
    procedure SetQuantidadeMinimaPreco2(const AQuantidadeMinimaPreco2: Double);
    function GetPrecoVenda3: Double;
    procedure SetPrecoVenda3(const APrecoVenda3: Double);
    function GetPrecoOferta3: Double;
    procedure SetPrecoOferta3(const APrecoOferta3: Double);
    function GetMargemPreco3: Double;
    procedure SetMargemPreco3(const AMargemPreco3: Double);
    function GetQuantidadeMinimaPreco3: Double;
    procedure SetQuantidadeMinimaPreco3(const AQuantidadeMinimaPreco3: Double);
    function GetDescontoMaximo: Double;
    procedure SetDescontoMaximo(const ADescontoMaximo: Double);
    function GetCustoProduto: Double;
    procedure SetCustoProduto(const ACustoProduto: Double);
    function GetPrecoMedioDeReposicao: Double;
    procedure SetPrecoMedioDeReposicao(const APrecoMedioDeReposicao: Double);
    function GetPrecoFiscalDeReposicao: Double;
    procedure SetPrecoFiscalDeReposicao(const APrecoFiscalDeReposicao: Double);
    function GetPermiteDesconto: Boolean;
    procedure SetPermiteDesconto(const APermiteDesconto: Boolean);
    function GetIncentivoEmZonaFranca: TString;
    procedure SetIncentivoEmZonaFranca(const AIncentivoEmZonaFranca: TString);
    property Id: Integer read GetId write SetId;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property ProdutoId: Int64 read GetProdutoId write SetProdutoId;
    property PrecoVenda1: Double read GetPrecoVenda1 write SetPrecoVenda1;
    property PrecoOferta1: Double read GetPrecoOferta1 write SetPrecoOferta1;
    property MargemPreco1: Double read GetMargemPreco1 write SetMargemPreco1;
    property PrecoVenda2: Double read GetPrecoVenda2 write SetPrecoVenda2;
    property PrecoOferta2: Double read GetPrecoOferta2 write SetPrecoOferta2;
    property MargemPreco2: Double read GetMargemPreco2 write SetMargemPreco2;
    property QuantidadeMinimaPreco2: Double read GetQuantidadeMinimaPreco2 write SetQuantidadeMinimaPreco2;
    property PrecoVenda3: Double read GetPrecoVenda3 write SetPrecoVenda3;
    property PrecoOferta3: Double read GetPrecoOferta3 write SetPrecoOferta3;
    property MargemPreco3: Double read GetMargemPreco3 write SetMargemPreco3;
    property QuantidadeMinimaPreco3: Double read GetQuantidadeMinimaPreco3 write SetQuantidadeMinimaPreco3;
    property DescontoMaximo: Double read GetDescontoMaximo write SetDescontoMaximo;
    property CustoProduto: Double read GetCustoProduto write SetCustoProduto;
    property PrecoMedioDeReposicao: Double read GetPrecoMedioDeReposicao write SetPrecoMedioDeReposicao;
    property PrecoFiscalDeReposicao: Double read GetPrecoFiscalDeReposicao write SetPrecoFiscalDeReposicao;
    property PermiteDesconto: Boolean read GetPermiteDesconto write SetPermiteDesconto;
    property IncentivoEmZonaFranca: TString read GetIncentivoEmZonaFranca write SetIncentivoEmZonaFranca;
  end;

  TPrecoList = class;

  IPrecoList = interface
	['{19F64CD8-CA65-4197-83BD-1196D8F859FC}']
    function GetReference: TPrecoList;
    function GetItems(AIndex: Integer): IPreco;
    procedure SetItems(AIndex: Integer; const Value: IPreco);
    procedure Add(const APreco: IPreco);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IPreco read GetItems write SetItems; default;
  end;

  TPrecoListEnumerator = class
  private
    FIndex: Integer;
    FPrecoList: TPrecoList;
  public
    constructor Create(APrecoList: TPrecoList);
    function GetCurrent: IPreco; inline;
    function MoveNext: Boolean;
    property Current: IPreco read GetCurrent;
  end;

  TPrecoList = class(TInterfacedObject, IPrecoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IPreco;
    procedure SetItems(AIndex: Integer; const Value: IPreco);
  public
    constructor Create;
    procedure Add(const APreco: IPreco);
    destructor Destroy; override;
    function GetEnumerator: TPrecoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TPrecoList;
    property Items[AIndex: Integer]: IPreco read GetItems write SetItems; default;
  end;

  TPrecoListRec = record
  private
    FList: IPrecoList;
  public
    class function Create(const AList: IPrecoList): TPrecoListRec; static;
    class operator Implicit(AListRec: TPrecoListRec): TPrecoList;
  end;

  TPreco = class(TInterfacedModel, IPreco)
  private
	FId: Integer;
	FLojaId: Int64;
	FProdutoId: Int64;
	FPrecoVenda1: Double;
	FPrecoOferta1: Double;
	FMargemPreco1: Double;
	FPrecoVenda2: Double;
	FPrecoOferta2: Double;
	FMargemPreco2: Double;
	FQuantidadeMinimaPreco2: Double;
	FPrecoVenda3: Double;
	FPrecoOferta3: Double;
	FMargemPreco3: Double;
	FQuantidadeMinimaPreco3: Double;
	FPreco1: Double;
	FPreco2: Double;
	FPreco3: Double;
	FDescontoMaximo: Double;
	FCustoProduto: Double;
	FPrecoMedioDeReposicao: Double;
	FPrecoFiscalDeReposicao: Double;
	FPermiteDesconto: Boolean;
	FIncentivoEmZonaFranca: TString;
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetProdutoId: Int64;
    procedure SetProdutoId(const AProdutoId: Int64);
    function GetPrecoVenda1: Double;
    procedure SetPrecoVenda1(const APrecoVenda1: Double);
    function GetPrecoOferta1: Double;
    procedure SetPrecoOferta1(const APrecoOferta1: Double);
    function GetMargemPreco1: Double;
    procedure SetMargemPreco1(const AMargemPreco1: Double);
    function GetPrecoVenda2: Double;
    procedure SetPrecoVenda2(const APrecoVenda2: Double);
    function GetPrecoOferta2: Double;
    procedure SetPrecoOferta2(const APrecoOferta2: Double);
    function GetMargemPreco2: Double;
    procedure SetMargemPreco2(const AMargemPreco2: Double);
    function GetQuantidadeMinimaPreco2: Double;
    procedure SetQuantidadeMinimaPreco2(const AQuantidadeMinimaPreco2: Double);
    function GetPrecoVenda3: Double;
    procedure SetPrecoVenda3(const APrecoVenda3: Double);
    function GetPrecoOferta3: Double;
    procedure SetPrecoOferta3(const APrecoOferta3: Double);
    function GetMargemPreco3: Double;
    procedure SetMargemPreco3(const AMargemPreco3: Double);
    function GetQuantidadeMinimaPreco3: Double;
    procedure SetQuantidadeMinimaPreco3(const AQuantidadeMinimaPreco3: Double);
    function GetDescontoMaximo: Double;
    procedure SetDescontoMaximo(const ADescontoMaximo: Double);
    function GetCustoProduto: Double;
    procedure SetCustoProduto(const ACustoProduto: Double);
    function GetPrecoMedioDeReposicao: Double;
    procedure SetPrecoMedioDeReposicao(const APrecoMedioDeReposicao: Double);
    function GetPrecoFiscalDeReposicao: Double;
    procedure SetPrecoFiscalDeReposicao(const APrecoFiscalDeReposicao: Double);
    function GetPermiteDesconto: Boolean;
    procedure SetPermiteDesconto(const APermiteDesconto: Boolean);
    function GetIncentivoEmZonaFranca: TString;
    procedure SetIncentivoEmZonaFranca(const AIncentivoEmZonaFranca: TString);
  published
    property Id: Integer read GetId write SetId;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property ProdutoId: Int64 read GetProdutoId write SetProdutoId;
    property PrecoVenda1: Double read GetPrecoVenda1 write SetPrecoVenda1;
    property PrecoOferta1: Double read GetPrecoOferta1 write SetPrecoOferta1;
    property MargemPreco1: Double read GetMargemPreco1 write SetMargemPreco1;
    property PrecoVenda2: Double read GetPrecoVenda2 write SetPrecoVenda2;
    property PrecoOferta2: Double read GetPrecoOferta2 write SetPrecoOferta2;
    property MargemPreco2: Double read GetMargemPreco2 write SetMargemPreco2;
    property QuantidadeMinimaPreco2: Double read GetQuantidadeMinimaPreco2 write SetQuantidadeMinimaPreco2;
    property PrecoVenda3: Double read GetPrecoVenda3 write SetPrecoVenda3;
    property PrecoOferta3: Double read GetPrecoOferta3 write SetPrecoOferta3;
    property MargemPreco3: Double read GetMargemPreco3 write SetMargemPreco3;
    property QuantidadeMinimaPreco3: Double read GetQuantidadeMinimaPreco3 write SetQuantidadeMinimaPreco3;
    property DescontoMaximo: Double read GetDescontoMaximo write SetDescontoMaximo;
    property CustoProduto: Double read GetCustoProduto write SetCustoProduto;
    property PrecoMedioDeReposicao: Double read GetPrecoMedioDeReposicao write SetPrecoMedioDeReposicao;
    property PrecoFiscalDeReposicao: Double read GetPrecoFiscalDeReposicao write SetPrecoFiscalDeReposicao;
    property PermiteDesconto: Boolean read GetPermiteDesconto write SetPermiteDesconto;
    property IncentivoEmZonaFranca: TString read GetIncentivoEmZonaFranca write SetIncentivoEmZonaFranca;
  end;

implementation

{ TPrecoList }

procedure TPrecoList.Add(const APreco: IPreco);
begin
  FList.Add(APreco);
end;

procedure TPrecoList.Clear;
begin
  FList.Clear;
end;

function TPrecoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TPrecoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TPrecoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TPrecoList.GetEnumerator: TPrecoListEnumerator;
begin
  Result := TPrecoListEnumerator.Create(Self);
end;

function TPrecoList.GetItems(AIndex: Integer): IPreco;
begin
  Result := FList[AIndex] as IPreco;
end;

function TPrecoList.GetReference: TPrecoList;
begin
  Result := Self;
end;

procedure TPrecoList.SetItems(AIndex: Integer; const Value: IPreco);
begin
  FList[AIndex] := Value;
end;

{ TPrecoListEnumerator }

constructor TPrecoListEnumerator.Create(APrecoList: TPrecoList);
begin
  inherited Create;
  FIndex := -1;
  FPrecoList := APrecoList;
end;

function TPrecoListEnumerator.GetCurrent: IPreco;
begin
  Result := FPrecoList[FIndex];
end;

function TPrecoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FPrecoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TPrecoListRec }

class function TPrecoListRec.Create(const AList: IPrecoList): TPrecoListRec;
begin
  FillChar(Result, SizeOf(TPrecoListRec), 0);
  Result.FList := AList;
end;

class operator TPrecoListRec.Implicit(AListRec: TPrecoListRec): TPrecoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TPreco }

function TPreco.GetId: Integer;
begin
  Result := FId;
end;

procedure TPreco.SetId(const AId: Integer);
begin
  FId := AId;
end;

function TPreco.GetLojaId: Int64;
begin
  Result := FLojaId;
end;

procedure TPreco.SetLojaId(const ALojaId: Int64);
begin
  FLojaId := ALojaId;
end;

function TPreco.GetProdutoId: Int64;
begin
  Result := FProdutoId;
end;

procedure TPreco.SetProdutoId(const AProdutoId: Int64);
begin
  FProdutoId := AProdutoId;
end;

function TPreco.GetPrecoVenda1: Double;
begin
  Result := FPrecoVenda1;
end;

procedure TPreco.SetPrecoVenda1(const APrecoVenda1: Double);
begin
  FPrecoVenda1 := APrecoVenda1;
end;

function TPreco.GetPrecoOferta1: Double;
begin
  Result := FPrecoOferta1;
end;

procedure TPreco.SetPrecoOferta1(const APrecoOferta1: Double);
begin
  FPrecoOferta1 := APrecoOferta1;
end;

function TPreco.GetMargemPreco1: Double;
begin
  Result := FMargemPreco1;
end;

procedure TPreco.SetMargemPreco1(const AMargemPreco1: Double);
begin
  FMargemPreco1 := AMargemPreco1;
end;

function TPreco.GetPrecoVenda2: Double;
begin
  Result := FPrecoVenda2;
end;

procedure TPreco.SetPrecoVenda2(const APrecoVenda2: Double);
begin
  FPrecoVenda2 := APrecoVenda2;
end;

function TPreco.GetPrecoOferta2: Double;
begin
  Result := FPrecoOferta2;
end;

procedure TPreco.SetPrecoOferta2(const APrecoOferta2: Double);
begin
  FPrecoOferta2 := APrecoOferta2;
end;

function TPreco.GetMargemPreco2: Double;
begin
  Result := FMargemPreco2;
end;

procedure TPreco.SetMargemPreco2(const AMargemPreco2: Double);
begin
  FMargemPreco2 := AMargemPreco2;
end;

function TPreco.GetQuantidadeMinimaPreco2: Double;
begin
  Result := FQuantidadeMinimaPreco2;
end;

procedure TPreco.SetQuantidadeMinimaPreco2(const AQuantidadeMinimaPreco2: Double);
begin
  FQuantidadeMinimaPreco2 := AQuantidadeMinimaPreco2;
end;

function TPreco.GetPrecoVenda3: Double;
begin
  Result := FPrecoVenda3;
end;

procedure TPreco.SetPrecoVenda3(const APrecoVenda3: Double);
begin
  FPrecoVenda3 := APrecoVenda3;
end;

function TPreco.GetPrecoOferta3: Double;
begin
  Result := FPrecoOferta3;
end;

procedure TPreco.SetPrecoOferta3(const APrecoOferta3: Double);
begin
  FPrecoOferta3 := APrecoOferta3;
end;

function TPreco.GetMargemPreco3: Double;
begin
  Result := FMargemPreco3;
end;

procedure TPreco.SetMargemPreco3(const AMargemPreco3: Double);
begin
  FMargemPreco3 := AMargemPreco3;
end;

function TPreco.GetQuantidadeMinimaPreco3: Double;
begin
  Result := FQuantidadeMinimaPreco3;
end;

procedure TPreco.SetQuantidadeMinimaPreco3(const AQuantidadeMinimaPreco3: Double);
begin
  FQuantidadeMinimaPreco3 := AQuantidadeMinimaPreco3;
end;

function TPreco.GetDescontoMaximo: Double;
begin
  Result := FDescontoMaximo;
end;

procedure TPreco.SetDescontoMaximo(const ADescontoMaximo: Double);
begin
  FDescontoMaximo := ADescontoMaximo;
end;

function TPreco.GetCustoProduto: Double;
begin
  Result := FCustoProduto;
end;

procedure TPreco.SetCustoProduto(const ACustoProduto: Double);
begin
  FCustoProduto := ACustoProduto;
end;

function TPreco.GetPrecoMedioDeReposicao: Double;
begin
  Result := FPrecoMedioDeReposicao;
end;

procedure TPreco.SetPrecoMedioDeReposicao(const APrecoMedioDeReposicao: Double);
begin
  FPrecoMedioDeReposicao := APrecoMedioDeReposicao;
end;

function TPreco.GetPrecoFiscalDeReposicao: Double;
begin
  Result := FPrecoFiscalDeReposicao;
end;

procedure TPreco.SetPrecoFiscalDeReposicao(const APrecoFiscalDeReposicao: Double);
begin
  FPrecoFiscalDeReposicao := APrecoFiscalDeReposicao;
end;

function TPreco.GetPermiteDesconto: Boolean;
begin
  Result := FPermiteDesconto;
end;

procedure TPreco.SetPermiteDesconto(const APermiteDesconto: Boolean);
begin
  FPermiteDesconto := APermiteDesconto;
end;

function TPreco.GetIncentivoEmZonaFranca: TString;
begin
  Result := FIncentivoEmZonaFranca;
end;

procedure TPreco.SetIncentivoEmZonaFranca(const AIncentivoEmZonaFranca: TString);
begin
  FIncentivoEmZonaFranca := AIncentivoEmZonaFranca;
end;


end.
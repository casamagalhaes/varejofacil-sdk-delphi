unit SDK.Model.ItemDevolucao;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IItemDevolucao = interface(IModel)
    ['{33504E24-80A7-4E31-928B-D751C79A6E3A}']
    function GetProdutoId: Int64;
    procedure SetProdutoId(const AProdutoId: Int64);
    function GetQuantidade: Double;
    procedure SetQuantidade(const AQuantidade: Double);
    function GetTipoPreco: TString;
    procedure SetTipoPreco(const ATipoPreco: TString);
    function GetValorUnitario: Double;
    procedure SetValorUnitario(const AValorUnitario: Double);
    function GetValorDesconto: Double;
    procedure SetValorDesconto(const AValorDesconto: Double);
    function GetValorTotal: Double;
    procedure SetValorTotal(const AValorTotal: Double);
    function GetComissaoVenda: Double;
    procedure SetComissaoVenda(const AComissaoVenda: Double);
    function GetReducaoComissao: Double;
    procedure SetReducaoComissao(const AReducaoComissao: Double);
    function GetControlaEstoque: Boolean;
    procedure SetControlaEstoque(const AControlaEstoque: Boolean);
    function GetControlaSerie: Boolean;
    procedure SetControlaSerie(const AControlaSerie: Boolean);
    function GetVendedorId: Int64;
    procedure SetVendedorId(const AVendedorId: Int64);
    function GetSerieProduto: TString;
    procedure SetSerieProduto(const ASerieProduto: TString);
    property ProdutoId: Int64 read GetProdutoId write SetProdutoId;
    property Quantidade: Double read GetQuantidade write SetQuantidade;
    property TipoPreco: TString read GetTipoPreco write SetTipoPreco;
    property ValorUnitario: Double read GetValorUnitario write SetValorUnitario;
    property ValorDesconto: Double read GetValorDesconto write SetValorDesconto;
    property ValorTotal: Double read GetValorTotal write SetValorTotal;
    property ComissaoVenda: Double read GetComissaoVenda write SetComissaoVenda;
    property ReducaoComissao: Double read GetReducaoComissao write SetReducaoComissao;
    property ControlaEstoque: Boolean read GetControlaEstoque write SetControlaEstoque;
    property ControlaSerie: Boolean read GetControlaSerie write SetControlaSerie;
    property VendedorId: Int64 read GetVendedorId write SetVendedorId;
    property SerieProduto: TString read GetSerieProduto write SetSerieProduto;
  end;

  TItemDevolucaoList = class;

  IItemDevolucaoList = interface
	['{A3D950D8-A41A-4DEF-B254-25FD4B9801EF}']
    function GetReference: TItemDevolucaoList;
    function GetItems(AIndex: Integer): IItemDevolucao;
    procedure SetItems(AIndex: Integer; const Value: IItemDevolucao);
    procedure Add(const AItemDevolucao: IItemDevolucao);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IItemDevolucao read GetItems write SetItems; default;
  end;

  TItemDevolucaoListEnumerator = class
  private
    FIndex: Integer;
    FItemDevolucaoList: TItemDevolucaoList;
  public
    constructor Create(AItemDevolucaoList: TItemDevolucaoList);
    function GetCurrent: IItemDevolucao; inline;
    function MoveNext: Boolean;
    property Current: IItemDevolucao read GetCurrent;
  end;

  TItemDevolucaoList = class(TInterfacedObject, IItemDevolucaoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IItemDevolucao;
    procedure SetItems(AIndex: Integer; const Value: IItemDevolucao);
  public
    constructor Create;
    procedure Add(const AItemDevolucao: IItemDevolucao);
    destructor Destroy; override;
    function GetEnumerator: TItemDevolucaoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TItemDevolucaoList;
    property Items[AIndex: Integer]: IItemDevolucao read GetItems write SetItems; default;
  end;

  TItemDevolucaoListRec = record
  private
    FList: IItemDevolucaoList;
  public
    class function Create(const AList: IItemDevolucaoList): TItemDevolucaoListRec; static;
    class operator Implicit(AListRec: TItemDevolucaoListRec): TItemDevolucaoList;
  end;

  TItemDevolucao = class(TInterfacedModel, IItemDevolucao)
  private
	FProdutoId: Int64;
	FQuantidade: Double;
	FTipoPreco: TString;
	FValorUnitario: Double;
	FValorDesconto: Double;
	FValorTotal: Double;
	FComissaoVenda: Double;
	FReducaoComissao: Double;
	FControlaEstoque: Boolean;
	FControlaSerie: Boolean;
	FVendedorId: Int64;
	FSerieProduto: TString;
    function GetProdutoId: Int64;
    procedure SetProdutoId(const AProdutoId: Int64);
    function GetQuantidade: Double;
    procedure SetQuantidade(const AQuantidade: Double);
    function GetTipoPreco: TString;
    procedure SetTipoPreco(const ATipoPreco: TString);
    function GetValorUnitario: Double;
    procedure SetValorUnitario(const AValorUnitario: Double);
    function GetValorDesconto: Double;
    procedure SetValorDesconto(const AValorDesconto: Double);
    function GetValorTotal: Double;
    procedure SetValorTotal(const AValorTotal: Double);
    function GetComissaoVenda: Double;
    procedure SetComissaoVenda(const AComissaoVenda: Double);
    function GetReducaoComissao: Double;
    procedure SetReducaoComissao(const AReducaoComissao: Double);
    function GetControlaEstoque: Boolean;
    procedure SetControlaEstoque(const AControlaEstoque: Boolean);
    function GetControlaSerie: Boolean;
    procedure SetControlaSerie(const AControlaSerie: Boolean);
    function GetVendedorId: Int64;
    procedure SetVendedorId(const AVendedorId: Int64);
    function GetSerieProduto: TString;
    procedure SetSerieProduto(const ASerieProduto: TString);
  public
    property ProdutoId: Int64 read GetProdutoId write SetProdutoId;
    property Quantidade: Double read GetQuantidade write SetQuantidade;
    property TipoPreco: TString read GetTipoPreco write SetTipoPreco;
    property ValorUnitario: Double read GetValorUnitario write SetValorUnitario;
    property ValorDesconto: Double read GetValorDesconto write SetValorDesconto;
    property ValorTotal: Double read GetValorTotal write SetValorTotal;
    property ComissaoVenda: Double read GetComissaoVenda write SetComissaoVenda;
    property ReducaoComissao: Double read GetReducaoComissao write SetReducaoComissao;
    property ControlaEstoque: Boolean read GetControlaEstoque write SetControlaEstoque;
    property ControlaSerie: Boolean read GetControlaSerie write SetControlaSerie;
    property VendedorId: Int64 read GetVendedorId write SetVendedorId;
    property SerieProduto: TString read GetSerieProduto write SetSerieProduto;
  end;

implementation

{ TItemDevolucaoList }

procedure TItemDevolucaoList.Add(const AItemDevolucao: IItemDevolucao);
begin
  FList.Add(AItemDevolucao);
end;

procedure TItemDevolucaoList.Clear;
begin
  FList.Clear;
end;

function TItemDevolucaoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TItemDevolucaoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TItemDevolucaoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TItemDevolucaoList.GetEnumerator: TItemDevolucaoListEnumerator;
begin
  Result := TItemDevolucaoListEnumerator.Create(Self);
end;

function TItemDevolucaoList.GetItems(AIndex: Integer): IItemDevolucao;
begin
  Result := FList[AIndex] as IItemDevolucao;
end;

function TItemDevolucaoList.GetReference: TItemDevolucaoList;
begin
  Result := Self;
end;

procedure TItemDevolucaoList.SetItems(AIndex: Integer; const Value: IItemDevolucao);
begin
  FList[AIndex] := Value;
end;

{ TItemDevolucaoListEnumerator }

constructor TItemDevolucaoListEnumerator.Create(AItemDevolucaoList: TItemDevolucaoList);
begin
  inherited Create;
  FIndex := -1;
  FItemDevolucaoList := AItemDevolucaoList;
end;

function TItemDevolucaoListEnumerator.GetCurrent: IItemDevolucao;
begin
  Result := FItemDevolucaoList[FIndex];
end;

function TItemDevolucaoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FItemDevolucaoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TItemDevolucaoListRec }

class function TItemDevolucaoListRec.Create(const AList: IItemDevolucaoList): TItemDevolucaoListRec;
begin
  FillChar(Result, SizeOf(TItemDevolucaoListRec), 0);
  Result.FList := AList;
end;

class operator TItemDevolucaoListRec.Implicit(AListRec: TItemDevolucaoListRec): TItemDevolucaoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TItemDevolucao }

function TItemDevolucao.GetProdutoId: Int64;
begin
  Result := FProdutoId;
end;

procedure TItemDevolucao.SetProdutoId(const AProdutoId: Int64);
begin
  FProdutoId := AProdutoId;
end;

function TItemDevolucao.GetQuantidade: Double;
begin
  Result := FQuantidade;
end;

procedure TItemDevolucao.SetQuantidade(const AQuantidade: Double);
begin
  FQuantidade := AQuantidade;
end;

function TItemDevolucao.GetTipoPreco: TString;
begin
  Result := FTipoPreco;
end;

procedure TItemDevolucao.SetTipoPreco(const ATipoPreco: TString);
begin
  FTipoPreco := ATipoPreco;
end;

function TItemDevolucao.GetValorUnitario: Double;
begin
  Result := FValorUnitario;
end;

procedure TItemDevolucao.SetValorUnitario(const AValorUnitario: Double);
begin
  FValorUnitario := AValorUnitario;
end;

function TItemDevolucao.GetValorDesconto: Double;
begin
  Result := FValorDesconto;
end;

procedure TItemDevolucao.SetValorDesconto(const AValorDesconto: Double);
begin
  FValorDesconto := AValorDesconto;
end;

function TItemDevolucao.GetValorTotal: Double;
begin
  Result := FValorTotal;
end;

procedure TItemDevolucao.SetValorTotal(const AValorTotal: Double);
begin
  FValorTotal := AValorTotal;
end;

function TItemDevolucao.GetComissaoVenda: Double;
begin
  Result := FComissaoVenda;
end;

procedure TItemDevolucao.SetComissaoVenda(const AComissaoVenda: Double);
begin
  FComissaoVenda := AComissaoVenda;
end;

function TItemDevolucao.GetReducaoComissao: Double;
begin
  Result := FReducaoComissao;
end;

procedure TItemDevolucao.SetReducaoComissao(const AReducaoComissao: Double);
begin
  FReducaoComissao := AReducaoComissao;
end;

function TItemDevolucao.GetControlaEstoque: Boolean;
begin
  Result := FControlaEstoque;
end;

procedure TItemDevolucao.SetControlaEstoque(const AControlaEstoque: Boolean);
begin
  FControlaEstoque := AControlaEstoque;
end;

function TItemDevolucao.GetControlaSerie: Boolean;
begin
  Result := FControlaSerie;
end;

procedure TItemDevolucao.SetControlaSerie(const AControlaSerie: Boolean);
begin
  FControlaSerie := AControlaSerie;
end;

function TItemDevolucao.GetVendedorId: Int64;
begin
  Result := FVendedorId;
end;

procedure TItemDevolucao.SetVendedorId(const AVendedorId: Int64);
begin
  FVendedorId := AVendedorId;
end;

function TItemDevolucao.GetSerieProduto: TString;
begin
  Result := FSerieProduto;
end;

procedure TItemDevolucao.SetSerieProduto(const ASerieProduto: TString);
begin
  FSerieProduto := ASerieProduto;
end;


end.
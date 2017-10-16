unit SDK.Model.ItemTroca;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IItemTroca = interface(IModel)
    ['{532CF37D-136F-464F-A268-49A319B7B169}']
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
    function GetPercentualComissaoVenda: Double;
    procedure SetPercentualComissaoVenda(const APercentualComissaoVenda: Double);
    function GetPercentualReducaoDaComissaoVenda: Double;
    procedure SetPercentualReducaoDaComissaoVenda(const APercentualReducaoDaComissaoVenda: Double);
    function GetControlaEstoque: Boolean;
    procedure SetControlaEstoque(const AControlaEstoque: Boolean);
    function GetControlaSerie: Boolean;
    procedure SetControlaSerie(const AControlaSerie: Boolean);
    function GetFuncionarioId: TString;
    procedure SetFuncionarioId(const AFuncionarioId: TString);
    function GetSerieProduto: TString;
    procedure SetSerieProduto(const ASerieProduto: TString);
    property ProdutoId: Int64 read GetProdutoId write SetProdutoId;
    property Quantidade: Double read GetQuantidade write SetQuantidade;
    property TipoPreco: TString read GetTipoPreco write SetTipoPreco;
    property ValorUnitario: Double read GetValorUnitario write SetValorUnitario;
    property ValorDesconto: Double read GetValorDesconto write SetValorDesconto;
    property ValorTotal: Double read GetValorTotal write SetValorTotal;
    property PercentualComissaoVenda: Double read GetPercentualComissaoVenda write SetPercentualComissaoVenda;
    property PercentualReducaoDaComissaoVenda: Double read GetPercentualReducaoDaComissaoVenda write SetPercentualReducaoDaComissaoVenda;
    property ControlaEstoque: Boolean read GetControlaEstoque write SetControlaEstoque;
    property ControlaSerie: Boolean read GetControlaSerie write SetControlaSerie;
    property FuncionarioId: TString read GetFuncionarioId write SetFuncionarioId;
    property SerieProduto: TString read GetSerieProduto write SetSerieProduto;
  end;

  TItemTrocaList = class;

  IItemTrocaList = interface
	['{AD7FF7C0-AD0A-4F49-AE68-33D129F4D0D0}']
    function GetReference: TItemTrocaList;
    function GetItems(AIndex: Integer): IItemTroca;
    procedure SetItems(AIndex: Integer; const Value: IItemTroca);
    procedure Add(const AItemTroca: IItemTroca);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IItemTroca read GetItems write SetItems; default;
  end;

  TItemTrocaListEnumerator = class
  private
    FIndex: Integer;
    FItemTrocaList: TItemTrocaList;
  public
    constructor Create(AItemTrocaList: TItemTrocaList);
    function GetCurrent: IItemTroca; inline;
    function MoveNext: Boolean;
    property Current: IItemTroca read GetCurrent;
  end;

  TItemTrocaList = class(TInterfacedObject, IItemTrocaList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IItemTroca;
    procedure SetItems(AIndex: Integer; const Value: IItemTroca);
  public
    constructor Create;
    procedure Add(const AItemTroca: IItemTroca);
    destructor Destroy; override;
    function GetEnumerator: TItemTrocaListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TItemTrocaList;
    property Items[AIndex: Integer]: IItemTroca read GetItems write SetItems; default;
  end;

  TItemTrocaListRec = record
  private
    FList: IItemTrocaList;
  public
    class function Create(const AList: IItemTrocaList): TItemTrocaListRec; static;
    class operator Implicit(AListRec: TItemTrocaListRec): TItemTrocaList;
  end;

  TItemTroca = class(TInterfacedModel, IItemTroca)
  private
	FProdutoId: Int64;
	FQuantidade: Double;
	FTipoPreco: TString;
	FValorUnitario: Double;
	FValorDesconto: Double;
	FValorTotal: Double;
	FPercentualComissaoVenda: Double;
	FPercentualReducaoDaComissaoVenda: Double;
	FControlaEstoque: Boolean;
	FControlaSerie: Boolean;
	FFuncionarioId: TString;
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
    function GetPercentualComissaoVenda: Double;
    procedure SetPercentualComissaoVenda(const APercentualComissaoVenda: Double);
    function GetPercentualReducaoDaComissaoVenda: Double;
    procedure SetPercentualReducaoDaComissaoVenda(const APercentualReducaoDaComissaoVenda: Double);
    function GetControlaEstoque: Boolean;
    procedure SetControlaEstoque(const AControlaEstoque: Boolean);
    function GetControlaSerie: Boolean;
    procedure SetControlaSerie(const AControlaSerie: Boolean);
    function GetFuncionarioId: TString;
    procedure SetFuncionarioId(const AFuncionarioId: TString);
    function GetSerieProduto: TString;
    procedure SetSerieProduto(const ASerieProduto: TString);
  public
    property ProdutoId: Int64 read GetProdutoId write SetProdutoId;
    property Quantidade: Double read GetQuantidade write SetQuantidade;
    property TipoPreco: TString read GetTipoPreco write SetTipoPreco;
    property ValorUnitario: Double read GetValorUnitario write SetValorUnitario;
    property ValorDesconto: Double read GetValorDesconto write SetValorDesconto;
    property ValorTotal: Double read GetValorTotal write SetValorTotal;
    property PercentualComissaoVenda: Double read GetPercentualComissaoVenda write SetPercentualComissaoVenda;
    property PercentualReducaoDaComissaoVenda: Double read GetPercentualReducaoDaComissaoVenda write SetPercentualReducaoDaComissaoVenda;
    property ControlaEstoque: Boolean read GetControlaEstoque write SetControlaEstoque;
    property ControlaSerie: Boolean read GetControlaSerie write SetControlaSerie;
    property FuncionarioId: TString read GetFuncionarioId write SetFuncionarioId;
    property SerieProduto: TString read GetSerieProduto write SetSerieProduto;
  end;

implementation

{ TItemTrocaList }

procedure TItemTrocaList.Add(const AItemTroca: IItemTroca);
begin
  FList.Add(AItemTroca);
end;

procedure TItemTrocaList.Clear;
begin
  FList.Clear;
end;

function TItemTrocaList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TItemTrocaList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TItemTrocaList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TItemTrocaList.GetEnumerator: TItemTrocaListEnumerator;
begin
  Result := TItemTrocaListEnumerator.Create(Self);
end;

function TItemTrocaList.GetItems(AIndex: Integer): IItemTroca;
begin
  Result := FList[AIndex] as IItemTroca;
end;

function TItemTrocaList.GetReference: TItemTrocaList;
begin
  Result := Self;
end;

procedure TItemTrocaList.SetItems(AIndex: Integer; const Value: IItemTroca);
begin
  FList[AIndex] := Value;
end;

{ TItemTrocaListEnumerator }

constructor TItemTrocaListEnumerator.Create(AItemTrocaList: TItemTrocaList);
begin
  inherited Create;
  FIndex := -1;
  FItemTrocaList := AItemTrocaList;
end;

function TItemTrocaListEnumerator.GetCurrent: IItemTroca;
begin
  Result := FItemTrocaList[FIndex];
end;

function TItemTrocaListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FItemTrocaList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TItemTrocaListRec }

class function TItemTrocaListRec.Create(const AList: IItemTrocaList): TItemTrocaListRec;
begin
  FillChar(Result, SizeOf(TItemTrocaListRec), 0);
  Result.FList := AList;
end;

class operator TItemTrocaListRec.Implicit(AListRec: TItemTrocaListRec): TItemTrocaList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TItemTroca }

function TItemTroca.GetProdutoId: Int64;
begin
  Result := FProdutoId;
end;

procedure TItemTroca.SetProdutoId(const AProdutoId: Int64);
begin
  FProdutoId := AProdutoId;
end;

function TItemTroca.GetQuantidade: Double;
begin
  Result := FQuantidade;
end;

procedure TItemTroca.SetQuantidade(const AQuantidade: Double);
begin
  FQuantidade := AQuantidade;
end;

function TItemTroca.GetTipoPreco: TString;
begin
  Result := FTipoPreco;
end;

procedure TItemTroca.SetTipoPreco(const ATipoPreco: TString);
begin
  FTipoPreco := ATipoPreco;
end;

function TItemTroca.GetValorUnitario: Double;
begin
  Result := FValorUnitario;
end;

procedure TItemTroca.SetValorUnitario(const AValorUnitario: Double);
begin
  FValorUnitario := AValorUnitario;
end;

function TItemTroca.GetValorDesconto: Double;
begin
  Result := FValorDesconto;
end;

procedure TItemTroca.SetValorDesconto(const AValorDesconto: Double);
begin
  FValorDesconto := AValorDesconto;
end;

function TItemTroca.GetValorTotal: Double;
begin
  Result := FValorTotal;
end;

procedure TItemTroca.SetValorTotal(const AValorTotal: Double);
begin
  FValorTotal := AValorTotal;
end;

function TItemTroca.GetPercentualComissaoVenda: Double;
begin
  Result := FPercentualComissaoVenda;
end;

procedure TItemTroca.SetPercentualComissaoVenda(const APercentualComissaoVenda: Double);
begin
  FPercentualComissaoVenda := APercentualComissaoVenda;
end;

function TItemTroca.GetPercentualReducaoDaComissaoVenda: Double;
begin
  Result := FPercentualReducaoDaComissaoVenda;
end;

procedure TItemTroca.SetPercentualReducaoDaComissaoVenda(const APercentualReducaoDaComissaoVenda: Double);
begin
  FPercentualReducaoDaComissaoVenda := APercentualReducaoDaComissaoVenda;
end;

function TItemTroca.GetControlaEstoque: Boolean;
begin
  Result := FControlaEstoque;
end;

procedure TItemTroca.SetControlaEstoque(const AControlaEstoque: Boolean);
begin
  FControlaEstoque := AControlaEstoque;
end;

function TItemTroca.GetControlaSerie: Boolean;
begin
  Result := FControlaSerie;
end;

procedure TItemTroca.SetControlaSerie(const AControlaSerie: Boolean);
begin
  FControlaSerie := AControlaSerie;
end;

function TItemTroca.GetFuncionarioId: TString;
begin
  Result := FFuncionarioId;
end;

procedure TItemTroca.SetFuncionarioId(const AFuncionarioId: TString);
begin
  FFuncionarioId := AFuncionarioId;
end;

function TItemTroca.GetSerieProduto: TString;
begin
  Result := FSerieProduto;
end;

procedure TItemTroca.SetSerieProduto(const ASerieProduto: TString);
begin
  FSerieProduto := ASerieProduto;
end;


end.
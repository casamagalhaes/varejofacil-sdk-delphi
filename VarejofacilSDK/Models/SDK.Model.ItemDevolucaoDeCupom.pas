unit SDK.Model.ItemDevolucaoDeCupom;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IItemDevolucaoDeCupom = interface(IModel)
    ['{44C1D85A-CB64-4642-9465-C62BD2F8CD5D}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetProdutoId: Int64;
    procedure SetProdutoId(const AProdutoId: Int64);
    function GetVendedorId: Int64;
    procedure SetVendedorId(const AVendedorId: Int64);
    function GetQuantidadeDeItensNoCupom: Double;
    procedure SetQuantidadeDeItensNoCupom(const AQuantidadeDeItensNoCupom: Double);
    function GetQuantidadeDeItensDevolvidos: Double;
    procedure SetQuantidadeDeItensDevolvidos(const AQuantidadeDeItensDevolvidos: Double);
    function GetNumeroDeSerie: TString;
    procedure SetNumeroDeSerie(const ANumeroDeSerie: TString);
    function GetValorUnitario: Double;
    procedure SetValorUnitario(const AValorUnitario: Double);
    function GetPercentualDeAcrescimo: Double;
    procedure SetPercentualDeAcrescimo(const APercentualDeAcrescimo: Double);
    function GetPercentualDeDesconto: Double;
    procedure SetPercentualDeDesconto(const APercentualDeDesconto: Double);
    function GetValorTotalDevolvido: Double;
    procedure SetValorTotalDevolvido(const AValorTotalDevolvido: Double);
    function GetMotivoDaDevolucaoId: Int64;
    procedure SetMotivoDaDevolucaoId(const AMotivoDaDevolucaoId: Int64);
    property Id: Int64 read GetId write SetId;
    property ProdutoId: Int64 read GetProdutoId write SetProdutoId;
    property VendedorId: Int64 read GetVendedorId write SetVendedorId;
    property QuantidadeDeItensNoCupom: Double read GetQuantidadeDeItensNoCupom write SetQuantidadeDeItensNoCupom;
    property QuantidadeDeItensDevolvidos: Double read GetQuantidadeDeItensDevolvidos write SetQuantidadeDeItensDevolvidos;
    property NumeroDeSerie: TString read GetNumeroDeSerie write SetNumeroDeSerie;
    property ValorUnitario: Double read GetValorUnitario write SetValorUnitario;
    property PercentualDeAcrescimo: Double read GetPercentualDeAcrescimo write SetPercentualDeAcrescimo;
    property PercentualDeDesconto: Double read GetPercentualDeDesconto write SetPercentualDeDesconto;
    property ValorTotalDevolvido: Double read GetValorTotalDevolvido write SetValorTotalDevolvido;
    property MotivoDaDevolucaoId: Int64 read GetMotivoDaDevolucaoId write SetMotivoDaDevolucaoId;
  end;

  TItemDevolucaoDeCupomList = class;

  IItemDevolucaoDeCupomList = interface
	['{5474FDA1-4B63-4E7E-9242-117597351330}']
    function GetReference: TItemDevolucaoDeCupomList;
    function GetItems(AIndex: Integer): IItemDevolucaoDeCupom;
    procedure SetItems(AIndex: Integer; const Value: IItemDevolucaoDeCupom);
    procedure Add(const AItemDevolucaoDeCupom: IItemDevolucaoDeCupom);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IItemDevolucaoDeCupom read GetItems write SetItems; default;
  end;

  TItemDevolucaoDeCupomListEnumerator = class
  private
    FIndex: Integer;
    FItemDevolucaoDeCupomList: TItemDevolucaoDeCupomList;
  public
    constructor Create(AItemDevolucaoDeCupomList: TItemDevolucaoDeCupomList);
    function GetCurrent: IItemDevolucaoDeCupom; inline;
    function MoveNext: Boolean;
    property Current: IItemDevolucaoDeCupom read GetCurrent;
  end;

  TItemDevolucaoDeCupomList = class(TInterfacedObject, IItemDevolucaoDeCupomList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IItemDevolucaoDeCupom;
    procedure SetItems(AIndex: Integer; const Value: IItemDevolucaoDeCupom);
  public
    constructor Create;
    procedure Add(const AItemDevolucaoDeCupom: IItemDevolucaoDeCupom);
    destructor Destroy; override;
    function GetEnumerator: TItemDevolucaoDeCupomListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TItemDevolucaoDeCupomList;
    property Items[AIndex: Integer]: IItemDevolucaoDeCupom read GetItems write SetItems; default;
  end;

  TItemDevolucaoDeCupomListRec = record
  private
    FList: IItemDevolucaoDeCupomList;
  public
    class function Create(const AList: IItemDevolucaoDeCupomList): TItemDevolucaoDeCupomListRec; static;
    class operator Implicit(AListRec: TItemDevolucaoDeCupomListRec): TItemDevolucaoDeCupomList;
  end;

  TItemDevolucaoDeCupom = class(TInterfacedModel, IItemDevolucaoDeCupom)
  private
	FId: Int64;
	FProdutoId: Int64;
	FVendedorId: Int64;
	FQuantidadeDeItensNoCupom: Double;
	FQuantidadeDeItensDevolvidos: Double;
	FNumeroDeSerie: TString;
	FValorUnitario: Double;
	FPercentualDeAcrescimo: Double;
	FPercentualDeDesconto: Double;
	FValorTotalDevolvido: Double;
	FMotivoDaDevolucaoId: Int64;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetProdutoId: Int64;
    procedure SetProdutoId(const AProdutoId: Int64);
    function GetVendedorId: Int64;
    procedure SetVendedorId(const AVendedorId: Int64);
    function GetQuantidadeDeItensNoCupom: Double;
    procedure SetQuantidadeDeItensNoCupom(const AQuantidadeDeItensNoCupom: Double);
    function GetQuantidadeDeItensDevolvidos: Double;
    procedure SetQuantidadeDeItensDevolvidos(const AQuantidadeDeItensDevolvidos: Double);
    function GetNumeroDeSerie: TString;
    procedure SetNumeroDeSerie(const ANumeroDeSerie: TString);
    function GetValorUnitario: Double;
    procedure SetValorUnitario(const AValorUnitario: Double);
    function GetPercentualDeAcrescimo: Double;
    procedure SetPercentualDeAcrescimo(const APercentualDeAcrescimo: Double);
    function GetPercentualDeDesconto: Double;
    procedure SetPercentualDeDesconto(const APercentualDeDesconto: Double);
    function GetValorTotalDevolvido: Double;
    procedure SetValorTotalDevolvido(const AValorTotalDevolvido: Double);
    function GetMotivoDaDevolucaoId: Int64;
    procedure SetMotivoDaDevolucaoId(const AMotivoDaDevolucaoId: Int64);
  public
    property Id: Int64 read GetId write SetId;
    property ProdutoId: Int64 read GetProdutoId write SetProdutoId;
    property VendedorId: Int64 read GetVendedorId write SetVendedorId;
    property QuantidadeDeItensNoCupom: Double read GetQuantidadeDeItensNoCupom write SetQuantidadeDeItensNoCupom;
    property QuantidadeDeItensDevolvidos: Double read GetQuantidadeDeItensDevolvidos write SetQuantidadeDeItensDevolvidos;
    property NumeroDeSerie: TString read GetNumeroDeSerie write SetNumeroDeSerie;
    property ValorUnitario: Double read GetValorUnitario write SetValorUnitario;
    property PercentualDeAcrescimo: Double read GetPercentualDeAcrescimo write SetPercentualDeAcrescimo;
    property PercentualDeDesconto: Double read GetPercentualDeDesconto write SetPercentualDeDesconto;
    property ValorTotalDevolvido: Double read GetValorTotalDevolvido write SetValorTotalDevolvido;
    property MotivoDaDevolucaoId: Int64 read GetMotivoDaDevolucaoId write SetMotivoDaDevolucaoId;
  end;

implementation

{ TItemDevolucaoDeCupomList }

procedure TItemDevolucaoDeCupomList.Add(const AItemDevolucaoDeCupom: IItemDevolucaoDeCupom);
begin
  FList.Add(AItemDevolucaoDeCupom);
end;

procedure TItemDevolucaoDeCupomList.Clear;
begin
  FList.Clear;
end;

function TItemDevolucaoDeCupomList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TItemDevolucaoDeCupomList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TItemDevolucaoDeCupomList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TItemDevolucaoDeCupomList.GetEnumerator: TItemDevolucaoDeCupomListEnumerator;
begin
  Result := TItemDevolucaoDeCupomListEnumerator.Create(Self);
end;

function TItemDevolucaoDeCupomList.GetItems(AIndex: Integer): IItemDevolucaoDeCupom;
begin
  Result := FList[AIndex] as IItemDevolucaoDeCupom;
end;

function TItemDevolucaoDeCupomList.GetReference: TItemDevolucaoDeCupomList;
begin
  Result := Self;
end;

procedure TItemDevolucaoDeCupomList.SetItems(AIndex: Integer; const Value: IItemDevolucaoDeCupom);
begin
  FList[AIndex] := Value;
end;

{ TItemDevolucaoDeCupomListEnumerator }

constructor TItemDevolucaoDeCupomListEnumerator.Create(AItemDevolucaoDeCupomList: TItemDevolucaoDeCupomList);
begin
  inherited Create;
  FIndex := -1;
  FItemDevolucaoDeCupomList := AItemDevolucaoDeCupomList;
end;

function TItemDevolucaoDeCupomListEnumerator.GetCurrent: IItemDevolucaoDeCupom;
begin
  Result := FItemDevolucaoDeCupomList[FIndex];
end;

function TItemDevolucaoDeCupomListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FItemDevolucaoDeCupomList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TItemDevolucaoDeCupomListRec }

class function TItemDevolucaoDeCupomListRec.Create(const AList: IItemDevolucaoDeCupomList): TItemDevolucaoDeCupomListRec;
begin
  FillChar(Result, SizeOf(TItemDevolucaoDeCupomListRec), 0);
  Result.FList := AList;
end;

class operator TItemDevolucaoDeCupomListRec.Implicit(AListRec: TItemDevolucaoDeCupomListRec): TItemDevolucaoDeCupomList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TItemDevolucaoDeCupom }

function TItemDevolucaoDeCupom.GetId: Int64;
begin
  Result := FId;
end;

procedure TItemDevolucaoDeCupom.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TItemDevolucaoDeCupom.GetProdutoId: Int64;
begin
  Result := FProdutoId;
end;

procedure TItemDevolucaoDeCupom.SetProdutoId(const AProdutoId: Int64);
begin
  FProdutoId := AProdutoId;
end;

function TItemDevolucaoDeCupom.GetVendedorId: Int64;
begin
  Result := FVendedorId;
end;

procedure TItemDevolucaoDeCupom.SetVendedorId(const AVendedorId: Int64);
begin
  FVendedorId := AVendedorId;
end;

function TItemDevolucaoDeCupom.GetQuantidadeDeItensNoCupom: Double;
begin
  Result := FQuantidadeDeItensNoCupom;
end;

procedure TItemDevolucaoDeCupom.SetQuantidadeDeItensNoCupom(const AQuantidadeDeItensNoCupom: Double);
begin
  FQuantidadeDeItensNoCupom := AQuantidadeDeItensNoCupom;
end;

function TItemDevolucaoDeCupom.GetQuantidadeDeItensDevolvidos: Double;
begin
  Result := FQuantidadeDeItensDevolvidos;
end;

procedure TItemDevolucaoDeCupom.SetQuantidadeDeItensDevolvidos(const AQuantidadeDeItensDevolvidos: Double);
begin
  FQuantidadeDeItensDevolvidos := AQuantidadeDeItensDevolvidos;
end;

function TItemDevolucaoDeCupom.GetNumeroDeSerie: TString;
begin
  Result := FNumeroDeSerie;
end;

procedure TItemDevolucaoDeCupom.SetNumeroDeSerie(const ANumeroDeSerie: TString);
begin
  FNumeroDeSerie := ANumeroDeSerie;
end;

function TItemDevolucaoDeCupom.GetValorUnitario: Double;
begin
  Result := FValorUnitario;
end;

procedure TItemDevolucaoDeCupom.SetValorUnitario(const AValorUnitario: Double);
begin
  FValorUnitario := AValorUnitario;
end;

function TItemDevolucaoDeCupom.GetPercentualDeAcrescimo: Double;
begin
  Result := FPercentualDeAcrescimo;
end;

procedure TItemDevolucaoDeCupom.SetPercentualDeAcrescimo(const APercentualDeAcrescimo: Double);
begin
  FPercentualDeAcrescimo := APercentualDeAcrescimo;
end;

function TItemDevolucaoDeCupom.GetPercentualDeDesconto: Double;
begin
  Result := FPercentualDeDesconto;
end;

procedure TItemDevolucaoDeCupom.SetPercentualDeDesconto(const APercentualDeDesconto: Double);
begin
  FPercentualDeDesconto := APercentualDeDesconto;
end;

function TItemDevolucaoDeCupom.GetValorTotalDevolvido: Double;
begin
  Result := FValorTotalDevolvido;
end;

procedure TItemDevolucaoDeCupom.SetValorTotalDevolvido(const AValorTotalDevolvido: Double);
begin
  FValorTotalDevolvido := AValorTotalDevolvido;
end;

function TItemDevolucaoDeCupom.GetMotivoDaDevolucaoId: Int64;
begin
  Result := FMotivoDaDevolucaoId;
end;

procedure TItemDevolucaoDeCupom.SetMotivoDaDevolucaoId(const AMotivoDaDevolucaoId: Int64);
begin
  FMotivoDaDevolucaoId := AMotivoDaDevolucaoId;
end;


end.
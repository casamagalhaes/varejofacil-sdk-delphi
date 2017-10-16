unit SDK.Model.VendaCasada;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IVendaCasada = interface(IModel)
    ['{29440A2A-47A3-4631-B324-94BD92FE8DBB}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetDataInicial: TDateTime;
    procedure SetDataInicial(const ADataInicial: TDateTime);
    function GetDataFim: TDateTime;
    procedure SetDataFim(const ADataFim: TDateTime);
    function GetQuantidadeProdutoPrincipal: Double;
    procedure SetQuantidadeProdutoPrincipal(const AQuantidadeProdutoPrincipal: Double);
    function GetQuantidadeProdutoPromocional: Double;
    procedure SetQuantidadeProdutoPromocional(const AQuantidadeProdutoPromocional: Double);
    function GetValorUnitarioProdutoPromocional: Double;
    procedure SetValorUnitarioProdutoPromocional(const AValorUnitarioProdutoPromocional: Double);
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property DataInicial: TDateTime read GetDataInicial write SetDataInicial;
    property DataFim: TDateTime read GetDataFim write SetDataFim;
    property QuantidadeProdutoPrincipal: Double read GetQuantidadeProdutoPrincipal write SetQuantidadeProdutoPrincipal;
    property QuantidadeProdutoPromocional: Double read GetQuantidadeProdutoPromocional write SetQuantidadeProdutoPromocional;
    property ValorUnitarioProdutoPromocional: Double read GetValorUnitarioProdutoPromocional write SetValorUnitarioProdutoPromocional;
  end;

  TVendaCasadaList = class;

  IVendaCasadaList = interface
	['{A8132275-BA84-43FB-BAF0-58FB4F9981C6}']
    function GetReference: TVendaCasadaList;
    function GetItems(AIndex: Integer): IVendaCasada;
    procedure SetItems(AIndex: Integer; const Value: IVendaCasada);
    procedure Add(const AVendaCasada: IVendaCasada);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IVendaCasada read GetItems write SetItems; default;
  end;

  TVendaCasadaListEnumerator = class
  private
    FIndex: Integer;
    FVendaCasadaList: TVendaCasadaList;
  public
    constructor Create(AVendaCasadaList: TVendaCasadaList);
    function GetCurrent: IVendaCasada; inline;
    function MoveNext: Boolean;
    property Current: IVendaCasada read GetCurrent;
  end;

  TVendaCasadaList = class(TInterfacedObject, IVendaCasadaList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IVendaCasada;
    procedure SetItems(AIndex: Integer; const Value: IVendaCasada);
  public
    constructor Create;
    procedure Add(const AVendaCasada: IVendaCasada);
    destructor Destroy; override;
    function GetEnumerator: TVendaCasadaListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TVendaCasadaList;
    property Items[AIndex: Integer]: IVendaCasada read GetItems write SetItems; default;
  end;

  TVendaCasadaListRec = record
  private
    FList: IVendaCasadaList;
  public
    class function Create(const AList: IVendaCasadaList): TVendaCasadaListRec; static;
    class operator Implicit(AListRec: TVendaCasadaListRec): TVendaCasadaList;
  end;

  TVendaCasada = class(TInterfacedModel, IVendaCasada)
  private
	FId: Int64;
	FDescricao: TString;
	FDataInicial: TDateTime;
	FDataFim: TDateTime;
	FQuantidadeProdutoPrincipal: Double;
	FQuantidadeProdutoPromocional: Double;
	FValorUnitarioProdutoPromocional: Double;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetDataInicial: TDateTime;
    procedure SetDataInicial(const ADataInicial: TDateTime);
    function GetDataFim: TDateTime;
    procedure SetDataFim(const ADataFim: TDateTime);
    function GetQuantidadeProdutoPrincipal: Double;
    procedure SetQuantidadeProdutoPrincipal(const AQuantidadeProdutoPrincipal: Double);
    function GetQuantidadeProdutoPromocional: Double;
    procedure SetQuantidadeProdutoPromocional(const AQuantidadeProdutoPromocional: Double);
    function GetValorUnitarioProdutoPromocional: Double;
    procedure SetValorUnitarioProdutoPromocional(const AValorUnitarioProdutoPromocional: Double);
  public
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property DataInicial: TDateTime read GetDataInicial write SetDataInicial;
    property DataFim: TDateTime read GetDataFim write SetDataFim;
    property QuantidadeProdutoPrincipal: Double read GetQuantidadeProdutoPrincipal write SetQuantidadeProdutoPrincipal;
    property QuantidadeProdutoPromocional: Double read GetQuantidadeProdutoPromocional write SetQuantidadeProdutoPromocional;
    property ValorUnitarioProdutoPromocional: Double read GetValorUnitarioProdutoPromocional write SetValorUnitarioProdutoPromocional;
  end;

implementation

{ TVendaCasadaList }

procedure TVendaCasadaList.Add(const AVendaCasada: IVendaCasada);
begin
  FList.Add(AVendaCasada);
end;

procedure TVendaCasadaList.Clear;
begin
  FList.Clear;
end;

function TVendaCasadaList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TVendaCasadaList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TVendaCasadaList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TVendaCasadaList.GetEnumerator: TVendaCasadaListEnumerator;
begin
  Result := TVendaCasadaListEnumerator.Create(Self);
end;

function TVendaCasadaList.GetItems(AIndex: Integer): IVendaCasada;
begin
  Result := FList[AIndex] as IVendaCasada;
end;

function TVendaCasadaList.GetReference: TVendaCasadaList;
begin
  Result := Self;
end;

procedure TVendaCasadaList.SetItems(AIndex: Integer; const Value: IVendaCasada);
begin
  FList[AIndex] := Value;
end;

{ TVendaCasadaListEnumerator }

constructor TVendaCasadaListEnumerator.Create(AVendaCasadaList: TVendaCasadaList);
begin
  inherited Create;
  FIndex := -1;
  FVendaCasadaList := AVendaCasadaList;
end;

function TVendaCasadaListEnumerator.GetCurrent: IVendaCasada;
begin
  Result := FVendaCasadaList[FIndex];
end;

function TVendaCasadaListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FVendaCasadaList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TVendaCasadaListRec }

class function TVendaCasadaListRec.Create(const AList: IVendaCasadaList): TVendaCasadaListRec;
begin
  FillChar(Result, SizeOf(TVendaCasadaListRec), 0);
  Result.FList := AList;
end;

class operator TVendaCasadaListRec.Implicit(AListRec: TVendaCasadaListRec): TVendaCasadaList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TVendaCasada }

function TVendaCasada.GetId: Int64;
begin
  Result := FId;
end;

procedure TVendaCasada.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TVendaCasada.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TVendaCasada.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

function TVendaCasada.GetDataInicial: TDateTime;
begin
  Result := FDataInicial;
end;

procedure TVendaCasada.SetDataInicial(const ADataInicial: TDateTime);
begin
  FDataInicial := ADataInicial;
end;

function TVendaCasada.GetDataFim: TDateTime;
begin
  Result := FDataFim;
end;

procedure TVendaCasada.SetDataFim(const ADataFim: TDateTime);
begin
  FDataFim := ADataFim;
end;

function TVendaCasada.GetQuantidadeProdutoPrincipal: Double;
begin
  Result := FQuantidadeProdutoPrincipal;
end;

procedure TVendaCasada.SetQuantidadeProdutoPrincipal(const AQuantidadeProdutoPrincipal: Double);
begin
  FQuantidadeProdutoPrincipal := AQuantidadeProdutoPrincipal;
end;

function TVendaCasada.GetQuantidadeProdutoPromocional: Double;
begin
  Result := FQuantidadeProdutoPromocional;
end;

procedure TVendaCasada.SetQuantidadeProdutoPromocional(const AQuantidadeProdutoPromocional: Double);
begin
  FQuantidadeProdutoPromocional := AQuantidadeProdutoPromocional;
end;

function TVendaCasada.GetValorUnitarioProdutoPromocional: Double;
begin
  Result := FValorUnitarioProdutoPromocional;
end;

procedure TVendaCasada.SetValorUnitarioProdutoPromocional(const AValorUnitarioProdutoPromocional: Double);
begin
  FValorUnitarioProdutoPromocional := AValorUnitarioProdutoPromocional;
end;


end.
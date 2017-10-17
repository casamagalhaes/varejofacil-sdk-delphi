unit SDK.Model.PreAutorizacaoLiquidacao;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums, SDK.Model.PreAutorizacaoFormaDePagamento;

type

  IPreAutorizacaoLiquidacao = interface(IModel)
    ['{05727BCC-EDEC-4970-B2AC-595928A62FB4}']
    function GetDataConsulta: TDateTime;
    procedure SetDataConsulta(const ADataConsulta: TDateTime);
    function GetData: TDateTime;
    procedure SetData(const AData: TDateTime);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetCaixa: TString;
    procedure SetCaixa(const ACaixa: TString);
    function GetOperador: Int64;
    procedure SetOperador(const AOperador: Int64);
    function GetClienteId: Int64;
    procedure SetClienteId(const AClienteId: Int64);
    function GetTitulosId: TLongList;
    procedure SetTitulosId(const ATitulosId: TLongList);
    function GetFormaPagamento: TPreAutorizacaoFormaDePagamentoList;
    procedure SetFormaPagamento(const AFormaPagamento: TPreAutorizacaoFormaDePagamentoList);
    property DataConsulta: TDateTime read GetDataConsulta write SetDataConsulta;
    property Data: TDateTime read GetData write SetData;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property Caixa: TString read GetCaixa write SetCaixa;
    property Operador: Int64 read GetOperador write SetOperador;
    property ClienteId: Int64 read GetClienteId write SetClienteId;
    property TitulosId: TLongList read GetTitulosId write SetTitulosId;
    property FormaPagamento: TPreAutorizacaoFormaDePagamentoList read GetFormaPagamento write SetFormaPagamento;
  end;

  TPreAutorizacaoLiquidacaoList = class;

  IPreAutorizacaoLiquidacaoList = interface
	['{AE12D9B2-B760-45C1-A02F-49662E18AA4D}']
    function GetReference: TPreAutorizacaoLiquidacaoList;
    function GetItems(AIndex: Integer): IPreAutorizacaoLiquidacao;
    procedure SetItems(AIndex: Integer; const Value: IPreAutorizacaoLiquidacao);
    procedure Add(const APreAutorizacaoLiquidacao: IPreAutorizacaoLiquidacao);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IPreAutorizacaoLiquidacao read GetItems write SetItems; default;
  end;

  TPreAutorizacaoLiquidacaoListEnumerator = class
  private
    FIndex: Integer;
    FPreAutorizacaoLiquidacaoList: TPreAutorizacaoLiquidacaoList;
  public
    constructor Create(APreAutorizacaoLiquidacaoList: TPreAutorizacaoLiquidacaoList);
    function GetCurrent: IPreAutorizacaoLiquidacao; inline;
    function MoveNext: Boolean;
    property Current: IPreAutorizacaoLiquidacao read GetCurrent;
  end;

  TPreAutorizacaoLiquidacaoList = class(TInterfacedObject, IPreAutorizacaoLiquidacaoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IPreAutorizacaoLiquidacao;
    procedure SetItems(AIndex: Integer; const Value: IPreAutorizacaoLiquidacao);
  public
    constructor Create;
    procedure Add(const APreAutorizacaoLiquidacao: IPreAutorizacaoLiquidacao);
    destructor Destroy; override;
    function GetEnumerator: TPreAutorizacaoLiquidacaoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TPreAutorizacaoLiquidacaoList;
    property Items[AIndex: Integer]: IPreAutorizacaoLiquidacao read GetItems write SetItems; default;
  end;

  TPreAutorizacaoLiquidacaoListRec = record
  private
    FList: IPreAutorizacaoLiquidacaoList;
  public
    class function Create(const AList: IPreAutorizacaoLiquidacaoList): TPreAutorizacaoLiquidacaoListRec; static;
    class operator Implicit(AListRec: TPreAutorizacaoLiquidacaoListRec): TPreAutorizacaoLiquidacaoList;
  end;

  TPreAutorizacaoLiquidacao = class(TInterfacedModel, IPreAutorizacaoLiquidacao)
  private
	FDataConsulta: TDateTime;
	FData: TDateTime;
	FLojaId: Int64;
	FCaixa: TString;
	FOperador: Int64;
	FClienteId: Int64;
	FTitulosId: TLongList;
	FFormaPagamento: TPreAutorizacaoFormaDePagamentoList;
    function GetDataConsulta: TDateTime;
    procedure SetDataConsulta(const ADataConsulta: TDateTime);
    function GetData: TDateTime;
    procedure SetData(const AData: TDateTime);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetCaixa: TString;
    procedure SetCaixa(const ACaixa: TString);
    function GetOperador: Int64;
    procedure SetOperador(const AOperador: Int64);
    function GetClienteId: Int64;
    procedure SetClienteId(const AClienteId: Int64);
    function GetTitulosId: TLongList;
    procedure SetTitulosId(const ATitulosId: TLongList);
    function GetFormaPagamento: TPreAutorizacaoFormaDePagamentoList;
    procedure SetFormaPagamento(const AFormaPagamento: TPreAutorizacaoFormaDePagamentoList);
  published
    property DataConsulta: TDateTime read GetDataConsulta write SetDataConsulta;
    property Data: TDateTime read GetData write SetData;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property Caixa: TString read GetCaixa write SetCaixa;
    property Operador: Int64 read GetOperador write SetOperador;
    property ClienteId: Int64 read GetClienteId write SetClienteId;
    property TitulosId: TLongList read GetTitulosId write SetTitulosId;
    property FormaPagamento: TPreAutorizacaoFormaDePagamentoList read GetFormaPagamento write SetFormaPagamento;
  end;

implementation

{ TPreAutorizacaoLiquidacaoList }

procedure TPreAutorizacaoLiquidacaoList.Add(const APreAutorizacaoLiquidacao: IPreAutorizacaoLiquidacao);
begin
  FList.Add(APreAutorizacaoLiquidacao);
end;

procedure TPreAutorizacaoLiquidacaoList.Clear;
begin
  FList.Clear;
end;

function TPreAutorizacaoLiquidacaoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TPreAutorizacaoLiquidacaoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TPreAutorizacaoLiquidacaoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TPreAutorizacaoLiquidacaoList.GetEnumerator: TPreAutorizacaoLiquidacaoListEnumerator;
begin
  Result := TPreAutorizacaoLiquidacaoListEnumerator.Create(Self);
end;

function TPreAutorizacaoLiquidacaoList.GetItems(AIndex: Integer): IPreAutorizacaoLiquidacao;
begin
  Result := FList[AIndex] as IPreAutorizacaoLiquidacao;
end;

function TPreAutorizacaoLiquidacaoList.GetReference: TPreAutorizacaoLiquidacaoList;
begin
  Result := Self;
end;

procedure TPreAutorizacaoLiquidacaoList.SetItems(AIndex: Integer; const Value: IPreAutorizacaoLiquidacao);
begin
  FList[AIndex] := Value;
end;

{ TPreAutorizacaoLiquidacaoListEnumerator }

constructor TPreAutorizacaoLiquidacaoListEnumerator.Create(APreAutorizacaoLiquidacaoList: TPreAutorizacaoLiquidacaoList);
begin
  inherited Create;
  FIndex := -1;
  FPreAutorizacaoLiquidacaoList := APreAutorizacaoLiquidacaoList;
end;

function TPreAutorizacaoLiquidacaoListEnumerator.GetCurrent: IPreAutorizacaoLiquidacao;
begin
  Result := FPreAutorizacaoLiquidacaoList[FIndex];
end;

function TPreAutorizacaoLiquidacaoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FPreAutorizacaoLiquidacaoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TPreAutorizacaoLiquidacaoListRec }

class function TPreAutorizacaoLiquidacaoListRec.Create(const AList: IPreAutorizacaoLiquidacaoList): TPreAutorizacaoLiquidacaoListRec;
begin
  FillChar(Result, SizeOf(TPreAutorizacaoLiquidacaoListRec), 0);
  Result.FList := AList;
end;

class operator TPreAutorizacaoLiquidacaoListRec.Implicit(AListRec: TPreAutorizacaoLiquidacaoListRec): TPreAutorizacaoLiquidacaoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TPreAutorizacaoLiquidacao }

function TPreAutorizacaoLiquidacao.GetDataConsulta: TDateTime;
begin
  Result := FDataConsulta;
end;

procedure TPreAutorizacaoLiquidacao.SetDataConsulta(const ADataConsulta: TDateTime);
begin
  FDataConsulta := ADataConsulta;
end;

function TPreAutorizacaoLiquidacao.GetData: TDateTime;
begin
  Result := FData;
end;

procedure TPreAutorizacaoLiquidacao.SetData(const AData: TDateTime);
begin
  FData := AData;
end;

function TPreAutorizacaoLiquidacao.GetLojaId: Int64;
begin
  Result := FLojaId;
end;

procedure TPreAutorizacaoLiquidacao.SetLojaId(const ALojaId: Int64);
begin
  FLojaId := ALojaId;
end;

function TPreAutorizacaoLiquidacao.GetCaixa: TString;
begin
  Result := FCaixa;
end;

procedure TPreAutorizacaoLiquidacao.SetCaixa(const ACaixa: TString);
begin
  FCaixa := ACaixa;
end;

function TPreAutorizacaoLiquidacao.GetOperador: Int64;
begin
  Result := FOperador;
end;

procedure TPreAutorizacaoLiquidacao.SetOperador(const AOperador: Int64);
begin
  FOperador := AOperador;
end;

function TPreAutorizacaoLiquidacao.GetClienteId: Int64;
begin
  Result := FClienteId;
end;

procedure TPreAutorizacaoLiquidacao.SetClienteId(const AClienteId: Int64);
begin
  FClienteId := AClienteId;
end;

function TPreAutorizacaoLiquidacao.GetTitulosId: TLongList;
begin
  Result := FTitulosId;
end;

procedure TPreAutorizacaoLiquidacao.SetTitulosId(const ATitulosId: TLongList);
begin
  FTitulosId := ATitulosId;
end;

function TPreAutorizacaoLiquidacao.GetFormaPagamento: TPreAutorizacaoFormaDePagamentoList;
begin
  Result := FFormaPagamento;
end;

procedure TPreAutorizacaoLiquidacao.SetFormaPagamento(const AFormaPagamento: TPreAutorizacaoFormaDePagamentoList);
begin
  FFormaPagamento := AFormaPagamento;
end;


end.
unit SDK.Model.ComprovanteTransacao;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IComprovanteTransacao = interface(IModel)
    ['{4499BAEA-C105-4880-9148-8FFAF1ABB232}']
    function GetNsu: TString;
    procedure SetNsu(const ANsu: TString);
    function GetViaDoCliente: TString;
    procedure SetViaDoCliente(const AViaDoCliente: TString);
    function GetViaDaLoja: TString;
    procedure SetViaDaLoja(const AViaDaLoja: TString);
    property Nsu: TString read GetNsu write SetNsu;
    property ViaDoCliente: TString read GetViaDoCliente write SetViaDoCliente;
    property ViaDaLoja: TString read GetViaDaLoja write SetViaDaLoja;
  end;

  TComprovanteTransacaoList = class;

  IComprovanteTransacaoList = interface
	['{990A3D46-140F-438A-B4D2-CF585A44B4AD}']
    function GetReference: TComprovanteTransacaoList;
    function GetItems(AIndex: Integer): IComprovanteTransacao;
    procedure SetItems(AIndex: Integer; const Value: IComprovanteTransacao);
    procedure Add(const AComprovanteTransacao: IComprovanteTransacao);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IComprovanteTransacao read GetItems write SetItems; default;
  end;

  TComprovanteTransacaoListEnumerator = class
  private
    FIndex: Integer;
    FComprovanteTransacaoList: TComprovanteTransacaoList;
  public
    constructor Create(AComprovanteTransacaoList: TComprovanteTransacaoList);
    function GetCurrent: IComprovanteTransacao; inline;
    function MoveNext: Boolean;
    property Current: IComprovanteTransacao read GetCurrent;
  end;

  TComprovanteTransacaoList = class(TInterfacedObject, IComprovanteTransacaoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IComprovanteTransacao;
    procedure SetItems(AIndex: Integer; const Value: IComprovanteTransacao);
  public
    constructor Create;
    procedure Add(const AComprovanteTransacao: IComprovanteTransacao);
    destructor Destroy; override;
    function GetEnumerator: TComprovanteTransacaoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TComprovanteTransacaoList;
    property Items[AIndex: Integer]: IComprovanteTransacao read GetItems write SetItems; default;
  end;

  TComprovanteTransacaoListRec = record
  private
    FList: IComprovanteTransacaoList;
  public
    class function Create(const AList: IComprovanteTransacaoList): TComprovanteTransacaoListRec; static;
    class operator Implicit(AListRec: TComprovanteTransacaoListRec): TComprovanteTransacaoList;
  end;

  TComprovanteTransacao = class(TInterfacedModel, IComprovanteTransacao)
  private
	FNsu: TString;
	FViaDoCliente: TString;
	FViaDaLoja: TString;
    function GetNsu: TString;
    procedure SetNsu(const ANsu: TString);
    function GetViaDoCliente: TString;
    procedure SetViaDoCliente(const AViaDoCliente: TString);
    function GetViaDaLoja: TString;
    procedure SetViaDaLoja(const AViaDaLoja: TString);
  public
    property Nsu: TString read GetNsu write SetNsu;
    property ViaDoCliente: TString read GetViaDoCliente write SetViaDoCliente;
    property ViaDaLoja: TString read GetViaDaLoja write SetViaDaLoja;
  end;

implementation

{ TComprovanteTransacaoList }

procedure TComprovanteTransacaoList.Add(const AComprovanteTransacao: IComprovanteTransacao);
begin
  FList.Add(AComprovanteTransacao);
end;

procedure TComprovanteTransacaoList.Clear;
begin
  FList.Clear;
end;

function TComprovanteTransacaoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TComprovanteTransacaoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TComprovanteTransacaoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TComprovanteTransacaoList.GetEnumerator: TComprovanteTransacaoListEnumerator;
begin
  Result := TComprovanteTransacaoListEnumerator.Create(Self);
end;

function TComprovanteTransacaoList.GetItems(AIndex: Integer): IComprovanteTransacao;
begin
  Result := FList[AIndex] as IComprovanteTransacao;
end;

function TComprovanteTransacaoList.GetReference: TComprovanteTransacaoList;
begin
  Result := Self;
end;

procedure TComprovanteTransacaoList.SetItems(AIndex: Integer; const Value: IComprovanteTransacao);
begin
  FList[AIndex] := Value;
end;

{ TComprovanteTransacaoListEnumerator }

constructor TComprovanteTransacaoListEnumerator.Create(AComprovanteTransacaoList: TComprovanteTransacaoList);
begin
  inherited Create;
  FIndex := -1;
  FComprovanteTransacaoList := AComprovanteTransacaoList;
end;

function TComprovanteTransacaoListEnumerator.GetCurrent: IComprovanteTransacao;
begin
  Result := FComprovanteTransacaoList[FIndex];
end;

function TComprovanteTransacaoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FComprovanteTransacaoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TComprovanteTransacaoListRec }

class function TComprovanteTransacaoListRec.Create(const AList: IComprovanteTransacaoList): TComprovanteTransacaoListRec;
begin
  FillChar(Result, SizeOf(TComprovanteTransacaoListRec), 0);
  Result.FList := AList;
end;

class operator TComprovanteTransacaoListRec.Implicit(AListRec: TComprovanteTransacaoListRec): TComprovanteTransacaoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TComprovanteTransacao }

function TComprovanteTransacao.GetNsu: TString;
begin
  Result := FNsu;
end;

procedure TComprovanteTransacao.SetNsu(const ANsu: TString);
begin
  FNsu := ANsu;
end;

function TComprovanteTransacao.GetViaDoCliente: TString;
begin
  Result := FViaDoCliente;
end;

procedure TComprovanteTransacao.SetViaDoCliente(const AViaDoCliente: TString);
begin
  FViaDoCliente := AViaDoCliente;
end;

function TComprovanteTransacao.GetViaDaLoja: TString;
begin
  Result := FViaDaLoja;
end;

procedure TComprovanteTransacao.SetViaDaLoja(const AViaDaLoja: TString);
begin
  FViaDaLoja := AViaDaLoja;
end;


end.
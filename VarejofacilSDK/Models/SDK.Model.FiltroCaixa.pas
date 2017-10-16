unit SDK.Model.FiltroCaixa;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IFiltroCaixa = interface(IModel)
    ['{357C90BC-D816-487B-8930-C70C32BFCFC4}']
    function GetCliente: Int64;
    procedure SetCliente(const ACliente: Int64);
    function GetDocumento: TString;
    procedure SetDocumento(const ADocumento: TString);
    function GetCartao: TString;
    procedure SetCartao(const ACartao: TString);
    function GetLoja: Int64;
    procedure SetLoja(const ALoja: Int64);
    function GetOperador: Int64;
    procedure SetOperador(const AOperador: Int64);
    function GetCaixa: TString;
    procedure SetCaixa(const ACaixa: TString);
    property Cliente: Int64 read GetCliente write SetCliente;
    property Documento: TString read GetDocumento write SetDocumento;
    property Cartao: TString read GetCartao write SetCartao;
    property Loja: Int64 read GetLoja write SetLoja;
    property Operador: Int64 read GetOperador write SetOperador;
    property Caixa: TString read GetCaixa write SetCaixa;
  end;

  TFiltroCaixaList = class;

  IFiltroCaixaList = interface
	['{114DC5DC-07F8-4C2D-84FB-EE1AB8EC5C6C}']
    function GetReference: TFiltroCaixaList;
    function GetItems(AIndex: Integer): IFiltroCaixa;
    procedure SetItems(AIndex: Integer; const Value: IFiltroCaixa);
    procedure Add(const AFiltroCaixa: IFiltroCaixa);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IFiltroCaixa read GetItems write SetItems; default;
  end;

  TFiltroCaixaListEnumerator = class
  private
    FIndex: Integer;
    FFiltroCaixaList: TFiltroCaixaList;
  public
    constructor Create(AFiltroCaixaList: TFiltroCaixaList);
    function GetCurrent: IFiltroCaixa; inline;
    function MoveNext: Boolean;
    property Current: IFiltroCaixa read GetCurrent;
  end;

  TFiltroCaixaList = class(TInterfacedObject, IFiltroCaixaList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IFiltroCaixa;
    procedure SetItems(AIndex: Integer; const Value: IFiltroCaixa);
  public
    constructor Create;
    procedure Add(const AFiltroCaixa: IFiltroCaixa);
    destructor Destroy; override;
    function GetEnumerator: TFiltroCaixaListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TFiltroCaixaList;
    property Items[AIndex: Integer]: IFiltroCaixa read GetItems write SetItems; default;
  end;

  TFiltroCaixaListRec = record
  private
    FList: IFiltroCaixaList;
  public
    class function Create(const AList: IFiltroCaixaList): TFiltroCaixaListRec; static;
    class operator Implicit(AListRec: TFiltroCaixaListRec): TFiltroCaixaList;
  end;

  TFiltroCaixa = class(TInterfacedModel, IFiltroCaixa)
  private
	FCliente: Int64;
	FDocumento: TString;
	FCartao: TString;
	FLoja: Int64;
	FOperador: Int64;
	FCaixa: TString;
    function GetCliente: Int64;
    procedure SetCliente(const ACliente: Int64);
    function GetDocumento: TString;
    procedure SetDocumento(const ADocumento: TString);
    function GetCartao: TString;
    procedure SetCartao(const ACartao: TString);
    function GetLoja: Int64;
    procedure SetLoja(const ALoja: Int64);
    function GetOperador: Int64;
    procedure SetOperador(const AOperador: Int64);
    function GetCaixa: TString;
    procedure SetCaixa(const ACaixa: TString);
  public
    property Cliente: Int64 read GetCliente write SetCliente;
    property Documento: TString read GetDocumento write SetDocumento;
    property Cartao: TString read GetCartao write SetCartao;
    property Loja: Int64 read GetLoja write SetLoja;
    property Operador: Int64 read GetOperador write SetOperador;
    property Caixa: TString read GetCaixa write SetCaixa;
  end;

implementation

{ TFiltroCaixaList }

procedure TFiltroCaixaList.Add(const AFiltroCaixa: IFiltroCaixa);
begin
  FList.Add(AFiltroCaixa);
end;

procedure TFiltroCaixaList.Clear;
begin
  FList.Clear;
end;

function TFiltroCaixaList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TFiltroCaixaList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TFiltroCaixaList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TFiltroCaixaList.GetEnumerator: TFiltroCaixaListEnumerator;
begin
  Result := TFiltroCaixaListEnumerator.Create(Self);
end;

function TFiltroCaixaList.GetItems(AIndex: Integer): IFiltroCaixa;
begin
  Result := FList[AIndex] as IFiltroCaixa;
end;

function TFiltroCaixaList.GetReference: TFiltroCaixaList;
begin
  Result := Self;
end;

procedure TFiltroCaixaList.SetItems(AIndex: Integer; const Value: IFiltroCaixa);
begin
  FList[AIndex] := Value;
end;

{ TFiltroCaixaListEnumerator }

constructor TFiltroCaixaListEnumerator.Create(AFiltroCaixaList: TFiltroCaixaList);
begin
  inherited Create;
  FIndex := -1;
  FFiltroCaixaList := AFiltroCaixaList;
end;

function TFiltroCaixaListEnumerator.GetCurrent: IFiltroCaixa;
begin
  Result := FFiltroCaixaList[FIndex];
end;

function TFiltroCaixaListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FFiltroCaixaList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TFiltroCaixaListRec }

class function TFiltroCaixaListRec.Create(const AList: IFiltroCaixaList): TFiltroCaixaListRec;
begin
  FillChar(Result, SizeOf(TFiltroCaixaListRec), 0);
  Result.FList := AList;
end;

class operator TFiltroCaixaListRec.Implicit(AListRec: TFiltroCaixaListRec): TFiltroCaixaList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TFiltroCaixa }

function TFiltroCaixa.GetCliente: Int64;
begin
  Result := FCliente;
end;

procedure TFiltroCaixa.SetCliente(const ACliente: Int64);
begin
  FCliente := ACliente;
end;

function TFiltroCaixa.GetDocumento: TString;
begin
  Result := FDocumento;
end;

procedure TFiltroCaixa.SetDocumento(const ADocumento: TString);
begin
  FDocumento := ADocumento;
end;

function TFiltroCaixa.GetCartao: TString;
begin
  Result := FCartao;
end;

procedure TFiltroCaixa.SetCartao(const ACartao: TString);
begin
  FCartao := ACartao;
end;

function TFiltroCaixa.GetLoja: Int64;
begin
  Result := FLoja;
end;

procedure TFiltroCaixa.SetLoja(const ALoja: Int64);
begin
  FLoja := ALoja;
end;

function TFiltroCaixa.GetOperador: Int64;
begin
  Result := FOperador;
end;

procedure TFiltroCaixa.SetOperador(const AOperador: Int64);
begin
  FOperador := AOperador;
end;

function TFiltroCaixa.GetCaixa: TString;
begin
  Result := FCaixa;
end;

procedure TFiltroCaixa.SetCaixa(const ACaixa: TString);
begin
  FCaixa := ACaixa;
end;


end.
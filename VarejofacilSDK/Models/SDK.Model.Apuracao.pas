unit SDK.Model.Apuracao;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IApuracao = interface(IModel)
    ['{1FDCCEE5-90FB-49C3-8100-A8F30141CC00}']
    function GetCodigoLoja: Int64;
    procedure SetCodigoLoja(const ACodigoLoja: Int64);
    function GetDocumentoLoja: TString;
    procedure SetDocumentoLoja(const ADocumentoLoja: TString);
    function GetCFOP: Int64;
    procedure SetCFOP(const ACFOP: Int64);
    function GetCST: TString;
    procedure SetCST(const ACST: TString);
    function GetAliquota: Double;
    procedure SetAliquota(const AAliquota: Double);
    function GetBaseDeCalculo: Double;
    procedure SetBaseDeCalculo(const ABaseDeCalculo: Double);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);

    property CodigoLoja: Int64 read GetCodigoLoja write SetCodigoLoja;
    property DocumentoLoja: TString read GetDocumentoLoja write SetDocumentoLoja;
    property CFOP: Int64 read GetCFOP write SetCFOP;
    property CST: TString read GetCST write SetCST;
    property Aliquota: Double read GetAliquota write SetAliquota;
    property BaseDeCalculo: Double read GetBaseDeCalculo write SetBaseDeCalculo;
    property Valor: Double read GetValor write SetValor;
  end;

  TApuracaoList = class;

  IApuracaoList = interface
    ['{C3B763DE-6A2F-4A5A-95C1-94FA87662A88}']
    function GetReference: TApuracaoList;
    function GetItems(AIndex: Integer): IApuracao;
    procedure SetItems(AIndex: Integer; const Value: IApuracao);
    procedure Add(const AApuracao: IApuracao);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IApuracao read GetItems write SetItems; default;
  end;

  TApuracaoListEnumerator = class
  private
    FIndex: Integer;
    FApuracaoList: TApuracaoList;
  public
    constructor Create(AApuracaoList: TApuracaoList);
    function GetCurrent: IApuracao; inline;
    function MoveNext: Boolean;
    property Current: IApuracao read GetCurrent;
  end;

  TApuracaoList = class(TInterfacedObject, IApuracaoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IApuracao;
    procedure SetItems(AIndex: Integer; const Value: IApuracao);
  public
    constructor Create;
    procedure Add(const AApuracao: IApuracao);
    destructor Destroy; override;
    function GetEnumerator: TApuracaoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TApuracaoList;
    property Items[AIndex: Integer]: IApuracao read GetItems write SetItems; default;
  end;

  TApuracaoListRec = record
  private
    FList: IApuracaoList;
  public
    class function Create(const AList: IApuracaoList): TApuracaoListRec; static;
    class operator Implicit(AListRec: TApuracaoListRec): TApuracaoList;
  end;

  TApuracao = class(TInterfacedModel, IApuracao)
  private
    FCodigoLoja: Int64;
    FDocumentoLoja: TString;
    FCFOP: Int64;
    FCST: TString;
    FAliquota: Double;
    FBaseDeCalculo: Double;
    FValor: Double;
    function GetCodigoLoja: Int64;
    procedure SetCodigoLoja(const ACodigoLoja: Int64);
    function GetDocumentoLoja: TString;
    procedure SetDocumentoLoja(const ADocumentoLoja: TString);
    function GetCFOP: Int64;
    procedure SetCFOP(const ACFOP: Int64);
    function GetCST: TString;
    procedure SetCST(const ACST: TString);
    function GetAliquota: Double;
    procedure SetAliquota(const AAliquota: Double);
    function GetBaseDeCalculo: Double;
    procedure SetBaseDeCalculo(const ABaseDeCalculo: Double);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
  published
    property CodigoLoja: Int64 read GetCodigoLoja write SetCodigoLoja;
    property DocumentoLoja: TString read GetDocumentoLoja write SetDocumentoLoja;
    property CFOP: Int64 read GetCFOP write SetCFOP;
    property CST: TString read GetCST write SetCST;
    property Aliquota: Double read GetAliquota write SetAliquota;
    property BaseDeCalculo: Double read GetBaseDeCalculo write SetBaseDeCalculo;
    property Valor: Double read GetValor write SetValor;
  end;

implementation

{ TApuracaoList }

procedure TApuracaoList.Add(const AApuracao: IApuracao);
begin
  FList.Add(AApuracao);
end;

procedure TApuracaoList.Clear;
begin
  FList.Clear;
end;

function TApuracaoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TApuracaoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TApuracaoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TApuracaoList.GetEnumerator: TApuracaoListEnumerator;
begin
  Result := TApuracaoListEnumerator.Create(Self);
end;

function TApuracaoList.GetItems(AIndex: Integer): IApuracao;
begin
  Result := FList[AIndex] as IApuracao;
end;

function TApuracaoList.GetReference: TApuracaoList;
begin
  Result := Self;
end;

procedure TApuracaoList.SetItems(AIndex: Integer; const Value: IApuracao);
begin
  FList[AIndex] := Value;
end;

{ TApuracaoListEnumerator }

constructor TApuracaoListEnumerator.Create(AApuracaoList: TApuracaoList);
begin
  inherited Create;
  FIndex := -1;
  FApuracaoList := AApuracaoList;
end;

function TApuracaoListEnumerator.GetCurrent: IApuracao;
begin
  Result := FApuracaoList[FIndex];
end;

function TApuracaoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FApuracaoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TApuracaoListRec }

class function TApuracaoListRec.Create(const AList: IApuracaoList): TApuracaoListRec;
begin
  FillChar(Result, SizeOf(TApuracaoListRec), 0);
  Result.FList := AList;
end;

class operator TApuracaoListRec.Implicit(AListRec: TApuracaoListRec): TApuracaoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TApuracao }

function TApuracao.GetAliquota: Double;
begin
  Result := FAliquota;
end;

function TApuracao.GetBaseDeCalculo: Double;
begin
  Result := FBaseDeCalculo;
end;

function TApuracao.GetCFOP: Int64;
begin
  Result := FCFOP;
end;

function TApuracao.GetCodigoLoja: Int64;
begin
  Result := FCodigoLoja;
end;

function TApuracao.GetCST: TString;
begin
  Result := FCST;
end;

function TApuracao.GetDocumentoLoja: TString;
begin
  Result := FDocumentoLoja;
end;

function TApuracao.GetValor: Double;
begin
  Result := FValor;
end;

procedure TApuracao.SetAliquota(const AAliquota: Double);
begin
  FAliquota := AAliquota;
end;

procedure TApuracao.SetBaseDeCalculo(const ABaseDeCalculo: Double);
begin
  FBaseDeCalculo := ABaseDeCalculo;
end;

procedure TApuracao.SetCFOP(const ACFOP: Int64);
begin
  FCFOP := ACFOP;
end;

procedure TApuracao.SetCodigoLoja(const ACodigoLoja: Int64);
begin
  FCodigoLoja := ACodigoLoja;
end;

procedure TApuracao.SetCST(const ACST: TString);
begin
  FCST := ACST;
end;

procedure TApuracao.SetDocumentoLoja(const ADocumentoLoja: TString);
begin
  FDocumentoLoja := ADocumentoLoja;
end;

procedure TApuracao.SetValor(const AValor: Double);
begin
  FValor := AValor;
end;

end.
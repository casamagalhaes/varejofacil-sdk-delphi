unit SDK.Model.ContaCorrente;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IContaCorrente = interface(IModel)
    ['{3353E87E-4CCD-4097-BE57-E62110B8F5AB}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetTipo: TTipoContaCorrente;
    procedure SetTipo(const ATipo: TTipoContaCorrente);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetAgenteFinanceiroId: Int64;
    procedure SetAgenteFinanceiroId(const AAgenteFinanceiroId: Int64);
    function GetAgencia: TString;
    procedure SetAgencia(const AAgencia: TString);
    function GetConta: TString;
    procedure SetConta(const AConta: TString);
    function GetLocalDePagamento: TString;
    procedure SetLocalDePagamento(const ALocalDePagamento: TString);
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property Tipo: TTipoContaCorrente read GetTipo write SetTipo;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property AgenteFinanceiroId: Int64 read GetAgenteFinanceiroId write SetAgenteFinanceiroId;
    property Agencia: TString read GetAgencia write SetAgencia;
    property Conta: TString read GetConta write SetConta;
    property LocalDePagamento: TString read GetLocalDePagamento write SetLocalDePagamento;
  end;

  TContaCorrenteList = class;

  IContaCorrenteList = interface
	['{8D099DE3-4980-4BBD-9377-E081332D4453}']
    function GetReference: TContaCorrenteList;
    function GetItems(AIndex: Integer): IContaCorrente;
    procedure SetItems(AIndex: Integer; const Value: IContaCorrente);
    procedure Add(const AContaCorrente: IContaCorrente);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IContaCorrente read GetItems write SetItems; default;
  end;

  TContaCorrenteListEnumerator = class
  private
    FIndex: Integer;
    FContaCorrenteList: TContaCorrenteList;
  public
    constructor Create(AContaCorrenteList: TContaCorrenteList);
    function GetCurrent: IContaCorrente; inline;
    function MoveNext: Boolean;
    property Current: IContaCorrente read GetCurrent;
  end;

  TContaCorrenteList = class(TInterfacedObject, IContaCorrenteList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IContaCorrente;
    procedure SetItems(AIndex: Integer; const Value: IContaCorrente);
  public
    constructor Create;
    procedure Add(const AContaCorrente: IContaCorrente);
    destructor Destroy; override;
    function GetEnumerator: TContaCorrenteListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TContaCorrenteList;
    property Items[AIndex: Integer]: IContaCorrente read GetItems write SetItems; default;
  end;

  TContaCorrenteListRec = record
  private
    FList: IContaCorrenteList;
  public
    class function Create(const AList: IContaCorrenteList): TContaCorrenteListRec; static;
    class operator Implicit(AListRec: TContaCorrenteListRec): TContaCorrenteList;
  end;

  TContaCorrente = class(TInterfacedModel, IContaCorrente)
  private
	FId: Int64;
	FDescricao: TString;
	FTipo: TTipoContaCorrente;
	FLojaId: Int64;
	FAgenteFinanceiroId: Int64;
	FAgencia: TString;
	FConta: TString;
	FLocalDePagamento: TString;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetTipo: TTipoContaCorrente;
    procedure SetTipo(const ATipo: TTipoContaCorrente);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetAgenteFinanceiroId: Int64;
    procedure SetAgenteFinanceiroId(const AAgenteFinanceiroId: Int64);
    function GetAgencia: TString;
    procedure SetAgencia(const AAgencia: TString);
    function GetConta: TString;
    procedure SetConta(const AConta: TString);
    function GetLocalDePagamento: TString;
    procedure SetLocalDePagamento(const ALocalDePagamento: TString);
  published
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property Tipo: TTipoContaCorrente read GetTipo write SetTipo;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property AgenteFinanceiroId: Int64 read GetAgenteFinanceiroId write SetAgenteFinanceiroId;
    property Agencia: TString read GetAgencia write SetAgencia;
    property Conta: TString read GetConta write SetConta;
    property LocalDePagamento: TString read GetLocalDePagamento write SetLocalDePagamento;
  end;

implementation

{ TContaCorrenteList }

procedure TContaCorrenteList.Add(const AContaCorrente: IContaCorrente);
begin
  FList.Add(AContaCorrente);
end;

procedure TContaCorrenteList.Clear;
begin
  FList.Clear;
end;

function TContaCorrenteList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TContaCorrenteList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TContaCorrenteList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TContaCorrenteList.GetEnumerator: TContaCorrenteListEnumerator;
begin
  Result := TContaCorrenteListEnumerator.Create(Self);
end;

function TContaCorrenteList.GetItems(AIndex: Integer): IContaCorrente;
begin
  Result := FList[AIndex] as IContaCorrente;
end;

function TContaCorrenteList.GetReference: TContaCorrenteList;
begin
  Result := Self;
end;

procedure TContaCorrenteList.SetItems(AIndex: Integer; const Value: IContaCorrente);
begin
  FList[AIndex] := Value;
end;

{ TContaCorrenteListEnumerator }

constructor TContaCorrenteListEnumerator.Create(AContaCorrenteList: TContaCorrenteList);
begin
  inherited Create;
  FIndex := -1;
  FContaCorrenteList := AContaCorrenteList;
end;

function TContaCorrenteListEnumerator.GetCurrent: IContaCorrente;
begin
  Result := FContaCorrenteList[FIndex];
end;

function TContaCorrenteListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FContaCorrenteList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TContaCorrenteListRec }

class function TContaCorrenteListRec.Create(const AList: IContaCorrenteList): TContaCorrenteListRec;
begin
  FillChar(Result, SizeOf(TContaCorrenteListRec), 0);
  Result.FList := AList;
end;

class operator TContaCorrenteListRec.Implicit(AListRec: TContaCorrenteListRec): TContaCorrenteList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TContaCorrente }

function TContaCorrente.GetId: Int64;
begin
  Result := FId;
end;

procedure TContaCorrente.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TContaCorrente.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TContaCorrente.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

function TContaCorrente.GetTipo: TTipoContaCorrente;
begin
  Result := FTipo;
end;

procedure TContaCorrente.SetTipo(const ATipo: TTipoContaCorrente);
begin
  FTipo := ATipo;
end;

function TContaCorrente.GetLojaId: Int64;
begin
  Result := FLojaId;
end;

procedure TContaCorrente.SetLojaId(const ALojaId: Int64);
begin
  FLojaId := ALojaId;
end;

function TContaCorrente.GetAgenteFinanceiroId: Int64;
begin
  Result := FAgenteFinanceiroId;
end;

procedure TContaCorrente.SetAgenteFinanceiroId(const AAgenteFinanceiroId: Int64);
begin
  FAgenteFinanceiroId := AAgenteFinanceiroId;
end;

function TContaCorrente.GetAgencia: TString;
begin
  Result := FAgencia;
end;

procedure TContaCorrente.SetAgencia(const AAgencia: TString);
begin
  FAgencia := AAgencia;
end;

function TContaCorrente.GetConta: TString;
begin
  Result := FConta;
end;

procedure TContaCorrente.SetConta(const AConta: TString);
begin
  FConta := AConta;
end;

function TContaCorrente.GetLocalDePagamento: TString;
begin
  Result := FLocalDePagamento;
end;

procedure TContaCorrente.SetLocalDePagamento(const ALocalDePagamento: TString);
begin
  FLocalDePagamento := ALocalDePagamento;
end;


end.
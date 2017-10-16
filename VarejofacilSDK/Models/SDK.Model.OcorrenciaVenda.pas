unit SDK.Model.OcorrenciaVenda;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IOcorrenciaVenda = interface(IModel)
    ['{6CA6724E-832F-4E67-B87D-9128E664764E}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetFuncionarioVendedorId: TString;
    procedure SetFuncionarioVendedorId(const AFuncionarioVendedorId: TString);
    function GetFuncionarioAutorizadorId: TString;
    procedure SetFuncionarioAutorizadorId(const AFuncionarioAutorizadorId: TString);
    function GetCodigoFuncao: TString;
    procedure SetCodigoFuncao(const ACodigoFuncao: TString);
    function GetHora: TDateTime;
    procedure SetHora(const AHora: TDateTime);
    function GetValor: TDouble;
    procedure SetValor(const AValor: TDouble);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    property Id: Int64 read GetId write SetId;
    property FuncionarioVendedorId: TString read GetFuncionarioVendedorId write SetFuncionarioVendedorId;
    property FuncionarioAutorizadorId: TString read GetFuncionarioAutorizadorId write SetFuncionarioAutorizadorId;
    property CodigoFuncao: TString read GetCodigoFuncao write SetCodigoFuncao;
    property Hora: TDateTime read GetHora write SetHora;
    property Valor: TDouble read GetValor write SetValor;
    property Descricao: TString read GetDescricao write SetDescricao;
  end;

  TOcorrenciaVendaList = class;

  IOcorrenciaVendaList = interface
	['{E41833B9-C039-4261-8296-95C4DA70B3E8}']
    function GetReference: TOcorrenciaVendaList;
    function GetItems(AIndex: Integer): IOcorrenciaVenda;
    procedure SetItems(AIndex: Integer; const Value: IOcorrenciaVenda);
    procedure Add(const AOcorrenciaVenda: IOcorrenciaVenda);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IOcorrenciaVenda read GetItems write SetItems; default;
  end;

  TOcorrenciaVendaListEnumerator = class
  private
    FIndex: Integer;
    FOcorrenciaVendaList: TOcorrenciaVendaList;
  public
    constructor Create(AOcorrenciaVendaList: TOcorrenciaVendaList);
    function GetCurrent: IOcorrenciaVenda; inline;
    function MoveNext: Boolean;
    property Current: IOcorrenciaVenda read GetCurrent;
  end;

  TOcorrenciaVendaList = class(TInterfacedObject, IOcorrenciaVendaList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IOcorrenciaVenda;
    procedure SetItems(AIndex: Integer; const Value: IOcorrenciaVenda);
  public
    constructor Create;
    procedure Add(const AOcorrenciaVenda: IOcorrenciaVenda);
    destructor Destroy; override;
    function GetEnumerator: TOcorrenciaVendaListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TOcorrenciaVendaList;
    property Items[AIndex: Integer]: IOcorrenciaVenda read GetItems write SetItems; default;
  end;

  TOcorrenciaVendaListRec = record
  private
    FList: IOcorrenciaVendaList;
  public
    class function Create(const AList: IOcorrenciaVendaList): TOcorrenciaVendaListRec; static;
    class operator Implicit(AListRec: TOcorrenciaVendaListRec): TOcorrenciaVendaList;
  end;

  TOcorrenciaVenda = class(TInterfacedModel, IOcorrenciaVenda)
  private
	FId: Int64;
	FFuncionarioVendedorId: TString;
	FFuncionarioAutorizadorId: TString;
	FCodigoFuncao: TString;
	FHora: TDateTime;
	FValor: TDouble;
	FDescricao: TString;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetFuncionarioVendedorId: TString;
    procedure SetFuncionarioVendedorId(const AFuncionarioVendedorId: TString);
    function GetFuncionarioAutorizadorId: TString;
    procedure SetFuncionarioAutorizadorId(const AFuncionarioAutorizadorId: TString);
    function GetCodigoFuncao: TString;
    procedure SetCodigoFuncao(const ACodigoFuncao: TString);
    function GetHora: TDateTime;
    procedure SetHora(const AHora: TDateTime);
    function GetValor: TDouble;
    procedure SetValor(const AValor: TDouble);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
  public
    property Id: Int64 read GetId write SetId;
    property FuncionarioVendedorId: TString read GetFuncionarioVendedorId write SetFuncionarioVendedorId;
    property FuncionarioAutorizadorId: TString read GetFuncionarioAutorizadorId write SetFuncionarioAutorizadorId;
    property CodigoFuncao: TString read GetCodigoFuncao write SetCodigoFuncao;
    property Hora: TDateTime read GetHora write SetHora;
    property Valor: TDouble read GetValor write SetValor;
    property Descricao: TString read GetDescricao write SetDescricao;
  end;

implementation

{ TOcorrenciaVendaList }

procedure TOcorrenciaVendaList.Add(const AOcorrenciaVenda: IOcorrenciaVenda);
begin
  FList.Add(AOcorrenciaVenda);
end;

procedure TOcorrenciaVendaList.Clear;
begin
  FList.Clear;
end;

function TOcorrenciaVendaList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TOcorrenciaVendaList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TOcorrenciaVendaList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TOcorrenciaVendaList.GetEnumerator: TOcorrenciaVendaListEnumerator;
begin
  Result := TOcorrenciaVendaListEnumerator.Create(Self);
end;

function TOcorrenciaVendaList.GetItems(AIndex: Integer): IOcorrenciaVenda;
begin
  Result := FList[AIndex] as IOcorrenciaVenda;
end;

function TOcorrenciaVendaList.GetReference: TOcorrenciaVendaList;
begin
  Result := Self;
end;

procedure TOcorrenciaVendaList.SetItems(AIndex: Integer; const Value: IOcorrenciaVenda);
begin
  FList[AIndex] := Value;
end;

{ TOcorrenciaVendaListEnumerator }

constructor TOcorrenciaVendaListEnumerator.Create(AOcorrenciaVendaList: TOcorrenciaVendaList);
begin
  inherited Create;
  FIndex := -1;
  FOcorrenciaVendaList := AOcorrenciaVendaList;
end;

function TOcorrenciaVendaListEnumerator.GetCurrent: IOcorrenciaVenda;
begin
  Result := FOcorrenciaVendaList[FIndex];
end;

function TOcorrenciaVendaListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FOcorrenciaVendaList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TOcorrenciaVendaListRec }

class function TOcorrenciaVendaListRec.Create(const AList: IOcorrenciaVendaList): TOcorrenciaVendaListRec;
begin
  FillChar(Result, SizeOf(TOcorrenciaVendaListRec), 0);
  Result.FList := AList;
end;

class operator TOcorrenciaVendaListRec.Implicit(AListRec: TOcorrenciaVendaListRec): TOcorrenciaVendaList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TOcorrenciaVenda }

function TOcorrenciaVenda.GetId: Int64;
begin
  Result := FId;
end;

procedure TOcorrenciaVenda.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TOcorrenciaVenda.GetFuncionarioVendedorId: TString;
begin
  Result := FFuncionarioVendedorId;
end;

procedure TOcorrenciaVenda.SetFuncionarioVendedorId(const AFuncionarioVendedorId: TString);
begin
  FFuncionarioVendedorId := AFuncionarioVendedorId;
end;

function TOcorrenciaVenda.GetFuncionarioAutorizadorId: TString;
begin
  Result := FFuncionarioAutorizadorId;
end;

procedure TOcorrenciaVenda.SetFuncionarioAutorizadorId(const AFuncionarioAutorizadorId: TString);
begin
  FFuncionarioAutorizadorId := AFuncionarioAutorizadorId;
end;

function TOcorrenciaVenda.GetCodigoFuncao: TString;
begin
  Result := FCodigoFuncao;
end;

procedure TOcorrenciaVenda.SetCodigoFuncao(const ACodigoFuncao: TString);
begin
  FCodigoFuncao := ACodigoFuncao;
end;

function TOcorrenciaVenda.GetHora: TDateTime;
begin
  Result := FHora;
end;

procedure TOcorrenciaVenda.SetHora(const AHora: TDateTime);
begin
  FHora := AHora;
end;

function TOcorrenciaVenda.GetValor: TDouble;
begin
  Result := FValor;
end;

procedure TOcorrenciaVenda.SetValor(const AValor: TDouble);
begin
  FValor := AValor;
end;

function TOcorrenciaVenda.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TOcorrenciaVenda.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;


end.
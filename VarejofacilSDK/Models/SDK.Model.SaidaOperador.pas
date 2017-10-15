unit SDK.Model.SaidaOperador;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ISaidaOperador = interface(IModel)
    ['{0944BA96-DB5B-440F-8158-4F4B0EB21C1E}']
    function GetId: TString;
    procedure SetId(const AId: TString);
    function GetSequencial: TString;
    procedure SetSequencial(const ASequencial: TString);
    function GetNumeroCaixa: TString;
    procedure SetNumeroCaixa(const ANumeroCaixa: TString);
    function GetData: TDateTime;
    procedure SetData(const AData: TDateTime);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetCoo: Integer;
    procedure SetCoo(const ACoo: Integer);
    function GetNumeroEquipamento: TString;
    procedure SetNumeroEquipamento(const ANumeroEquipamento: TString);
    function GetFuncionarioId: Integer;
    procedure SetFuncionarioId(const AFuncionarioId: Integer);
    function GetCodigoImpressora: TString;
    procedure SetCodigoImpressora(const ACodigoImpressora: TString);
    function GetDataHoraAbertura: TDateTime;
    procedure SetDataHoraAbertura(const ADataHoraAbertura: TDateTime);
    function GetDataHoraFechamento: TDateTime;
    procedure SetDataHoraFechamento(const ADataHoraFechamento: TDateTime);
    function GetSequencialOperador: TString;
    procedure SetSequencialOperador(const ASequencialOperador: TString);
    function GetSerieEquipamento: TString;
    procedure SetSerieEquipamento(const ASerieEquipamento: TString);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
    property Id: TString read GetId write SetId;
    property Sequencial: TString read GetSequencial write SetSequencial;
    property NumeroCaixa: TString read GetNumeroCaixa write SetNumeroCaixa;
    property Data: TDateTime read GetData write SetData;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property Coo: Integer read GetCoo write SetCoo;
    property NumeroEquipamento: TString read GetNumeroEquipamento write SetNumeroEquipamento;
    property FuncionarioId: Integer read GetFuncionarioId write SetFuncionarioId;
    property CodigoImpressora: TString read GetCodigoImpressora write SetCodigoImpressora;
    property DataHoraAbertura: TDateTime read GetDataHoraAbertura write SetDataHoraAbertura;
    property DataHoraFechamento: TDateTime read GetDataHoraFechamento write SetDataHoraFechamento;
    property SequencialOperador: TString read GetSequencialOperador write SetSequencialOperador;
    property SerieEquipamento: TString read GetSerieEquipamento write SetSerieEquipamento;
    property Valor: Double read GetValor write SetValor;
  end;

  TSaidaOperadorList = class;

  ISaidaOperadorList = interface
	['{09D705CA-B58A-42D9-878C-B82D71E970E3}']
    function GetReference: TSaidaOperadorList;
    function GetItems(AIndex: Integer): ISaidaOperador;
    procedure SetItems(AIndex: Integer; const Value: ISaidaOperador);
    procedure Add(const ASaidaOperador: ISaidaOperador);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ISaidaOperador read GetItems write SetItems; default;
  end;

  TSaidaOperadorListEnumerator = class
  private
    FIndex: Integer;
    FSaidaOperadorList: TSaidaOperadorList;
  public
    constructor Create(ASaidaOperadorList: TSaidaOperadorList);
    function GetCurrent: ISaidaOperador; inline;
    function MoveNext: Boolean;
    property Current: ISaidaOperador read GetCurrent;
  end;

  TSaidaOperadorList = class(TInterfacedObject, ISaidaOperadorList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ISaidaOperador;
    procedure SetItems(AIndex: Integer; const Value: ISaidaOperador);
  public
    constructor Create;
    procedure Add(const ASaidaOperador: ISaidaOperador);
    destructor Destroy; override;
    function GetEnumerator: TSaidaOperadorListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TSaidaOperadorList;
    property Items[AIndex: Integer]: ISaidaOperador read GetItems write SetItems; default;
  end;

  TSaidaOperadorListRec = record
  private
    FList: ISaidaOperadorList;
  public
    class function Create(const AList: ISaidaOperadorList): TSaidaOperadorListRec; static;
    class operator Implicit(AListRec: TSaidaOperadorListRec): TSaidaOperadorList;
  end;

  TSaidaOperador = class(TInterfacedObject, ISaidaOperador)
  private
	FId: TString;
	FSequencial: TString;
	FNumeroCaixa: TString;
	FData: TDateTime;
	FLojaId: Int64;
	FCoo: Integer;
	FNumeroEquipamento: TString;
	FFuncionarioId: Integer;
	FCodigoImpressora: TString;
	FDataHoraAbertura: TDateTime;
	FDataHoraFechamento: TDateTime;
	FSequencialOperador: TString;
	FSerieEquipamento: TString;
	FValor: Double;
    function GetId: TString;
    procedure SetId(const AId: TString);
    function GetSequencial: TString;
    procedure SetSequencial(const ASequencial: TString);
    function GetNumeroCaixa: TString;
    procedure SetNumeroCaixa(const ANumeroCaixa: TString);
    function GetData: TDateTime;
    procedure SetData(const AData: TDateTime);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetCoo: Integer;
    procedure SetCoo(const ACoo: Integer);
    function GetNumeroEquipamento: TString;
    procedure SetNumeroEquipamento(const ANumeroEquipamento: TString);
    function GetFuncionarioId: Integer;
    procedure SetFuncionarioId(const AFuncionarioId: Integer);
    function GetCodigoImpressora: TString;
    procedure SetCodigoImpressora(const ACodigoImpressora: TString);
    function GetDataHoraAbertura: TDateTime;
    procedure SetDataHoraAbertura(const ADataHoraAbertura: TDateTime);
    function GetDataHoraFechamento: TDateTime;
    procedure SetDataHoraFechamento(const ADataHoraFechamento: TDateTime);
    function GetSequencialOperador: TString;
    procedure SetSequencialOperador(const ASequencialOperador: TString);
    function GetSerieEquipamento: TString;
    procedure SetSerieEquipamento(const ASerieEquipamento: TString);
    function GetValor: Double;
    procedure SetValor(const AValor: Double);
  public
    property Id: TString read GetId write SetId;
    property Sequencial: TString read GetSequencial write SetSequencial;
    property NumeroCaixa: TString read GetNumeroCaixa write SetNumeroCaixa;
    property Data: TDateTime read GetData write SetData;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property Coo: Integer read GetCoo write SetCoo;
    property NumeroEquipamento: TString read GetNumeroEquipamento write SetNumeroEquipamento;
    property FuncionarioId: Integer read GetFuncionarioId write SetFuncionarioId;
    property CodigoImpressora: TString read GetCodigoImpressora write SetCodigoImpressora;
    property DataHoraAbertura: TDateTime read GetDataHoraAbertura write SetDataHoraAbertura;
    property DataHoraFechamento: TDateTime read GetDataHoraFechamento write SetDataHoraFechamento;
    property SequencialOperador: TString read GetSequencialOperador write SetSequencialOperador;
    property SerieEquipamento: TString read GetSerieEquipamento write SetSerieEquipamento;
    property Valor: Double read GetValor write SetValor;
  end;

implementation

{ TSaidaOperadorList }

procedure TSaidaOperadorList.Add(const ASaidaOperador: ISaidaOperador);
begin
  FList.Add(ASaidaOperador);
end;

procedure TSaidaOperadorList.Clear;
begin
  FList.Clear;
end;

function TSaidaOperadorList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TSaidaOperadorList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TSaidaOperadorList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TSaidaOperadorList.GetEnumerator: TSaidaOperadorListEnumerator;
begin
  Result := TSaidaOperadorListEnumerator.Create(Self);
end;

function TSaidaOperadorList.GetItems(AIndex: Integer): ISaidaOperador;
begin
  Result := FList[AIndex] as ISaidaOperador;
end;

function TSaidaOperadorList.GetReference: TSaidaOperadorList;
begin
  Result := Self;
end;

procedure TSaidaOperadorList.SetItems(AIndex: Integer; const Value: ISaidaOperador);
begin
  FList[AIndex] := Value;
end;

{ TSaidaOperadorListEnumerator }

constructor TSaidaOperadorListEnumerator.Create(ASaidaOperadorList: TSaidaOperadorList);
begin
  inherited Create;
  FIndex := -1;
  FSaidaOperadorList := ASaidaOperadorList;
end;

function TSaidaOperadorListEnumerator.GetCurrent: ISaidaOperador;
begin
  Result := FSaidaOperadorList[FIndex];
end;

function TSaidaOperadorListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FSaidaOperadorList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TSaidaOperadorListRec }

class function TSaidaOperadorListRec.Create(const AList: ISaidaOperadorList): TSaidaOperadorListRec;
begin
  FillChar(Result, SizeOf(TSaidaOperadorListRec), 0);
  Result.FList := AList;
end;

class operator TSaidaOperadorListRec.Implicit(AListRec: TSaidaOperadorListRec): TSaidaOperadorList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TSaidaOperador }

function TSaidaOperador.GetId: TString;
begin
  Result := FId;
end;

procedure TSaidaOperador.SetId(const AId: TString);
begin
  FId := AId;
end;

function TSaidaOperador.GetSequencial: TString;
begin
  Result := FSequencial;
end;

procedure TSaidaOperador.SetSequencial(const ASequencial: TString);
begin
  FSequencial := ASequencial;
end;

function TSaidaOperador.GetNumeroCaixa: TString;
begin
  Result := FNumeroCaixa;
end;

procedure TSaidaOperador.SetNumeroCaixa(const ANumeroCaixa: TString);
begin
  FNumeroCaixa := ANumeroCaixa;
end;

function TSaidaOperador.GetData: TDateTime;
begin
  Result := FData;
end;

procedure TSaidaOperador.SetData(const AData: TDateTime);
begin
  FData := AData;
end;

function TSaidaOperador.GetLojaId: Int64;
begin
  Result := FLojaId;
end;

procedure TSaidaOperador.SetLojaId(const ALojaId: Int64);
begin
  FLojaId := ALojaId;
end;

function TSaidaOperador.GetCoo: Integer;
begin
  Result := FCoo;
end;

procedure TSaidaOperador.SetCoo(const ACoo: Integer);
begin
  FCoo := ACoo;
end;

function TSaidaOperador.GetNumeroEquipamento: TString;
begin
  Result := FNumeroEquipamento;
end;

procedure TSaidaOperador.SetNumeroEquipamento(const ANumeroEquipamento: TString);
begin
  FNumeroEquipamento := ANumeroEquipamento;
end;

function TSaidaOperador.GetFuncionarioId: Integer;
begin
  Result := FFuncionarioId;
end;

procedure TSaidaOperador.SetFuncionarioId(const AFuncionarioId: Integer);
begin
  FFuncionarioId := AFuncionarioId;
end;

function TSaidaOperador.GetCodigoImpressora: TString;
begin
  Result := FCodigoImpressora;
end;

procedure TSaidaOperador.SetCodigoImpressora(const ACodigoImpressora: TString);
begin
  FCodigoImpressora := ACodigoImpressora;
end;

function TSaidaOperador.GetDataHoraAbertura: TDateTime;
begin
  Result := FDataHoraAbertura;
end;

procedure TSaidaOperador.SetDataHoraAbertura(const ADataHoraAbertura: TDateTime);
begin
  FDataHoraAbertura := ADataHoraAbertura;
end;

function TSaidaOperador.GetDataHoraFechamento: TDateTime;
begin
  Result := FDataHoraFechamento;
end;

procedure TSaidaOperador.SetDataHoraFechamento(const ADataHoraFechamento: TDateTime);
begin
  FDataHoraFechamento := ADataHoraFechamento;
end;

function TSaidaOperador.GetSequencialOperador: TString;
begin
  Result := FSequencialOperador;
end;

procedure TSaidaOperador.SetSequencialOperador(const ASequencialOperador: TString);
begin
  FSequencialOperador := ASequencialOperador;
end;

function TSaidaOperador.GetSerieEquipamento: TString;
begin
  Result := FSerieEquipamento;
end;

procedure TSaidaOperador.SetSerieEquipamento(const ASerieEquipamento: TString);
begin
  FSerieEquipamento := ASerieEquipamento;
end;

function TSaidaOperador.GetValor: Double;
begin
  Result := FValor;
end;

procedure TSaidaOperador.SetValor(const AValor: Double);
begin
  FValor := AValor;
end;


end.
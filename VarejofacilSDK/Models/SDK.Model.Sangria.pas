unit SDK.Model.Sangria;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ISangria = interface(IModel)
    ['{5418DF3A-F8BC-4989-8BF8-426DDCD615B1}']
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
    function GetDataHoraAbertura: TDateTime;
    procedure SetDataHoraAbertura(const ADataHoraAbertura: TDateTime);
    function GetDataHoraFechamento: TDateTime;
    procedure SetDataHoraFechamento(const ADataHoraFechamento: TDateTime);
    function GetFuncionarioId: Integer;
    procedure SetFuncionarioId(const AFuncionarioId: Integer);
    function GetAutorizadorId: Integer;
    procedure SetAutorizadorId(const AAutorizadorId: Integer);
    function GetCodigoImpressora: TString;
    procedure SetCodigoImpressora(const ACodigoImpressora: TString);
    function GetCoo: Integer;
    procedure SetCoo(const ACoo: Integer);
    function GetNumeroEquipamento: TString;
    procedure SetNumeroEquipamento(const ANumeroEquipamento: TString);
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
    property DataHoraAbertura: TDateTime read GetDataHoraAbertura write SetDataHoraAbertura;
    property DataHoraFechamento: TDateTime read GetDataHoraFechamento write SetDataHoraFechamento;
    property FuncionarioId: Integer read GetFuncionarioId write SetFuncionarioId;
    property AutorizadorId: Integer read GetAutorizadorId write SetAutorizadorId;
    property CodigoImpressora: TString read GetCodigoImpressora write SetCodigoImpressora;
    property Coo: Integer read GetCoo write SetCoo;
    property NumeroEquipamento: TString read GetNumeroEquipamento write SetNumeroEquipamento;
    property SequencialOperador: TString read GetSequencialOperador write SetSequencialOperador;
    property SerieEquipamento: TString read GetSerieEquipamento write SetSerieEquipamento;
    property Valor: Double read GetValor write SetValor;
  end;

  TSangriaList = class;

  ISangriaList = interface
	['{7CAFCA97-756E-4598-9A93-2204B88A35BE}']
    function GetReference: TSangriaList;
    function GetItems(AIndex: Integer): ISangria;
    procedure SetItems(AIndex: Integer; const Value: ISangria);
    procedure Add(const ASangria: ISangria);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ISangria read GetItems write SetItems; default;
  end;

  TSangriaListEnumerator = class
  private
    FIndex: Integer;
    FSangriaList: TSangriaList;
  public
    constructor Create(ASangriaList: TSangriaList);
    function GetCurrent: ISangria; inline;
    function MoveNext: Boolean;
    property Current: ISangria read GetCurrent;
  end;

  TSangriaList = class(TInterfacedObject, ISangriaList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ISangria;
    procedure SetItems(AIndex: Integer; const Value: ISangria);
  public
    constructor Create;
    procedure Add(const ASangria: ISangria);
    destructor Destroy; override;
    function GetEnumerator: TSangriaListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TSangriaList;
    property Items[AIndex: Integer]: ISangria read GetItems write SetItems; default;
  end;

  TSangriaListRec = record
  private
    FList: ISangriaList;
  public
    class function Create(const AList: ISangriaList): TSangriaListRec; static;
    class operator Implicit(AListRec: TSangriaListRec): TSangriaList;
  end;

  TSangria = class(TInterfacedModel, ISangria)
  private
	FId: TString;
	FSequencial: TString;
	FNumeroCaixa: TString;
	FData: TDateTime;
	FLojaId: Int64;
	FDataHoraAbertura: TDateTime;
	FDataHoraFechamento: TDateTime;
	FFuncionarioId: Integer;
	FAutorizadorId: Integer;
	FCodigoImpressora: TString;
	FCoo: Integer;
	FNumeroEquipamento: TString;
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
    function GetDataHoraAbertura: TDateTime;
    procedure SetDataHoraAbertura(const ADataHoraAbertura: TDateTime);
    function GetDataHoraFechamento: TDateTime;
    procedure SetDataHoraFechamento(const ADataHoraFechamento: TDateTime);
    function GetFuncionarioId: Integer;
    procedure SetFuncionarioId(const AFuncionarioId: Integer);
    function GetAutorizadorId: Integer;
    procedure SetAutorizadorId(const AAutorizadorId: Integer);
    function GetCodigoImpressora: TString;
    procedure SetCodigoImpressora(const ACodigoImpressora: TString);
    function GetCoo: Integer;
    procedure SetCoo(const ACoo: Integer);
    function GetNumeroEquipamento: TString;
    procedure SetNumeroEquipamento(const ANumeroEquipamento: TString);
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
    property DataHoraAbertura: TDateTime read GetDataHoraAbertura write SetDataHoraAbertura;
    property DataHoraFechamento: TDateTime read GetDataHoraFechamento write SetDataHoraFechamento;
    property FuncionarioId: Integer read GetFuncionarioId write SetFuncionarioId;
    property AutorizadorId: Integer read GetAutorizadorId write SetAutorizadorId;
    property CodigoImpressora: TString read GetCodigoImpressora write SetCodigoImpressora;
    property Coo: Integer read GetCoo write SetCoo;
    property NumeroEquipamento: TString read GetNumeroEquipamento write SetNumeroEquipamento;
    property SequencialOperador: TString read GetSequencialOperador write SetSequencialOperador;
    property SerieEquipamento: TString read GetSerieEquipamento write SetSerieEquipamento;
    property Valor: Double read GetValor write SetValor;
  end;

implementation

{ TSangriaList }

procedure TSangriaList.Add(const ASangria: ISangria);
begin
  FList.Add(ASangria);
end;

procedure TSangriaList.Clear;
begin
  FList.Clear;
end;

function TSangriaList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TSangriaList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TSangriaList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TSangriaList.GetEnumerator: TSangriaListEnumerator;
begin
  Result := TSangriaListEnumerator.Create(Self);
end;

function TSangriaList.GetItems(AIndex: Integer): ISangria;
begin
  Result := FList[AIndex] as ISangria;
end;

function TSangriaList.GetReference: TSangriaList;
begin
  Result := Self;
end;

procedure TSangriaList.SetItems(AIndex: Integer; const Value: ISangria);
begin
  FList[AIndex] := Value;
end;

{ TSangriaListEnumerator }

constructor TSangriaListEnumerator.Create(ASangriaList: TSangriaList);
begin
  inherited Create;
  FIndex := -1;
  FSangriaList := ASangriaList;
end;

function TSangriaListEnumerator.GetCurrent: ISangria;
begin
  Result := FSangriaList[FIndex];
end;

function TSangriaListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FSangriaList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TSangriaListRec }

class function TSangriaListRec.Create(const AList: ISangriaList): TSangriaListRec;
begin
  FillChar(Result, SizeOf(TSangriaListRec), 0);
  Result.FList := AList;
end;

class operator TSangriaListRec.Implicit(AListRec: TSangriaListRec): TSangriaList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TSangria }

function TSangria.GetId: TString;
begin
  Result := FId;
end;

procedure TSangria.SetId(const AId: TString);
begin
  FId := AId;
end;

function TSangria.GetSequencial: TString;
begin
  Result := FSequencial;
end;

procedure TSangria.SetSequencial(const ASequencial: TString);
begin
  FSequencial := ASequencial;
end;

function TSangria.GetNumeroCaixa: TString;
begin
  Result := FNumeroCaixa;
end;

procedure TSangria.SetNumeroCaixa(const ANumeroCaixa: TString);
begin
  FNumeroCaixa := ANumeroCaixa;
end;

function TSangria.GetData: TDateTime;
begin
  Result := FData;
end;

procedure TSangria.SetData(const AData: TDateTime);
begin
  FData := AData;
end;

function TSangria.GetLojaId: Int64;
begin
  Result := FLojaId;
end;

procedure TSangria.SetLojaId(const ALojaId: Int64);
begin
  FLojaId := ALojaId;
end;

function TSangria.GetDataHoraAbertura: TDateTime;
begin
  Result := FDataHoraAbertura;
end;

procedure TSangria.SetDataHoraAbertura(const ADataHoraAbertura: TDateTime);
begin
  FDataHoraAbertura := ADataHoraAbertura;
end;

function TSangria.GetDataHoraFechamento: TDateTime;
begin
  Result := FDataHoraFechamento;
end;

procedure TSangria.SetDataHoraFechamento(const ADataHoraFechamento: TDateTime);
begin
  FDataHoraFechamento := ADataHoraFechamento;
end;

function TSangria.GetFuncionarioId: Integer;
begin
  Result := FFuncionarioId;
end;

procedure TSangria.SetFuncionarioId(const AFuncionarioId: Integer);
begin
  FFuncionarioId := AFuncionarioId;
end;

function TSangria.GetAutorizadorId: Integer;
begin
  Result := FAutorizadorId;
end;

procedure TSangria.SetAutorizadorId(const AAutorizadorId: Integer);
begin
  FAutorizadorId := AAutorizadorId;
end;

function TSangria.GetCodigoImpressora: TString;
begin
  Result := FCodigoImpressora;
end;

procedure TSangria.SetCodigoImpressora(const ACodigoImpressora: TString);
begin
  FCodigoImpressora := ACodigoImpressora;
end;

function TSangria.GetCoo: Integer;
begin
  Result := FCoo;
end;

procedure TSangria.SetCoo(const ACoo: Integer);
begin
  FCoo := ACoo;
end;

function TSangria.GetNumeroEquipamento: TString;
begin
  Result := FNumeroEquipamento;
end;

procedure TSangria.SetNumeroEquipamento(const ANumeroEquipamento: TString);
begin
  FNumeroEquipamento := ANumeroEquipamento;
end;

function TSangria.GetSequencialOperador: TString;
begin
  Result := FSequencialOperador;
end;

procedure TSangria.SetSequencialOperador(const ASequencialOperador: TString);
begin
  FSequencialOperador := ASequencialOperador;
end;

function TSangria.GetSerieEquipamento: TString;
begin
  Result := FSerieEquipamento;
end;

procedure TSangria.SetSerieEquipamento(const ASerieEquipamento: TString);
begin
  FSerieEquipamento := ASerieEquipamento;
end;

function TSangria.GetValor: Double;
begin
  Result := FValor;
end;

procedure TSangria.SetValor(const AValor: Double);
begin
  FValor := AValor;
end;


end.
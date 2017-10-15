unit SDK.Model.Troca;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ITroca = interface(IModel)
    ['{64EA2ADC-92E3-4657-9025-AEAE01E13123}']
    function GetId: TString;
    procedure SetId(const AId: TString);
    function GetCooECF: Integer;
    procedure SetCooECF(const ACooECF: Integer);
    function GetOperadorId: TString;
    procedure SetOperadorId(const AOperadorId: TString);
    function GetDataEntradaAberturaSysPDV: TDateTime;
    procedure SetDataEntradaAberturaSysPDV(const ADataEntradaAberturaSysPDV: TDateTime);
    function GetValorTotal: Double;
    procedure SetValorTotal(const AValorTotal: Double);
    function GetAcrecimo: Double;
    procedure SetAcrecimo(const AAcrecimo: Double);
    function GetDesconto: Double;
    procedure SetDesconto(const ADesconto: Double);
    function GetNomeCliente: TString;
    procedure SetNomeCliente(const ANomeCliente: TString);
    function GetCpfCnpjCliente: TString;
    procedure SetCpfCnpjCliente(const ACpfCnpjCliente: TString);
    function GetRgCliente: TString;
    procedure SetRgCliente(const ARgCliente: TString);
    function GetTelefoneCliente: TString;
    procedure SetTelefoneCliente(const ATelefoneCliente: TString);
    function GetBairroCliente: TString;
    procedure SetBairroCliente(const ABairroCliente: TString);
    function GetEnderecoCliente: TString;
    procedure SetEnderecoCliente(const AEnderecoCliente: TString);
    function GetNumeroEnderecoCliente: TString;
    procedure SetNumeroEnderecoCliente(const ANumeroEnderecoCliente: TString);
    function GetMotivoDaTroca: TString;
    procedure SetMotivoDaTroca(const AMotivoDaTroca: TString);
    function GetAutorizadorId: TString;
    procedure SetAutorizadorId(const AAutorizadorId: TString);
    function GetStatus: TString;
    procedure SetStatus(const AStatus: TString);
    function GetDataCompraCupomOrigem: TDateTime;
    procedure SetDataCompraCupomOrigem(const ADataCompraCupomOrigem: TDateTime);
    function GetSequencialCaixaCompraCupomOrigem: TString;
    procedure SetSequencialCaixaCompraCupomOrigem(const ASequencialCaixaCompraCupomOrigem: TString);
    function GetNumeroCaixaCompraCupomOrigem: TString;
    procedure SetNumeroCaixaCompraCupomOrigem(const ANumeroCaixaCompraCupomOrigem: TString);
    function GetLogMilenio: TString;
    procedure SetLogMilenio(const ALogMilenio: TString);
    function GetModeloImpressora: TModeloImpressora;
    procedure SetModeloImpressora(const AModeloImpressora: TModeloImpressora);
    function GetVendedorId: TString;
    procedure SetVendedorId(const AVendedorId: TString);
    function GetCodigoNaRetaguarda: Int64;
    procedure SetCodigoNaRetaguarda(const ACodigoNaRetaguarda: Int64);
    function GetItensTroca: TList<ItemTroca>;
    procedure SetItensTroca(const AItensTroca: TList<ItemTroca>);
    property Id: TString read GetId write SetId;
    property CooECF: Integer read GetCooECF write SetCooECF;
    property OperadorId: TString read GetOperadorId write SetOperadorId;
    property DataEntradaAberturaSysPDV: TDateTime read GetDataEntradaAberturaSysPDV write SetDataEntradaAberturaSysPDV;
    property ValorTotal: Double read GetValorTotal write SetValorTotal;
    property Acrecimo: Double read GetAcrecimo write SetAcrecimo;
    property Desconto: Double read GetDesconto write SetDesconto;
    property NomeCliente: TString read GetNomeCliente write SetNomeCliente;
    property CpfCnpjCliente: TString read GetCpfCnpjCliente write SetCpfCnpjCliente;
    property RgCliente: TString read GetRgCliente write SetRgCliente;
    property TelefoneCliente: TString read GetTelefoneCliente write SetTelefoneCliente;
    property BairroCliente: TString read GetBairroCliente write SetBairroCliente;
    property EnderecoCliente: TString read GetEnderecoCliente write SetEnderecoCliente;
    property NumeroEnderecoCliente: TString read GetNumeroEnderecoCliente write SetNumeroEnderecoCliente;
    property MotivoDaTroca: TString read GetMotivoDaTroca write SetMotivoDaTroca;
    property AutorizadorId: TString read GetAutorizadorId write SetAutorizadorId;
    property Status: TString read GetStatus write SetStatus;
    property DataCompraCupomOrigem: TDateTime read GetDataCompraCupomOrigem write SetDataCompraCupomOrigem;
    property SequencialCaixaCompraCupomOrigem: TString read GetSequencialCaixaCompraCupomOrigem write SetSequencialCaixaCompraCupomOrigem;
    property NumeroCaixaCompraCupomOrigem: TString read GetNumeroCaixaCompraCupomOrigem write SetNumeroCaixaCompraCupomOrigem;
    property LogMilenio: TString read GetLogMilenio write SetLogMilenio;
    property ModeloImpressora: TModeloImpressora read GetModeloImpressora write SetModeloImpressora;
    property VendedorId: TString read GetVendedorId write SetVendedorId;
    property CodigoNaRetaguarda: Int64 read GetCodigoNaRetaguarda write SetCodigoNaRetaguarda;
    property ItensTroca: TList<ItemTroca> read GetItensTroca write SetItensTroca;
  end;

  TTrocaList = class;

  ITrocaList = interface
	['{5E75ED8D-E514-4F10-AEAE-A1EFFC971E32}']
    function GetReference: TTrocaList;
    function GetItems(AIndex: Integer): ITroca;
    procedure SetItems(AIndex: Integer; const Value: ITroca);
    procedure Add(const ATroca: ITroca);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ITroca read GetItems write SetItems; default;
  end;

  TTrocaListEnumerator = class
  private
    FIndex: Integer;
    FTrocaList: TTrocaList;
  public
    constructor Create(ATrocaList: TTrocaList);
    function GetCurrent: ITroca; inline;
    function MoveNext: Boolean;
    property Current: ITroca read GetCurrent;
  end;

  TTrocaList = class(TInterfacedObject, ITrocaList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ITroca;
    procedure SetItems(AIndex: Integer; const Value: ITroca);
  public
    constructor Create;
    procedure Add(const ATroca: ITroca);
    destructor Destroy; override;
    function GetEnumerator: TTrocaListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TTrocaList;
    property Items[AIndex: Integer]: ITroca read GetItems write SetItems; default;
  end;

  TTrocaListRec = record
  private
    FList: ITrocaList;
  public
    class function Create(const AList: ITrocaList): TTrocaListRec; static;
    class operator Implicit(AListRec: TTrocaListRec): TTrocaList;
  end;

  TTroca = class(TInterfacedObject, ITroca)
  private
	FId: TString;
	FCooECF: Integer;
	FOperadorId: TString;
	FDataEntradaAberturaSysPDV: TDateTime;
	FValorTotal: Double;
	FAcrecimo: Double;
	FDesconto: Double;
	FNomeCliente: TString;
	FCpfCnpjCliente: TString;
	FRgCliente: TString;
	FTelefoneCliente: TString;
	FBairroCliente: TString;
	FEnderecoCliente: TString;
	FNumeroEnderecoCliente: TString;
	FMotivoDaTroca: TString;
	FAutorizadorId: TString;
	FStatus: TString;
	FDataCompraCupomOrigem: TDateTime;
	FSequencialCaixaCompraCupomOrigem: TString;
	FNumeroCaixaCompraCupomOrigem: TString;
	FLogMilenio: TString;
	FModeloImpressora: TModeloImpressora;
	FVendedorId: TString;
	FCodigoNaRetaguarda: Int64;
	FItensTroca: TList<ItemTroca>;
    function GetId: TString;
    procedure SetId(const AId: TString);
    function GetCooECF: Integer;
    procedure SetCooECF(const ACooECF: Integer);
    function GetOperadorId: TString;
    procedure SetOperadorId(const AOperadorId: TString);
    function GetDataEntradaAberturaSysPDV: TDateTime;
    procedure SetDataEntradaAberturaSysPDV(const ADataEntradaAberturaSysPDV: TDateTime);
    function GetValorTotal: Double;
    procedure SetValorTotal(const AValorTotal: Double);
    function GetAcrecimo: Double;
    procedure SetAcrecimo(const AAcrecimo: Double);
    function GetDesconto: Double;
    procedure SetDesconto(const ADesconto: Double);
    function GetNomeCliente: TString;
    procedure SetNomeCliente(const ANomeCliente: TString);
    function GetCpfCnpjCliente: TString;
    procedure SetCpfCnpjCliente(const ACpfCnpjCliente: TString);
    function GetRgCliente: TString;
    procedure SetRgCliente(const ARgCliente: TString);
    function GetTelefoneCliente: TString;
    procedure SetTelefoneCliente(const ATelefoneCliente: TString);
    function GetBairroCliente: TString;
    procedure SetBairroCliente(const ABairroCliente: TString);
    function GetEnderecoCliente: TString;
    procedure SetEnderecoCliente(const AEnderecoCliente: TString);
    function GetNumeroEnderecoCliente: TString;
    procedure SetNumeroEnderecoCliente(const ANumeroEnderecoCliente: TString);
    function GetMotivoDaTroca: TString;
    procedure SetMotivoDaTroca(const AMotivoDaTroca: TString);
    function GetAutorizadorId: TString;
    procedure SetAutorizadorId(const AAutorizadorId: TString);
    function GetStatus: TString;
    procedure SetStatus(const AStatus: TString);
    function GetDataCompraCupomOrigem: TDateTime;
    procedure SetDataCompraCupomOrigem(const ADataCompraCupomOrigem: TDateTime);
    function GetSequencialCaixaCompraCupomOrigem: TString;
    procedure SetSequencialCaixaCompraCupomOrigem(const ASequencialCaixaCompraCupomOrigem: TString);
    function GetNumeroCaixaCompraCupomOrigem: TString;
    procedure SetNumeroCaixaCompraCupomOrigem(const ANumeroCaixaCompraCupomOrigem: TString);
    function GetLogMilenio: TString;
    procedure SetLogMilenio(const ALogMilenio: TString);
    function GetModeloImpressora: TModeloImpressora;
    procedure SetModeloImpressora(const AModeloImpressora: TModeloImpressora);
    function GetVendedorId: TString;
    procedure SetVendedorId(const AVendedorId: TString);
    function GetCodigoNaRetaguarda: Int64;
    procedure SetCodigoNaRetaguarda(const ACodigoNaRetaguarda: Int64);
    function GetItensTroca: TList<ItemTroca>;
    procedure SetItensTroca(const AItensTroca: TList<ItemTroca>);
  public
    property Id: TString read GetId write SetId;
    property CooECF: Integer read GetCooECF write SetCooECF;
    property OperadorId: TString read GetOperadorId write SetOperadorId;
    property DataEntradaAberturaSysPDV: TDateTime read GetDataEntradaAberturaSysPDV write SetDataEntradaAberturaSysPDV;
    property ValorTotal: Double read GetValorTotal write SetValorTotal;
    property Acrecimo: Double read GetAcrecimo write SetAcrecimo;
    property Desconto: Double read GetDesconto write SetDesconto;
    property NomeCliente: TString read GetNomeCliente write SetNomeCliente;
    property CpfCnpjCliente: TString read GetCpfCnpjCliente write SetCpfCnpjCliente;
    property RgCliente: TString read GetRgCliente write SetRgCliente;
    property TelefoneCliente: TString read GetTelefoneCliente write SetTelefoneCliente;
    property BairroCliente: TString read GetBairroCliente write SetBairroCliente;
    property EnderecoCliente: TString read GetEnderecoCliente write SetEnderecoCliente;
    property NumeroEnderecoCliente: TString read GetNumeroEnderecoCliente write SetNumeroEnderecoCliente;
    property MotivoDaTroca: TString read GetMotivoDaTroca write SetMotivoDaTroca;
    property AutorizadorId: TString read GetAutorizadorId write SetAutorizadorId;
    property Status: TString read GetStatus write SetStatus;
    property DataCompraCupomOrigem: TDateTime read GetDataCompraCupomOrigem write SetDataCompraCupomOrigem;
    property SequencialCaixaCompraCupomOrigem: TString read GetSequencialCaixaCompraCupomOrigem write SetSequencialCaixaCompraCupomOrigem;
    property NumeroCaixaCompraCupomOrigem: TString read GetNumeroCaixaCompraCupomOrigem write SetNumeroCaixaCompraCupomOrigem;
    property LogMilenio: TString read GetLogMilenio write SetLogMilenio;
    property ModeloImpressora: TModeloImpressora read GetModeloImpressora write SetModeloImpressora;
    property VendedorId: TString read GetVendedorId write SetVendedorId;
    property CodigoNaRetaguarda: Int64 read GetCodigoNaRetaguarda write SetCodigoNaRetaguarda;
    property ItensTroca: TList<ItemTroca> read GetItensTroca write SetItensTroca;
  end;

implementation

{ TTrocaList }

procedure TTrocaList.Add(const ATroca: ITroca);
begin
  FList.Add(ATroca);
end;

procedure TTrocaList.Clear;
begin
  FList.Clear;
end;

function TTrocaList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TTrocaList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TTrocaList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TTrocaList.GetEnumerator: TTrocaListEnumerator;
begin
  Result := TTrocaListEnumerator.Create(Self);
end;

function TTrocaList.GetItems(AIndex: Integer): ITroca;
begin
  Result := FList[AIndex] as ITroca;
end;

function TTrocaList.GetReference: TTrocaList;
begin
  Result := Self;
end;

procedure TTrocaList.SetItems(AIndex: Integer; const Value: ITroca);
begin
  FList[AIndex] := Value;
end;

{ TTrocaListEnumerator }

constructor TTrocaListEnumerator.Create(ATrocaList: TTrocaList);
begin
  inherited Create;
  FIndex := -1;
  FTrocaList := ATrocaList;
end;

function TTrocaListEnumerator.GetCurrent: ITroca;
begin
  Result := FTrocaList[FIndex];
end;

function TTrocaListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FTrocaList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TTrocaListRec }

class function TTrocaListRec.Create(const AList: ITrocaList): TTrocaListRec;
begin
  FillChar(Result, SizeOf(TTrocaListRec), 0);
  Result.FList := AList;
end;

class operator TTrocaListRec.Implicit(AListRec: TTrocaListRec): TTrocaList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TTroca }

function TTroca.GetId: TString;
begin
  Result := FId;
end;

procedure TTroca.SetId(const AId: TString);
begin
  FId := AId;
end;

function TTroca.GetCooECF: Integer;
begin
  Result := FCooECF;
end;

procedure TTroca.SetCooECF(const ACooECF: Integer);
begin
  FCooECF := ACooECF;
end;

function TTroca.GetOperadorId: TString;
begin
  Result := FOperadorId;
end;

procedure TTroca.SetOperadorId(const AOperadorId: TString);
begin
  FOperadorId := AOperadorId;
end;

function TTroca.GetDataEntradaAberturaSysPDV: TDateTime;
begin
  Result := FDataEntradaAberturaSysPDV;
end;

procedure TTroca.SetDataEntradaAberturaSysPDV(const ADataEntradaAberturaSysPDV: TDateTime);
begin
  FDataEntradaAberturaSysPDV := ADataEntradaAberturaSysPDV;
end;

function TTroca.GetValorTotal: Double;
begin
  Result := FValorTotal;
end;

procedure TTroca.SetValorTotal(const AValorTotal: Double);
begin
  FValorTotal := AValorTotal;
end;

function TTroca.GetAcrecimo: Double;
begin
  Result := FAcrecimo;
end;

procedure TTroca.SetAcrecimo(const AAcrecimo: Double);
begin
  FAcrecimo := AAcrecimo;
end;

function TTroca.GetDesconto: Double;
begin
  Result := FDesconto;
end;

procedure TTroca.SetDesconto(const ADesconto: Double);
begin
  FDesconto := ADesconto;
end;

function TTroca.GetNomeCliente: TString;
begin
  Result := FNomeCliente;
end;

procedure TTroca.SetNomeCliente(const ANomeCliente: TString);
begin
  FNomeCliente := ANomeCliente;
end;

function TTroca.GetCpfCnpjCliente: TString;
begin
  Result := FCpfCnpjCliente;
end;

procedure TTroca.SetCpfCnpjCliente(const ACpfCnpjCliente: TString);
begin
  FCpfCnpjCliente := ACpfCnpjCliente;
end;

function TTroca.GetRgCliente: TString;
begin
  Result := FRgCliente;
end;

procedure TTroca.SetRgCliente(const ARgCliente: TString);
begin
  FRgCliente := ARgCliente;
end;

function TTroca.GetTelefoneCliente: TString;
begin
  Result := FTelefoneCliente;
end;

procedure TTroca.SetTelefoneCliente(const ATelefoneCliente: TString);
begin
  FTelefoneCliente := ATelefoneCliente;
end;

function TTroca.GetBairroCliente: TString;
begin
  Result := FBairroCliente;
end;

procedure TTroca.SetBairroCliente(const ABairroCliente: TString);
begin
  FBairroCliente := ABairroCliente;
end;

function TTroca.GetEnderecoCliente: TString;
begin
  Result := FEnderecoCliente;
end;

procedure TTroca.SetEnderecoCliente(const AEnderecoCliente: TString);
begin
  FEnderecoCliente := AEnderecoCliente;
end;

function TTroca.GetNumeroEnderecoCliente: TString;
begin
  Result := FNumeroEnderecoCliente;
end;

procedure TTroca.SetNumeroEnderecoCliente(const ANumeroEnderecoCliente: TString);
begin
  FNumeroEnderecoCliente := ANumeroEnderecoCliente;
end;

function TTroca.GetMotivoDaTroca: TString;
begin
  Result := FMotivoDaTroca;
end;

procedure TTroca.SetMotivoDaTroca(const AMotivoDaTroca: TString);
begin
  FMotivoDaTroca := AMotivoDaTroca;
end;

function TTroca.GetAutorizadorId: TString;
begin
  Result := FAutorizadorId;
end;

procedure TTroca.SetAutorizadorId(const AAutorizadorId: TString);
begin
  FAutorizadorId := AAutorizadorId;
end;

function TTroca.GetStatus: TString;
begin
  Result := FStatus;
end;

procedure TTroca.SetStatus(const AStatus: TString);
begin
  FStatus := AStatus;
end;

function TTroca.GetDataCompraCupomOrigem: TDateTime;
begin
  Result := FDataCompraCupomOrigem;
end;

procedure TTroca.SetDataCompraCupomOrigem(const ADataCompraCupomOrigem: TDateTime);
begin
  FDataCompraCupomOrigem := ADataCompraCupomOrigem;
end;

function TTroca.GetSequencialCaixaCompraCupomOrigem: TString;
begin
  Result := FSequencialCaixaCompraCupomOrigem;
end;

procedure TTroca.SetSequencialCaixaCompraCupomOrigem(const ASequencialCaixaCompraCupomOrigem: TString);
begin
  FSequencialCaixaCompraCupomOrigem := ASequencialCaixaCompraCupomOrigem;
end;

function TTroca.GetNumeroCaixaCompraCupomOrigem: TString;
begin
  Result := FNumeroCaixaCompraCupomOrigem;
end;

procedure TTroca.SetNumeroCaixaCompraCupomOrigem(const ANumeroCaixaCompraCupomOrigem: TString);
begin
  FNumeroCaixaCompraCupomOrigem := ANumeroCaixaCompraCupomOrigem;
end;

function TTroca.GetLogMilenio: TString;
begin
  Result := FLogMilenio;
end;

procedure TTroca.SetLogMilenio(const ALogMilenio: TString);
begin
  FLogMilenio := ALogMilenio;
end;

function TTroca.GetModeloImpressora: TModeloImpressora;
begin
  Result := FModeloImpressora;
end;

procedure TTroca.SetModeloImpressora(const AModeloImpressora: TModeloImpressora);
begin
  FModeloImpressora := AModeloImpressora;
end;

function TTroca.GetVendedorId: TString;
begin
  Result := FVendedorId;
end;

procedure TTroca.SetVendedorId(const AVendedorId: TString);
begin
  FVendedorId := AVendedorId;
end;

function TTroca.GetCodigoNaRetaguarda: Int64;
begin
  Result := FCodigoNaRetaguarda;
end;

procedure TTroca.SetCodigoNaRetaguarda(const ACodigoNaRetaguarda: Int64);
begin
  FCodigoNaRetaguarda := ACodigoNaRetaguarda;
end;

function TTroca.GetItensTroca: TList<ItemTroca>;
begin
  Result := FItensTroca;
end;

procedure TTroca.SetItensTroca(const AItensTroca: TList<ItemTroca>);
begin
  FItensTroca := AItensTroca;
end;


end.
unit SDK.Model.DevolucaoDeCupom;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IDevolucaoDeCupom = interface(IModel)
    ['{65777AD5-DA71-4192-A001-6CE1C2E2BACF}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetLocalId: Int64;
    procedure SetLocalId(const ALocalId: Int64);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetCaixaId: TString;
    procedure SetCaixaId(const ACaixaId: TString);
    function GetClienteId: Int64;
    procedure SetClienteId(const AClienteId: Int64);
    function GetCooVenda: Int64;
    procedure SetCooVenda(const ACooVenda: Int64);
    function GetDataVenda: TDateTime;
    procedure SetDataVenda(const ADataVenda: TDateTime);
    function GetSequencialVenda: TString;
    procedure SetSequencialVenda(const ASequencialVenda: TString);
    function GetEmitiuNotaFiscal: Boolean;
    procedure SetEmitiuNotaFiscal(const AEmitiuNotaFiscal: Boolean);
    function GetFinalidade: TFinalidade;
    procedure SetFinalidade(const AFinalidade: TFinalidade);
    function GetCaixaDaTransacao: TString;
    procedure SetCaixaDaTransacao(const ACaixaDaTransacao: TString);
    function GetSequencialDaTransacao: TString;
    procedure SetSequencialDaTransacao(const ASequencialDaTransacao: TString);
    function GetDataDaTransacao: TDateTime;
    procedure SetDataDaTransacao(const ADataDaTransacao: TDateTime);
    function GetObservacao: TString;
    procedure SetObservacao(const AObservacao: TString);
    property Id: Int64 read GetId write SetId;
    property LocalId: Int64 read GetLocalId write SetLocalId;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property CaixaId: TString read GetCaixaId write SetCaixaId;
    property ClienteId: Int64 read GetClienteId write SetClienteId;
    property CooVenda: Int64 read GetCooVenda write SetCooVenda;
    property DataVenda: TDateTime read GetDataVenda write SetDataVenda;
    property SequencialVenda: TString read GetSequencialVenda write SetSequencialVenda;
    property EmitiuNotaFiscal: Boolean read GetEmitiuNotaFiscal write SetEmitiuNotaFiscal;
    property Finalidade: TFinalidade read GetFinalidade write SetFinalidade;
    property CaixaDaTransacao: TString read GetCaixaDaTransacao write SetCaixaDaTransacao;
    property SequencialDaTransacao: TString read GetSequencialDaTransacao write SetSequencialDaTransacao;
    property DataDaTransacao: TDateTime read GetDataDaTransacao write SetDataDaTransacao;
    property Observacao: TString read GetObservacao write SetObservacao;
  end;

  TDevolucaoDeCupomList = class;

  IDevolucaoDeCupomList = interface
	['{2D4B8185-49F0-4792-A26F-B73EA45470EF}']
    function GetReference: TDevolucaoDeCupomList;
    function GetItems(AIndex: Integer): IDevolucaoDeCupom;
    procedure SetItems(AIndex: Integer; const Value: IDevolucaoDeCupom);
    procedure Add(const ADevolucaoDeCupom: IDevolucaoDeCupom);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IDevolucaoDeCupom read GetItems write SetItems; default;
  end;

  TDevolucaoDeCupomListEnumerator = class
  private
    FIndex: Integer;
    FDevolucaoDeCupomList: TDevolucaoDeCupomList;
  public
    constructor Create(ADevolucaoDeCupomList: TDevolucaoDeCupomList);
    function GetCurrent: IDevolucaoDeCupom; inline;
    function MoveNext: Boolean;
    property Current: IDevolucaoDeCupom read GetCurrent;
  end;

  TDevolucaoDeCupomList = class(TInterfacedObject, IDevolucaoDeCupomList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IDevolucaoDeCupom;
    procedure SetItems(AIndex: Integer; const Value: IDevolucaoDeCupom);
  public
    constructor Create;
    procedure Add(const ADevolucaoDeCupom: IDevolucaoDeCupom);
    destructor Destroy; override;
    function GetEnumerator: TDevolucaoDeCupomListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TDevolucaoDeCupomList;
    property Items[AIndex: Integer]: IDevolucaoDeCupom read GetItems write SetItems; default;
  end;

  TDevolucaoDeCupomListRec = record
  private
    FList: IDevolucaoDeCupomList;
  public
    class function Create(const AList: IDevolucaoDeCupomList): TDevolucaoDeCupomListRec; static;
    class operator Implicit(AListRec: TDevolucaoDeCupomListRec): TDevolucaoDeCupomList;
  end;

  TDevolucaoDeCupom = class(TInterfacedModel, IDevolucaoDeCupom)
  private
	FId: Int64;
	FLocalId: Int64;
	FLojaId: Int64;
	FCaixaId: TString;
	FClienteId: Int64;
	FCooVenda: Int64;
	FDataVenda: TDateTime;
	FSequencialVenda: TString;
	FEmitiuNotaFiscal: Boolean;
	FFinalidade: TFinalidade;
	FCaixaDaTransacao: TString;
	FSequencialDaTransacao: TString;
	FDataDaTransacao: TDateTime;
	FObservacao: TString;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetLocalId: Int64;
    procedure SetLocalId(const ALocalId: Int64);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetCaixaId: TString;
    procedure SetCaixaId(const ACaixaId: TString);
    function GetClienteId: Int64;
    procedure SetClienteId(const AClienteId: Int64);
    function GetCooVenda: Int64;
    procedure SetCooVenda(const ACooVenda: Int64);
    function GetDataVenda: TDateTime;
    procedure SetDataVenda(const ADataVenda: TDateTime);
    function GetSequencialVenda: TString;
    procedure SetSequencialVenda(const ASequencialVenda: TString);
    function GetEmitiuNotaFiscal: Boolean;
    procedure SetEmitiuNotaFiscal(const AEmitiuNotaFiscal: Boolean);
    function GetFinalidade: TFinalidade;
    procedure SetFinalidade(const AFinalidade: TFinalidade);
    function GetCaixaDaTransacao: TString;
    procedure SetCaixaDaTransacao(const ACaixaDaTransacao: TString);
    function GetSequencialDaTransacao: TString;
    procedure SetSequencialDaTransacao(const ASequencialDaTransacao: TString);
    function GetDataDaTransacao: TDateTime;
    procedure SetDataDaTransacao(const ADataDaTransacao: TDateTime);
    function GetObservacao: TString;
    procedure SetObservacao(const AObservacao: TString);
  public
    property Id: Int64 read GetId write SetId;
    property LocalId: Int64 read GetLocalId write SetLocalId;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property CaixaId: TString read GetCaixaId write SetCaixaId;
    property ClienteId: Int64 read GetClienteId write SetClienteId;
    property CooVenda: Int64 read GetCooVenda write SetCooVenda;
    property DataVenda: TDateTime read GetDataVenda write SetDataVenda;
    property SequencialVenda: TString read GetSequencialVenda write SetSequencialVenda;
    property EmitiuNotaFiscal: Boolean read GetEmitiuNotaFiscal write SetEmitiuNotaFiscal;
    property Finalidade: TFinalidade read GetFinalidade write SetFinalidade;
    property CaixaDaTransacao: TString read GetCaixaDaTransacao write SetCaixaDaTransacao;
    property SequencialDaTransacao: TString read GetSequencialDaTransacao write SetSequencialDaTransacao;
    property DataDaTransacao: TDateTime read GetDataDaTransacao write SetDataDaTransacao;
    property Observacao: TString read GetObservacao write SetObservacao;
  end;

implementation

{ TDevolucaoDeCupomList }

procedure TDevolucaoDeCupomList.Add(const ADevolucaoDeCupom: IDevolucaoDeCupom);
begin
  FList.Add(ADevolucaoDeCupom);
end;

procedure TDevolucaoDeCupomList.Clear;
begin
  FList.Clear;
end;

function TDevolucaoDeCupomList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TDevolucaoDeCupomList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TDevolucaoDeCupomList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TDevolucaoDeCupomList.GetEnumerator: TDevolucaoDeCupomListEnumerator;
begin
  Result := TDevolucaoDeCupomListEnumerator.Create(Self);
end;

function TDevolucaoDeCupomList.GetItems(AIndex: Integer): IDevolucaoDeCupom;
begin
  Result := FList[AIndex] as IDevolucaoDeCupom;
end;

function TDevolucaoDeCupomList.GetReference: TDevolucaoDeCupomList;
begin
  Result := Self;
end;

procedure TDevolucaoDeCupomList.SetItems(AIndex: Integer; const Value: IDevolucaoDeCupom);
begin
  FList[AIndex] := Value;
end;

{ TDevolucaoDeCupomListEnumerator }

constructor TDevolucaoDeCupomListEnumerator.Create(ADevolucaoDeCupomList: TDevolucaoDeCupomList);
begin
  inherited Create;
  FIndex := -1;
  FDevolucaoDeCupomList := ADevolucaoDeCupomList;
end;

function TDevolucaoDeCupomListEnumerator.GetCurrent: IDevolucaoDeCupom;
begin
  Result := FDevolucaoDeCupomList[FIndex];
end;

function TDevolucaoDeCupomListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FDevolucaoDeCupomList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TDevolucaoDeCupomListRec }

class function TDevolucaoDeCupomListRec.Create(const AList: IDevolucaoDeCupomList): TDevolucaoDeCupomListRec;
begin
  FillChar(Result, SizeOf(TDevolucaoDeCupomListRec), 0);
  Result.FList := AList;
end;

class operator TDevolucaoDeCupomListRec.Implicit(AListRec: TDevolucaoDeCupomListRec): TDevolucaoDeCupomList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TDevolucaoDeCupom }

function TDevolucaoDeCupom.GetId: Int64;
begin
  Result := FId;
end;

procedure TDevolucaoDeCupom.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TDevolucaoDeCupom.GetLocalId: Int64;
begin
  Result := FLocalId;
end;

procedure TDevolucaoDeCupom.SetLocalId(const ALocalId: Int64);
begin
  FLocalId := ALocalId;
end;

function TDevolucaoDeCupom.GetLojaId: Int64;
begin
  Result := FLojaId;
end;

procedure TDevolucaoDeCupom.SetLojaId(const ALojaId: Int64);
begin
  FLojaId := ALojaId;
end;

function TDevolucaoDeCupom.GetCaixaId: TString;
begin
  Result := FCaixaId;
end;

procedure TDevolucaoDeCupom.SetCaixaId(const ACaixaId: TString);
begin
  FCaixaId := ACaixaId;
end;

function TDevolucaoDeCupom.GetClienteId: Int64;
begin
  Result := FClienteId;
end;

procedure TDevolucaoDeCupom.SetClienteId(const AClienteId: Int64);
begin
  FClienteId := AClienteId;
end;

function TDevolucaoDeCupom.GetCooVenda: Int64;
begin
  Result := FCooVenda;
end;

procedure TDevolucaoDeCupom.SetCooVenda(const ACooVenda: Int64);
begin
  FCooVenda := ACooVenda;
end;

function TDevolucaoDeCupom.GetDataVenda: TDateTime;
begin
  Result := FDataVenda;
end;

procedure TDevolucaoDeCupom.SetDataVenda(const ADataVenda: TDateTime);
begin
  FDataVenda := ADataVenda;
end;

function TDevolucaoDeCupom.GetSequencialVenda: TString;
begin
  Result := FSequencialVenda;
end;

procedure TDevolucaoDeCupom.SetSequencialVenda(const ASequencialVenda: TString);
begin
  FSequencialVenda := ASequencialVenda;
end;

function TDevolucaoDeCupom.GetEmitiuNotaFiscal: Boolean;
begin
  Result := FEmitiuNotaFiscal;
end;

procedure TDevolucaoDeCupom.SetEmitiuNotaFiscal(const AEmitiuNotaFiscal: Boolean);
begin
  FEmitiuNotaFiscal := AEmitiuNotaFiscal;
end;

function TDevolucaoDeCupom.GetFinalidade: TFinalidade;
begin
  Result := FFinalidade;
end;

procedure TDevolucaoDeCupom.SetFinalidade(const AFinalidade: TFinalidade);
begin
  FFinalidade := AFinalidade;
end;

function TDevolucaoDeCupom.GetCaixaDaTransacao: TString;
begin
  Result := FCaixaDaTransacao;
end;

procedure TDevolucaoDeCupom.SetCaixaDaTransacao(const ACaixaDaTransacao: TString);
begin
  FCaixaDaTransacao := ACaixaDaTransacao;
end;

function TDevolucaoDeCupom.GetSequencialDaTransacao: TString;
begin
  Result := FSequencialDaTransacao;
end;

procedure TDevolucaoDeCupom.SetSequencialDaTransacao(const ASequencialDaTransacao: TString);
begin
  FSequencialDaTransacao := ASequencialDaTransacao;
end;

function TDevolucaoDeCupom.GetDataDaTransacao: TDateTime;
begin
  Result := FDataDaTransacao;
end;

procedure TDevolucaoDeCupom.SetDataDaTransacao(const ADataDaTransacao: TDateTime);
begin
  FDataDaTransacao := ADataDaTransacao;
end;

function TDevolucaoDeCupom.GetObservacao: TString;
begin
  Result := FObservacao;
end;

procedure TDevolucaoDeCupom.SetObservacao(const AObservacao: TString);
begin
  FObservacao := AObservacao;
end;


end.
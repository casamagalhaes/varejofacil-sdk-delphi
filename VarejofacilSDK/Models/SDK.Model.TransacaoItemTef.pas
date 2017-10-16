unit SDK.Model.TransacaoItemTef;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ITransacaoItemTef = interface(IModel)
    ['{54137E09-1B5A-4DD3-AEB9-523E3DA39FF7}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetVencimentoTitulo: TString;
    procedure SetVencimentoTitulo(const AVencimentoTitulo: TString);
    function GetValorPago: TString;
    procedure SetValorPago(const AValorPago: TString);
    function GetValorOriginal: TString;
    procedure SetValorOriginal(const AValorOriginal: TString);
    function GetValorAcrescimo: TString;
    procedure SetValorAcrescimo(const AValorAcrescimo: TString);
    function GetValorDesconto: TString;
    procedure SetValorDesconto(const AValorDesconto: TString);
    function GetValorContabilDePagamento: TString;
    procedure SetValorContabilDePagamento(const AValorContabilDePagamento: TString);
    function GetNomeDoCedenteDoTitulo: TString;
    procedure SetNomeDoCedenteDoTitulo(const ANomeDoCedenteDoTitulo: TString);
    function GetIndiceDoDocumento: TString;
    procedure SetIndiceDoDocumento(const AIndiceDoDocumento: TString);
    function GetNsuCorrespondenteBancario: TString;
    procedure SetNsuCorrespondenteBancario(const ANsuCorrespondenteBancario: TString);
    function GetTipoDocumento: TString;
    procedure SetTipoDocumento(const ATipoDocumento: TString);
    function GetNsuPagamento: TString;
    procedure SetNsuPagamento(const ANsuPagamento: TString);
    function GetCodigoParaReimpressaoOucancelamento: TString;
    procedure SetCodigoParaReimpressaoOucancelamento(const ACodigoParaReimpressaoOucancelamento: TString);
    function GetCodigoDeBarrasPago: TString;
    procedure SetCodigoDeBarrasPago(const ACodigoDeBarrasPago: TString);
    property Id: Int64 read GetId write SetId;
    property VencimentoTitulo: TString read GetVencimentoTitulo write SetVencimentoTitulo;
    property ValorPago: TString read GetValorPago write SetValorPago;
    property ValorOriginal: TString read GetValorOriginal write SetValorOriginal;
    property ValorAcrescimo: TString read GetValorAcrescimo write SetValorAcrescimo;
    property ValorDesconto: TString read GetValorDesconto write SetValorDesconto;
    property ValorContabilDePagamento: TString read GetValorContabilDePagamento write SetValorContabilDePagamento;
    property NomeDoCedenteDoTitulo: TString read GetNomeDoCedenteDoTitulo write SetNomeDoCedenteDoTitulo;
    property IndiceDoDocumento: TString read GetIndiceDoDocumento write SetIndiceDoDocumento;
    property NsuCorrespondenteBancario: TString read GetNsuCorrespondenteBancario write SetNsuCorrespondenteBancario;
    property TipoDocumento: TString read GetTipoDocumento write SetTipoDocumento;
    property NsuPagamento: TString read GetNsuPagamento write SetNsuPagamento;
    property CodigoParaReimpressaoOucancelamento: TString read GetCodigoParaReimpressaoOucancelamento write SetCodigoParaReimpressaoOucancelamento;
    property CodigoDeBarrasPago: TString read GetCodigoDeBarrasPago write SetCodigoDeBarrasPago;
  end;

  TTransacaoItemTefList = class;

  ITransacaoItemTefList = interface
	['{1F9797D1-65D2-4DC5-AB2C-DA59293DC80E}']
    function GetReference: TTransacaoItemTefList;
    function GetItems(AIndex: Integer): ITransacaoItemTef;
    procedure SetItems(AIndex: Integer; const Value: ITransacaoItemTef);
    procedure Add(const ATransacaoItemTef: ITransacaoItemTef);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ITransacaoItemTef read GetItems write SetItems; default;
  end;

  TTransacaoItemTefListEnumerator = class
  private
    FIndex: Integer;
    FTransacaoItemTefList: TTransacaoItemTefList;
  public
    constructor Create(ATransacaoItemTefList: TTransacaoItemTefList);
    function GetCurrent: ITransacaoItemTef; inline;
    function MoveNext: Boolean;
    property Current: ITransacaoItemTef read GetCurrent;
  end;

  TTransacaoItemTefList = class(TInterfacedObject, ITransacaoItemTefList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ITransacaoItemTef;
    procedure SetItems(AIndex: Integer; const Value: ITransacaoItemTef);
  public
    constructor Create;
    procedure Add(const ATransacaoItemTef: ITransacaoItemTef);
    destructor Destroy; override;
    function GetEnumerator: TTransacaoItemTefListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TTransacaoItemTefList;
    property Items[AIndex: Integer]: ITransacaoItemTef read GetItems write SetItems; default;
  end;

  TTransacaoItemTefListRec = record
  private
    FList: ITransacaoItemTefList;
  public
    class function Create(const AList: ITransacaoItemTefList): TTransacaoItemTefListRec; static;
    class operator Implicit(AListRec: TTransacaoItemTefListRec): TTransacaoItemTefList;
  end;

  TTransacaoItemTef = class(TInterfacedModel, ITransacaoItemTef)
  private
	FId: Int64;
	FVencimentoTitulo: TString;
	FValorPago: TString;
	FValorOriginal: TString;
	FValorAcrescimo: TString;
	FValorDesconto: TString;
	FValorContabilDePagamento: TString;
	FNomeDoCedenteDoTitulo: TString;
	FIndiceDoDocumento: TString;
	FNsuCorrespondenteBancario: TString;
	FTipoDocumento: TString;
	FNsuPagamento: TString;
	FCodigoParaReimpressaoOucancelamento: TString;
	FCodigoDeBarrasPago: TString;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetVencimentoTitulo: TString;
    procedure SetVencimentoTitulo(const AVencimentoTitulo: TString);
    function GetValorPago: TString;
    procedure SetValorPago(const AValorPago: TString);
    function GetValorOriginal: TString;
    procedure SetValorOriginal(const AValorOriginal: TString);
    function GetValorAcrescimo: TString;
    procedure SetValorAcrescimo(const AValorAcrescimo: TString);
    function GetValorDesconto: TString;
    procedure SetValorDesconto(const AValorDesconto: TString);
    function GetValorContabilDePagamento: TString;
    procedure SetValorContabilDePagamento(const AValorContabilDePagamento: TString);
    function GetNomeDoCedenteDoTitulo: TString;
    procedure SetNomeDoCedenteDoTitulo(const ANomeDoCedenteDoTitulo: TString);
    function GetIndiceDoDocumento: TString;
    procedure SetIndiceDoDocumento(const AIndiceDoDocumento: TString);
    function GetNsuCorrespondenteBancario: TString;
    procedure SetNsuCorrespondenteBancario(const ANsuCorrespondenteBancario: TString);
    function GetTipoDocumento: TString;
    procedure SetTipoDocumento(const ATipoDocumento: TString);
    function GetNsuPagamento: TString;
    procedure SetNsuPagamento(const ANsuPagamento: TString);
    function GetCodigoParaReimpressaoOucancelamento: TString;
    procedure SetCodigoParaReimpressaoOucancelamento(const ACodigoParaReimpressaoOucancelamento: TString);
    function GetCodigoDeBarrasPago: TString;
    procedure SetCodigoDeBarrasPago(const ACodigoDeBarrasPago: TString);
  public
    property Id: Int64 read GetId write SetId;
    property VencimentoTitulo: TString read GetVencimentoTitulo write SetVencimentoTitulo;
    property ValorPago: TString read GetValorPago write SetValorPago;
    property ValorOriginal: TString read GetValorOriginal write SetValorOriginal;
    property ValorAcrescimo: TString read GetValorAcrescimo write SetValorAcrescimo;
    property ValorDesconto: TString read GetValorDesconto write SetValorDesconto;
    property ValorContabilDePagamento: TString read GetValorContabilDePagamento write SetValorContabilDePagamento;
    property NomeDoCedenteDoTitulo: TString read GetNomeDoCedenteDoTitulo write SetNomeDoCedenteDoTitulo;
    property IndiceDoDocumento: TString read GetIndiceDoDocumento write SetIndiceDoDocumento;
    property NsuCorrespondenteBancario: TString read GetNsuCorrespondenteBancario write SetNsuCorrespondenteBancario;
    property TipoDocumento: TString read GetTipoDocumento write SetTipoDocumento;
    property NsuPagamento: TString read GetNsuPagamento write SetNsuPagamento;
    property CodigoParaReimpressaoOucancelamento: TString read GetCodigoParaReimpressaoOucancelamento write SetCodigoParaReimpressaoOucancelamento;
    property CodigoDeBarrasPago: TString read GetCodigoDeBarrasPago write SetCodigoDeBarrasPago;
  end;

implementation

{ TTransacaoItemTefList }

procedure TTransacaoItemTefList.Add(const ATransacaoItemTef: ITransacaoItemTef);
begin
  FList.Add(ATransacaoItemTef);
end;

procedure TTransacaoItemTefList.Clear;
begin
  FList.Clear;
end;

function TTransacaoItemTefList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TTransacaoItemTefList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TTransacaoItemTefList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TTransacaoItemTefList.GetEnumerator: TTransacaoItemTefListEnumerator;
begin
  Result := TTransacaoItemTefListEnumerator.Create(Self);
end;

function TTransacaoItemTefList.GetItems(AIndex: Integer): ITransacaoItemTef;
begin
  Result := FList[AIndex] as ITransacaoItemTef;
end;

function TTransacaoItemTefList.GetReference: TTransacaoItemTefList;
begin
  Result := Self;
end;

procedure TTransacaoItemTefList.SetItems(AIndex: Integer; const Value: ITransacaoItemTef);
begin
  FList[AIndex] := Value;
end;

{ TTransacaoItemTefListEnumerator }

constructor TTransacaoItemTefListEnumerator.Create(ATransacaoItemTefList: TTransacaoItemTefList);
begin
  inherited Create;
  FIndex := -1;
  FTransacaoItemTefList := ATransacaoItemTefList;
end;

function TTransacaoItemTefListEnumerator.GetCurrent: ITransacaoItemTef;
begin
  Result := FTransacaoItemTefList[FIndex];
end;

function TTransacaoItemTefListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FTransacaoItemTefList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TTransacaoItemTefListRec }

class function TTransacaoItemTefListRec.Create(const AList: ITransacaoItemTefList): TTransacaoItemTefListRec;
begin
  FillChar(Result, SizeOf(TTransacaoItemTefListRec), 0);
  Result.FList := AList;
end;

class operator TTransacaoItemTefListRec.Implicit(AListRec: TTransacaoItemTefListRec): TTransacaoItemTefList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TTransacaoItemTef }

function TTransacaoItemTef.GetId: Int64;
begin
  Result := FId;
end;

procedure TTransacaoItemTef.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TTransacaoItemTef.GetVencimentoTitulo: TString;
begin
  Result := FVencimentoTitulo;
end;

procedure TTransacaoItemTef.SetVencimentoTitulo(const AVencimentoTitulo: TString);
begin
  FVencimentoTitulo := AVencimentoTitulo;
end;

function TTransacaoItemTef.GetValorPago: TString;
begin
  Result := FValorPago;
end;

procedure TTransacaoItemTef.SetValorPago(const AValorPago: TString);
begin
  FValorPago := AValorPago;
end;

function TTransacaoItemTef.GetValorOriginal: TString;
begin
  Result := FValorOriginal;
end;

procedure TTransacaoItemTef.SetValorOriginal(const AValorOriginal: TString);
begin
  FValorOriginal := AValorOriginal;
end;

function TTransacaoItemTef.GetValorAcrescimo: TString;
begin
  Result := FValorAcrescimo;
end;

procedure TTransacaoItemTef.SetValorAcrescimo(const AValorAcrescimo: TString);
begin
  FValorAcrescimo := AValorAcrescimo;
end;

function TTransacaoItemTef.GetValorDesconto: TString;
begin
  Result := FValorDesconto;
end;

procedure TTransacaoItemTef.SetValorDesconto(const AValorDesconto: TString);
begin
  FValorDesconto := AValorDesconto;
end;

function TTransacaoItemTef.GetValorContabilDePagamento: TString;
begin
  Result := FValorContabilDePagamento;
end;

procedure TTransacaoItemTef.SetValorContabilDePagamento(const AValorContabilDePagamento: TString);
begin
  FValorContabilDePagamento := AValorContabilDePagamento;
end;

function TTransacaoItemTef.GetNomeDoCedenteDoTitulo: TString;
begin
  Result := FNomeDoCedenteDoTitulo;
end;

procedure TTransacaoItemTef.SetNomeDoCedenteDoTitulo(const ANomeDoCedenteDoTitulo: TString);
begin
  FNomeDoCedenteDoTitulo := ANomeDoCedenteDoTitulo;
end;

function TTransacaoItemTef.GetIndiceDoDocumento: TString;
begin
  Result := FIndiceDoDocumento;
end;

procedure TTransacaoItemTef.SetIndiceDoDocumento(const AIndiceDoDocumento: TString);
begin
  FIndiceDoDocumento := AIndiceDoDocumento;
end;

function TTransacaoItemTef.GetNsuCorrespondenteBancario: TString;
begin
  Result := FNsuCorrespondenteBancario;
end;

procedure TTransacaoItemTef.SetNsuCorrespondenteBancario(const ANsuCorrespondenteBancario: TString);
begin
  FNsuCorrespondenteBancario := ANsuCorrespondenteBancario;
end;

function TTransacaoItemTef.GetTipoDocumento: TString;
begin
  Result := FTipoDocumento;
end;

procedure TTransacaoItemTef.SetTipoDocumento(const ATipoDocumento: TString);
begin
  FTipoDocumento := ATipoDocumento;
end;

function TTransacaoItemTef.GetNsuPagamento: TString;
begin
  Result := FNsuPagamento;
end;

procedure TTransacaoItemTef.SetNsuPagamento(const ANsuPagamento: TString);
begin
  FNsuPagamento := ANsuPagamento;
end;

function TTransacaoItemTef.GetCodigoParaReimpressaoOucancelamento: TString;
begin
  Result := FCodigoParaReimpressaoOucancelamento;
end;

procedure TTransacaoItemTef.SetCodigoParaReimpressaoOucancelamento(const ACodigoParaReimpressaoOucancelamento: TString);
begin
  FCodigoParaReimpressaoOucancelamento := ACodigoParaReimpressaoOucancelamento;
end;

function TTransacaoItemTef.GetCodigoDeBarrasPago: TString;
begin
  Result := FCodigoDeBarrasPago;
end;

procedure TTransacaoItemTef.SetCodigoDeBarrasPago(const ACodigoDeBarrasPago: TString);
begin
  FCodigoDeBarrasPago := ACodigoDeBarrasPago;
end;


end.
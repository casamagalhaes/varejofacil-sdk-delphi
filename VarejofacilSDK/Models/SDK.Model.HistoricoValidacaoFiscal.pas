unit SDK.Model.HistoricoValidacaoFiscal;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IHistoricoValidacaoFiscal = interface(IModel)
    ['{43E62BBA-EBB7-42A0-97E1-898092BF1366}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDataAlteracao: TDateTime;
    procedure SetDataAlteracao(const ADataAlteracao: TDateTime);
    function GetFundamentoEstadual: TString;
    procedure SetFundamentoEstadual(const AFundamentoEstadual: TString);
    function GetFundamentoFederal: TString;
    procedure SetFundamentoFederal(const AFundamentoFederal: TString);
    function GetResponsavel: TResponsavelValidacao;
    procedure SetResponsavel(const AResponsavel: TResponsavelValidacao);
    function GetImpostoFederalId: Integer;
    procedure SetImpostoFederalId(const AImpostoFederalId: Integer);
    function GetUsuarioId: Int64;
    procedure SetUsuarioId(const AUsuarioId: Int64);
    property Id: Int64 read GetId write SetId;
    property DataAlteracao: TDateTime read GetDataAlteracao write SetDataAlteracao;
    property FundamentoEstadual: TString read GetFundamentoEstadual write SetFundamentoEstadual;
    property FundamentoFederal: TString read GetFundamentoFederal write SetFundamentoFederal;
    property Responsavel: TResponsavelValidacao read GetResponsavel write SetResponsavel;
    property ImpostoFederalId: Integer read GetImpostoFederalId write SetImpostoFederalId;
    property UsuarioId: Int64 read GetUsuarioId write SetUsuarioId;
  end;

  THistoricoValidacaoFiscalList = class;

  IHistoricoValidacaoFiscalList = interface
	['{A73659FC-26AE-4D0E-A271-DD7813F7730E}']
    function GetReference: THistoricoValidacaoFiscalList;
    function GetItems(AIndex: Integer): IHistoricoValidacaoFiscal;
    procedure SetItems(AIndex: Integer; const Value: IHistoricoValidacaoFiscal);
    procedure Add(const AHistoricoValidacaoFiscal: IHistoricoValidacaoFiscal);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IHistoricoValidacaoFiscal read GetItems write SetItems; default;
  end;

  THistoricoValidacaoFiscalListEnumerator = class
  private
    FIndex: Integer;
    FHistoricoValidacaoFiscalList: THistoricoValidacaoFiscalList;
  public
    constructor Create(AHistoricoValidacaoFiscalList: THistoricoValidacaoFiscalList);
    function GetCurrent: IHistoricoValidacaoFiscal; inline;
    function MoveNext: Boolean;
    property Current: IHistoricoValidacaoFiscal read GetCurrent;
  end;

  THistoricoValidacaoFiscalList = class(TInterfacedObject, IHistoricoValidacaoFiscalList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IHistoricoValidacaoFiscal;
    procedure SetItems(AIndex: Integer; const Value: IHistoricoValidacaoFiscal);
  public
    constructor Create;
    procedure Add(const AHistoricoValidacaoFiscal: IHistoricoValidacaoFiscal);
    destructor Destroy; override;
    function GetEnumerator: THistoricoValidacaoFiscalListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: THistoricoValidacaoFiscalList;
    property Items[AIndex: Integer]: IHistoricoValidacaoFiscal read GetItems write SetItems; default;
  end;

  THistoricoValidacaoFiscalListRec = record
  private
    FList: IHistoricoValidacaoFiscalList;
  public
    class function Create(const AList: IHistoricoValidacaoFiscalList): THistoricoValidacaoFiscalListRec; static;
    class operator Implicit(AListRec: THistoricoValidacaoFiscalListRec): THistoricoValidacaoFiscalList;
  end;

  THistoricoValidacaoFiscal = class(TInterfacedModel, IHistoricoValidacaoFiscal)
  private
	FId: Int64;
	FDataAlteracao: TDateTime;
	FFundamentoEstadual: TString;
	FFundamentoFederal: TString;
	FResponsavel: TResponsavelValidacao;
	FImpostoFederalId: Integer;
	FUsuarioId: Int64;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDataAlteracao: TDateTime;
    procedure SetDataAlteracao(const ADataAlteracao: TDateTime);
    function GetFundamentoEstadual: TString;
    procedure SetFundamentoEstadual(const AFundamentoEstadual: TString);
    function GetFundamentoFederal: TString;
    procedure SetFundamentoFederal(const AFundamentoFederal: TString);
    function GetResponsavel: TResponsavelValidacao;
    procedure SetResponsavel(const AResponsavel: TResponsavelValidacao);
    function GetImpostoFederalId: Integer;
    procedure SetImpostoFederalId(const AImpostoFederalId: Integer);
    function GetUsuarioId: Int64;
    procedure SetUsuarioId(const AUsuarioId: Int64);
  public
    property Id: Int64 read GetId write SetId;
    property DataAlteracao: TDateTime read GetDataAlteracao write SetDataAlteracao;
    property FundamentoEstadual: TString read GetFundamentoEstadual write SetFundamentoEstadual;
    property FundamentoFederal: TString read GetFundamentoFederal write SetFundamentoFederal;
    property Responsavel: TResponsavelValidacao read GetResponsavel write SetResponsavel;
    property ImpostoFederalId: Integer read GetImpostoFederalId write SetImpostoFederalId;
    property UsuarioId: Int64 read GetUsuarioId write SetUsuarioId;
  end;

implementation

{ THistoricoValidacaoFiscalList }

procedure THistoricoValidacaoFiscalList.Add(const AHistoricoValidacaoFiscal: IHistoricoValidacaoFiscal);
begin
  FList.Add(AHistoricoValidacaoFiscal);
end;

procedure THistoricoValidacaoFiscalList.Clear;
begin
  FList.Clear;
end;

function THistoricoValidacaoFiscalList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor THistoricoValidacaoFiscalList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor THistoricoValidacaoFiscalList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function THistoricoValidacaoFiscalList.GetEnumerator: THistoricoValidacaoFiscalListEnumerator;
begin
  Result := THistoricoValidacaoFiscalListEnumerator.Create(Self);
end;

function THistoricoValidacaoFiscalList.GetItems(AIndex: Integer): IHistoricoValidacaoFiscal;
begin
  Result := FList[AIndex] as IHistoricoValidacaoFiscal;
end;

function THistoricoValidacaoFiscalList.GetReference: THistoricoValidacaoFiscalList;
begin
  Result := Self;
end;

procedure THistoricoValidacaoFiscalList.SetItems(AIndex: Integer; const Value: IHistoricoValidacaoFiscal);
begin
  FList[AIndex] := Value;
end;

{ THistoricoValidacaoFiscalListEnumerator }

constructor THistoricoValidacaoFiscalListEnumerator.Create(AHistoricoValidacaoFiscalList: THistoricoValidacaoFiscalList);
begin
  inherited Create;
  FIndex := -1;
  FHistoricoValidacaoFiscalList := AHistoricoValidacaoFiscalList;
end;

function THistoricoValidacaoFiscalListEnumerator.GetCurrent: IHistoricoValidacaoFiscal;
begin
  Result := FHistoricoValidacaoFiscalList[FIndex];
end;

function THistoricoValidacaoFiscalListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FHistoricoValidacaoFiscalList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ THistoricoValidacaoFiscalListRec }

class function THistoricoValidacaoFiscalListRec.Create(const AList: IHistoricoValidacaoFiscalList): THistoricoValidacaoFiscalListRec;
begin
  FillChar(Result, SizeOf(THistoricoValidacaoFiscalListRec), 0);
  Result.FList := AList;
end;

class operator THistoricoValidacaoFiscalListRec.Implicit(AListRec: THistoricoValidacaoFiscalListRec): THistoricoValidacaoFiscalList;
begin
  Result := AListRec.FList.GetReference;
end;

{ THistoricoValidacaoFiscal }

function THistoricoValidacaoFiscal.GetId: Int64;
begin
  Result := FId;
end;

procedure THistoricoValidacaoFiscal.SetId(const AId: Int64);
begin
  FId := AId;
end;

function THistoricoValidacaoFiscal.GetDataAlteracao: TDateTime;
begin
  Result := FDataAlteracao;
end;

procedure THistoricoValidacaoFiscal.SetDataAlteracao(const ADataAlteracao: TDateTime);
begin
  FDataAlteracao := ADataAlteracao;
end;

function THistoricoValidacaoFiscal.GetFundamentoEstadual: TString;
begin
  Result := FFundamentoEstadual;
end;

procedure THistoricoValidacaoFiscal.SetFundamentoEstadual(const AFundamentoEstadual: TString);
begin
  FFundamentoEstadual := AFundamentoEstadual;
end;

function THistoricoValidacaoFiscal.GetFundamentoFederal: TString;
begin
  Result := FFundamentoFederal;
end;

procedure THistoricoValidacaoFiscal.SetFundamentoFederal(const AFundamentoFederal: TString);
begin
  FFundamentoFederal := AFundamentoFederal;
end;

function THistoricoValidacaoFiscal.GetResponsavel: TResponsavelValidacao;
begin
  Result := FResponsavel;
end;

procedure THistoricoValidacaoFiscal.SetResponsavel(const AResponsavel: TResponsavelValidacao);
begin
  FResponsavel := AResponsavel;
end;

function THistoricoValidacaoFiscal.GetImpostoFederalId: Integer;
begin
  Result := FImpostoFederalId;
end;

procedure THistoricoValidacaoFiscal.SetImpostoFederalId(const AImpostoFederalId: Integer);
begin
  FImpostoFederalId := AImpostoFederalId;
end;

function THistoricoValidacaoFiscal.GetUsuarioId: Int64;
begin
  Result := FUsuarioId;
end;

procedure THistoricoValidacaoFiscal.SetUsuarioId(const AUsuarioId: Int64);
begin
  FUsuarioId := AUsuarioId;
end;


end.
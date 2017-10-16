unit SDK.Model.Caixa;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ICaixa = interface(IModel)
    ['{15F9E255-E8F9-497E-BD0E-74F21B42CE84}']
    function GetId: TString;
    procedure SetId(const AId: TString);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetSerieDoEquipamento: TString;
    procedure SetSerieDoEquipamento(const ASerieDoEquipamento: TString);
    function GetPercentualLivreDaMFD: Double;
    procedure SetPercentualLivreDaMFD(const APercentualLivreDaMFD: Double);
    function GetVersao: TString;
    procedure SetVersao(const AVersao: TString);
    function GetDataDaUltimaVenda: TDateTime;
    procedure SetDataDaUltimaVenda(const ADataDaUltimaVenda: TDateTime);
    function GetHora: TString;
    procedure SetHora(const AHora: TString);
    function GetHashMd5DoPaf: TString;
    procedure SetHashMd5DoPaf(const AHashMd5DoPaf: TString);
    function GetVisivelNoMonitoramento: Boolean;
    procedure SetVisivelNoMonitoramento(const AVisivelNoMonitoramento: Boolean);
    function GetTipoFrenteLoja: TTipoFrenteLoja;
    procedure SetTipoFrenteLoja(const ATipoFrenteLoja: TTipoFrenteLoja);
    property Id: TString read GetId write SetId;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property SerieDoEquipamento: TString read GetSerieDoEquipamento write SetSerieDoEquipamento;
    property PercentualLivreDaMFD: Double read GetPercentualLivreDaMFD write SetPercentualLivreDaMFD;
    property Versao: TString read GetVersao write SetVersao;
    property DataDaUltimaVenda: TDateTime read GetDataDaUltimaVenda write SetDataDaUltimaVenda;
    property Hora: TString read GetHora write SetHora;
    property HashMd5DoPaf: TString read GetHashMd5DoPaf write SetHashMd5DoPaf;
    property VisivelNoMonitoramento: Boolean read GetVisivelNoMonitoramento write SetVisivelNoMonitoramento;
    property TipoFrenteLoja: TTipoFrenteLoja read GetTipoFrenteLoja write SetTipoFrenteLoja;
  end;

  TCaixaList = class;

  ICaixaList = interface
	['{A6640812-180D-4453-B6F3-9FAC53DD872A}']
    function GetReference: TCaixaList;
    function GetItems(AIndex: Integer): ICaixa;
    procedure SetItems(AIndex: Integer; const Value: ICaixa);
    procedure Add(const ACaixa: ICaixa);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ICaixa read GetItems write SetItems; default;
  end;

  TCaixaListEnumerator = class
  private
    FIndex: Integer;
    FCaixaList: TCaixaList;
  public
    constructor Create(ACaixaList: TCaixaList);
    function GetCurrent: ICaixa; inline;
    function MoveNext: Boolean;
    property Current: ICaixa read GetCurrent;
  end;

  TCaixaList = class(TInterfacedObject, ICaixaList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ICaixa;
    procedure SetItems(AIndex: Integer; const Value: ICaixa);
  public
    constructor Create;
    procedure Add(const ACaixa: ICaixa);
    destructor Destroy; override;
    function GetEnumerator: TCaixaListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TCaixaList;
    property Items[AIndex: Integer]: ICaixa read GetItems write SetItems; default;
  end;

  TCaixaListRec = record
  private
    FList: ICaixaList;
  public
    class function Create(const AList: ICaixaList): TCaixaListRec; static;
    class operator Implicit(AListRec: TCaixaListRec): TCaixaList;
  end;

  TCaixa = class(TInterfacedModel, ICaixa)
  private
	FId: TString;
	FLojaId: Int64;
	FSerieDoEquipamento: TString;
	FPercentualLivreDaMFD: Double;
	FVersao: TString;
	FDataDaUltimaVenda: TDateTime;
	FHora: TString;
	FHashMd5DoPaf: TString;
	FVisivelNoMonitoramento: Boolean;
	FTipoFrenteLoja: TTipoFrenteLoja;
    function GetId: TString;
    procedure SetId(const AId: TString);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetSerieDoEquipamento: TString;
    procedure SetSerieDoEquipamento(const ASerieDoEquipamento: TString);
    function GetPercentualLivreDaMFD: Double;
    procedure SetPercentualLivreDaMFD(const APercentualLivreDaMFD: Double);
    function GetVersao: TString;
    procedure SetVersao(const AVersao: TString);
    function GetDataDaUltimaVenda: TDateTime;
    procedure SetDataDaUltimaVenda(const ADataDaUltimaVenda: TDateTime);
    function GetHora: TString;
    procedure SetHora(const AHora: TString);
    function GetHashMd5DoPaf: TString;
    procedure SetHashMd5DoPaf(const AHashMd5DoPaf: TString);
    function GetVisivelNoMonitoramento: Boolean;
    procedure SetVisivelNoMonitoramento(const AVisivelNoMonitoramento: Boolean);
    function GetTipoFrenteLoja: TTipoFrenteLoja;
    procedure SetTipoFrenteLoja(const ATipoFrenteLoja: TTipoFrenteLoja);
  public
    property Id: TString read GetId write SetId;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property SerieDoEquipamento: TString read GetSerieDoEquipamento write SetSerieDoEquipamento;
    property PercentualLivreDaMFD: Double read GetPercentualLivreDaMFD write SetPercentualLivreDaMFD;
    property Versao: TString read GetVersao write SetVersao;
    property DataDaUltimaVenda: TDateTime read GetDataDaUltimaVenda write SetDataDaUltimaVenda;
    property Hora: TString read GetHora write SetHora;
    property HashMd5DoPaf: TString read GetHashMd5DoPaf write SetHashMd5DoPaf;
    property VisivelNoMonitoramento: Boolean read GetVisivelNoMonitoramento write SetVisivelNoMonitoramento;
    property TipoFrenteLoja: TTipoFrenteLoja read GetTipoFrenteLoja write SetTipoFrenteLoja;
  end;

implementation

{ TCaixaList }

procedure TCaixaList.Add(const ACaixa: ICaixa);
begin
  FList.Add(ACaixa);
end;

procedure TCaixaList.Clear;
begin
  FList.Clear;
end;

function TCaixaList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TCaixaList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TCaixaList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TCaixaList.GetEnumerator: TCaixaListEnumerator;
begin
  Result := TCaixaListEnumerator.Create(Self);
end;

function TCaixaList.GetItems(AIndex: Integer): ICaixa;
begin
  Result := FList[AIndex] as ICaixa;
end;

function TCaixaList.GetReference: TCaixaList;
begin
  Result := Self;
end;

procedure TCaixaList.SetItems(AIndex: Integer; const Value: ICaixa);
begin
  FList[AIndex] := Value;
end;

{ TCaixaListEnumerator }

constructor TCaixaListEnumerator.Create(ACaixaList: TCaixaList);
begin
  inherited Create;
  FIndex := -1;
  FCaixaList := ACaixaList;
end;

function TCaixaListEnumerator.GetCurrent: ICaixa;
begin
  Result := FCaixaList[FIndex];
end;

function TCaixaListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FCaixaList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TCaixaListRec }

class function TCaixaListRec.Create(const AList: ICaixaList): TCaixaListRec;
begin
  FillChar(Result, SizeOf(TCaixaListRec), 0);
  Result.FList := AList;
end;

class operator TCaixaListRec.Implicit(AListRec: TCaixaListRec): TCaixaList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TCaixa }

function TCaixa.GetId: TString;
begin
  Result := FId;
end;

procedure TCaixa.SetId(const AId: TString);
begin
  FId := AId;
end;

function TCaixa.GetLojaId: Int64;
begin
  Result := FLojaId;
end;

procedure TCaixa.SetLojaId(const ALojaId: Int64);
begin
  FLojaId := ALojaId;
end;

function TCaixa.GetSerieDoEquipamento: TString;
begin
  Result := FSerieDoEquipamento;
end;

procedure TCaixa.SetSerieDoEquipamento(const ASerieDoEquipamento: TString);
begin
  FSerieDoEquipamento := ASerieDoEquipamento;
end;

function TCaixa.GetPercentualLivreDaMFD: Double;
begin
  Result := FPercentualLivreDaMFD;
end;

procedure TCaixa.SetPercentualLivreDaMFD(const APercentualLivreDaMFD: Double);
begin
  FPercentualLivreDaMFD := APercentualLivreDaMFD;
end;

function TCaixa.GetVersao: TString;
begin
  Result := FVersao;
end;

procedure TCaixa.SetVersao(const AVersao: TString);
begin
  FVersao := AVersao;
end;

function TCaixa.GetDataDaUltimaVenda: TDateTime;
begin
  Result := FDataDaUltimaVenda;
end;

procedure TCaixa.SetDataDaUltimaVenda(const ADataDaUltimaVenda: TDateTime);
begin
  FDataDaUltimaVenda := ADataDaUltimaVenda;
end;

function TCaixa.GetHora: TString;
begin
  Result := FHora;
end;

procedure TCaixa.SetHora(const AHora: TString);
begin
  FHora := AHora;
end;

function TCaixa.GetHashMd5DoPaf: TString;
begin
  Result := FHashMd5DoPaf;
end;

procedure TCaixa.SetHashMd5DoPaf(const AHashMd5DoPaf: TString);
begin
  FHashMd5DoPaf := AHashMd5DoPaf;
end;

function TCaixa.GetVisivelNoMonitoramento: Boolean;
begin
  Result := FVisivelNoMonitoramento;
end;

procedure TCaixa.SetVisivelNoMonitoramento(const AVisivelNoMonitoramento: Boolean);
begin
  FVisivelNoMonitoramento := AVisivelNoMonitoramento;
end;

function TCaixa.GetTipoFrenteLoja: TTipoFrenteLoja;
begin
  Result := FTipoFrenteLoja;
end;

procedure TCaixa.SetTipoFrenteLoja(const ATipoFrenteLoja: TTipoFrenteLoja);
begin
  FTipoFrenteLoja := ATipoFrenteLoja;
end;


end.
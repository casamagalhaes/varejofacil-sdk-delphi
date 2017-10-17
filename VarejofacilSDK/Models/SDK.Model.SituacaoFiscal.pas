unit SDK.Model.SituacaoFiscal;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ISituacaoFiscal = interface(IModel)
    ['{204DD0F9-3E82-4EF8-9488-7A3BE1D64A85}']
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetDescricaoCompleta: TString;
    procedure SetDescricaoCompleta(const ADescricaoCompleta: TString);
    function GetSubstituto: Boolean;
    procedure SetSubstituto(const ASubstituto: Boolean);
    function GetTributacaoRms: TString;
    procedure SetTributacaoRms(const ATributacaoRms: TString);
    property Id: Integer read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property DescricaoCompleta: TString read GetDescricaoCompleta write SetDescricaoCompleta;
    property Substituto: Boolean read GetSubstituto write SetSubstituto;
    property TributacaoRms: TString read GetTributacaoRms write SetTributacaoRms;
  end;

  TSituacaoFiscalList = class;

  ISituacaoFiscalList = interface
	['{A6665D07-D8FA-405E-9447-004006E1DD51}']
    function GetReference: TSituacaoFiscalList;
    function GetItems(AIndex: Integer): ISituacaoFiscal;
    procedure SetItems(AIndex: Integer; const Value: ISituacaoFiscal);
    procedure Add(const ASituacaoFiscal: ISituacaoFiscal);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ISituacaoFiscal read GetItems write SetItems; default;
  end;

  TSituacaoFiscalListEnumerator = class
  private
    FIndex: Integer;
    FSituacaoFiscalList: TSituacaoFiscalList;
  public
    constructor Create(ASituacaoFiscalList: TSituacaoFiscalList);
    function GetCurrent: ISituacaoFiscal; inline;
    function MoveNext: Boolean;
    property Current: ISituacaoFiscal read GetCurrent;
  end;

  TSituacaoFiscalList = class(TInterfacedObject, ISituacaoFiscalList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ISituacaoFiscal;
    procedure SetItems(AIndex: Integer; const Value: ISituacaoFiscal);
  public
    constructor Create;
    procedure Add(const ASituacaoFiscal: ISituacaoFiscal);
    destructor Destroy; override;
    function GetEnumerator: TSituacaoFiscalListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TSituacaoFiscalList;
    property Items[AIndex: Integer]: ISituacaoFiscal read GetItems write SetItems; default;
  end;

  TSituacaoFiscalListRec = record
  private
    FList: ISituacaoFiscalList;
  public
    class function Create(const AList: ISituacaoFiscalList): TSituacaoFiscalListRec; static;
    class operator Implicit(AListRec: TSituacaoFiscalListRec): TSituacaoFiscalList;
  end;

  TSituacaoFiscal = class(TInterfacedModel, ISituacaoFiscal)
  private
	FId: Integer;
	FDescricao: TString;
	FDescricaoCompleta: TString;
	FSubstituto: Boolean;
	FTributacaoRms: TString;
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetDescricaoCompleta: TString;
    procedure SetDescricaoCompleta(const ADescricaoCompleta: TString);
    function GetSubstituto: Boolean;
    procedure SetSubstituto(const ASubstituto: Boolean);
    function GetTributacaoRms: TString;
    procedure SetTributacaoRms(const ATributacaoRms: TString);
  published
    property Id: Integer read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property DescricaoCompleta: TString read GetDescricaoCompleta write SetDescricaoCompleta;
    property Substituto: Boolean read GetSubstituto write SetSubstituto;
    property TributacaoRms: TString read GetTributacaoRms write SetTributacaoRms;
  end;

implementation

{ TSituacaoFiscalList }

procedure TSituacaoFiscalList.Add(const ASituacaoFiscal: ISituacaoFiscal);
begin
  FList.Add(ASituacaoFiscal);
end;

procedure TSituacaoFiscalList.Clear;
begin
  FList.Clear;
end;

function TSituacaoFiscalList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TSituacaoFiscalList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TSituacaoFiscalList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TSituacaoFiscalList.GetEnumerator: TSituacaoFiscalListEnumerator;
begin
  Result := TSituacaoFiscalListEnumerator.Create(Self);
end;

function TSituacaoFiscalList.GetItems(AIndex: Integer): ISituacaoFiscal;
begin
  Result := FList[AIndex] as ISituacaoFiscal;
end;

function TSituacaoFiscalList.GetReference: TSituacaoFiscalList;
begin
  Result := Self;
end;

procedure TSituacaoFiscalList.SetItems(AIndex: Integer; const Value: ISituacaoFiscal);
begin
  FList[AIndex] := Value;
end;

{ TSituacaoFiscalListEnumerator }

constructor TSituacaoFiscalListEnumerator.Create(ASituacaoFiscalList: TSituacaoFiscalList);
begin
  inherited Create;
  FIndex := -1;
  FSituacaoFiscalList := ASituacaoFiscalList;
end;

function TSituacaoFiscalListEnumerator.GetCurrent: ISituacaoFiscal;
begin
  Result := FSituacaoFiscalList[FIndex];
end;

function TSituacaoFiscalListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FSituacaoFiscalList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TSituacaoFiscalListRec }

class function TSituacaoFiscalListRec.Create(const AList: ISituacaoFiscalList): TSituacaoFiscalListRec;
begin
  FillChar(Result, SizeOf(TSituacaoFiscalListRec), 0);
  Result.FList := AList;
end;

class operator TSituacaoFiscalListRec.Implicit(AListRec: TSituacaoFiscalListRec): TSituacaoFiscalList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TSituacaoFiscal }

function TSituacaoFiscal.GetId: Integer;
begin
  Result := FId;
end;

procedure TSituacaoFiscal.SetId(const AId: Integer);
begin
  FId := AId;
end;

function TSituacaoFiscal.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TSituacaoFiscal.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

function TSituacaoFiscal.GetDescricaoCompleta: TString;
begin
  Result := FDescricaoCompleta;
end;

procedure TSituacaoFiscal.SetDescricaoCompleta(const ADescricaoCompleta: TString);
begin
  FDescricaoCompleta := ADescricaoCompleta;
end;

function TSituacaoFiscal.GetSubstituto: Boolean;
begin
  Result := FSubstituto;
end;

procedure TSituacaoFiscal.SetSubstituto(const ASubstituto: Boolean);
begin
  FSubstituto := ASubstituto;
end;

function TSituacaoFiscal.GetTributacaoRms: TString;
begin
  Result := FTributacaoRms;
end;

procedure TSituacaoFiscal.SetTributacaoRms(const ATributacaoRms: TString);
begin
  FTributacaoRms := ATributacaoRms;
end;


end.
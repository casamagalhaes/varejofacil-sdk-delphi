unit SDK.Model.CSTEstadual;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ICSTEstadual = interface(IModel)
    ['{79388BAB-1CAF-4714-8BCD-90CB485586C5}']
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetIcmsNormal: Boolean;
    procedure SetIcmsNormal(const AIcmsNormal: Boolean);
    function GetIcmsSubstituto: Boolean;
    procedure SetIcmsSubstituto(const AIcmsSubstituto: Boolean);
    function GetIcmsReducao: Boolean;
    procedure SetIcmsReducao(const AIcmsReducao: Boolean);
    property Id: Integer read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property IcmsNormal: Boolean read GetIcmsNormal write SetIcmsNormal;
    property IcmsSubstituto: Boolean read GetIcmsSubstituto write SetIcmsSubstituto;
    property IcmsReducao: Boolean read GetIcmsReducao write SetIcmsReducao;
  end;

  TCSTEstadualList = class;

  ICSTEstadualList = interface
	['{0551238C-CACA-451A-AD29-E05684975054}']
    function GetReference: TCSTEstadualList;
    function GetItems(AIndex: Integer): ICSTEstadual;
    procedure SetItems(AIndex: Integer; const Value: ICSTEstadual);
    procedure Add(const ACSTEstadual: ICSTEstadual);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ICSTEstadual read GetItems write SetItems; default;
  end;

  TCSTEstadualListEnumerator = class
  private
    FIndex: Integer;
    FCSTEstadualList: TCSTEstadualList;
  public
    constructor Create(ACSTEstadualList: TCSTEstadualList);
    function GetCurrent: ICSTEstadual; inline;
    function MoveNext: Boolean;
    property Current: ICSTEstadual read GetCurrent;
  end;

  TCSTEstadualList = class(TInterfacedObject, ICSTEstadualList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ICSTEstadual;
    procedure SetItems(AIndex: Integer; const Value: ICSTEstadual);
  public
    constructor Create;
    procedure Add(const ACSTEstadual: ICSTEstadual);
    destructor Destroy; override;
    function GetEnumerator: TCSTEstadualListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TCSTEstadualList;
    property Items[AIndex: Integer]: ICSTEstadual read GetItems write SetItems; default;
  end;

  TCSTEstadualListRec = record
  private
    FList: ICSTEstadualList;
  public
    class function Create(const AList: ICSTEstadualList): TCSTEstadualListRec; static;
    class operator Implicit(AListRec: TCSTEstadualListRec): TCSTEstadualList;
  end;

  TCSTEstadual = class(TInterfacedModel, ICSTEstadual)
  private
	FId: Integer;
	FDescricao: TString;
	FIcmsNormal: Boolean;
	FIcmsSubstituto: Boolean;
	FIcmsReducao: Boolean;
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetIcmsNormal: Boolean;
    procedure SetIcmsNormal(const AIcmsNormal: Boolean);
    function GetIcmsSubstituto: Boolean;
    procedure SetIcmsSubstituto(const AIcmsSubstituto: Boolean);
    function GetIcmsReducao: Boolean;
    procedure SetIcmsReducao(const AIcmsReducao: Boolean);
  published
    property Id: Integer read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property IcmsNormal: Boolean read GetIcmsNormal write SetIcmsNormal;
    property IcmsSubstituto: Boolean read GetIcmsSubstituto write SetIcmsSubstituto;
    property IcmsReducao: Boolean read GetIcmsReducao write SetIcmsReducao;
  end;

implementation

{ TCSTEstadualList }

procedure TCSTEstadualList.Add(const ACSTEstadual: ICSTEstadual);
begin
  FList.Add(ACSTEstadual);
end;

procedure TCSTEstadualList.Clear;
begin
  FList.Clear;
end;

function TCSTEstadualList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TCSTEstadualList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TCSTEstadualList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TCSTEstadualList.GetEnumerator: TCSTEstadualListEnumerator;
begin
  Result := TCSTEstadualListEnumerator.Create(Self);
end;

function TCSTEstadualList.GetItems(AIndex: Integer): ICSTEstadual;
begin
  Result := FList[AIndex] as ICSTEstadual;
end;

function TCSTEstadualList.GetReference: TCSTEstadualList;
begin
  Result := Self;
end;

procedure TCSTEstadualList.SetItems(AIndex: Integer; const Value: ICSTEstadual);
begin
  FList[AIndex] := Value;
end;

{ TCSTEstadualListEnumerator }

constructor TCSTEstadualListEnumerator.Create(ACSTEstadualList: TCSTEstadualList);
begin
  inherited Create;
  FIndex := -1;
  FCSTEstadualList := ACSTEstadualList;
end;

function TCSTEstadualListEnumerator.GetCurrent: ICSTEstadual;
begin
  Result := FCSTEstadualList[FIndex];
end;

function TCSTEstadualListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FCSTEstadualList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TCSTEstadualListRec }

class function TCSTEstadualListRec.Create(const AList: ICSTEstadualList): TCSTEstadualListRec;
begin
  FillChar(Result, SizeOf(TCSTEstadualListRec), 0);
  Result.FList := AList;
end;

class operator TCSTEstadualListRec.Implicit(AListRec: TCSTEstadualListRec): TCSTEstadualList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TCSTEstadual }

function TCSTEstadual.GetId: Integer;
begin
  Result := FId;
end;

procedure TCSTEstadual.SetId(const AId: Integer);
begin
  FId := AId;
end;

function TCSTEstadual.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TCSTEstadual.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

function TCSTEstadual.GetIcmsNormal: Boolean;
begin
  Result := FIcmsNormal;
end;

procedure TCSTEstadual.SetIcmsNormal(const AIcmsNormal: Boolean);
begin
  FIcmsNormal := AIcmsNormal;
end;

function TCSTEstadual.GetIcmsSubstituto: Boolean;
begin
  Result := FIcmsSubstituto;
end;

procedure TCSTEstadual.SetIcmsSubstituto(const AIcmsSubstituto: Boolean);
begin
  FIcmsSubstituto := AIcmsSubstituto;
end;

function TCSTEstadual.GetIcmsReducao: Boolean;
begin
  Result := FIcmsReducao;
end;

procedure TCSTEstadual.SetIcmsReducao(const AIcmsReducao: Boolean);
begin
  FIcmsReducao := AIcmsReducao;
end;


end.
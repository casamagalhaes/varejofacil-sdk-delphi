unit SDK.Model.Cfop;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ICfop = interface(IModel)
    ['{117BF5DD-E3BA-4461-A2E1-770CFFAABCDB}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetCstICMSId: Integer;
    procedure SetCstICMSId(const ACstICMSId: Integer);
    function GetCsosn: TCSOSN;
    procedure SetCsosn(const ACsosn: TCSOSN);
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property CstICMSId: Integer read GetCstICMSId write SetCstICMSId;
    property Csosn: TCSOSN read GetCsosn write SetCsosn;
  end;

  TCfopList = class;

  ICfopList = interface
	['{24403026-B4FC-4F2F-ABF0-2D8B72D4EF48}']
    function GetReference: TCfopList;
    function GetItems(AIndex: Integer): ICfop;
    procedure SetItems(AIndex: Integer; const Value: ICfop);
    procedure Add(const ACfop: ICfop);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ICfop read GetItems write SetItems; default;
  end;

  TCfopListEnumerator = class
  private
    FIndex: Integer;
    FCfopList: TCfopList;
  public
    constructor Create(ACfopList: TCfopList);
    function GetCurrent: ICfop; inline;
    function MoveNext: Boolean;
    property Current: ICfop read GetCurrent;
  end;

  TCfopList = class(TInterfacedObject, ICfopList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ICfop;
    procedure SetItems(AIndex: Integer; const Value: ICfop);
  public
    constructor Create;
    procedure Add(const ACfop: ICfop);
    destructor Destroy; override;
    function GetEnumerator: TCfopListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TCfopList;
    property Items[AIndex: Integer]: ICfop read GetItems write SetItems; default;
  end;

  TCfopListRec = record
  private
    FList: ICfopList;
  public
    class function Create(const AList: ICfopList): TCfopListRec; static;
    class operator Implicit(AListRec: TCfopListRec): TCfopList;
  end;

  TCfop = class(TInterfacedModel, ICfop)
  private
	FId: Int64;
	FDescricao: TString;
	FCstICMSId: Integer;
	FCsosn: TCSOSN;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetCstICMSId: Integer;
    procedure SetCstICMSId(const ACstICMSId: Integer);
    function GetCsosn: TCSOSN;
    procedure SetCsosn(const ACsosn: TCSOSN);
  published
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property CstICMSId: Integer read GetCstICMSId write SetCstICMSId;
    property Csosn: TCSOSN read GetCsosn write SetCsosn;
  end;

implementation

{ TCfopList }

procedure TCfopList.Add(const ACfop: ICfop);
begin
  FList.Add(ACfop);
end;

procedure TCfopList.Clear;
begin
  FList.Clear;
end;

function TCfopList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TCfopList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TCfopList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TCfopList.GetEnumerator: TCfopListEnumerator;
begin
  Result := TCfopListEnumerator.Create(Self);
end;

function TCfopList.GetItems(AIndex: Integer): ICfop;
begin
  Result := FList[AIndex] as ICfop;
end;

function TCfopList.GetReference: TCfopList;
begin
  Result := Self;
end;

procedure TCfopList.SetItems(AIndex: Integer; const Value: ICfop);
begin
  FList[AIndex] := Value;
end;

{ TCfopListEnumerator }

constructor TCfopListEnumerator.Create(ACfopList: TCfopList);
begin
  inherited Create;
  FIndex := -1;
  FCfopList := ACfopList;
end;

function TCfopListEnumerator.GetCurrent: ICfop;
begin
  Result := FCfopList[FIndex];
end;

function TCfopListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FCfopList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TCfopListRec }

class function TCfopListRec.Create(const AList: ICfopList): TCfopListRec;
begin
  FillChar(Result, SizeOf(TCfopListRec), 0);
  Result.FList := AList;
end;

class operator TCfopListRec.Implicit(AListRec: TCfopListRec): TCfopList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TCfop }

function TCfop.GetId: Int64;
begin
  Result := FId;
end;

procedure TCfop.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TCfop.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TCfop.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

function TCfop.GetCstICMSId: Integer;
begin
  Result := FCstICMSId;
end;

procedure TCfop.SetCstICMSId(const ACstICMSId: Integer);
begin
  FCstICMSId := ACstICMSId;
end;

function TCfop.GetCsosn: TCSOSN;
begin
  Result := FCsosn;
end;

procedure TCfop.SetCsosn(const ACsosn: TCSOSN);
begin
  FCsosn := ACsosn;
end;


end.
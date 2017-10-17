unit SDK.Model.FuncaoDoPDV;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IFuncaoDoPDV = interface(IModel)
    ['{94DF3445-FA87-4C8C-A583-FB7CFBE1AF97}']
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetAcesso: TString;
    procedure SetAcesso(const AAcesso: TString);
    function GetHabilitaF1: Boolean;
    procedure SetHabilitaF1(const AHabilitaF1: Boolean);
    property Id: Integer read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property Acesso: TString read GetAcesso write SetAcesso;
    property HabilitaF1: Boolean read GetHabilitaF1 write SetHabilitaF1;
  end;

  TFuncaoDoPDVList = class;

  IFuncaoDoPDVList = interface
	['{E4F09EB9-DE45-4795-ABC5-4E99BE2ED92A}']
    function GetReference: TFuncaoDoPDVList;
    function GetItems(AIndex: Integer): IFuncaoDoPDV;
    procedure SetItems(AIndex: Integer; const Value: IFuncaoDoPDV);
    procedure Add(const AFuncaoDoPDV: IFuncaoDoPDV);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IFuncaoDoPDV read GetItems write SetItems; default;
  end;

  TFuncaoDoPDVListEnumerator = class
  private
    FIndex: Integer;
    FFuncaoDoPDVList: TFuncaoDoPDVList;
  public
    constructor Create(AFuncaoDoPDVList: TFuncaoDoPDVList);
    function GetCurrent: IFuncaoDoPDV; inline;
    function MoveNext: Boolean;
    property Current: IFuncaoDoPDV read GetCurrent;
  end;

  TFuncaoDoPDVList = class(TInterfacedObject, IFuncaoDoPDVList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IFuncaoDoPDV;
    procedure SetItems(AIndex: Integer; const Value: IFuncaoDoPDV);
  public
    constructor Create;
    procedure Add(const AFuncaoDoPDV: IFuncaoDoPDV);
    destructor Destroy; override;
    function GetEnumerator: TFuncaoDoPDVListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TFuncaoDoPDVList;
    property Items[AIndex: Integer]: IFuncaoDoPDV read GetItems write SetItems; default;
  end;

  TFuncaoDoPDVListRec = record
  private
    FList: IFuncaoDoPDVList;
  public
    class function Create(const AList: IFuncaoDoPDVList): TFuncaoDoPDVListRec; static;
    class operator Implicit(AListRec: TFuncaoDoPDVListRec): TFuncaoDoPDVList;
  end;

  TFuncaoDoPDV = class(TInterfacedModel, IFuncaoDoPDV)
  private
	FId: Integer;
	FDescricao: TString;
	FAcesso: TString;
	FHabilitaF1: Boolean;
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetAcesso: TString;
    procedure SetAcesso(const AAcesso: TString);
    function GetHabilitaF1: Boolean;
    procedure SetHabilitaF1(const AHabilitaF1: Boolean);
  published
    property Id: Integer read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property Acesso: TString read GetAcesso write SetAcesso;
    property HabilitaF1: Boolean read GetHabilitaF1 write SetHabilitaF1;
  end;

implementation

{ TFuncaoDoPDVList }

procedure TFuncaoDoPDVList.Add(const AFuncaoDoPDV: IFuncaoDoPDV);
begin
  FList.Add(AFuncaoDoPDV);
end;

procedure TFuncaoDoPDVList.Clear;
begin
  FList.Clear;
end;

function TFuncaoDoPDVList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TFuncaoDoPDVList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TFuncaoDoPDVList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TFuncaoDoPDVList.GetEnumerator: TFuncaoDoPDVListEnumerator;
begin
  Result := TFuncaoDoPDVListEnumerator.Create(Self);
end;

function TFuncaoDoPDVList.GetItems(AIndex: Integer): IFuncaoDoPDV;
begin
  Result := FList[AIndex] as IFuncaoDoPDV;
end;

function TFuncaoDoPDVList.GetReference: TFuncaoDoPDVList;
begin
  Result := Self;
end;

procedure TFuncaoDoPDVList.SetItems(AIndex: Integer; const Value: IFuncaoDoPDV);
begin
  FList[AIndex] := Value;
end;

{ TFuncaoDoPDVListEnumerator }

constructor TFuncaoDoPDVListEnumerator.Create(AFuncaoDoPDVList: TFuncaoDoPDVList);
begin
  inherited Create;
  FIndex := -1;
  FFuncaoDoPDVList := AFuncaoDoPDVList;
end;

function TFuncaoDoPDVListEnumerator.GetCurrent: IFuncaoDoPDV;
begin
  Result := FFuncaoDoPDVList[FIndex];
end;

function TFuncaoDoPDVListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FFuncaoDoPDVList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TFuncaoDoPDVListRec }

class function TFuncaoDoPDVListRec.Create(const AList: IFuncaoDoPDVList): TFuncaoDoPDVListRec;
begin
  FillChar(Result, SizeOf(TFuncaoDoPDVListRec), 0);
  Result.FList := AList;
end;

class operator TFuncaoDoPDVListRec.Implicit(AListRec: TFuncaoDoPDVListRec): TFuncaoDoPDVList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TFuncaoDoPDV }

function TFuncaoDoPDV.GetId: Integer;
begin
  Result := FId;
end;

procedure TFuncaoDoPDV.SetId(const AId: Integer);
begin
  FId := AId;
end;

function TFuncaoDoPDV.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TFuncaoDoPDV.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

function TFuncaoDoPDV.GetAcesso: TString;
begin
  Result := FAcesso;
end;

procedure TFuncaoDoPDV.SetAcesso(const AAcesso: TString);
begin
  FAcesso := AAcesso;
end;

function TFuncaoDoPDV.GetHabilitaF1: Boolean;
begin
  Result := FHabilitaF1;
end;

procedure TFuncaoDoPDV.SetHabilitaF1(const AHabilitaF1: Boolean);
begin
  FHabilitaF1 := AHabilitaF1;
end;


end.
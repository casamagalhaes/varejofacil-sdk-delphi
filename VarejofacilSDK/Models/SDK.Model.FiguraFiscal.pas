unit SDK.Model.FiguraFiscal;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IFiguraFiscal = interface(IModel)
    ['{CCA55757-6C18-437F-AFB7-58E531C02A53}']
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    property Id: Integer read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
  end;

  TFiguraFiscalList = class;

  IFiguraFiscalList = interface
	['{F614E7D1-D2DE-42B0-9AFC-8DC33DF2B34D}']
    function GetReference: TFiguraFiscalList;
    function GetItems(AIndex: Integer): IFiguraFiscal;
    procedure SetItems(AIndex: Integer; const Value: IFiguraFiscal);
    procedure Add(const AFiguraFiscal: IFiguraFiscal);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IFiguraFiscal read GetItems write SetItems; default;
  end;

  TFiguraFiscalListEnumerator = class
  private
    FIndex: Integer;
    FFiguraFiscalList: TFiguraFiscalList;
  public
    constructor Create(AFiguraFiscalList: TFiguraFiscalList);
    function GetCurrent: IFiguraFiscal; inline;
    function MoveNext: Boolean;
    property Current: IFiguraFiscal read GetCurrent;
  end;

  TFiguraFiscalList = class(TInterfacedObject, IFiguraFiscalList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IFiguraFiscal;
    procedure SetItems(AIndex: Integer; const Value: IFiguraFiscal);
  public
    constructor Create;
    procedure Add(const AFiguraFiscal: IFiguraFiscal);
    destructor Destroy; override;
    function GetEnumerator: TFiguraFiscalListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TFiguraFiscalList;
    property Items[AIndex: Integer]: IFiguraFiscal read GetItems write SetItems; default;
  end;

  TFiguraFiscalListRec = record
  private
    FList: IFiguraFiscalList;
  public
    class function Create(const AList: IFiguraFiscalList): TFiguraFiscalListRec; static;
    class operator Implicit(AListRec: TFiguraFiscalListRec): TFiguraFiscalList;
  end;

  TFiguraFiscal = class(TInterfacedModel, IFiguraFiscal)
  private
	FId: Integer;
	FDescricao: TString;
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
  public
    property Id: Integer read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
  end;

implementation

{ TFiguraFiscalList }

procedure TFiguraFiscalList.Add(const AFiguraFiscal: IFiguraFiscal);
begin
  FList.Add(AFiguraFiscal);
end;

procedure TFiguraFiscalList.Clear;
begin
  FList.Clear;
end;

function TFiguraFiscalList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TFiguraFiscalList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TFiguraFiscalList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TFiguraFiscalList.GetEnumerator: TFiguraFiscalListEnumerator;
begin
  Result := TFiguraFiscalListEnumerator.Create(Self);
end;

function TFiguraFiscalList.GetItems(AIndex: Integer): IFiguraFiscal;
begin
  Result := FList[AIndex] as IFiguraFiscal;
end;

function TFiguraFiscalList.GetReference: TFiguraFiscalList;
begin
  Result := Self;
end;

procedure TFiguraFiscalList.SetItems(AIndex: Integer; const Value: IFiguraFiscal);
begin
  FList[AIndex] := Value;
end;

{ TFiguraFiscalListEnumerator }

constructor TFiguraFiscalListEnumerator.Create(AFiguraFiscalList: TFiguraFiscalList);
begin
  inherited Create;
  FIndex := -1;
  FFiguraFiscalList := AFiguraFiscalList;
end;

function TFiguraFiscalListEnumerator.GetCurrent: IFiguraFiscal;
begin
  Result := FFiguraFiscalList[FIndex];
end;

function TFiguraFiscalListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FFiguraFiscalList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TFiguraFiscalListRec }

class function TFiguraFiscalListRec.Create(const AList: IFiguraFiscalList): TFiguraFiscalListRec;
begin
  FillChar(Result, SizeOf(TFiguraFiscalListRec), 0);
  Result.FList := AList;
end;

class operator TFiguraFiscalListRec.Implicit(AListRec: TFiguraFiscalListRec): TFiguraFiscalList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TFiguraFiscal }

function TFiguraFiscal.GetId: Integer;
begin
  Result := FId;
end;

procedure TFiguraFiscal.SetId(const AId: Integer);
begin
  FId := AId;
end;

function TFiguraFiscal.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TFiguraFiscal.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;


end.
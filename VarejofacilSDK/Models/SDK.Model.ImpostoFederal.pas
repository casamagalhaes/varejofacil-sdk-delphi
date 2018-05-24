unit SDK.Model.ImpostoFederal;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums, SDK.Model.ImpostoFederalGeral;

type

  IImpostoFederal = interface(IModel)
    ['{B5A12532-AC26-48F2-8BBF-392C1416D53D}']
    function GetId: TString;
    procedure SetId(const AId: TString);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetRetencao: Double;
    procedure SetRetencao(const ARetencao: Double);
    function GetObservacao: TString;
    procedure SetObservacao(const AObservacao: TString);
    function GetTipoImposto: TTipoImposto;
    procedure SetTipoImposto(const ATipoImposto: TTipoImposto);
    function GetImpostoFederalGeral: IImpostoFederalGeral;
    procedure SetImpostoFederalGeral(ImpostoFederalGeral: IImpostoFederalGeral);
    property Id: TString read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property Retencao: Double read GetRetencao write SetRetencao;
    property Observacao: TString read GetObservacao write SetObservacao;
    property TipoImposto: TTipoImposto read GetTipoImposto write SetTipoImposto;
    property ImpostoFederalGeral: IImpostoFederalGeral read GetImpostoFederalGeral write SetImpostoFederalGeral;
  end;

  TImpostoFederalList = class;

  IImpostoFederalList = interface
	['{468EFBD2-E9B6-4732-BFA4-AAB5B56C60F1}']
    function GetReference: TImpostoFederalList;
    function GetItems(AIndex: Integer): IImpostoFederal;
    procedure SetItems(AIndex: Integer; const Value: IImpostoFederal);
    procedure Add(const AImpostoFederal: IImpostoFederal);
    procedure Clear;                                                       
    function Count: Integer;
    property Items[AIndex: Integer]: IImpostoFederal read GetItems write SetItems; default;
  end;

  TImpostoFederalListEnumerator = class
  private
    FIndex: Integer;
    FImpostoFederalList: TImpostoFederalList;
  public
    constructor Create(AImpostoFederalList: TImpostoFederalList);
    function GetCurrent: IImpostoFederal; inline;
    function MoveNext: Boolean;
    property Current: IImpostoFederal read GetCurrent;
  end;

  TImpostoFederalList = class(TInterfacedObject, IImpostoFederalList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IImpostoFederal;
    procedure SetItems(AIndex: Integer; const Value: IImpostoFederal);
  public
    constructor Create;
    procedure Add(const AImpostoFederal: IImpostoFederal);
    destructor Destroy; override;
    function GetEnumerator: TImpostoFederalListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TImpostoFederalList;
    property Items[AIndex: Integer]: IImpostoFederal read GetItems write SetItems; default;
  end;

  TImpostoFederalListRec = record
  private
    FList: IImpostoFederalList;
  public
    class function Create(const AList: IImpostoFederalList): TImpostoFederalListRec; static;
    class operator Implicit(AListRec: TImpostoFederalListRec): TImpostoFederalList;
  end;

  TImpostoFederal = class(TInterfacedModel, IImpostoFederal)
  private
    FId: TString;
    FDescricao: TString;
    FRetencao: Double;
    FObservacao: TString;
    FTipoImposto: TTipoImposto;
    FImpostoFederalGeral: IImpostoFederalGeral;
    function GetId: TString;
    procedure SetId(const AId: TString);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetRetencao: Double;
    procedure SetRetencao(const ARetencao: Double);
    function GetObservacao: TString;
    procedure SetObservacao(const AObservacao: TString);
    function GetTipoImposto: TTipoImposto;
    procedure SetTipoImposto(const ATipoImposto: TTipoImposto);
    function GetImpostoFederalGeral: IImpostoFederalGeral;
    procedure SetImpostoFederalGeral(ImpostoFederalGeral: IImpostoFederalGeral);
  public
    procedure Assign(const APropName: string; const AValue: IInterface);
      override;
  published
    property Id: TString read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property Retencao: Double read GetRetencao write SetRetencao;
    property Observacao: TString read GetObservacao write SetObservacao;
    property TipoImposto: TTipoImposto read GetTipoImposto write SetTipoImposto;
    property ImpostoFederalGeral: IImpostoFederalGeral read GetImpostoFederalGeral write SetImpostoFederalGeral;
  end;

implementation

{ TImpostoFederalList }

procedure TImpostoFederalList.Add(const AImpostoFederal: IImpostoFederal);
begin
  FList.Add(AImpostoFederal);
end;

procedure TImpostoFederalList.Clear;
begin
  FList.Clear;
end;

function TImpostoFederalList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TImpostoFederalList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TImpostoFederalList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TImpostoFederalList.GetEnumerator: TImpostoFederalListEnumerator;
begin
  Result := TImpostoFederalListEnumerator.Create(Self);
end;

function TImpostoFederalList.GetItems(AIndex: Integer): IImpostoFederal;
begin
  Result := FList[AIndex] as IImpostoFederal;
end;

function TImpostoFederalList.GetReference: TImpostoFederalList;
begin
  Result := Self;
end;

procedure TImpostoFederalList.SetItems(AIndex: Integer; const Value: IImpostoFederal);
begin
  FList[AIndex] := Value;
end;

{ TImpostoFederalListEnumerator }

constructor TImpostoFederalListEnumerator.Create(AImpostoFederalList: TImpostoFederalList);
begin
  inherited Create;
  FIndex := -1;
  FImpostoFederalList := AImpostoFederalList;
end;

function TImpostoFederalListEnumerator.GetCurrent: IImpostoFederal;
begin
  Result := FImpostoFederalList[FIndex];
end;

function TImpostoFederalListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FImpostoFederalList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TImpostoFederalListRec }

class function TImpostoFederalListRec.Create(const AList: IImpostoFederalList): TImpostoFederalListRec;
begin
  FillChar(Result, SizeOf(TImpostoFederalListRec), 0);
  Result.FList := AList;
end;

class operator TImpostoFederalListRec.Implicit(AListRec: TImpostoFederalListRec): TImpostoFederalList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TImpostoFederal }

function TImpostoFederal.GetId: TString;
begin
  Result := FId;
end;

procedure TImpostoFederal.SetId(const AId: TString);
begin
  FId := AId;
end;

procedure TImpostoFederal.SetImpostoFederalGeral(
  ImpostoFederalGeral: IImpostoFederalGeral);
begin
  FImpostoFederalGeral := ImpostoFederalGeral;
end;

procedure TImpostoFederal.Assign(const APropName: string;
  const AValue: IInterface);
begin
  if SameText(APropName, 'ImpostoFederalGeral') then
    AValue.QueryInterface(IImpostoFederalGeral, FImpostoFederalGeral)
  else
    inherited;
end;

function TImpostoFederal.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TImpostoFederal.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

function TImpostoFederal.GetRetencao: Double;
begin
  Result := FRetencao;
end;

procedure TImpostoFederal.SetRetencao(const ARetencao: Double);
begin
  FRetencao := ARetencao;
end;

function TImpostoFederal.GetObservacao: TString;
begin
  Result := FObservacao;
end;

procedure TImpostoFederal.SetObservacao(const AObservacao: TString);
begin
  FObservacao := AObservacao;
end;

function TImpostoFederal.GetTipoImposto: TTipoImposto;
begin
  Result := FTipoImposto;
end;

procedure TImpostoFederal.SetTipoImposto(const ATipoImposto: TTipoImposto);
begin
  FTipoImposto := ATipoImposto;
end;

function TImpostoFederal.GetImpostoFederalGeral: IImpostoFederalGeral;
begin
  Result := FImpostoFederalGeral;
end;


end.
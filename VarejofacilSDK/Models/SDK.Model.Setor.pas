unit SDK.Model.Setor;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ISetor = interface(IModel)
    ['{30CADC4F-AED5-472F-911F-D3838D501900}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetSituacao: TSituacaoSetor;
    procedure SetSituacao(const ASituacao: TSituacaoSetor);
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property Situacao: TSituacaoSetor read GetSituacao write SetSituacao;
  end;

  TSetorList = class;

  ISetorList = interface
	['{8A528678-F8A8-45F1-AE28-B5D596F61B76}']
    function GetReference: TSetorList;
    function GetItems(AIndex: Integer): ISetor;
    procedure SetItems(AIndex: Integer; const Value: ISetor);
    procedure Add(const ASetor: ISetor);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ISetor read GetItems write SetItems; default;
  end;

  TSetorListEnumerator = class
  private
    FIndex: Integer;
    FSetorList: TSetorList;
  public
    constructor Create(ASetorList: TSetorList);
    function GetCurrent: ISetor; inline;
    function MoveNext: Boolean;
    property Current: ISetor read GetCurrent;
  end;

  TSetorList = class(TInterfacedObject, ISetorList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ISetor;
    procedure SetItems(AIndex: Integer; const Value: ISetor);
  public
    constructor Create;
    procedure Add(const ASetor: ISetor);
    destructor Destroy; override;
    function GetEnumerator: TSetorListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TSetorList;
    property Items[AIndex: Integer]: ISetor read GetItems write SetItems; default;
  end;

  TSetorListRec = record
  private
    FList: ISetorList;
  public
    class function Create(const AList: ISetorList): TSetorListRec; static;
    class operator Implicit(AListRec: TSetorListRec): TSetorList;
  end;

  TSetor = class(TInterfacedModel, ISetor)
  private
	FId: Int64;
	FDescricao: TString;
	FSituacao: TSituacaoSetor;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetSituacao: TSituacaoSetor;
    procedure SetSituacao(const ASituacao: TSituacaoSetor);
  public
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property Situacao: TSituacaoSetor read GetSituacao write SetSituacao;
  end;

implementation

{ TSetorList }

procedure TSetorList.Add(const ASetor: ISetor);
begin
  FList.Add(ASetor);
end;

procedure TSetorList.Clear;
begin
  FList.Clear;
end;

function TSetorList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TSetorList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TSetorList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TSetorList.GetEnumerator: TSetorListEnumerator;
begin
  Result := TSetorListEnumerator.Create(Self);
end;

function TSetorList.GetItems(AIndex: Integer): ISetor;
begin
  Result := FList[AIndex] as ISetor;
end;

function TSetorList.GetReference: TSetorList;
begin
  Result := Self;
end;

procedure TSetorList.SetItems(AIndex: Integer; const Value: ISetor);
begin
  FList[AIndex] := Value;
end;

{ TSetorListEnumerator }

constructor TSetorListEnumerator.Create(ASetorList: TSetorList);
begin
  inherited Create;
  FIndex := -1;
  FSetorList := ASetorList;
end;

function TSetorListEnumerator.GetCurrent: ISetor;
begin
  Result := FSetorList[FIndex];
end;

function TSetorListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FSetorList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TSetorListRec }

class function TSetorListRec.Create(const AList: ISetorList): TSetorListRec;
begin
  FillChar(Result, SizeOf(TSetorListRec), 0);
  Result.FList := AList;
end;

class operator TSetorListRec.Implicit(AListRec: TSetorListRec): TSetorList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TSetor }

function TSetor.GetId: Int64;
begin
  Result := FId;
end;

procedure TSetor.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TSetor.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TSetor.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

function TSetor.GetSituacao: TSituacaoSetor;
begin
  Result := FSituacao;
end;

procedure TSetor.SetSituacao(const ASituacao: TSituacaoSetor);
begin
  FSituacao := ASituacao;
end;


end.
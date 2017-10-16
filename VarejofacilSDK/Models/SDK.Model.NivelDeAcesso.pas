unit SDK.Model.NivelDeAcesso;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  INivelDeAcesso = interface(IModel)
    ['{DDB65B8E-2237-454C-A1B6-976EA86620A4}']
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    property Id: Integer read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
  end;

  TNivelDeAcessoList = class;

  INivelDeAcessoList = interface
	['{E7C560B0-9E21-4E73-B8DA-61FFF3881129}']
    function GetReference: TNivelDeAcessoList;
    function GetItems(AIndex: Integer): INivelDeAcesso;
    procedure SetItems(AIndex: Integer; const Value: INivelDeAcesso);
    procedure Add(const ANivelDeAcesso: INivelDeAcesso);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: INivelDeAcesso read GetItems write SetItems; default;
  end;

  TNivelDeAcessoListEnumerator = class
  private
    FIndex: Integer;
    FNivelDeAcessoList: TNivelDeAcessoList;
  public
    constructor Create(ANivelDeAcessoList: TNivelDeAcessoList);
    function GetCurrent: INivelDeAcesso; inline;
    function MoveNext: Boolean;
    property Current: INivelDeAcesso read GetCurrent;
  end;

  TNivelDeAcessoList = class(TInterfacedObject, INivelDeAcessoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): INivelDeAcesso;
    procedure SetItems(AIndex: Integer; const Value: INivelDeAcesso);
  public
    constructor Create;
    procedure Add(const ANivelDeAcesso: INivelDeAcesso);
    destructor Destroy; override;
    function GetEnumerator: TNivelDeAcessoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TNivelDeAcessoList;
    property Items[AIndex: Integer]: INivelDeAcesso read GetItems write SetItems; default;
  end;

  TNivelDeAcessoListRec = record
  private
    FList: INivelDeAcessoList;
  public
    class function Create(const AList: INivelDeAcessoList): TNivelDeAcessoListRec; static;
    class operator Implicit(AListRec: TNivelDeAcessoListRec): TNivelDeAcessoList;
  end;

  TNivelDeAcesso = class(TInterfacedModel, INivelDeAcesso)
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

{ TNivelDeAcessoList }

procedure TNivelDeAcessoList.Add(const ANivelDeAcesso: INivelDeAcesso);
begin
  FList.Add(ANivelDeAcesso);
end;

procedure TNivelDeAcessoList.Clear;
begin
  FList.Clear;
end;

function TNivelDeAcessoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TNivelDeAcessoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TNivelDeAcessoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TNivelDeAcessoList.GetEnumerator: TNivelDeAcessoListEnumerator;
begin
  Result := TNivelDeAcessoListEnumerator.Create(Self);
end;

function TNivelDeAcessoList.GetItems(AIndex: Integer): INivelDeAcesso;
begin
  Result := FList[AIndex] as INivelDeAcesso;
end;

function TNivelDeAcessoList.GetReference: TNivelDeAcessoList;
begin
  Result := Self;
end;

procedure TNivelDeAcessoList.SetItems(AIndex: Integer; const Value: INivelDeAcesso);
begin
  FList[AIndex] := Value;
end;

{ TNivelDeAcessoListEnumerator }

constructor TNivelDeAcessoListEnumerator.Create(ANivelDeAcessoList: TNivelDeAcessoList);
begin
  inherited Create;
  FIndex := -1;
  FNivelDeAcessoList := ANivelDeAcessoList;
end;

function TNivelDeAcessoListEnumerator.GetCurrent: INivelDeAcesso;
begin
  Result := FNivelDeAcessoList[FIndex];
end;

function TNivelDeAcessoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FNivelDeAcessoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TNivelDeAcessoListRec }

class function TNivelDeAcessoListRec.Create(const AList: INivelDeAcessoList): TNivelDeAcessoListRec;
begin
  FillChar(Result, SizeOf(TNivelDeAcessoListRec), 0);
  Result.FList := AList;
end;

class operator TNivelDeAcessoListRec.Implicit(AListRec: TNivelDeAcessoListRec): TNivelDeAcessoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TNivelDeAcesso }

function TNivelDeAcesso.GetId: Integer;
begin
  Result := FId;
end;

procedure TNivelDeAcesso.SetId(const AId: Integer);
begin
  FId := AId;
end;

function TNivelDeAcesso.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TNivelDeAcesso.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;


end.
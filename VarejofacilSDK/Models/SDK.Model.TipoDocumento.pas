unit SDK.Model.TipoDocumento;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ITipoDocumento = interface(IModel)
    ['{2C923624-ECCD-4DF6-A03C-1E60E9F3B9BB}']
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    property Id: Integer read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
  end;

  TTipoDocumentoList = class;

  ITipoDocumentoList = interface
	['{818EC8BA-5269-42A1-904A-76B347CEF9B4}']
    function GetReference: TTipoDocumentoList;
    function GetItems(AIndex: Integer): ITipoDocumento;
    procedure SetItems(AIndex: Integer; const Value: ITipoDocumento);
    procedure Add(const ATipoDocumento: ITipoDocumento);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ITipoDocumento read GetItems write SetItems; default;
  end;

  TTipoDocumentoListEnumerator = class
  private
    FIndex: Integer;
    FTipoDocumentoList: TTipoDocumentoList;
  public
    constructor Create(ATipoDocumentoList: TTipoDocumentoList);
    function GetCurrent: ITipoDocumento; inline;
    function MoveNext: Boolean;
    property Current: ITipoDocumento read GetCurrent;
  end;

  TTipoDocumentoList = class(TInterfacedObject, ITipoDocumentoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ITipoDocumento;
    procedure SetItems(AIndex: Integer; const Value: ITipoDocumento);
  public
    constructor Create;
    procedure Add(const ATipoDocumento: ITipoDocumento);
    destructor Destroy; override;
    function GetEnumerator: TTipoDocumentoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TTipoDocumentoList;
    property Items[AIndex: Integer]: ITipoDocumento read GetItems write SetItems; default;
  end;

  TTipoDocumentoListRec = record
  private
    FList: ITipoDocumentoList;
  public
    class function Create(const AList: ITipoDocumentoList): TTipoDocumentoListRec; static;
    class operator Implicit(AListRec: TTipoDocumentoListRec): TTipoDocumentoList;
  end;

  TTipoDocumento = class(TInterfacedModel, ITipoDocumento)
  private
	FId: Integer;
	FDescricao: TString;
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
  published
    property Id: Integer read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
  end;

implementation

{ TTipoDocumentoList }

procedure TTipoDocumentoList.Add(const ATipoDocumento: ITipoDocumento);
begin
  FList.Add(ATipoDocumento);
end;

procedure TTipoDocumentoList.Clear;
begin
  FList.Clear;
end;

function TTipoDocumentoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TTipoDocumentoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TTipoDocumentoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TTipoDocumentoList.GetEnumerator: TTipoDocumentoListEnumerator;
begin
  Result := TTipoDocumentoListEnumerator.Create(Self);
end;

function TTipoDocumentoList.GetItems(AIndex: Integer): ITipoDocumento;
begin
  Result := FList[AIndex] as ITipoDocumento;
end;

function TTipoDocumentoList.GetReference: TTipoDocumentoList;
begin
  Result := Self;
end;

procedure TTipoDocumentoList.SetItems(AIndex: Integer; const Value: ITipoDocumento);
begin
  FList[AIndex] := Value;
end;

{ TTipoDocumentoListEnumerator }

constructor TTipoDocumentoListEnumerator.Create(ATipoDocumentoList: TTipoDocumentoList);
begin
  inherited Create;
  FIndex := -1;
  FTipoDocumentoList := ATipoDocumentoList;
end;

function TTipoDocumentoListEnumerator.GetCurrent: ITipoDocumento;
begin
  Result := FTipoDocumentoList[FIndex];
end;

function TTipoDocumentoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FTipoDocumentoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TTipoDocumentoListRec }

class function TTipoDocumentoListRec.Create(const AList: ITipoDocumentoList): TTipoDocumentoListRec;
begin
  FillChar(Result, SizeOf(TTipoDocumentoListRec), 0);
  Result.FList := AList;
end;

class operator TTipoDocumentoListRec.Implicit(AListRec: TTipoDocumentoListRec): TTipoDocumentoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TTipoDocumento }

function TTipoDocumento.GetId: Integer;
begin
  Result := FId;
end;

procedure TTipoDocumento.SetId(const AId: Integer);
begin
  FId := AId;
end;

function TTipoDocumento.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TTipoDocumento.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;


end.
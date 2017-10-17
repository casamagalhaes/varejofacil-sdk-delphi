unit SDK.Model.TipoDeTransacaoDoTitulo;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ITipoDeTransacaoDoTitulo = interface(IModel)
    ['{F4E36160-A7BF-428A-9E28-80E48A9CBB7D}']
    function GetTipoDeTransacaoDoTitulo: Tenum;
    procedure SetTipoDeTransacaoDoTitulo(const ATipoDeTransacaoDoTitulo: Tenum);
    property TipoDeTransacaoDoTitulo: Tenum read GetTipoDeTransacaoDoTitulo write SetTipoDeTransacaoDoTitulo;
  end;

  TTipoDeTransacaoDoTituloList = class;

  ITipoDeTransacaoDoTituloList = interface
	['{CE0A6EEB-03F5-4393-BEED-021B6F7B0FCC}']
    function GetReference: TTipoDeTransacaoDoTituloList;
    function GetItems(AIndex: Integer): ITipoDeTransacaoDoTitulo;
    procedure SetItems(AIndex: Integer; const Value: ITipoDeTransacaoDoTitulo);
    procedure Add(const ATipoDeTransacaoDoTitulo: ITipoDeTransacaoDoTitulo);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ITipoDeTransacaoDoTitulo read GetItems write SetItems; default;
  end;

  TTipoDeTransacaoDoTituloListEnumerator = class
  private
    FIndex: Integer;
    FTipoDeTransacaoDoTituloList: TTipoDeTransacaoDoTituloList;
  public
    constructor Create(ATipoDeTransacaoDoTituloList: TTipoDeTransacaoDoTituloList);
    function GetCurrent: ITipoDeTransacaoDoTitulo; inline;
    function MoveNext: Boolean;
    property Current: ITipoDeTransacaoDoTitulo read GetCurrent;
  end;

  TTipoDeTransacaoDoTituloList = class(TInterfacedObject, ITipoDeTransacaoDoTituloList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ITipoDeTransacaoDoTitulo;
    procedure SetItems(AIndex: Integer; const Value: ITipoDeTransacaoDoTitulo);
  public
    constructor Create;
    procedure Add(const ATipoDeTransacaoDoTitulo: ITipoDeTransacaoDoTitulo);
    destructor Destroy; override;
    function GetEnumerator: TTipoDeTransacaoDoTituloListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TTipoDeTransacaoDoTituloList;
    property Items[AIndex: Integer]: ITipoDeTransacaoDoTitulo read GetItems write SetItems; default;
  end;

  TTipoDeTransacaoDoTituloListRec = record
  private
    FList: ITipoDeTransacaoDoTituloList;
  public
    class function Create(const AList: ITipoDeTransacaoDoTituloList): TTipoDeTransacaoDoTituloListRec; static;
    class operator Implicit(AListRec: TTipoDeTransacaoDoTituloListRec): TTipoDeTransacaoDoTituloList;
  end;

  TTipoDeTransacaoDoTitulo = class(TInterfacedModel, ITipoDeTransacaoDoTitulo)
  private
	FTipoDeTransacaoDoTitulo: Tenum;
    function GetTipoDeTransacaoDoTitulo: Tenum;
    procedure SetTipoDeTransacaoDoTitulo(const ATipoDeTransacaoDoTitulo: Tenum);
  published
    property TipoDeTransacaoDoTitulo: Tenum read GetTipoDeTransacaoDoTitulo write SetTipoDeTransacaoDoTitulo;
  end;

implementation

{ TTipoDeTransacaoDoTituloList }

procedure TTipoDeTransacaoDoTituloList.Add(const ATipoDeTransacaoDoTitulo: ITipoDeTransacaoDoTitulo);
begin
  FList.Add(ATipoDeTransacaoDoTitulo);
end;

procedure TTipoDeTransacaoDoTituloList.Clear;
begin
  FList.Clear;
end;

function TTipoDeTransacaoDoTituloList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TTipoDeTransacaoDoTituloList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TTipoDeTransacaoDoTituloList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TTipoDeTransacaoDoTituloList.GetEnumerator: TTipoDeTransacaoDoTituloListEnumerator;
begin
  Result := TTipoDeTransacaoDoTituloListEnumerator.Create(Self);
end;

function TTipoDeTransacaoDoTituloList.GetItems(AIndex: Integer): ITipoDeTransacaoDoTitulo;
begin
  Result := FList[AIndex] as ITipoDeTransacaoDoTitulo;
end;

function TTipoDeTransacaoDoTituloList.GetReference: TTipoDeTransacaoDoTituloList;
begin
  Result := Self;
end;

procedure TTipoDeTransacaoDoTituloList.SetItems(AIndex: Integer; const Value: ITipoDeTransacaoDoTitulo);
begin
  FList[AIndex] := Value;
end;

{ TTipoDeTransacaoDoTituloListEnumerator }

constructor TTipoDeTransacaoDoTituloListEnumerator.Create(ATipoDeTransacaoDoTituloList: TTipoDeTransacaoDoTituloList);
begin
  inherited Create;
  FIndex := -1;
  FTipoDeTransacaoDoTituloList := ATipoDeTransacaoDoTituloList;
end;

function TTipoDeTransacaoDoTituloListEnumerator.GetCurrent: ITipoDeTransacaoDoTitulo;
begin
  Result := FTipoDeTransacaoDoTituloList[FIndex];
end;

function TTipoDeTransacaoDoTituloListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FTipoDeTransacaoDoTituloList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TTipoDeTransacaoDoTituloListRec }

class function TTipoDeTransacaoDoTituloListRec.Create(const AList: ITipoDeTransacaoDoTituloList): TTipoDeTransacaoDoTituloListRec;
begin
  FillChar(Result, SizeOf(TTipoDeTransacaoDoTituloListRec), 0);
  Result.FList := AList;
end;

class operator TTipoDeTransacaoDoTituloListRec.Implicit(AListRec: TTipoDeTransacaoDoTituloListRec): TTipoDeTransacaoDoTituloList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TTipoDeTransacaoDoTitulo }

function TTipoDeTransacaoDoTitulo.GetTipoDeTransacaoDoTitulo: Tenum;
begin
  Result := FTipoDeTransacaoDoTitulo;
end;

procedure TTipoDeTransacaoDoTitulo.SetTipoDeTransacaoDoTitulo(const ATipoDeTransacaoDoTitulo: Tenum);
begin
  FTipoDeTransacaoDoTitulo := ATipoDeTransacaoDoTitulo;
end;


end.
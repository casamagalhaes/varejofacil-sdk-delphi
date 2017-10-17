unit SDK.Model.TituloAReceberEstorno;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ITituloAReceberEstorno = interface(IModel)
    ['{D9F746A2-6073-4D44-83B1-707E955C04E7}']
    function GetMotivo: TString;
    procedure SetMotivo(const AMotivo: TString);
    function GetTituloIds: TLongList;
    procedure SetTituloIds(const ATituloIds: TLongList);
    property Motivo: TString read GetMotivo write SetMotivo;
    property TituloIds: TLongList read GetTituloIds write SetTituloIds;
  end;

  TTituloAReceberEstornoList = class;

  ITituloAReceberEstornoList = interface
	['{B4EC207E-BB7A-460D-B14D-30337636BD21}']
    function GetReference: TTituloAReceberEstornoList;
    function GetItems(AIndex: Integer): ITituloAReceberEstorno;
    procedure SetItems(AIndex: Integer; const Value: ITituloAReceberEstorno);
    procedure Add(const ATituloAReceberEstorno: ITituloAReceberEstorno);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ITituloAReceberEstorno read GetItems write SetItems; default;
  end;

  TTituloAReceberEstornoListEnumerator = class
  private
    FIndex: Integer;
    FTituloAReceberEstornoList: TTituloAReceberEstornoList;
  public
    constructor Create(ATituloAReceberEstornoList: TTituloAReceberEstornoList);
    function GetCurrent: ITituloAReceberEstorno; inline;
    function MoveNext: Boolean;
    property Current: ITituloAReceberEstorno read GetCurrent;
  end;

  TTituloAReceberEstornoList = class(TInterfacedObject, ITituloAReceberEstornoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ITituloAReceberEstorno;
    procedure SetItems(AIndex: Integer; const Value: ITituloAReceberEstorno);
  public
    constructor Create;
    procedure Add(const ATituloAReceberEstorno: ITituloAReceberEstorno);
    destructor Destroy; override;
    function GetEnumerator: TTituloAReceberEstornoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TTituloAReceberEstornoList;
    property Items[AIndex: Integer]: ITituloAReceberEstorno read GetItems write SetItems; default;
  end;

  TTituloAReceberEstornoListRec = record
  private
    FList: ITituloAReceberEstornoList;
  public
    class function Create(const AList: ITituloAReceberEstornoList): TTituloAReceberEstornoListRec; static;
    class operator Implicit(AListRec: TTituloAReceberEstornoListRec): TTituloAReceberEstornoList;
  end;

  TTituloAReceberEstorno = class(TInterfacedModel, ITituloAReceberEstorno)
  private
	FMotivo: TString;
	FTituloIds: TLongList;
    function GetMotivo: TString;
    procedure SetMotivo(const AMotivo: TString);
    function GetTituloIds: TLongList;
    procedure SetTituloIds(const ATituloIds: TLongList);
  published
    property Motivo: TString read GetMotivo write SetMotivo;
    property TituloIds: TLongList read GetTituloIds write SetTituloIds;
  end;

implementation

{ TTituloAReceberEstornoList }

procedure TTituloAReceberEstornoList.Add(const ATituloAReceberEstorno: ITituloAReceberEstorno);
begin
  FList.Add(ATituloAReceberEstorno);
end;

procedure TTituloAReceberEstornoList.Clear;
begin
  FList.Clear;
end;

function TTituloAReceberEstornoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TTituloAReceberEstornoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TTituloAReceberEstornoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TTituloAReceberEstornoList.GetEnumerator: TTituloAReceberEstornoListEnumerator;
begin
  Result := TTituloAReceberEstornoListEnumerator.Create(Self);
end;

function TTituloAReceberEstornoList.GetItems(AIndex: Integer): ITituloAReceberEstorno;
begin
  Result := FList[AIndex] as ITituloAReceberEstorno;
end;

function TTituloAReceberEstornoList.GetReference: TTituloAReceberEstornoList;
begin
  Result := Self;
end;

procedure TTituloAReceberEstornoList.SetItems(AIndex: Integer; const Value: ITituloAReceberEstorno);
begin
  FList[AIndex] := Value;
end;

{ TTituloAReceberEstornoListEnumerator }

constructor TTituloAReceberEstornoListEnumerator.Create(ATituloAReceberEstornoList: TTituloAReceberEstornoList);
begin
  inherited Create;
  FIndex := -1;
  FTituloAReceberEstornoList := ATituloAReceberEstornoList;
end;

function TTituloAReceberEstornoListEnumerator.GetCurrent: ITituloAReceberEstorno;
begin
  Result := FTituloAReceberEstornoList[FIndex];
end;

function TTituloAReceberEstornoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FTituloAReceberEstornoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TTituloAReceberEstornoListRec }

class function TTituloAReceberEstornoListRec.Create(const AList: ITituloAReceberEstornoList): TTituloAReceberEstornoListRec;
begin
  FillChar(Result, SizeOf(TTituloAReceberEstornoListRec), 0);
  Result.FList := AList;
end;

class operator TTituloAReceberEstornoListRec.Implicit(AListRec: TTituloAReceberEstornoListRec): TTituloAReceberEstornoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TTituloAReceberEstorno }

function TTituloAReceberEstorno.GetMotivo: TString;
begin
  Result := FMotivo;
end;

procedure TTituloAReceberEstorno.SetMotivo(const AMotivo: TString);
begin
  FMotivo := AMotivo;
end;

function TTituloAReceberEstorno.GetTituloIds: TLongList;
begin
  Result := FTituloIds;
end;

procedure TTituloAReceberEstorno.SetTituloIds(const ATituloIds: TLongList);
begin
  FTituloIds := ATituloIds;
end;


end.
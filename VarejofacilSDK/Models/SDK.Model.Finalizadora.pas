unit SDK.Model.Finalizadora;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IFinalizadora = interface(IModel)
    ['{69C0BD05-49E3-4344-AE96-ACF94DF30537}']
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetTipoDocumentoId: Integer;
    procedure SetTipoDocumentoId(const ATipoDocumentoId: Integer);
    property Id: Integer read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property TipoDocumentoId: Integer read GetTipoDocumentoId write SetTipoDocumentoId;
  end;

  TFinalizadoraList = class;

  IFinalizadoraList = interface
	['{14308B76-8138-4233-B496-E49E128A0226}']
    function GetReference: TFinalizadoraList;
    function GetItems(AIndex: Integer): IFinalizadora;
    procedure SetItems(AIndex: Integer; const Value: IFinalizadora);
    procedure Add(const AFinalizadora: IFinalizadora);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IFinalizadora read GetItems write SetItems; default;
  end;

  TFinalizadoraListEnumerator = class
  private
    FIndex: Integer;
    FFinalizadoraList: TFinalizadoraList;
  public
    constructor Create(AFinalizadoraList: TFinalizadoraList);
    function GetCurrent: IFinalizadora; inline;
    function MoveNext: Boolean;
    property Current: IFinalizadora read GetCurrent;
  end;

  TFinalizadoraList = class(TInterfacedObject, IFinalizadoraList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IFinalizadora;
    procedure SetItems(AIndex: Integer; const Value: IFinalizadora);
  public
    constructor Create;
    procedure Add(const AFinalizadora: IFinalizadora);
    destructor Destroy; override;
    function GetEnumerator: TFinalizadoraListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TFinalizadoraList;
    property Items[AIndex: Integer]: IFinalizadora read GetItems write SetItems; default;
  end;

  TFinalizadoraListRec = record
  private
    FList: IFinalizadoraList;
  public
    class function Create(const AList: IFinalizadoraList): TFinalizadoraListRec; static;
    class operator Implicit(AListRec: TFinalizadoraListRec): TFinalizadoraList;
  end;

  TFinalizadora = class(TInterfacedObject, IFinalizadora)
  private
	FId: Integer;
	FDescricao: TString;
	FTipoDocumentoId: Integer;
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetTipoDocumentoId: Integer;
    procedure SetTipoDocumentoId(const ATipoDocumentoId: Integer);
  public
    property Id: Integer read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property TipoDocumentoId: Integer read GetTipoDocumentoId write SetTipoDocumentoId;
  end;

implementation

{ TFinalizadoraList }

procedure TFinalizadoraList.Add(const AFinalizadora: IFinalizadora);
begin
  FList.Add(AFinalizadora);
end;

procedure TFinalizadoraList.Clear;
begin
  FList.Clear;
end;

function TFinalizadoraList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TFinalizadoraList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TFinalizadoraList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TFinalizadoraList.GetEnumerator: TFinalizadoraListEnumerator;
begin
  Result := TFinalizadoraListEnumerator.Create(Self);
end;

function TFinalizadoraList.GetItems(AIndex: Integer): IFinalizadora;
begin
  Result := FList[AIndex] as IFinalizadora;
end;

function TFinalizadoraList.GetReference: TFinalizadoraList;
begin
  Result := Self;
end;

procedure TFinalizadoraList.SetItems(AIndex: Integer; const Value: IFinalizadora);
begin
  FList[AIndex] := Value;
end;

{ TFinalizadoraListEnumerator }

constructor TFinalizadoraListEnumerator.Create(AFinalizadoraList: TFinalizadoraList);
begin
  inherited Create;
  FIndex := -1;
  FFinalizadoraList := AFinalizadoraList;
end;

function TFinalizadoraListEnumerator.GetCurrent: IFinalizadora;
begin
  Result := FFinalizadoraList[FIndex];
end;

function TFinalizadoraListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FFinalizadoraList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TFinalizadoraListRec }

class function TFinalizadoraListRec.Create(const AList: IFinalizadoraList): TFinalizadoraListRec;
begin
  FillChar(Result, SizeOf(TFinalizadoraListRec), 0);
  Result.FList := AList;
end;

class operator TFinalizadoraListRec.Implicit(AListRec: TFinalizadoraListRec): TFinalizadoraList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TFinalizadora }

function TFinalizadora.GetId: Integer;
begin
  Result := FId;
end;

procedure TFinalizadora.SetId(const AId: Integer);
begin
  FId := AId;
end;

function TFinalizadora.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TFinalizadora.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

function TFinalizadora.GetTipoDocumentoId: Integer;
begin
  Result := FTipoDocumentoId;
end;

procedure TFinalizadora.SetTipoDocumentoId(const ATipoDocumentoId: Integer);
begin
  FTipoDocumentoId := ATipoDocumentoId;
end;


end.
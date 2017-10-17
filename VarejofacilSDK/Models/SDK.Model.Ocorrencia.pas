unit SDK.Model.Ocorrencia;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IOcorrencia = interface(IModel)
    ['{271DF4D2-3603-4C77-B8D1-442971A91B80}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDataDeAbertura: TDateTime;
    procedure SetDataDeAbertura(const ADataDeAbertura: TDateTime);
    function GetUsuario: TString;
    procedure SetUsuario(const AUsuario: TString);
    function GetContato: TString;
    procedure SetContato(const AContato: TString);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    property Id: Int64 read GetId write SetId;
    property DataDeAbertura: TDateTime read GetDataDeAbertura write SetDataDeAbertura;
    property Usuario: TString read GetUsuario write SetUsuario;
    property Contato: TString read GetContato write SetContato;
    property Descricao: TString read GetDescricao write SetDescricao;
  end;

  TOcorrenciaList = class;

  IOcorrenciaList = interface
	['{F5759180-4821-4A22-849B-B5B69A8FC640}']
    function GetReference: TOcorrenciaList;
    function GetItems(AIndex: Integer): IOcorrencia;
    procedure SetItems(AIndex: Integer; const Value: IOcorrencia);
    procedure Add(const AOcorrencia: IOcorrencia);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IOcorrencia read GetItems write SetItems; default;
  end;

  TOcorrenciaListEnumerator = class
  private
    FIndex: Integer;
    FOcorrenciaList: TOcorrenciaList;
  public
    constructor Create(AOcorrenciaList: TOcorrenciaList);
    function GetCurrent: IOcorrencia; inline;
    function MoveNext: Boolean;
    property Current: IOcorrencia read GetCurrent;
  end;

  TOcorrenciaList = class(TInterfacedObject, IOcorrenciaList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IOcorrencia;
    procedure SetItems(AIndex: Integer; const Value: IOcorrencia);
  public
    constructor Create;
    procedure Add(const AOcorrencia: IOcorrencia);
    destructor Destroy; override;
    function GetEnumerator: TOcorrenciaListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TOcorrenciaList;
    property Items[AIndex: Integer]: IOcorrencia read GetItems write SetItems; default;
  end;

  TOcorrenciaListRec = record
  private
    FList: IOcorrenciaList;
  public
    class function Create(const AList: IOcorrenciaList): TOcorrenciaListRec; static;
    class operator Implicit(AListRec: TOcorrenciaListRec): TOcorrenciaList;
  end;

  TOcorrencia = class(TInterfacedModel, IOcorrencia)
  private
	FId: Int64;
	FDataDeAbertura: TDateTime;
	FUsuario: TString;
	FContato: TString;
	FDescricao: TString;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDataDeAbertura: TDateTime;
    procedure SetDataDeAbertura(const ADataDeAbertura: TDateTime);
    function GetUsuario: TString;
    procedure SetUsuario(const AUsuario: TString);
    function GetContato: TString;
    procedure SetContato(const AContato: TString);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
  published
    property Id: Int64 read GetId write SetId;
    property DataDeAbertura: TDateTime read GetDataDeAbertura write SetDataDeAbertura;
    property Usuario: TString read GetUsuario write SetUsuario;
    property Contato: TString read GetContato write SetContato;
    property Descricao: TString read GetDescricao write SetDescricao;
  end;

implementation

{ TOcorrenciaList }

procedure TOcorrenciaList.Add(const AOcorrencia: IOcorrencia);
begin
  FList.Add(AOcorrencia);
end;

procedure TOcorrenciaList.Clear;
begin
  FList.Clear;
end;

function TOcorrenciaList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TOcorrenciaList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TOcorrenciaList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TOcorrenciaList.GetEnumerator: TOcorrenciaListEnumerator;
begin
  Result := TOcorrenciaListEnumerator.Create(Self);
end;

function TOcorrenciaList.GetItems(AIndex: Integer): IOcorrencia;
begin
  Result := FList[AIndex] as IOcorrencia;
end;

function TOcorrenciaList.GetReference: TOcorrenciaList;
begin
  Result := Self;
end;

procedure TOcorrenciaList.SetItems(AIndex: Integer; const Value: IOcorrencia);
begin
  FList[AIndex] := Value;
end;

{ TOcorrenciaListEnumerator }

constructor TOcorrenciaListEnumerator.Create(AOcorrenciaList: TOcorrenciaList);
begin
  inherited Create;
  FIndex := -1;
  FOcorrenciaList := AOcorrenciaList;
end;

function TOcorrenciaListEnumerator.GetCurrent: IOcorrencia;
begin
  Result := FOcorrenciaList[FIndex];
end;

function TOcorrenciaListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FOcorrenciaList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TOcorrenciaListRec }

class function TOcorrenciaListRec.Create(const AList: IOcorrenciaList): TOcorrenciaListRec;
begin
  FillChar(Result, SizeOf(TOcorrenciaListRec), 0);
  Result.FList := AList;
end;

class operator TOcorrenciaListRec.Implicit(AListRec: TOcorrenciaListRec): TOcorrenciaList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TOcorrencia }

function TOcorrencia.GetId: Int64;
begin
  Result := FId;
end;

procedure TOcorrencia.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TOcorrencia.GetDataDeAbertura: TDateTime;
begin
  Result := FDataDeAbertura;
end;

procedure TOcorrencia.SetDataDeAbertura(const ADataDeAbertura: TDateTime);
begin
  FDataDeAbertura := ADataDeAbertura;
end;

function TOcorrencia.GetUsuario: TString;
begin
  Result := FUsuario;
end;

procedure TOcorrencia.SetUsuario(const AUsuario: TString);
begin
  FUsuario := AUsuario;
end;

function TOcorrencia.GetContato: TString;
begin
  Result := FContato;
end;

procedure TOcorrencia.SetContato(const AContato: TString);
begin
  FContato := AContato;
end;

function TOcorrencia.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TOcorrencia.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;


end.
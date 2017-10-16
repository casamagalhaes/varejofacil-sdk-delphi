unit SDK.Model.FinalizadoraDaPremiacao;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IFinalizadoraDaPremiacao = interface(IModel)
    ['{32B735C4-F5E6-4D12-A1D5-35F367BDDD18}']
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetFinalizadoraId: Integer;
    procedure SetFinalizadoraId(const AFinalizadoraId: Integer);
    function GetTipo: TTipoFinalizadoraPremiacao;
    procedure SetTipo(const ATipo: TTipoFinalizadoraPremiacao);
    function GetQuantidadeDePontos: Double;
    procedure SetQuantidadeDePontos(const AQuantidadeDePontos: Double);
    property Id: Integer read GetId write SetId;
    property FinalizadoraId: Integer read GetFinalizadoraId write SetFinalizadoraId;
    property Tipo: TTipoFinalizadoraPremiacao read GetTipo write SetTipo;
    property QuantidadeDePontos: Double read GetQuantidadeDePontos write SetQuantidadeDePontos;
  end;

  TFinalizadoraDaPremiacaoList = class;

  IFinalizadoraDaPremiacaoList = interface
	['{E0957439-6F7F-42DE-98B2-058696032C23}']
    function GetReference: TFinalizadoraDaPremiacaoList;
    function GetItems(AIndex: Integer): IFinalizadoraDaPremiacao;
    procedure SetItems(AIndex: Integer; const Value: IFinalizadoraDaPremiacao);
    procedure Add(const AFinalizadoraDaPremiacao: IFinalizadoraDaPremiacao);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IFinalizadoraDaPremiacao read GetItems write SetItems; default;
  end;

  TFinalizadoraDaPremiacaoListEnumerator = class
  private
    FIndex: Integer;
    FFinalizadoraDaPremiacaoList: TFinalizadoraDaPremiacaoList;
  public
    constructor Create(AFinalizadoraDaPremiacaoList: TFinalizadoraDaPremiacaoList);
    function GetCurrent: IFinalizadoraDaPremiacao; inline;
    function MoveNext: Boolean;
    property Current: IFinalizadoraDaPremiacao read GetCurrent;
  end;

  TFinalizadoraDaPremiacaoList = class(TInterfacedObject, IFinalizadoraDaPremiacaoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IFinalizadoraDaPremiacao;
    procedure SetItems(AIndex: Integer; const Value: IFinalizadoraDaPremiacao);
  public
    constructor Create;
    procedure Add(const AFinalizadoraDaPremiacao: IFinalizadoraDaPremiacao);
    destructor Destroy; override;
    function GetEnumerator: TFinalizadoraDaPremiacaoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TFinalizadoraDaPremiacaoList;
    property Items[AIndex: Integer]: IFinalizadoraDaPremiacao read GetItems write SetItems; default;
  end;

  TFinalizadoraDaPremiacaoListRec = record
  private
    FList: IFinalizadoraDaPremiacaoList;
  public
    class function Create(const AList: IFinalizadoraDaPremiacaoList): TFinalizadoraDaPremiacaoListRec; static;
    class operator Implicit(AListRec: TFinalizadoraDaPremiacaoListRec): TFinalizadoraDaPremiacaoList;
  end;

  TFinalizadoraDaPremiacao = class(TInterfacedModel, IFinalizadoraDaPremiacao)
  private
	FId: Integer;
	FFinalizadoraId: Integer;
	FTipo: TTipoFinalizadoraPremiacao;
	FQuantidadeDePontos: Double;
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetFinalizadoraId: Integer;
    procedure SetFinalizadoraId(const AFinalizadoraId: Integer);
    function GetTipo: TTipoFinalizadoraPremiacao;
    procedure SetTipo(const ATipo: TTipoFinalizadoraPremiacao);
    function GetQuantidadeDePontos: Double;
    procedure SetQuantidadeDePontos(const AQuantidadeDePontos: Double);
  public
    property Id: Integer read GetId write SetId;
    property FinalizadoraId: Integer read GetFinalizadoraId write SetFinalizadoraId;
    property Tipo: TTipoFinalizadoraPremiacao read GetTipo write SetTipo;
    property QuantidadeDePontos: Double read GetQuantidadeDePontos write SetQuantidadeDePontos;
  end;

implementation

{ TFinalizadoraDaPremiacaoList }

procedure TFinalizadoraDaPremiacaoList.Add(const AFinalizadoraDaPremiacao: IFinalizadoraDaPremiacao);
begin
  FList.Add(AFinalizadoraDaPremiacao);
end;

procedure TFinalizadoraDaPremiacaoList.Clear;
begin
  FList.Clear;
end;

function TFinalizadoraDaPremiacaoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TFinalizadoraDaPremiacaoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TFinalizadoraDaPremiacaoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TFinalizadoraDaPremiacaoList.GetEnumerator: TFinalizadoraDaPremiacaoListEnumerator;
begin
  Result := TFinalizadoraDaPremiacaoListEnumerator.Create(Self);
end;

function TFinalizadoraDaPremiacaoList.GetItems(AIndex: Integer): IFinalizadoraDaPremiacao;
begin
  Result := FList[AIndex] as IFinalizadoraDaPremiacao;
end;

function TFinalizadoraDaPremiacaoList.GetReference: TFinalizadoraDaPremiacaoList;
begin
  Result := Self;
end;

procedure TFinalizadoraDaPremiacaoList.SetItems(AIndex: Integer; const Value: IFinalizadoraDaPremiacao);
begin
  FList[AIndex] := Value;
end;

{ TFinalizadoraDaPremiacaoListEnumerator }

constructor TFinalizadoraDaPremiacaoListEnumerator.Create(AFinalizadoraDaPremiacaoList: TFinalizadoraDaPremiacaoList);
begin
  inherited Create;
  FIndex := -1;
  FFinalizadoraDaPremiacaoList := AFinalizadoraDaPremiacaoList;
end;

function TFinalizadoraDaPremiacaoListEnumerator.GetCurrent: IFinalizadoraDaPremiacao;
begin
  Result := FFinalizadoraDaPremiacaoList[FIndex];
end;

function TFinalizadoraDaPremiacaoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FFinalizadoraDaPremiacaoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TFinalizadoraDaPremiacaoListRec }

class function TFinalizadoraDaPremiacaoListRec.Create(const AList: IFinalizadoraDaPremiacaoList): TFinalizadoraDaPremiacaoListRec;
begin
  FillChar(Result, SizeOf(TFinalizadoraDaPremiacaoListRec), 0);
  Result.FList := AList;
end;

class operator TFinalizadoraDaPremiacaoListRec.Implicit(AListRec: TFinalizadoraDaPremiacaoListRec): TFinalizadoraDaPremiacaoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TFinalizadoraDaPremiacao }

function TFinalizadoraDaPremiacao.GetId: Integer;
begin
  Result := FId;
end;

procedure TFinalizadoraDaPremiacao.SetId(const AId: Integer);
begin
  FId := AId;
end;

function TFinalizadoraDaPremiacao.GetFinalizadoraId: Integer;
begin
  Result := FFinalizadoraId;
end;

procedure TFinalizadoraDaPremiacao.SetFinalizadoraId(const AFinalizadoraId: Integer);
begin
  FFinalizadoraId := AFinalizadoraId;
end;

function TFinalizadoraDaPremiacao.GetTipo: TTipoFinalizadoraPremiacao;
begin
  Result := FTipo;
end;

procedure TFinalizadoraDaPremiacao.SetTipo(const ATipo: TTipoFinalizadoraPremiacao);
begin
  FTipo := ATipo;
end;

function TFinalizadoraDaPremiacao.GetQuantidadeDePontos: Double;
begin
  Result := FQuantidadeDePontos;
end;

procedure TFinalizadoraDaPremiacao.SetQuantidadeDePontos(const AQuantidadeDePontos: Double);
begin
  FQuantidadeDePontos := AQuantidadeDePontos;
end;


end.
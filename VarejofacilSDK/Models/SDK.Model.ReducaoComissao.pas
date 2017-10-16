unit SDK.Model.ReducaoComissao;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IReducaoComissao = interface(IModel)
    ['{B2257A22-EC05-4199-89C1-0AE7109D2B5E}']
    function GetReducao: Double;
    procedure SetReducao(const AReducao: Double);
    function GetDesconto: Double;
    procedure SetDesconto(const ADesconto: Double);
    property Reducao: Double read GetReducao write SetReducao;
    property Desconto: Double read GetDesconto write SetDesconto;
  end;

  TReducaoComissaoList = class;

  IReducaoComissaoList = interface
	['{B1956298-D7ED-48EF-8502-DC328D3462D0}']
    function GetReference: TReducaoComissaoList;
    function GetItems(AIndex: Integer): IReducaoComissao;
    procedure SetItems(AIndex: Integer; const Value: IReducaoComissao);
    procedure Add(const AReducaoComissao: IReducaoComissao);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IReducaoComissao read GetItems write SetItems; default;
  end;

  TReducaoComissaoListEnumerator = class
  private
    FIndex: Integer;
    FReducaoComissaoList: TReducaoComissaoList;
  public
    constructor Create(AReducaoComissaoList: TReducaoComissaoList);
    function GetCurrent: IReducaoComissao; inline;
    function MoveNext: Boolean;
    property Current: IReducaoComissao read GetCurrent;
  end;

  TReducaoComissaoList = class(TInterfacedObject, IReducaoComissaoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IReducaoComissao;
    procedure SetItems(AIndex: Integer; const Value: IReducaoComissao);
  public
    constructor Create;
    procedure Add(const AReducaoComissao: IReducaoComissao);
    destructor Destroy; override;
    function GetEnumerator: TReducaoComissaoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TReducaoComissaoList;
    property Items[AIndex: Integer]: IReducaoComissao read GetItems write SetItems; default;
  end;

  TReducaoComissaoListRec = record
  private
    FList: IReducaoComissaoList;
  public
    class function Create(const AList: IReducaoComissaoList): TReducaoComissaoListRec; static;
    class operator Implicit(AListRec: TReducaoComissaoListRec): TReducaoComissaoList;
  end;

  TReducaoComissao = class(TInterfacedModel, IReducaoComissao)
  private
	FReducao: Double;
	FDesconto: Double;
    function GetReducao: Double;
    procedure SetReducao(const AReducao: Double);
    function GetDesconto: Double;
    procedure SetDesconto(const ADesconto: Double);
  public
    property Reducao: Double read GetReducao write SetReducao;
    property Desconto: Double read GetDesconto write SetDesconto;
  end;

implementation

{ TReducaoComissaoList }

procedure TReducaoComissaoList.Add(const AReducaoComissao: IReducaoComissao);
begin
  FList.Add(AReducaoComissao);
end;

procedure TReducaoComissaoList.Clear;
begin
  FList.Clear;
end;

function TReducaoComissaoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TReducaoComissaoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TReducaoComissaoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TReducaoComissaoList.GetEnumerator: TReducaoComissaoListEnumerator;
begin
  Result := TReducaoComissaoListEnumerator.Create(Self);
end;

function TReducaoComissaoList.GetItems(AIndex: Integer): IReducaoComissao;
begin
  Result := FList[AIndex] as IReducaoComissao;
end;

function TReducaoComissaoList.GetReference: TReducaoComissaoList;
begin
  Result := Self;
end;

procedure TReducaoComissaoList.SetItems(AIndex: Integer; const Value: IReducaoComissao);
begin
  FList[AIndex] := Value;
end;

{ TReducaoComissaoListEnumerator }

constructor TReducaoComissaoListEnumerator.Create(AReducaoComissaoList: TReducaoComissaoList);
begin
  inherited Create;
  FIndex := -1;
  FReducaoComissaoList := AReducaoComissaoList;
end;

function TReducaoComissaoListEnumerator.GetCurrent: IReducaoComissao;
begin
  Result := FReducaoComissaoList[FIndex];
end;

function TReducaoComissaoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FReducaoComissaoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TReducaoComissaoListRec }

class function TReducaoComissaoListRec.Create(const AList: IReducaoComissaoList): TReducaoComissaoListRec;
begin
  FillChar(Result, SizeOf(TReducaoComissaoListRec), 0);
  Result.FList := AList;
end;

class operator TReducaoComissaoListRec.Implicit(AListRec: TReducaoComissaoListRec): TReducaoComissaoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TReducaoComissao }

function TReducaoComissao.GetReducao: Double;
begin
  Result := FReducao;
end;

procedure TReducaoComissao.SetReducao(const AReducao: Double);
begin
  FReducao := AReducao;
end;

function TReducaoComissao.GetDesconto: Double;
begin
  Result := FDesconto;
end;

procedure TReducaoComissao.SetDesconto(const ADesconto: Double);
begin
  FDesconto := ADesconto;
end;


end.
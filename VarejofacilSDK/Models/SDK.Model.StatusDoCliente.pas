unit SDK.Model.StatusDoCliente;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IStatusDoCliente = interface(IModel)
    ['{F08EABE7-911A-473B-A135-6FC2B83993E3}']
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetStatus: TStatusBloqueioCliente;
    procedure SetStatus(const AStatus: TStatusBloqueioCliente);
    property Id: Integer read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property Status: TStatusBloqueioCliente read GetStatus write SetStatus;
  end;

  TStatusDoClienteList = class;

  IStatusDoClienteList = interface
	['{44CBF888-3265-410F-955F-A9D54819055A}']
    function GetReference: TStatusDoClienteList;
    function GetItems(AIndex: Integer): IStatusDoCliente;
    procedure SetItems(AIndex: Integer; const Value: IStatusDoCliente);
    procedure Add(const AStatusDoCliente: IStatusDoCliente);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IStatusDoCliente read GetItems write SetItems; default;
  end;

  TStatusDoClienteListEnumerator = class
  private
    FIndex: Integer;
    FStatusDoClienteList: TStatusDoClienteList;
  public
    constructor Create(AStatusDoClienteList: TStatusDoClienteList);
    function GetCurrent: IStatusDoCliente; inline;
    function MoveNext: Boolean;
    property Current: IStatusDoCliente read GetCurrent;
  end;

  TStatusDoClienteList = class(TInterfacedObject, IStatusDoClienteList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IStatusDoCliente;
    procedure SetItems(AIndex: Integer; const Value: IStatusDoCliente);
  public
    constructor Create;
    procedure Add(const AStatusDoCliente: IStatusDoCliente);
    destructor Destroy; override;
    function GetEnumerator: TStatusDoClienteListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TStatusDoClienteList;
    property Items[AIndex: Integer]: IStatusDoCliente read GetItems write SetItems; default;
  end;

  TStatusDoClienteListRec = record
  private
    FList: IStatusDoClienteList;
  public
    class function Create(const AList: IStatusDoClienteList): TStatusDoClienteListRec; static;
    class operator Implicit(AListRec: TStatusDoClienteListRec): TStatusDoClienteList;
  end;

  TStatusDoCliente = class(TInterfacedModel, IStatusDoCliente)
  private
	FId: Integer;
	FDescricao: TString;
	FStatus: TStatusBloqueioCliente;
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetStatus: TStatusBloqueioCliente;
    procedure SetStatus(const AStatus: TStatusBloqueioCliente);
  published
    property Id: Integer read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property Status: TStatusBloqueioCliente read GetStatus write SetStatus;
  end;

implementation

{ TStatusDoClienteList }

procedure TStatusDoClienteList.Add(const AStatusDoCliente: IStatusDoCliente);
begin
  FList.Add(AStatusDoCliente);
end;

procedure TStatusDoClienteList.Clear;
begin
  FList.Clear;
end;

function TStatusDoClienteList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TStatusDoClienteList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TStatusDoClienteList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TStatusDoClienteList.GetEnumerator: TStatusDoClienteListEnumerator;
begin
  Result := TStatusDoClienteListEnumerator.Create(Self);
end;

function TStatusDoClienteList.GetItems(AIndex: Integer): IStatusDoCliente;
begin
  Result := FList[AIndex] as IStatusDoCliente;
end;

function TStatusDoClienteList.GetReference: TStatusDoClienteList;
begin
  Result := Self;
end;

procedure TStatusDoClienteList.SetItems(AIndex: Integer; const Value: IStatusDoCliente);
begin
  FList[AIndex] := Value;
end;

{ TStatusDoClienteListEnumerator }

constructor TStatusDoClienteListEnumerator.Create(AStatusDoClienteList: TStatusDoClienteList);
begin
  inherited Create;
  FIndex := -1;
  FStatusDoClienteList := AStatusDoClienteList;
end;

function TStatusDoClienteListEnumerator.GetCurrent: IStatusDoCliente;
begin
  Result := FStatusDoClienteList[FIndex];
end;

function TStatusDoClienteListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FStatusDoClienteList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TStatusDoClienteListRec }

class function TStatusDoClienteListRec.Create(const AList: IStatusDoClienteList): TStatusDoClienteListRec;
begin
  FillChar(Result, SizeOf(TStatusDoClienteListRec), 0);
  Result.FList := AList;
end;

class operator TStatusDoClienteListRec.Implicit(AListRec: TStatusDoClienteListRec): TStatusDoClienteList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TStatusDoCliente }

function TStatusDoCliente.GetId: Integer;
begin
  Result := FId;
end;

procedure TStatusDoCliente.SetId(const AId: Integer);
begin
  FId := AId;
end;

function TStatusDoCliente.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TStatusDoCliente.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

function TStatusDoCliente.GetStatus: TStatusBloqueioCliente;
begin
  Result := FStatus;
end;

procedure TStatusDoCliente.SetStatus(const AStatus: TStatusBloqueioCliente);
begin
  FStatus := AStatus;
end;


end.
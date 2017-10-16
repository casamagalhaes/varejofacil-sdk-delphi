unit SDK.Model.MarcaDoProduto;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IMarcaDoProduto = interface(IModel)
    ['{0430162D-FA9A-40A0-B9B9-A418BE6C306E}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
  end;

  TMarcaDoProdutoList = class;

  IMarcaDoProdutoList = interface
	['{C03C5AB7-8BC9-42EC-B84E-1E0F90AC1E10}']
    function GetReference: TMarcaDoProdutoList;
    function GetItems(AIndex: Integer): IMarcaDoProduto;
    procedure SetItems(AIndex: Integer; const Value: IMarcaDoProduto);
    procedure Add(const AMarcaDoProduto: IMarcaDoProduto);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IMarcaDoProduto read GetItems write SetItems; default;
  end;

  TMarcaDoProdutoListEnumerator = class
  private
    FIndex: Integer;
    FMarcaDoProdutoList: TMarcaDoProdutoList;
  public
    constructor Create(AMarcaDoProdutoList: TMarcaDoProdutoList);
    function GetCurrent: IMarcaDoProduto; inline;
    function MoveNext: Boolean;
    property Current: IMarcaDoProduto read GetCurrent;
  end;

  TMarcaDoProdutoList = class(TInterfacedObject, IMarcaDoProdutoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IMarcaDoProduto;
    procedure SetItems(AIndex: Integer; const Value: IMarcaDoProduto);
  public
    constructor Create;
    procedure Add(const AMarcaDoProduto: IMarcaDoProduto);
    destructor Destroy; override;
    function GetEnumerator: TMarcaDoProdutoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TMarcaDoProdutoList;
    property Items[AIndex: Integer]: IMarcaDoProduto read GetItems write SetItems; default;
  end;

  TMarcaDoProdutoListRec = record
  private
    FList: IMarcaDoProdutoList;
  public
    class function Create(const AList: IMarcaDoProdutoList): TMarcaDoProdutoListRec; static;
    class operator Implicit(AListRec: TMarcaDoProdutoListRec): TMarcaDoProdutoList;
  end;

  TMarcaDoProduto = class(TInterfacedModel, IMarcaDoProduto)
  private
	FId: Int64;
	FDescricao: TString;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
  public
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
  end;

implementation

{ TMarcaDoProdutoList }

procedure TMarcaDoProdutoList.Add(const AMarcaDoProduto: IMarcaDoProduto);
begin
  FList.Add(AMarcaDoProduto);
end;

procedure TMarcaDoProdutoList.Clear;
begin
  FList.Clear;
end;

function TMarcaDoProdutoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TMarcaDoProdutoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TMarcaDoProdutoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TMarcaDoProdutoList.GetEnumerator: TMarcaDoProdutoListEnumerator;
begin
  Result := TMarcaDoProdutoListEnumerator.Create(Self);
end;

function TMarcaDoProdutoList.GetItems(AIndex: Integer): IMarcaDoProduto;
begin
  Result := FList[AIndex] as IMarcaDoProduto;
end;

function TMarcaDoProdutoList.GetReference: TMarcaDoProdutoList;
begin
  Result := Self;
end;

procedure TMarcaDoProdutoList.SetItems(AIndex: Integer; const Value: IMarcaDoProduto);
begin
  FList[AIndex] := Value;
end;

{ TMarcaDoProdutoListEnumerator }

constructor TMarcaDoProdutoListEnumerator.Create(AMarcaDoProdutoList: TMarcaDoProdutoList);
begin
  inherited Create;
  FIndex := -1;
  FMarcaDoProdutoList := AMarcaDoProdutoList;
end;

function TMarcaDoProdutoListEnumerator.GetCurrent: IMarcaDoProduto;
begin
  Result := FMarcaDoProdutoList[FIndex];
end;

function TMarcaDoProdutoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FMarcaDoProdutoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TMarcaDoProdutoListRec }

class function TMarcaDoProdutoListRec.Create(const AList: IMarcaDoProdutoList): TMarcaDoProdutoListRec;
begin
  FillChar(Result, SizeOf(TMarcaDoProdutoListRec), 0);
  Result.FList := AList;
end;

class operator TMarcaDoProdutoListRec.Implicit(AListRec: TMarcaDoProdutoListRec): TMarcaDoProdutoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TMarcaDoProduto }

function TMarcaDoProduto.GetId: Int64;
begin
  Result := FId;
end;

procedure TMarcaDoProduto.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TMarcaDoProduto.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TMarcaDoProduto.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;


end.
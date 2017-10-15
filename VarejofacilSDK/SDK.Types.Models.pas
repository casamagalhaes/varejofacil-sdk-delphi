unit SDK.Types.Models;

interface

uses
  SDK.Types, Classes, SysUtils;

type

  IProduto = interface(IModel)
    ['{E383193E-8339-434F-A3A7-317516AF4A23}']
    function GetId: string;
    procedure SetId(const AId: string);
    function GetDescricaoCompleta: string;
    procedure SetDescricaoCompleta(const ADescricaoCompleta: string);
    property Id: string read GetId write SetId;
    property DescricaoCompleta: string read GetDescricaoCompleta write SetDescricaoCompleta;
  end;

  TProdutoList = class;

  IProdutoList = interface
  ['{71E5CE20-ABCB-4DD0-A9A9-9BD03CEF3944}']
    function GetReference: TProdutoList;
    function GetItems(AIndex: Integer): IProduto;
    procedure SetItems(AIndex: Integer; const Value: IProduto);
    procedure Add(const AProduto: IProduto);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IProduto read GetItems write SetItems; default;
  end;

  TProdutoListEnumerator = class
  private
    FIndex: Integer;
    FProdutoList: TProdutoList;
  public
    constructor Create(AProdutoList: TProdutoList);
    function GetCurrent: IProduto; inline;
    function MoveNext: Boolean;
    property Current: IProduto read GetCurrent;
  end;

  TProdutoList = class(TInterfacedObject, IProdutoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IProduto;
    procedure SetItems(AIndex: Integer; const Value: IProduto);
  public
    constructor Create;
    procedure Add(const AProduto: IProduto);
    destructor Destroy; override;
    function GetEnumerator: TProdutoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TProdutoList;
    property Items[AIndex: Integer]: IProduto read GetItems write SetItems; default;
  end;

  TProdutoListRec = record
  private
    FList: IProdutoList;
  public
    class function Create(const AList: IProdutoList): TProdutoListRec; static;
    class operator Implicit(AListRec: TProdutoListRec): TProdutoList;
  end;

implementation

{ TProdutoList }

procedure TProdutoList.Add(const AProduto: IProduto);
begin
  FList.Add(AProduto);
end;

procedure TProdutoList.Clear;
begin
  FList.Clear;
end;

function TProdutoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TProdutoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TProdutoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TProdutoList.GetEnumerator: TProdutoListEnumerator;
begin
  Result := TProdutoListEnumerator.Create(Self);
end;

function TProdutoList.GetItems(AIndex: Integer): IProduto;
begin
  Result := FList[AIndex] as IProduto;
end;

function TProdutoList.GetReference: TProdutoList;
begin
  Result := Self;
end;

procedure TProdutoList.SetItems(AIndex: Integer; const Value: IProduto);
begin
  FList[AIndex] := Value;
end;

{ TProdutoListEnumerator }

constructor TProdutoListEnumerator.Create(AProdutoList: TProdutoList);
begin
  inherited Create;
  FIndex := -1;
  FProdutoList := AProdutoList;
end;

function TProdutoListEnumerator.GetCurrent: IProduto;
begin
  Result := FProdutoList[FIndex];
end;

function TProdutoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FProdutoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TProdutoListRec }

class function TProdutoListRec.Create(const AList: IProdutoList): TProdutoListRec;
begin
  FillChar(Result, SizeOf(TProdutoListRec), 0);
  Result.FList := AList;
end;

class operator TProdutoListRec.Implicit(AListRec: TProdutoListRec): TProdutoList;
begin
  Result := AListRec.FList.GetReference;
end;

end.

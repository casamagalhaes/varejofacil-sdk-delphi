unit SDK.Model.ProdutoPrincipal;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IProdutoPrincipal = interface(IModel)
    ['{920D2D9F-4887-4FA6-8DE9-AAA5C9689BAC}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    property Id: Int64 read GetId write SetId;
  end;

  TProdutoPrincipalList = class;

  IProdutoPrincipalList = interface
	['{2944B9DA-1040-42F3-9D46-3B89124F0F22}']
    function GetReference: TProdutoPrincipalList;
    function GetItems(AIndex: Integer): IProdutoPrincipal;
    procedure SetItems(AIndex: Integer; const Value: IProdutoPrincipal);
    procedure Add(const AProdutoPrincipal: IProdutoPrincipal);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IProdutoPrincipal read GetItems write SetItems; default;
  end;

  TProdutoPrincipalListEnumerator = class
  private
    FIndex: Integer;
    FProdutoPrincipalList: TProdutoPrincipalList;
  public
    constructor Create(AProdutoPrincipalList: TProdutoPrincipalList);
    function GetCurrent: IProdutoPrincipal; inline;
    function MoveNext: Boolean;
    property Current: IProdutoPrincipal read GetCurrent;
  end;

  TProdutoPrincipalList = class(TInterfacedObject, IProdutoPrincipalList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IProdutoPrincipal;
    procedure SetItems(AIndex: Integer; const Value: IProdutoPrincipal);
  public
    constructor Create;
    procedure Add(const AProdutoPrincipal: IProdutoPrincipal);
    destructor Destroy; override;
    function GetEnumerator: TProdutoPrincipalListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TProdutoPrincipalList;
    property Items[AIndex: Integer]: IProdutoPrincipal read GetItems write SetItems; default;
  end;

  TProdutoPrincipalListRec = record
  private
    FList: IProdutoPrincipalList;
  public
    class function Create(const AList: IProdutoPrincipalList): TProdutoPrincipalListRec; static;
    class operator Implicit(AListRec: TProdutoPrincipalListRec): TProdutoPrincipalList;
  end;

  TProdutoPrincipal = class(TInterfacedModel, IProdutoPrincipal)
  private
	FId: Int64;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
  public
    property Id: Int64 read GetId write SetId;
  end;

implementation

{ TProdutoPrincipalList }

procedure TProdutoPrincipalList.Add(const AProdutoPrincipal: IProdutoPrincipal);
begin
  FList.Add(AProdutoPrincipal);
end;

procedure TProdutoPrincipalList.Clear;
begin
  FList.Clear;
end;

function TProdutoPrincipalList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TProdutoPrincipalList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TProdutoPrincipalList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TProdutoPrincipalList.GetEnumerator: TProdutoPrincipalListEnumerator;
begin
  Result := TProdutoPrincipalListEnumerator.Create(Self);
end;

function TProdutoPrincipalList.GetItems(AIndex: Integer): IProdutoPrincipal;
begin
  Result := FList[AIndex] as IProdutoPrincipal;
end;

function TProdutoPrincipalList.GetReference: TProdutoPrincipalList;
begin
  Result := Self;
end;

procedure TProdutoPrincipalList.SetItems(AIndex: Integer; const Value: IProdutoPrincipal);
begin
  FList[AIndex] := Value;
end;

{ TProdutoPrincipalListEnumerator }

constructor TProdutoPrincipalListEnumerator.Create(AProdutoPrincipalList: TProdutoPrincipalList);
begin
  inherited Create;
  FIndex := -1;
  FProdutoPrincipalList := AProdutoPrincipalList;
end;

function TProdutoPrincipalListEnumerator.GetCurrent: IProdutoPrincipal;
begin
  Result := FProdutoPrincipalList[FIndex];
end;

function TProdutoPrincipalListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FProdutoPrincipalList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TProdutoPrincipalListRec }

class function TProdutoPrincipalListRec.Create(const AList: IProdutoPrincipalList): TProdutoPrincipalListRec;
begin
  FillChar(Result, SizeOf(TProdutoPrincipalListRec), 0);
  Result.FList := AList;
end;

class operator TProdutoPrincipalListRec.Implicit(AListRec: TProdutoPrincipalListRec): TProdutoPrincipalList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TProdutoPrincipal }

function TProdutoPrincipal.GetId: Int64;
begin
  Result := FId;
end;

procedure TProdutoPrincipal.SetId(const AId: Int64);
begin
  FId := AId;
end;


end.
unit SDK.Model.ProdutoPromocional;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IProdutoPromocional = interface(IModel)
    ['{FD0E016B-D255-4E56-96AC-292D0E659FD9}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    property Id: Int64 read GetId write SetId;
  end;

  TProdutoPromocionalList = class;

  IProdutoPromocionalList = interface
	['{43E8BBC3-D41E-40C0-BD4E-CB923D163E6D}']
    function GetReference: TProdutoPromocionalList;
    function GetItems(AIndex: Integer): IProdutoPromocional;
    procedure SetItems(AIndex: Integer; const Value: IProdutoPromocional);
    procedure Add(const AProdutoPromocional: IProdutoPromocional);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IProdutoPromocional read GetItems write SetItems; default;
  end;

  TProdutoPromocionalListEnumerator = class
  private
    FIndex: Integer;
    FProdutoPromocionalList: TProdutoPromocionalList;
  public
    constructor Create(AProdutoPromocionalList: TProdutoPromocionalList);
    function GetCurrent: IProdutoPromocional; inline;
    function MoveNext: Boolean;
    property Current: IProdutoPromocional read GetCurrent;
  end;

  TProdutoPromocionalList = class(TInterfacedObject, IProdutoPromocionalList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IProdutoPromocional;
    procedure SetItems(AIndex: Integer; const Value: IProdutoPromocional);
  public
    constructor Create;
    procedure Add(const AProdutoPromocional: IProdutoPromocional);
    destructor Destroy; override;
    function GetEnumerator: TProdutoPromocionalListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TProdutoPromocionalList;
    property Items[AIndex: Integer]: IProdutoPromocional read GetItems write SetItems; default;
  end;

  TProdutoPromocionalListRec = record
  private
    FList: IProdutoPromocionalList;
  public
    class function Create(const AList: IProdutoPromocionalList): TProdutoPromocionalListRec; static;
    class operator Implicit(AListRec: TProdutoPromocionalListRec): TProdutoPromocionalList;
  end;

  TProdutoPromocional = class(TInterfacedModel, IProdutoPromocional)
  private
	FId: Int64;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
  published
    property Id: Int64 read GetId write SetId;
  end;

implementation

{ TProdutoPromocionalList }

procedure TProdutoPromocionalList.Add(const AProdutoPromocional: IProdutoPromocional);
begin
  FList.Add(AProdutoPromocional);
end;

procedure TProdutoPromocionalList.Clear;
begin
  FList.Clear;
end;

function TProdutoPromocionalList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TProdutoPromocionalList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TProdutoPromocionalList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TProdutoPromocionalList.GetEnumerator: TProdutoPromocionalListEnumerator;
begin
  Result := TProdutoPromocionalListEnumerator.Create(Self);
end;

function TProdutoPromocionalList.GetItems(AIndex: Integer): IProdutoPromocional;
begin
  Result := FList[AIndex] as IProdutoPromocional;
end;

function TProdutoPromocionalList.GetReference: TProdutoPromocionalList;
begin
  Result := Self;
end;

procedure TProdutoPromocionalList.SetItems(AIndex: Integer; const Value: IProdutoPromocional);
begin
  FList[AIndex] := Value;
end;

{ TProdutoPromocionalListEnumerator }

constructor TProdutoPromocionalListEnumerator.Create(AProdutoPromocionalList: TProdutoPromocionalList);
begin
  inherited Create;
  FIndex := -1;
  FProdutoPromocionalList := AProdutoPromocionalList;
end;

function TProdutoPromocionalListEnumerator.GetCurrent: IProdutoPromocional;
begin
  Result := FProdutoPromocionalList[FIndex];
end;

function TProdutoPromocionalListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FProdutoPromocionalList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TProdutoPromocionalListRec }

class function TProdutoPromocionalListRec.Create(const AList: IProdutoPromocionalList): TProdutoPromocionalListRec;
begin
  FillChar(Result, SizeOf(TProdutoPromocionalListRec), 0);
  Result.FList := AList;
end;

class operator TProdutoPromocionalListRec.Implicit(AListRec: TProdutoPromocionalListRec): TProdutoPromocionalList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TProdutoPromocional }

function TProdutoPromocional.GetId: Int64;
begin
  Result := FId;
end;

procedure TProdutoPromocional.SetId(const AId: Int64);
begin
  FId := AId;
end;


end.
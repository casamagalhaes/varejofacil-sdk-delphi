unit SDK.Model.CargaProduto;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums, SDK.Model.Preco;

type

  ICargaProduto = interface(IModel)
    ['{C4E5C92D-E3E1-453F-8D9A-A54A3D5731BF}']
    function GetTributacaoId: TString;
    procedure SetTributacaoId(const ATributacaoId: TString);
    function GetPreco: TPreco;
    procedure SetPreco(const APreco: TPreco);
    property TributacaoId: TString read GetTributacaoId write SetTributacaoId;
    property Preco: TPreco read GetPreco write SetPreco;
  end;

  TCargaProdutoList = class;

  ICargaProdutoList = interface
	['{37ACA0A0-DB78-4E9C-949C-87D7D7464D35}']
    function GetReference: TCargaProdutoList;
    function GetItems(AIndex: Integer): ICargaProduto;
    procedure SetItems(AIndex: Integer; const Value: ICargaProduto);
    procedure Add(const ACargaProduto: ICargaProduto);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ICargaProduto read GetItems write SetItems; default;
  end;

  TCargaProdutoListEnumerator = class
  private
    FIndex: Integer;
    FCargaProdutoList: TCargaProdutoList;
  public
    constructor Create(ACargaProdutoList: TCargaProdutoList);
    function GetCurrent: ICargaProduto; inline;
    function MoveNext: Boolean;
    property Current: ICargaProduto read GetCurrent;
  end;

  TCargaProdutoList = class(TInterfacedObject, ICargaProdutoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ICargaProduto;
    procedure SetItems(AIndex: Integer; const Value: ICargaProduto);
  public
    constructor Create;
    procedure Add(const ACargaProduto: ICargaProduto);
    destructor Destroy; override;
    function GetEnumerator: TCargaProdutoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TCargaProdutoList;
    property Items[AIndex: Integer]: ICargaProduto read GetItems write SetItems; default;
  end;

  TCargaProdutoListRec = record
  private
    FList: ICargaProdutoList;
  public
    class function Create(const AList: ICargaProdutoList): TCargaProdutoListRec; static;
    class operator Implicit(AListRec: TCargaProdutoListRec): TCargaProdutoList;
  end;

  TCargaProduto = class(TInterfacedModel, ICargaProduto)
  private
	FTributacaoId: TString;
	FPreco: TPreco;
    function GetTributacaoId: TString;
    procedure SetTributacaoId(const ATributacaoId: TString);
    function GetPreco: TPreco;
    procedure SetPreco(const APreco: TPreco);
  published
    property TributacaoId: TString read GetTributacaoId write SetTributacaoId;
    property Preco: TPreco read GetPreco write SetPreco;
  end;

implementation

{ TCargaProdutoList }

procedure TCargaProdutoList.Add(const ACargaProduto: ICargaProduto);
begin
  FList.Add(ACargaProduto);
end;

procedure TCargaProdutoList.Clear;
begin
  FList.Clear;
end;

function TCargaProdutoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TCargaProdutoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TCargaProdutoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TCargaProdutoList.GetEnumerator: TCargaProdutoListEnumerator;
begin
  Result := TCargaProdutoListEnumerator.Create(Self);
end;

function TCargaProdutoList.GetItems(AIndex: Integer): ICargaProduto;
begin
  Result := FList[AIndex] as ICargaProduto;
end;

function TCargaProdutoList.GetReference: TCargaProdutoList;
begin
  Result := Self;
end;

procedure TCargaProdutoList.SetItems(AIndex: Integer; const Value: ICargaProduto);
begin
  FList[AIndex] := Value;
end;

{ TCargaProdutoListEnumerator }

constructor TCargaProdutoListEnumerator.Create(ACargaProdutoList: TCargaProdutoList);
begin
  inherited Create;
  FIndex := -1;
  FCargaProdutoList := ACargaProdutoList;
end;

function TCargaProdutoListEnumerator.GetCurrent: ICargaProduto;
begin
  Result := FCargaProdutoList[FIndex];
end;

function TCargaProdutoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FCargaProdutoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TCargaProdutoListRec }

class function TCargaProdutoListRec.Create(const AList: ICargaProdutoList): TCargaProdutoListRec;
begin
  FillChar(Result, SizeOf(TCargaProdutoListRec), 0);
  Result.FList := AList;
end;

class operator TCargaProdutoListRec.Implicit(AListRec: TCargaProdutoListRec): TCargaProdutoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TCargaProduto }

function TCargaProduto.GetTributacaoId: TString;
begin
  Result := FTributacaoId;
end;

procedure TCargaProduto.SetTributacaoId(const ATributacaoId: TString);
begin
  FTributacaoId := ATributacaoId;
end;

function TCargaProduto.GetPreco: TPreco;
begin
  Result := FPreco;
end;

procedure TCargaProduto.SetPreco(const APreco: TPreco);
begin
  FPreco := APreco;
end;


end.
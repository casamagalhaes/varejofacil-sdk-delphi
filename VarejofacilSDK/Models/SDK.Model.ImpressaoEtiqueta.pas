unit SDK.Model.ImpressaoEtiqueta;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IImpressaoEtiqueta = interface(IModel)
   ['{47D6A14D-C9CD-4946-8B2B-5F99B5F0DD78}']
    function GetLojaId: Int64;
    function GetProdutoId: Int64;
    function GetAtualizaPreco: Boolean;
    function GetIdExterno: TString;
    procedure SetLojaId(const AId: Int64);
    procedure SetProdutoId(const AId: Int64);
    procedure SetAtualizaPreco(const AAtualizaPreco: Boolean);
    procedure SetIdExterno(const AIdExterno: TString);
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property ProdutoId: Int64 read GetProdutoId write SetProdutoId;
    property AtualizaPreco: Boolean read GetAtualizaPreco write SetAtualizaPreco;
    property IdExterno: TString read GetIdExterno write SetIdExterno;
  end;

  TImpressaoEtiquetaList = class;

  IImpressaoEtiquetaList = interface
  	['{B9D23910-FC8F-43E5-AF46-CCD49048DDDD}']
    function GetReference: TImpressaoEtiquetaList;
    function GetItems(AIndex: Integer): IImpressaoEtiqueta;
    procedure SetItems(AIndex: Integer; const Value: IImpressaoEtiqueta);
    procedure Add(const AGenero: IImpressaoEtiqueta);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IImpressaoEtiqueta read GetItems write SetItems; default;
  end;

  TImpressaoEtiquetaListEnumerator = class
  private
    FIndex: Integer;
    FImpressaoEtiquetaList: TImpressaoEtiquetaList;
  public
    constructor Create(AImpressaoEtiquetaList: TImpressaoEtiquetaList);
    function GetCurrent: IImpressaoEtiqueta; inline;
    function MoveNext: Boolean;
    property Current: IImpressaoEtiqueta read GetCurrent;
  end;

  TImpressaoEtiquetaList = class(TInterfacedObject, IImpressaoEtiquetaList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IImpressaoEtiqueta;
    procedure SetItems(AIndex: Integer; const Value: IImpressaoEtiqueta);
  public
    constructor Create;
    procedure Add(const AImpressaoEtiqueta: IImpressaoEtiqueta);
    destructor Destroy; override;
    function GetEnumerator: TImpressaoEtiquetaListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TImpressaoEtiquetaList;
    property Items[AIndex: Integer]: IImpressaoEtiqueta read GetItems write SetItems; default;
  end;

  TImpressaoEtiquetaListRec = record
  private
    FList: IImpressaoEtiquetaList;
  public
    class function Create(const AList: IImpressaoEtiquetaList): TImpressaoEtiquetaListRec; static;
    class operator Implicit(AListRec: TImpressaoEtiquetaListRec): TImpressaoEtiquetaList;
  end;

  TImpressaoEtiqueta = class(TInterfacedModel, IImpressaoEtiqueta)
  private
    FAtualizaPreco: Boolean;
    FLojaId: Int64;
    FProdutoId: Int64;
    FIdExterno: TString;
    function GetLojaId: Int64;
    function GetProdutoId: Int64;
    function GetAtualizaPreco: Boolean;
    function GetIdExterno: TString;
    procedure SetAtualizaPreco(const Value: Boolean);
    procedure SetLojaId(const Value: Int64);
    procedure SetProdutoId(const Value: Int64);
    procedure SetIdExterno(const Value: TString);
  published
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property ProdutoId: Int64 read GetProdutoId write SetProdutoId;
    property AtualizaPreco: Boolean read GetAtualizaPreco write SetAtualizaPreco;
    property IdExterno: TString read GetIdExterno write SetIdExterno;
  end;


implementation

{ TImpressaoEtiqueta }

function TImpressaoEtiqueta.GetAtualizaPreco: Boolean;
begin
  Result := FAtualizaPreco;
end;

function TImpressaoEtiqueta.GetIdExterno: TString;
begin
  Result := FIdExterno;
end;

function TImpressaoEtiqueta.GetLojaId: Int64;
begin
  Result := FLojaId;
end;

function TImpressaoEtiqueta.GetProdutoId: Int64;
begin
  Result := FProdutoId;
end;

procedure TImpressaoEtiqueta.SetAtualizaPreco(const Value: Boolean);
begin
  FAtualizaPreco := Value;
end;

procedure TImpressaoEtiqueta.SetIdExterno(const Value: TString);
begin
  FIdExterno := Value;
end;

procedure TImpressaoEtiqueta.SetLojaId(const Value: Int64);
begin
  FLojaId := Value;
end;

procedure TImpressaoEtiqueta.SetProdutoId(const Value: Int64);
begin
  FProdutoId := Value;
end;

{ TImpressaoEtiquetaListRec }

class function TImpressaoEtiquetaListRec.Create(
  const AList: IImpressaoEtiquetaList): TImpressaoEtiquetaListRec;
begin
  FillChar(Result, SizeOf(TImpressaoEtiquetaListRec), 0);
  Result.FList := AList;
end;

class operator TImpressaoEtiquetaListRec.Implicit(
  AListRec: TImpressaoEtiquetaListRec): TImpressaoEtiquetaList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TImpressaoEtiquetaList }

procedure TImpressaoEtiquetaList.Add(
  const AImpressaoEtiqueta: IImpressaoEtiqueta);
begin
  FList.Add(AImpressaoEtiqueta)
end;

procedure TImpressaoEtiquetaList.Clear;
begin
  FList.Clear;
end;

function TImpressaoEtiquetaList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TImpressaoEtiquetaList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TImpressaoEtiquetaList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TImpressaoEtiquetaList.GetEnumerator: TImpressaoEtiquetaListEnumerator;
begin
  Result := TImpressaoEtiquetaListEnumerator.Create(Self);
end;

function TImpressaoEtiquetaList.GetItems(AIndex: Integer): IImpressaoEtiqueta;
begin
  Result := FList[AIndex] as IImpressaoEtiqueta;
end;

function TImpressaoEtiquetaList.GetReference: TImpressaoEtiquetaList;
begin
  Result := Self;
end;

procedure TImpressaoEtiquetaList.SetItems(AIndex: Integer;
  const Value: IImpressaoEtiqueta);
begin
  FList[AIndex] := Value;
end;

{ TImpressaoEtiquetaListEnumerator }

constructor TImpressaoEtiquetaListEnumerator.Create(
  AImpressaoEtiquetaList: TImpressaoEtiquetaList);
begin
  inherited Create;
  FIndex := -1;
  FImpressaoEtiquetaList := AImpressaoEtiquetaList;
end;

function TImpressaoEtiquetaListEnumerator.GetCurrent: IImpressaoEtiqueta;
begin
  Result := FImpressaoEtiquetaList[FIndex];
end;

function TImpressaoEtiquetaListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FImpressaoEtiquetaList.Count - 1;
  if Result then
    Inc(FIndex);
end;

end.

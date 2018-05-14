unit SDK.Model.ReferenciaFornecedor;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IReferenciaFornecedor = interface(IModel)
    ['{52E72C18-7B05-4352-B535-94F1A2213B05}']
    function GetId: Variant;
    procedure SetId(const AId: Variant);
    function GetFornecedorId: Variant;
    procedure SetFornecedorId(const AFornecedorId: Variant);
    function GetReferencia: TString;
    procedure SetReferencia(const AReferencia: TString);
    function GetUnidade: TString;
    procedure SetUnidade(const AUnidade: TString);
    function GetQuantidade: Double;
    procedure SetQuantidade(const AQuantidade: Double);
    function GetNivel: TNivelFornecedor;
    procedure SetNivel(const ANivel: TNivelFornecedor);
    property Id: Variant read GetId write SetId;
    property FornecedorId: Variant read GetFornecedorId write SetFornecedorId;
    property Referencia: TString read GetReferencia write SetReferencia;
    property Unidade: TString read GetUnidade write SetUnidade;
    property Quantidade: Double read GetQuantidade write SetQuantidade;
    property Nivel: TNivelFornecedor read GetNivel write SetNivel;
  end;

  TReferenciaFornecedorList = class;

  IReferenciaFornecedorList = interface
	['{CEDDADDB-3414-4A17-9AE3-E948BB376430}']
    function GetReference: TReferenciaFornecedorList;
    function GetItems(AIndex: Integer): IReferenciaFornecedor;
    procedure SetItems(AIndex: Integer; const Value: IReferenciaFornecedor);
    procedure Add(const AReferenciaFornecedor: IReferenciaFornecedor);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IReferenciaFornecedor read GetItems write SetItems; default;
  end;

  TReferenciaFornecedorListEnumerator = class
  private
    FIndex: Integer;
    FReferenciaFornecedorList: TReferenciaFornecedorList;
  public
    constructor Create(AReferenciaFornecedorList: TReferenciaFornecedorList);
    function GetCurrent: IReferenciaFornecedor; inline;
    function MoveNext: Boolean;
    property Current: IReferenciaFornecedor read GetCurrent;
  end;

  TReferenciaFornecedorList = class(TInterfacedObject, IReferenciaFornecedorList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IReferenciaFornecedor;
    procedure SetItems(AIndex: Integer; const Value: IReferenciaFornecedor);
  public
    constructor Create;
    procedure Add(const AReferenciaFornecedor: IReferenciaFornecedor);
    destructor Destroy; override;
    function GetEnumerator: TReferenciaFornecedorListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TReferenciaFornecedorList;
    property Items[AIndex: Integer]: IReferenciaFornecedor read GetItems write SetItems; default;
  end;

  TReferenciaFornecedorListRec = record
  private
    FList: IReferenciaFornecedorList;
  public
    class function Create(const AList: IReferenciaFornecedorList): TReferenciaFornecedorListRec; static;
    class operator Implicit(AListRec: TReferenciaFornecedorListRec): TReferenciaFornecedorList;
  end;

  TReferenciaFornecedor = class(TInterfacedModel, IReferenciaFornecedor)
  private
	FId: Variant;
	FFornecedorId: Variant;
	FReferencia: TString;
	FUnidade: TString;
	FQuantidade: Double;
	FNivel: TNivelFornecedor;
    function GetId: Variant;
    procedure SetId(const AId: Variant);
    function GetFornecedorId: Variant;
    procedure SetFornecedorId(const AFornecedorId: Variant);
    function GetReferencia: TString;
    procedure SetReferencia(const AReferencia: TString);
    function GetUnidade: TString;
    procedure SetUnidade(const AUnidade: TString);
    function GetQuantidade: Double;
    procedure SetQuantidade(const AQuantidade: Double);
    function GetNivel: TNivelFornecedor;
    procedure SetNivel(const ANivel: TNivelFornecedor);
  published
    property Id: Variant read GetId write SetId;
    property FornecedorId: Variant read GetFornecedorId write SetFornecedorId;
    property Referencia: TString read GetReferencia write SetReferencia;
    property Unidade: TString read GetUnidade write SetUnidade;
    property Quantidade: Double read GetQuantidade write SetQuantidade;
    property Nivel: TNivelFornecedor read GetNivel write SetNivel;
  end;

implementation

{ TReferenciaFornecedorList }

procedure TReferenciaFornecedorList.Add(const AReferenciaFornecedor: IReferenciaFornecedor);
begin
  FList.Add(AReferenciaFornecedor);
end;

procedure TReferenciaFornecedorList.Clear;
begin
  FList.Clear;
end;

function TReferenciaFornecedorList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TReferenciaFornecedorList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TReferenciaFornecedorList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TReferenciaFornecedorList.GetEnumerator: TReferenciaFornecedorListEnumerator;
begin
  Result := TReferenciaFornecedorListEnumerator.Create(Self);
end;

function TReferenciaFornecedorList.GetItems(AIndex: Integer): IReferenciaFornecedor;
begin
  Result := FList[AIndex] as IReferenciaFornecedor;
end;

function TReferenciaFornecedorList.GetReference: TReferenciaFornecedorList;
begin
  Result := Self;
end;

procedure TReferenciaFornecedorList.SetItems(AIndex: Integer; const Value: IReferenciaFornecedor);
begin
  FList[AIndex] := Value;
end;

{ TReferenciaFornecedorListEnumerator }

constructor TReferenciaFornecedorListEnumerator.Create(AReferenciaFornecedorList: TReferenciaFornecedorList);
begin
  inherited Create;
  FIndex := -1;
  FReferenciaFornecedorList := AReferenciaFornecedorList;
end;

function TReferenciaFornecedorListEnumerator.GetCurrent: IReferenciaFornecedor;
begin
  Result := FReferenciaFornecedorList[FIndex];
end;

function TReferenciaFornecedorListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FReferenciaFornecedorList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TReferenciaFornecedorListRec }

class function TReferenciaFornecedorListRec.Create(const AList: IReferenciaFornecedorList): TReferenciaFornecedorListRec;
begin
  FillChar(Result, SizeOf(TReferenciaFornecedorListRec), 0);
  Result.FList := AList;
end;

class operator TReferenciaFornecedorListRec.Implicit(AListRec: TReferenciaFornecedorListRec): TReferenciaFornecedorList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TReferenciaFornecedor }

function TReferenciaFornecedor.GetId: Variant;
begin
  Result := FId;
end;

procedure TReferenciaFornecedor.SetId(const AId: Variant);
begin
  FId := AId;
end;

function TReferenciaFornecedor.GetFornecedorId: Variant;
begin
  Result := FFornecedorId;
end;

procedure TReferenciaFornecedor.SetFornecedorId(const AFornecedorId: Variant);
begin
  FFornecedorId := AFornecedorId;
end;

function TReferenciaFornecedor.GetReferencia: TString;
begin
  Result := FReferencia;
end;

procedure TReferenciaFornecedor.SetReferencia(const AReferencia: TString);
begin
  FReferencia := AReferencia;
end;

function TReferenciaFornecedor.GetUnidade: TString;
begin
  Result := FUnidade;
end;

procedure TReferenciaFornecedor.SetUnidade(const AUnidade: TString);
begin
  FUnidade := AUnidade;
end;

function TReferenciaFornecedor.GetQuantidade: Double;
begin
  Result := FQuantidade;
end;

procedure TReferenciaFornecedor.SetQuantidade(const AQuantidade: Double);
begin
  FQuantidade := AQuantidade;
end;

function TReferenciaFornecedor.GetNivel: TNivelFornecedor;
begin
  Result := FNivel;
end;

procedure TReferenciaFornecedor.SetNivel(const ANivel: TNivelFornecedor);
begin
  FNivel := ANivel;
end;


end.
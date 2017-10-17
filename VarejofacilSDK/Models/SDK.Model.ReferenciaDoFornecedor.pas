unit SDK.Model.ReferenciaDoFornecedor;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IReferenciaDoFornecedor = interface(IModel)
    ['{52E72C18-7B05-4352-B535-94F1A2213B05}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetFornecedorId: Int64;
    procedure SetFornecedorId(const AFornecedorId: Int64);
    function GetReferencia: TString;
    procedure SetReferencia(const AReferencia: TString);
    function GetUnidade: TString;
    procedure SetUnidade(const AUnidade: TString);
    function GetQuantidade: Double;
    procedure SetQuantidade(const AQuantidade: Double);
    function GetNivel: TNivelFornecedor;
    procedure SetNivel(const ANivel: TNivelFornecedor);
    property Id: Int64 read GetId write SetId;
    property FornecedorId: Int64 read GetFornecedorId write SetFornecedorId;
    property Referencia: TString read GetReferencia write SetReferencia;
    property Unidade: TString read GetUnidade write SetUnidade;
    property Quantidade: Double read GetQuantidade write SetQuantidade;
    property Nivel: TNivelFornecedor read GetNivel write SetNivel;
  end;

  TReferenciaDoFornecedorList = class;

  IReferenciaDoFornecedorList = interface
	['{CEDDADDB-3414-4A17-9AE3-E948BB376430}']
    function GetReference: TReferenciaDoFornecedorList;
    function GetItems(AIndex: Integer): IReferenciaDoFornecedor;
    procedure SetItems(AIndex: Integer; const Value: IReferenciaDoFornecedor);
    procedure Add(const AReferenciaDoFornecedor: IReferenciaDoFornecedor);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IReferenciaDoFornecedor read GetItems write SetItems; default;
  end;

  TReferenciaDoFornecedorListEnumerator = class
  private
    FIndex: Integer;
    FReferenciaDoFornecedorList: TReferenciaDoFornecedorList;
  public
    constructor Create(AReferenciaDoFornecedorList: TReferenciaDoFornecedorList);
    function GetCurrent: IReferenciaDoFornecedor; inline;
    function MoveNext: Boolean;
    property Current: IReferenciaDoFornecedor read GetCurrent;
  end;

  TReferenciaDoFornecedorList = class(TInterfacedObject, IReferenciaDoFornecedorList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IReferenciaDoFornecedor;
    procedure SetItems(AIndex: Integer; const Value: IReferenciaDoFornecedor);
  public
    constructor Create;
    procedure Add(const AReferenciaDoFornecedor: IReferenciaDoFornecedor);
    destructor Destroy; override;
    function GetEnumerator: TReferenciaDoFornecedorListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TReferenciaDoFornecedorList;
    property Items[AIndex: Integer]: IReferenciaDoFornecedor read GetItems write SetItems; default;
  end;

  TReferenciaDoFornecedorListRec = record
  private
    FList: IReferenciaDoFornecedorList;
  public
    class function Create(const AList: IReferenciaDoFornecedorList): TReferenciaDoFornecedorListRec; static;
    class operator Implicit(AListRec: TReferenciaDoFornecedorListRec): TReferenciaDoFornecedorList;
  end;

  TReferenciaDoFornecedor = class(TInterfacedModel, IReferenciaDoFornecedor)
  private
	FId: Int64;
	FFornecedorId: Int64;
	FReferencia: TString;
	FUnidade: TString;
	FQuantidade: Double;
	FNivel: TNivelFornecedor;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetFornecedorId: Int64;
    procedure SetFornecedorId(const AFornecedorId: Int64);
    function GetReferencia: TString;
    procedure SetReferencia(const AReferencia: TString);
    function GetUnidade: TString;
    procedure SetUnidade(const AUnidade: TString);
    function GetQuantidade: Double;
    procedure SetQuantidade(const AQuantidade: Double);
    function GetNivel: TNivelFornecedor;
    procedure SetNivel(const ANivel: TNivelFornecedor);
  published
    property Id: Int64 read GetId write SetId;
    property FornecedorId: Int64 read GetFornecedorId write SetFornecedorId;
    property Referencia: TString read GetReferencia write SetReferencia;
    property Unidade: TString read GetUnidade write SetUnidade;
    property Quantidade: Double read GetQuantidade write SetQuantidade;
    property Nivel: TNivelFornecedor read GetNivel write SetNivel;
  end;

implementation

{ TReferenciaDoFornecedorList }

procedure TReferenciaDoFornecedorList.Add(const AReferenciaDoFornecedor: IReferenciaDoFornecedor);
begin
  FList.Add(AReferenciaDoFornecedor);
end;

procedure TReferenciaDoFornecedorList.Clear;
begin
  FList.Clear;
end;

function TReferenciaDoFornecedorList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TReferenciaDoFornecedorList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TReferenciaDoFornecedorList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TReferenciaDoFornecedorList.GetEnumerator: TReferenciaDoFornecedorListEnumerator;
begin
  Result := TReferenciaDoFornecedorListEnumerator.Create(Self);
end;

function TReferenciaDoFornecedorList.GetItems(AIndex: Integer): IReferenciaDoFornecedor;
begin
  Result := FList[AIndex] as IReferenciaDoFornecedor;
end;

function TReferenciaDoFornecedorList.GetReference: TReferenciaDoFornecedorList;
begin
  Result := Self;
end;

procedure TReferenciaDoFornecedorList.SetItems(AIndex: Integer; const Value: IReferenciaDoFornecedor);
begin
  FList[AIndex] := Value;
end;

{ TReferenciaDoFornecedorListEnumerator }

constructor TReferenciaDoFornecedorListEnumerator.Create(AReferenciaDoFornecedorList: TReferenciaDoFornecedorList);
begin
  inherited Create;
  FIndex := -1;
  FReferenciaDoFornecedorList := AReferenciaDoFornecedorList;
end;

function TReferenciaDoFornecedorListEnumerator.GetCurrent: IReferenciaDoFornecedor;
begin
  Result := FReferenciaDoFornecedorList[FIndex];
end;

function TReferenciaDoFornecedorListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FReferenciaDoFornecedorList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TReferenciaDoFornecedorListRec }

class function TReferenciaDoFornecedorListRec.Create(const AList: IReferenciaDoFornecedorList): TReferenciaDoFornecedorListRec;
begin
  FillChar(Result, SizeOf(TReferenciaDoFornecedorListRec), 0);
  Result.FList := AList;
end;

class operator TReferenciaDoFornecedorListRec.Implicit(AListRec: TReferenciaDoFornecedorListRec): TReferenciaDoFornecedorList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TReferenciaDoFornecedor }

function TReferenciaDoFornecedor.GetId: Int64;
begin
  Result := FId;
end;

procedure TReferenciaDoFornecedor.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TReferenciaDoFornecedor.GetFornecedorId: Int64;
begin
  Result := FFornecedorId;
end;

procedure TReferenciaDoFornecedor.SetFornecedorId(const AFornecedorId: Int64);
begin
  FFornecedorId := AFornecedorId;
end;

function TReferenciaDoFornecedor.GetReferencia: TString;
begin
  Result := FReferencia;
end;

procedure TReferenciaDoFornecedor.SetReferencia(const AReferencia: TString);
begin
  FReferencia := AReferencia;
end;

function TReferenciaDoFornecedor.GetUnidade: TString;
begin
  Result := FUnidade;
end;

procedure TReferenciaDoFornecedor.SetUnidade(const AUnidade: TString);
begin
  FUnidade := AUnidade;
end;

function TReferenciaDoFornecedor.GetQuantidade: Double;
begin
  Result := FQuantidade;
end;

procedure TReferenciaDoFornecedor.SetQuantidade(const AQuantidade: Double);
begin
  FQuantidade := AQuantidade;
end;

function TReferenciaDoFornecedor.GetNivel: TNivelFornecedor;
begin
  Result := FNivel;
end;

procedure TReferenciaDoFornecedor.SetNivel(const ANivel: TNivelFornecedor);
begin
  FNivel := ANivel;
end;


end.
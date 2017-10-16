unit SDK.Model.Contato;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IContato = interface(IModel)
    ['{D123B770-D4D4-400F-BB55-EAF78CBBE95A}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetNome: TString;
    procedure SetNome(const ANome: TString);
    function GetCargo: TString;
    procedure SetCargo(const ACargo: TString);
    function GetTelefone: TString;
    procedure SetTelefone(const ATelefone: TString);
    function GetCelular: TString;
    procedure SetCelular(const ACelular: TString);
    function GetCidade: TString;
    procedure SetCidade(const ACidade: TString);
    function GetSexo: TString;
    procedure SetSexo(const ASexo: TString);
    function GetEmail: TString;
    procedure SetEmail(const AEmail: TString);
    function GetObservacao: TString;
    procedure SetObservacao(const AObservacao: TString);
    function GetEnviaNfePorEmail: Boolean;
    procedure SetEnviaNfePorEmail(const AEnviaNfePorEmail: Boolean);
    property Id: Int64 read GetId write SetId;
    property Nome: TString read GetNome write SetNome;
    property Cargo: TString read GetCargo write SetCargo;
    property Telefone: TString read GetTelefone write SetTelefone;
    property Celular: TString read GetCelular write SetCelular;
    property Cidade: TString read GetCidade write SetCidade;
    property Sexo: TString read GetSexo write SetSexo;
    property Email: TString read GetEmail write SetEmail;
    property Observacao: TString read GetObservacao write SetObservacao;
    property EnviaNfePorEmail: Boolean read GetEnviaNfePorEmail write SetEnviaNfePorEmail;
  end;

  TContatoList = class;

  IContatoList = interface
	['{21D072B6-0028-4727-B8B9-CE9F6D5A83E3}']
    function GetReference: TContatoList;
    function GetItems(AIndex: Integer): IContato;
    procedure SetItems(AIndex: Integer; const Value: IContato);
    procedure Add(const AContato: IContato);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IContato read GetItems write SetItems; default;
  end;

  TContatoListEnumerator = class
  private
    FIndex: Integer;
    FContatoList: TContatoList;
  public
    constructor Create(AContatoList: TContatoList);
    function GetCurrent: IContato; inline;
    function MoveNext: Boolean;
    property Current: IContato read GetCurrent;
  end;

  TContatoList = class(TInterfacedObject, IContatoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IContato;
    procedure SetItems(AIndex: Integer; const Value: IContato);
  public
    constructor Create;
    procedure Add(const AContato: IContato);
    destructor Destroy; override;
    function GetEnumerator: TContatoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TContatoList;
    property Items[AIndex: Integer]: IContato read GetItems write SetItems; default;
  end;

  TContatoListRec = record
  private
    FList: IContatoList;
  public
    class function Create(const AList: IContatoList): TContatoListRec; static;
    class operator Implicit(AListRec: TContatoListRec): TContatoList;
  end;

  TContato = class(TInterfacedModel, IContato)
  private
	FId: Int64;
	FNome: TString;
	FCargo: TString;
	FTelefone: TString;
	FCelular: TString;
	FCidade: TString;
	FSexo: TString;
	FEmail: TString;
	FObservacao: TString;
	FEnviaNfePorEmail: Boolean;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetNome: TString;
    procedure SetNome(const ANome: TString);
    function GetCargo: TString;
    procedure SetCargo(const ACargo: TString);
    function GetTelefone: TString;
    procedure SetTelefone(const ATelefone: TString);
    function GetCelular: TString;
    procedure SetCelular(const ACelular: TString);
    function GetCidade: TString;
    procedure SetCidade(const ACidade: TString);
    function GetSexo: TString;
    procedure SetSexo(const ASexo: TString);
    function GetEmail: TString;
    procedure SetEmail(const AEmail: TString);
    function GetObservacao: TString;
    procedure SetObservacao(const AObservacao: TString);
    function GetEnviaNfePorEmail: Boolean;
    procedure SetEnviaNfePorEmail(const AEnviaNfePorEmail: Boolean);
  public
    property Id: Int64 read GetId write SetId;
    property Nome: TString read GetNome write SetNome;
    property Cargo: TString read GetCargo write SetCargo;
    property Telefone: TString read GetTelefone write SetTelefone;
    property Celular: TString read GetCelular write SetCelular;
    property Cidade: TString read GetCidade write SetCidade;
    property Sexo: TString read GetSexo write SetSexo;
    property Email: TString read GetEmail write SetEmail;
    property Observacao: TString read GetObservacao write SetObservacao;
    property EnviaNfePorEmail: Boolean read GetEnviaNfePorEmail write SetEnviaNfePorEmail;
  end;

implementation

{ TContatoList }

procedure TContatoList.Add(const AContato: IContato);
begin
  FList.Add(AContato);
end;

procedure TContatoList.Clear;
begin
  FList.Clear;
end;

function TContatoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TContatoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TContatoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TContatoList.GetEnumerator: TContatoListEnumerator;
begin
  Result := TContatoListEnumerator.Create(Self);
end;

function TContatoList.GetItems(AIndex: Integer): IContato;
begin
  Result := FList[AIndex] as IContato;
end;

function TContatoList.GetReference: TContatoList;
begin
  Result := Self;
end;

procedure TContatoList.SetItems(AIndex: Integer; const Value: IContato);
begin
  FList[AIndex] := Value;
end;

{ TContatoListEnumerator }

constructor TContatoListEnumerator.Create(AContatoList: TContatoList);
begin
  inherited Create;
  FIndex := -1;
  FContatoList := AContatoList;
end;

function TContatoListEnumerator.GetCurrent: IContato;
begin
  Result := FContatoList[FIndex];
end;

function TContatoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FContatoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TContatoListRec }

class function TContatoListRec.Create(const AList: IContatoList): TContatoListRec;
begin
  FillChar(Result, SizeOf(TContatoListRec), 0);
  Result.FList := AList;
end;

class operator TContatoListRec.Implicit(AListRec: TContatoListRec): TContatoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TContato }

function TContato.GetId: Int64;
begin
  Result := FId;
end;

procedure TContato.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TContato.GetNome: TString;
begin
  Result := FNome;
end;

procedure TContato.SetNome(const ANome: TString);
begin
  FNome := ANome;
end;

function TContato.GetCargo: TString;
begin
  Result := FCargo;
end;

procedure TContato.SetCargo(const ACargo: TString);
begin
  FCargo := ACargo;
end;

function TContato.GetTelefone: TString;
begin
  Result := FTelefone;
end;

procedure TContato.SetTelefone(const ATelefone: TString);
begin
  FTelefone := ATelefone;
end;

function TContato.GetCelular: TString;
begin
  Result := FCelular;
end;

procedure TContato.SetCelular(const ACelular: TString);
begin
  FCelular := ACelular;
end;

function TContato.GetCidade: TString;
begin
  Result := FCidade;
end;

procedure TContato.SetCidade(const ACidade: TString);
begin
  FCidade := ACidade;
end;

function TContato.GetSexo: TString;
begin
  Result := FSexo;
end;

procedure TContato.SetSexo(const ASexo: TString);
begin
  FSexo := ASexo;
end;

function TContato.GetEmail: TString;
begin
  Result := FEmail;
end;

procedure TContato.SetEmail(const AEmail: TString);
begin
  FEmail := AEmail;
end;

function TContato.GetObservacao: TString;
begin
  Result := FObservacao;
end;

procedure TContato.SetObservacao(const AObservacao: TString);
begin
  FObservacao := AObservacao;
end;

function TContato.GetEnviaNfePorEmail: Boolean;
begin
  Result := FEnviaNfePorEmail;
end;

procedure TContato.SetEnviaNfePorEmail(const AEnviaNfePorEmail: Boolean);
begin
  FEnviaNfePorEmail := AEnviaNfePorEmail;
end;


end.
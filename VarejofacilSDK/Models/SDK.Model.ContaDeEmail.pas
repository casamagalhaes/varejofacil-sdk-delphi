unit SDK.Model.ContaDeEmail;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IContaDeEmail = interface(IModel)
    ['{C3B593EC-600A-490E-A631-F7BCA329EE71}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetAutenticacao: Boolean;
    procedure SetAutenticacao(const AAutenticacao: Boolean);
    function GetSsl: Boolean;
    procedure SetSsl(const ASsl: Boolean);
    function GetTls: Boolean;
    procedure SetTls(const ATls: Boolean);
    function GetHost: TString;
    procedure SetHost(const AHost: TString);
    function GetPorta: Integer;
    procedure SetPorta(const APorta: Integer);
    function GetUsuario: TString;
    procedure SetUsuario(const AUsuario: TString);
    function GetSenha: TString;
    procedure SetSenha(const ASenha: TString);
    function GetPadrao: Boolean;
    procedure SetPadrao(const APadrao: Boolean);
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property Autenticacao: Boolean read GetAutenticacao write SetAutenticacao;
    property Ssl: Boolean read GetSsl write SetSsl;
    property Tls: Boolean read GetTls write SetTls;
    property Host: TString read GetHost write SetHost;
    property Porta: Integer read GetPorta write SetPorta;
    property Usuario: TString read GetUsuario write SetUsuario;
    property Senha: TString read GetSenha write SetSenha;
    property Padrao: Boolean read GetPadrao write SetPadrao;
  end;

  TContaDeEmailList = class;

  IContaDeEmailList = interface
	['{AB82B9A0-7DBD-4966-B0C3-776E64E53169}']
    function GetReference: TContaDeEmailList;
    function GetItems(AIndex: Integer): IContaDeEmail;
    procedure SetItems(AIndex: Integer; const Value: IContaDeEmail);
    procedure Add(const AContaDeEmail: IContaDeEmail);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IContaDeEmail read GetItems write SetItems; default;
  end;

  TContaDeEmailListEnumerator = class
  private
    FIndex: Integer;
    FContaDeEmailList: TContaDeEmailList;
  public
    constructor Create(AContaDeEmailList: TContaDeEmailList);
    function GetCurrent: IContaDeEmail; inline;
    function MoveNext: Boolean;
    property Current: IContaDeEmail read GetCurrent;
  end;

  TContaDeEmailList = class(TInterfacedObject, IContaDeEmailList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IContaDeEmail;
    procedure SetItems(AIndex: Integer; const Value: IContaDeEmail);
  public
    constructor Create;
    procedure Add(const AContaDeEmail: IContaDeEmail);
    destructor Destroy; override;
    function GetEnumerator: TContaDeEmailListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TContaDeEmailList;
    property Items[AIndex: Integer]: IContaDeEmail read GetItems write SetItems; default;
  end;

  TContaDeEmailListRec = record
  private
    FList: IContaDeEmailList;
  public
    class function Create(const AList: IContaDeEmailList): TContaDeEmailListRec; static;
    class operator Implicit(AListRec: TContaDeEmailListRec): TContaDeEmailList;
  end;

  TContaDeEmail = class(TInterfacedModel, IContaDeEmail)
  private
	FId: Int64;
	FDescricao: TString;
	FAutenticacao: Boolean;
	FSsl: Boolean;
	FTls: Boolean;
	FHost: TString;
	FPorta: Integer;
	FUsuario: TString;
	FSenha: TString;
	FPadrao: Boolean;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetAutenticacao: Boolean;
    procedure SetAutenticacao(const AAutenticacao: Boolean);
    function GetSsl: Boolean;
    procedure SetSsl(const ASsl: Boolean);
    function GetTls: Boolean;
    procedure SetTls(const ATls: Boolean);
    function GetHost: TString;
    procedure SetHost(const AHost: TString);
    function GetPorta: Integer;
    procedure SetPorta(const APorta: Integer);
    function GetUsuario: TString;
    procedure SetUsuario(const AUsuario: TString);
    function GetSenha: TString;
    procedure SetSenha(const ASenha: TString);
    function GetPadrao: Boolean;
    procedure SetPadrao(const APadrao: Boolean);
  public
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property Autenticacao: Boolean read GetAutenticacao write SetAutenticacao;
    property Ssl: Boolean read GetSsl write SetSsl;
    property Tls: Boolean read GetTls write SetTls;
    property Host: TString read GetHost write SetHost;
    property Porta: Integer read GetPorta write SetPorta;
    property Usuario: TString read GetUsuario write SetUsuario;
    property Senha: TString read GetSenha write SetSenha;
    property Padrao: Boolean read GetPadrao write SetPadrao;
  end;

implementation

{ TContaDeEmailList }

procedure TContaDeEmailList.Add(const AContaDeEmail: IContaDeEmail);
begin
  FList.Add(AContaDeEmail);
end;

procedure TContaDeEmailList.Clear;
begin
  FList.Clear;
end;

function TContaDeEmailList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TContaDeEmailList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TContaDeEmailList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TContaDeEmailList.GetEnumerator: TContaDeEmailListEnumerator;
begin
  Result := TContaDeEmailListEnumerator.Create(Self);
end;

function TContaDeEmailList.GetItems(AIndex: Integer): IContaDeEmail;
begin
  Result := FList[AIndex] as IContaDeEmail;
end;

function TContaDeEmailList.GetReference: TContaDeEmailList;
begin
  Result := Self;
end;

procedure TContaDeEmailList.SetItems(AIndex: Integer; const Value: IContaDeEmail);
begin
  FList[AIndex] := Value;
end;

{ TContaDeEmailListEnumerator }

constructor TContaDeEmailListEnumerator.Create(AContaDeEmailList: TContaDeEmailList);
begin
  inherited Create;
  FIndex := -1;
  FContaDeEmailList := AContaDeEmailList;
end;

function TContaDeEmailListEnumerator.GetCurrent: IContaDeEmail;
begin
  Result := FContaDeEmailList[FIndex];
end;

function TContaDeEmailListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FContaDeEmailList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TContaDeEmailListRec }

class function TContaDeEmailListRec.Create(const AList: IContaDeEmailList): TContaDeEmailListRec;
begin
  FillChar(Result, SizeOf(TContaDeEmailListRec), 0);
  Result.FList := AList;
end;

class operator TContaDeEmailListRec.Implicit(AListRec: TContaDeEmailListRec): TContaDeEmailList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TContaDeEmail }

function TContaDeEmail.GetId: Int64;
begin
  Result := FId;
end;

procedure TContaDeEmail.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TContaDeEmail.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TContaDeEmail.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

function TContaDeEmail.GetAutenticacao: Boolean;
begin
  Result := FAutenticacao;
end;

procedure TContaDeEmail.SetAutenticacao(const AAutenticacao: Boolean);
begin
  FAutenticacao := AAutenticacao;
end;

function TContaDeEmail.GetSsl: Boolean;
begin
  Result := FSsl;
end;

procedure TContaDeEmail.SetSsl(const ASsl: Boolean);
begin
  FSsl := ASsl;
end;

function TContaDeEmail.GetTls: Boolean;
begin
  Result := FTls;
end;

procedure TContaDeEmail.SetTls(const ATls: Boolean);
begin
  FTls := ATls;
end;

function TContaDeEmail.GetHost: TString;
begin
  Result := FHost;
end;

procedure TContaDeEmail.SetHost(const AHost: TString);
begin
  FHost := AHost;
end;

function TContaDeEmail.GetPorta: Integer;
begin
  Result := FPorta;
end;

procedure TContaDeEmail.SetPorta(const APorta: Integer);
begin
  FPorta := APorta;
end;

function TContaDeEmail.GetUsuario: TString;
begin
  Result := FUsuario;
end;

procedure TContaDeEmail.SetUsuario(const AUsuario: TString);
begin
  FUsuario := AUsuario;
end;

function TContaDeEmail.GetSenha: TString;
begin
  Result := FSenha;
end;

procedure TContaDeEmail.SetSenha(const ASenha: TString);
begin
  FSenha := ASenha;
end;

function TContaDeEmail.GetPadrao: Boolean;
begin
  Result := FPadrao;
end;

procedure TContaDeEmail.SetPadrao(const APadrao: Boolean);
begin
  FPadrao := APadrao;
end;


end.
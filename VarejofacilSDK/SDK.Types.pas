unit SDK.Types;

interface

uses
  SysUtils, Classes, XMLDoc, XMLIntf, TypInfo, DateUtils, XSBuiltIns;

const
  CURRENT_TIMEZONE = -(3 * 3600);
  UTF8_CODEPAGE = 65001;
  LATIN_CODEPAGE = 28591;
  HTTPS_PROTOCOL = 'https';

type

  TString = AnsiString;

  PString = ^TString;

  TMethod = (mtGET, mtPOST, mtPUT, mtDELETE);

  TCustomXMLNodeArray = array of IXMLNode;

  TStringArray = array of TString;

  TLongList = class;

  ILongList = interface
	['{A6640812-180D-4453-B6F3-9FAC53DD872A}']
    function GetReference: TLongList;
    function GetItems(AIndex: Integer): Int64;
    procedure SetItems(AIndex: Integer; const Value: Int64);
    procedure Add(const ALong: Int64);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: Int64 read GetItems write SetItems; default;
  end;

  TLongListEnumerator = class
  private
    FIndex: Integer;
    FLongList: TLongList;
  public
    constructor Create(ALongList: TLongList);
    function GetCurrent: Int64; inline;
    function MoveNext: Boolean;
    property Current: Int64 read GetCurrent;
  end;

  TLongList = class(TInterfacedObject, ILongList)
  private
    FArray: array of Int64;
    function GetItems(AIndex: Integer): Int64;
    procedure SetItems(AIndex: Integer; const Value: Int64);
  public
    constructor Create;
    procedure Add(const ALong: Int64);
    destructor Destroy; override;
    function GetEnumerator: TLongListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TLongList;
    property Items[AIndex: Integer]: Int64 read GetItems write SetItems; default;
  end;

  TLongListRec = record
  private
    FList: ILongList;
  public
    class function Create(const AList: ILongList): TLongListRec; static;
    class operator Implicit(AListRec: TLongListRec): TLongList;
  end;

  TDouble = double;

  TCharacter = char;

  TInterfacedPersistentClass = class of TInterfacedPersistent;

  IResponse = interface
    ['{9AD82F23-18F5-416C-9C2D-9CD00EA7489B}']
    procedure SetHeaders(AHeaders: TStrings);
    function GetHeaders: TStrings;
    procedure SetContent(const AContent: TString);
    function GetContent: TString;
    procedure SetStatus(AStatus: Integer);
    function GetStatus: Integer;
    function AsXML: IXMLDocument;
    property Headers: TStrings read GetHeaders write SetHeaders;
    property Content: TString read GetContent write SetContent;
    property Status: Integer read GetStatus write SetStatus;
  end;

  IRequest = interface
    ['{D8B992C0-6FFC-4F2C-A6D7-5B7D3DEBD7F1}']
    function GetMethod: TMethod;
    procedure SetMethod(AMethod: TMethod);
    function GetParams: TStrings;
    procedure SetParams(AParams: TStrings);
    function GetHeaders: TStrings;
    procedure SetHeaders(AHeaders: TStrings);
    function GetContent: TString;
    procedure SetContent(const AContent: TString);
    function GetURL: TString;
    procedure SetURL(const AURL: TString);
    property URL: TString read GetURL write SetURL;
    property Method: TMethod read GetMethod write SetMethod;
    property Params: TStrings read GetParams write SetParams;
    property Headers: TStrings read GetHeaders write SetHeaders;
    property Content: TString read GetContent write SetContent;
  end;

  TTokenStorage = class
  private
    FAccessToken: string;
    FRefreshToken: string;
    FApiKey: string;
  public
    property AccessToken: string read FAccessToken write FAccessToken;
    property RefreshToken: string read FRefreshToken write FRefreshToken;
    property ApiKey: string read FApiKey write FApiKey;
    class function From(const AResponse: IResponse): TTokenStorage; overload;
    class function From(const AApiKey: string): TTokenStorage; overload;
    function Clone: TTokenStorage;
  end;

  TAuthenticatedRequest = function(const AURL: TString; AParams, AHeaders: TStrings; AContent: TString; ATokens: TTokenStorage): IResponse of object;

  IClient = interface
    ['{D9CBE96B-2ACC-4C93-B6C7-CEAC97A24471}']
    function Authenticate(const AURL: TString; AParams, AHeaders: TStrings; AContent: TString; ARequestFunction: TAuthenticatedRequest): IResponse;
    function MakeRequest(const ARequest: IRequest): IResponse;
    function Get(const AURL: TString; AParams, AHeaders: TStrings): IResponse;
    function Put(const AURL, AContent: TString; AHeaders: TStrings): IResponse;
    function Post(const AURL, AContent: TString; AHeaders: TStrings): IResponse;
    function Delete(const AURL: TString; AParams, AHeaders: TStrings): IResponse;
  end;

  TInterfacedModel = class;

  IModel = interface(IInterface)
    ['{4CA248F6-1DA0-485C-BAA6-1F612A7036EC}']
    function GetReference: TInterfacedModel;
  end;

  TModelArray = array of IModel;

  TInterfacedModel = class(TPersistent, IModel)
  private
    FRefCount: Integer;
  public
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
    function QueryInterface(const IID: TGUID; out Obj): HRESULT; stdcall;
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    class function NewInstance: TObject; override;
    function GetReference: TInterfacedModel;
    property RefCount: Integer read FRefCount;
  end;

  TInterfacedModelClass = class of TInterfacedModel;

  function IndexOf(const AItem: TString; AArray: TStringArray): Integer;

  function DateTimeToISO8601(const AInput: TDateTime): TString;

  function ISO8601ToDateTime(const AInput: TString): TDateTime;

implementation

uses
  SDK.XML, Windows;

function InterlockedIncrement(var Addend: Integer): Integer; stdcall;
  external kernel32 name 'InterlockedIncrement';

function InterlockedDecrement(var Addend: Integer): Integer; stdcall;
  external kernel32 name 'InterlockedDecrement';

{ TInterfacedModel }

procedure TInterfacedModel.AfterConstruction;
begin
  InterlockedDecrement(FRefCount);
end;

procedure TInterfacedModel.BeforeDestruction;
begin
  if RefCount <> 0 then
    System.Error(reInvalidPtr);
end;

function TInterfacedModel.GetReference: TInterfacedModel;
begin
  Result := Self;
end;

class function TInterfacedModel.NewInstance: TObject;
begin
  Result := inherited NewInstance;
  TInterfacedModel(Result).FRefCount := 1;
end;

function TInterfacedModel.QueryInterface(const IID: TGUID; out Obj): HRESULT;
begin
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

function TInterfacedModel._AddRef: Integer;
begin
  Result := InterlockedIncrement(FRefCount);
end;

function TInterfacedModel._Release: Integer;
begin
  Result := InterlockedDecrement(FRefCount);
  if Result = 0 then
    Destroy;
end;

function IndexOf(const AItem: TString; AArray: TStringArray): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := Low(AArray) to High(AArray) do
    if AArray[I] = AItem then
    begin
      Result := I;
      Exit;
    end;
end;

{ TTokenStorage }

function TTokenStorage.Clone: TTokenStorage;
begin
  Result := TTokenStorage.Create;
  Result.AccessToken := FAccessToken;
  Result.RefreshToken := FRefreshToken;
  Result.ApiKey := FApiKey;
end;

class function TTokenStorage.From(const AResponse: IResponse): TTokenStorage;
var
  Document: IXMLDocument;
  AccessTokenNode, RefreshTokenNode: TCustomXMLNodeArray;
begin
  Document := AResponse.AsXML;
  AccessTokenNode := TXMLHelper.XPathSelect(Document, '//ResultToken/accessToken');
  RefreshTokenNode := TXMLHelper.XPathSelect(Document, '//ResultToken/refreshToken');
  Result := TTokenStorage.Create;
  if Length(AccessTokenNode) > 0 then
    Result.AccessToken := AccessTokenNode[0].Text;
  if Length(RefreshTokenNode) > 0 then
    Result.RefreshToken := RefreshTokenNode[0].Text;
end;

class function TTokenStorage.From(const AApiKey: string): TTokenStorage;
begin
  Result := TTokenStorage.Create;
  Result.ApiKey := AApiKey;
end;

{ TLongList }

procedure TLongList.Add(const ALong: Int64);
begin
  SetLength(FArray, Length(FArray) + 1);
  FArray[Length(FArray) - 1] := ALong;
end;

procedure TLongList.Clear;
begin
  SetLength(FArray, 0);
end;

function TLongList.Count: Integer;
begin
  Result := Length(FArray);
end;

constructor TLongList.Create;
begin
  SetLength(FArray, 0);
end;

destructor TLongList.Destroy;
begin
  FreeAndNil(FArray);
  inherited;
end;

function TLongList.GetEnumerator: TLongListEnumerator;
begin
  Result := TLongListEnumerator.Create(Self);
end;

function TLongList.GetItems(AIndex: Integer): Int64;
begin
  Result := FArray[AIndex];
end;

function TLongList.GetReference: TLongList;
begin
  Result := Self;
end;

procedure TLongList.SetItems(AIndex: Integer; const Value: Int64);
begin
  FArray[AIndex] := Value;
end;

{ TLongListEnumerator }

constructor TLongListEnumerator.Create(ALongList: TLongList);
begin
  inherited Create;
  FIndex := -1;
  FLongList := ALongList;
end;

function TLongListEnumerator.GetCurrent: Int64;
begin
  Result := FLongList[FIndex];
end;

function TLongListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FLongList.Count - 1;
  if Result then
      Inc(FIndex);
end;

{ TLongListRec }

class function TLongListRec.Create(const AList: ILongList): TLongListRec;
begin
  FillChar(Result, SizeOf(TLongListRec), 0);
  Result.FList := AList;
end;

class operator TLongListRec.Implicit(AListRec: TLongListRec): TLongList;
begin
  Result := AListRec.FList.GetReference;
end;

function DateTimeToISO8601(const AInput: TDateTime): TString;
var
  Date: TXSDateTime;
begin
  Date := TXSDateTime.Create();
  try
    Date.AsDateTime := AInput;
    Result := DateToISO8601(TTimeZone.Local.ToLocalTime(Date.AsUTCDateTime));
  finally
    Date.Free;
  end;
end;

function ISO8601ToDateTime(const AInput: TString): TDateTime;
begin
  Result := ISO8601ToDate(Copy(AInput, 1, Pos('+', AInput) - 1), False);
end;

end.

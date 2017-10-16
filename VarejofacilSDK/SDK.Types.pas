unit SDK.Types;



interface

uses
  SysUtils, Classes, XMLDoc, XMLIntf, TypInfo, Generics.Collections;

const
  CURRENT_TIMEZONE = -(3 * 3600);

type

  TString = string;

  TMethod = (mtGET, mtPOST, mtPUT, mtDELETE);

  TCustomXMLNodeArray = array of IXMLNode;

  TStringArray = array of TString;

  TLongList = TList<Int64>;

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

  TRequestFunction = function(const ARequest: IRequest): IResponse of object;

  IClient = interface
    ['{D9CBE96B-2ACC-4C93-B6C7-CEAC97A24471}']
    function Authenticate(ARequestFunction: TRequestFunction): IResponse;
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

implementation

{ TInterfacedModel }

procedure TInterfacedModel.AfterConstruction;
begin
  AtomicDecrement(FRefCount);
end;

procedure TInterfacedModel.BeforeDestruction;
begin
  if RefCount <> 0 then
    Error(reInvalidPtr);
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
  Result := AtomicIncrement(FRefCount);
end;

function TInterfacedModel._Release: Integer;
begin
  Result := AtomicDecrement(FRefCount);
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

end.

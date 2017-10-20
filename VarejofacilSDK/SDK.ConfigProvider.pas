unit SDK.ConfigProvider;

interface

uses
  SysUtils, SDK.Types, IniFiles;

type

  IConfigProvider = interface
    ['{0532D8B2-8019-4768-B9C7-3A7B326D3085}']
    function GetProperty(const AName: TString): TString;
    procedure SetProperty(const AName, AValue: TString);
  end;

  TConfigProvider = class(TInterfacedObject, IConfigProvider)
  public
    constructor Create; virtual;
    function GetProperty(const AName: TString): TString; virtual; abstract;
    procedure SetProperty(const AName: TString; const AValue: TString); virtual; abstract;
  end;

  TConfigProviderClass = class of TConfigProvider;

  TIniConfigProvider = class(TConfigProvider)
  strict private
    FFile: TIniFile;
  public
    constructor Create(const AFilename: TString); reintroduce; overload;
    constructor Create; overload; override;
    destructor Destroy; override;
    function GetProperty(const AName: TString): TString; override;
    procedure SetProperty(const AName: TString; const AValue: TString); override;
  end;

var
  DefaultConfigProviderClass: TConfigProviderClass;

implementation

{ TIniConfigProvider }

constructor TIniConfigProvider.Create(const AFilename: TString);
begin
  inherited Create;
  FFile := TIniFile.Create(AFilename);
end;

constructor TIniConfigProvider.Create;
begin
  inherited Create;
  FFile := TIniFile.Create(Concat(GetCurrentDir, '\Config.ini'));
end;

destructor TIniConfigProvider.Destroy;
begin
  FreeAndNil(FFile);
  inherited;
end;

function TIniConfigProvider.GetProperty(const AName: TString): TString;
begin
  Result := FFile.ReadString('Varejofacil', AName, EmptyStr);
end;

procedure TIniConfigProvider.SetProperty(const AName, AValue: TString);
begin
  FFile.WriteString('Varejofacil', AName, AValue);
end;

{ TConfigProvider }

constructor TConfigProvider.Create;
begin
  inherited Create;
end;

initialization
  DefaultConfigProviderClass := TIniConfigProvider;

end.
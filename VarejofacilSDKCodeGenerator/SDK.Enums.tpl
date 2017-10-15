unit SDK.Enums;

interface

uses
  SysUtils, Classes, SDK.Types;

type
  EnumException = class(Exception);  

  TConverter = function(const AValue: TString): Integer;

  TEnumConverters = class(TStringList)
  public
    procedure Register(const AEnumName: TString; AConverter: TConverter);
    function Execute(const AEnumName, AValue: TString): Integer;
  end;

var
  EnumConverters: TEnumConverters;

type 
  %BEGIN_LOOP(ENUMS)%
  T%ENUM_NAME% = (%KEYS_BETWEEN_COMMAS%);
  %END_LOOP%

implementation

%BEGIN_LOOP(ENUMS)%

{ T%ENUM_NAME% }

function Converter_%ENUM_NAME%(const AValue: TString): Integer;
begin
%VALUE_TO_KEY_CASES%  raise EnumException.CreateFmt('Valor $s incorreto para %ENUM_NAME%.', [AValue]);
end;%END_LOOP%

{ TEnumConversors }

function TEnumConverters.Execute(const AEnumName, AValue: TString): Integer;
var
  Converter: TConverter;
begin
  Converter := TConverter(StrToInt(Self.Values[AEnumName]));
  Result := Converter(AValue);
end;

procedure TEnumConverters.Register(const AEnumName: TString;
  AConverter: TConverter);
begin
  Self.Values[AEnumName] := IntToStr(Integer(@AConverter));
end;

initialization
  EnumConverters := TEnumConverters.Create;%BEGIN_LOOP(ENUMS)%
  EnumConverters.Register('T%ENUM_NAME%', @Converter_%ENUM_NAME%);%END_LOOP%

finalization
  FreeAndNil(EnumConverters);

end.

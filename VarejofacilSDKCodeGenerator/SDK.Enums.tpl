unit SDK.Enums;

interface

uses
  SysUtils, Classes, SDK.Types;

type
  EnumException = class(Exception);  

  TConverterStrToEnum = function(const AValue: TString): Integer;
  TConverterEnumToStr = function(const AValue: Integer): TString;

  TEnumConverters = class(TStringList)
  private
    const
      STR_TO_ENUM = '_StrToEnum';
      ENUM_TO_STR = '_EnumToStr';
  public
    procedure Register(const AEnumName: TString; AConverterStrToEnum: TConverterStrToEnum; AConverterEnumToStr: TConverterEnumToStr = nil);
    function Execute(const AEnumName, AValue: TString): Integer; overload;
    function Execute(const AEnumName: TString; AValue: Integer): TString; overload;
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

function Converter_%ENUM_NAME%_StrToEnum(const AValue: TString): Integer;
begin
%VALUE_TO_KEY_CASES%  raise EnumException.CreateFmt('Valor $s incorreto para %ENUM_NAME%.', [AValue]);
end;

function Converter_%ENUM_NAME%_EnumToStr(const AValue: Integer): TString; overload;
begin
%KEY_TO_VALUE_CASES%  raise EnumException.CreateFmt('Valor $d incorreto para %ENUM_NAME%.', [AValue]);
end;%END_LOOP%

{ TEnumConversors }

function TEnumConverters.Execute(const AEnumName, AValue: TString): Integer;
var
  Converter: TConverterStrToEnum;
begin
  Converter := TConverterStrToEnum(StrToInt(Self.Values[AEnumName + STR_TO_ENUM]));
  Result := Converter(AValue);
end;

function TEnumConverters.Execute(const AEnumName: TString; AValue: Integer): TString;
var
  Converter: TConverterEnumToStr;
begin
  Converter := TConverterEnumToStr(StrToInt(Self.Values[AEnumName + ENUM_TO_STR]));
  Result := Converter(AValue);
end;

procedure TEnumConverters.Register(const AEnumName: TString;
  AConverterStrToEnum: TConverterStrToEnum; AConverterEnumToStr: TConverterEnumToStr);
begin
  Self.Values[AEnumName + STR_TO_ENUM] := IntToStr(Integer(@AConverterStrToEnum));
  Self.Values[AEnumName + ENUM_TO_STR] := IntToStr(Integer(@AConverterEnumToStr));
end;

initialization
  EnumConverters := TEnumConverters.Create;%BEGIN_LOOP(ENUMS)%
  EnumConverters.Register('T%ENUM_NAME%', @Converter_%ENUM_NAME%_StrToEnum, @Converter_%ENUM_NAME%_EnumToStr);%END_LOOP%

finalization
  FreeAndNil(EnumConverters);

end.

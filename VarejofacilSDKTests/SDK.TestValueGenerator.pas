unit SDK.TestValueGenerator;

{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

interface

uses
  SysUtils, StrUtils, DateUtils, Variants, Math, TypInfo, SDK.Types;

type

  TTestValueGenerator = class
  public
    class function Generate(const APropType: PTypeInfo): Variant;
  end;

implementation

{ TTestValueGenerator }

class function TTestValueGenerator.Generate(const APropType: PTypeInfo): Variant;
var
  AvailableChars: TString;
begin
  Randomize;
  AvailableChars := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
  case APropType^.Kind of
    tkVariant:
    begin
      Result := Null;
    end;
    tkInteger, tkInt64:
    begin
      Result := Random(999);
    end;
    tkChar, tkString, tkLString, tkWString, tkUString:
    begin
      Result := AvailableChars[Random(Length(AvailableChars) - 1) + 1];
    end;
    tkFloat:
    begin
      if SameText(APropType^.Name, 'TDateTime') then
        Result := Now
      else
        Result :=  RoundTo(Random(999) / 3, -2) + 1000;
    end;
    tkEnumeration, tkInterface, tkClass:
    begin
      Result := Null;
    end;
    else
    begin
      if SameText(APropType^.Name, 'TLongList') then
      begin
        Result := VarArrayCreate([0,1], varInteger);
      end
      else
        raise Exception.CreateFmt('Não é possível gerar dados para o tipo %s', [APropType^.Name]);
    end;
  end;
end;

end.

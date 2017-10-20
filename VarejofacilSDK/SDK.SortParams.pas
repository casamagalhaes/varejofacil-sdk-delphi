unit SDK.SortParams;

interface

uses
  SysUtils, Classes, StrUtils, SDK.Types, SDK.Exceptions;

type

  PSortParams = ^TSortParams;

  TSortParams = record
  public
    Desc: Boolean;
    Field: TString;
    Next: PSortParams;
    function FormattedText: TString;
    class function From(const AParams: array of TString): PSortParams; static;
    class function FromArrayToString(const AParams: TStringArray): TString; static;
    class operator Implicit(const ASortParams: TSortParams): TString; static;
    class operator Implicit(const ASortParams: TSortParams): TStringArray; static;
    class operator Implicit(const AArray: TStringArray): TSortParams; static;
  end;

implementation

{ TSortParams }

function TSortParams.FormattedText: TString;
begin
  Result := IfThen(Desc, '-', '') + Field;
end;

class function TSortParams.From(const AParams: array of TString): PSortParams;

  function IsValidParam(const AParam: TString): Boolean;
  var
    AllowedChars: TString;
    CharIdx: Integer;
  begin
    Result := True;
    AllowedChars := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_-+';
    for CharIdx := Low(AParam) to High(AParam) do
      if Pos(AParam[CharIdx], AllowedChars) = 0 then
      begin
        Result := False;
        Exit;
      end;
  end;

var
  ParamIdx: Integer;
  Head, Current, NewParam: PSortParams;
begin
  Head := nil;
  Current := nil;
  for ParamIdx := Low(AParams) to High(AParams) do
  begin
    if IsValidParam(AParams[ParamIdx]) then
    begin
      New(NewParam);
      NewParam^.Desc := AParams[ParamIdx][1] = '-';
      NewParam^.Field := IfThen((AParams[ParamIdx][1] = '-') or (AParams[ParamIdx][1] = '+'), Copy(AParams[ParamIdx], 2, Length(AParams[ParamIdx]) - 1), AParams[ParamIdx][1]);
      NewParam^.Next := nil;
      if not Assigned(Current) then
        Head := NewParam
      else
        Current^.Next := NewParam;
      Current := NewParam;
    end
    else
    begin
      raise SDKInvalidSortParamException.CreateFmt('parâmetro %s de ordenação inválido', [AParams[ParamIdx]]);
    end;
  end;
  Result := Head;
end;

class function TSortParams.FromArrayToString(const AParams: TStringArray): TString;
var
  SortParams: PSortParams;
begin
  Result := EmptyStr;
  if Assigned(AParams) then
  begin
    SortParams := TSortParams.From(AParams);
    try
      Result := SortParams^;
    finally
      Dispose(SortParams);
    end;
  end;
end;

class operator TSortParams.Implicit(const ASortParams: TSortParams): TStringArray;
var
  Current: PSortParams;
begin
  SetLength(Result, Length(Result) + 1);
  Result[Length(Result) - 1] := ASortParams.FormattedText;
  Current := ASortParams.Next;
  while Assigned(Current) do
  begin
    SetLength(Result, Length(Result) + 1);
    Result[Length(Result) - 1] := Current^.FormattedText;
    Current := Current^.Next;
  end;
end;

class operator TSortParams.Implicit(const AArray: TStringArray): TSortParams;
begin
  Result := From(AArray)^;
end;

class operator TSortParams.Implicit(const ASortParams: TSortParams): TString;
var
  Params: TStrings;
  Current: PSortParams;
begin
  Params := TStringList.Create;
  try
    Params.LineBreak := ',';
    Params.Add(ASortParams.FormattedText);
    Current := ASortParams.Next;
    while Assigned(Current) do
    begin
      Params.Add(Current^.FormattedText);
      Current := Current^.Next;
    end;
    Result := Copy(Params.Text, 1, Length(Params.Text) - 1);
  finally
    FreeAndNil(Params);
  end;
end;

end.

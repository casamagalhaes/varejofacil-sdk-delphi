unit SDK.Log;

interface

uses
  SysUtils, SDK.Types;

type

  TLog = class
  public
    class function GetLogFilename: string;
    class procedure WriteToLogFile(const AFilename, AMessage: TString);
    class procedure Debug(const AMessage: TString);
  end;

implementation

{ TLog }

class procedure TLog.Debug(const AMessage: TString);
begin
  {$IFDEF SDK_DEBUG}
  WriteToLogFile(GetLogFilename, Format('[DEBUG][%s] %s', [FormatDateTime('yyyy-mm-dd hh:nn:ss', Now), AMessage]));
  {$ENDIF}
end;

class function TLog.GetLogFilename: string;
begin
  Result := Format('%s\%s-vfsdk.log', [GetCurrentDir, FormatDateTime('yyyy-mm-dd', Now)]);
end;

class procedure TLog.WriteToLogFile(const AFilename, AMessage: TString);
var
  LogFile: TextFile;
begin
  AssignFile(LogFile, AFilename);
  try
    if FileExists(AFilename) then
      Append(LogFile)
    else
      Rewrite(LogFile);
    WriteLn(LogFile, AMessage);
  finally
    CloseFile(LogFile);
  end;
end;

end.

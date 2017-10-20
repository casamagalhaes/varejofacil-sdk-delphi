program VarejofacilSDKCodeGeneratorDXE7;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  SDK.Types,
  SDK.Client,
  SDK.XML,
  XMLIntf,
  SysUtils,
  StrUtils,
  Types,
  Classes,
  IniFiles,
  IOUtils;

// /enums /filter:SDK.Enums* /enumfile:C:\varejofacil-sdk-delphi\VarejofacilSDKCodeGenerator\enums.xml

type

  TStringHolder = class
    private
      FValue: TString;
    public
      constructor Create(const AInput: TString);
      function Value: TString;
  end;

  TEnumerable = class
    private
      FEnums: TStrings;
      FName: TString;
    public
      destructor Destroy; override;
      constructor Create(const AName: TString); reintroduce; overload;
      property Enums: TStrings read FEnums write FEnums;
      property Name: TString read FName write FName;
      procedure Add(const AKey, AValue: TString);
  end;

const
  JAVA_CLASS_KEYWORD = 'class';
  JAVA_IMPORT_KEYWORD = 'import';

var
  JAVA_PRIMARY_TYPES: array[0..13] of TString = ('byte', 'short', 'int', 'Long', 'float', 'double', 'char', 'String', 'Boolean', 'BigDecimal', 'Date', 'Integer', 'byte[]', 'boolean');
  DELPHI_PRIMARY_TYPES: array[0..13] of TString = ('Byte', 'SmallInt', 'Integer', 'Int64', 'Double', 'Double', 'Char', 'TString', 'Boolean', 'Double', 'TDateTime', 'Integer', 'TByteArray', 'Boolean');
  JAVA_MODIFIERS: array[0..7] of TString = ('public', 'private', 'protected', 'static', 'final', 'abstract', 'synchronized', 'volatile');

function GetEnums(const APath: TString): TStrings;
var
  Contents: TString;
  Document: IXMLDocument;
  EnumNodes: TCustomXMLNodeArray;
  EnumNode, EnumKeyValueNode: IXMLNode;
  NodeIdx: Integer;
  Enumerable: TEnumerable;
  ChildNodeIdx: Integer;
begin
  Result := TStringList.Create;
  Contents := TFile.ReadAllText(APath);
  Document := TXMLHelper.CreateDocument(Contents);
  EnumNodes := TXMLHelper.XPathSelect(Document, '//enums/*');
  for NodeIdx := 0 to Length(EnumNodes) - 1 do
  begin
    EnumNode := EnumNodes[NodeIdx];
    Enumerable := TEnumerable.Create(EnumNode.NodeName);
    if EnumNode.HasChildNodes then
    begin
      for ChildNodeIdx := 0 to EnumNode.ChildNodes.Count - 1 do
      begin
        EnumKeyValueNode := EnumNode.ChildNodes[ChildNodeIdx];
        Enumerable.Add(EnumKeyValueNode.NodeName, EnumKeyValueNode.Text);
      end;
    end;
    Result.AddObject(EnumNode.NodeName, Enumerable);
  end;
end;

function GetFiles(const APath, AExtension, AFilter: TString): TStrings;
var
  SR: TSearchRec;
begin
  Result := TStringList.Create;
  if FindFirst(APath + '\' + IfThen(AFilter <> EmptyStr, AFilter, '*') + '.' + AExtension, faAnyFile, SR) = 0 then
  begin
    repeat
      if (SR.Attr <> faDirectory) then
      begin
        Result.Add(SR.Name);
      end;
    until FindNext(SR) <> 0;
    FindClose(SR);
  end;
end;

function GetTemplates(const APath, AFilter: TString): TStrings;
begin
  Result := GetFiles(APath, 'tpl', AFilter);
end;

function GetFields(const AModelDirectory, AModelFilename: TString): TStrings;

  function ProperCase(const AInput: TString): TString;
  begin
    Result := UpperCase(AInput[1]) + Copy(AInput, 2, Length(AInput) - 1);
  end;

  function Split(const AContents, ADelimiter: TString): TStrings;
  var
    Tokens: TStringDynArray;
    Idx: Integer;
  begin
    Result := TStringList.Create;
    Result.LineBreak := EmptyStr;
    Tokens := SplitString(AContents, ADelimiter);
    for Idx := 0 to Length(Tokens) - 1 do
      if Tokens[Idx] <> EmptyStr then
        Result.Add(Tokens[Idx]);
  end;

  function IsPrimaryType(const ASymbol: TString): Boolean;
  var
    Idx: Integer;
  begin
    Result := False;
    for Idx := Low(JAVA_PRIMARY_TYPES) to High(JAVA_PRIMARY_TYPES) do
      if JAVA_PRIMARY_TYPES[Idx] = ASymbol then
        Exit(True);
  end;

  function IsModifier(const ASymbol: TString): Boolean;
  var
    Idx: Integer;
  begin
    Result := False;
    for Idx := Low(JAVA_MODIFIERS) to High(JAVA_MODIFIERS) do
      if JAVA_MODIFIERS[Idx] = ASymbol then
        Exit(True);      
  end;

  function IsReservedWord(const ASymbol: TString): Boolean;
  begin
    Result := IsModifier(ASymbol) or IsPrimaryType(ASymbol);
  end;

  function IsFieldDeclaration(const ASymbols: TStrings): Boolean;
  begin
    Result := (ASymbols.Count > 2) and
                IsModifier(ASymbols[0]) and
                  (IsPrimaryType(ASymbols[1]) or (not IsReservedWord(ASymbols[1])));
  end;

  function IsClassDeclaration(const ASymbols: TStrings): Boolean;
  begin
    Result := ASymbols.IndexOf(JAVA_CLASS_KEYWORD) > -1;
  end;

  function GetClassName(const ASymbols: TStrings): TString;
  var
    ClassKeywordPos: Integer;
  begin
    ClassKeywordPos := ASymbols.IndexOf(JAVA_CLASS_KEYWORD);
    Result := ASymbols[ClassKeywordPos + 1];
  end;

  function GetFieldName(const ASymbols: TStrings): TString;
  begin
    Result := ASymbols[2];
  end;

  function GetFieldType(const ASymbols: TStrings): TString;
  begin
    Result := ASymbols[1];
  end;

  function IsConstructor(const AClassName: TString; ASymbols: TStrings): Boolean;
  begin
    Result := (ASymbols.Count > 1) and (ASymbols[0] = 'public') and (ASymbols[1] = AClassName);
  end;

var
  Contents, Line: TString;
  Lines, Symbols: TStrings;
  ClassName: TString;
begin
  Result := TStringList.Create(True);
  Contents := TFile.ReadAllText(Concat(AModelDirectory, '\', AModelFilename));
  Contents := StringReplace(Contents, #9, EmptyStr, [rfReplaceAll, rfIgnoreCase]);
  Contents := StringReplace(Contents, #10, EmptyStr, [rfReplaceAll, rfIgnoreCase]);
  Contents := StringReplace(Contents, #13, EmptyStr, [rfReplaceAll, rfIgnoreCase]);
  Lines := Split(Contents, ';{}()');
  try
    for Line in Lines do
    begin
      Symbols := Split(Line, ' ');
      try
        if IsClassDeclaration(Symbols) then
          ClassName := GetClassName(Symbols)
        else
        if (not IsConstructor(ClassName, Symbols)) and IsFieldDeclaration(Symbols) then
          Result.AddObject(ProperCase(GetFieldName(Symbols)), TStringHolder.Create(GetFieldType(Symbols)));
      finally
        Symbols.Free;
      end;
    end;
  finally
    Lines.Free;
  end;
end;

procedure GenerateClass(const ATemplate, AModel, ARoute: TString; AFields: TStrings);

  function GenerateGuid: TString;
  var
    Uid: TGuid;
    HndResult: HResult;
  begin
    Result := EmptyStr;
    HndResult := CreateGuid(Uid);
    if HndResult = S_OK then
       Result := GuidToString(Uid);
  end;

  function RemoveExtension(const AFileName: TString): TString;
  begin
    Result := StringReplace(AFileName, '.tpl', '', [rfReplaceAll, rfIgnoreCase]);
  end;

  function MapToDelphiTypes(const AJavaType: TString): TString;
  var
    Idx: Integer;
  begin
    if Pos('List<', AJavaType) > 0 then
    begin
      Result := StringReplace(AJavaType, 'List<', 'T', []);
      Result := StringReplace(Result, '>', 'List', []);
    end
    else
    begin
      Result := 'T' + AJavaType;
      for Idx := Low(JAVA_PRIMARY_TYPES) to High(JAVA_PRIMARY_TYPES) do
        if JAVA_PRIMARY_TYPES[Idx] = AJavaType then
          Exit(DELPHI_PRIMARY_TYPES[Idx]);
    end;
  end;

  function Tokenize(const AInput: TString): TStrings;
  var
    Tokens: TStringDynArray;
    Idx: Integer;
  begin
    Result := TStringList.Create;
    Result.LineBreak := EmptyStr;
    Tokens := SplitString(AInput, '%');
    for Idx := 0 to Length(Tokens) - 1 do
      Result.Add(Tokens[Idx]);
  end;

  function Parse(const ATokens: TStrings): TString;
  var
    UpperToken, Token, Looping: TString;
    Idx, LoopingIdx, LoopingLimit, LoopingCount: Integer;
    ParsedResult: TStrings;
  begin
    ParsedResult := TStringList.Create;
    try
      ParsedResult.LineBreak := EmptyStr;
      Looping := EmptyStr;
      LoopingIdx := 0;    
      LoopingCount := 0;
      LoopingLimit := 0;  
      Idx := 0;
      while Idx < ATokens.Count do
      begin
        Token := ATokens[Idx];
        UpperToken := UpperCase(Token);
        {$REGION 'Variables & Methods'}
        if UpperToken = 'MODEL_NAME' then
          ParsedResult.Add(AModel)
        else
        if UpperToken = 'NEW_GUID' then
          ParsedResult.Add(GenerateGuid)
        else
        if UpperToken = 'ROUTE' then
          ParsedResult.Add(ARoute)
        else
        {$ENDREGION}
        {$REGION 'Looping'}
        if Pos('BEGIN_LOOP', UpperToken) > 0 then
        begin
          Looping := StringReplace(UpperToken, 'BEGIN_LOOP(', EmptyStr, [rfReplaceAll, rfIgnoreCase]);
          Looping := StringReplace(Looping, ')', EmptyStr, [rfReplaceAll, rfIgnoreCase]);
          LoopingIdx := Idx;
          LoopingLimit := AFields.Count;
        end
        else  
        if UpperToken = 'END_LOOP' then
        begin
          if LoopingCount + 1 >= LoopingLimit then
          begin
            Looping := EmptyStr;
            LoopingIdx := 0;    
            LoopingCount := 0;
            LoopingLimit := 0;  
          end
          else
          begin                                           
            Inc(LoopingCount);
            Idx := LoopingIdx;
          end;
        end
        else
        if (Looping <> EmptyStr) then
        begin    
          if LoopingCount < LoopingLimit then
          begin
            if (Looping = 'FIELDS') then
            begin
              if Token = 'FIELD.NAME' then
              begin
                ParsedResult.Add(AFields[LoopingCount]); 
              end
              else
              if Token = 'FIELD.TYPE' then
              begin
                ParsedResult.Add(MapToDelphiTypes(TStringHolder(AFields.Objects[LoopingCount]).Value));
              end
              else
                ParsedResult.Add(Token);
            end;
          end;
        end
        {$ENDREGION}
        else
          ParsedResult.Add(Token);
        Inc(Idx);
      end;
      Result := ParsedResult.Text;
    finally
      ParsedResult.Free;
    end;
  end;

  function InterpolateTags(const AInput: TString): TString;
  var
    Tokens: TStrings;
  begin
    Tokens := Tokenize(AInput);
    try
      Result := Parse(Tokens);
    finally
      Tokens.Free;
    end;
  end;

var
  OutputDir: TString;
  NewFileName, TemplateContent, ParsedTemplate: TString;
begin
  OutputDir := Concat(GetCurrentDir, '\output');
  if not DirectoryExists(OutputDir) then
    CreateDir(OutputDir);
  NewFileName := InterpolateTags(Concat(OutputDir, '\', RemoveExtension(ATemplate), '.pas'));
  TemplateContent := TFile.ReadAllText(Concat(GetCurrentDir, '\', ATemplate));
  ParsedTemplate := InterpolateTags(TemplateContent);
  TFile.WriteAllText(NewFileName, ParsedTemplate, TEncoding.UTF8);
end;

procedure GenerateSingleFileMultipleClasses(const ATemplate: TString; AModels: TStrings);

  function GenerateGuid: TString;
  var
    Uid: TGuid;
    HndResult: HResult;
  begin
    Result := EmptyStr;
    HndResult := CreateGuid(Uid);
    if HndResult = S_OK then
       Result := GuidToString(Uid);
  end;

  function RemoveExtension(const AFileName: TString): TString;
  begin
    Result := StringReplace(AFileName, '.tpl', '', [rfReplaceAll, rfIgnoreCase]);
  end;

  function MapToDelphiTypes(const AJavaType: TString): TString;
  var
    Idx: Integer;
  begin
    if Pos('List<', AJavaType) > 0 then
    begin
      Result := StringReplace(AJavaType, 'List<', 'T', []);
      Result := StringReplace(Result, '>', 'List', []);
    end
    else
    begin
      Result := 'T' + AJavaType;
      for Idx := Low(JAVA_PRIMARY_TYPES) to High(JAVA_PRIMARY_TYPES) do
        if JAVA_PRIMARY_TYPES[Idx] = AJavaType then
          Exit(DELPHI_PRIMARY_TYPES[Idx]);
    end;
  end;

  function Tokenize(const AInput: TString): TStrings;
  var
    Tokens: TStringDynArray;
    Idx: Integer;
  begin
    Result := TStringList.Create;
    Result.LineBreak := EmptyStr;
    Tokens := SplitString(AInput, '%');
    for Idx := 0 to Length(Tokens) - 1 do
      Result.Add(Tokens[Idx]);
  end;

  function Parse(const ATokens: TStrings): TString;
  var
    UpperToken, Token, Looping: TString;
    Idx, LoopingIdx, LoopingLimit, LoopingCount: Integer;
    ParsedResult: TStrings;
  begin
    ParsedResult := TStringList.Create;
    try
      ParsedResult.LineBreak := EmptyStr;
      Looping := EmptyStr;
      LoopingIdx := 0;
      LoopingCount := 0;
      LoopingLimit := 0;
      Idx := 0;
      while Idx < ATokens.Count do
      begin
        Token := ATokens[Idx];
        UpperToken := UpperCase(Token);
        {$REGION 'Variables & Methods'}
        {$ENDREGION}
        {$REGION 'Looping'}
        if Pos('BEGIN_LOOP', UpperToken) > 0 then
        begin
          Looping := StringReplace(UpperToken, 'BEGIN_LOOP(', EmptyStr, [rfReplaceAll, rfIgnoreCase]);
          Looping := StringReplace(Looping, ')', EmptyStr, [rfReplaceAll, rfIgnoreCase]);
          LoopingIdx := Idx;
          LoopingLimit := AModels.Count;
        end
        else
        if UpperToken = 'END_LOOP' then
        begin
          if LoopingCount + 1 >= LoopingLimit then
          begin
            Looping := EmptyStr;
            LoopingIdx := 0;
            LoopingCount := 0;
            LoopingLimit := 0;
          end
          else
          begin
            Inc(LoopingCount);
            Idx := LoopingIdx;
          end;
        end
        else
        if (Looping <> EmptyStr) then
        begin
          if LoopingCount < LoopingLimit then
          begin
            if (Looping = 'MODELS') then
            begin
              if Token = 'MODEL_NAME' then
              begin
                ParsedResult.Add(AModels[LoopingCount]);
              end
              else
                ParsedResult.Add(Token);
            end;
          end;
        end
        {$ENDREGION}
        else
          ParsedResult.Add(Token);
        Inc(Idx);
      end;
      Result := ParsedResult.Text;
    finally
      ParsedResult.Free;
    end;
  end;

  function InterpolateTags(const AInput: TString): TString;
  var
    Tokens: TStrings;
  begin
    Tokens := Tokenize(AInput);
    try
      Result := Parse(Tokens);
    finally
      Tokens.Free;
    end;
  end;

var
  OutputDir: TString;
  NewFileName, TemplateContent, ParsedTemplate: TString;
begin
  OutputDir := Concat(GetCurrentDir, '\output');
  if not DirectoryExists(OutputDir) then
    CreateDir(OutputDir);
  NewFileName := InterpolateTags(Concat(OutputDir, '\', RemoveExtension(ATemplate), '.pas'));
  TemplateContent := TFile.ReadAllText(Concat(GetCurrentDir, '\', ATemplate));
  ParsedTemplate := InterpolateTags(TemplateContent);
  TFile.WriteAllText(NewFileName, ParsedTemplate, TEncoding.UTF8);
end;

procedure GenerateEnums(const ATemplate: TString; AEnums: TStrings);

  function RemoveExtension(const AFileName: TString): TString;
  begin
    Result := StringReplace(AFileName, '.tpl', '', [rfReplaceAll, rfIgnoreCase]);
  end;

  function Tokenize(const AInput: TString): TStrings;
  var
    Tokens: TStringDynArray;
    Idx: Integer;
  begin
    Result := TStringList.Create;
    Result.LineBreak := EmptyStr;
    Tokens := SplitString(AInput, '%');
    for Idx := 0 to Length(Tokens) - 1 do
      Result.Add(Tokens[Idx]);
  end;

  function Parse(const ATokens: TStrings): TString;
  var
    UpperToken, Token, Looping: TString;
    Idx, LoopingIdx, LoopingLimit, LoopingCount: Integer;
    ParsedResult: TStrings;
    CurrentEnumerable: TEnumerable;
    EnumKeyValueIdx: Integer;
  begin
    ParsedResult := TStringList.Create;
    try
      ParsedResult.LineBreak := EmptyStr;
      Looping := EmptyStr;
      LoopingIdx := 0;
      LoopingCount := 0;
      LoopingLimit := 0;
      Idx := 0;
      while Idx < ATokens.Count do
      begin
        Token := ATokens[Idx];
        UpperToken := UpperCase(Token);
        {$REGION 'Variables & Methods'}
        {$ENDREGION}
        {$REGION 'Looping'}
        if Pos('BEGIN_LOOP', UpperToken) > 0 then
        begin
          Looping := StringReplace(UpperToken, 'BEGIN_LOOP(', EmptyStr, [rfReplaceAll, rfIgnoreCase]);
          Looping := StringReplace(Looping, ')', EmptyStr, [rfReplaceAll, rfIgnoreCase]);
          LoopingIdx := Idx;
          LoopingLimit := AEnums.Count;
        end
        else
        if UpperToken = 'END_LOOP' then
        begin
          if LoopingCount + 1 >= LoopingLimit then
          begin
            Looping := EmptyStr;
            LoopingIdx := 0;
            LoopingCount := 0;
            LoopingLimit := 0;
          end
          else
          begin
            Inc(LoopingCount);
            Idx := LoopingIdx;
          end;
        end
        else
        if (Looping <> EmptyStr) then
        begin
          if LoopingCount < LoopingLimit then
          begin
            if (Looping = 'ENUMS') then
            begin
              CurrentEnumerable := TEnumerable(AEnums.Objects[LoopingCount]);
              if Token = 'ENUM_NAME' then
              begin 
                ParsedResult.Add(CurrentEnumerable.Name);                
              end
              else
              if Token = 'KEYS_BETWEEN_COMMAS' then
              begin
                CurrentEnumerable.Enums.LineBreak := ', ';
                ParsedResult.Add(
                  Copy(CurrentEnumerable.Enums.Text, 
                  1, 
                  Length(CurrentEnumerable.Enums.Text) - 2)
                );
              end
              else
              if Token = 'KEY_TO_VALUE_CASES' then
              begin
                for EnumKeyValueIdx := 0 to CurrentEnumerable.Enums.Count - 1 do
                  ParsedResult.Add(Format('  if Integer(%s) = AValue then Result := ''%s'' else'#13#10, [
                    CurrentEnumerable.Enums[EnumKeyValueIdx],
                    TStringHolder(CurrentEnumerable.Enums.Objects[EnumKeyValueIdx]).Value
                  ]));
              end
              else
              if Token = 'VALUE_TO_KEY_CASES' then
              begin
                for EnumKeyValueIdx := 0 to CurrentEnumerable.Enums.Count - 1 do
                  ParsedResult.Add(Format('  if SameText(AValue, ''%s'') then Result := Integer(%s) else'#13#10, [
                    TStringHolder(CurrentEnumerable.Enums.Objects[EnumKeyValueIdx]).Value,
                    CurrentEnumerable.Enums[EnumKeyValueIdx]
                  ])); 
              end
              else
                ParsedResult.Add(Token);
            end;
          end;
        end
        {$ENDREGION}
        else
          ParsedResult.Add(Token);
        Inc(Idx);
      end;
      Result := ParsedResult.Text;
    finally
      ParsedResult.Free;
    end;
  end;

  function InterpolateTags(const AInput: TString): TString;
  var
    Tokens: TStrings;
  begin
    Tokens := Tokenize(AInput);
    try
      Result := Parse(Tokens);
    finally
      Tokens.Free;
    end;
  end;

var
  OutputDir: TString;
  NewFileName, TemplateContent, ParsedTemplate: TString;
begin
  OutputDir := Concat(GetCurrentDir, '\output');
  if not DirectoryExists(OutputDir) then
    CreateDir(OutputDir);
  NewFileName := InterpolateTags(Concat(OutputDir, '\', RemoveExtension(ATemplate), '.pas'));
  TemplateContent := TFile.ReadAllText(Concat(GetCurrentDir, '\', ATemplate));
  ParsedTemplate := InterpolateTags(TemplateContent);
  TFile.WriteAllText(NewFileName, ParsedTemplate, TEncoding.UTF8);
end;

procedure GenerateClasses(const ATemplate: TString);
const
  MODEL_SECTION = 'Models';
  ROUTE_SECTION = 'Routes';
  VAREJOFACIL_SECTION = 'Varejofacil';
  DIRECTORIES_SECTION = 'Directories';
var
  Config: TIniFile;
  Models: TStrings;
  Model, ModelFilename, Route, Server, ModelDirectory: TString;
  Fields: TStrings;
begin
  Config := TIniFile.Create(Concat(GetCurrentDir, '\Config.ini'));
  try
    Models := TStringList.Create;
    try
      Server := Config.ReadString(VAREJOFACIL_SECTION, 'Server', EmptyStr);
      ModelDirectory := Config.ReadString(DIRECTORIES_SECTION, 'Models', EmptyStr);
      Config.ReadSection(MODEL_SECTION, Models);
      for Model in Models do
      begin
        Route := Config.ReadString(ROUTE_SECTION, Model, EmptyStr);
        ModelFilename := Config.ReadString(MODEL_SECTION, Model, EmptyStr);
        Fields := GetFields(ModelDirectory, ModelFilename);
        try
          if (Route <> EmptyStr) and (Fields.Count > 0) then
            GenerateClass(ATemplate, Model, Route, Fields);
        finally
          Fields.Free;
        end;
      end;
    finally
      Models.Free;
    end;
  finally
    Config.Free;
  end;
end;

procedure GenerateSingleFileClasses(const ATemplate: TString);
const
  MODEL_SECTION = 'Models';
  VAREJOFACIL_SECTION = 'Varejofacil';
  DIRECTORIES_SECTION = 'Directories';
var
  Config: TIniFile;
  Models: TStrings;
  Model, ModelFilename, Server, ModelDirectory: TString;
begin
  Config := TIniFile.Create(Concat(GetCurrentDir, '\Config.ini'));
  try
    Models := TStringList.Create;
    try
      Server := Config.ReadString(VAREJOFACIL_SECTION, 'Server', EmptyStr);
      ModelDirectory := Config.ReadString(DIRECTORIES_SECTION, 'Models', EmptyStr);
      Config.ReadSection(MODEL_SECTION, Models);
//      for Model in Models do
//      begin
//        ModelFilename := Config.ReadString(MODEL_SECTION, Model, EmptyStr);
//        Models.AddObject(Model, TStringHolder.Create(TFile.ReadAllText(Concat(ModelDirectory, '\', ModelFilename))));
//      end;
      GenerateSingleFileMultipleClasses(ATemplate, Models);
    finally
      Models.Free;
    end;
  finally
    Config.Free;
  end;
end;

procedure GenerateEnumsUsingFile(const ATemplate, AEnumFile: TString);
var
  Enums: TStrings;
begin
  Enums := GetEnums(AEnumFile);
  try
    GenerateEnums(ATemplate, Enums);
  finally
    Enums.Free;
  end;
end;

{ TStringHolder }

constructor TStringHolder.Create(const AInput: TString);
begin
  FValue := AInput;
end;

function TStringHolder.Value: TString;
begin
  Result := FValue;
end;

{ TEnumerable }

procedure TEnumerable.Add(const AKey, AValue: TString);

  function GetUpperCaseChars(const AInput: TString): TString;
  var
    UpperCaseChars: string;
    I: Integer;
  begin
    Result := EmptyStr;
    UpperCaseChars := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    for I := 1 to Length(AInput) do
      if UpperCaseChars.IndexOf(AInput[I]) > -1 then
        Result := Result + AInput[I];
  end;

begin
  FEnums.AddObject(LowerCase(GetUpperCaseChars(FName)) + AKey, TStringHolder.Create(AKey));
end;

constructor TEnumerable.Create(const AName: TString);
begin
  inherited Create;         
  FEnums := TStringList.Create(True);
  FName := AName;
end;

destructor TEnumerable.Destroy;
begin
  FEnums.Free;
  inherited Destroy;
end;

{ Application }

var
  Templates: TStrings;
  Template, Filter, EnumFile: TString;

begin
  try
    Filter := EmptyStr;
    FindCmdLineSwitch('filter', Filter);
    Templates := GetTemplates(GetCurrentDir, Filter);
    try
      if Templates.Count = 0 then
      begin
        WriteLn('Nenhum template encontrado.');
        ReadLn;
        Exit;
      end;
      for Template in Templates do
      begin
        if FindCmdLineSwitch('models') then
        begin
          if FindCmdLineSwitch('singlefile') then
            GenerateSingleFileClasses(Template)
          else
            GenerateClasses(Template);
        end
        else
        if FindCmdLineSwitch('enums') then
        begin
          if not FindCmdLineSwitch('enumfile', EnumFile) then
          begin
            WriteLn('Você precisa especificar o arquivo que contem os enums com /enumfile.');
            ReadLn;
            Exit;
          end;
          if not FileExists(EnumFile) then
          begin
            WriteLn(Format('Arquivo %s não existe.', [EnumFile]));
            ReadLn;
            Exit;
          end;
          GenerateEnumsUsingFile(Template, EnumFile);
        end
        else
        begin
          WriteLn('usage: VarejofacilSDKCodeGenerator.exe /[models|enums] [/filter:BEGIN_WITH_FILTER] [/enumfile:ENUMS_FILENAME]');
          ReadLn;
          Exit;
        end;
      end;
    finally
      Templates.Free;
    end;
    WriteLn('Done');
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
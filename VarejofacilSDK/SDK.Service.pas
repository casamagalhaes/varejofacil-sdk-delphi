unit SDK.Service;

interface

uses
  SysUtils, Classes, Math, SDK.XML, SDK.Types, SDK.Client, SDK.ConfigProvider,
  SDK.PropertyDeserializers, SDK.PropertySerializers, SDK.SortParams, XMLIntf;

type

  TBatchItem = class;

  IBatchResponse = interface
    ['{23B7D487-3101-4721-915E-5FEE404B9CFC}']
    function GetSuccesses: TStrings;
    function GetErrors: TStrings;
    property Errors: TStrings read GetErrors;
    property Successes: TStrings read GetSuccesses;
  end;

  IBatchRequest = interface
    ['{790482D9-F262-44CB-90F9-0F7CE0BE236B}']
    procedure Add(const AModel: IModel);
    function AsString: TString;
  end;

  IBatchResponseTranslator = interface
    ['{69B5D1C5-240E-411D-B963-4A07FEA0E720}']
    function GetSuccesses(const AContents: TString): TStrings;
    function GetErrors(const AContents: TString): TStrings;
  end;

  TBatchResponseTranslator = class(TInterfacedObject, IBatchResponseTranslator)
  public
    function GetErrors(const AContents: TString): TStrings; virtual;
    function GetSuccesses(const AContents: TString): TStrings; virtual;
  end;

  TBatchResponseTranslatorV1 = class(TBatchResponseTranslator)
  public
    function GetErrors(const AContents: TString): TStrings; override;
    function GetSuccesses(const AContents: TString): TStrings; override;
  end;

  TBatchResponse = class(TInterfacedObject, IBatchResponse)
  strict private
    FResponseTranslator: IBatchResponseTranslator;
    FContents: TString;
    function GetSuccesses: TStrings;
    function GetErrors: TStrings;
  public
    constructor Create(const AContents: TString;
      const AResponseTranslator: IBatchResponseTranslator);
    property Errors: TStrings read GetErrors;
    property Successes: TStrings read GetSuccesses;
  end;

  TBatchItem = class
  strict private
    FModel: IModel;
  public
    constructor Create(const AModel: IModel);
    function AsString: TString;
  end;

  IBatchRequestTransform = interface
    ['{2FB31D93-E2F5-4F95-A3A4-6674F2D60980}']
    function AsString(AItems: TStrings): TString;
  end;

  TBatchRequestTransformV1 = class(TInterfacedObject, IBatchRequestTransform)
  public
    function AsString(AItems: TStrings): string;
  end;

  TBatchRequestTransformV2 = class(TInterfacedObject, IBatchRequestTransform)
  public
    function AsString(AItems: TStrings): string;
  end;

  TBatchRequest = class(TInterfacedObject, IBatchRequest)
  strict private
    FTransform: IBatchRequestTransform;
    FItems: TStrings;
  protected
    property Items: TStrings read FItems;
  public
    constructor Create(const ABatchRequestTransform: IBatchRequestTransform); reintroduce;
    procedure Add(const AModel: IModel);
    function AsString: TString; virtual;
    destructor Destroy; override;
  end;

  TServiceMarshalling = class
  protected
    FDeserializers: TPropertyDeserializerArray;
    FSerializers: TPropertySerializerArray;
    procedure AddDeserializer(const ADeserializer: IPropertyDeserializer);
    procedure AddSerializer(const ASerializer: IPropertySerializer);
    procedure AddDateTimeDeserializer;
    procedure AddEnumDeserializer;
    procedure AddModelDeserializer;
    procedure AddModelListDeserializer;
    procedure AddModelListSerializer;
    procedure ConfigureDeserializers;
    procedure ConfigureSerializers;
  public
    property Deserializers: TPropertyDeserializerArray read FDeserializers;
    property Serializers: TPropertySerializerArray read FSerializers;
    constructor Create;
  end;

  TFailReason = TString;
  
  TFailReasonList = class(TStringList);
      
  TFailReasonHelper = class
  public
    class function FromStringArray(const AArray: TStringArray): TFailReasonList;
    class function FromResponse(const AResponse: IResponse): TFailReasonList;
    class function FromXML(const ADocument: IXMLDocument): TFailReasonList;
  end;
  
  TServiceCommandResult = class
  private
    FSuccessful: Boolean;
    FLocation: TString;
    FFailReasons: TFailReasonList;
  public
    constructor Create(ASuccessful: Boolean; const AFailReasons: TFailReasonList; const ALocation: TString = '');
    destructor Destroy; override;
    property Location: TString read FLocation;
    property Successful: Boolean read FSuccessful;
    property FailReasons: TFailReasonList read FFailReasons;
  end;

  TService = class
  protected
    FPath: TString;
    FClient: IClient;
    FMarshalling: TServiceMarshalling;
    FDeserializers: TPropertyDeserializerArray;
    FSerializers: TPropertySerializerArray;
    function InterpretLocation(const ALocation: TString): TString; virtual;
  public
    destructor Destroy; override;
    constructor Create(const APath: TString; const AClient: IClient); virtual;
    function Update(const AId: TString; const AModel: IModel): TServiceCommandResult; overload; virtual;
    function Update(const AId: TString; const AModel: IModel; const APath: TString): TServiceCommandResult; overload; virtual;
    function Delete(const AId: TString): Boolean; virtual;
    function DeleteWithPath(const AId: TString; const APath: TString): Boolean; virtual;
    function Insert(const AModel: IModel): TServiceCommandResult; overload; virtual;
    function Insert(const AModel: IModel; const APath: TString): TServiceCommandResult; overload; virtual;
    function PathWithDependencies(const ADependencies: array of TVarRec): TString;
    function ToParams(const AQuery: TString; AStart, ACount: Integer; const ASortParams: TStringArray = nil): TString;
    property Path: TString read FPath;
    property Deserializers: TPropertyDeserializerArray read FDeserializers;
    property Client: IClient read FClient;
  end;

  TBatchService = class(TService)
  protected
    function CreateTransform: IBatchRequestTransform; virtual;
  public
    function CreateBatchRequest: TBatchRequest;
    function Insert(ARequest: IBatchRequest; const APath: string): IBatchResponse; reintroduce; overload;
    function Insert(ARequest: IBatchRequest): IBatchResponse; reintroduce; overload;
    function Update(ARequest: IBatchRequest; const APath: string): IBatchResponse; reintroduce; overload;
    function Update(ARequest: IBatchRequest): IBatchResponse; reintroduce; overload;
  end;

implementation

uses
  StrUtils;


{ TService }

constructor TService.Create(const APath: TString; const AClient: IClient);
begin
  FMarshalling := TServiceMarshalling.Create;
  FSerializers := FMarshalling.Serializers;
  FDeserializers := FMarshalling.Deserializers;
  FPath := APath;
  FClient := AClient;
end;

function TService.DeleteWithPath(const AId, APath: TString): Boolean;
var
  Response: IResponse;
begin
  Response := FClient.Delete(Concat(APath, '/', AId), nil, nil);
  Result := Response.Status = 200;
end;

destructor TService.Destroy;
begin
  FreeAndNil(FMarshalling);
  inherited Destroy;
end;

function TService.Delete(const AId: TString): Boolean;
begin
  Result := DeleteWithPath(AId, FPath);
end;

function TService.Insert(const AModel: IModel; const APath: TString): TServiceCommandResult;
var
  Response: IResponse;
  FailReasons: TFailReasonList;
begin
  Result := nil;
  Response := FClient.Post(APath, TXMLHelper.Serialize(AModel, True, FSerializers), nil);
  if Assigned(Response) then
  begin
    FailReasons := TFailReasonHelper.FromResponse(Response);
    try
      Result := TServiceCommandResult.Create(Response.Status = 201, FailReasons, InterpretLocation(Response.Headers.Values['Location']));
    finally
      FreeAndNil(FailReasons);
    end;
  end;
end;

function TService.Insert(const AModel: IModel): TServiceCommandResult;
begin
  Result := Insert(AModel, FPath);
end;

function TService.InterpretLocation(const ALocation: TString): TString;
var
  LastDelimiterPos: Integer;
begin
  LastDelimiterPos := LastDelimiter('/', ALocation);
  Result := Copy(ALocation, LastDelimiterPos + 1, Length(ALocation) - LastDelimiterPos);
end;

function TService.PathWithDependencies(const ADependencies: array of TVarRec): TString;
begin
  Result := Format(FPath, ADependencies);
end;

function TService.ToParams(const AQuery: TString; AStart, ACount: Integer; const ASortParams: TStringArray): TString;
var
  Params: TStrings;
begin
  Params := TStringList.Create;
  try
    Params.LineBreak := '&';
    if AQuery <> EmptyStr then
      Params.Values['q'] := AQuery;
    if AStart >= 0 then
      Params.Values['start'] := IntToStr(AStart);
    if ACount > 0 then
      Params.Values['count'] := IntToStr(Min(ACount, 500));
    Params.Values['sort'] := TSortParams.FromArrayToString(ASortParams);
    Result := Copy(Params.Text, 1, Length(Params.Text) - 1);
  finally
    FreeAndNil(Params);
  end;
end;

function TService.Update(const AId: TString; const AModel: IModel; const APath: TString): TServiceCommandResult;
var
  Response: IResponse;
  FailReasons: TFailReasonList;
begin
  Response := FClient.Put(Concat(APath, '/', AId), TXMLHelper.Serialize(AModel, True, FSerializers), nil);
  FailReasons := TFailReasonHelper.FromResponse(Response);
  try
    Result := TServiceCommandResult.Create(Response.Status = 200, FailReasons);
  finally
    FreeAndNil(FailReasons);
  end;
end;

function TService.Update(const AId: TString; const AModel: IModel): TServiceCommandResult;
begin
  Result := Update(AId, AModel, FPath);
end;

{ TBatchRequest }

procedure TBatchRequest.Add(const AModel: IModel);
var
  Item: TBatchItem;
begin
  Item := TBatchItem.Create(AModel);
  FItems.AddObject(IntToStr(FItems.Count), Item);
end;

function TBatchRequest.AsString: TString;
begin
  if Assigned(FTransform) then
    Result := FTransform.AsString(Items)
  else
    raise Exception.Create('Transformador não definido');
end;

constructor TBatchRequest.Create(const ABatchRequestTransform: IBatchRequestTransform);
begin
  inherited Create;
  {$IFDEF VER185}
  FItems := TStringList.Create;
  {$ELSE}
  FItems := TStringList.Create(True);
  {$ENDIF}
  FTransform := ABatchRequestTransform;
end;

destructor TBatchRequest.Destroy;
begin
  FreeAndNil(FItems);
  inherited;
end;

{ TBatchItem }

function TBatchItem.AsString: TString;
var
  Marshalling: TServiceMarshalling;
begin
  Marshalling := TServiceMarshalling.Create;
  try
    Result := TXMLHelper.Serialize(FModel, False, Marshalling.Serializers);
  finally
    FreeAndNil(Marshalling);
  end;
end;

constructor TBatchItem.Create(const AModel: IModel);
begin
  inherited Create;
  FModel := AModel;
end;

{ TBatchResponse }

constructor TBatchResponse.Create(const AContents: TString;
  const AResponseTranslator: IBatchResponseTranslator);
begin
  inherited Create;
  FContents := AContents;
  FResponseTranslator := AResponseTranslator;
end;

function TBatchResponse.GetErrors: TStrings;
begin
  Result := FResponseTranslator.GetErrors(FContents);
end;

function TBatchResponse.GetSuccesses: TStrings;
begin
  Result := FResponseTranslator.GetSuccesses(FContents);
end;

{ TServiceMarshalling }

constructor TServiceMarshalling.Create;
begin
  inherited;
  ConfigureDeserializers;
  ConfigureSerializers;
end;

procedure TServiceMarshalling.AddDateTimeDeserializer;
begin
  AddDeserializer(TDateTimePropertyDeserializer.Create);
end;

procedure TServiceMarshalling.AddDeserializer(const ADeserializer: IPropertyDeserializer);
begin
  SetLength(FDeserializers, Length(FDeserializers) + 1);
  FDeserializers[Length(FDeserializers) - 1] := ADeserializer;
end;

procedure TServiceMarshalling.AddEnumDeserializer;
begin
  AddDeserializer(TEnumPropertyDeserializer.Create);
end;

procedure TServiceMarshalling.AddModelDeserializer;
var
  ModelDeserializer: IPropertyDeserializer;
begin
  ModelDeserializer := TModelPropertyDeserializer.Create;
  AddDeserializer(ModelDeserializer);
end;

procedure TServiceMarshalling.AddModelListDeserializer;
begin
  AddDeserializer(TModelListPropertyDeserializer.Create);
end;

procedure TServiceMarshalling.AddModelListSerializer;
begin
  AddSerializer(TModelListPropertySerializer.Create);
  AddSerializer(TPropertyTipoIncidenciaIPISerializer.Create);
end;

procedure TServiceMarshalling.AddSerializer(const ASerializer: IPropertySerializer);
begin
  SetLength(FSerializers, Length(FSerializers) + 1);
  FSerializers[Length(FSerializers) - 1] := ASerializer;
end;

procedure TServiceMarshalling.ConfigureDeserializers;
begin
  SetLength(FDeserializers, 0);
  AddDateTimeDeserializer;
  AddEnumDeserializer;
  AddModelDeserializer;
  AddModelListDeserializer;
end;

procedure TServiceMarshalling.ConfigureSerializers;
begin
  SetLength(FSerializers, 0);
  AddModelListSerializer;
end;

{ TServiceCommandResult }

constructor TServiceCommandResult.Create(ASuccessful: Boolean; const AFailReasons: TFailReasonList; const ALocation: TString);
begin
  FSuccessful := ASuccessful;
  FFailReasons := TFailReasonList.Create;
  FFailReasons.AddStrings(AFailReasons);
  FLocation := ALocation;
end;

destructor TServiceCommandResult.Destroy;
begin
  FreeAndNil(FFailReasons);
  inherited;
end;

{ TFailReason }

class function TFailReasonHelper.FromResponse(const AResponse: IResponse): TFailReasonList;
var
  Reasons: TFailReasonList;
begin
  Result := TFailReasonList.Create;
  if AResponse.Status = 422 then
  begin
    Reasons := TFailReasonHelper.FromXML(AResponse.AsXML);
    try
      Result.AddStrings(Reasons);
    finally
      FreeAndNil(Reasons);
    end;               
  end;
end;

class function TFailReasonHelper.FromStringArray(const AArray: TStringArray): TFailReasonList;
var
  Idx: Integer;
begin
  Result := TFailReasonList.Create;
  for Idx := Low(AArray) to High(AArray) do
    Result.Add(AArray[Idx]);
end;

class function TFailReasonHelper.FromXML(const ADocument: IXMLDocument): TFailReasonList;
var
  ReasonsNodes, MessageNodes: TCustomXMLNodeArray;
  ReasonNode: IXMLNode;
  ReasonNodeIdx: Integer;
begin
  Result := TFailReasonList.Create;
  ReasonsNodes := TXMLHelper.XPathSelect(ADocument, '//ErrorResponse/reasons/*');
  MessageNodes := TXMLHelper.XPathSelect(ADocument, '//ErrorResponse/message');
  if Length(ReasonsNodes) > 0 then
  begin
    for ReasonNodeIdx := 0 to Length(ReasonsNodes) - 1 do
    begin
      ReasonNode := ReasonsNodes[ReasonNodeIdx];      
      Result.Add(ReasonNode.Text);
    end;
  end
  else
    if Length(MessageNodes) > 0 then
      Result.Add(MessageNodes[0].Text);
end;

{ TBatchService }

function TBatchService.CreateBatchRequest: TBatchRequest;
begin
  Result := TBatchRequest.Create(CreateTransform);
end;

function TBatchService.CreateTransform: IBatchRequestTransform;
begin
  Result := TBatchRequestTransformV1.Create;
end;

function TBatchService.Insert(ARequest: IBatchRequest): IBatchResponse;
begin
  Result := Insert(ARequest, FPath);
end;

function TBatchService.Update(ARequest: IBatchRequest;
  const APath: string): IBatchResponse;
var
  Response: IResponse;
begin
  Result := nil;
  Response := FClient.Put(APath, ARequest.AsString, nil);
  if Assigned(Response) then
    Result := TBatchResponse.Create(Response.Content, TBatchResponseTranslator.Create);
end;

function TBatchService.Update(ARequest: IBatchRequest): IBatchResponse;
begin
  Result := Update(ARequest, FPath);
end;

function TBatchService.Insert(ARequest: IBatchRequest; const APath: string): IBatchResponse;
var
  Response: IResponse;
begin
  Result := nil;
  Response := FClient.Post(APath, ARequest.AsString, nil);
  if Assigned(Response) then
    Result := TBatchResponse.Create(Response.Content, TBatchResponseTranslator.Create);
end;

{ TBatchRequestTransformV1 }

function TBatchRequestTransformV1.AsString(AItems: TStrings): string;
var
  Xml: TStrings;
  Idx: Integer;
begin
  Xml := TStringList.Create;
  try
    Xml.LineBreak := EmptyStr;
    Xml.Add('<paramlist>');
    Xml.Add('<items>');
    for Idx := 0 to AItems.Count - 1 do
    begin
      Xml.Add('<item>');
      Xml.Add(Format('<locator>%s</locator>', [AItems[Idx]]));
      Xml.Add('<entity>');
      Xml.Add(TBatchItem(AItems.Objects[Idx]).AsString);
      Xml.Add('</entity>');
      Xml.Add('</item>');
    end;
    Xml.Add('</items>');
    Xml.Add('</paramlist>');
    Result := Xml.Text;
  finally
    FreeAndNil(Xml);
  end;
end;


{ TBatchRequestTransformV2 }

function TBatchRequestTransformV2.AsString(AItems: TStrings): string;
var
  Xml: TStrings;
  Idx: Integer;
begin
  Xml := TStringList.Create;
  try
    Xml.LineBreak := EmptyStr;
    Xml.Add('<Batch>');
    Xml.Add('<put>');
    Xml.Add('<produtos>');
    for Idx := 0 to AItems.Count - 1 do
    begin
      Xml.Add('<itemBatch>');
      Xml.Add(Format('<locator>%s</locator>', [AItems[Idx]]));
      Xml.Add('<entity>');
      Xml.Add(TBatchItem(AItems.Objects[Idx]).AsString);
      Xml.Add('</entity>');
      Xml.Add('</itemBatch>');
    end;
    Xml.Add('</produtos>');
    Xml.Add('</put>');
    Xml.Add('</Batch>');
    Result := ReplaceText(Xml.Text, #10, '');
    Result := ReplaceText(Result, #13, '');
  finally
    FreeAndNil(Xml);
  end;
end;

{ TBatchResponseTranslator }

function TBatchResponseTranslator.GetErrors(const AContents: TString): TStrings;

  function GetReasons(Document: IXMLDocument): TStrings;
  var
    ReasonIdx: Integer;
    ReasonNodes: TCustomXMLNodeArray;
    ReasonNode: IXMLNode;
  begin
    Result := TStringList.Create;
    ReasonNodes := TXMLHelper.XPathSelect(Document, '//reasons/*');
    for ReasonIdx := Low(ReasonNodes) to High(ReasonNodes) do
    begin
      ReasonNode := ReasonNodes[ReasonIdx];
      Result.Add(ReasonNode.Text);
    end;
  end;

var
  Document: IXMLDocument;
  ErrorNodes, ErrorResponseNodes: TCustomXMLNodeArray;
  ErrorNode, ErrorResponseNode: IXMLNode;
  Reason: TStrings;
  Idx: Integer;
begin
  Result := TStringList.Create;
  Document := TXMLHelper.CreateDocument(AContents);
  ErrorNodes := TXMLHelper.XPathSelect(Document, '//ResultParamList/errors/*');
  for Idx := Low(ErrorNodes) to High(ErrorNodes) do
  begin
    ErrorNode := ErrorNodes[Idx];
    if ErrorNode.HasChildNodes then
    begin
      Reason := GetReasons(Document);
      try
        Result.Values[ErrorNode.ChildNodes.FindNode('locator').Text] := Reason.Text;
      finally
        FreeAndNil(Reason);
      end;
    end;
  end;
  if Result.Count = 0 then
  begin
    ErrorResponseNodes := TXMLHelper.XPathSelect(Document, '//ErrorResponse');
    if Length(ErrorResponseNodes) > 0 then
    begin
      ErrorResponseNode := ErrorResponseNodes[0];
      if ErrorResponseNode.HasChildNodes then
      begin
        Reason := GetReasons(Document);
        try
          Result.Text := Reason.Text;
        finally
          FreeAndNil(Reason);
        end;
      end;
    end;
  end;
end;

function TBatchResponseTranslator.GetSuccesses(const AContents: TString): TStrings;
var
  Document: IXMLDocument;
  SuccessNodes: TCustomXMLNodeArray;
  SuccessNode, LocationNode: IXMLNode;
  Idx: Integer;
  Locator, Location: string;
begin
  Result := TStringList.Create;
  Document := TXMLHelper.CreateDocument(AContents);
  SuccessNodes := TXMLHelper.XPathSelect(Document, '//ResultParamList/successes/*');
  for Idx := Low(SuccessNodes) to High(SuccessNodes) do
  begin
    SuccessNode := SuccessNodes[Idx];
    if SuccessNode.HasChildNodes then
    begin
      Locator := IntToStr(Idx);
      LocationNode := SuccessNode.ChildNodes.FindNode('location');
      Location := LocationNode.Text;
      Result.Values[Locator] := Location;
    end;
  end;
end;

{ TBatchResponseTranslatorV1 }

function TBatchResponseTranslatorV1.GetErrors(
  const AContents: TString): TStrings;

  function GetReasons(Document: IXMLDocument): TStrings;
  var
    ReasonIdx: Integer;
    ReasonNodes: TCustomXMLNodeArray;
    ReasonNode: IXMLNode;
  begin
    Result := TStringList.Create;
    ReasonNodes := TXMLHelper.XPathSelect(Document, '//reasons/*');
    for ReasonIdx := Low(ReasonNodes) to High(ReasonNodes) do
    begin
      ReasonNode := ReasonNodes[ReasonIdx];
      Result.Add(ReasonNode.Text);
    end;
  end;

var
  Document: IXMLDocument;
  ErrorNodes, ErrorResponseNodes: TCustomXMLNodeArray;
  ErrorNode, ErrorResponseNode: IXMLNode;
  Reason: TStrings;
  Idx: Integer;
begin
  Result := TStringList.Create;
  Document := TXMLHelper.CreateDocument(AContents);
  ErrorNodes := TXMLHelper.XPathSelect(Document, '//BatchResponse/*/*/errors/*');
  for Idx := Low(ErrorNodes) to High(ErrorNodes) do
  begin
    ErrorNode := ErrorNodes[Idx];
    if ErrorNode.HasChildNodes then
    begin
      Reason := GetReasons(Document);
      try
        Result.Values[ErrorNode.ChildNodes.FindNode('locator').Text] := Reason.Text;
      finally
        FreeAndNil(Reason);
      end;
    end;
  end;
  if Result.Count = 0 then
  begin
    ErrorResponseNodes := TXMLHelper.XPathSelect(Document, '//ErrorResponse');
    if Length(ErrorResponseNodes) > 0 then
    begin
      ErrorResponseNode := ErrorResponseNodes[0];
      if ErrorResponseNode.HasChildNodes then
      begin
        Reason := GetReasons(Document);
        try
          Result.Text := Reason.Text;
        finally
          FreeAndNil(Reason);
        end;
      end;
    end;
  end;
end;

function TBatchResponseTranslatorV1.GetSuccesses(
  const AContents: TString): TStrings;
var
  Document: IXMLDocument;
  SuccessNodes: TCustomXMLNodeArray;
  SuccessNode, LocationNode: IXMLNode;
  Idx: Integer;
  Locator,
  Location: string;
begin
  Result := TStringList.Create;
  Document := TXMLHelper.CreateDocument(AContents);
  SuccessNodes := TXMLHelper.XPathSelect(Document, '//BatchResponse/*/*/successes/*');
  for Idx := Low(SuccessNodes) to High(SuccessNodes) do
  begin
    SuccessNode := SuccessNodes[Idx];
    if SuccessNode.HasChildNodes then
    begin
      Locator := IntToStr(Idx);
      LocationNode := SuccessNode.ChildNodes.FindNode('locator');
      Location := LocationNode.Text;
      Result.Values[Locator] := Location;
    end;
  end;
end;

end.

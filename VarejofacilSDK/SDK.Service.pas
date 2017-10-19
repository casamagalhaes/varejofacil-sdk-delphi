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
    procedure Add(const AItem: TBatchItem);
    function AsString: TString;
  end;

  TBatchResponse = class(TInterfacedObject, IBatchResponse)
  strict private
    FSuccesses: TStrings;
    FErrors: TStrings;
    FContents: TString;
    function GetSuccesses: TStrings;
    function GetErrors: TStrings;
  public
    property Errors: TStrings read GetErrors;
    property Successes: TStrings read GetSuccesses;
    constructor Create(const AContents: TString);
    destructor Destroy; override;
  end;

  TBatchItem = class
  strict private
    FModel: IModel;
  public
    constructor Create(const AModel: IModel);
    function AsString: TString;
  end;

  TBatchRequest = class(TInterfacedObject, IBatchRequest)
  strict private
    FItems: TStrings;
  public
    constructor Create;
    procedure Add(const AItem: TBatchItem);
    function AsString: TString;
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
    destructor Destroy;
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
    function PathWithDependencies(const ADependencies: array of TVarRec): TString;
    function ToParams(const AQuery: TString; AStart, ACount: Integer; const ASortParams: TStringArray = []): TString;
    function InterpretLocation(const ALocation: TString): TString; virtual;
  public
    destructor Destroy;
    constructor Create(const APath: TString; const AClient: IClient); virtual;
    function Update(const AId: TString; const AModel: IModel): Boolean; overload; virtual;
    function Update(const AId: TString; const AModel: IModel; const APath: TString): Boolean; overload; virtual;
    function Delete(const AId: TString): Boolean; virtual;
    function DeleteWithPath(const AId: TString; const APath: TString): Boolean; virtual;
    function Insert(const AModel: IModel): TServiceCommandResult; overload; virtual;
    function Insert(const AModel: IModel; const APath: TString): TServiceCommandResult; overload; virtual;
  end;

implementation

uses
  JvPropertyStore;

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
  FMarshalling.Free;
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
      FailReasons.Free;
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
  SortParams: PSortParams;
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
    if Assigned(ASortParams) then
    begin
      SortParams := TSortParams.From(ASortParams);
      try
        Params.Values['sort'] := SortParams^;
      finally
        Dispose(SortParams);
      end
    end;
    Result := Copy(Params.Text, 1, Length(Params.Text) - 1);
  finally
    Params.Free;
  end;
end;

function TService.Update(const AId: TString; const AModel: IModel; const APath: TString): Boolean;
var
  Response: IResponse;
begin
  Response := FClient.Put(Concat(APath, '/', AId), TXMLHelper.Serialize(AModel, True, FSerializers), nil);
  Result := Response.Status = 200;
end;

function TService.Update(const AId: TString; const AModel: IModel): Boolean;
begin
  Result := Update(AId, AModel, FPath);
end;

{ TBatchRequest }

procedure TBatchRequest.Add(const AItem: TBatchItem);
begin
  FItems.AddObject(IntToStr(FItems.Count), AItem);
end;

function TBatchRequest.AsString: TString;
var
  Xml: TStrings;
  Idx: Integer;
begin
  Xml := TStringList.Create;
  try
    Xml.LineBreak := EmptyStr;
    Xml.Add('<batch>');
    Xml.Add('<items>');
    for Idx := 0 to FItems.Count - 1 do
    begin
      Xml.Add(Format('<item locator="%s">', [FItems[Idx]]));
      Xml.Add('<entity>');
      Xml.Add(TBatchItem(FItems.Objects[Idx]).AsString);
      Xml.Add('</entity>');
      Xml.Add('</item>');
    end;
    Xml.Add('</items>');
    Xml.Add('</batch>');
    Result := Xml.Text;
  finally
    Xml.Free;
  end;
end;

constructor TBatchRequest.Create;
begin
  inherited;
  FItems := TStringList.Create(True);
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
    Marshalling.Free;
  end;
end;

constructor TBatchItem.Create(const AModel: IModel);
begin
  inherited Create;
  FModel := AModel;
end;

{ TBatchResponse }

constructor TBatchResponse.Create(const AContents: TString);
begin
  inherited Create;
  FContents := AContents;
end;

destructor TBatchResponse.Destroy;
begin
  FreeAndNil(FSuccesses);
  FreeAndNil(FErrors);
  inherited;
end;

function TBatchResponse.GetErrors: TStrings;
var
  Document: IXMLDocument;
  ErrorNodes, ReasonNodes: TCustomXMLNodeArray;
  ErrorNode, ReasonNode: IXMLNode;
  Reason: TStrings;
  Idx: Integer;
  ReasonIdx: Integer;
begin
  Result := TStringList.Create;
  Document := TXMLHelper.CreateDocument(FContents);
  ErrorNodes := TXMLHelper.XPathSelect(Document, '//ResultParamList/errors/*');
  for Idx := Low(ErrorNodes) to High(ErrorNodes) do
  begin
    ErrorNode := ErrorNodes[Idx];
    if ErrorNode.HasChildNodes then
    begin
      Reason := TStringList.Create;
      try
        ReasonNodes := TXMLHelper.XPathSelect(Document, '/reasons');
        for ReasonIdx := Low(ReasonNodes) to High(ReasonNodes) do
        begin
          ReasonNode := ReasonNodes[ReasonIdx];
          Reason.Add(ReasonNode.Text);
        end;
        Result.Values[ErrorNode.ChildNodes.FindNode('locator').Text] := Reason.Text;
      finally
        Reason.Free;
      end;
    end;
  end;
end;

function TBatchResponse.GetSuccesses: TStrings;
var
  Document: IXMLDocument;
  SuccessNodes: TCustomXMLNodeArray;
  SuccessNode: IXMLNode;
  Idx: Integer;
begin
  Result := TStringList.Create;
  Document := TXMLHelper.CreateDocument(FContents);
  SuccessNodes := TXMLHelper.XPathSelect(Document, '//ResultParamList/successes/*');
  for Idx := Low(SuccessNodes) to High(SuccessNodes) do
  begin
    SuccessNode := SuccessNodes[Idx];
    if SuccessNode.HasChildNodes then
      Result.Values[SuccessNode.ChildNodes.FindNode('locator').Text] := SuccessNode.ChildNodes.FindNode('location').Text;
  end;
end;

{ TServiceMarshalling }

constructor TServiceMarshalling.Create;
begin
  inherited;
  ConfigureDeserializers;
  ConfigureSerializers;
end;

procedure TServiceMarshalling.AddDateTimeDeserializer;
var
  DateTimeDeserializer: IPropertyDeserializer;
begin
  DateTimeDeserializer := TDateTimePropertyDeserializer.Create;
  AddDeserializer(DateTimeDeserializer);
end;

procedure TServiceMarshalling.AddDeserializer(const ADeserializer: IPropertyDeserializer);
begin
  SetLength(FDeserializers, Length(FDeserializers) + 1);
  FDeserializers[Length(FDeserializers) - 1] := ADeserializer;
end;

procedure TServiceMarshalling.AddEnumDeserializer;
var
  EnumDeserializer: IPropertyDeserializer;
begin
  EnumDeserializer := TEnumPropertyDeserializer.Create;
  AddDeserializer(EnumDeserializer);
end;

procedure TServiceMarshalling.AddModelDeserializer;
var
  ModelDeserializer: IPropertyDeserializer;
begin
  ModelDeserializer := TModelPropertyDeserializer.Create;
  AddDeserializer(ModelDeserializer);
end;

procedure TServiceMarshalling.AddModelListDeserializer;
var
  ModelListDeserializer: IPropertyDeserializer;
begin
  ModelListDeserializer := TModelListPropertyDeserializer.Create;
  AddDeserializer(ModelListDeserializer);
end;

procedure TServiceMarshalling.AddModelListSerializer;
var
  ModelListSerializer: IPropertySerializer;
begin
  ModelListSerializer := TModelListPropertySerializer.Create;
  AddSerializer(ModelListSerializer);
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
var
  Idx: Integer;
begin
  FFailReasons.Free;      
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
      Reasons.Free;
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
  begin
    Result.Add(MessageNodes[0].Text);
  end;
end;

end.

unit SDK.Service;

interface

uses
  SysUtils, Classes, Math, SDK.XML, SDK.Types, SDK.Client, SDK.ConfigProvider,
  SDK.PropertyDeserializers, SDK.SortParams, XMLIntf;

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

  TService = class
  protected
    FPath: TString;
    FClient: IClient;
    FDeserializers: TPropertyDeserializerArray;
    procedure AddDeserializer(const ADeserializer: IPropertyDeserializer);
    procedure AddDateTimeDeserializer;
    procedure AddEnumDeserializer;
    procedure AddModelDeserializer;
    procedure ConfigureDeserializers;
    function PathWithDependencies(const ADependencies: array of TVarRec): TString;
    function ToParams(const AQuery: TString; AStart, ACount: Integer; const ASortParams: TStringArray = []): TString;
    function InterpretLocation(const ALocation: TString): TString; virtual;
  public
    constructor Create(const APath: TString; const AClient: IClient); virtual;
    function Update(const AId: TString; const AModel: IModel): Boolean; overload; virtual;
    function Update(const AId: TString; const AModel: IModel; const APath: TString): Boolean; overload; virtual;
    function Delete(const AId: TString): Boolean; virtual;
    function DeleteWithPath(const AId: TString; const APath: TString): Boolean; virtual;
    function Insert(const AModel: IModel): TString; overload; virtual;
    function Insert(const AModel: IModel; const APath: TString): TString; overload; virtual;
  end;

implementation

{ TService }

procedure TService.AddDateTimeDeserializer;
var
  DateTimeDeserializer: IPropertyDeserializer;
begin
  DateTimeDeserializer := TDateTimePropertyDeserializer.Create;
  AddDeserializer(DateTimeDeserializer);
end;

procedure TService.AddDeserializer(const ADeserializer: IPropertyDeserializer);
begin
  SetLength(FDeserializers, Length(FDeserializers) + 1);
  FDeserializers[Length(FDeserializers) - 1] := ADeserializer;
end;

procedure TService.AddEnumDeserializer;
var
  EnumDeserializer: IPropertyDeserializer;
begin
  EnumDeserializer := TEnumPropertyDeserializer.Create;
  AddDeserializer(EnumDeserializer);
end;

procedure TService.AddModelDeserializer;
var
  ModelDeserializer: IPropertyDeserializer;
begin
  ModelDeserializer := TModelPropertyDeserializer.Create;
  AddDeserializer(ModelDeserializer);
end;

procedure TService.ConfigureDeserializers;
begin
  SetLength(FDeserializers, 0);
  AddDateTimeDeserializer;
  AddEnumDeserializer;
  AddModelDeserializer;
end;

constructor TService.Create(const APath: TString; const AClient: IClient);
begin
  FPath := APath;
  FClient := AClient;
  ConfigureDeserializers;
end;

function TService.DeleteWithPath(const AId, APath: TString): Boolean;
var
  Response: IResponse;
begin
  Response := FClient.Delete(Concat(APath, '/', AId), nil, nil);
  Result := Response.Status = 200;
end;

function TService.Delete(const AId: TString): Boolean;
begin
  Result := DeleteWithPath(AId, FPath);
end;

function TService.Insert(const AModel: IModel; const APath: TString): TString;
var
  Response: IResponse;
begin
  Result := EmptyStr;
  Response := FClient.Post(APath, TXMLHelper.Serialize(AModel), nil);
  if Assigned(Response) and (Response.Status = 201) and (Response.Headers.IndexOfName('Location') > -1) then
    Result := InterpretLocation(Response.Headers.Values['Location']);
end;

function TService.Insert(const AModel: IModel): TString;
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
  Response := FClient.Put(Concat(APath, '/', AId), TXMLHelper.Serialize(AModel), nil);
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
begin
  Result := TXMLHelper.Serialize(FModel, False);
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

end.

unit SDK.ListDeserializers;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.XML, Variants, TypInfo%BEGIN_LOOP(MODELS)%, SDK.Model.%MODEL_NAME%%END_LOOP%, SDK.Service, XMLIntf;

type

  TListDeserializerException = class(Exception);

  TListDeserializer = class
  private
    FType: TString;
    FMarshalling: TServiceMarshalling;
    FDeserializers: TPropertyDeserializerArray;
  public
    constructor Create(const AType: TString = '');
    destructor Destroy;
    property Deserializers: TPropertyDeserializerArray read FDeserializers;
    procedure Execute(const AType: TString; ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString); overload;
    procedure Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString); overload;
  end;

  TLongListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;%BEGIN_LOOP(MODELS)%

  T%MODEL_NAME%ListDeserializer = class(TListDeserializer)
  public
    function Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
    class function Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
  end;%END_LOOP%

implementation

{ TListDeserializer }

constructor TListDeserializer.Create(const AType: TString);
begin
  inherited Create;
  FMarshalling := TServiceMarshalling.Create;
  FDeserializers := FMarshalling.Deserializers;
  FType := AType;
end;

destructor TListDeserializer.Destroy;
begin
  FreeAndNil(FMarshalling);
end;

procedure TListDeserializer.Execute(const AType: TString; ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString);
begin
  if SameText(AType, 'TLongList') then TLongListDeserializer.Execute(ANode, AModel, APropName) else%BEGIN_LOOP(MODELS)%
  if SameText(AType, 'T%MODEL_NAME%List') then T%MODEL_NAME%ListDeserializer.Execute(ANode, AModel, APropName) else%END_LOOP%
  raise TListDeserializerException.CreateFmt('lista do tipo %s não possui deserializador', [AType]);
end;

procedure TListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString);
begin
  Execute(FType, ANode, AModel, APropName);
end;

{ TLongListDeserializer }

class function TLongListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: TLongListDeserializer;
begin
  Deserializer := TLongListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function TLongListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
begin
  //
end;%BEGIN_LOOP(MODELS)%

{ T%MODEL_NAME%ListDeserializer }

class function T%MODEL_NAME%ListDeserializer.Execute(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  Deserializer: T%MODEL_NAME%ListDeserializer;
begin
  Deserializer := T%MODEL_NAME%ListDeserializer.Create;
  try
    Result := Deserializer.Deserialize(ANode, AModel, APropName);
  finally
    Deserializer.Free;
  end;
end;

function T%MODEL_NAME%ListDeserializer.Deserialize(ANode: IXMLNode; AModel: TInterfacedModel; APropName: TString): TString;
var
  List: T%MODEL_NAME%List;
  Item: I%MODEL_NAME%;
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  List := T%MODEL_NAME%List.Create;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      Item := T%MODEL_NAME%.Create;
      TXMLHelper.Deserialize(ChildNode, T%MODEL_NAME%, Deserializers).QueryInterface(GetTypeData(TypeInfo(I%MODEL_NAME%))^.Guid, Item);
      List.Add(Item);
    end;
  end;
  SetObjectProp(AModel.GetReference, APropName, List);
end;%END_LOOP%

end.

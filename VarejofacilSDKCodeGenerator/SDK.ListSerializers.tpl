unit SDK.ListSerializers;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.XML, Variants, TypInfo%BEGIN_LOOP(MODELS)%, SDK.Model.%MODEL_NAME%%END_LOOP%, SDK.Service;

type

  TListSerializerException = class(Exception);

  TListSerializer = class
  private
    FType: TString;
    FMarshalling: TServiceMarshalling;
    FSerializers: TPropertySerializerArray;
  public
    constructor Create(const AType: TString = '');
    destructor Destroy;
    property Serializers: TPropertySerializerArray read FSerializers;
    function Execute(const AType: TString; AList: TObject): TString; overload;
    function Execute(AList: TObject): TString; overload;
  end;

  TLongListSerializer = class(TListSerializer)
  public
    function Serialize(AList: TLongList): TString;
    class function Execute(AList: TLongList): TString;
  end;%BEGIN_LOOP(MODELS)%

  T%MODEL_NAME%ListSerializer = class(TListSerializer)
  public
    function Serialize(AList: T%MODEL_NAME%List): TString;
    class function Execute(AList: T%MODEL_NAME%List): TString;
  end;%END_LOOP%

implementation

{ TListSerializer }

constructor TListSerializer.Create(const AType: TString);
begin
  inherited Create;
  FMarshalling := TServiceMarshalling.Create;
  FSerializers := FMarshalling.Serializers;
  FType := AType;
end;

destructor TListSerializer.Destroy;
begin
  FreeAndNil(FMarshalling);
end;

function TListSerializer.Execute(AList: TObject): TString;
begin
  Result := Execute(FType, AList);
end;

function TListSerializer.Execute(const AType: TString; AList: TObject): TString;
begin
  if SameText(AType, 'TLongList') then Result := TLongListSerializer.Execute(TLongList(AList)) else%BEGIN_LOOP(MODELS)%
  if SameText(AType, 'T%MODEL_NAME%List') then Result := T%MODEL_NAME%ListSerializer.Execute(T%MODEL_NAME%List(AList)) else%END_LOOP%
  raise TListSerializerException.Create('lista do tipo %s não possui serializador');
end;

{ TLongListSerializer }

class function TLongListSerializer.Execute(AList: TLongList): TString;
var
  Serializer: TLongListSerializer;
begin
  Serializer := TLongListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function TLongListSerializer.Serialize(AList: TLongList): TString;
var
  XML: TStrings;
  Item: Int64;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(Format('<value>%s</value>', [IntToStr(Item)]));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;%BEGIN_LOOP(MODELS)%

{ T%MODEL_NAME%ListSerializer }

class function T%MODEL_NAME%ListSerializer.Execute(AList: T%MODEL_NAME%List): TString;
var
  Serializer: T%MODEL_NAME%ListSerializer;
begin
  Serializer := T%MODEL_NAME%ListSerializer.Create;
  try
    Result := Serializer.Serialize(AList);
  finally
    Serializer.Free;
  end;
end;

function T%MODEL_NAME%ListSerializer.Serialize(AList: T%MODEL_NAME%List): TString;
var
  XML: TStrings;
  Item: I%MODEL_NAME%;
begin
  XML := TStringList.Create;
  try
    for Item in AList do
      XML.Add(TXMLHelper.Serialize(Item, True, Serializers, True));
    Result := XML.Text;
  finally
    XML.Free;
  end;
end;%END_LOOP%

end.

unit SDK.PropertyDeserializers;

interface

uses
  SDK.Types, SysUtils, Classes, SDK.XML, XMLIntf, TypInfo, SDK.Enums, StrUtils;

type

  TDateTimePropertyDeserializer = class(TInterfacedObject, IPropertyDeserializer)
  public
    procedure Execute(const ANode: IXMLNode; const AInstance: IModel;
      const AProperty: PPropInfo; ADeserializers: TPropertyDeserializerArray);
    function IsCompatible(const AProperty: PPropInfo): Boolean;
  end;

  TEnumPropertyDeserializer = class(TInterfacedObject, IPropertyDeserializer)
  public
    procedure Execute(const ANode: IXMLNode; const AInstance: IModel;
      const AProperty: PPropInfo; ADeserializers: TPropertyDeserializerArray);
    function IsCompatible(const AProperty: PPropInfo): Boolean;
  end;

  TModelPropertyDeserializer = class(TInterfacedObject, IPropertyDeserializer)
    procedure Execute(const ANode: IXMLNode; const AInstance: IModel;
      const AProperty: PPropInfo; ADeserializers: TPropertyDeserializerArray);
    function IsCompatible(const AProperty: PPropInfo): Boolean;
  end;

  TModelListPropertyDeserializer = class(TInterfacedObject, IPropertyDeserializer)
    procedure Execute(const ANode: IXMLNode; const AInstance: IModel;
      const AProperty: PPropInfo; ADeserializers: TPropertyDeserializerArray);
    function IsCompatible(const AProperty: PPropInfo): Boolean;
  end;

implementation

uses
  SDK.ListDeserializers;

{ TDateTimePropertyDeserializer }

procedure TDateTimePropertyDeserializer.Execute(const ANode: IXMLNode; const AInstance: IModel;
  const AProperty: PPropInfo; ADeserializers: TPropertyDeserializerArray);
begin
  SetPropValue(
    AInstance.GetReference,
    TString(AProperty^.Name),
    ISO8601ToDateTime(ANode.Text)
  );
end;

function TDateTimePropertyDeserializer.IsCompatible(const AProperty: PPropInfo): Boolean;
begin
  Result := SameText('TDateTime', TString(AProperty^.PropType^.Name));
end;

{ TEnumPropertyDeserializer }

procedure TEnumPropertyDeserializer.Execute(const ANode: IXMLNode; const AInstance: IModel;
  const AProperty: PPropInfo; ADeserializers: TPropertyDeserializerArray);
begin
  SetPropValue(
    AInstance.GetReference,
    TString(AProperty^.Name),
    EnumConverters.Execute(TString(AProperty^.PropType^.Name), ANode.Text)
  );
end;

function TEnumPropertyDeserializer.IsCompatible(const AProperty: PPropInfo): Boolean;
begin
  Result := (AProperty^.PropType^.Kind = tkEnumeration) and
              (EnumConverters.IndexOfName(TString(AProperty^.PropType^.Name)) > -1);
end;

{ TModelPropertyDeserializer }

procedure TModelPropertyDeserializer.Execute(const ANode: IXMLNode; const AInstance: IModel;
  const AProperty: PPropInfo; ADeserializers: TPropertyDeserializerArray);
var
  ModelClass: TInterfacedModelClass;
  ModelClassName: TString;
  ModelInstance: IModel;
begin
  if ANode.HasChildNodes then
  begin
    ModelClassName := TString('T' + Copy(AProperty^.PropType^.Name, 2, Length(AProperty^.PropType^.Name) - 1));
    ModelClass := TInterfacedModelClass(FindClass(TString(ModelClassName)));
    if Assigned(ModelClass) then
    begin
      ModelInstance := TXMLHelper.Deserialize(ANode, ModelClass, ADeserializers);
      SetInterfaceProp(AInstance.GetReference, TString(AProperty^.Name), ModelInstance);
    end;
  end;
end;

function TModelPropertyDeserializer.IsCompatible(const AProperty: PPropInfo): Boolean;
begin
  Result := (AProperty.PropType^.Kind = tkInterface);
end;

{ TModelListPropertyDeserializer }

procedure TModelListPropertyDeserializer.Execute(const ANode: IXMLNode; const AInstance: IModel;
  const AProperty: PPropInfo; ADeserializers: TPropertyDeserializerArray);
var
  ListDeserializer: TListDeserializer;
begin
  if ANode.HasChildNodes then
  begin
    ListDeserializer := TListDeserializer.Create(TString(AProperty^.PropType^.Name));
    try
      ListDeserializer.Execute(ANode, AInstance.GetReference, TString(AProperty^.Name));
    finally
      ListDeserializer.Free;
    end;
  end;
end;

function TModelListPropertyDeserializer.IsCompatible(const AProperty: PPropInfo): Boolean;
begin
  Result := (AProperty^.PropType^.Name[1] = 'T') and EndsStr('List', TString(AProperty^.PropType^.Name));
end;

end.

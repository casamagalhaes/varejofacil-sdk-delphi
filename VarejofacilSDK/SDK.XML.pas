unit SDK.XML;

interface

uses
  SysUtils, Variants, TypInfo, SDK.Types, Classes,
  msxmldom,
  XMLDoc,
  XMLIntf,
  xmldom;

type

  IPropertyDeserializer = interface;

  TPropertyDeserializerArray = array of IPropertyDeserializer;

  IPropertySerializer = interface;

  TPropertySerializerArray = array of IPropertySerializer;

  IPropertyDeserializer = interface
    ['{FCB077A8-01F5-409E-BDB6-32EF0B0D7CA8}']
    function IsCompatible(const AProperty: PPropInfo): Boolean;
    procedure Execute(const ANode: IXMLNode; const AInstance: IModel;
      const AProperty: PPropInfo; ADeserializers: TPropertyDeserializerArray);
  end;

  IPropertySerializer = interface
    ['{FCB077A8-01F5-409E-BDB6-32EF0B0D7CA8}']
    function IsCompatible(const AProperty: PPropInfo): Boolean;
    function Execute(const AInstance: IModel;
      const AProperty: PPropInfo; ASerializers: TPropertySerializerArray): TString;
  end;

  TXMLHelper = class
    public
      class function FindChildNode(const ANode: IXMLNode; const AName: TString): IXMLNode;
      class function Serialize(const AModel: IModel; ARootTag: Boolean = True;
        ASerializers: TPropertySerializerArray = nil; ACamelCase: Boolean = False): TString;
      class function Deserialize(const ANode: IXMLNode; AClass: TInterfacedModelClass;
        ADeserializers: TPropertyDeserializerArray = nil): IModel;
      class function XPathSelect(const ANode: IXMLNode;
        const XPath: TString): TCustomXMLNodeArray; overload;
      class function XPathSelect(const ADocument: IXMLDocument;
        const XPath: TString): TCustomXMLNodeArray; overload;
      class function CreateDocument(const AXML: TString): IXMLDocument;
  end;

implementation

uses
  XSBuiltIns, SDK.Enums;

const
  DOM_VENDOR = msxmldom.SMSXML;

{ TXMLHelper }

class function TXMLHelper.CreateDocument(const AXML: TString): IXMLDocument;
begin
  Result := TXMLDocument.Create(nil);
  Result.Options := [doNodeAutoCreate, doNodeAutoIndent, doAttrNull,
                     doAutoPrefix, doNamespaceDecl];
  (Result as TXMLDocument).DOMVendor := GetDOMVendor(DOM_VENDOR);
  Result.LoadFromXML(AXML);
  Result.Encoding := 'UTF8';
end;

class function TXMLHelper.XPathSelect(const ANode: IXMLNode;
  const XPath: TString): TCustomXMLNodeArray;
var
  DomNodeSelect: IDomNodeSelect;
  DOMNode      : IDOMNode;
  DocAccess    : IXmlDocumentAccess;
  Doc          : TXmlDocument;
  DOMNodes     : IDOMNodeList;
  DOMNodeIdx     : Integer;
begin
  SetLength(Result, 0);
  if Assigned(ANode) and
    Supports(ANode.DOMNode, IDomNodeSelect, DomNodeSelect) then
    DOMNodes := DomNodeSelect.SelectNodes(XPath);
  if not Assigned(DOMNodes) then
    Exit;
  SetLength(Result, DOMNodes.Length);
  for DOMNodeIdx := 0 to DOMNodes.Length - 1 do
  begin
    Doc := nil;
    DOMNode := DOMNodes.Item[DOMNodeIdx];
    if Supports(ANode.OwnerDocument, IXmlDocumentAccess, DocAccess) then
      Doc := DocAccess.DocumentObject;
    Result[DOMNodeIdx] := TXmlNode.Create(DOMNode, nil, Doc) as IXMLNode;
  end
end;

class function TXMLHelper.Deserialize(const ANode: IXMLNode;
  AClass: TInterfacedModelClass; ADeserializers: TPropertyDeserializerArray): IModel;
var
  Properties: PPropList;
  PropertiesSize: Integer;
  Prop: PPropInfo;
  ChildNode: IXMLNode;
  DeserializerIdx: Integer;
  DeserializerApplied: Boolean;
  Value: Variant;
  PropIdx: Integer;
begin
  Result := nil;
  if ANode.HasChildNodes then
  begin
    Result := AClass.Create;
    PropertiesSize := GetPropList(Result.GetReference, Properties);
    try
      if PropertiesSize > 0 then
      begin
        for PropIdx := 0 to PropertiesSize - 1 do
          begin
            Prop := Properties^[PropIdx];
            DeserializerApplied := False;
            ChildNode := TXMLHelper.FindChildNode(ANode, TString(Prop^.Name));
            if Assigned(ChildNode) then
            begin
              if Assigned(ADeserializers) and (Length(ADeserializers) > 0) then
              begin
                for DeserializerIdx := 0 to Length(ADeserializers) - 1 do
                begin
                  if ADeserializers[DeserializerIdx].IsCompatible(Prop) then
                  begin
                    ADeserializers[DeserializerIdx].Execute(ChildNode, Result, Prop, ADeserializers);
                    DeserializerApplied := True;
                    Break;
                  end;
                end;
              end;
              if not DeserializerApplied then
              begin
                case Prop.PropType^.Kind of
                  tkEnumeration:
                    Value := StrToBoolDef(ChildNode.Text, False);
                  tkInteger, tkInt64:
                    Value := StrToInt64Def(ChildNode.Text, 0);
                  tkFloat:
                    Value := StrToFloatDef(StringReplace(ChildNode.Text, '.', ',', [rfReplaceAll]), 0);
                  else
                    Value := ChildNode.Text;
                end;
                SetPropValue(Result.GetReference, TString(Prop^.Name), Value);
              end;
            end;
          end;
      end;
    finally
      FreeMem(Properties, PropertiesSize);
    end;
  end;
end;

class function TXMLHelper.FindChildNode(const ANode: IXMLNode;
  const AName: TString): IXMLNode;
var
  ChildNode: IXMLNode;
  NodeIdx: Integer;
begin
  Result := nil;
  if ANode.HasChildNodes then
  begin
    for NodeIdx := 0 to ANode.ChildNodes.Count - 1 do
    begin
      ChildNode := ANode.ChildNodes[NodeIdx];
      if SameText(ChildNode.NodeName, AName) then
        Exit(ChildNode);
    end;
  end;
end;

class function TXMLHelper.Serialize(const AModel: IModel; ARootTag: Boolean; ASerializers: TPropertySerializerArray; ACamelCase: Boolean): TString;

  function CamelCase(const AInput: TString): TString;
  begin
    Result := LowerCase(AInput[1]) + Copy(AInput, 2, Length(AInput) - 1);
  end;

  function RemoveLowerCase(const AInput: TString): TString;
  var
    UpperCaseChars: TString;
    I, X: Integer;
  begin
    Result := EmptyStr;
    UpperCaseChars := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_';
    for X := Low(AInput) to High(AInput) do
      for I := Low(UpperCaseChars) to High(UpperCaseChars) do
        if AInput[X] = UpperCaseChars[I] then
          Result := Result + AInput[X];
  end;

  function DateTimeToISO8601(const AInput: TDateTime): TString;
  begin
    with TXSDateTime.Create() do
    try
      AsDateTime := AInput;
      Result := NativeToXS;
    finally
      Free;
    end;
  end;

var
  PropertiesSize, SerializerIdx: Integer;
  Properties: PPropList;
  Prop: PPropInfo;
  I: Integer;
  ResultList: TStrings;
  ModelName, Value: TString;
  ChildModel: IModel;
  PropValue: Variant;
  SerializerApplied: Boolean;
begin
  ResultList := TStringList.Create;
  try
    ResultList.LineBreak := EmptyStr;
    ModelName := Copy(AModel.GetReference.ClassName, 2,
      Length(AModel.GetReference.ClassName) - 1);
    if ARootTag then
      if ACamelCase then
        ResultList.Add(Format('<%s>', [CamelCase(ModelName)]))
      else
        ResultList.Add(Format('<%s>', [ModelName]));
    PropertiesSize := GetPropList(AModel.GetReference, Properties);
    try
      for I := 0 to PropertiesSize - 1 do
      begin
        Value := EmptyStr;
        Prop := Properties^[I];
        SerializerApplied := False;
        if Assigned(ASerializers) and (Length(ASerializers) > 0) then
        begin
          for SerializerIdx := 0 to Length(ASerializers) - 1 do
          begin
            if ASerializers[SerializerIdx].IsCompatible(Prop) then
            begin
              Value := ASerializers[SerializerIdx].Execute(AModel, Prop, ASerializers);
              SerializerApplied := True;
              Break;
            end;
          end;
        end;
        if not SerializerApplied then
        begin
          case Prop^.PropType^.Kind of
            tkVariant:
            begin
              PropValue := GetPropValue(AModel.GetReference, TString(Prop^.Name));
              if not VarIsEmpty(PropValue) then
                Value := VarToStr(PropValue);
            end;
            tkInterface:
            begin
              ChildModel := GetInterfaceProp(AModel.GetReference, TString(Prop^.Name)) as IModel;
              if Assigned(ChildModel) then
                Value := TXMLHelper.Serialize(ChildModel, False, ASerializers);
            end;
            tkFloat:
            begin
              if SameText(TString(Prop^.PropType^.Name), 'TDateTime') then
              begin
                PropValue := StrToFloat(VarToStr(GetPropValue(AModel.GetReference, TString(Prop^.Name))));
                if PropValue > 0 then
                  Value := DateTimeToISO8601(PropValue)
                else
                  Value := EmptyStr;
              end
              else
              begin
                Value := VarToStr(GetPropValue(AModel.GetReference, TString(Prop^.Name)));
                Value := StringReplace(Value, '.', '', [rfReplaceAll]);
                Value := StringReplace(Value, ',', '.', [rfReplaceAll]);
              end;
            end;
            tkEnumeration:
            begin
              if SameText(TString(Prop^.PropType^.Name), 'Boolean') then
                Value := VarToStr(GetPropValue(AModel.GetReference, TString(Prop^.Name)))
              else
                Value := RemoveLowerCase(VarToStr(GetPropValue(AModel.GetReference, TString(Prop^.Name))));
            end;
            else
              Value := VarToStr(GetPropValue(AModel.GetReference, TString(Prop^.Name)));
          end;
        end;
        if Value <> EmptyStr then
          ResultList.Add(Format('<%s>%s</%0:s>', [
            CamelCase(TString(Prop^.Name)),
            Value
          ]));
      end;
    finally
      FreeMem(Properties);
    end;
    if ARootTag then
      if ACamelCase then
        ResultList.Add(Format('</%s>', [CamelCase(ModelName)]))
      else
        ResultList.Add(Format('</%s>', [ModelName]));
    Result := ResultList.Text;
  finally
    FreeAndNil(ResultList);
  end;
end;

class function TXMLHelper.XPathSelect(const ADocument: IXMLDocument;
  const XPath: TString): TCustomXMLNodeArray;
begin
  Result := TXMLHelper.XPathSelect(ADocument.DocumentElement, XPath);
end;

initialization
  DefaultDOMVendor := DOM_VENDOR;

end.

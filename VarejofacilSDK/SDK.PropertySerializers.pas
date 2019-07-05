unit SDK.PropertySerializers;

interface

uses
  SDK.Types, SysUtils, Classes, SDK.XML, XMLIntf, TypInfo, SDK.Enums, StrUtils, Variants;

type

  TModelListPropertySerializer = class(TInterfacedObject, IPropertySerializer)
  public
    function Execute(const AInstance: IModel;
      const AProperty: PPropInfo; ASerializers: TPropertySerializerArray): TString;
    function IsCompatible(const AProperty: PPropInfo): Boolean;
  end;

  TPropertyTipoIncidenciaIPISerializer = class(TInterfacedObject, IPropertySerializer)
  public
    function Execute(const AInstance: IModel;
      const AProperty: PPropInfo; ASerializers: TPropertySerializerArray): TString;
    function IsCompatible(const AProperty: PPropInfo): Boolean;
  end;


implementation

uses
  SDK.ListSerializers;

{ TModelListPropertySerializer }

function TModelListPropertySerializer.Execute(const AInstance: IModel; const AProperty: PPropInfo;
  ASerializers: TPropertySerializerArray): TString;
var
  List: TObject;
  ListSerializer: TListSerializer;
  ListAddr: NativeInt;
begin
  case AProperty^.PropType^.Kind of
    tkClass:
    begin
      ListAddr := GetOrdProp(AInstance.GetReference, TString(AProperty^.Name));
      if ListAddr > 0 then
      begin
        List := TObject(ListAddr);
        ListSerializer := TListSerializer.Create(TString(AProperty^.PropType^.Name));
        try
          Result := ListSerializer.Execute(List);
        finally
          ListSerializer.Free;
        end;
      end;
    end
    else
      Result := EmptyStr;
  end;
end;

function TModelListPropertySerializer.IsCompatible(const AProperty: PPropInfo): Boolean;
begin
  Result := (AProperty^.PropType^.Name[1] = 'T') and EndsStr('List', TString(AProperty^.PropType^.Name));
end;

{ TPropertyTipoIncidenciaIPISerializer }

function TPropertyTipoIncidenciaIPISerializer.Execute(const AInstance: IModel;
  const AProperty: PPropInfo; ASerializers: TPropertySerializerArray): TString;
var
  Tipo: TIncidenciaIPI;
begin
  Tipo := TIncidenciaIPI(GetOrdProp(AInstance.GetReference, TString(AProperty^.Name)));
  if Tipo = iipiNENHUM then
    Result := EmptyStr
  else
    Result := EnumConverters.Execute(TString(AProperty^.PropType^.Name), (Integer(Tipo)));
end;

function TPropertyTipoIncidenciaIPISerializer.IsCompatible(
  const AProperty: PPropInfo): Boolean;
begin
  Result := (AProperty^.PropType^.Kind = tkEnumeration) and SameText(TString(AProperty^.Name), 'IncidenciaIPI')
end;

end.

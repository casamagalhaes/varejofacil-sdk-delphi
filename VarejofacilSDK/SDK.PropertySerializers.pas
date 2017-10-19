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
      ListAddr := GetOrdProp(AInstance.GetReference, AProperty^.Name);
      if ListAddr > 0 then
      begin
        List := TObject(ListAddr);
        ListSerializer := TListSerializer.Create(AProperty^.PropType^.Name);
        try
          Result := ListSerializer.Execute(List);
        finally
          ListSerializer.Free;
        end;
      end;
    end
    else
    begin
      Result := EmptyStr;
    end;
  end;
end;

function TModelListPropertySerializer.IsCompatible(const AProperty: PPropInfo): Boolean;
begin
  Result := (AProperty^.PropType^.Name[1] = 'T') and EndsStr('List', AProperty^.PropType^.Name);
end;

end.

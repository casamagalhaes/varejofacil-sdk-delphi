unit SDK.Service.Carga;

interface

uses
  SDK.Types, SDK.Service, XMLIntf, SDK.XML;

type
  TCargaService = class
  const
      FPath = '/api/v1/pessoa/lojas/%s/cargas';
  public
    class function GetChanges(const ALojaId: TString; ADataAlteracao: TDateTime;
      AEntidade: TString; AClient: IClient): IXMLDocument;
  end;


implementation

uses
  SysUtils, SDK.Exceptions;

{ TCargaService }


{ TCargaService }

class function TCargaService.GetChanges(const ALojaId: TString; ADataAlteracao: TDateTime;
      AEntidade: TString; AClient: IClient): IXMLDocument;
  function ContentType(const ADataAlteracao: TDateTime; const AEntidade: string): string;
  begin
    Result :=
     '<ParamCarga>';
     if ADataalteracao > 0 then     
      Result := Result + '<dataUltimaAlteracao>'+DateTimeToISO8601(ADataAlteracao)+'</dataUltimaAlteracao>';
    Result := Result +
       '<entidades>' +
         '<values>'+AEntidade+'</values>' +
       '</entidades>' +
     '</ParamCarga>';
  end;
var
  Response: IResponse;
begin
  Result := nil;
  Response := AClient.Post(format(FPath,[ALojaId]), ContentType(ADataAlteracao,
     AnsiUpperCase(AEntidade)), nil);

  case Response.Status of
    200:
    begin
      Result := Response.AsXML;
    end;
    404:
    begin
      raise SDKNotFoundException.Create('Entidade  ' + AnsiLowerCase(AEntidade) + ' não encontrado');
    end
    else
    begin
      raise SDKUnknownException.Create(Format('Erro %d - %s', [Response.Status, Response.Content]));
    end;
  end
end;

end.

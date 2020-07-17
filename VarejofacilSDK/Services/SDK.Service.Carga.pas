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
      AEntidades: array of String; AClient: IClient): IXMLDocument; overload;
    class function GetChanges(const ALojaId: TString; ADataAlteracao: TDateTime;
      AEntidade: String; AClient: IClient): IXMLDocument; overload;
    class function GetChanges(const ALojaId: TString; AMarcador: Int64;
      AEntidades: array of String; AClient: IClient): IXMLDocument; overload;
    class function GetLastBookMark(const ALojaId: TString; AClient: IClient): IXMLDocument; overload;
  end;


implementation

uses
  SysUtils, SDK.Exceptions;

{ TCargaService }

class function TCargaService.GetChanges(const ALojaId: TString; ADataAlteracao: TDateTime;
  AEntidades: array of String; AClient: IClient): IXMLDocument;

  function ContentType(const ADataAlteracao: TDateTime; AEntidades: array of String): string;
  var
    I: Integer;
  begin
    Result :=
     '<ParamCarga>';
     if ADataAlteracao > 0 then
      Result := Result + '<dataUltimaAlteracao>'+DateTimeToISO8601(ADataAlteracao)+'</dataUltimaAlteracao>';
    Result := Result +
       '<entidades>';
    for I := 0 to Length(AEntidades) - 1 do
      Result :=
         '<values>' + UpperCase(AEntidades[I]) + '</values>';
    Result := Result +
       '</entidades>' +
     '</ParamCarga>';
  end;

var
  Response: IResponse;
begin
  Result := nil;
  Response := AClient.Post(Format(FPath, [ALojaId]),
    ContentType(ADataAlteracao, AEntidades), nil);
  case Response.Status of
    200:
      Result := Response.AsXML;
    404:
      raise SDKNotFoundException.Create('Carga não disponível');
    426:
      raise SDKLimitExceededException.Create;
    else
      raise SDKUnknownException.Create(Format('Erro %d - %s', [Response.Status, Response.Content]));
  end;
end;

class function TCargaService.GetChanges(const ALojaId: TString;
  AMarcador: Int64; AEntidades: array of String;
  AClient: IClient): IXMLDocument;

  function Body(AMarcador: Int64; AEntidades: array of String): string;
  var
    I: Integer;
  begin
    Result :=
     '<ParamCarga>';
     if AMarcador > 0 then
      Result := Result + '<marcador>'+ IntToStr(AMarcador) + '</marcador>';
    Result := Result +
       '<entidades>';
    for I := 0 to Length(AEntidades) - 1 do
      Result := Result +
         '<values>' + UpperCase(AEntidades[I]) + '</values>';
    Result := Result +
       '</entidades>' +
     '</ParamCarga>';
  end;

var
  Response: IResponse;
begin
  Result := nil;
  Response := AClient.Post(Format(FPath, [ALojaId]), Body(AMarcador, AEntidades), nil);
  case Response.Status of
    200:
      Result := Response.AsXML;
    404:
      raise SDKNotFoundException.Create('Carga não disponível');
    426:
      raise SDKLimitExceededException.Create;
    else
      raise SDKUnknownException.Create(Format('Erro %d - %s', [Response.Status, Response.Content]));
  end
end;

class function TCargaService.GetLastBookMark(const ALojaId: TString;
  AClient: IClient): IXMLDocument;
var
  Response: IResponse;
begin
  Result := nil;
  Response := AClient.Get(Format(FPath + '/ultimo-marcador', [ALojaId]), nil, nil);
  case Response.Status of
    200:
      Result := Response.AsXML;
    404:
      raise SDKNotFoundException.Create('Marcador da carga não disponível');
    426:
      raise SDKLimitExceededException.Create;
    else
      raise SDKUnknownException.Create(Format('Erro %d - %s', [Response.Status, Response.Content]));
  end
  else
    raise Exception.Create('Não foi possível obter o marcador atual de carga');
end;

class function TCargaService.GetChanges(const ALojaId: TString;
  ADataAlteracao: TDateTime; AEntidade: String; AClient: IClient): IXMLDocument;
begin
  Result := GetChanges(ALojaId, ADataAlteracao, [AEntidade], AClient);
end;

end.

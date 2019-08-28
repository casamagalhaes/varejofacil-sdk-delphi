unit SDK.Exceptions;

interface

uses
  SysUtils;

type

  SDKConnectionRefusedException = class(Exception);

  SDKUnprocessableEntityException = class(Exception);

  SDKServerInternalException = class(Exception);

  SDKBadRequestException = class(Exception);

  SDKHTTPProtocolException = class(Exception);

  SDKInvalidSortParamException = class(Exception);

  SDKNotFoundException = class(Exception);

  SDKUnknownException = class(Exception);

  SDKLimitExceededException = class(Exception)
  public
    constructor Create; reintroduce;
  end;

implementation

{ SDKLimitExceededException }

constructor SDKLimitExceededException.Create;
begin
  inherited Create('Limite de consumo a API atingindo');
end;

end.

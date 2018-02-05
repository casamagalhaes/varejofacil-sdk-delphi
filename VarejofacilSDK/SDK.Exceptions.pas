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

implementation

end.

unit SDK.Service.ItemConferenciaLote;

interface

uses
  SDK.Types, SDK.Model.ItemConferencia, SDK.Service, SDK.Exceptions, SDK.XML, XMLIntf, SysUtils, Math;

type

  TItemConferenciaLoteService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Update(const AConferenciaID: TString; const AListItemConferencia: TItemConferenciaList): TServiceCommandResult;
  end;

implementation

uses
  Classes;

{ TItemConferenciaLoteService }

constructor TItemConferenciaLoteService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/compra/conferencias/%s/produtos/lote', AClient);
end;

function TItemConferenciaLoteService.Update(const AConferenciaID: TString; const AListItemConferencia: TItemConferenciaList): TServiceCommandResult;
var
  Response: IResponse;
  FailReasons: TFailReasonList;
  I: Integer;
  BatchRequest: IBatchRequest;
begin
  Result := nil;
  Response := nil;
  if AListItemConferencia.Count > 50 then
    raise Exception.Create('Ultrapassou o limite de 50 registros');
  BatchRequest := TBatchRequest.Create;
  for I := 0 to AListItemConferencia.Count -1 do
    BatchRequest.Add(AListItemConferencia.Items[I]);
  Response := FClient.Post(PathWithDependencies([AConferenciaID]), BatchRequest.AsString, nil);
  if Assigned(Response) then
  begin
    FailReasons := TFailReasonHelper.FromResponse(Response);
    try
      Result := TServiceCommandResult.Create(((Response.Status = 200) or (Response.Status = 201)), FailReasons, InterpretLocation(Response.Headers.Values['Location']));
    finally
      FailReasons.Free;
    end;
  end;
end;

end.


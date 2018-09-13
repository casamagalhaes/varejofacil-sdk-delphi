unit SDK.Service.ItemInventarioLote;

interface

uses
  SDK.Types, SDK.Model.ItemInventario, SDK.Service, SDK.Exceptions, SDK.XML, XMLIntf, SysUtils, Math;

type

  TItemInventarioLoteService = class(TService)
  public
    constructor Create(const AClient: IClient); reintroduce; overload;
    function Update(const AInventarioID: TString; const AListItemInventario: TItemInventarioList): TServiceCommandResult;
  end;

implementation

uses
  Classes;

{ TItemInventarioLoteService }

constructor TItemInventarioLoteService.Create(const AClient: IClient);
begin
  inherited Create('/api/v1/estoque/inventarios/%s/itens/lote', AClient);
end;

function TItemInventarioLoteService.Update(const AInventarioID: TString; const AListItemInventario: TItemInventarioList): TServiceCommandResult;
var
  Response: IResponse;
  FailReasons: TFailReasonList;
  I: Integer;
  BatchRequest: IBatchRequest;
begin
  Result := nil;
  Response := nil;
  if AListItemInventario.Count > 50 then
    raise Exception.Create('Ultrapassou o limite de 50 registros');
  BatchRequest := TBatchRequest.Create;
  for I := 0 to AListItemInventario.Count -1 do
    BatchRequest.Add(AListItemInventario.Items[I]);
  Response := FClient.Post(PathWithDependencies([AInventarioID]), BatchRequest.AsString, nil);
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


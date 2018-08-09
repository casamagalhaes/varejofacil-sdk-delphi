unit SDK.Service.Apuracao;

interface

uses
  Classes, SDK.Types, SDK.Enums, SDK.Model.Apuracao, SDK.Service, SDK.Exceptions, SDK.XML, XMLIntf, SysUtils, Math;

type

  TApuracaoService = class
  private
    FService: TService;
  public
    constructor Create(const AClient: IClient);
    function Get(AImposto: TImpostoApuracao; AOperacao: TOperacaoApuracao; const ALojaArray: TStringArray; const ADataInicial, ADataFinal: TDateTime): TApuracaoListRec;
  end;

implementation

{ TApuracaoService }

constructor TApuracaoService.Create(const AClient: IClient);
begin
  inherited Create;
  FService := TService.Create('/api/v1/fiscal/apuracao/%s/%s', AClient);
end;

function TApuracaoService.Get(AImposto: TImpostoApuracao; AOperacao: TOperacaoApuracao;
const ALojaArray: TStringArray; const ADataInicial, ADataFinal: TDateTime): TApuracaoListRec;

  function FormatJsonArray(const AArray: TStringArray): TString;
  var
    I: Integer;
  begin
    Result := '';
    for I := 0 to Length(AArray) - 1 do
      Result := Result + Format('<loja>%s</loja>', [AArray[I]]);
  end;

var
  Response: IResponse;
  Nodes: TCustomXMLNodeArray;
  NodeIdx: Integer;
  Document: IXMLDocument;
  ApuracaoList: TApuracaoList;
  Apuracao: IApuracao;
  URL, RequestContent: TString;
  InterfacedModel: TInterfacedModel;
begin
  if Length(ALojaArray) = 0 then
    raise Exception.Create('Nenhuma loja especificada na apuração.');
  RequestContent := Format('<ApuracaoQueryParameter><lojas>%s</lojas><periodoInicial>%s</periodoInicial><periodoFinal>%s</periodoFinal></ApuracaoQueryParameter>', [
    FormatJsonArray(ALojaArray),
    FormatDateTime('yyyy-mm-dd', ADataInicial),
    FormatDateTime('yyyy-mm-dd', ADataFinal)
  ]);
  URL := FService.PathWithDependencies([LowerCase(EnumConverters.Execute('TOperacaoApuracao', Ord(AOperacao))), LowerCase(EnumConverters.Execute('TImpostoApuracao', Ord(AImposto)))]);
  Response := FService.Client.Post(URL, RequestContent, nil);
  Document := Response.AsXML;
  Nodes := TXMLHelper.XPathSelect(Document, '//ArrayList/*');
  ApuracaoList := TApuracaoList.Create;
  for NodeIdx := 0 to Length(Nodes) - 1 do
  begin
    InterfacedModel := TXMLHelper.Deserialize(Nodes[NodeIdx], TApuracao, FService.Deserializers);
    if Assigned(InterfacedModel) then
    begin
      InterfacedModel.QueryInterface(IApuracao, Apuracao);
      ApuracaoList.Add(Apuracao);
    end;
  end;
  Result := TApuracaoListRec.Create(ApuracaoList);
end;

end.

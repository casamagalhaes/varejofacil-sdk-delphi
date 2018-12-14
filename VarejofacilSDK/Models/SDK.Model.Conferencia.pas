unit SDK.Model.Conferencia;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type
  IConferencia = interface(IModel)
  ['{EB19E648-48A5-4A97-8EAE-5CAA8BC2C1FE}']
    function GetId: Int64;
    function GetPlaca: TString;
    function GetLojaId: Int64;
    function GetDataDaRecepcao: TDateTime;
    procedure SetId(const AId: Int64);
    procedure SetPlaca(const APlaca: TString);
    procedure SetLojaId(const ALojaId: Int64);
    procedure SetDataDaRecepcao(const AData: TDateTime);
    property Id: Int64 read GetId write SetId;
    property Placa: TString read GetPlaca write SetPlaca;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property DataDaRecepcao: TDateTime read GetDataDaRecepcao write SetDataDaRecepcao;
  end;
  
  TConferenciaList = class;

  IConferenciaList = interface
	['{5CC54225-35FA-4132-AB95-AE68C31AF4E4}']
    function GetReference: TConferenciaList;
    function GetItems(AIndex: Integer): IConferencia;
    procedure SetItems(AIndex: Integer; const Value: IConferencia);
    procedure Add(const AInventario: IConferencia);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IConferencia read GetItems write SetItems; default;
  end;

  TConferenciaListEnumerator = class
  private
    FIndex: Integer;
    FInventarioList: TConferenciaList;
  public
    constructor Create(AInventarioList: TConferenciaList);
    function GetCurrent: IConferencia; inline;
    function MoveNext: Boolean;
    property Current: IConferencia read GetCurrent;
  end;

  TConferenciaList = class(TInterfacedObject, IConferenciaList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IConferencia;
    procedure SetItems(AIndex: Integer; const Value: IConferencia);
  public
    constructor Create;
    procedure Add(const AConferencia: IConferencia);
    destructor Destroy; override;
    function GetEnumerator: TConferenciaListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TConferenciaList;
    property Items[AIndex: Integer]: IConferencia read GetItems write SetItems; default;
  end;

  TConferenciaListRec = record
  private
    FList: IConferenciaList;
  public
    class function Create(const AList: IConferenciaList): TConferenciaListRec; static;
    class operator Implicit(AListRec: TConferenciaListRec): TConferenciaList;
  end;

  TConferencia = class(TInterfacedModel, IConferencia)
  private
    FId: Int64;
    FPlaca: TString;
    FLojaId: Int64;
    FDataDaRecepcao: TDateTime;
    function GetId: Int64;
    function GetPlaca: TString;
    function GetLojaId: Int64;
    function GetDataDaRecepcao: TDateTime;
    procedure SetID(const AId: Int64);
    procedure SetPlaca(const APlaca: TString);
    procedure SetLojaId(const ALojaId: Int64);
    procedure SetDataDaRecepcao(const ADataDaRecepcao: TDateTime);
  published
    property Id: Int64 read GetId write SetID;
    property Placa: TString read GetPlaca write SetPlaca;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property DataDaRecepcao: TDateTime read GetDataDaRecepcao write SetDataDaRecepcao;
  end;

{ TConferencia }
implementation

function TConferencia.GetDataDaRecepcao: TDateTime;
begin
  Result := FDataDaRecepcao;
end;

function TConferencia.GetId: Int64;
begin
  Result := FId;
end;

function TConferencia.GetLojaId: Int64;
begin
  Result := FLojaId;
end;

function TConferencia.GetPlaca: TString;
begin
  Result := FPlaca;
end;

procedure TConferencia.SetDataDaRecepcao(const ADataDaRecepcao: TDateTime);
begin
  FDataDaRecepcao := ADataDaRecepcao;
end;

procedure TConferencia.SetID(const AId: Int64);
begin
  FId := AId;
end;

procedure TConferencia.SetLojaId(const ALojaId: Int64);
begin
  FLojaId := ALojaId;
end;

procedure TConferencia.SetPlaca(const APlaca: TString);
begin
  FPlaca := APlaca;
end;

{ TConferenciaListEnumerator }

constructor TConferenciaListEnumerator.Create(AInventarioList: TConferenciaList);
begin
  inherited Create;
  FIndex := -1;
  FInventarioList := AInventarioList;
end;

function TConferenciaListEnumerator.GetCurrent: IConferencia;
begin
  Result := FInventarioList[FIndex];
end;

function TConferenciaListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FInventarioList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TConferenciaList }

procedure TConferenciaList.Add(const AConferencia: IConferencia);
begin
  FList.Add(AConferencia);
end;

procedure TConferenciaList.Clear;
begin
  FList.Clear;
end;

function TConferenciaList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TConferenciaList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TConferenciaList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TConferenciaList.GetEnumerator: TConferenciaListEnumerator;
begin
  Result := TConferenciaListEnumerator.Create(Self);
end;

function TConferenciaList.GetItems(AIndex: Integer): IConferencia;
begin
  Result := FList[AIndex] as IConferencia;
end;

function TConferenciaList.GetReference: TConferenciaList;
begin
  Result := Self;
end;

procedure TConferenciaList.SetItems(AIndex: Integer; const Value: IConferencia);
begin
  FList[AIndex] := Value;
end;

{ TConferenciaListRec }

class function TConferenciaListRec.Create(
  const AList: IConferenciaList): TConferenciaListRec;
begin
  FillChar(Result, SizeOf(TConferenciaListRec), 0);
  Result.FList := AList;
end;

class operator TConferenciaListRec.Implicit(
  AListRec: TConferenciaListRec): TConferenciaList;
begin
  Result := AListRec.FList.GetReference;
end;

end.

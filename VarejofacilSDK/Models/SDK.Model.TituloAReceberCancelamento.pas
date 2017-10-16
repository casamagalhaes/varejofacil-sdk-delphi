unit SDK.Model.TituloAReceberCancelamento;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ITituloAReceberCancelamento = interface(IModel)
    ['{13358442-C235-422E-8E5C-76CB0ED84282}']
    function GetDataDeCancelamento: TDateTime;
    procedure SetDataDeCancelamento(const ADataDeCancelamento: TDateTime);
    function GetMotivo: TString;
    procedure SetMotivo(const AMotivo: TString);
    function GetContasTitulosIds: TLongList;
    procedure SetContasTitulosIds(const AContasTitulosIds: TLongList);
    property DataDeCancelamento: TDateTime read GetDataDeCancelamento write SetDataDeCancelamento;
    property Motivo: TString read GetMotivo write SetMotivo;
    property ContasTitulosIds: TLongList read GetContasTitulosIds write SetContasTitulosIds;
  end;

  TTituloAReceberCancelamentoList = class;

  ITituloAReceberCancelamentoList = interface
	['{7996239C-6916-4883-84FD-4610014DD84F}']
    function GetReference: TTituloAReceberCancelamentoList;
    function GetItems(AIndex: Integer): ITituloAReceberCancelamento;
    procedure SetItems(AIndex: Integer; const Value: ITituloAReceberCancelamento);
    procedure Add(const ATituloAReceberCancelamento: ITituloAReceberCancelamento);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ITituloAReceberCancelamento read GetItems write SetItems; default;
  end;

  TTituloAReceberCancelamentoListEnumerator = class
  private
    FIndex: Integer;
    FTituloAReceberCancelamentoList: TTituloAReceberCancelamentoList;
  public
    constructor Create(ATituloAReceberCancelamentoList: TTituloAReceberCancelamentoList);
    function GetCurrent: ITituloAReceberCancelamento; inline;
    function MoveNext: Boolean;
    property Current: ITituloAReceberCancelamento read GetCurrent;
  end;

  TTituloAReceberCancelamentoList = class(TInterfacedObject, ITituloAReceberCancelamentoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ITituloAReceberCancelamento;
    procedure SetItems(AIndex: Integer; const Value: ITituloAReceberCancelamento);
  public
    constructor Create;
    procedure Add(const ATituloAReceberCancelamento: ITituloAReceberCancelamento);
    destructor Destroy; override;
    function GetEnumerator: TTituloAReceberCancelamentoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TTituloAReceberCancelamentoList;
    property Items[AIndex: Integer]: ITituloAReceberCancelamento read GetItems write SetItems; default;
  end;

  TTituloAReceberCancelamentoListRec = record
  private
    FList: ITituloAReceberCancelamentoList;
  public
    class function Create(const AList: ITituloAReceberCancelamentoList): TTituloAReceberCancelamentoListRec; static;
    class operator Implicit(AListRec: TTituloAReceberCancelamentoListRec): TTituloAReceberCancelamentoList;
  end;

  TTituloAReceberCancelamento = class(TInterfacedModel, ITituloAReceberCancelamento)
  private
	FDataDeCancelamento: TDateTime;
	FMotivo: TString;
	FContasTitulosIds: TLongList;
    function GetDataDeCancelamento: TDateTime;
    procedure SetDataDeCancelamento(const ADataDeCancelamento: TDateTime);
    function GetMotivo: TString;
    procedure SetMotivo(const AMotivo: TString);
    function GetContasTitulosIds: TLongList;
    procedure SetContasTitulosIds(const AContasTitulosIds: TLongList);
  public
    property DataDeCancelamento: TDateTime read GetDataDeCancelamento write SetDataDeCancelamento;
    property Motivo: TString read GetMotivo write SetMotivo;
    property ContasTitulosIds: TLongList read GetContasTitulosIds write SetContasTitulosIds;
  end;

implementation

{ TTituloAReceberCancelamentoList }

procedure TTituloAReceberCancelamentoList.Add(const ATituloAReceberCancelamento: ITituloAReceberCancelamento);
begin
  FList.Add(ATituloAReceberCancelamento);
end;

procedure TTituloAReceberCancelamentoList.Clear;
begin
  FList.Clear;
end;

function TTituloAReceberCancelamentoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TTituloAReceberCancelamentoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TTituloAReceberCancelamentoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TTituloAReceberCancelamentoList.GetEnumerator: TTituloAReceberCancelamentoListEnumerator;
begin
  Result := TTituloAReceberCancelamentoListEnumerator.Create(Self);
end;

function TTituloAReceberCancelamentoList.GetItems(AIndex: Integer): ITituloAReceberCancelamento;
begin
  Result := FList[AIndex] as ITituloAReceberCancelamento;
end;

function TTituloAReceberCancelamentoList.GetReference: TTituloAReceberCancelamentoList;
begin
  Result := Self;
end;

procedure TTituloAReceberCancelamentoList.SetItems(AIndex: Integer; const Value: ITituloAReceberCancelamento);
begin
  FList[AIndex] := Value;
end;

{ TTituloAReceberCancelamentoListEnumerator }

constructor TTituloAReceberCancelamentoListEnumerator.Create(ATituloAReceberCancelamentoList: TTituloAReceberCancelamentoList);
begin
  inherited Create;
  FIndex := -1;
  FTituloAReceberCancelamentoList := ATituloAReceberCancelamentoList;
end;

function TTituloAReceberCancelamentoListEnumerator.GetCurrent: ITituloAReceberCancelamento;
begin
  Result := FTituloAReceberCancelamentoList[FIndex];
end;

function TTituloAReceberCancelamentoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FTituloAReceberCancelamentoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TTituloAReceberCancelamentoListRec }

class function TTituloAReceberCancelamentoListRec.Create(const AList: ITituloAReceberCancelamentoList): TTituloAReceberCancelamentoListRec;
begin
  FillChar(Result, SizeOf(TTituloAReceberCancelamentoListRec), 0);
  Result.FList := AList;
end;

class operator TTituloAReceberCancelamentoListRec.Implicit(AListRec: TTituloAReceberCancelamentoListRec): TTituloAReceberCancelamentoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TTituloAReceberCancelamento }

function TTituloAReceberCancelamento.GetDataDeCancelamento: TDateTime;
begin
  Result := FDataDeCancelamento;
end;

procedure TTituloAReceberCancelamento.SetDataDeCancelamento(const ADataDeCancelamento: TDateTime);
begin
  FDataDeCancelamento := ADataDeCancelamento;
end;

function TTituloAReceberCancelamento.GetMotivo: TString;
begin
  Result := FMotivo;
end;

procedure TTituloAReceberCancelamento.SetMotivo(const AMotivo: TString);
begin
  FMotivo := AMotivo;
end;

function TTituloAReceberCancelamento.GetContasTitulosIds: TLongList;
begin
  Result := FContasTitulosIds;
end;

procedure TTituloAReceberCancelamento.SetContasTitulosIds(const AContasTitulosIds: TLongList);
begin
  FContasTitulosIds := AContasTitulosIds;
end;


end.
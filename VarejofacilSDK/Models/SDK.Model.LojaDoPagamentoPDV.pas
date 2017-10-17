unit SDK.Model.LojaDoPagamentoPDV;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ILojaDoPagamentoPDV = interface(IModel)
    ['{4EA87003-5E93-4579-B016-E80DA5D1B989}']
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetValorMaximo: Double;
    procedure SetValorMaximo(const AValorMaximo: Double);
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property ValorMaximo: Double read GetValorMaximo write SetValorMaximo;
  end;

  TLojaDoPagamentoPDVList = class;

  ILojaDoPagamentoPDVList = interface
	['{3DACBF95-9786-4374-B21A-56655FD87333}']
    function GetReference: TLojaDoPagamentoPDVList;
    function GetItems(AIndex: Integer): ILojaDoPagamentoPDV;
    procedure SetItems(AIndex: Integer; const Value: ILojaDoPagamentoPDV);
    procedure Add(const ALojaDoPagamentoPDV: ILojaDoPagamentoPDV);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ILojaDoPagamentoPDV read GetItems write SetItems; default;
  end;

  TLojaDoPagamentoPDVListEnumerator = class
  private
    FIndex: Integer;
    FLojaDoPagamentoPDVList: TLojaDoPagamentoPDVList;
  public
    constructor Create(ALojaDoPagamentoPDVList: TLojaDoPagamentoPDVList);
    function GetCurrent: ILojaDoPagamentoPDV; inline;
    function MoveNext: Boolean;
    property Current: ILojaDoPagamentoPDV read GetCurrent;
  end;

  TLojaDoPagamentoPDVList = class(TInterfacedObject, ILojaDoPagamentoPDVList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ILojaDoPagamentoPDV;
    procedure SetItems(AIndex: Integer; const Value: ILojaDoPagamentoPDV);
  public
    constructor Create;
    procedure Add(const ALojaDoPagamentoPDV: ILojaDoPagamentoPDV);
    destructor Destroy; override;
    function GetEnumerator: TLojaDoPagamentoPDVListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TLojaDoPagamentoPDVList;
    property Items[AIndex: Integer]: ILojaDoPagamentoPDV read GetItems write SetItems; default;
  end;

  TLojaDoPagamentoPDVListRec = record
  private
    FList: ILojaDoPagamentoPDVList;
  public
    class function Create(const AList: ILojaDoPagamentoPDVList): TLojaDoPagamentoPDVListRec; static;
    class operator Implicit(AListRec: TLojaDoPagamentoPDVListRec): TLojaDoPagamentoPDVList;
  end;

  TLojaDoPagamentoPDV = class(TInterfacedModel, ILojaDoPagamentoPDV)
  private
	FLojaId: Int64;
	FValorMaximo: Double;
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetValorMaximo: Double;
    procedure SetValorMaximo(const AValorMaximo: Double);
  published
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property ValorMaximo: Double read GetValorMaximo write SetValorMaximo;
  end;

implementation

{ TLojaDoPagamentoPDVList }

procedure TLojaDoPagamentoPDVList.Add(const ALojaDoPagamentoPDV: ILojaDoPagamentoPDV);
begin
  FList.Add(ALojaDoPagamentoPDV);
end;

procedure TLojaDoPagamentoPDVList.Clear;
begin
  FList.Clear;
end;

function TLojaDoPagamentoPDVList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TLojaDoPagamentoPDVList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TLojaDoPagamentoPDVList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TLojaDoPagamentoPDVList.GetEnumerator: TLojaDoPagamentoPDVListEnumerator;
begin
  Result := TLojaDoPagamentoPDVListEnumerator.Create(Self);
end;

function TLojaDoPagamentoPDVList.GetItems(AIndex: Integer): ILojaDoPagamentoPDV;
begin
  Result := FList[AIndex] as ILojaDoPagamentoPDV;
end;

function TLojaDoPagamentoPDVList.GetReference: TLojaDoPagamentoPDVList;
begin
  Result := Self;
end;

procedure TLojaDoPagamentoPDVList.SetItems(AIndex: Integer; const Value: ILojaDoPagamentoPDV);
begin
  FList[AIndex] := Value;
end;

{ TLojaDoPagamentoPDVListEnumerator }

constructor TLojaDoPagamentoPDVListEnumerator.Create(ALojaDoPagamentoPDVList: TLojaDoPagamentoPDVList);
begin
  inherited Create;
  FIndex := -1;
  FLojaDoPagamentoPDVList := ALojaDoPagamentoPDVList;
end;

function TLojaDoPagamentoPDVListEnumerator.GetCurrent: ILojaDoPagamentoPDV;
begin
  Result := FLojaDoPagamentoPDVList[FIndex];
end;

function TLojaDoPagamentoPDVListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FLojaDoPagamentoPDVList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TLojaDoPagamentoPDVListRec }

class function TLojaDoPagamentoPDVListRec.Create(const AList: ILojaDoPagamentoPDVList): TLojaDoPagamentoPDVListRec;
begin
  FillChar(Result, SizeOf(TLojaDoPagamentoPDVListRec), 0);
  Result.FList := AList;
end;

class operator TLojaDoPagamentoPDVListRec.Implicit(AListRec: TLojaDoPagamentoPDVListRec): TLojaDoPagamentoPDVList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TLojaDoPagamentoPDV }

function TLojaDoPagamentoPDV.GetLojaId: Int64;
begin
  Result := FLojaId;
end;

procedure TLojaDoPagamentoPDV.SetLojaId(const ALojaId: Int64);
begin
  FLojaId := ALojaId;
end;

function TLojaDoPagamentoPDV.GetValorMaximo: Double;
begin
  Result := FValorMaximo;
end;

procedure TLojaDoPagamentoPDV.SetValorMaximo(const AValorMaximo: Double);
begin
  FValorMaximo := AValorMaximo;
end;


end.
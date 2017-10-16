unit SDK.Model.LojaDaFormaDePagamento;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ILojaDaFormaDePagamento = interface(IModel)
    ['{366560F8-CCA1-4E5F-ADC5-995255D59AD0}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetContaCorrenteId: Int64;
    procedure SetContaCorrenteId(const AContaCorrenteId: Int64);
    property Id: Int64 read GetId write SetId;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property ContaCorrenteId: Int64 read GetContaCorrenteId write SetContaCorrenteId;
  end;

  TLojaDaFormaDePagamentoList = class;

  ILojaDaFormaDePagamentoList = interface
	['{94EEFC54-7C02-4A5D-AEAB-655C49F5DD0A}']
    function GetReference: TLojaDaFormaDePagamentoList;
    function GetItems(AIndex: Integer): ILojaDaFormaDePagamento;
    procedure SetItems(AIndex: Integer; const Value: ILojaDaFormaDePagamento);
    procedure Add(const ALojaDaFormaDePagamento: ILojaDaFormaDePagamento);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ILojaDaFormaDePagamento read GetItems write SetItems; default;
  end;

  TLojaDaFormaDePagamentoListEnumerator = class
  private
    FIndex: Integer;
    FLojaDaFormaDePagamentoList: TLojaDaFormaDePagamentoList;
  public
    constructor Create(ALojaDaFormaDePagamentoList: TLojaDaFormaDePagamentoList);
    function GetCurrent: ILojaDaFormaDePagamento; inline;
    function MoveNext: Boolean;
    property Current: ILojaDaFormaDePagamento read GetCurrent;
  end;

  TLojaDaFormaDePagamentoList = class(TInterfacedObject, ILojaDaFormaDePagamentoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ILojaDaFormaDePagamento;
    procedure SetItems(AIndex: Integer; const Value: ILojaDaFormaDePagamento);
  public
    constructor Create;
    procedure Add(const ALojaDaFormaDePagamento: ILojaDaFormaDePagamento);
    destructor Destroy; override;
    function GetEnumerator: TLojaDaFormaDePagamentoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TLojaDaFormaDePagamentoList;
    property Items[AIndex: Integer]: ILojaDaFormaDePagamento read GetItems write SetItems; default;
  end;

  TLojaDaFormaDePagamentoListRec = record
  private
    FList: ILojaDaFormaDePagamentoList;
  public
    class function Create(const AList: ILojaDaFormaDePagamentoList): TLojaDaFormaDePagamentoListRec; static;
    class operator Implicit(AListRec: TLojaDaFormaDePagamentoListRec): TLojaDaFormaDePagamentoList;
  end;

  TLojaDaFormaDePagamento = class(TInterfacedModel, ILojaDaFormaDePagamento)
  private
	FId: Int64;
	FLojaId: Int64;
	FContaCorrenteId: Int64;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetContaCorrenteId: Int64;
    procedure SetContaCorrenteId(const AContaCorrenteId: Int64);
  public
    property Id: Int64 read GetId write SetId;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property ContaCorrenteId: Int64 read GetContaCorrenteId write SetContaCorrenteId;
  end;

implementation

{ TLojaDaFormaDePagamentoList }

procedure TLojaDaFormaDePagamentoList.Add(const ALojaDaFormaDePagamento: ILojaDaFormaDePagamento);
begin
  FList.Add(ALojaDaFormaDePagamento);
end;

procedure TLojaDaFormaDePagamentoList.Clear;
begin
  FList.Clear;
end;

function TLojaDaFormaDePagamentoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TLojaDaFormaDePagamentoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TLojaDaFormaDePagamentoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TLojaDaFormaDePagamentoList.GetEnumerator: TLojaDaFormaDePagamentoListEnumerator;
begin
  Result := TLojaDaFormaDePagamentoListEnumerator.Create(Self);
end;

function TLojaDaFormaDePagamentoList.GetItems(AIndex: Integer): ILojaDaFormaDePagamento;
begin
  Result := FList[AIndex] as ILojaDaFormaDePagamento;
end;

function TLojaDaFormaDePagamentoList.GetReference: TLojaDaFormaDePagamentoList;
begin
  Result := Self;
end;

procedure TLojaDaFormaDePagamentoList.SetItems(AIndex: Integer; const Value: ILojaDaFormaDePagamento);
begin
  FList[AIndex] := Value;
end;

{ TLojaDaFormaDePagamentoListEnumerator }

constructor TLojaDaFormaDePagamentoListEnumerator.Create(ALojaDaFormaDePagamentoList: TLojaDaFormaDePagamentoList);
begin
  inherited Create;
  FIndex := -1;
  FLojaDaFormaDePagamentoList := ALojaDaFormaDePagamentoList;
end;

function TLojaDaFormaDePagamentoListEnumerator.GetCurrent: ILojaDaFormaDePagamento;
begin
  Result := FLojaDaFormaDePagamentoList[FIndex];
end;

function TLojaDaFormaDePagamentoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FLojaDaFormaDePagamentoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TLojaDaFormaDePagamentoListRec }

class function TLojaDaFormaDePagamentoListRec.Create(const AList: ILojaDaFormaDePagamentoList): TLojaDaFormaDePagamentoListRec;
begin
  FillChar(Result, SizeOf(TLojaDaFormaDePagamentoListRec), 0);
  Result.FList := AList;
end;

class operator TLojaDaFormaDePagamentoListRec.Implicit(AListRec: TLojaDaFormaDePagamentoListRec): TLojaDaFormaDePagamentoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TLojaDaFormaDePagamento }

function TLojaDaFormaDePagamento.GetId: Int64;
begin
  Result := FId;
end;

procedure TLojaDaFormaDePagamento.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TLojaDaFormaDePagamento.GetLojaId: Int64;
begin
  Result := FLojaId;
end;

procedure TLojaDaFormaDePagamento.SetLojaId(const ALojaId: Int64);
begin
  FLojaId := ALojaId;
end;

function TLojaDaFormaDePagamento.GetContaCorrenteId: Int64;
begin
  Result := FContaCorrenteId;
end;

procedure TLojaDaFormaDePagamento.SetContaCorrenteId(const AContaCorrenteId: Int64);
begin
  FContaCorrenteId := AContaCorrenteId;
end;


end.
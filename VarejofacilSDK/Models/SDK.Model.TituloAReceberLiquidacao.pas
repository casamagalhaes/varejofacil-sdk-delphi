unit SDK.Model.TituloAReceberLiquidacao;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  ITituloAReceberLiquidacao = interface(IModel)
    ['{BDB7C484-9B6D-4DEE-B11C-53FF506C272A}']
    function GetValorMulta: Double;
    procedure SetValorMulta(const AValorMulta: Double);
    function GetValorJuros: Double;
    procedure SetValorJuros(const AValorJuros: Double);
    function GetValorDesconto: Double;
    procedure SetValorDesconto(const AValorDesconto: Double);
    property ValorMulta: Double read GetValorMulta write SetValorMulta;
    property ValorJuros: Double read GetValorJuros write SetValorJuros;
    property ValorDesconto: Double read GetValorDesconto write SetValorDesconto;
  end;

  TTituloAReceberLiquidacaoList = class;

  ITituloAReceberLiquidacaoList = interface
	['{31A006B0-66C3-413F-A7E1-44E1786BC48B}']
    function GetReference: TTituloAReceberLiquidacaoList;
    function GetItems(AIndex: Integer): ITituloAReceberLiquidacao;
    procedure SetItems(AIndex: Integer; const Value: ITituloAReceberLiquidacao);
    procedure Add(const ATituloAReceberLiquidacao: ITituloAReceberLiquidacao);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: ITituloAReceberLiquidacao read GetItems write SetItems; default;
  end;

  TTituloAReceberLiquidacaoListEnumerator = class
  private
    FIndex: Integer;
    FTituloAReceberLiquidacaoList: TTituloAReceberLiquidacaoList;
  public
    constructor Create(ATituloAReceberLiquidacaoList: TTituloAReceberLiquidacaoList);
    function GetCurrent: ITituloAReceberLiquidacao; inline;
    function MoveNext: Boolean;
    property Current: ITituloAReceberLiquidacao read GetCurrent;
  end;

  TTituloAReceberLiquidacaoList = class(TInterfacedObject, ITituloAReceberLiquidacaoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): ITituloAReceberLiquidacao;
    procedure SetItems(AIndex: Integer; const Value: ITituloAReceberLiquidacao);
  public
    constructor Create;
    procedure Add(const ATituloAReceberLiquidacao: ITituloAReceberLiquidacao);
    destructor Destroy; override;
    function GetEnumerator: TTituloAReceberLiquidacaoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TTituloAReceberLiquidacaoList;
    property Items[AIndex: Integer]: ITituloAReceberLiquidacao read GetItems write SetItems; default;
  end;

  TTituloAReceberLiquidacaoListRec = record
  private
    FList: ITituloAReceberLiquidacaoList;
  public
    class function Create(const AList: ITituloAReceberLiquidacaoList): TTituloAReceberLiquidacaoListRec; static;
    class operator Implicit(AListRec: TTituloAReceberLiquidacaoListRec): TTituloAReceberLiquidacaoList;
  end;

  TTituloAReceberLiquidacao = class(TInterfacedModel, ITituloAReceberLiquidacao)
  private
	FValorMulta: Double;
	FValorJuros: Double;
	FValorDesconto: Double;
    function GetValorMulta: Double;
    procedure SetValorMulta(const AValorMulta: Double);
    function GetValorJuros: Double;
    procedure SetValorJuros(const AValorJuros: Double);
    function GetValorDesconto: Double;
    procedure SetValorDesconto(const AValorDesconto: Double);
  published
    property ValorMulta: Double read GetValorMulta write SetValorMulta;
    property ValorJuros: Double read GetValorJuros write SetValorJuros;
    property ValorDesconto: Double read GetValorDesconto write SetValorDesconto;
  end;

implementation

{ TTituloAReceberLiquidacaoList }

procedure TTituloAReceberLiquidacaoList.Add(const ATituloAReceberLiquidacao: ITituloAReceberLiquidacao);
begin
  FList.Add(ATituloAReceberLiquidacao);
end;

procedure TTituloAReceberLiquidacaoList.Clear;
begin
  FList.Clear;
end;

function TTituloAReceberLiquidacaoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TTituloAReceberLiquidacaoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TTituloAReceberLiquidacaoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TTituloAReceberLiquidacaoList.GetEnumerator: TTituloAReceberLiquidacaoListEnumerator;
begin
  Result := TTituloAReceberLiquidacaoListEnumerator.Create(Self);
end;

function TTituloAReceberLiquidacaoList.GetItems(AIndex: Integer): ITituloAReceberLiquidacao;
begin
  Result := FList[AIndex] as ITituloAReceberLiquidacao;
end;

function TTituloAReceberLiquidacaoList.GetReference: TTituloAReceberLiquidacaoList;
begin
  Result := Self;
end;

procedure TTituloAReceberLiquidacaoList.SetItems(AIndex: Integer; const Value: ITituloAReceberLiquidacao);
begin
  FList[AIndex] := Value;
end;

{ TTituloAReceberLiquidacaoListEnumerator }

constructor TTituloAReceberLiquidacaoListEnumerator.Create(ATituloAReceberLiquidacaoList: TTituloAReceberLiquidacaoList);
begin
  inherited Create;
  FIndex := -1;
  FTituloAReceberLiquidacaoList := ATituloAReceberLiquidacaoList;
end;

function TTituloAReceberLiquidacaoListEnumerator.GetCurrent: ITituloAReceberLiquidacao;
begin
  Result := FTituloAReceberLiquidacaoList[FIndex];
end;

function TTituloAReceberLiquidacaoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FTituloAReceberLiquidacaoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TTituloAReceberLiquidacaoListRec }

class function TTituloAReceberLiquidacaoListRec.Create(const AList: ITituloAReceberLiquidacaoList): TTituloAReceberLiquidacaoListRec;
begin
  FillChar(Result, SizeOf(TTituloAReceberLiquidacaoListRec), 0);
  Result.FList := AList;
end;

class operator TTituloAReceberLiquidacaoListRec.Implicit(AListRec: TTituloAReceberLiquidacaoListRec): TTituloAReceberLiquidacaoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TTituloAReceberLiquidacao }

function TTituloAReceberLiquidacao.GetValorMulta: Double;
begin
  Result := FValorMulta;
end;

procedure TTituloAReceberLiquidacao.SetValorMulta(const AValorMulta: Double);
begin
  FValorMulta := AValorMulta;
end;

function TTituloAReceberLiquidacao.GetValorJuros: Double;
begin
  Result := FValorJuros;
end;

procedure TTituloAReceberLiquidacao.SetValorJuros(const AValorJuros: Double);
begin
  FValorJuros := AValorJuros;
end;

function TTituloAReceberLiquidacao.GetValorDesconto: Double;
begin
  Result := FValorDesconto;
end;

procedure TTituloAReceberLiquidacao.SetValorDesconto(const AValorDesconto: Double);
begin
  FValorDesconto := AValorDesconto;
end;


end.
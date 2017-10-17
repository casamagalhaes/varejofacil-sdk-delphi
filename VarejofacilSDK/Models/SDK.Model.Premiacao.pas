unit SDK.Model.Premiacao;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IPremiacao = interface(IModel)
    ['{8D11A32E-2AD3-4D95-A4E8-5721AC06F878}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetFornecedorId: Int64;
    procedure SetFornecedorId(const AFornecedorId: Int64);
    function GetDataInicio: TDateTime;
    procedure SetDataInicio(const ADataInicio: TDateTime);
    function GetDataFinal: TDateTime;
    procedure SetDataFinal(const ADataFinal: TDateTime);
    function GetQuantidade: Integer;
    procedure SetQuantidade(const AQuantidade: Integer);
    function GetChave: TString;
    procedure SetChave(const AChave: TString);
    function GetTipoDePromocao: TTipoPromocao;
    procedure SetTipoDePromocao(const ATipoDePromocao: TTipoPromocao);
    function GetStatus: TString;
    procedure SetStatus(const AStatus: TString);
    function GetValorDoCupom: Double;
    procedure SetValorDoCupom(const AValorDoCupom: Double);
    function GetQuantidadeMaximaPorCupom: Integer;
    procedure SetQuantidadeMaximaPorCupom(const AQuantidadeMaximaPorCupom: Integer);
    function GetMensagem1: TString;
    procedure SetMensagem1(const AMensagem1: TString);
    function GetMensagem2: TString;
    procedure SetMensagem2(const AMensagem2: TString);
    function GetMensagem3: TString;
    procedure SetMensagem3(const AMensagem3: TString);
    function GetAlinhamentoMensagem1: TString;
    procedure SetAlinhamentoMensagem1(const AAlinhamentoMensagem1: TString);
    function GetAlinhamentoMensagem2: TString;
    procedure SetAlinhamentoMensagem2(const AAlinhamentoMensagem2: TString);
    function GetAlinhamentoMensagem3: TString;
    procedure SetAlinhamentoMensagem3(const AAlinhamentoMensagem3: TString);
    function GetTipoImpressao: TString;
    procedure SetTipoImpressao(const ATipoImpressao: TString);
    function GetTexto1: TString;
    procedure SetTexto1(const ATexto1: TString);
    function GetTipoTexto1: TString;
    procedure SetTipoTexto1(const ATipoTexto1: TString);
    function GetTamanhoTexto1: Integer;
    procedure SetTamanhoTexto1(const ATamanhoTexto1: Integer);
    function GetTexto2: TString;
    procedure SetTexto2(const ATexto2: TString);
    function GetTipoTexto2: TString;
    procedure SetTipoTexto2(const ATipoTexto2: TString);
    function GetTamanhoTexto2: Integer;
    procedure SetTamanhoTexto2(const ATamanhoTexto2: Integer);
    function GetTexto3: TString;
    procedure SetTexto3(const ATexto3: TString);
    function GetTipoTexto3: TString;
    procedure SetTipoTexto3(const ATipoTexto3: TString);
    function GetTamanhoTexto3: Integer;
    procedure SetTamanhoTexto3(const ATamanhoTexto3: Integer);
    function GetTexto4: TString;
    procedure SetTexto4(const ATexto4: TString);
    function GetTipoTexto4: TString;
    procedure SetTipoTexto4(const ATipoTexto4: TString);
    function GetTamanhoTexto4: Integer;
    procedure SetTamanhoTexto4(const ATamanhoTexto4: Integer);
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property FornecedorId: Int64 read GetFornecedorId write SetFornecedorId;
    property DataInicio: TDateTime read GetDataInicio write SetDataInicio;
    property DataFinal: TDateTime read GetDataFinal write SetDataFinal;
    property Quantidade: Integer read GetQuantidade write SetQuantidade;
    property Chave: TString read GetChave write SetChave;
    property TipoDePromocao: TTipoPromocao read GetTipoDePromocao write SetTipoDePromocao;
    property Status: TString read GetStatus write SetStatus;
    property ValorDoCupom: Double read GetValorDoCupom write SetValorDoCupom;
    property QuantidadeMaximaPorCupom: Integer read GetQuantidadeMaximaPorCupom write SetQuantidadeMaximaPorCupom;
    property Mensagem1: TString read GetMensagem1 write SetMensagem1;
    property Mensagem2: TString read GetMensagem2 write SetMensagem2;
    property Mensagem3: TString read GetMensagem3 write SetMensagem3;
    property AlinhamentoMensagem1: TString read GetAlinhamentoMensagem1 write SetAlinhamentoMensagem1;
    property AlinhamentoMensagem2: TString read GetAlinhamentoMensagem2 write SetAlinhamentoMensagem2;
    property AlinhamentoMensagem3: TString read GetAlinhamentoMensagem3 write SetAlinhamentoMensagem3;
    property TipoImpressao: TString read GetTipoImpressao write SetTipoImpressao;
    property Texto1: TString read GetTexto1 write SetTexto1;
    property TipoTexto1: TString read GetTipoTexto1 write SetTipoTexto1;
    property TamanhoTexto1: Integer read GetTamanhoTexto1 write SetTamanhoTexto1;
    property Texto2: TString read GetTexto2 write SetTexto2;
    property TipoTexto2: TString read GetTipoTexto2 write SetTipoTexto2;
    property TamanhoTexto2: Integer read GetTamanhoTexto2 write SetTamanhoTexto2;
    property Texto3: TString read GetTexto3 write SetTexto3;
    property TipoTexto3: TString read GetTipoTexto3 write SetTipoTexto3;
    property TamanhoTexto3: Integer read GetTamanhoTexto3 write SetTamanhoTexto3;
    property Texto4: TString read GetTexto4 write SetTexto4;
    property TipoTexto4: TString read GetTipoTexto4 write SetTipoTexto4;
    property TamanhoTexto4: Integer read GetTamanhoTexto4 write SetTamanhoTexto4;
  end;

  TPremiacaoList = class;

  IPremiacaoList = interface
	['{A64660B3-E66C-4E8B-A99D-E0F468ACCA32}']
    function GetReference: TPremiacaoList;
    function GetItems(AIndex: Integer): IPremiacao;
    procedure SetItems(AIndex: Integer; const Value: IPremiacao);
    procedure Add(const APremiacao: IPremiacao);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IPremiacao read GetItems write SetItems; default;
  end;

  TPremiacaoListEnumerator = class
  private
    FIndex: Integer;
    FPremiacaoList: TPremiacaoList;
  public
    constructor Create(APremiacaoList: TPremiacaoList);
    function GetCurrent: IPremiacao; inline;
    function MoveNext: Boolean;
    property Current: IPremiacao read GetCurrent;
  end;

  TPremiacaoList = class(TInterfacedObject, IPremiacaoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IPremiacao;
    procedure SetItems(AIndex: Integer; const Value: IPremiacao);
  public
    constructor Create;
    procedure Add(const APremiacao: IPremiacao);
    destructor Destroy; override;
    function GetEnumerator: TPremiacaoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TPremiacaoList;
    property Items[AIndex: Integer]: IPremiacao read GetItems write SetItems; default;
  end;

  TPremiacaoListRec = record
  private
    FList: IPremiacaoList;
  public
    class function Create(const AList: IPremiacaoList): TPremiacaoListRec; static;
    class operator Implicit(AListRec: TPremiacaoListRec): TPremiacaoList;
  end;

  TPremiacao = class(TInterfacedModel, IPremiacao)
  private
	FId: Int64;
	FDescricao: TString;
	FFornecedorId: Int64;
	FDataInicio: TDateTime;
	FDataFinal: TDateTime;
	FQuantidade: Integer;
	FChave: TString;
	FTipoDePromocao: TTipoPromocao;
	FStatus: TString;
	FValorDoCupom: Double;
	FQuantidadeMaximaPorCupom: Integer;
	FMensagem1: TString;
	FMensagem2: TString;
	FMensagem3: TString;
	FAlinhamentoMensagem1: TString;
	FAlinhamentoMensagem2: TString;
	FAlinhamentoMensagem3: TString;
	FTipoImpressao: TString;
	FTexto1: TString;
	FTipoTexto1: TString;
	FTamanhoTexto1: Integer;
	FTexto2: TString;
	FTipoTexto2: TString;
	FTamanhoTexto2: Integer;
	FTexto3: TString;
	FTipoTexto3: TString;
	FTamanhoTexto3: Integer;
	FTexto4: TString;
	FTipoTexto4: TString;
	FTamanhoTexto4: Integer;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetDescricao: TString;
    procedure SetDescricao(const ADescricao: TString);
    function GetFornecedorId: Int64;
    procedure SetFornecedorId(const AFornecedorId: Int64);
    function GetDataInicio: TDateTime;
    procedure SetDataInicio(const ADataInicio: TDateTime);
    function GetDataFinal: TDateTime;
    procedure SetDataFinal(const ADataFinal: TDateTime);
    function GetQuantidade: Integer;
    procedure SetQuantidade(const AQuantidade: Integer);
    function GetChave: TString;
    procedure SetChave(const AChave: TString);
    function GetTipoDePromocao: TTipoPromocao;
    procedure SetTipoDePromocao(const ATipoDePromocao: TTipoPromocao);
    function GetStatus: TString;
    procedure SetStatus(const AStatus: TString);
    function GetValorDoCupom: Double;
    procedure SetValorDoCupom(const AValorDoCupom: Double);
    function GetQuantidadeMaximaPorCupom: Integer;
    procedure SetQuantidadeMaximaPorCupom(const AQuantidadeMaximaPorCupom: Integer);
    function GetMensagem1: TString;
    procedure SetMensagem1(const AMensagem1: TString);
    function GetMensagem2: TString;
    procedure SetMensagem2(const AMensagem2: TString);
    function GetMensagem3: TString;
    procedure SetMensagem3(const AMensagem3: TString);
    function GetAlinhamentoMensagem1: TString;
    procedure SetAlinhamentoMensagem1(const AAlinhamentoMensagem1: TString);
    function GetAlinhamentoMensagem2: TString;
    procedure SetAlinhamentoMensagem2(const AAlinhamentoMensagem2: TString);
    function GetAlinhamentoMensagem3: TString;
    procedure SetAlinhamentoMensagem3(const AAlinhamentoMensagem3: TString);
    function GetTipoImpressao: TString;
    procedure SetTipoImpressao(const ATipoImpressao: TString);
    function GetTexto1: TString;
    procedure SetTexto1(const ATexto1: TString);
    function GetTipoTexto1: TString;
    procedure SetTipoTexto1(const ATipoTexto1: TString);
    function GetTamanhoTexto1: Integer;
    procedure SetTamanhoTexto1(const ATamanhoTexto1: Integer);
    function GetTexto2: TString;
    procedure SetTexto2(const ATexto2: TString);
    function GetTipoTexto2: TString;
    procedure SetTipoTexto2(const ATipoTexto2: TString);
    function GetTamanhoTexto2: Integer;
    procedure SetTamanhoTexto2(const ATamanhoTexto2: Integer);
    function GetTexto3: TString;
    procedure SetTexto3(const ATexto3: TString);
    function GetTipoTexto3: TString;
    procedure SetTipoTexto3(const ATipoTexto3: TString);
    function GetTamanhoTexto3: Integer;
    procedure SetTamanhoTexto3(const ATamanhoTexto3: Integer);
    function GetTexto4: TString;
    procedure SetTexto4(const ATexto4: TString);
    function GetTipoTexto4: TString;
    procedure SetTipoTexto4(const ATipoTexto4: TString);
    function GetTamanhoTexto4: Integer;
    procedure SetTamanhoTexto4(const ATamanhoTexto4: Integer);
  published
    property Id: Int64 read GetId write SetId;
    property Descricao: TString read GetDescricao write SetDescricao;
    property FornecedorId: Int64 read GetFornecedorId write SetFornecedorId;
    property DataInicio: TDateTime read GetDataInicio write SetDataInicio;
    property DataFinal: TDateTime read GetDataFinal write SetDataFinal;
    property Quantidade: Integer read GetQuantidade write SetQuantidade;
    property Chave: TString read GetChave write SetChave;
    property TipoDePromocao: TTipoPromocao read GetTipoDePromocao write SetTipoDePromocao;
    property Status: TString read GetStatus write SetStatus;
    property ValorDoCupom: Double read GetValorDoCupom write SetValorDoCupom;
    property QuantidadeMaximaPorCupom: Integer read GetQuantidadeMaximaPorCupom write SetQuantidadeMaximaPorCupom;
    property Mensagem1: TString read GetMensagem1 write SetMensagem1;
    property Mensagem2: TString read GetMensagem2 write SetMensagem2;
    property Mensagem3: TString read GetMensagem3 write SetMensagem3;
    property AlinhamentoMensagem1: TString read GetAlinhamentoMensagem1 write SetAlinhamentoMensagem1;
    property AlinhamentoMensagem2: TString read GetAlinhamentoMensagem2 write SetAlinhamentoMensagem2;
    property AlinhamentoMensagem3: TString read GetAlinhamentoMensagem3 write SetAlinhamentoMensagem3;
    property TipoImpressao: TString read GetTipoImpressao write SetTipoImpressao;
    property Texto1: TString read GetTexto1 write SetTexto1;
    property TipoTexto1: TString read GetTipoTexto1 write SetTipoTexto1;
    property TamanhoTexto1: Integer read GetTamanhoTexto1 write SetTamanhoTexto1;
    property Texto2: TString read GetTexto2 write SetTexto2;
    property TipoTexto2: TString read GetTipoTexto2 write SetTipoTexto2;
    property TamanhoTexto2: Integer read GetTamanhoTexto2 write SetTamanhoTexto2;
    property Texto3: TString read GetTexto3 write SetTexto3;
    property TipoTexto3: TString read GetTipoTexto3 write SetTipoTexto3;
    property TamanhoTexto3: Integer read GetTamanhoTexto3 write SetTamanhoTexto3;
    property Texto4: TString read GetTexto4 write SetTexto4;
    property TipoTexto4: TString read GetTipoTexto4 write SetTipoTexto4;
    property TamanhoTexto4: Integer read GetTamanhoTexto4 write SetTamanhoTexto4;
  end;

implementation

{ TPremiacaoList }

procedure TPremiacaoList.Add(const APremiacao: IPremiacao);
begin
  FList.Add(APremiacao);
end;

procedure TPremiacaoList.Clear;
begin
  FList.Clear;
end;

function TPremiacaoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TPremiacaoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TPremiacaoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TPremiacaoList.GetEnumerator: TPremiacaoListEnumerator;
begin
  Result := TPremiacaoListEnumerator.Create(Self);
end;

function TPremiacaoList.GetItems(AIndex: Integer): IPremiacao;
begin
  Result := FList[AIndex] as IPremiacao;
end;

function TPremiacaoList.GetReference: TPremiacaoList;
begin
  Result := Self;
end;

procedure TPremiacaoList.SetItems(AIndex: Integer; const Value: IPremiacao);
begin
  FList[AIndex] := Value;
end;

{ TPremiacaoListEnumerator }

constructor TPremiacaoListEnumerator.Create(APremiacaoList: TPremiacaoList);
begin
  inherited Create;
  FIndex := -1;
  FPremiacaoList := APremiacaoList;
end;

function TPremiacaoListEnumerator.GetCurrent: IPremiacao;
begin
  Result := FPremiacaoList[FIndex];
end;

function TPremiacaoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FPremiacaoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TPremiacaoListRec }

class function TPremiacaoListRec.Create(const AList: IPremiacaoList): TPremiacaoListRec;
begin
  FillChar(Result, SizeOf(TPremiacaoListRec), 0);
  Result.FList := AList;
end;

class operator TPremiacaoListRec.Implicit(AListRec: TPremiacaoListRec): TPremiacaoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TPremiacao }

function TPremiacao.GetId: Int64;
begin
  Result := FId;
end;

procedure TPremiacao.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TPremiacao.GetDescricao: TString;
begin
  Result := FDescricao;
end;

procedure TPremiacao.SetDescricao(const ADescricao: TString);
begin
  FDescricao := ADescricao;
end;

function TPremiacao.GetFornecedorId: Int64;
begin
  Result := FFornecedorId;
end;

procedure TPremiacao.SetFornecedorId(const AFornecedorId: Int64);
begin
  FFornecedorId := AFornecedorId;
end;

function TPremiacao.GetDataInicio: TDateTime;
begin
  Result := FDataInicio;
end;

procedure TPremiacao.SetDataInicio(const ADataInicio: TDateTime);
begin
  FDataInicio := ADataInicio;
end;

function TPremiacao.GetDataFinal: TDateTime;
begin
  Result := FDataFinal;
end;

procedure TPremiacao.SetDataFinal(const ADataFinal: TDateTime);
begin
  FDataFinal := ADataFinal;
end;

function TPremiacao.GetQuantidade: Integer;
begin
  Result := FQuantidade;
end;

procedure TPremiacao.SetQuantidade(const AQuantidade: Integer);
begin
  FQuantidade := AQuantidade;
end;

function TPremiacao.GetChave: TString;
begin
  Result := FChave;
end;

procedure TPremiacao.SetChave(const AChave: TString);
begin
  FChave := AChave;
end;

function TPremiacao.GetTipoDePromocao: TTipoPromocao;
begin
  Result := FTipoDePromocao;
end;

procedure TPremiacao.SetTipoDePromocao(const ATipoDePromocao: TTipoPromocao);
begin
  FTipoDePromocao := ATipoDePromocao;
end;

function TPremiacao.GetStatus: TString;
begin
  Result := FStatus;
end;

procedure TPremiacao.SetStatus(const AStatus: TString);
begin
  FStatus := AStatus;
end;

function TPremiacao.GetValorDoCupom: Double;
begin
  Result := FValorDoCupom;
end;

procedure TPremiacao.SetValorDoCupom(const AValorDoCupom: Double);
begin
  FValorDoCupom := AValorDoCupom;
end;

function TPremiacao.GetQuantidadeMaximaPorCupom: Integer;
begin
  Result := FQuantidadeMaximaPorCupom;
end;

procedure TPremiacao.SetQuantidadeMaximaPorCupom(const AQuantidadeMaximaPorCupom: Integer);
begin
  FQuantidadeMaximaPorCupom := AQuantidadeMaximaPorCupom;
end;

function TPremiacao.GetMensagem1: TString;
begin
  Result := FMensagem1;
end;

procedure TPremiacao.SetMensagem1(const AMensagem1: TString);
begin
  FMensagem1 := AMensagem1;
end;

function TPremiacao.GetMensagem2: TString;
begin
  Result := FMensagem2;
end;

procedure TPremiacao.SetMensagem2(const AMensagem2: TString);
begin
  FMensagem2 := AMensagem2;
end;

function TPremiacao.GetMensagem3: TString;
begin
  Result := FMensagem3;
end;

procedure TPremiacao.SetMensagem3(const AMensagem3: TString);
begin
  FMensagem3 := AMensagem3;
end;

function TPremiacao.GetAlinhamentoMensagem1: TString;
begin
  Result := FAlinhamentoMensagem1;
end;

procedure TPremiacao.SetAlinhamentoMensagem1(const AAlinhamentoMensagem1: TString);
begin
  FAlinhamentoMensagem1 := AAlinhamentoMensagem1;
end;

function TPremiacao.GetAlinhamentoMensagem2: TString;
begin
  Result := FAlinhamentoMensagem2;
end;

procedure TPremiacao.SetAlinhamentoMensagem2(const AAlinhamentoMensagem2: TString);
begin
  FAlinhamentoMensagem2 := AAlinhamentoMensagem2;
end;

function TPremiacao.GetAlinhamentoMensagem3: TString;
begin
  Result := FAlinhamentoMensagem3;
end;

procedure TPremiacao.SetAlinhamentoMensagem3(const AAlinhamentoMensagem3: TString);
begin
  FAlinhamentoMensagem3 := AAlinhamentoMensagem3;
end;

function TPremiacao.GetTipoImpressao: TString;
begin
  Result := FTipoImpressao;
end;

procedure TPremiacao.SetTipoImpressao(const ATipoImpressao: TString);
begin
  FTipoImpressao := ATipoImpressao;
end;

function TPremiacao.GetTexto1: TString;
begin
  Result := FTexto1;
end;

procedure TPremiacao.SetTexto1(const ATexto1: TString);
begin
  FTexto1 := ATexto1;
end;

function TPremiacao.GetTipoTexto1: TString;
begin
  Result := FTipoTexto1;
end;

procedure TPremiacao.SetTipoTexto1(const ATipoTexto1: TString);
begin
  FTipoTexto1 := ATipoTexto1;
end;

function TPremiacao.GetTamanhoTexto1: Integer;
begin
  Result := FTamanhoTexto1;
end;

procedure TPremiacao.SetTamanhoTexto1(const ATamanhoTexto1: Integer);
begin
  FTamanhoTexto1 := ATamanhoTexto1;
end;

function TPremiacao.GetTexto2: TString;
begin
  Result := FTexto2;
end;

procedure TPremiacao.SetTexto2(const ATexto2: TString);
begin
  FTexto2 := ATexto2;
end;

function TPremiacao.GetTipoTexto2: TString;
begin
  Result := FTipoTexto2;
end;

procedure TPremiacao.SetTipoTexto2(const ATipoTexto2: TString);
begin
  FTipoTexto2 := ATipoTexto2;
end;

function TPremiacao.GetTamanhoTexto2: Integer;
begin
  Result := FTamanhoTexto2;
end;

procedure TPremiacao.SetTamanhoTexto2(const ATamanhoTexto2: Integer);
begin
  FTamanhoTexto2 := ATamanhoTexto2;
end;

function TPremiacao.GetTexto3: TString;
begin
  Result := FTexto3;
end;

procedure TPremiacao.SetTexto3(const ATexto3: TString);
begin
  FTexto3 := ATexto3;
end;

function TPremiacao.GetTipoTexto3: TString;
begin
  Result := FTipoTexto3;
end;

procedure TPremiacao.SetTipoTexto3(const ATipoTexto3: TString);
begin
  FTipoTexto3 := ATipoTexto3;
end;

function TPremiacao.GetTamanhoTexto3: Integer;
begin
  Result := FTamanhoTexto3;
end;

procedure TPremiacao.SetTamanhoTexto3(const ATamanhoTexto3: Integer);
begin
  FTamanhoTexto3 := ATamanhoTexto3;
end;

function TPremiacao.GetTexto4: TString;
begin
  Result := FTexto4;
end;

procedure TPremiacao.SetTexto4(const ATexto4: TString);
begin
  FTexto4 := ATexto4;
end;

function TPremiacao.GetTipoTexto4: TString;
begin
  Result := FTipoTexto4;
end;

procedure TPremiacao.SetTipoTexto4(const ATipoTexto4: TString);
begin
  FTipoTexto4 := ATipoTexto4;
end;

function TPremiacao.GetTamanhoTexto4: Integer;
begin
  Result := FTamanhoTexto4;
end;

procedure TPremiacao.SetTamanhoTexto4(const ATamanhoTexto4: Integer);
begin
  FTamanhoTexto4 := ATamanhoTexto4;
end;


end.
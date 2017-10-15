unit SDK.Model.Reducao;

interface

uses
  SysUtils, Classes, SDK.Types, SDK.Enums;

type

  IReducao = interface(IModel)
    ['{9E459249-2504-40DF-BE96-0FC727B331EE}']
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetData: TDateTime;
    procedure SetData(const AData: TDateTime);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetSerieEquipamento: TString;
    procedure SetSerieEquipamento(const ASerieEquipamento: TString);
    function GetContadorCupomInicial: TString;
    procedure SetContadorCupomInicial(const AContadorCupomInicial: TString);
    function GetContadorCupomFinal: TString;
    procedure SetContadorCupomFinal(const AContadorCupomFinal: TString);
    function GetPercentualLivreDaMFD: Double;
    procedure SetPercentualLivreDaMFD(const APercentualLivreDaMFD: Double);
    function GetNumeroEcf: TString;
    procedure SetNumeroEcf(const ANumeroEcf: TString);
    function GetContadorOrdemOperacao: TString;
    procedure SetContadorOrdemOperacao(const AContadorOrdemOperacao: TString);
    function GetContadorOrdemOperacaoInicial: TString;
    procedure SetContadorOrdemOperacaoInicial(const AContadorOrdemOperacaoInicial: TString);
    function GetContadorReducao: TString;
    procedure SetContadorReducao(const AContadorReducao: TString);
    function GetContadorReinicioOperacao: TString;
    procedure SetContadorReinicioOperacao(const AContadorReinicioOperacao: TString);
    function GetGtInicial: Double;
    procedure SetGtInicial(const AGtInicial: Double);
    function GetFtFinal: Double;
    procedure SetFtFinal(const AFtFinal: Double);
    function GetVendaBruta: Double;
    procedure SetVendaBruta(const AVendaBruta: Double);
    function GetTotalCancelamento: Double;
    procedure SetTotalCancelamento(const ATotalCancelamento: Double);
    function GetTotalDesconto: Double;
    procedure SetTotalDesconto(const ATotalDesconto: Double);
    function GetVendaLiquida: Double;
    procedure SetVendaLiquida(const AVendaLiquida: Double);
    function GetValorBaseSubstituicao: Double;
    procedure SetValorBaseSubstituicao(const AValorBaseSubstituicao: Double);
    function GetValorBaseIsenta: Double;
    procedure SetValorBaseIsenta(const AValorBaseIsenta: Double);
    function GetValorBaseNaoTributada: Double;
    procedure SetValorBaseNaoTributada(const AValorBaseNaoTributada: Double);
    function GetValorBaseServico: Double;
    procedure SetValorBaseServico(const AValorBaseServico: Double);
    function GetAliquota1: Double;
    procedure SetAliquota1(const AAliquota1: Double);
    function GetValorBase1: Double;
    procedure SetValorBase1(const AValorBase1: Double);
    function GetValorImposto1: Double;
    procedure SetValorImposto1(const AValorImposto1: Double);
    function GetAliquota2: Double;
    procedure SetAliquota2(const AAliquota2: Double);
    function GetValorBase2: Double;
    procedure SetValorBase2(const AValorBase2: Double);
    function GetValorImposto2: Double;
    procedure SetValorImposto2(const AValorImposto2: Double);
    function GetAliquota3: Double;
    procedure SetAliquota3(const AAliquota3: Double);
    function GetValorBase3: Double;
    procedure SetValorBase3(const AValorBase3: Double);
    function GetValorImposto3: Double;
    procedure SetValorImposto3(const AValorImposto3: Double);
    function GetAliquota4: Double;
    procedure SetAliquota4(const AAliquota4: Double);
    function GetValorBase4: Double;
    procedure SetValorBase4(const AValorBase4: Double);
    function GetValorImposto4: Double;
    procedure SetValorImposto4(const AValorImposto4: Double);
    function GetAliquota5: Double;
    procedure SetAliquota5(const AAliquota5: Double);
    function GetValorBase5: Double;
    procedure SetValorBase5(const AValorBase5: Double);
    function GetValorImposto5: Double;
    procedure SetValorImposto5(const AValorImposto5: Double);
    function GetAliquota6: Double;
    procedure SetAliquota6(const AAliquota6: Double);
    function GetValorBase6: Double;
    procedure SetValorBase6(const AValorBase6: Double);
    function GetValorImposto6: Double;
    procedure SetValorImposto6(const AValorImposto6: Double);
    function GetAliquota7: Double;
    procedure SetAliquota7(const AAliquota7: Double);
    function GetValorBase7: Double;
    procedure SetValorBase7(const AValorBase7: Double);
    function GetValorImposto7: Double;
    procedure SetValorImposto7(const AValorImposto7: Double);
    function GetAliquota8: Double;
    procedure SetAliquota8(const AAliquota8: Double);
    function GetValorBase8: Double;
    procedure SetValorBase8(const AValorBase8: Double);
    function GetValorImposto8: Double;
    procedure SetValorImposto8(const AValorImposto8: Double);
    function GetAliquota9: Double;
    procedure SetAliquota9(const AAliquota9: Double);
    function GetValorBase9: Double;
    procedure SetValorBase9(const AValorBase9: Double);
    function GetValorImposto9: Double;
    procedure SetValorImposto9(const AValorImposto9: Double);
    function GetAliquota10: Double;
    procedure SetAliquota10(const AAliquota10: Double);
    function GetValorBase10: Double;
    procedure SetValorBase10(const AValorBase10: Double);
    function GetValorImposto10: Double;
    procedure SetValorImposto10(const AValorImposto10: Double);
    function GetIssAliquota1: Double;
    procedure SetIssAliquota1(const AIssAliquota1: Double);
    function GetIssValorBase1: Double;
    procedure SetIssValorBase1(const AIssValorBase1: Double);
    function GetIssValorImposto1: Double;
    procedure SetIssValorImposto1(const AIssValorImposto1: Double);
    function GetIssAliquota2: Double;
    procedure SetIssAliquota2(const AIssAliquota2: Double);
    function GetIssValorBase2: Double;
    procedure SetIssValorBase2(const AIssValorBase2: Double);
    function GetIssValorImposto2: Double;
    procedure SetIssValorImposto2(const AIssValorImposto2: Double);
    function GetIssAliquota3: Double;
    procedure SetIssAliquota3(const AIssAliquota3: Double);
    function GetIssValorBase3: Double;
    procedure SetIssValorBase3(const AIssValorBase3: Double);
    function GetIssValorImposto3: Double;
    procedure SetIssValorImposto3(const AIssValorImposto3: Double);
    function GetIssAliquota4: Double;
    procedure SetIssAliquota4(const AIssAliquota4: Double);
    function GetIssValorBase4: Double;
    procedure SetIssValorBase4(const AIssValorBase4: Double);
    function GetIssValorImposto4: Double;
    procedure SetIssValorImposto4(const AIssValorImposto4: Double);
    property Id: Int64 read GetId write SetId;
    property Data: TDateTime read GetData write SetData;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property SerieEquipamento: TString read GetSerieEquipamento write SetSerieEquipamento;
    property ContadorCupomInicial: TString read GetContadorCupomInicial write SetContadorCupomInicial;
    property ContadorCupomFinal: TString read GetContadorCupomFinal write SetContadorCupomFinal;
    property PercentualLivreDaMFD: Double read GetPercentualLivreDaMFD write SetPercentualLivreDaMFD;
    property NumeroEcf: TString read GetNumeroEcf write SetNumeroEcf;
    property ContadorOrdemOperacao: TString read GetContadorOrdemOperacao write SetContadorOrdemOperacao;
    property ContadorOrdemOperacaoInicial: TString read GetContadorOrdemOperacaoInicial write SetContadorOrdemOperacaoInicial;
    property ContadorReducao: TString read GetContadorReducao write SetContadorReducao;
    property ContadorReinicioOperacao: TString read GetContadorReinicioOperacao write SetContadorReinicioOperacao;
    property GtInicial: Double read GetGtInicial write SetGtInicial;
    property FtFinal: Double read GetFtFinal write SetFtFinal;
    property VendaBruta: Double read GetVendaBruta write SetVendaBruta;
    property TotalCancelamento: Double read GetTotalCancelamento write SetTotalCancelamento;
    property TotalDesconto: Double read GetTotalDesconto write SetTotalDesconto;
    property VendaLiquida: Double read GetVendaLiquida write SetVendaLiquida;
    property ValorBaseSubstituicao: Double read GetValorBaseSubstituicao write SetValorBaseSubstituicao;
    property ValorBaseIsenta: Double read GetValorBaseIsenta write SetValorBaseIsenta;
    property ValorBaseNaoTributada: Double read GetValorBaseNaoTributada write SetValorBaseNaoTributada;
    property ValorBaseServico: Double read GetValorBaseServico write SetValorBaseServico;
    property Aliquota1: Double read GetAliquota1 write SetAliquota1;
    property ValorBase1: Double read GetValorBase1 write SetValorBase1;
    property ValorImposto1: Double read GetValorImposto1 write SetValorImposto1;
    property Aliquota2: Double read GetAliquota2 write SetAliquota2;
    property ValorBase2: Double read GetValorBase2 write SetValorBase2;
    property ValorImposto2: Double read GetValorImposto2 write SetValorImposto2;
    property Aliquota3: Double read GetAliquota3 write SetAliquota3;
    property ValorBase3: Double read GetValorBase3 write SetValorBase3;
    property ValorImposto3: Double read GetValorImposto3 write SetValorImposto3;
    property Aliquota4: Double read GetAliquota4 write SetAliquota4;
    property ValorBase4: Double read GetValorBase4 write SetValorBase4;
    property ValorImposto4: Double read GetValorImposto4 write SetValorImposto4;
    property Aliquota5: Double read GetAliquota5 write SetAliquota5;
    property ValorBase5: Double read GetValorBase5 write SetValorBase5;
    property ValorImposto5: Double read GetValorImposto5 write SetValorImposto5;
    property Aliquota6: Double read GetAliquota6 write SetAliquota6;
    property ValorBase6: Double read GetValorBase6 write SetValorBase6;
    property ValorImposto6: Double read GetValorImposto6 write SetValorImposto6;
    property Aliquota7: Double read GetAliquota7 write SetAliquota7;
    property ValorBase7: Double read GetValorBase7 write SetValorBase7;
    property ValorImposto7: Double read GetValorImposto7 write SetValorImposto7;
    property Aliquota8: Double read GetAliquota8 write SetAliquota8;
    property ValorBase8: Double read GetValorBase8 write SetValorBase8;
    property ValorImposto8: Double read GetValorImposto8 write SetValorImposto8;
    property Aliquota9: Double read GetAliquota9 write SetAliquota9;
    property ValorBase9: Double read GetValorBase9 write SetValorBase9;
    property ValorImposto9: Double read GetValorImposto9 write SetValorImposto9;
    property Aliquota10: Double read GetAliquota10 write SetAliquota10;
    property ValorBase10: Double read GetValorBase10 write SetValorBase10;
    property ValorImposto10: Double read GetValorImposto10 write SetValorImposto10;
    property IssAliquota1: Double read GetIssAliquota1 write SetIssAliquota1;
    property IssValorBase1: Double read GetIssValorBase1 write SetIssValorBase1;
    property IssValorImposto1: Double read GetIssValorImposto1 write SetIssValorImposto1;
    property IssAliquota2: Double read GetIssAliquota2 write SetIssAliquota2;
    property IssValorBase2: Double read GetIssValorBase2 write SetIssValorBase2;
    property IssValorImposto2: Double read GetIssValorImposto2 write SetIssValorImposto2;
    property IssAliquota3: Double read GetIssAliquota3 write SetIssAliquota3;
    property IssValorBase3: Double read GetIssValorBase3 write SetIssValorBase3;
    property IssValorImposto3: Double read GetIssValorImposto3 write SetIssValorImposto3;
    property IssAliquota4: Double read GetIssAliquota4 write SetIssAliquota4;
    property IssValorBase4: Double read GetIssValorBase4 write SetIssValorBase4;
    property IssValorImposto4: Double read GetIssValorImposto4 write SetIssValorImposto4;
  end;

  TReducaoList = class;

  IReducaoList = interface
	['{F3BDCA01-6531-46A1-8732-5E6A3E6817D7}']
    function GetReference: TReducaoList;
    function GetItems(AIndex: Integer): IReducao;
    procedure SetItems(AIndex: Integer; const Value: IReducao);
    procedure Add(const AReducao: IReducao);
    procedure Clear;
    function Count: Integer;
    property Items[AIndex: Integer]: IReducao read GetItems write SetItems; default;
  end;

  TReducaoListEnumerator = class
  private
    FIndex: Integer;
    FReducaoList: TReducaoList;
  public
    constructor Create(AReducaoList: TReducaoList);
    function GetCurrent: IReducao; inline;
    function MoveNext: Boolean;
    property Current: IReducao read GetCurrent;
  end;

  TReducaoList = class(TInterfacedObject, IReducaoList)
  private
    FList: TInterfaceList;
    function GetItems(AIndex: Integer): IReducao;
    procedure SetItems(AIndex: Integer; const Value: IReducao);
  public
    constructor Create;
    procedure Add(const AReducao: IReducao);
    destructor Destroy; override;
    function GetEnumerator: TReducaoListEnumerator;
    procedure Clear;
    function Count: Integer;
    function GetReference: TReducaoList;
    property Items[AIndex: Integer]: IReducao read GetItems write SetItems; default;
  end;

  TReducaoListRec = record
  private
    FList: IReducaoList;
  public
    class function Create(const AList: IReducaoList): TReducaoListRec; static;
    class operator Implicit(AListRec: TReducaoListRec): TReducaoList;
  end;

  TReducao = class(TInterfacedObject, IReducao)
  private
	FId: Int64;
	FData: TDateTime;
	FLojaId: Int64;
	FSerieEquipamento: TString;
	FContadorCupomInicial: TString;
	FContadorCupomFinal: TString;
	FPercentualLivreDaMFD: Double;
	FNumeroEcf: TString;
	FContadorOrdemOperacao: TString;
	FContadorOrdemOperacaoInicial: TString;
	FContadorReducao: TString;
	FContadorReinicioOperacao: TString;
	FGtInicial: Double;
	FFtFinal: Double;
	FVendaBruta: Double;
	FTotalCancelamento: Double;
	FTotalDesconto: Double;
	FVendaLiquida: Double;
	FValorBaseSubstituicao: Double;
	FValorBaseIsenta: Double;
	FValorBaseNaoTributada: Double;
	FValorBaseServico: Double;
	FAliquota1: Double;
	FValorBase1: Double;
	FValorImposto1: Double;
	FAliquota2: Double;
	FValorBase2: Double;
	FValorImposto2: Double;
	FAliquota3: Double;
	FValorBase3: Double;
	FValorImposto3: Double;
	FAliquota4: Double;
	FValorBase4: Double;
	FValorImposto4: Double;
	FAliquota5: Double;
	FValorBase5: Double;
	FValorImposto5: Double;
	FAliquota6: Double;
	FValorBase6: Double;
	FValorImposto6: Double;
	FAliquota7: Double;
	FValorBase7: Double;
	FValorImposto7: Double;
	FAliquota8: Double;
	FValorBase8: Double;
	FValorImposto8: Double;
	FAliquota9: Double;
	FValorBase9: Double;
	FValorImposto9: Double;
	FAliquota10: Double;
	FValorBase10: Double;
	FValorImposto10: Double;
	FIssAliquota1: Double;
	FIssValorBase1: Double;
	FIssValorImposto1: Double;
	FIssAliquota2: Double;
	FIssValorBase2: Double;
	FIssValorImposto2: Double;
	FIssAliquota3: Double;
	FIssValorBase3: Double;
	FIssValorImposto3: Double;
	FIssAliquota4: Double;
	FIssValorBase4: Double;
	FIssValorImposto4: Double;
    function GetId: Int64;
    procedure SetId(const AId: Int64);
    function GetData: TDateTime;
    procedure SetData(const AData: TDateTime);
    function GetLojaId: Int64;
    procedure SetLojaId(const ALojaId: Int64);
    function GetSerieEquipamento: TString;
    procedure SetSerieEquipamento(const ASerieEquipamento: TString);
    function GetContadorCupomInicial: TString;
    procedure SetContadorCupomInicial(const AContadorCupomInicial: TString);
    function GetContadorCupomFinal: TString;
    procedure SetContadorCupomFinal(const AContadorCupomFinal: TString);
    function GetPercentualLivreDaMFD: Double;
    procedure SetPercentualLivreDaMFD(const APercentualLivreDaMFD: Double);
    function GetNumeroEcf: TString;
    procedure SetNumeroEcf(const ANumeroEcf: TString);
    function GetContadorOrdemOperacao: TString;
    procedure SetContadorOrdemOperacao(const AContadorOrdemOperacao: TString);
    function GetContadorOrdemOperacaoInicial: TString;
    procedure SetContadorOrdemOperacaoInicial(const AContadorOrdemOperacaoInicial: TString);
    function GetContadorReducao: TString;
    procedure SetContadorReducao(const AContadorReducao: TString);
    function GetContadorReinicioOperacao: TString;
    procedure SetContadorReinicioOperacao(const AContadorReinicioOperacao: TString);
    function GetGtInicial: Double;
    procedure SetGtInicial(const AGtInicial: Double);
    function GetFtFinal: Double;
    procedure SetFtFinal(const AFtFinal: Double);
    function GetVendaBruta: Double;
    procedure SetVendaBruta(const AVendaBruta: Double);
    function GetTotalCancelamento: Double;
    procedure SetTotalCancelamento(const ATotalCancelamento: Double);
    function GetTotalDesconto: Double;
    procedure SetTotalDesconto(const ATotalDesconto: Double);
    function GetVendaLiquida: Double;
    procedure SetVendaLiquida(const AVendaLiquida: Double);
    function GetValorBaseSubstituicao: Double;
    procedure SetValorBaseSubstituicao(const AValorBaseSubstituicao: Double);
    function GetValorBaseIsenta: Double;
    procedure SetValorBaseIsenta(const AValorBaseIsenta: Double);
    function GetValorBaseNaoTributada: Double;
    procedure SetValorBaseNaoTributada(const AValorBaseNaoTributada: Double);
    function GetValorBaseServico: Double;
    procedure SetValorBaseServico(const AValorBaseServico: Double);
    function GetAliquota1: Double;
    procedure SetAliquota1(const AAliquota1: Double);
    function GetValorBase1: Double;
    procedure SetValorBase1(const AValorBase1: Double);
    function GetValorImposto1: Double;
    procedure SetValorImposto1(const AValorImposto1: Double);
    function GetAliquota2: Double;
    procedure SetAliquota2(const AAliquota2: Double);
    function GetValorBase2: Double;
    procedure SetValorBase2(const AValorBase2: Double);
    function GetValorImposto2: Double;
    procedure SetValorImposto2(const AValorImposto2: Double);
    function GetAliquota3: Double;
    procedure SetAliquota3(const AAliquota3: Double);
    function GetValorBase3: Double;
    procedure SetValorBase3(const AValorBase3: Double);
    function GetValorImposto3: Double;
    procedure SetValorImposto3(const AValorImposto3: Double);
    function GetAliquota4: Double;
    procedure SetAliquota4(const AAliquota4: Double);
    function GetValorBase4: Double;
    procedure SetValorBase4(const AValorBase4: Double);
    function GetValorImposto4: Double;
    procedure SetValorImposto4(const AValorImposto4: Double);
    function GetAliquota5: Double;
    procedure SetAliquota5(const AAliquota5: Double);
    function GetValorBase5: Double;
    procedure SetValorBase5(const AValorBase5: Double);
    function GetValorImposto5: Double;
    procedure SetValorImposto5(const AValorImposto5: Double);
    function GetAliquota6: Double;
    procedure SetAliquota6(const AAliquota6: Double);
    function GetValorBase6: Double;
    procedure SetValorBase6(const AValorBase6: Double);
    function GetValorImposto6: Double;
    procedure SetValorImposto6(const AValorImposto6: Double);
    function GetAliquota7: Double;
    procedure SetAliquota7(const AAliquota7: Double);
    function GetValorBase7: Double;
    procedure SetValorBase7(const AValorBase7: Double);
    function GetValorImposto7: Double;
    procedure SetValorImposto7(const AValorImposto7: Double);
    function GetAliquota8: Double;
    procedure SetAliquota8(const AAliquota8: Double);
    function GetValorBase8: Double;
    procedure SetValorBase8(const AValorBase8: Double);
    function GetValorImposto8: Double;
    procedure SetValorImposto8(const AValorImposto8: Double);
    function GetAliquota9: Double;
    procedure SetAliquota9(const AAliquota9: Double);
    function GetValorBase9: Double;
    procedure SetValorBase9(const AValorBase9: Double);
    function GetValorImposto9: Double;
    procedure SetValorImposto9(const AValorImposto9: Double);
    function GetAliquota10: Double;
    procedure SetAliquota10(const AAliquota10: Double);
    function GetValorBase10: Double;
    procedure SetValorBase10(const AValorBase10: Double);
    function GetValorImposto10: Double;
    procedure SetValorImposto10(const AValorImposto10: Double);
    function GetIssAliquota1: Double;
    procedure SetIssAliquota1(const AIssAliquota1: Double);
    function GetIssValorBase1: Double;
    procedure SetIssValorBase1(const AIssValorBase1: Double);
    function GetIssValorImposto1: Double;
    procedure SetIssValorImposto1(const AIssValorImposto1: Double);
    function GetIssAliquota2: Double;
    procedure SetIssAliquota2(const AIssAliquota2: Double);
    function GetIssValorBase2: Double;
    procedure SetIssValorBase2(const AIssValorBase2: Double);
    function GetIssValorImposto2: Double;
    procedure SetIssValorImposto2(const AIssValorImposto2: Double);
    function GetIssAliquota3: Double;
    procedure SetIssAliquota3(const AIssAliquota3: Double);
    function GetIssValorBase3: Double;
    procedure SetIssValorBase3(const AIssValorBase3: Double);
    function GetIssValorImposto3: Double;
    procedure SetIssValorImposto3(const AIssValorImposto3: Double);
    function GetIssAliquota4: Double;
    procedure SetIssAliquota4(const AIssAliquota4: Double);
    function GetIssValorBase4: Double;
    procedure SetIssValorBase4(const AIssValorBase4: Double);
    function GetIssValorImposto4: Double;
    procedure SetIssValorImposto4(const AIssValorImposto4: Double);
  public
    property Id: Int64 read GetId write SetId;
    property Data: TDateTime read GetData write SetData;
    property LojaId: Int64 read GetLojaId write SetLojaId;
    property SerieEquipamento: TString read GetSerieEquipamento write SetSerieEquipamento;
    property ContadorCupomInicial: TString read GetContadorCupomInicial write SetContadorCupomInicial;
    property ContadorCupomFinal: TString read GetContadorCupomFinal write SetContadorCupomFinal;
    property PercentualLivreDaMFD: Double read GetPercentualLivreDaMFD write SetPercentualLivreDaMFD;
    property NumeroEcf: TString read GetNumeroEcf write SetNumeroEcf;
    property ContadorOrdemOperacao: TString read GetContadorOrdemOperacao write SetContadorOrdemOperacao;
    property ContadorOrdemOperacaoInicial: TString read GetContadorOrdemOperacaoInicial write SetContadorOrdemOperacaoInicial;
    property ContadorReducao: TString read GetContadorReducao write SetContadorReducao;
    property ContadorReinicioOperacao: TString read GetContadorReinicioOperacao write SetContadorReinicioOperacao;
    property GtInicial: Double read GetGtInicial write SetGtInicial;
    property FtFinal: Double read GetFtFinal write SetFtFinal;
    property VendaBruta: Double read GetVendaBruta write SetVendaBruta;
    property TotalCancelamento: Double read GetTotalCancelamento write SetTotalCancelamento;
    property TotalDesconto: Double read GetTotalDesconto write SetTotalDesconto;
    property VendaLiquida: Double read GetVendaLiquida write SetVendaLiquida;
    property ValorBaseSubstituicao: Double read GetValorBaseSubstituicao write SetValorBaseSubstituicao;
    property ValorBaseIsenta: Double read GetValorBaseIsenta write SetValorBaseIsenta;
    property ValorBaseNaoTributada: Double read GetValorBaseNaoTributada write SetValorBaseNaoTributada;
    property ValorBaseServico: Double read GetValorBaseServico write SetValorBaseServico;
    property Aliquota1: Double read GetAliquota1 write SetAliquota1;
    property ValorBase1: Double read GetValorBase1 write SetValorBase1;
    property ValorImposto1: Double read GetValorImposto1 write SetValorImposto1;
    property Aliquota2: Double read GetAliquota2 write SetAliquota2;
    property ValorBase2: Double read GetValorBase2 write SetValorBase2;
    property ValorImposto2: Double read GetValorImposto2 write SetValorImposto2;
    property Aliquota3: Double read GetAliquota3 write SetAliquota3;
    property ValorBase3: Double read GetValorBase3 write SetValorBase3;
    property ValorImposto3: Double read GetValorImposto3 write SetValorImposto3;
    property Aliquota4: Double read GetAliquota4 write SetAliquota4;
    property ValorBase4: Double read GetValorBase4 write SetValorBase4;
    property ValorImposto4: Double read GetValorImposto4 write SetValorImposto4;
    property Aliquota5: Double read GetAliquota5 write SetAliquota5;
    property ValorBase5: Double read GetValorBase5 write SetValorBase5;
    property ValorImposto5: Double read GetValorImposto5 write SetValorImposto5;
    property Aliquota6: Double read GetAliquota6 write SetAliquota6;
    property ValorBase6: Double read GetValorBase6 write SetValorBase6;
    property ValorImposto6: Double read GetValorImposto6 write SetValorImposto6;
    property Aliquota7: Double read GetAliquota7 write SetAliquota7;
    property ValorBase7: Double read GetValorBase7 write SetValorBase7;
    property ValorImposto7: Double read GetValorImposto7 write SetValorImposto7;
    property Aliquota8: Double read GetAliquota8 write SetAliquota8;
    property ValorBase8: Double read GetValorBase8 write SetValorBase8;
    property ValorImposto8: Double read GetValorImposto8 write SetValorImposto8;
    property Aliquota9: Double read GetAliquota9 write SetAliquota9;
    property ValorBase9: Double read GetValorBase9 write SetValorBase9;
    property ValorImposto9: Double read GetValorImposto9 write SetValorImposto9;
    property Aliquota10: Double read GetAliquota10 write SetAliquota10;
    property ValorBase10: Double read GetValorBase10 write SetValorBase10;
    property ValorImposto10: Double read GetValorImposto10 write SetValorImposto10;
    property IssAliquota1: Double read GetIssAliquota1 write SetIssAliquota1;
    property IssValorBase1: Double read GetIssValorBase1 write SetIssValorBase1;
    property IssValorImposto1: Double read GetIssValorImposto1 write SetIssValorImposto1;
    property IssAliquota2: Double read GetIssAliquota2 write SetIssAliquota2;
    property IssValorBase2: Double read GetIssValorBase2 write SetIssValorBase2;
    property IssValorImposto2: Double read GetIssValorImposto2 write SetIssValorImposto2;
    property IssAliquota3: Double read GetIssAliquota3 write SetIssAliquota3;
    property IssValorBase3: Double read GetIssValorBase3 write SetIssValorBase3;
    property IssValorImposto3: Double read GetIssValorImposto3 write SetIssValorImposto3;
    property IssAliquota4: Double read GetIssAliquota4 write SetIssAliquota4;
    property IssValorBase4: Double read GetIssValorBase4 write SetIssValorBase4;
    property IssValorImposto4: Double read GetIssValorImposto4 write SetIssValorImposto4;
  end;

implementation

{ TReducaoList }

procedure TReducaoList.Add(const AReducao: IReducao);
begin
  FList.Add(AReducao);
end;

procedure TReducaoList.Clear;
begin
  FList.Clear;
end;

function TReducaoList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TReducaoList.Create;
begin
  FList := TInterfaceList.Create;
end;

destructor TReducaoList.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TReducaoList.GetEnumerator: TReducaoListEnumerator;
begin
  Result := TReducaoListEnumerator.Create(Self);
end;

function TReducaoList.GetItems(AIndex: Integer): IReducao;
begin
  Result := FList[AIndex] as IReducao;
end;

function TReducaoList.GetReference: TReducaoList;
begin
  Result := Self;
end;

procedure TReducaoList.SetItems(AIndex: Integer; const Value: IReducao);
begin
  FList[AIndex] := Value;
end;

{ TReducaoListEnumerator }

constructor TReducaoListEnumerator.Create(AReducaoList: TReducaoList);
begin
  inherited Create;
  FIndex := -1;
  FReducaoList := AReducaoList;
end;

function TReducaoListEnumerator.GetCurrent: IReducao;
begin
  Result := FReducaoList[FIndex];
end;

function TReducaoListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FReducaoList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TReducaoListRec }

class function TReducaoListRec.Create(const AList: IReducaoList): TReducaoListRec;
begin
  FillChar(Result, SizeOf(TReducaoListRec), 0);
  Result.FList := AList;
end;

class operator TReducaoListRec.Implicit(AListRec: TReducaoListRec): TReducaoList;
begin
  Result := AListRec.FList.GetReference;
end;

{ TReducao }

function TReducao.GetId: Int64;
begin
  Result := FId;
end;

procedure TReducao.SetId(const AId: Int64);
begin
  FId := AId;
end;

function TReducao.GetData: TDateTime;
begin
  Result := FData;
end;

procedure TReducao.SetData(const AData: TDateTime);
begin
  FData := AData;
end;

function TReducao.GetLojaId: Int64;
begin
  Result := FLojaId;
end;

procedure TReducao.SetLojaId(const ALojaId: Int64);
begin
  FLojaId := ALojaId;
end;

function TReducao.GetSerieEquipamento: TString;
begin
  Result := FSerieEquipamento;
end;

procedure TReducao.SetSerieEquipamento(const ASerieEquipamento: TString);
begin
  FSerieEquipamento := ASerieEquipamento;
end;

function TReducao.GetContadorCupomInicial: TString;
begin
  Result := FContadorCupomInicial;
end;

procedure TReducao.SetContadorCupomInicial(const AContadorCupomInicial: TString);
begin
  FContadorCupomInicial := AContadorCupomInicial;
end;

function TReducao.GetContadorCupomFinal: TString;
begin
  Result := FContadorCupomFinal;
end;

procedure TReducao.SetContadorCupomFinal(const AContadorCupomFinal: TString);
begin
  FContadorCupomFinal := AContadorCupomFinal;
end;

function TReducao.GetPercentualLivreDaMFD: Double;
begin
  Result := FPercentualLivreDaMFD;
end;

procedure TReducao.SetPercentualLivreDaMFD(const APercentualLivreDaMFD: Double);
begin
  FPercentualLivreDaMFD := APercentualLivreDaMFD;
end;

function TReducao.GetNumeroEcf: TString;
begin
  Result := FNumeroEcf;
end;

procedure TReducao.SetNumeroEcf(const ANumeroEcf: TString);
begin
  FNumeroEcf := ANumeroEcf;
end;

function TReducao.GetContadorOrdemOperacao: TString;
begin
  Result := FContadorOrdemOperacao;
end;

procedure TReducao.SetContadorOrdemOperacao(const AContadorOrdemOperacao: TString);
begin
  FContadorOrdemOperacao := AContadorOrdemOperacao;
end;

function TReducao.GetContadorOrdemOperacaoInicial: TString;
begin
  Result := FContadorOrdemOperacaoInicial;
end;

procedure TReducao.SetContadorOrdemOperacaoInicial(const AContadorOrdemOperacaoInicial: TString);
begin
  FContadorOrdemOperacaoInicial := AContadorOrdemOperacaoInicial;
end;

function TReducao.GetContadorReducao: TString;
begin
  Result := FContadorReducao;
end;

procedure TReducao.SetContadorReducao(const AContadorReducao: TString);
begin
  FContadorReducao := AContadorReducao;
end;

function TReducao.GetContadorReinicioOperacao: TString;
begin
  Result := FContadorReinicioOperacao;
end;

procedure TReducao.SetContadorReinicioOperacao(const AContadorReinicioOperacao: TString);
begin
  FContadorReinicioOperacao := AContadorReinicioOperacao;
end;

function TReducao.GetGtInicial: Double;
begin
  Result := FGtInicial;
end;

procedure TReducao.SetGtInicial(const AGtInicial: Double);
begin
  FGtInicial := AGtInicial;
end;

function TReducao.GetFtFinal: Double;
begin
  Result := FFtFinal;
end;

procedure TReducao.SetFtFinal(const AFtFinal: Double);
begin
  FFtFinal := AFtFinal;
end;

function TReducao.GetVendaBruta: Double;
begin
  Result := FVendaBruta;
end;

procedure TReducao.SetVendaBruta(const AVendaBruta: Double);
begin
  FVendaBruta := AVendaBruta;
end;

function TReducao.GetTotalCancelamento: Double;
begin
  Result := FTotalCancelamento;
end;

procedure TReducao.SetTotalCancelamento(const ATotalCancelamento: Double);
begin
  FTotalCancelamento := ATotalCancelamento;
end;

function TReducao.GetTotalDesconto: Double;
begin
  Result := FTotalDesconto;
end;

procedure TReducao.SetTotalDesconto(const ATotalDesconto: Double);
begin
  FTotalDesconto := ATotalDesconto;
end;

function TReducao.GetVendaLiquida: Double;
begin
  Result := FVendaLiquida;
end;

procedure TReducao.SetVendaLiquida(const AVendaLiquida: Double);
begin
  FVendaLiquida := AVendaLiquida;
end;

function TReducao.GetValorBaseSubstituicao: Double;
begin
  Result := FValorBaseSubstituicao;
end;

procedure TReducao.SetValorBaseSubstituicao(const AValorBaseSubstituicao: Double);
begin
  FValorBaseSubstituicao := AValorBaseSubstituicao;
end;

function TReducao.GetValorBaseIsenta: Double;
begin
  Result := FValorBaseIsenta;
end;

procedure TReducao.SetValorBaseIsenta(const AValorBaseIsenta: Double);
begin
  FValorBaseIsenta := AValorBaseIsenta;
end;

function TReducao.GetValorBaseNaoTributada: Double;
begin
  Result := FValorBaseNaoTributada;
end;

procedure TReducao.SetValorBaseNaoTributada(const AValorBaseNaoTributada: Double);
begin
  FValorBaseNaoTributada := AValorBaseNaoTributada;
end;

function TReducao.GetValorBaseServico: Double;
begin
  Result := FValorBaseServico;
end;

procedure TReducao.SetValorBaseServico(const AValorBaseServico: Double);
begin
  FValorBaseServico := AValorBaseServico;
end;

function TReducao.GetAliquota1: Double;
begin
  Result := FAliquota1;
end;

procedure TReducao.SetAliquota1(const AAliquota1: Double);
begin
  FAliquota1 := AAliquota1;
end;

function TReducao.GetValorBase1: Double;
begin
  Result := FValorBase1;
end;

procedure TReducao.SetValorBase1(const AValorBase1: Double);
begin
  FValorBase1 := AValorBase1;
end;

function TReducao.GetValorImposto1: Double;
begin
  Result := FValorImposto1;
end;

procedure TReducao.SetValorImposto1(const AValorImposto1: Double);
begin
  FValorImposto1 := AValorImposto1;
end;

function TReducao.GetAliquota2: Double;
begin
  Result := FAliquota2;
end;

procedure TReducao.SetAliquota2(const AAliquota2: Double);
begin
  FAliquota2 := AAliquota2;
end;

function TReducao.GetValorBase2: Double;
begin
  Result := FValorBase2;
end;

procedure TReducao.SetValorBase2(const AValorBase2: Double);
begin
  FValorBase2 := AValorBase2;
end;

function TReducao.GetValorImposto2: Double;
begin
  Result := FValorImposto2;
end;

procedure TReducao.SetValorImposto2(const AValorImposto2: Double);
begin
  FValorImposto2 := AValorImposto2;
end;

function TReducao.GetAliquota3: Double;
begin
  Result := FAliquota3;
end;

procedure TReducao.SetAliquota3(const AAliquota3: Double);
begin
  FAliquota3 := AAliquota3;
end;

function TReducao.GetValorBase3: Double;
begin
  Result := FValorBase3;
end;

procedure TReducao.SetValorBase3(const AValorBase3: Double);
begin
  FValorBase3 := AValorBase3;
end;

function TReducao.GetValorImposto3: Double;
begin
  Result := FValorImposto3;
end;

procedure TReducao.SetValorImposto3(const AValorImposto3: Double);
begin
  FValorImposto3 := AValorImposto3;
end;

function TReducao.GetAliquota4: Double;
begin
  Result := FAliquota4;
end;

procedure TReducao.SetAliquota4(const AAliquota4: Double);
begin
  FAliquota4 := AAliquota4;
end;

function TReducao.GetValorBase4: Double;
begin
  Result := FValorBase4;
end;

procedure TReducao.SetValorBase4(const AValorBase4: Double);
begin
  FValorBase4 := AValorBase4;
end;

function TReducao.GetValorImposto4: Double;
begin
  Result := FValorImposto4;
end;

procedure TReducao.SetValorImposto4(const AValorImposto4: Double);
begin
  FValorImposto4 := AValorImposto4;
end;

function TReducao.GetAliquota5: Double;
begin
  Result := FAliquota5;
end;

procedure TReducao.SetAliquota5(const AAliquota5: Double);
begin
  FAliquota5 := AAliquota5;
end;

function TReducao.GetValorBase5: Double;
begin
  Result := FValorBase5;
end;

procedure TReducao.SetValorBase5(const AValorBase5: Double);
begin
  FValorBase5 := AValorBase5;
end;

function TReducao.GetValorImposto5: Double;
begin
  Result := FValorImposto5;
end;

procedure TReducao.SetValorImposto5(const AValorImposto5: Double);
begin
  FValorImposto5 := AValorImposto5;
end;

function TReducao.GetAliquota6: Double;
begin
  Result := FAliquota6;
end;

procedure TReducao.SetAliquota6(const AAliquota6: Double);
begin
  FAliquota6 := AAliquota6;
end;

function TReducao.GetValorBase6: Double;
begin
  Result := FValorBase6;
end;

procedure TReducao.SetValorBase6(const AValorBase6: Double);
begin
  FValorBase6 := AValorBase6;
end;

function TReducao.GetValorImposto6: Double;
begin
  Result := FValorImposto6;
end;

procedure TReducao.SetValorImposto6(const AValorImposto6: Double);
begin
  FValorImposto6 := AValorImposto6;
end;

function TReducao.GetAliquota7: Double;
begin
  Result := FAliquota7;
end;

procedure TReducao.SetAliquota7(const AAliquota7: Double);
begin
  FAliquota7 := AAliquota7;
end;

function TReducao.GetValorBase7: Double;
begin
  Result := FValorBase7;
end;

procedure TReducao.SetValorBase7(const AValorBase7: Double);
begin
  FValorBase7 := AValorBase7;
end;

function TReducao.GetValorImposto7: Double;
begin
  Result := FValorImposto7;
end;

procedure TReducao.SetValorImposto7(const AValorImposto7: Double);
begin
  FValorImposto7 := AValorImposto7;
end;

function TReducao.GetAliquota8: Double;
begin
  Result := FAliquota8;
end;

procedure TReducao.SetAliquota8(const AAliquota8: Double);
begin
  FAliquota8 := AAliquota8;
end;

function TReducao.GetValorBase8: Double;
begin
  Result := FValorBase8;
end;

procedure TReducao.SetValorBase8(const AValorBase8: Double);
begin
  FValorBase8 := AValorBase8;
end;

function TReducao.GetValorImposto8: Double;
begin
  Result := FValorImposto8;
end;

procedure TReducao.SetValorImposto8(const AValorImposto8: Double);
begin
  FValorImposto8 := AValorImposto8;
end;

function TReducao.GetAliquota9: Double;
begin
  Result := FAliquota9;
end;

procedure TReducao.SetAliquota9(const AAliquota9: Double);
begin
  FAliquota9 := AAliquota9;
end;

function TReducao.GetValorBase9: Double;
begin
  Result := FValorBase9;
end;

procedure TReducao.SetValorBase9(const AValorBase9: Double);
begin
  FValorBase9 := AValorBase9;
end;

function TReducao.GetValorImposto9: Double;
begin
  Result := FValorImposto9;
end;

procedure TReducao.SetValorImposto9(const AValorImposto9: Double);
begin
  FValorImposto9 := AValorImposto9;
end;

function TReducao.GetAliquota10: Double;
begin
  Result := FAliquota10;
end;

procedure TReducao.SetAliquota10(const AAliquota10: Double);
begin
  FAliquota10 := AAliquota10;
end;

function TReducao.GetValorBase10: Double;
begin
  Result := FValorBase10;
end;

procedure TReducao.SetValorBase10(const AValorBase10: Double);
begin
  FValorBase10 := AValorBase10;
end;

function TReducao.GetValorImposto10: Double;
begin
  Result := FValorImposto10;
end;

procedure TReducao.SetValorImposto10(const AValorImposto10: Double);
begin
  FValorImposto10 := AValorImposto10;
end;

function TReducao.GetIssAliquota1: Double;
begin
  Result := FIssAliquota1;
end;

procedure TReducao.SetIssAliquota1(const AIssAliquota1: Double);
begin
  FIssAliquota1 := AIssAliquota1;
end;

function TReducao.GetIssValorBase1: Double;
begin
  Result := FIssValorBase1;
end;

procedure TReducao.SetIssValorBase1(const AIssValorBase1: Double);
begin
  FIssValorBase1 := AIssValorBase1;
end;

function TReducao.GetIssValorImposto1: Double;
begin
  Result := FIssValorImposto1;
end;

procedure TReducao.SetIssValorImposto1(const AIssValorImposto1: Double);
begin
  FIssValorImposto1 := AIssValorImposto1;
end;

function TReducao.GetIssAliquota2: Double;
begin
  Result := FIssAliquota2;
end;

procedure TReducao.SetIssAliquota2(const AIssAliquota2: Double);
begin
  FIssAliquota2 := AIssAliquota2;
end;

function TReducao.GetIssValorBase2: Double;
begin
  Result := FIssValorBase2;
end;

procedure TReducao.SetIssValorBase2(const AIssValorBase2: Double);
begin
  FIssValorBase2 := AIssValorBase2;
end;

function TReducao.GetIssValorImposto2: Double;
begin
  Result := FIssValorImposto2;
end;

procedure TReducao.SetIssValorImposto2(const AIssValorImposto2: Double);
begin
  FIssValorImposto2 := AIssValorImposto2;
end;

function TReducao.GetIssAliquota3: Double;
begin
  Result := FIssAliquota3;
end;

procedure TReducao.SetIssAliquota3(const AIssAliquota3: Double);
begin
  FIssAliquota3 := AIssAliquota3;
end;

function TReducao.GetIssValorBase3: Double;
begin
  Result := FIssValorBase3;
end;

procedure TReducao.SetIssValorBase3(const AIssValorBase3: Double);
begin
  FIssValorBase3 := AIssValorBase3;
end;

function TReducao.GetIssValorImposto3: Double;
begin
  Result := FIssValorImposto3;
end;

procedure TReducao.SetIssValorImposto3(const AIssValorImposto3: Double);
begin
  FIssValorImposto3 := AIssValorImposto3;
end;

function TReducao.GetIssAliquota4: Double;
begin
  Result := FIssAliquota4;
end;

procedure TReducao.SetIssAliquota4(const AIssAliquota4: Double);
begin
  FIssAliquota4 := AIssAliquota4;
end;

function TReducao.GetIssValorBase4: Double;
begin
  Result := FIssValorBase4;
end;

procedure TReducao.SetIssValorBase4(const AIssValorBase4: Double);
begin
  FIssValorBase4 := AIssValorBase4;
end;

function TReducao.GetIssValorImposto4: Double;
begin
  Result := FIssValorImposto4;
end;

procedure TReducao.SetIssValorImposto4(const AIssValorImposto4: Double);
begin
  FIssValorImposto4 := AIssValorImposto4;
end;


end.
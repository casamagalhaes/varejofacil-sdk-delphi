unit SDK.Enums;

interface

uses
  SysUtils, Classes, SDK.Types;

type
  EnumException = class(Exception);

  TConverterStrToEnum = function(const AValue: TString): Integer;
  TConverterEnumToStr = function(const AValue: Integer): TString;

  TEnumConverters = class(TStringList)
  private
    const
      STR_TO_ENUM = '_StrToEnum';
      ENUM_TO_STR = '_EnumToStr';
  public
    procedure Register(const AEnumName: TString; AConverterStrToEnum: TConverterStrToEnum; AConverterEnumToStr: TConverterEnumToStr = nil);
    function Execute(const AEnumName, AValue: TString): Integer; overload;
    function Execute(const AEnumName: TString; AValue: Integer): TString; overload;
  end;

var
  EnumConverters: TEnumConverters;

type

  TAssociacao = (aNORMAL);

  TAtividadeEconomica = (aeSERVICO, aeCOMERCIO, aeOUTROS, aeINDUSTRIA);

  TCSOSN = (csosnIMUNE, csosnTRIBUTACAO_COM_PERMISSAO_DE_CREDITO_101, csosnTRIBUTACAO_COM_PERMISSAO_DE_CREDITO_201, csosnNAO_TRIBUTADO, csosnISENCAO_DO_ICSM_PARA_FAIXA_DE_RECEITA_BRUTA, csosnTRIBUTACAO_SEM_PERMISSAO_DE_CREDITO_202, csosnOUTROS, csosnICMS_COBRADO_ANTERIORMENTE_POR_SUBSTITUICAO_TRIBUTARIA, csosnTRIBUTACAO_SEM_PERMISSAO_DE_CREDITO_102, csosnISENCAO_DO_ICMS);

  TClassificacaoCategoria = (ccDESPESA, ccRECEITA);

  TClassificacaoPessoa = (cpSAIDA_PARA_NAO_CONTRIBUINTE, cpSAIDA_PARA_CONTRIBUINTE, cpSAIDA_PARA_TRANSFERENCIA, cpENTRADA_DE_TRANSFERENCIA, cpENTRADA_DE_MICROEMPRESA, cpENTRADA_DE_VAREJO, cpENTRADA_DE_INDUSTRIA, cpENTRADA_DE_DISTRIBUIDOR);

  TComposicao = (cCOMPOSTO, cKIT, cRENDIMENTO, cNORMAL);

  TConciliadora = (cBRCONSULTING);

  TCondicaoPagamento = (cpA_VISTA, cpNAO_INFORMADO, cpA_PRAZO, cpOUTROS);

  TEstadoCivil = (ecDIVORCIADO, ecVIUVO, ecCASADO, ecSOLTEIRO, ecOUTROS);

  TFinalidade = (fDEVOLUCAO, fTROCA);

  TFinalidadeProduto = (fpCOMERCIALIZACAO, fpINDUSTRIALIZADO, fpCONSUMO, fpMATERIA_PRIMA, fpOUTROS, fpIMOBILIZADO);

  TGeneroEspecieDocumento = (gedPAGAR, gedRECEBER);

  TIncidenciaIPI = (iipiVENDA, iipiCOMPRA, iipiAMBOS);

  TIndiceAT = (iatTRUNCA, iatARREDONDA);

  TMarcaImpressora = (miDATAREGIS, miPROCOMP, miSWEDA, miSAT, miECF, miSCHALTER, miCORISCO, miELGIN, miASTICK, miGENERAL, miQUATRO, miURANO, miAOKI, miCONVENIO, miBEMATECH, miEPSON, miINTERWAY, miYANCO, miZANTHUS, miDARUMA_AUTOMACAO, miICASH, miNFCe);

  TMetodoPagamentoEcommerce = (mpeCIELO, mpeE_REDE, mpeTRANFERENCIA_BANCARIA, mpeBOLETO, mpeMUNDIPAGG, mpeDINHEIRO_OU_CHEQUE);

  TModalidadeEspeciePagamento = (mepCOMPOSTO, mepSIMPLES);

  TModeloImpressora = (miECF029, miECF028, miECF027, miECF026, miECF025, miECF024, miECF023, miECF022, miECF021, miECF020, miECF039, miECF038, miECF037, miECF036, miECF035, miECF034, miECF033, miECF032, miECF031, miECF030, miECF007, miECF006, miECF005, miECF004, miECF003, miECF002, miECF046, miECF001, miECF045, miECF044, miECF043, miECF042, miECF041, miECF040, miECF009, miECF008, miECF018, miECF017, miECF016, miECF015, miECF014, miECF013, miECF012, miECF011, miECF099, miECF010, miECF098, miECF097, miECF019);

  TNivelFornecedor = (nfPRINCIPAL, nfSECUNDARIO);

  TPerfilFiscal = (pfA, pfB, pfC);

  TPesoVariavel = (pvUNITARIO, pvPENDENTE, pvPESO, pvSIM, pvNAO);

  TProducao = (pTERCEIROS, pPROPRIO);

  TResponsavelValidacao = (rvMIX_FISCAL, rvUSUARIO);

  TSexo = (sMASCULINO, sFEMININO);

  TSituacaoAprovacao = (saPENDENTE, saSIM, saNAO);

  TSituacaoLimiteCliente = (slcLIBERADO, slcBLOQUEADO);

  TSituacaoSetor = (ssATIVO, ssINATIVO);

  TStatusBloqueioCliente = (sbcBLOQUEADO, sbcNAO_BLOQUEADO, sbcBLOQUEADO_COM_AVISO, sbcBLOQUEADO_COM_AUTORIZACAO);

  TStatusDaPromocao = (sdpPROGRAMADA, sdpATIVA, sdpINATIVA);

  TStatusDoTitulo = (sdtLIQUIDADO, sdtCANCELADO, sdtABERTO, sdtPARCIALMENTE_LIQUIDADO_E_PENDENTE, sdtRENEGOCIADO, sdtABERTO_E_PENDENTE, sdtLIQUIDADO_E_PENDENTE, sdtANTECIPADO, sdtPARCIALMENTE_LIQUIDADO);

  TStatusTitulo = (stLIQUIDADO, stCANCELADO, stABERTO, stPARCIALMENTE_LIQUIDADO_E_PENDENTE, stRENEGOCIADO, stABERTO_E_PENDENTE, stLIQUIDADO_E_PENDENTE, stANTECIPADO, stPARCIALMENTE_LIQUIDADO);

  TStatusXmlNotaPDV = (sxnpdvPENDENTE, sxnpdvAUTORIZADA, sxnpdvCANCELADA, sxnpdvPENDENTE_CANCELAMENTO);

  TTabelaA = (taADQUIRIDO_DO_MERCADO_INTERNO, taMERCADORIA_COM_CONTEUDO_DE_IMPORTACAO_SUPERIOR_A_70, taMERCADORIA_COM_CONTEUDO_DE_IMPORTACAO_EM_CONFORMIDADE, taIMPORTACAO_DIRETA_SEM_SIMILAR_NACIONAL, taCUJO_PRODUCAO_TENHA_SIDO_FEITO, taNACIONAL, taMERCADORIA_CONTENDO_IMPORTACAO_SUPERIOR_40, taADQUIRIDO_DO_MERCADO_INTERNO_SEM_SIMILAR_NACIONAL, taIMPORTACAO_DIRETA);

  TTabelaPrazo = (tpDD, tpDFS, tpDF, tpDFD, tpPRZ, tpDFM, tpDFQ);

  TTipoAgregacao = (taPAUTA, taMARGEM);

  TTipoBonificacao = (tbNAO_GERA_PONTOS, tbGERA_PONTOS_POR_QUANTIDADE, tbGERA_PONTOS_POR_PRECO);

  TTipoCategoria = (tcANALITICA, tcSINTETICA);

  TTipoCliente = (tcTITULAR, tcDEPENDENTE);

  TTipoContaCorrente = (tccBANCARIA, tccCAIXA);

  TTipoControleDocumento = (tcdCONVENIO, tcdAVULSO);

  TTipoDaPessoa = (tdpREDE_ADQUIRENTE, tdpAGENTE_FINANCEIRO, tdpFUNCIONARIO, tdpLOJA, tdpCONTADOR, tdpCLIENTE, tdpFORNECEDOR, tdpPROMOTOR_DE_VENDA);

  TTipoEndereco = (tePRINCIPAL, teCOBRANCA);

  TTipoEntrada = (tePERCENTUAL, teVALOR);

  TTipoEstoque = (teTERCEIROS, tePROPRIO);

  TTipoFator = (tfPRECO, tfFATOR);

  TTipoFinalizadoraPremiacao = (tfpPERCENTUAL, tfpVALOR);

  TTipoFormaPagamentoCartao = (tfpcDEBITO, tfpcCREDITO);

  TTipoFornecedor = (tfDISTRIBUIDORA, tfSIMPLES_NACIONAL, tfVAREJO, tfOUTROS, tfINDUSTRIA);

  TTipoFrenteLoja = (tflEASY_ASSIST, tflSYSPDV);

  TTipoFreteNota = (tfnSEM_FRETE, tfnDESTINATARIO, tfnTERCEIRO, tfnEMITENTE);

  TTipoIPI = (tipiPERCENTUAL, tipiVALOR);

  TTipoImposto = (tiCOFINS, tiPIS, tiOUTROS);

  TTipoIncidencia = (tiSAIDA, tiENTRADA, tiAMBOS);

  TTipoOperacao = (toSAIDA, toENTRADA);

  TTipoPauta = (tpMINIMA, tpFIXA);

  TTipoPessoa = (tpFISICA, tpJURIDICA, tpESTRANGEIRO);

  TTipoProdutoAuxiliar = (tpaEAN, tpaLITERAL);

  TTipoPromocao = (tpDLL_DA_NESTLE, tpVALOR_DO_CUPOM, tpVALOR_CUPOM_ITEM_FINALIZADORA, tpPOR_CUPOM, tpPOR_FINALIZADORA, tpQUANTIDADE_DE_PRODUTO, tpVALOR_DO_CUPOM_ITENS, tpVALOR_DO_PRODUTO);

  TTipoReferencia = (trCARTAO, trCOMERCIAL, trEMPRESA, trBANCO, trPESSOAL, trOUTROS, trPROFISSIONAL);

  TTipoResidencia = (trOUTRAS, trALUGADA, trFINANCIADA, trDE_PARENTE, trPROPRIA);


implementation



{ TAssociacao }

function Converter_Associacao_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'NORMAL') then Result := Integer(aNORMAL) else
  raise EnumException.CreateFmt('Valor $s incorreto para Associacao.', [AValue]);
end;

function Converter_Associacao_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(aNORMAL) = AValue then Result := 'NORMAL' else
  raise EnumException.CreateFmt('Valor $d incorreto para Associacao.', [AValue]);
end;

{ TAtividadeEconomica }

function Converter_AtividadeEconomica_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'SERVICO') then Result := Integer(aeSERVICO) else
  if SameText(AValue, 'COMERCIO') then Result := Integer(aeCOMERCIO) else
  if SameText(AValue, 'OUTROS') then Result := Integer(aeOUTROS) else
  if SameText(AValue, 'INDUSTRIA') then Result := Integer(aeINDUSTRIA) else
  raise EnumException.CreateFmt('Valor $s incorreto para AtividadeEconomica.', [AValue]);
end;

function Converter_AtividadeEconomica_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(aeSERVICO) = AValue then Result := 'SERVICO' else
  if Integer(aeCOMERCIO) = AValue then Result := 'COMERCIO' else
  if Integer(aeOUTROS) = AValue then Result := 'OUTROS' else
  if Integer(aeINDUSTRIA) = AValue then Result := 'INDUSTRIA' else
  raise EnumException.CreateFmt('Valor $d incorreto para AtividadeEconomica.', [AValue]);
end;

{ TCSOSN }

function Converter_CSOSN_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'IMUNE') then Result := Integer(csosnIMUNE) else
  if SameText(AValue, 'TRIBUTACAO_COM_PERMISSAO_DE_CREDITO_101') then Result := Integer(csosnTRIBUTACAO_COM_PERMISSAO_DE_CREDITO_101) else
  if SameText(AValue, 'TRIBUTACAO_COM_PERMISSAO_DE_CREDITO_201') then Result := Integer(csosnTRIBUTACAO_COM_PERMISSAO_DE_CREDITO_201) else
  if SameText(AValue, 'NAO_TRIBUTADO') then Result := Integer(csosnNAO_TRIBUTADO) else
  if SameText(AValue, 'ISENCAO_DO_ICSM_PARA_FAIXA_DE_RECEITA_BRUTA') then Result := Integer(csosnISENCAO_DO_ICSM_PARA_FAIXA_DE_RECEITA_BRUTA) else
  if SameText(AValue, 'TRIBUTACAO_SEM_PERMISSAO_DE_CREDITO_202') then Result := Integer(csosnTRIBUTACAO_SEM_PERMISSAO_DE_CREDITO_202) else
  if SameText(AValue, 'OUTROS') then Result := Integer(csosnOUTROS) else
  if SameText(AValue, 'ICMS_COBRADO_ANTERIORMENTE_POR_SUBSTITUICAO_TRIBUTARIA') then Result := Integer(csosnICMS_COBRADO_ANTERIORMENTE_POR_SUBSTITUICAO_TRIBUTARIA) else
  if SameText(AValue, 'TRIBUTACAO_SEM_PERMISSAO_DE_CREDITO_102') then Result := Integer(csosnTRIBUTACAO_SEM_PERMISSAO_DE_CREDITO_102) else
  if SameText(AValue, 'ISENCAO_DO_ICMS') then Result := Integer(csosnISENCAO_DO_ICMS) else
  raise EnumException.CreateFmt('Valor $s incorreto para CSOSN.', [AValue]);
end;

function Converter_CSOSN_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(csosnIMUNE) = AValue then Result := 'IMUNE' else
  if Integer(csosnTRIBUTACAO_COM_PERMISSAO_DE_CREDITO_101) = AValue then Result := 'TRIBUTACAO_COM_PERMISSAO_DE_CREDITO_101' else
  if Integer(csosnTRIBUTACAO_COM_PERMISSAO_DE_CREDITO_201) = AValue then Result := 'TRIBUTACAO_COM_PERMISSAO_DE_CREDITO_201' else
  if Integer(csosnNAO_TRIBUTADO) = AValue then Result := 'NAO_TRIBUTADO' else
  if Integer(csosnISENCAO_DO_ICSM_PARA_FAIXA_DE_RECEITA_BRUTA) = AValue then Result := 'ISENCAO_DO_ICSM_PARA_FAIXA_DE_RECEITA_BRUTA' else
  if Integer(csosnTRIBUTACAO_SEM_PERMISSAO_DE_CREDITO_202) = AValue then Result := 'TRIBUTACAO_SEM_PERMISSAO_DE_CREDITO_202' else
  if Integer(csosnOUTROS) = AValue then Result := 'OUTROS' else
  if Integer(csosnICMS_COBRADO_ANTERIORMENTE_POR_SUBSTITUICAO_TRIBUTARIA) = AValue then Result := 'ICMS_COBRADO_ANTERIORMENTE_POR_SUBSTITUICAO_TRIBUTARIA' else
  if Integer(csosnTRIBUTACAO_SEM_PERMISSAO_DE_CREDITO_102) = AValue then Result := 'TRIBUTACAO_SEM_PERMISSAO_DE_CREDITO_102' else
  if Integer(csosnISENCAO_DO_ICMS) = AValue then Result := 'ISENCAO_DO_ICMS' else
  raise EnumException.CreateFmt('Valor $d incorreto para CSOSN.', [AValue]);
end;

{ TClassificacaoCategoria }

function Converter_ClassificacaoCategoria_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'DESPESA') then Result := Integer(ccDESPESA) else
  if SameText(AValue, 'RECEITA') then Result := Integer(ccRECEITA) else
  raise EnumException.CreateFmt('Valor $s incorreto para ClassificacaoCategoria.', [AValue]);
end;

function Converter_ClassificacaoCategoria_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(ccDESPESA) = AValue then Result := 'DESPESA' else
  if Integer(ccRECEITA) = AValue then Result := 'RECEITA' else
  raise EnumException.CreateFmt('Valor $d incorreto para ClassificacaoCategoria.', [AValue]);
end;

{ TClassificacaoPessoa }

function Converter_ClassificacaoPessoa_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'SAIDA_PARA_NAO_CONTRIBUINTE') then Result := Integer(cpSAIDA_PARA_NAO_CONTRIBUINTE) else
  if SameText(AValue, 'SAIDA_PARA_CONTRIBUINTE') then Result := Integer(cpSAIDA_PARA_CONTRIBUINTE) else
  if SameText(AValue, 'SAIDA_PARA_TRANSFERENCIA') then Result := Integer(cpSAIDA_PARA_TRANSFERENCIA) else
  if SameText(AValue, 'ENTRADA_DE_TRANSFERENCIA') then Result := Integer(cpENTRADA_DE_TRANSFERENCIA) else
  if SameText(AValue, 'ENTRADA_DE_MICROEMPRESA') then Result := Integer(cpENTRADA_DE_MICROEMPRESA) else
  if SameText(AValue, 'ENTRADA_DE_VAREJO') then Result := Integer(cpENTRADA_DE_VAREJO) else
  if SameText(AValue, 'ENTRADA_DE_INDUSTRIA') then Result := Integer(cpENTRADA_DE_INDUSTRIA) else
  if SameText(AValue, 'ENTRADA_DE_DISTRIBUIDOR') then Result := Integer(cpENTRADA_DE_DISTRIBUIDOR) else
  raise EnumException.CreateFmt('Valor $s incorreto para ClassificacaoPessoa.', [AValue]);
end;

function Converter_ClassificacaoPessoa_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(cpSAIDA_PARA_NAO_CONTRIBUINTE) = AValue then Result := 'SAIDA_PARA_NAO_CONTRIBUINTE' else
  if Integer(cpSAIDA_PARA_CONTRIBUINTE) = AValue then Result := 'SAIDA_PARA_CONTRIBUINTE' else
  if Integer(cpSAIDA_PARA_TRANSFERENCIA) = AValue then Result := 'SAIDA_PARA_TRANSFERENCIA' else
  if Integer(cpENTRADA_DE_TRANSFERENCIA) = AValue then Result := 'ENTRADA_DE_TRANSFERENCIA' else
  if Integer(cpENTRADA_DE_MICROEMPRESA) = AValue then Result := 'ENTRADA_DE_MICROEMPRESA' else
  if Integer(cpENTRADA_DE_VAREJO) = AValue then Result := 'ENTRADA_DE_VAREJO' else
  if Integer(cpENTRADA_DE_INDUSTRIA) = AValue then Result := 'ENTRADA_DE_INDUSTRIA' else
  if Integer(cpENTRADA_DE_DISTRIBUIDOR) = AValue then Result := 'ENTRADA_DE_DISTRIBUIDOR' else
  raise EnumException.CreateFmt('Valor $d incorreto para ClassificacaoPessoa.', [AValue]);
end;

{ TComposicao }

function Converter_Composicao_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'COMPOSTO') then Result := Integer(cCOMPOSTO) else
  if SameText(AValue, 'KIT') then Result := Integer(cKIT) else
  if SameText(AValue, 'RENDIMENTO') then Result := Integer(cRENDIMENTO) else
  if SameText(AValue, 'NORMAL') then Result := Integer(cNORMAL) else
  raise EnumException.CreateFmt('Valor $s incorreto para Composicao.', [AValue]);
end;

function Converter_Composicao_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(cCOMPOSTO) = AValue then Result := 'COMPOSTO' else
  if Integer(cKIT) = AValue then Result := 'KIT' else
  if Integer(cRENDIMENTO) = AValue then Result := 'RENDIMENTO' else
  if Integer(cNORMAL) = AValue then Result := 'NORMAL' else
  raise EnumException.CreateFmt('Valor $d incorreto para Composicao.', [AValue]);
end;

{ TConciliadora }

function Converter_Conciliadora_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'BRCONSULTING') then Result := Integer(cBRCONSULTING) else
  raise EnumException.CreateFmt('Valor $s incorreto para Conciliadora.', [AValue]);
end;

function Converter_Conciliadora_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(cBRCONSULTING) = AValue then Result := 'BRCONSULTING' else
  raise EnumException.CreateFmt('Valor $d incorreto para Conciliadora.', [AValue]);
end;

{ TCondicaoPagamento }

function Converter_CondicaoPagamento_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'A_VISTA') then Result := Integer(cpA_VISTA) else
  if SameText(AValue, 'NAO_INFORMADO') then Result := Integer(cpNAO_INFORMADO) else
  if SameText(AValue, 'A_PRAZO') then Result := Integer(cpA_PRAZO) else
  if SameText(AValue, 'OUTROS') then Result := Integer(cpOUTROS) else
  raise EnumException.CreateFmt('Valor $s incorreto para CondicaoPagamento.', [AValue]);
end;

function Converter_CondicaoPagamento_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(cpA_VISTA) = AValue then Result := 'A_VISTA' else
  if Integer(cpNAO_INFORMADO) = AValue then Result := 'NAO_INFORMADO' else
  if Integer(cpA_PRAZO) = AValue then Result := 'A_PRAZO' else
  if Integer(cpOUTROS) = AValue then Result := 'OUTROS' else
  raise EnumException.CreateFmt('Valor $d incorreto para CondicaoPagamento.', [AValue]);
end;

{ TEstadoCivil }

function Converter_EstadoCivil_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'DIVORCIADO') then Result := Integer(ecDIVORCIADO) else
  if SameText(AValue, 'VIUVO') then Result := Integer(ecVIUVO) else
  if SameText(AValue, 'CASADO') then Result := Integer(ecCASADO) else
  if SameText(AValue, 'SOLTEIRO') then Result := Integer(ecSOLTEIRO) else
  if SameText(AValue, 'OUTROS') then Result := Integer(ecOUTROS) else
  raise EnumException.CreateFmt('Valor $s incorreto para EstadoCivil.', [AValue]);
end;

function Converter_EstadoCivil_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(ecDIVORCIADO) = AValue then Result := 'DIVORCIADO' else
  if Integer(ecVIUVO) = AValue then Result := 'VIUVO' else
  if Integer(ecCASADO) = AValue then Result := 'CASADO' else
  if Integer(ecSOLTEIRO) = AValue then Result := 'SOLTEIRO' else
  if Integer(ecOUTROS) = AValue then Result := 'OUTROS' else
  raise EnumException.CreateFmt('Valor $d incorreto para EstadoCivil.', [AValue]);
end;

{ TFinalidade }

function Converter_Finalidade_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'DEVOLUCAO') then Result := Integer(fDEVOLUCAO) else
  if SameText(AValue, 'TROCA') then Result := Integer(fTROCA) else
  raise EnumException.CreateFmt('Valor $s incorreto para Finalidade.', [AValue]);
end;

function Converter_Finalidade_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(fDEVOLUCAO) = AValue then Result := 'DEVOLUCAO' else
  if Integer(fTROCA) = AValue then Result := 'TROCA' else
  raise EnumException.CreateFmt('Valor $d incorreto para Finalidade.', [AValue]);
end;

{ TFinalidadeProduto }

function Converter_FinalidadeProduto_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'COMERCIALIZACAO') then Result := Integer(fpCOMERCIALIZACAO) else
  if SameText(AValue, 'INDUSTRIALIZADO') then Result := Integer(fpINDUSTRIALIZADO) else
  if SameText(AValue, 'CONSUMO') then Result := Integer(fpCONSUMO) else
  if SameText(AValue, 'MATERIA_PRIMA') then Result := Integer(fpMATERIA_PRIMA) else
  if SameText(AValue, 'OUTROS') then Result := Integer(fpOUTROS) else
  if SameText(AValue, 'IMOBILIZADO') then Result := Integer(fpIMOBILIZADO) else
  raise EnumException.CreateFmt('Valor $s incorreto para FinalidadeProduto.', [AValue]);
end;

function Converter_FinalidadeProduto_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(fpCOMERCIALIZACAO) = AValue then Result := 'COMERCIALIZACAO' else
  if Integer(fpINDUSTRIALIZADO) = AValue then Result := 'INDUSTRIALIZADO' else
  if Integer(fpCONSUMO) = AValue then Result := 'CONSUMO' else
  if Integer(fpMATERIA_PRIMA) = AValue then Result := 'MATERIA_PRIMA' else
  if Integer(fpOUTROS) = AValue then Result := 'OUTROS' else
  if Integer(fpIMOBILIZADO) = AValue then Result := 'IMOBILIZADO' else
  raise EnumException.CreateFmt('Valor $d incorreto para FinalidadeProduto.', [AValue]);
end;

{ TGeneroEspecieDocumento }

function Converter_GeneroEspecieDocumento_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PAGAR') then Result := Integer(gedPAGAR) else
  if SameText(AValue, 'RECEBER') then Result := Integer(gedRECEBER) else
  raise EnumException.CreateFmt('Valor $s incorreto para GeneroEspecieDocumento.', [AValue]);
end;

function Converter_GeneroEspecieDocumento_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(gedPAGAR) = AValue then Result := 'PAGAR' else
  if Integer(gedRECEBER) = AValue then Result := 'RECEBER' else
  raise EnumException.CreateFmt('Valor $d incorreto para GeneroEspecieDocumento.', [AValue]);
end;

{ TIncidenciaIPI }

function Converter_IncidenciaIPI_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'VENDA') then Result := Integer(iipiVENDA) else
  if SameText(AValue, 'COMPRA') then Result := Integer(iipiCOMPRA) else
  if SameText(AValue, 'AMBOS') then Result := Integer(iipiAMBOS) else
  raise EnumException.CreateFmt('Valor $s incorreto para IncidenciaIPI.', [AValue]);
end;

function Converter_IncidenciaIPI_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(iipiVENDA) = AValue then Result := 'VENDA' else
  if Integer(iipiCOMPRA) = AValue then Result := 'COMPRA' else
  if Integer(iipiAMBOS) = AValue then Result := 'AMBOS' else
  raise EnumException.CreateFmt('Valor $d incorreto para IncidenciaIPI.', [AValue]);
end;

{ TIndiceAT }

function Converter_IndiceAT_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'TRUNCA') then Result := Integer(iatTRUNCA) else
  if SameText(AValue, 'ARREDONDA') then Result := Integer(iatARREDONDA) else
  raise EnumException.CreateFmt('Valor $s incorreto para IndiceAT.', [AValue]);
end;

function Converter_IndiceAT_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(iatTRUNCA) = AValue then Result := 'TRUNCA' else
  if Integer(iatARREDONDA) = AValue then Result := 'ARREDONDA' else
  raise EnumException.CreateFmt('Valor $d incorreto para IndiceAT.', [AValue]);
end;

{ TMarcaImpressora }

function Converter_MarcaImpressora_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'DATAREGIS') then Result := Integer(miDATAREGIS) else
  if SameText(AValue, 'PROCOMP') then Result := Integer(miPROCOMP) else
  if SameText(AValue, 'SWEDA') then Result := Integer(miSWEDA) else
  if SameText(AValue, 'SAT') then Result := Integer(miSAT) else
  if SameText(AValue, 'ECF') then Result := Integer(miECF) else
  if SameText(AValue, 'SCHALTER') then Result := Integer(miSCHALTER) else
  if SameText(AValue, 'CORISCO') then Result := Integer(miCORISCO) else
  if SameText(AValue, 'ELGIN') then Result := Integer(miELGIN) else
  if SameText(AValue, 'ASTICK') then Result := Integer(miASTICK) else
  if SameText(AValue, 'GENERAL') then Result := Integer(miGENERAL) else
  if SameText(AValue, 'QUATRO') then Result := Integer(miQUATRO) else
  if SameText(AValue, 'URANO') then Result := Integer(miURANO) else
  if SameText(AValue, 'AOKI') then Result := Integer(miAOKI) else
  if SameText(AValue, 'CONVENIO') then Result := Integer(miCONVENIO) else
  if SameText(AValue, 'BEMATECH') then Result := Integer(miBEMATECH) else
  if SameText(AValue, 'EPSON') then Result := Integer(miEPSON) else
  if SameText(AValue, 'INTERWAY') then Result := Integer(miINTERWAY) else
  if SameText(AValue, 'YANCO') then Result := Integer(miYANCO) else
  if SameText(AValue, 'ZANTHUS') then Result := Integer(miZANTHUS) else
  if SameText(AValue, 'DARUMA_AUTOMACAO') then Result := Integer(miDARUMA_AUTOMACAO) else
  if SameText(AValue, 'ICASH') then Result := Integer(miICASH) else
  if SameText(AValue, 'NFCe') then Result := Integer(miNFCe) else
  raise EnumException.CreateFmt('Valor $s incorreto para MarcaImpressora.', [AValue]);
end;

function Converter_MarcaImpressora_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(miDATAREGIS) = AValue then Result := 'DATAREGIS' else
  if Integer(miPROCOMP) = AValue then Result := 'PROCOMP' else
  if Integer(miSWEDA) = AValue then Result := 'SWEDA' else
  if Integer(miSAT) = AValue then Result := 'SAT' else
  if Integer(miECF) = AValue then Result := 'ECF' else
  if Integer(miSCHALTER) = AValue then Result := 'SCHALTER' else
  if Integer(miCORISCO) = AValue then Result := 'CORISCO' else
  if Integer(miELGIN) = AValue then Result := 'ELGIN' else
  if Integer(miASTICK) = AValue then Result := 'ASTICK' else
  if Integer(miGENERAL) = AValue then Result := 'GENERAL' else
  if Integer(miQUATRO) = AValue then Result := 'QUATRO' else
  if Integer(miURANO) = AValue then Result := 'URANO' else
  if Integer(miAOKI) = AValue then Result := 'AOKI' else
  if Integer(miCONVENIO) = AValue then Result := 'CONVENIO' else
  if Integer(miBEMATECH) = AValue then Result := 'BEMATECH' else
  if Integer(miEPSON) = AValue then Result := 'EPSON' else
  if Integer(miINTERWAY) = AValue then Result := 'INTERWAY' else
  if Integer(miYANCO) = AValue then Result := 'YANCO' else
  if Integer(miZANTHUS) = AValue then Result := 'ZANTHUS' else
  if Integer(miDARUMA_AUTOMACAO) = AValue then Result := 'DARUMA_AUTOMACAO' else
  if Integer(miICASH) = AValue then Result := 'ICASH' else
  if Integer(miNFCe) = AValue then Result := 'NFCe' else
  raise EnumException.CreateFmt('Valor $d incorreto para MarcaImpressora.', [AValue]);
end;

{ TMetodoPagamentoEcommerce }

function Converter_MetodoPagamentoEcommerce_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'CIELO') then Result := Integer(mpeCIELO) else
  if SameText(AValue, 'E_REDE') then Result := Integer(mpeE_REDE) else
  if SameText(AValue, 'TRANFERENCIA_BANCARIA') then Result := Integer(mpeTRANFERENCIA_BANCARIA) else
  if SameText(AValue, 'BOLETO') then Result := Integer(mpeBOLETO) else
  if SameText(AValue, 'MUNDIPAGG') then Result := Integer(mpeMUNDIPAGG) else
  if SameText(AValue, 'DINHEIRO_OU_CHEQUE') then Result := Integer(mpeDINHEIRO_OU_CHEQUE) else
  raise EnumException.CreateFmt('Valor $s incorreto para MetodoPagamentoEcommerce.', [AValue]);
end;

function Converter_MetodoPagamentoEcommerce_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(mpeCIELO) = AValue then Result := 'CIELO' else
  if Integer(mpeE_REDE) = AValue then Result := 'E_REDE' else
  if Integer(mpeTRANFERENCIA_BANCARIA) = AValue then Result := 'TRANFERENCIA_BANCARIA' else
  if Integer(mpeBOLETO) = AValue then Result := 'BOLETO' else
  if Integer(mpeMUNDIPAGG) = AValue then Result := 'MUNDIPAGG' else
  if Integer(mpeDINHEIRO_OU_CHEQUE) = AValue then Result := 'DINHEIRO_OU_CHEQUE' else
  raise EnumException.CreateFmt('Valor $d incorreto para MetodoPagamentoEcommerce.', [AValue]);
end;

{ TModalidadeEspeciePagamento }

function Converter_ModalidadeEspeciePagamento_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'COMPOSTO') then Result := Integer(mepCOMPOSTO) else
  if SameText(AValue, 'SIMPLES') then Result := Integer(mepSIMPLES) else
  raise EnumException.CreateFmt('Valor $s incorreto para ModalidadeEspeciePagamento.', [AValue]);
end;

function Converter_ModalidadeEspeciePagamento_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(mepCOMPOSTO) = AValue then Result := 'COMPOSTO' else
  if Integer(mepSIMPLES) = AValue then Result := 'SIMPLES' else
  raise EnumException.CreateFmt('Valor $d incorreto para ModalidadeEspeciePagamento.', [AValue]);
end;

{ TModeloImpressora }

function Converter_ModeloImpressora_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'ECF029') then Result := Integer(miECF029) else
  if SameText(AValue, 'ECF028') then Result := Integer(miECF028) else
  if SameText(AValue, 'ECF027') then Result := Integer(miECF027) else
  if SameText(AValue, 'ECF026') then Result := Integer(miECF026) else
  if SameText(AValue, 'ECF025') then Result := Integer(miECF025) else
  if SameText(AValue, 'ECF024') then Result := Integer(miECF024) else
  if SameText(AValue, 'ECF023') then Result := Integer(miECF023) else
  if SameText(AValue, 'ECF022') then Result := Integer(miECF022) else
  if SameText(AValue, 'ECF021') then Result := Integer(miECF021) else
  if SameText(AValue, 'ECF020') then Result := Integer(miECF020) else
  if SameText(AValue, 'ECF039') then Result := Integer(miECF039) else
  if SameText(AValue, 'ECF038') then Result := Integer(miECF038) else
  if SameText(AValue, 'ECF037') then Result := Integer(miECF037) else
  if SameText(AValue, 'ECF036') then Result := Integer(miECF036) else
  if SameText(AValue, 'ECF035') then Result := Integer(miECF035) else
  if SameText(AValue, 'ECF034') then Result := Integer(miECF034) else
  if SameText(AValue, 'ECF033') then Result := Integer(miECF033) else
  if SameText(AValue, 'ECF032') then Result := Integer(miECF032) else
  if SameText(AValue, 'ECF031') then Result := Integer(miECF031) else
  if SameText(AValue, 'ECF030') then Result := Integer(miECF030) else
  if SameText(AValue, 'ECF007') then Result := Integer(miECF007) else
  if SameText(AValue, 'ECF006') then Result := Integer(miECF006) else
  if SameText(AValue, 'ECF005') then Result := Integer(miECF005) else
  if SameText(AValue, 'ECF004') then Result := Integer(miECF004) else
  if SameText(AValue, 'ECF003') then Result := Integer(miECF003) else
  if SameText(AValue, 'ECF002') then Result := Integer(miECF002) else
  if SameText(AValue, 'ECF046') then Result := Integer(miECF046) else
  if SameText(AValue, 'ECF001') then Result := Integer(miECF001) else
  if SameText(AValue, 'ECF045') then Result := Integer(miECF045) else
  if SameText(AValue, 'ECF044') then Result := Integer(miECF044) else
  if SameText(AValue, 'ECF043') then Result := Integer(miECF043) else
  if SameText(AValue, 'ECF042') then Result := Integer(miECF042) else
  if SameText(AValue, 'ECF041') then Result := Integer(miECF041) else
  if SameText(AValue, 'ECF040') then Result := Integer(miECF040) else
  if SameText(AValue, 'ECF009') then Result := Integer(miECF009) else
  if SameText(AValue, 'ECF008') then Result := Integer(miECF008) else
  if SameText(AValue, 'ECF018') then Result := Integer(miECF018) else
  if SameText(AValue, 'ECF017') then Result := Integer(miECF017) else
  if SameText(AValue, 'ECF016') then Result := Integer(miECF016) else
  if SameText(AValue, 'ECF015') then Result := Integer(miECF015) else
  if SameText(AValue, 'ECF014') then Result := Integer(miECF014) else
  if SameText(AValue, 'ECF013') then Result := Integer(miECF013) else
  if SameText(AValue, 'ECF012') then Result := Integer(miECF012) else
  if SameText(AValue, 'ECF011') then Result := Integer(miECF011) else
  if SameText(AValue, 'ECF099') then Result := Integer(miECF099) else
  if SameText(AValue, 'ECF010') then Result := Integer(miECF010) else
  if SameText(AValue, 'ECF098') then Result := Integer(miECF098) else
  if SameText(AValue, 'ECF097') then Result := Integer(miECF097) else
  if SameText(AValue, 'ECF019') then Result := Integer(miECF019) else
  raise EnumException.CreateFmt('Valor $s incorreto para ModeloImpressora.', [AValue]);
end;

function Converter_ModeloImpressora_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(miECF029) = AValue then Result := 'ECF029' else
  if Integer(miECF028) = AValue then Result := 'ECF028' else
  if Integer(miECF027) = AValue then Result := 'ECF027' else
  if Integer(miECF026) = AValue then Result := 'ECF026' else
  if Integer(miECF025) = AValue then Result := 'ECF025' else
  if Integer(miECF024) = AValue then Result := 'ECF024' else
  if Integer(miECF023) = AValue then Result := 'ECF023' else
  if Integer(miECF022) = AValue then Result := 'ECF022' else
  if Integer(miECF021) = AValue then Result := 'ECF021' else
  if Integer(miECF020) = AValue then Result := 'ECF020' else
  if Integer(miECF039) = AValue then Result := 'ECF039' else
  if Integer(miECF038) = AValue then Result := 'ECF038' else
  if Integer(miECF037) = AValue then Result := 'ECF037' else
  if Integer(miECF036) = AValue then Result := 'ECF036' else
  if Integer(miECF035) = AValue then Result := 'ECF035' else
  if Integer(miECF034) = AValue then Result := 'ECF034' else
  if Integer(miECF033) = AValue then Result := 'ECF033' else
  if Integer(miECF032) = AValue then Result := 'ECF032' else
  if Integer(miECF031) = AValue then Result := 'ECF031' else
  if Integer(miECF030) = AValue then Result := 'ECF030' else
  if Integer(miECF007) = AValue then Result := 'ECF007' else
  if Integer(miECF006) = AValue then Result := 'ECF006' else
  if Integer(miECF005) = AValue then Result := 'ECF005' else
  if Integer(miECF004) = AValue then Result := 'ECF004' else
  if Integer(miECF003) = AValue then Result := 'ECF003' else
  if Integer(miECF002) = AValue then Result := 'ECF002' else
  if Integer(miECF046) = AValue then Result := 'ECF046' else
  if Integer(miECF001) = AValue then Result := 'ECF001' else
  if Integer(miECF045) = AValue then Result := 'ECF045' else
  if Integer(miECF044) = AValue then Result := 'ECF044' else
  if Integer(miECF043) = AValue then Result := 'ECF043' else
  if Integer(miECF042) = AValue then Result := 'ECF042' else
  if Integer(miECF041) = AValue then Result := 'ECF041' else
  if Integer(miECF040) = AValue then Result := 'ECF040' else
  if Integer(miECF009) = AValue then Result := 'ECF009' else
  if Integer(miECF008) = AValue then Result := 'ECF008' else
  if Integer(miECF018) = AValue then Result := 'ECF018' else
  if Integer(miECF017) = AValue then Result := 'ECF017' else
  if Integer(miECF016) = AValue then Result := 'ECF016' else
  if Integer(miECF015) = AValue then Result := 'ECF015' else
  if Integer(miECF014) = AValue then Result := 'ECF014' else
  if Integer(miECF013) = AValue then Result := 'ECF013' else
  if Integer(miECF012) = AValue then Result := 'ECF012' else
  if Integer(miECF011) = AValue then Result := 'ECF011' else
  if Integer(miECF099) = AValue then Result := 'ECF099' else
  if Integer(miECF010) = AValue then Result := 'ECF010' else
  if Integer(miECF098) = AValue then Result := 'ECF098' else
  if Integer(miECF097) = AValue then Result := 'ECF097' else
  if Integer(miECF019) = AValue then Result := 'ECF019' else
  raise EnumException.CreateFmt('Valor $d incorreto para ModeloImpressora.', [AValue]);
end;

{ TNivelFornecedor }

function Converter_NivelFornecedor_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PRINCIPAL') then Result := Integer(nfPRINCIPAL) else
  if SameText(AValue, 'SECUNDARIO') then Result := Integer(nfSECUNDARIO) else
  raise EnumException.CreateFmt('Valor $s incorreto para NivelFornecedor.', [AValue]);
end;

function Converter_NivelFornecedor_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(nfPRINCIPAL) = AValue then Result := 'PRINCIPAL' else
  if Integer(nfSECUNDARIO) = AValue then Result := 'SECUNDARIO' else
  raise EnumException.CreateFmt('Valor $d incorreto para NivelFornecedor.', [AValue]);
end;

{ TPerfilFiscal }

function Converter_PerfilFiscal_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'A') then Result := Integer(pfA) else
  if SameText(AValue, 'B') then Result := Integer(pfB) else
  if SameText(AValue, 'C') then Result := Integer(pfC) else
  raise EnumException.CreateFmt('Valor $s incorreto para PerfilFiscal.', [AValue]);
end;

function Converter_PerfilFiscal_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(pfA) = AValue then Result := 'A' else
  if Integer(pfB) = AValue then Result := 'B' else
  if Integer(pfC) = AValue then Result := 'C' else
  raise EnumException.CreateFmt('Valor $d incorreto para PerfilFiscal.', [AValue]);
end;

{ TPesoVariavel }

function Converter_PesoVariavel_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'UNITARIO') then Result := Integer(pvUNITARIO) else
  if SameText(AValue, 'PENDENTE') then Result := Integer(pvPENDENTE) else
  if SameText(AValue, 'PESO') then Result := Integer(pvPESO) else
  if SameText(AValue, 'SIM') then Result := Integer(pvSIM) else
  if SameText(AValue, 'NAO') then Result := Integer(pvNAO) else
  raise EnumException.CreateFmt('Valor $s incorreto para PesoVariavel.', [AValue]);
end;

function Converter_PesoVariavel_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(pvUNITARIO) = AValue then Result := 'UNITARIO' else
  if Integer(pvPENDENTE) = AValue then Result := 'PENDENTE' else
  if Integer(pvPESO) = AValue then Result := 'PESO' else
  if Integer(pvSIM) = AValue then Result := 'SIM' else
  if Integer(pvNAO) = AValue then Result := 'NAO' else
  raise EnumException.CreateFmt('Valor $d incorreto para PesoVariavel.', [AValue]);
end;

{ TProducao }

function Converter_Producao_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'TERCEIROS') then Result := Integer(pTERCEIROS) else
  if SameText(AValue, 'PROPRIO') then Result := Integer(pPROPRIO) else
  raise EnumException.CreateFmt('Valor $s incorreto para Producao.', [AValue]);
end;

function Converter_Producao_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(pTERCEIROS) = AValue then Result := 'TERCEIROS' else
  if Integer(pPROPRIO) = AValue then Result := 'PROPRIO' else
  raise EnumException.CreateFmt('Valor $d incorreto para Producao.', [AValue]);
end;

{ TResponsavelValidacao }

function Converter_ResponsavelValidacao_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'MIX_FISCAL') then Result := Integer(rvMIX_FISCAL) else
  if SameText(AValue, 'USUARIO') then Result := Integer(rvUSUARIO) else
  raise EnumException.CreateFmt('Valor $s incorreto para ResponsavelValidacao.', [AValue]);
end;

function Converter_ResponsavelValidacao_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(rvMIX_FISCAL) = AValue then Result := 'MIX_FISCAL' else
  if Integer(rvUSUARIO) = AValue then Result := 'USUARIO' else
  raise EnumException.CreateFmt('Valor $d incorreto para ResponsavelValidacao.', [AValue]);
end;

{ TSexo }

function Converter_Sexo_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'MASCULINO') then Result := Integer(sMASCULINO) else
  if SameText(AValue, 'FEMININO') then Result := Integer(sFEMININO) else
  raise EnumException.CreateFmt('Valor $s incorreto para Sexo.', [AValue]);
end;

function Converter_Sexo_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(sMASCULINO) = AValue then Result := 'MASCULINO' else
  if Integer(sFEMININO) = AValue then Result := 'FEMININO' else
  raise EnumException.CreateFmt('Valor $d incorreto para Sexo.', [AValue]);
end;

{ TSituacaoAprovacao }

function Converter_SituacaoAprovacao_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PENDENTE') then Result := Integer(saPENDENTE) else
  if SameText(AValue, 'SIM') then Result := Integer(saSIM) else
  if SameText(AValue, 'NAO') then Result := Integer(saNAO) else
  raise EnumException.CreateFmt('Valor $s incorreto para SituacaoAprovacao.', [AValue]);
end;

function Converter_SituacaoAprovacao_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(saPENDENTE) = AValue then Result := 'PENDENTE' else
  if Integer(saSIM) = AValue then Result := 'SIM' else
  if Integer(saNAO) = AValue then Result := 'NAO' else
  raise EnumException.CreateFmt('Valor $d incorreto para SituacaoAprovacao.', [AValue]);
end;

{ TSituacaoLimiteCliente }

function Converter_SituacaoLimiteCliente_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'LIBERADO') then Result := Integer(slcLIBERADO) else
  if SameText(AValue, 'BLOQUEADO') then Result := Integer(slcBLOQUEADO) else
  raise EnumException.CreateFmt('Valor %s incorreto para SituacaoLimiteCliente.', [AValue]);
end;

function Converter_SituacaoLimiteCliente_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(slcLIBERADO) = AValue then Result := 'LIBERADO' else
  if Integer(slcBLOQUEADO) = AValue then Result := 'BLOQUEADO' else
  raise EnumException.CreateFmt('Valor $d incorreto para SituacaoLimiteCliente.', [AValue]);
end;

{ TSituacaoSetor }

function Converter_SituacaoSetor_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'ATIVO') then Result := Integer(ssATIVO) else
  if SameText(AValue, 'INATIVO') then Result := Integer(ssINATIVO) else
  raise EnumException.CreateFmt('Valor $s incorreto para SituacaoSetor.', [AValue]);
end;

function Converter_SituacaoSetor_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(ssATIVO) = AValue then Result := 'ATIVO' else
  if Integer(ssINATIVO) = AValue then Result := 'INATIVO' else
  raise EnumException.CreateFmt('Valor $d incorreto para SituacaoSetor.', [AValue]);
end;

{ TStatusBloqueioCliente }

function Converter_StatusBloqueioCliente_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'BLOQUEADO') then Result := Integer(sbcBLOQUEADO) else
  if SameText(AValue, 'NAO_BLOQUEADO') then Result := Integer(sbcNAO_BLOQUEADO) else
  if SameText(AValue, 'BLOQUEADO_COM_AVISO') then Result := Integer(sbcBLOQUEADO_COM_AVISO) else
  if SameText(AValue, 'BLOQUEADO_COM_AUTORIZACAO') then Result := Integer(sbcBLOQUEADO_COM_AUTORIZACAO) else
  raise EnumException.CreateFmt('Valor $s incorreto para StatusBloqueioCliente.', [AValue]);
end;

function Converter_StatusBloqueioCliente_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(sbcBLOQUEADO) = AValue then Result := 'BLOQUEADO' else
  if Integer(sbcNAO_BLOQUEADO) = AValue then Result := 'NAO_BLOQUEADO' else
  if Integer(sbcBLOQUEADO_COM_AVISO) = AValue then Result := 'BLOQUEADO_COM_AVISO' else
  if Integer(sbcBLOQUEADO_COM_AUTORIZACAO) = AValue then Result := 'BLOQUEADO_COM_AUTORIZACAO' else
  raise EnumException.CreateFmt('Valor $d incorreto para StatusBloqueioCliente.', [AValue]);
end;

{ TStatusDaPromocao }

function Converter_StatusDaPromocao_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PROGRAMADA') or SameText(AValue, 'P') then Result := Integer(sdpPROGRAMADA) else
  if SameText(AValue, 'ATIVA') or SameText(AValue, 'A') then Result := Integer(sdpATIVA) else
  if SameText(AValue, 'INATIVA') or SameText(AValue, 'I') then Result := Integer(sdpINATIVA) else
  raise EnumException.CreateFmt('Valor %s incorreto para StatusBloqueioCliente.', [AValue]);
end;

function Converter_StatusDaPromocao_EnumToStr(const AValue: Integer): TString;
begin
  if Integer(sdpPROGRAMADA) = AValue then Result := 'PROGRAMADA' else
  if Integer(sdpATIVA) = AValue then Result := 'ATIVA' else
  if Integer(sdpINATIVA) = AValue then Result := 'INATIVA' else
  raise EnumException.CreateFmt('Valor %s incorreto para StatusBloqueioCliente.', [AValue]);
end;

{ TStatusDoTitulo }

function Converter_StatusDoTitulo_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'LIQUIDADO') then Result := Integer(sdtLIQUIDADO) else
  if SameText(AValue, 'CANCELADO') then Result := Integer(sdtCANCELADO) else
  if SameText(AValue, 'ABERTO') then Result := Integer(sdtABERTO) else
  if SameText(AValue, 'PARCIALMENTE_LIQUIDADO_E_PENDENTE') then Result := Integer(sdtPARCIALMENTE_LIQUIDADO_E_PENDENTE) else
  if SameText(AValue, 'RENEGOCIADO') then Result := Integer(sdtRENEGOCIADO) else
  if SameText(AValue, 'ABERTO_E_PENDENTE') then Result := Integer(sdtABERTO_E_PENDENTE) else
  if SameText(AValue, 'LIQUIDADO_E_PENDENTE') then Result := Integer(sdtLIQUIDADO_E_PENDENTE) else
  if SameText(AValue, 'ANTECIPADO') then Result := Integer(sdtANTECIPADO) else
  if SameText(AValue, 'PARCIALMENTE_LIQUIDADO') then Result := Integer(sdtPARCIALMENTE_LIQUIDADO) else
  raise EnumException.CreateFmt('Valor $s incorreto para StatusDoTitulo.', [AValue]);
end;

function Converter_StatusDoTitulo_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(sdtLIQUIDADO) = AValue then Result := 'LIQUIDADO' else
  if Integer(sdtCANCELADO) = AValue then Result := 'CANCELADO' else
  if Integer(sdtABERTO) = AValue then Result := 'ABERTO' else
  if Integer(sdtPARCIALMENTE_LIQUIDADO_E_PENDENTE) = AValue then Result := 'PARCIALMENTE_LIQUIDADO_E_PENDENTE' else
  if Integer(sdtRENEGOCIADO) = AValue then Result := 'RENEGOCIADO' else
  if Integer(sdtABERTO_E_PENDENTE) = AValue then Result := 'ABERTO_E_PENDENTE' else
  if Integer(sdtLIQUIDADO_E_PENDENTE) = AValue then Result := 'LIQUIDADO_E_PENDENTE' else
  if Integer(sdtANTECIPADO) = AValue then Result := 'ANTECIPADO' else
  if Integer(sdtPARCIALMENTE_LIQUIDADO) = AValue then Result := 'PARCIALMENTE_LIQUIDADO' else
  raise EnumException.CreateFmt('Valor $d incorreto para StatusDoTitulo.', [AValue]);
end;

{ TStatusTitulo }

function Converter_StatusTitulo_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'LIQUIDADO') then Result := Integer(stLIQUIDADO) else
  if SameText(AValue, 'CANCELADO') then Result := Integer(stCANCELADO) else
  if SameText(AValue, 'ABERTO') then Result := Integer(stABERTO) else
  if SameText(AValue, 'PARCIALMENTE_LIQUIDADO_E_PENDENTE') then Result := Integer(stPARCIALMENTE_LIQUIDADO_E_PENDENTE) else
  if SameText(AValue, 'RENEGOCIADO') then Result := Integer(stRENEGOCIADO) else
  if SameText(AValue, 'ABERTO_E_PENDENTE') then Result := Integer(stABERTO_E_PENDENTE) else
  if SameText(AValue, 'LIQUIDADO_E_PENDENTE') then Result := Integer(stLIQUIDADO_E_PENDENTE) else
  if SameText(AValue, 'ANTECIPADO') then Result := Integer(stANTECIPADO) else
  if SameText(AValue, 'PARCIALMENTE_LIQUIDADO') then Result := Integer(stPARCIALMENTE_LIQUIDADO) else
  raise EnumException.CreateFmt('Valor $s incorreto para StatusTitulo.', [AValue]);
end;

function Converter_StatusTitulo_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(stLIQUIDADO) = AValue then Result := 'LIQUIDADO' else
  if Integer(stCANCELADO) = AValue then Result := 'CANCELADO' else
  if Integer(stABERTO) = AValue then Result := 'ABERTO' else
  if Integer(stPARCIALMENTE_LIQUIDADO_E_PENDENTE) = AValue then Result := 'PARCIALMENTE_LIQUIDADO_E_PENDENTE' else
  if Integer(stRENEGOCIADO) = AValue then Result := 'RENEGOCIADO' else
  if Integer(stABERTO_E_PENDENTE) = AValue then Result := 'ABERTO_E_PENDENTE' else
  if Integer(stLIQUIDADO_E_PENDENTE) = AValue then Result := 'LIQUIDADO_E_PENDENTE' else
  if Integer(stANTECIPADO) = AValue then Result := 'ANTECIPADO' else
  if Integer(stPARCIALMENTE_LIQUIDADO) = AValue then Result := 'PARCIALMENTE_LIQUIDADO' else
  raise EnumException.CreateFmt('Valor $d incorreto para StatusTitulo.', [AValue]);
end;

{ TStatusXmlNotaPDV }

function Converter_StatusXmlNotaPDV_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PENDENTE') then Result := Integer(sxnpdvPENDENTE) else
  if SameText(AValue, 'AUTORIZADA') then Result := Integer(sxnpdvAUTORIZADA) else
  if SameText(AValue, 'CANCELADA') then Result := Integer(sxnpdvCANCELADA) else
  if SameText(AValue, 'PENDENTE_CANCELAMENTO') then Result := Integer(sxnpdvPENDENTE_CANCELAMENTO) else
  raise EnumException.CreateFmt('Valor $s incorreto para StatusXmlNotaPDV.', [AValue]);
end;

function Converter_StatusXmlNotaPDV_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(sxnpdvPENDENTE) = AValue then Result := 'PENDENTE' else
  if Integer(sxnpdvAUTORIZADA) = AValue then Result := 'AUTORIZADA' else
  if Integer(sxnpdvCANCELADA) = AValue then Result := 'CANCELADA' else
  if Integer(sxnpdvPENDENTE_CANCELAMENTO) = AValue then Result := 'PENDENTE_CANCELAMENTO' else
  raise EnumException.CreateFmt('Valor $d incorreto para StatusXmlNotaPDV.', [AValue]);
end;

{ TTabelaA }

function Converter_TabelaA_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'ADQUIRIDO_DO_MERCADO_INTERNO') then Result := Integer(taADQUIRIDO_DO_MERCADO_INTERNO) else
  if SameText(AValue, 'MERCADORIA_COM_CONTEUDO_DE_IMPORTACAO_SUPERIOR_A_70') then Result := Integer(taMERCADORIA_COM_CONTEUDO_DE_IMPORTACAO_SUPERIOR_A_70) else
  if SameText(AValue, 'MERCADORIA_COM_CONTEUDO_DE_IMPORTACAO_EM_CONFORMIDADE') then Result := Integer(taMERCADORIA_COM_CONTEUDO_DE_IMPORTACAO_EM_CONFORMIDADE) else
  if SameText(AValue, 'IMPORTACAO_DIRETA_SEM_SIMILAR_NACIONAL') then Result := Integer(taIMPORTACAO_DIRETA_SEM_SIMILAR_NACIONAL) else
  if SameText(AValue, 'CUJO_PRODUCAO_TENHA_SIDO_FEITO') then Result := Integer(taCUJO_PRODUCAO_TENHA_SIDO_FEITO) else
  if SameText(AValue, 'NACIONAL') then Result := Integer(taNACIONAL) else
  if SameText(AValue, 'MERCADORIA_CONTENDO_IMPORTACAO_SUPERIOR_40') then Result := Integer(taMERCADORIA_CONTENDO_IMPORTACAO_SUPERIOR_40) else
  if SameText(AValue, 'ADQUIRIDO_DO_MERCADO_INTERNO_SEM_SIMILAR_NACIONAL') then Result := Integer(taADQUIRIDO_DO_MERCADO_INTERNO_SEM_SIMILAR_NACIONAL) else
  if SameText(AValue, 'IMPORTACAO_DIRETA') then Result := Integer(taIMPORTACAO_DIRETA) else
  raise EnumException.CreateFmt('Valor $s incorreto para TabelaA.', [AValue]);
end;

function Converter_TabelaA_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(taADQUIRIDO_DO_MERCADO_INTERNO) = AValue then Result := 'ADQUIRIDO_DO_MERCADO_INTERNO' else
  if Integer(taMERCADORIA_COM_CONTEUDO_DE_IMPORTACAO_SUPERIOR_A_70) = AValue then Result := 'MERCADORIA_COM_CONTEUDO_DE_IMPORTACAO_SUPERIOR_A_70' else
  if Integer(taMERCADORIA_COM_CONTEUDO_DE_IMPORTACAO_EM_CONFORMIDADE) = AValue then Result := 'MERCADORIA_COM_CONTEUDO_DE_IMPORTACAO_EM_CONFORMIDADE' else
  if Integer(taIMPORTACAO_DIRETA_SEM_SIMILAR_NACIONAL) = AValue then Result := 'IMPORTACAO_DIRETA_SEM_SIMILAR_NACIONAL' else
  if Integer(taCUJO_PRODUCAO_TENHA_SIDO_FEITO) = AValue then Result := 'CUJO_PRODUCAO_TENHA_SIDO_FEITO' else
  if Integer(taNACIONAL) = AValue then Result := 'NACIONAL' else
  if Integer(taMERCADORIA_CONTENDO_IMPORTACAO_SUPERIOR_40) = AValue then Result := 'MERCADORIA_CONTENDO_IMPORTACAO_SUPERIOR_40' else
  if Integer(taADQUIRIDO_DO_MERCADO_INTERNO_SEM_SIMILAR_NACIONAL) = AValue then Result := 'ADQUIRIDO_DO_MERCADO_INTERNO_SEM_SIMILAR_NACIONAL' else
  if Integer(taIMPORTACAO_DIRETA) = AValue then Result := 'IMPORTACAO_DIRETA' else
  raise EnumException.CreateFmt('Valor $d incorreto para TabelaA.', [AValue]);
end;

{ TTabelaPrazo }

function Converter_TabelaPrazo_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'DD') then Result := Integer(tpDD) else
  if SameText(AValue, 'DFS') then Result := Integer(tpDFS) else
  if SameText(AValue, 'DF') then Result := Integer(tpDF) else
  if SameText(AValue, 'DFD') then Result := Integer(tpDFD) else
  if SameText(AValue, 'PRZ') then Result := Integer(tpPRZ) else
  if SameText(AValue, 'DFM') then Result := Integer(tpDFM) else
  if SameText(AValue, 'DFQ') then Result := Integer(tpDFQ) else
  raise EnumException.CreateFmt('Valor $s incorreto para TabelaPrazo.', [AValue]);
end;

function Converter_TabelaPrazo_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(tpDD) = AValue then Result := 'DD' else
  if Integer(tpDFS) = AValue then Result := 'DFS' else
  if Integer(tpDF) = AValue then Result := 'DF' else
  if Integer(tpDFD) = AValue then Result := 'DFD' else
  if Integer(tpPRZ) = AValue then Result := 'PRZ' else
  if Integer(tpDFM) = AValue then Result := 'DFM' else
  if Integer(tpDFQ) = AValue then Result := 'DFQ' else
  raise EnumException.CreateFmt('Valor $d incorreto para TabelaPrazo.', [AValue]);
end;

{ TTipoAgregacao }

function Converter_TipoAgregacao_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PAUTA') then Result := Integer(taPAUTA) else
  if SameText(AValue, 'MARGEM') then Result := Integer(taMARGEM) else
  raise EnumException.CreateFmt('Valor $s incorreto para TipoAgregacao.', [AValue]);
end;

function Converter_TipoAgregacao_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(taPAUTA) = AValue then Result := 'PAUTA' else
  if Integer(taMARGEM) = AValue then Result := 'MARGEM' else
  raise EnumException.CreateFmt('Valor $d incorreto para TipoAgregacao.', [AValue]);
end;

{ TTipoBonificacao }

function Converter_TipoBonificacao_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'NAO_GERA_PONTOS') then Result := Integer(tbNAO_GERA_PONTOS) else
  if SameText(AValue, 'GERA_PONTOS_POR_QUANTIDADE') then Result := Integer(tbGERA_PONTOS_POR_QUANTIDADE) else
  if SameText(AValue, 'GERA_PONTOS_POR_PRECO') then Result := Integer(tbGERA_PONTOS_POR_PRECO) else
  raise EnumException.CreateFmt('Valor $s incorreto para TipoBonificacao.', [AValue]);
end;

function Converter_TipoBonificacao_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(tbNAO_GERA_PONTOS) = AValue then Result := 'NAO_GERA_PONTOS' else
  if Integer(tbGERA_PONTOS_POR_QUANTIDADE) = AValue then Result := 'GERA_PONTOS_POR_QUANTIDADE' else
  if Integer(tbGERA_PONTOS_POR_PRECO) = AValue then Result := 'GERA_PONTOS_POR_PRECO' else
  raise EnumException.CreateFmt('Valor $d incorreto para TipoBonificacao.', [AValue]);
end;

{ TTipoCategoria }

function Converter_TipoCategoria_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'ANALITICA') then Result := Integer(tcANALITICA) else
  if SameText(AValue, 'SINTETICA') then Result := Integer(tcSINTETICA) else
  raise EnumException.CreateFmt('Valor $s incorreto para TipoCategoria.', [AValue]);
end;

function Converter_TipoCategoria_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(tcANALITICA) = AValue then Result := 'ANALITICA' else
  if Integer(tcSINTETICA) = AValue then Result := 'SINTETICA' else
  raise EnumException.CreateFmt('Valor $d incorreto para TipoCategoria.', [AValue]);
end;

{ TTipoCliente }

function Converter_TipoCliente_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'TITULAR') then Result := Integer(tcTITULAR) else
  if SameText(AValue, 'DEPENDENTE') then Result := Integer(tcDEPENDENTE) else
  raise EnumException.CreateFmt('Valor $s incorreto para TipoCliente.', [AValue]);
end;

function Converter_TipoCliente_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(tcTITULAR) = AValue then Result := 'TITULAR' else
  if Integer(tcDEPENDENTE) = AValue then Result := 'DEPENDENTE' else
  raise EnumException.CreateFmt('Valor $d incorreto para TipoCliente.', [AValue]);
end;

{ TTipoContaCorrente }

function Converter_TipoContaCorrente_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'BANCARIA') then Result := Integer(tccBANCARIA) else
  if SameText(AValue, 'CAIXA') then Result := Integer(tccCAIXA) else
  raise EnumException.CreateFmt('Valor $s incorreto para TipoContaCorrente.', [AValue]);
end;

function Converter_TipoContaCorrente_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(tccBANCARIA) = AValue then Result := 'BANCARIA' else
  if Integer(tccCAIXA) = AValue then Result := 'CAIXA' else
  raise EnumException.CreateFmt('Valor $d incorreto para TipoContaCorrente.', [AValue]);
end;

{ TTipoControleDocumento }

function Converter_TipoControleDocumento_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'CONVENIO') then Result := Integer(tcdCONVENIO) else
  if SameText(AValue, 'AVULSO') then Result := Integer(tcdAVULSO) else
  raise EnumException.CreateFmt('Valor $s incorreto para TipoControleDocumento.', [AValue]);
end;

function Converter_TipoControleDocumento_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(tcdCONVENIO) = AValue then Result := 'CONVENIO' else
  if Integer(tcdAVULSO) = AValue then Result := 'AVULSO' else
  raise EnumException.CreateFmt('Valor $d incorreto para TipoControleDocumento.', [AValue]);
end;

{ TTipoDaPessoa }

function Converter_TipoDaPessoa_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'REDE_ADQUIRENTE') then Result := Integer(tdpREDE_ADQUIRENTE) else
  if SameText(AValue, 'AGENTE_FINANCEIRO') then Result := Integer(tdpAGENTE_FINANCEIRO) else
  if SameText(AValue, 'FUNCIONARIO') then Result := Integer(tdpFUNCIONARIO) else
  if SameText(AValue, 'LOJA') then Result := Integer(tdpLOJA) else
  if SameText(AValue, 'CONTADOR') then Result := Integer(tdpCONTADOR) else
  if SameText(AValue, 'CLIENTE') then Result := Integer(tdpCLIENTE) else
  if SameText(AValue, 'FORNECEDOR') then Result := Integer(tdpFORNECEDOR) else
  if SameText(AValue, 'PROMOTOR_DE_VENDA') then Result := Integer(tdpPROMOTOR_DE_VENDA) else
  raise EnumException.CreateFmt('Valor $s incorreto para TipoDaPessoa.', [AValue]);
end;

function Converter_TipoDaPessoa_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(tdpREDE_ADQUIRENTE) = AValue then Result := 'REDE_ADQUIRENTE' else
  if Integer(tdpAGENTE_FINANCEIRO) = AValue then Result := 'AGENTE_FINANCEIRO' else
  if Integer(tdpFUNCIONARIO) = AValue then Result := 'FUNCIONARIO' else
  if Integer(tdpLOJA) = AValue then Result := 'LOJA' else
  if Integer(tdpCONTADOR) = AValue then Result := 'CONTADOR' else
  if Integer(tdpCLIENTE) = AValue then Result := 'CLIENTE' else
  if Integer(tdpFORNECEDOR) = AValue then Result := 'FORNECEDOR' else
  if Integer(tdpPROMOTOR_DE_VENDA) = AValue then Result := 'PROMOTOR_DE_VENDA' else
  raise EnumException.CreateFmt('Valor $d incorreto para TipoDaPessoa.', [AValue]);
end;

{ TTipoEndereco }

function Converter_TipoEndereco_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PRINCIPAL') then Result := Integer(tePRINCIPAL) else
  if SameText(AValue, 'COBRANCA') then Result := Integer(teCOBRANCA) else
  raise EnumException.CreateFmt('Valor $s incorreto para TipoEndereco.', [AValue]);
end;

function Converter_TipoEndereco_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(tePRINCIPAL) = AValue then Result := 'PRINCIPAL' else
  if Integer(teCOBRANCA) = AValue then Result := 'COBRANCA' else
  raise EnumException.CreateFmt('Valor $d incorreto para TipoEndereco.', [AValue]);
end;

{ TTipoEntrada }

function Converter_TipoEntrada_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PERCENTUAL') then Result := Integer(tePERCENTUAL) else
  if SameText(AValue, 'VALOR') then Result := Integer(teVALOR) else
  raise EnumException.CreateFmt('Valor $s incorreto para TipoEntrada.', [AValue]);
end;

function Converter_TipoEntrada_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(tePERCENTUAL) = AValue then Result := 'PERCENTUAL' else
  if Integer(teVALOR) = AValue then Result := 'VALOR' else
  raise EnumException.CreateFmt('Valor $d incorreto para TipoEntrada.', [AValue]);
end;

{ TTipoEstoque }

function Converter_TipoEstoque_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'TERCEIROS') then Result := Integer(teTERCEIROS) else
  if SameText(AValue, 'PROPRIO') then Result := Integer(tePROPRIO) else
  raise EnumException.CreateFmt('Valor $s incorreto para TipoEstoque.', [AValue]);
end;

function Converter_TipoEstoque_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(teTERCEIROS) = AValue then Result := 'TERCEIROS' else
  if Integer(tePROPRIO) = AValue then Result := 'PROPRIO' else
  raise EnumException.CreateFmt('Valor $d incorreto para TipoEstoque.', [AValue]);
end;

{ TTipoFator }

function Converter_TipoFator_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PRECO') then Result := Integer(tfPRECO) else
  if SameText(AValue, 'FATOR') then Result := Integer(tfFATOR) else
  raise EnumException.CreateFmt('Valor $s incorreto para TipoFator.', [AValue]);
end;

function Converter_TipoFator_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(tfPRECO) = AValue then Result := 'PRECO' else
  if Integer(tfFATOR) = AValue then Result := 'FATOR' else
  raise EnumException.CreateFmt('Valor $d incorreto para TipoFator.', [AValue]);
end;

{ TTipoFinalizadoraPremiacao }

function Converter_TipoFinalizadoraPremiacao_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PERCENTUAL') then Result := Integer(tfpPERCENTUAL) else
  if SameText(AValue, 'VALOR') then Result := Integer(tfpVALOR) else
  raise EnumException.CreateFmt('Valor $s incorreto para TipoFinalizadoraPremiacao.', [AValue]);
end;

function Converter_TipoFinalizadoraPremiacao_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(tfpPERCENTUAL) = AValue then Result := 'PERCENTUAL' else
  if Integer(tfpVALOR) = AValue then Result := 'VALOR' else
  raise EnumException.CreateFmt('Valor $d incorreto para TipoFinalizadoraPremiacao.', [AValue]);
end;

{ TTipoFormaPagamentoCartao }

function Converter_TipoFormaPagamentoCartao_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'DEBITO') then Result := Integer(tfpcDEBITO) else
  if SameText(AValue, 'CREDITO') then Result := Integer(tfpcCREDITO) else
  raise EnumException.CreateFmt('Valor $s incorreto para TipoFormaPagamentoCartao.', [AValue]);
end;

function Converter_TipoFormaPagamentoCartao_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(tfpcDEBITO) = AValue then Result := 'DEBITO' else
  if Integer(tfpcCREDITO) = AValue then Result := 'CREDITO' else
  raise EnumException.CreateFmt('Valor $d incorreto para TipoFormaPagamentoCartao.', [AValue]);
end;

{ TTipoFornecedor }

function Converter_TipoFornecedor_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'DISTRIBUIDORA') then Result := Integer(tfDISTRIBUIDORA) else
  if SameText(AValue, 'SIMPLES_NACIONAL') then Result := Integer(tfSIMPLES_NACIONAL) else
  if SameText(AValue, 'VAREJO') then Result := Integer(tfVAREJO) else
  if SameText(AValue, 'OUTROS') then Result := Integer(tfOUTROS) else
  if SameText(AValue, 'INDUSTRIA') then Result := Integer(tfINDUSTRIA) else
  raise EnumException.CreateFmt('Valor $s incorreto para TipoFornecedor.', [AValue]);
end;

function Converter_TipoFornecedor_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(tfDISTRIBUIDORA) = AValue then Result := 'DISTRIBUIDORA' else
  if Integer(tfSIMPLES_NACIONAL) = AValue then Result := 'SIMPLES_NACIONAL' else
  if Integer(tfVAREJO) = AValue then Result := 'VAREJO' else
  if Integer(tfOUTROS) = AValue then Result := 'OUTROS' else
  if Integer(tfINDUSTRIA) = AValue then Result := 'INDUSTRIA' else
  raise EnumException.CreateFmt('Valor $d incorreto para TipoFornecedor.', [AValue]);
end;

{ TTipoFrenteLoja }

function Converter_TipoFrenteLoja_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'EASY_ASSIST') then Result := Integer(tflEASY_ASSIST) else
  if SameText(AValue, 'SYSPDV') then Result := Integer(tflSYSPDV) else
  raise EnumException.CreateFmt('Valor $s incorreto para TipoFrenteLoja.', [AValue]);
end;

function Converter_TipoFrenteLoja_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(tflEASY_ASSIST) = AValue then Result := 'EASY_ASSIST' else
  if Integer(tflSYSPDV) = AValue then Result := 'SYSPDV' else
  raise EnumException.CreateFmt('Valor $d incorreto para TipoFrenteLoja.', [AValue]);
end;

{ TTipoFreteNota }

function Converter_TipoFreteNota_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'SEM_FRETE') then Result := Integer(tfnSEM_FRETE) else
  if SameText(AValue, 'DESTINATARIO') then Result := Integer(tfnDESTINATARIO) else
  if SameText(AValue, 'TERCEIRO') then Result := Integer(tfnTERCEIRO) else
  if SameText(AValue, 'EMITENTE') then Result := Integer(tfnEMITENTE) else
  raise EnumException.CreateFmt('Valor $s incorreto para TipoFreteNota.', [AValue]);
end;

function Converter_TipoFreteNota_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(tfnSEM_FRETE) = AValue then Result := 'SEM_FRETE' else
  if Integer(tfnDESTINATARIO) = AValue then Result := 'DESTINATARIO' else
  if Integer(tfnTERCEIRO) = AValue then Result := 'TERCEIRO' else
  if Integer(tfnEMITENTE) = AValue then Result := 'EMITENTE' else
  raise EnumException.CreateFmt('Valor $d incorreto para TipoFreteNota.', [AValue]);
end;

{ TTipoIPI }

function Converter_TipoIPI_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PERCENTUAL') then Result := Integer(tipiPERCENTUAL) else
  if SameText(AValue, 'VALOR') then Result := Integer(tipiVALOR) else
  raise EnumException.CreateFmt('Valor $s incorreto para TipoIPI.', [AValue]);
end;

function Converter_TipoIPI_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(tipiPERCENTUAL) = AValue then Result := 'PERCENTUAL' else
  if Integer(tipiVALOR) = AValue then Result := 'VALOR' else
  raise EnumException.CreateFmt('Valor $d incorreto para TipoIPI.', [AValue]);
end;

{ TTipoImposto }

function Converter_TipoImposto_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'COFINS') then Result := Integer(tiCOFINS) else
  if SameText(AValue, 'PIS') then Result := Integer(tiPIS) else
  if SameText(AValue, 'OUTROS') then Result := Integer(tiOUTROS) else
  raise EnumException.CreateFmt('Valor $s incorreto para TipoImposto.', [AValue]);
end;

function Converter_TipoImposto_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(tiCOFINS) = AValue then Result := 'COFINS' else
  if Integer(tiPIS) = AValue then Result := 'PIS' else
  if Integer(tiOUTROS) = AValue then Result := 'OUTROS' else
  raise EnumException.CreateFmt('Valor $d incorreto para TipoImposto.', [AValue]);
end;

{ TTipoIncidencia }

function Converter_TipoIncidencia_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'SAIDA') then Result := Integer(tiSAIDA) else
  if SameText(AValue, 'ENTRADA') then Result := Integer(tiENTRADA) else
  if SameText(AValue, 'AMBOS') then Result := Integer(tiAMBOS) else
  raise EnumException.CreateFmt('Valor $s incorreto para TipoIncidencia.', [AValue]);
end;

function Converter_TipoIncidencia_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(tiSAIDA) = AValue then Result := 'SAIDA' else
  if Integer(tiENTRADA) = AValue then Result := 'ENTRADA' else
  if Integer(tiAMBOS) = AValue then Result := 'AMBOS' else
  raise EnumException.CreateFmt('Valor $d incorreto para TipoIncidencia.', [AValue]);
end;

{ TTipoOperacao }

function Converter_TipoOperacao_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'SAIDA') then Result := Integer(toSAIDA) else
  if SameText(AValue, 'ENTRADA') then Result := Integer(toENTRADA) else
  raise EnumException.CreateFmt('Valor $s incorreto para TipoOperacao.', [AValue]);
end;

function Converter_TipoOperacao_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(toSAIDA) = AValue then Result := 'SAIDA' else
  if Integer(toENTRADA) = AValue then Result := 'ENTRADA' else
  raise EnumException.CreateFmt('Valor $d incorreto para TipoOperacao.', [AValue]);
end;

{ TTipoPauta }

function Converter_TipoPauta_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'MINIMA') then Result := Integer(tpMINIMA) else
  if SameText(AValue, 'FIXA') then Result := Integer(tpFIXA) else
  raise EnumException.CreateFmt('Valor $s incorreto para TipoPauta.', [AValue]);
end;

function Converter_TipoPauta_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(tpMINIMA) = AValue then Result := 'MINIMA' else
  if Integer(tpFIXA) = AValue then Result := 'FIXA' else
  raise EnumException.CreateFmt('Valor $d incorreto para TipoPauta.', [AValue]);
end;

{ TTipoPessoa }

function Converter_TipoPessoa_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'FISICA') then Result := Integer(tpFISICA) else
  if SameText(AValue, 'JURIDICA') then Result := Integer(tpJURIDICA) else
  if SameText(AValue, 'ESTRANGEIRO') then Result := Integer(tpESTRANGEIRO) else
  raise EnumException.CreateFmt('Valor $s incorreto para TipoPessoa.', [AValue]);
end;

function Converter_TipoPessoa_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(tpFISICA) = AValue then Result := 'FISICA' else
  if Integer(tpJURIDICA) = AValue then Result := 'JURIDICA' else
  if Integer(tpESTRANGEIRO) = AValue then Result := 'ESTRANGEIRO' else
  raise EnumException.CreateFmt('Valor $d incorreto para TipoPessoa.', [AValue]);
end;

{ TTipoProdutoAuxiliar }

function Converter_TipoProdutoAuxiliar_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'EAN') then Result := Integer(tpaEAN) else
  if SameText(AValue, 'LITERAL') then Result := Integer(tpaLITERAL) else
  raise EnumException.CreateFmt('Valor $s incorreto para TipoProdutoAuxiliar.', [AValue]);
end;

function Converter_TipoProdutoAuxiliar_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(tpaEAN) = AValue then Result := 'EAN' else
  if Integer(tpaLITERAL) = AValue then Result := 'LITERAL' else
  raise EnumException.CreateFmt('Valor $d incorreto para TipoProdutoAuxiliar.', [AValue]);
end;

{ TTipoPromocao }

function Converter_TipoPromocao_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'DLL_DA_NESTLE') then Result := Integer(tpDLL_DA_NESTLE) else
  if SameText(AValue, 'VALOR_DO_CUPOM') then Result := Integer(tpVALOR_DO_CUPOM) else
  if SameText(AValue, 'VALOR_CUPOM_ITEM_FINALIZADORA') then Result := Integer(tpVALOR_CUPOM_ITEM_FINALIZADORA) else
  if SameText(AValue, 'POR_CUPOM') then Result := Integer(tpPOR_CUPOM) else
  if SameText(AValue, 'POR_FINALIZADORA') then Result := Integer(tpPOR_FINALIZADORA) else
  if SameText(AValue, 'QUANTIDADE_DE_PRODUTO') then Result := Integer(tpQUANTIDADE_DE_PRODUTO) else
  if SameText(AValue, 'VALOR_DO_CUPOM_ITENS') then Result := Integer(tpVALOR_DO_CUPOM_ITENS) else
  if SameText(AValue, 'VALOR_DO_PRODUTO') then Result := Integer(tpVALOR_DO_PRODUTO) else
  raise EnumException.CreateFmt('Valor $s incorreto para TipoPromocao.', [AValue]);
end;

function Converter_TipoPromocao_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(tpDLL_DA_NESTLE) = AValue then Result := 'DLL_DA_NESTLE' else
  if Integer(tpVALOR_DO_CUPOM) = AValue then Result := 'VALOR_DO_CUPOM' else
  if Integer(tpVALOR_CUPOM_ITEM_FINALIZADORA) = AValue then Result := 'VALOR_CUPOM_ITEM_FINALIZADORA' else
  if Integer(tpPOR_CUPOM) = AValue then Result := 'POR_CUPOM' else
  if Integer(tpPOR_FINALIZADORA) = AValue then Result := 'POR_FINALIZADORA' else
  if Integer(tpQUANTIDADE_DE_PRODUTO) = AValue then Result := 'QUANTIDADE_DE_PRODUTO' else
  if Integer(tpVALOR_DO_CUPOM_ITENS) = AValue then Result := 'VALOR_DO_CUPOM_ITENS' else
  if Integer(tpVALOR_DO_PRODUTO) = AValue then Result := 'VALOR_DO_PRODUTO' else
  raise EnumException.CreateFmt('Valor $d incorreto para TipoPromocao.', [AValue]);
end;

{ TTipoReferencia }

function Converter_TipoReferencia_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'CARTAO') then Result := Integer(trCARTAO) else
  if SameText(AValue, 'COMERCIAL') then Result := Integer(trCOMERCIAL) else
  if SameText(AValue, 'EMPRESA') then Result := Integer(trEMPRESA) else
  if SameText(AValue, 'BANCO') then Result := Integer(trBANCO) else
  if SameText(AValue, 'PESSOAL') then Result := Integer(trPESSOAL) else
  if SameText(AValue, 'OUTROS') then Result := Integer(trOUTROS) else
  if SameText(AValue, 'PROFISSIONAL') then Result := Integer(trPROFISSIONAL) else
  raise EnumException.CreateFmt('Valor $s incorreto para TipoReferencia.', [AValue]);
end;

function Converter_TipoReferencia_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(trCARTAO) = AValue then Result := 'CARTAO' else
  if Integer(trCOMERCIAL) = AValue then Result := 'COMERCIAL' else
  if Integer(trEMPRESA) = AValue then Result := 'EMPRESA' else
  if Integer(trBANCO) = AValue then Result := 'BANCO' else
  if Integer(trPESSOAL) = AValue then Result := 'PESSOAL' else
  if Integer(trOUTROS) = AValue then Result := 'OUTROS' else
  if Integer(trPROFISSIONAL) = AValue then Result := 'PROFISSIONAL' else
  raise EnumException.CreateFmt('Valor $d incorreto para TipoReferencia.', [AValue]);
end;

{ TTipoResidencia }

function Converter_TipoResidencia_StrToEnum(const AValue: TString): Integer;
begin
  if SameText(AValue, 'OUTRAS') then Result := Integer(trOUTRAS) else
  if SameText(AValue, 'ALUGADA') then Result := Integer(trALUGADA) else
  if SameText(AValue, 'FINANCIADA') then Result := Integer(trFINANCIADA) else
  if SameText(AValue, 'DE_PARENTE') then Result := Integer(trDE_PARENTE) else
  if SameText(AValue, 'PROPRIA') then Result := Integer(trPROPRIA) else
  raise EnumException.CreateFmt('Valor $s incorreto para TipoResidencia.', [AValue]);
end;

function Converter_TipoResidencia_EnumToStr(const AValue: Integer): TString; overload;
begin
  if Integer(trOUTRAS) = AValue then Result := 'OUTRAS' else
  if Integer(trALUGADA) = AValue then Result := 'ALUGADA' else
  if Integer(trFINANCIADA) = AValue then Result := 'FINANCIADA' else
  if Integer(trDE_PARENTE) = AValue then Result := 'DE_PARENTE' else
  if Integer(trPROPRIA) = AValue then Result := 'PROPRIA' else
  raise EnumException.CreateFmt('Valor $d incorreto para TipoResidencia.', [AValue]);
end;

{ TEnumConversors }

function TEnumConverters.Execute(const AEnumName, AValue: TString): Integer;
var
  Converter: TConverterStrToEnum;
begin
  Converter := TConverterStrToEnum(StrToInt(Self.Values[AEnumName + STR_TO_ENUM]));
  Result := Converter(AValue);
end;

function TEnumConverters.Execute(const AEnumName: TString; AValue: Integer): TString;
var
  Converter: TConverterEnumToStr;
begin
  Converter := TConverterEnumToStr(StrToInt(Self.Values[AEnumName + ENUM_TO_STR]));
  Result := Converter(AValue);
end;

procedure TEnumConverters.Register(const AEnumName: TString;
  AConverterStrToEnum: TConverterStrToEnum; AConverterEnumToStr: TConverterEnumToStr);
begin
  Self.Values[AEnumName + STR_TO_ENUM] := IntToStr(Integer(@AConverterStrToEnum));
  Self.Values[AEnumName + ENUM_TO_STR] := IntToStr(Integer(@AConverterEnumToStr));
end;

initialization
  EnumConverters := TEnumConverters.Create;
  EnumConverters.Register('TAssociacao', @Converter_Associacao_StrToEnum, @Converter_Associacao_EnumToStr);
  EnumConverters.Register('TAtividadeEconomica', @Converter_AtividadeEconomica_StrToEnum, @Converter_AtividadeEconomica_EnumToStr);
  EnumConverters.Register('TCSOSN', @Converter_CSOSN_StrToEnum, @Converter_CSOSN_EnumToStr);
  EnumConverters.Register('TClassificacaoCategoria', @Converter_ClassificacaoCategoria_StrToEnum, @Converter_ClassificacaoCategoria_EnumToStr);
  EnumConverters.Register('TClassificacaoPessoa', @Converter_ClassificacaoPessoa_StrToEnum, @Converter_ClassificacaoPessoa_EnumToStr);
  EnumConverters.Register('TComposicao', @Converter_Composicao_StrToEnum, @Converter_Composicao_EnumToStr);
  EnumConverters.Register('TConciliadora', @Converter_Conciliadora_StrToEnum, @Converter_Conciliadora_EnumToStr);
  EnumConverters.Register('TCondicaoPagamento', @Converter_CondicaoPagamento_StrToEnum, @Converter_CondicaoPagamento_EnumToStr);
  EnumConverters.Register('TEstadoCivil', @Converter_EstadoCivil_StrToEnum, @Converter_EstadoCivil_EnumToStr);
  EnumConverters.Register('TFinalidade', @Converter_Finalidade_StrToEnum, @Converter_Finalidade_EnumToStr);
  EnumConverters.Register('TFinalidadeProduto', @Converter_FinalidadeProduto_StrToEnum, @Converter_FinalidadeProduto_EnumToStr);
  EnumConverters.Register('TGeneroEspecieDocumento', @Converter_GeneroEspecieDocumento_StrToEnum, @Converter_GeneroEspecieDocumento_EnumToStr);
  EnumConverters.Register('TIncidenciaIPI', @Converter_IncidenciaIPI_StrToEnum, @Converter_IncidenciaIPI_EnumToStr);
  EnumConverters.Register('TIndiceAT', @Converter_IndiceAT_StrToEnum, @Converter_IndiceAT_EnumToStr);
  EnumConverters.Register('TMarcaImpressora', @Converter_MarcaImpressora_StrToEnum, @Converter_MarcaImpressora_EnumToStr);
  EnumConverters.Register('TMetodoPagamentoEcommerce', @Converter_MetodoPagamentoEcommerce_StrToEnum, @Converter_MetodoPagamentoEcommerce_EnumToStr);
  EnumConverters.Register('TModalidadeEspeciePagamento', @Converter_ModalidadeEspeciePagamento_StrToEnum, @Converter_ModalidadeEspeciePagamento_EnumToStr);
  EnumConverters.Register('TModeloImpressora', @Converter_ModeloImpressora_StrToEnum, @Converter_ModeloImpressora_EnumToStr);
  EnumConverters.Register('TNivelFornecedor', @Converter_NivelFornecedor_StrToEnum, @Converter_NivelFornecedor_EnumToStr);
  EnumConverters.Register('TPerfilFiscal', @Converter_PerfilFiscal_StrToEnum, @Converter_PerfilFiscal_EnumToStr);
  EnumConverters.Register('TPesoVariavel', @Converter_PesoVariavel_StrToEnum, @Converter_PesoVariavel_EnumToStr);
  EnumConverters.Register('TProducao', @Converter_Producao_StrToEnum, @Converter_Producao_EnumToStr);
  EnumConverters.Register('TResponsavelValidacao', @Converter_ResponsavelValidacao_StrToEnum, @Converter_ResponsavelValidacao_EnumToStr);
  EnumConverters.Register('TSexo', @Converter_Sexo_StrToEnum, @Converter_Sexo_EnumToStr);
  EnumConverters.Register('TSituacaoAprovacao', @Converter_SituacaoAprovacao_StrToEnum, @Converter_SituacaoAprovacao_EnumToStr);
  EnumConverters.Register('TSituacaoLimiteCliente', @Converter_SituacaoLimiteCliente_StrToEnum, @Converter_SituacaoLimiteCliente_EnumToStr);
  EnumConverters.Register('TSituacaoSetor', @Converter_SituacaoSetor_StrToEnum, @Converter_SituacaoSetor_EnumToStr);
  EnumConverters.Register('TStatusBloqueioCliente', @Converter_StatusBloqueioCliente_StrToEnum, @Converter_StatusBloqueioCliente_EnumToStr);
  EnumConverters.Register('TStatusDaPromocao', @Converter_StatusDaPromocao_StrToEnum, @Converter_StatusDaPromocao_EnumToStr);
  EnumConverters.Register('TStatusDoTitulo', @Converter_StatusDoTitulo_StrToEnum, @Converter_StatusDoTitulo_EnumToStr);
  EnumConverters.Register('TStatusTitulo', @Converter_StatusTitulo_StrToEnum, @Converter_StatusTitulo_EnumToStr);
  EnumConverters.Register('TStatusXmlNotaPDV', @Converter_StatusXmlNotaPDV_StrToEnum, @Converter_StatusXmlNotaPDV_EnumToStr);
  EnumConverters.Register('TTabelaA', @Converter_TabelaA_StrToEnum, @Converter_TabelaA_EnumToStr);
  EnumConverters.Register('TTabelaPrazo', @Converter_TabelaPrazo_StrToEnum, @Converter_TabelaPrazo_EnumToStr);
  EnumConverters.Register('TTipoAgregacao', @Converter_TipoAgregacao_StrToEnum, @Converter_TipoAgregacao_EnumToStr);
  EnumConverters.Register('TTipoBonificacao', @Converter_TipoBonificacao_StrToEnum, @Converter_TipoBonificacao_EnumToStr);
  EnumConverters.Register('TTipoCategoria', @Converter_TipoCategoria_StrToEnum, @Converter_TipoCategoria_EnumToStr);
  EnumConverters.Register('TTipoCliente', @Converter_TipoCliente_StrToEnum, @Converter_TipoCliente_EnumToStr);
  EnumConverters.Register('TTipoContaCorrente', @Converter_TipoContaCorrente_StrToEnum, @Converter_TipoContaCorrente_EnumToStr);
  EnumConverters.Register('TTipoControleDocumento', @Converter_TipoControleDocumento_StrToEnum, @Converter_TipoControleDocumento_EnumToStr);
  EnumConverters.Register('TTipoDaPessoa', @Converter_TipoDaPessoa_StrToEnum, @Converter_TipoDaPessoa_EnumToStr);
  EnumConverters.Register('TTipoEndereco', @Converter_TipoEndereco_StrToEnum, @Converter_TipoEndereco_EnumToStr);
  EnumConverters.Register('TTipoEntrada', @Converter_TipoEntrada_StrToEnum, @Converter_TipoEntrada_EnumToStr);
  EnumConverters.Register('TTipoEstoque', @Converter_TipoEstoque_StrToEnum, @Converter_TipoEstoque_EnumToStr);
  EnumConverters.Register('TTipoFator', @Converter_TipoFator_StrToEnum, @Converter_TipoFator_EnumToStr);
  EnumConverters.Register('TTipoFinalizadoraPremiacao', @Converter_TipoFinalizadoraPremiacao_StrToEnum, @Converter_TipoFinalizadoraPremiacao_EnumToStr);
  EnumConverters.Register('TTipoFormaPagamentoCartao', @Converter_TipoFormaPagamentoCartao_StrToEnum, @Converter_TipoFormaPagamentoCartao_EnumToStr);
  EnumConverters.Register('TTipoFornecedor', @Converter_TipoFornecedor_StrToEnum, @Converter_TipoFornecedor_EnumToStr);
  EnumConverters.Register('TTipoFrenteLoja', @Converter_TipoFrenteLoja_StrToEnum, @Converter_TipoFrenteLoja_EnumToStr);
  EnumConverters.Register('TTipoFreteNota', @Converter_TipoFreteNota_StrToEnum, @Converter_TipoFreteNota_EnumToStr);
  EnumConverters.Register('TTipoIPI', @Converter_TipoIPI_StrToEnum, @Converter_TipoIPI_EnumToStr);
  EnumConverters.Register('TTipoImposto', @Converter_TipoImposto_StrToEnum, @Converter_TipoImposto_EnumToStr);
  EnumConverters.Register('TTipoIncidencia', @Converter_TipoIncidencia_StrToEnum, @Converter_TipoIncidencia_EnumToStr);
  EnumConverters.Register('TTipoOperacao', @Converter_TipoOperacao_StrToEnum, @Converter_TipoOperacao_EnumToStr);
  EnumConverters.Register('TTipoPauta', @Converter_TipoPauta_StrToEnum, @Converter_TipoPauta_EnumToStr);
  EnumConverters.Register('TTipoPessoa', @Converter_TipoPessoa_StrToEnum, @Converter_TipoPessoa_EnumToStr);
  EnumConverters.Register('TTipoProdutoAuxiliar', @Converter_TipoProdutoAuxiliar_StrToEnum, @Converter_TipoProdutoAuxiliar_EnumToStr);
  EnumConverters.Register('TTipoPromocao', @Converter_TipoPromocao_StrToEnum, @Converter_TipoPromocao_EnumToStr);
  EnumConverters.Register('TTipoReferencia', @Converter_TipoReferencia_StrToEnum, @Converter_TipoReferencia_EnumToStr);
  EnumConverters.Register('TTipoResidencia', @Converter_TipoResidencia_StrToEnum, @Converter_TipoResidencia_EnumToStr);

finalization
  FreeAndNil(EnumConverters);

end.


unit SDK.Enums;

interface

uses
  SysUtils, Classes, SDK.Types;

type
  EnumException = class(Exception);  

  TConverter = function(const AValue: TString): Integer;

  TEnumConverters = class(TStringList)
  public
    procedure Register(const AEnumName: TString; AConverter: TConverter);
    function Execute(const AEnumName, AValue: TString): Integer;
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

function Converter_Associacao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'NORMAL') then Result := Integer(aNORMAL) else
  raise EnumException.CreateFmt('Valor %s incorreto para Associacao.', [AValue]);
end;

{ TAtividadeEconomica }

function Converter_AtividadeEconomica(const AValue: TString): Integer;
begin
  if SameText(AValue, 'SERVICO') then Result := Integer(aeSERVICO) else
  if SameText(AValue, 'COMERCIO') then Result := Integer(aeCOMERCIO) else
  if SameText(AValue, 'OUTROS') then Result := Integer(aeOUTROS) else
  if SameText(AValue, 'INDUSTRIA') then Result := Integer(aeINDUSTRIA) else
  raise EnumException.CreateFmt('Valor %s incorreto para AtividadeEconomica.', [AValue]);
end;

{ TCSOSN }

function Converter_CSOSN(const AValue: TString): Integer;
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
  raise EnumException.CreateFmt('Valor %s incorreto para CSOSN.', [AValue]);
end;

{ TClassificacaoCategoria }

function Converter_ClassificacaoCategoria(const AValue: TString): Integer;
begin
  if SameText(AValue, 'DESPESA') then Result := Integer(ccDESPESA) else
  if SameText(AValue, 'RECEITA') then Result := Integer(ccRECEITA) else
  raise EnumException.CreateFmt('Valor %s incorreto para ClassificacaoCategoria.', [AValue]);
end;

{ TClassificacaoPessoa }

function Converter_ClassificacaoPessoa(const AValue: TString): Integer;
begin
  if SameText(AValue, 'SAIDA_PARA_NAO_CONTRIBUINTE') then Result := Integer(cpSAIDA_PARA_NAO_CONTRIBUINTE) else
  if SameText(AValue, 'SAIDA_PARA_CONTRIBUINTE') then Result := Integer(cpSAIDA_PARA_CONTRIBUINTE) else
  if SameText(AValue, 'SAIDA_PARA_TRANSFERENCIA') then Result := Integer(cpSAIDA_PARA_TRANSFERENCIA) else
  if SameText(AValue, 'ENTRADA_DE_TRANSFERENCIA') then Result := Integer(cpENTRADA_DE_TRANSFERENCIA) else
  if SameText(AValue, 'ENTRADA_DE_MICROEMPRESA') then Result := Integer(cpENTRADA_DE_MICROEMPRESA) else
  if SameText(AValue, 'ENTRADA_DE_VAREJO') then Result := Integer(cpENTRADA_DE_VAREJO) else
  if SameText(AValue, 'ENTRADA_DE_INDUSTRIA') then Result := Integer(cpENTRADA_DE_INDUSTRIA) else
  if SameText(AValue, 'ENTRADA_DE_DISTRIBUIDOR') then Result := Integer(cpENTRADA_DE_DISTRIBUIDOR) else
  raise EnumException.CreateFmt('Valor %s incorreto para ClassificacaoPessoa.', [AValue]);
end;

{ TComposicao }

function Converter_Composicao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'COMPOSTO') then Result := Integer(cCOMPOSTO) else
  if SameText(AValue, 'KIT') then Result := Integer(cKIT) else
  if SameText(AValue, 'RENDIMENTO') then Result := Integer(cRENDIMENTO) else
  if SameText(AValue, 'NORMAL') then Result := Integer(cNORMAL) else
  raise EnumException.CreateFmt('Valor %s incorreto para Composicao.', [AValue]);
end;

{ TConciliadora }

function Converter_Conciliadora(const AValue: TString): Integer;
begin
  if SameText(AValue, 'BRCONSULTING') then Result := Integer(cBRCONSULTING) else
  raise EnumException.CreateFmt('Valor %s incorreto para Conciliadora.', [AValue]);
end;

{ TCondicaoPagamento }

function Converter_CondicaoPagamento(const AValue: TString): Integer;
begin
  if SameText(AValue, 'A_VISTA') then Result := Integer(cpA_VISTA) else
  if SameText(AValue, 'NAO_INFORMADO') then Result := Integer(cpNAO_INFORMADO) else
  if SameText(AValue, 'A_PRAZO') then Result := Integer(cpA_PRAZO) else
  if SameText(AValue, 'OUTROS') then Result := Integer(cpOUTROS) else
  raise EnumException.CreateFmt('Valor %s incorreto para CondicaoPagamento.', [AValue]);
end;

{ TEstadoCivil }

function Converter_EstadoCivil(const AValue: TString): Integer;
begin
  if SameText(AValue, 'DIVORCIADO') then Result := Integer(ecDIVORCIADO) else
  if SameText(AValue, 'VIUVO') then Result := Integer(ecVIUVO) else
  if SameText(AValue, 'CASADO') then Result := Integer(ecCASADO) else
  if SameText(AValue, 'SOLTEIRO') then Result := Integer(ecSOLTEIRO) else
  if SameText(AValue, 'OUTROS') then Result := Integer(ecOUTROS) else
  raise EnumException.CreateFmt('Valor %s incorreto para EstadoCivil.', [AValue]);
end;

{ TFinalidade }

function Converter_Finalidade(const AValue: TString): Integer;
begin
  if SameText(AValue, 'DEVOLUCAO') then Result := Integer(fDEVOLUCAO) else
  if SameText(AValue, 'TROCA') then Result := Integer(fTROCA) else
  raise EnumException.CreateFmt('Valor %s incorreto para Finalidade.', [AValue]);
end;

{ TFinalidadeProduto }

function Converter_FinalidadeProduto(const AValue: TString): Integer;
begin
  if SameText(AValue, 'COMERCIALIZACAO') then Result := Integer(fpCOMERCIALIZACAO) else
  if SameText(AValue, 'INDUSTRIALIZADO') then Result := Integer(fpINDUSTRIALIZADO) else
  if SameText(AValue, 'CONSUMO') then Result := Integer(fpCONSUMO) else
  if SameText(AValue, 'MATERIA_PRIMA') then Result := Integer(fpMATERIA_PRIMA) else
  if SameText(AValue, 'OUTROS') then Result := Integer(fpOUTROS) else
  if SameText(AValue, 'IMOBILIZADO') then Result := Integer(fpIMOBILIZADO) else
  raise EnumException.CreateFmt('Valor %s incorreto para FinalidadeProduto.', [AValue]);
end;

{ TGeneroEspecieDocumento }

function Converter_GeneroEspecieDocumento(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PAGAR') then Result := Integer(gedPAGAR) else
  if SameText(AValue, 'RECEBER') then Result := Integer(gedRECEBER) else
  raise EnumException.CreateFmt('Valor %s incorreto para GeneroEspecieDocumento.', [AValue]);
end;

{ TIncidenciaIPI }

function Converter_IncidenciaIPI(const AValue: TString): Integer;
begin
  if SameText(AValue, 'VENDA') then Result := Integer(iipiVENDA) else
  if SameText(AValue, 'COMPRA') then Result := Integer(iipiCOMPRA) else
  if SameText(AValue, 'AMBOS') then Result := Integer(iipiAMBOS) else
  raise EnumException.CreateFmt('Valor %s incorreto para IncidenciaIPI.', [AValue]);
end;

{ TIndiceAT }

function Converter_IndiceAT(const AValue: TString): Integer;
begin
  if SameText(AValue, 'TRUNCA') then Result := Integer(iatTRUNCA) else
  if SameText(AValue, 'ARREDONDA') then Result := Integer(iatARREDONDA) else
  raise EnumException.CreateFmt('Valor %s incorreto para IndiceAT.', [AValue]);
end;

{ TMarcaImpressora }

function Converter_MarcaImpressora(const AValue: TString): Integer;
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
  raise EnumException.CreateFmt('Valor %s incorreto para MarcaImpressora.', [AValue]);
end;

{ TMetodoPagamentoEcommerce }

function Converter_MetodoPagamentoEcommerce(const AValue: TString): Integer;
begin
  if SameText(AValue, 'CIELO') then Result := Integer(mpeCIELO) else
  if SameText(AValue, 'E_REDE') then Result := Integer(mpeE_REDE) else
  if SameText(AValue, 'TRANFERENCIA_BANCARIA') then Result := Integer(mpeTRANFERENCIA_BANCARIA) else
  if SameText(AValue, 'BOLETO') then Result := Integer(mpeBOLETO) else
  if SameText(AValue, 'MUNDIPAGG') then Result := Integer(mpeMUNDIPAGG) else
  if SameText(AValue, 'DINHEIRO_OU_CHEQUE') then Result := Integer(mpeDINHEIRO_OU_CHEQUE) else
  raise EnumException.CreateFmt('Valor %s incorreto para MetodoPagamentoEcommerce.', [AValue]);
end;

{ TModalidadeEspeciePagamento }

function Converter_ModalidadeEspeciePagamento(const AValue: TString): Integer;
begin
  if SameText(AValue, 'COMPOSTO') then Result := Integer(mepCOMPOSTO) else
  if SameText(AValue, 'SIMPLES') then Result := Integer(mepSIMPLES) else
  raise EnumException.CreateFmt('Valor %s incorreto para ModalidadeEspeciePagamento.', [AValue]);
end;

{ TModeloImpressora }

function Converter_ModeloImpressora(const AValue: TString): Integer;
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
  raise EnumException.CreateFmt('Valor %s incorreto para ModeloImpressora.', [AValue]);
end;

{ TNivelFornecedor }

function Converter_NivelFornecedor(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PRINCIPAL') then Result := Integer(nfPRINCIPAL) else
  if SameText(AValue, 'SECUNDARIO') then Result := Integer(nfSECUNDARIO) else
  raise EnumException.CreateFmt('Valor %s incorreto para NivelFornecedor.', [AValue]);
end;

{ TPerfilFiscal }

function Converter_PerfilFiscal(const AValue: TString): Integer;
begin
  if SameText(AValue, 'A') then Result := Integer(pfA) else
  if SameText(AValue, 'B') then Result := Integer(pfB) else
  if SameText(AValue, 'C') then Result := Integer(pfC) else
  raise EnumException.CreateFmt('Valor %s incorreto para PerfilFiscal.', [AValue]);
end;

{ TPesoVariavel }

function Converter_PesoVariavel(const AValue: TString): Integer;
begin
  if SameText(AValue, 'UNITARIO') then Result := Integer(pvUNITARIO) else
  if SameText(AValue, 'PENDENTE') then Result := Integer(pvPENDENTE) else
  if SameText(AValue, 'PESO') then Result := Integer(pvPESO) else
  if SameText(AValue, 'SIM') then Result := Integer(pvSIM) else
  if SameText(AValue, 'NAO') then Result := Integer(pvNAO) else
  raise EnumException.CreateFmt('Valor %s incorreto para PesoVariavel.', [AValue]);
end;

{ TProducao }

function Converter_Producao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'TERCEIROS') then Result := Integer(pTERCEIROS) else
  if SameText(AValue, 'PROPRIO') then Result := Integer(pPROPRIO) else
  raise EnumException.CreateFmt('Valor %s incorreto para Producao.', [AValue]);
end;

{ TResponsavelValidacao }

function Converter_ResponsavelValidacao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'MIX_FISCAL') then Result := Integer(rvMIX_FISCAL) else
  if SameText(AValue, 'USUARIO') then Result := Integer(rvUSUARIO) else
  raise EnumException.CreateFmt('Valor %s incorreto para ResponsavelValidacao.', [AValue]);
end;

{ TSexo }

function Converter_Sexo(const AValue: TString): Integer;
begin
  if SameText(AValue, 'MASCULINO') then Result := Integer(sMASCULINO) else
  if SameText(AValue, 'FEMININO') then Result := Integer(sFEMININO) else
  raise EnumException.CreateFmt('Valor %s incorreto para Sexo.', [AValue]);
end;

{ TSituacaoAprovacao }

function Converter_SituacaoAprovacao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PENDENTE') then Result := Integer(saPENDENTE) else
  if SameText(AValue, 'SIM') then Result := Integer(saSIM) else
  if SameText(AValue, 'NAO') then Result := Integer(saNAO) else
  raise EnumException.CreateFmt('Valor %s incorreto para SituacaoAprovacao.', [AValue]);
end;

{ TSituacaoLimiteCliente }

function Converter_SituacaoLimiteCliente(const AValue: TString): Integer;
begin
  if SameText(AValue, 'LIBERADO') then Result := Integer(slcLIBERADO) else
  if SameText(AValue, 'BLOQUEADO') then Result := Integer(slcBLOQUEADO) else
  raise EnumException.CreateFmt('Valor %s incorreto para SituacaoLimiteCliente.', [AValue]);
end;

{ TSituacaoSetor }

function Converter_SituacaoSetor(const AValue: TString): Integer;
begin
  if SameText(AValue, 'ATIVO') then Result := Integer(ssATIVO) else
  if SameText(AValue, 'INATIVO') then Result := Integer(ssINATIVO) else
  raise EnumException.CreateFmt('Valor %s incorreto para SituacaoSetor.', [AValue]);
end;

{ TStatusBloqueioCliente }

function Converter_StatusBloqueioCliente(const AValue: TString): Integer;
begin
  if SameText(AValue, 'BLOQUEADO') then Result := Integer(sbcBLOQUEADO) else
  if SameText(AValue, 'NAO_BLOQUEADO') then Result := Integer(sbcNAO_BLOQUEADO) else
  if SameText(AValue, 'BLOQUEADO_COM_AVISO') then Result := Integer(sbcBLOQUEADO_COM_AVISO) else
  if SameText(AValue, 'BLOQUEADO_COM_AUTORIZACAO') then Result := Integer(sbcBLOQUEADO_COM_AUTORIZACAO) else
  raise EnumException.CreateFmt('Valor %s incorreto para StatusBloqueioCliente.', [AValue]);
end;

{ TStatusDaPromocao }

function Converter_StatusDaPromocao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PROGRAMADA') or SameText(AValue, 'P') then Result := Integer(sdpPROGRAMADA) else
  if SameText(AValue, 'ATIVA') or SameText(AValue, 'A') then Result := Integer(sdpATIVA) else
  if SameText(AValue, 'INATIVA') or SameText(AValue, 'I') then Result := Integer(sdpINATIVA) else
  raise EnumException.CreateFmt('Valor %s incorreto para StatusBloqueioCliente.', [AValue]);
end;

{ TStatusDoTitulo }

function Converter_StatusDoTitulo(const AValue: TString): Integer;
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
  raise EnumException.CreateFmt('Valor %s incorreto para StatusDoTitulo.', [AValue]);
end;

{ TStatusTitulo }

function Converter_StatusTitulo(const AValue: TString): Integer;
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
  raise EnumException.CreateFmt('Valor %s incorreto para StatusTitulo.', [AValue]);
end;

{ TStatusXmlNotaPDV }

function Converter_StatusXmlNotaPDV(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PENDENTE') then Result := Integer(sxnpdvPENDENTE) else
  if SameText(AValue, 'AUTORIZADA') then Result := Integer(sxnpdvAUTORIZADA) else
  if SameText(AValue, 'CANCELADA') then Result := Integer(sxnpdvCANCELADA) else
  if SameText(AValue, 'PENDENTE_CANCELAMENTO') then Result := Integer(sxnpdvPENDENTE_CANCELAMENTO) else
  raise EnumException.CreateFmt('Valor %s incorreto para StatusXmlNotaPDV.', [AValue]);
end;

{ TTabelaA }

function Converter_TabelaA(const AValue: TString): Integer;
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
  raise EnumException.CreateFmt('Valor %s incorreto para TabelaA.', [AValue]);
end;

{ TTabelaPrazo }

function Converter_TabelaPrazo(const AValue: TString): Integer;
begin
  if SameText(AValue, 'DD') then Result := Integer(tpDD) else
  if SameText(AValue, 'DFS') then Result := Integer(tpDFS) else
  if SameText(AValue, 'DF') then Result := Integer(tpDF) else
  if SameText(AValue, 'DFD') then Result := Integer(tpDFD) else
  if SameText(AValue, 'PRZ') then Result := Integer(tpPRZ) else
  if SameText(AValue, 'DFM') then Result := Integer(tpDFM) else
  if SameText(AValue, 'DFQ') then Result := Integer(tpDFQ) else
  raise EnumException.CreateFmt('Valor %s incorreto para TabelaPrazo.', [AValue]);
end;

{ TTipoAgregacao }

function Converter_TipoAgregacao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PAUTA') then Result := Integer(taPAUTA) else
  if SameText(AValue, 'MARGEM') then Result := Integer(taMARGEM) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoAgregacao.', [AValue]);
end;

{ TTipoBonificacao }

function Converter_TipoBonificacao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'NAO_GERA_PONTOS') then Result := Integer(tbNAO_GERA_PONTOS) else
  if SameText(AValue, 'GERA_PONTOS_POR_QUANTIDADE') then Result := Integer(tbGERA_PONTOS_POR_QUANTIDADE) else
  if SameText(AValue, 'GERA_PONTOS_POR_PRECO') then Result := Integer(tbGERA_PONTOS_POR_PRECO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoBonificacao.', [AValue]);
end;

{ TTipoCategoria }

function Converter_TipoCategoria(const AValue: TString): Integer;
begin
  if SameText(AValue, 'ANALITICA') then Result := Integer(tcANALITICA) else
  if SameText(AValue, 'SINTETICA') then Result := Integer(tcSINTETICA) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoCategoria.', [AValue]);
end;

{ TTipoCliente }

function Converter_TipoCliente(const AValue: TString): Integer;
begin
  if SameText(AValue, 'TITULAR') then Result := Integer(tcTITULAR) else
  if SameText(AValue, 'DEPENDENTE') then Result := Integer(tcDEPENDENTE) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoCliente.', [AValue]);
end;

{ TTipoContaCorrente }

function Converter_TipoContaCorrente(const AValue: TString): Integer;
begin
  if SameText(AValue, 'BANCARIA') then Result := Integer(tccBANCARIA) else
  if SameText(AValue, 'CAIXA') then Result := Integer(tccCAIXA) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoContaCorrente.', [AValue]);
end;

{ TTipoControleDocumento }

function Converter_TipoControleDocumento(const AValue: TString): Integer;
begin
  if SameText(AValue, 'CONVENIO') then Result := Integer(tcdCONVENIO) else
  if SameText(AValue, 'AVULSO') then Result := Integer(tcdAVULSO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoControleDocumento.', [AValue]);
end;

{ TTipoDaPessoa }

function Converter_TipoDaPessoa(const AValue: TString): Integer;
begin
  if SameText(AValue, 'REDE_ADQUIRENTE') then Result := Integer(tdpREDE_ADQUIRENTE) else
  if SameText(AValue, 'AGENTE_FINANCEIRO') then Result := Integer(tdpAGENTE_FINANCEIRO) else
  if SameText(AValue, 'FUNCIONARIO') then Result := Integer(tdpFUNCIONARIO) else
  if SameText(AValue, 'LOJA') then Result := Integer(tdpLOJA) else
  if SameText(AValue, 'CONTADOR') then Result := Integer(tdpCONTADOR) else
  if SameText(AValue, 'CLIENTE') then Result := Integer(tdpCLIENTE) else
  if SameText(AValue, 'FORNECEDOR') then Result := Integer(tdpFORNECEDOR) else
  if SameText(AValue, 'PROMOTOR_DE_VENDA') then Result := Integer(tdpPROMOTOR_DE_VENDA) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoDaPessoa.', [AValue]);
end;

{ TTipoEndereco }

function Converter_TipoEndereco(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PRINCIPAL') then Result := Integer(tePRINCIPAL) else
  if SameText(AValue, 'COBRANCA') then Result := Integer(teCOBRANCA) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoEndereco.', [AValue]);
end;

{ TTipoEntrada }

function Converter_TipoEntrada(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PERCENTUAL') then Result := Integer(tePERCENTUAL) else
  if SameText(AValue, 'VALOR') then Result := Integer(teVALOR) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoEntrada.', [AValue]);
end;

{ TTipoEstoque }

function Converter_TipoEstoque(const AValue: TString): Integer;
begin
  if SameText(AValue, 'TERCEIROS') then Result := Integer(teTERCEIROS) else
  if SameText(AValue, 'PROPRIO') then Result := Integer(tePROPRIO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoEstoque.', [AValue]);
end;

{ TTipoFator }

function Converter_TipoFator(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PRECO') then Result := Integer(tfPRECO) else
  if SameText(AValue, 'FATOR') then Result := Integer(tfFATOR) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoFator.', [AValue]);
end;

{ TTipoFinalizadoraPremiacao }

function Converter_TipoFinalizadoraPremiacao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PERCENTUAL') then Result := Integer(tfpPERCENTUAL) else
  if SameText(AValue, 'VALOR') then Result := Integer(tfpVALOR) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoFinalizadoraPremiacao.', [AValue]);
end;

{ TTipoFormaPagamentoCartao }

function Converter_TipoFormaPagamentoCartao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'DEBITO') then Result := Integer(tfpcDEBITO) else
  if SameText(AValue, 'CREDITO') then Result := Integer(tfpcCREDITO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoFormaPagamentoCartao.', [AValue]);
end;

{ TTipoFornecedor }

function Converter_TipoFornecedor(const AValue: TString): Integer;
begin
  if SameText(AValue, 'DISTRIBUIDORA') then Result := Integer(tfDISTRIBUIDORA) else
  if SameText(AValue, 'SIMPLES_NACIONAL') then Result := Integer(tfSIMPLES_NACIONAL) else
  if SameText(AValue, 'VAREJO') then Result := Integer(tfVAREJO) else
  if SameText(AValue, 'OUTROS') then Result := Integer(tfOUTROS) else
  if SameText(AValue, 'INDUSTRIA') then Result := Integer(tfINDUSTRIA) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoFornecedor.', [AValue]);
end;

{ TTipoFrenteLoja }

function Converter_TipoFrenteLoja(const AValue: TString): Integer;
begin
  if SameText(AValue, 'EASY_ASSIST') then Result := Integer(tflEASY_ASSIST) else
  if SameText(AValue, 'SYSPDV') then Result := Integer(tflSYSPDV) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoFrenteLoja.', [AValue]);
end;

{ TTipoFreteNota }

function Converter_TipoFreteNota(const AValue: TString): Integer;
begin
  if SameText(AValue, 'SEM_FRETE') then Result := Integer(tfnSEM_FRETE) else
  if SameText(AValue, 'DESTINATARIO') then Result := Integer(tfnDESTINATARIO) else
  if SameText(AValue, 'TERCEIRO') then Result := Integer(tfnTERCEIRO) else
  if SameText(AValue, 'EMITENTE') then Result := Integer(tfnEMITENTE) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoFreteNota.', [AValue]);
end;

{ TTipoIPI }

function Converter_TipoIPI(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PERCENTUAL') then Result := Integer(tipiPERCENTUAL) else
  if SameText(AValue, 'VALOR') then Result := Integer(tipiVALOR) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoIPI.', [AValue]);
end;

{ TTipoImposto }

function Converter_TipoImposto(const AValue: TString): Integer;
begin
  if SameText(AValue, 'COFINS') then Result := Integer(tiCOFINS) else
  if SameText(AValue, 'PIS') then Result := Integer(tiPIS) else
  if SameText(AValue, 'OUTROS') then Result := Integer(tiOUTROS) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoImposto.', [AValue]);
end;

{ TTipoIncidencia }

function Converter_TipoIncidencia(const AValue: TString): Integer;
begin
  if SameText(AValue, 'SAIDA') then Result := Integer(tiSAIDA) else
  if SameText(AValue, 'ENTRADA') then Result := Integer(tiENTRADA) else
  if SameText(AValue, 'AMBOS') then Result := Integer(tiAMBOS) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoIncidencia.', [AValue]);
end;

{ TTipoOperacao }

function Converter_TipoOperacao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'SAIDA') then Result := Integer(toSAIDA) else
  if SameText(AValue, 'ENTRADA') then Result := Integer(toENTRADA) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoOperacao.', [AValue]);
end;

{ TTipoPauta }

function Converter_TipoPauta(const AValue: TString): Integer;
begin
  if SameText(AValue, 'MINIMA') then Result := Integer(tpMINIMA) else
  if SameText(AValue, 'FIXA') then Result := Integer(tpFIXA) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoPauta.', [AValue]);
end;

{ TTipoPessoa }

function Converter_TipoPessoa(const AValue: TString): Integer;
begin
  if SameText(AValue, 'FISICA') then Result := Integer(tpFISICA) else
  if SameText(AValue, 'JURIDICA') then Result := Integer(tpJURIDICA) else
  if SameText(AValue, 'ESTRANGEIRO') then Result := Integer(tpESTRANGEIRO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoPessoa.', [AValue]);
end;

{ TTipoProdutoAuxiliar }

function Converter_TipoProdutoAuxiliar(const AValue: TString): Integer;
begin
  if SameText(AValue, 'EAN') then Result := Integer(tpaEAN) else
  if SameText(AValue, 'LITERAL') then Result := Integer(tpaLITERAL) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoProdutoAuxiliar.', [AValue]);
end;

{ TTipoPromocao }

function Converter_TipoPromocao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'DLL_DA_NESTLE') then Result := Integer(tpDLL_DA_NESTLE) else
  if SameText(AValue, 'VALOR_DO_CUPOM') then Result := Integer(tpVALOR_DO_CUPOM) else
  if SameText(AValue, 'VALOR_CUPOM_ITEM_FINALIZADORA') then Result := Integer(tpVALOR_CUPOM_ITEM_FINALIZADORA) else
  if SameText(AValue, 'POR_CUPOM') then Result := Integer(tpPOR_CUPOM) else
  if SameText(AValue, 'POR_FINALIZADORA') then Result := Integer(tpPOR_FINALIZADORA) else
  if SameText(AValue, 'QUANTIDADE_DE_PRODUTO') then Result := Integer(tpQUANTIDADE_DE_PRODUTO) else
  if SameText(AValue, 'VALOR_DO_CUPOM_ITENS') then Result := Integer(tpVALOR_DO_CUPOM_ITENS) else
  if SameText(AValue, 'VALOR_DO_PRODUTO') then Result := Integer(tpVALOR_DO_PRODUTO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoPromocao.', [AValue]);
end;

{ TTipoReferencia }

function Converter_TipoReferencia(const AValue: TString): Integer;
begin
  if SameText(AValue, 'CARTAO') then Result := Integer(trCARTAO) else
  if SameText(AValue, 'COMERCIAL') then Result := Integer(trCOMERCIAL) else
  if SameText(AValue, 'EMPRESA') then Result := Integer(trEMPRESA) else
  if SameText(AValue, 'BANCO') then Result := Integer(trBANCO) else
  if SameText(AValue, 'PESSOAL') then Result := Integer(trPESSOAL) else
  if SameText(AValue, 'OUTROS') then Result := Integer(trOUTROS) else
  if SameText(AValue, 'PROFISSIONAL') then Result := Integer(trPROFISSIONAL) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoReferencia.', [AValue]);
end;

{ TTipoResidencia }

function Converter_TipoResidencia(const AValue: TString): Integer;
begin
  if SameText(AValue, 'OUTRAS') then Result := Integer(trOUTRAS) else
  if SameText(AValue, 'ALUGADA') then Result := Integer(trALUGADA) else
  if SameText(AValue, 'FINANCIADA') then Result := Integer(trFINANCIADA) else
  if SameText(AValue, 'DE_PARENTE') then Result := Integer(trDE_PARENTE) else
  if SameText(AValue, 'PROPRIA') then Result := Integer(trPROPRIA) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoResidencia.', [AValue]);
end;

{ TEnumConversors }

function TEnumConverters.Execute(const AEnumName, AValue: TString): Integer;
var
  Converter: TConverter;
begin
  Converter := TConverter(StrToInt(Self.Values[AEnumName]));
  Result := Converter(AValue);
end;

procedure TEnumConverters.Register(const AEnumName: TString;
  AConverter: TConverter);
begin
  Self.Values[AEnumName] := IntToStr(Integer(@AConverter));
end;

initialization
  EnumConverters := TEnumConverters.Create;
  EnumConverters.Register('TAssociacao', @Converter_Associacao);
  EnumConverters.Register('TAtividadeEconomica', @Converter_AtividadeEconomica);
  EnumConverters.Register('TCSOSN', @Converter_CSOSN);
  EnumConverters.Register('TClassificacaoCategoria', @Converter_ClassificacaoCategoria);
  EnumConverters.Register('TClassificacaoPessoa', @Converter_ClassificacaoPessoa);
  EnumConverters.Register('TComposicao', @Converter_Composicao);
  EnumConverters.Register('TConciliadora', @Converter_Conciliadora);
  EnumConverters.Register('TCondicaoPagamento', @Converter_CondicaoPagamento);
  EnumConverters.Register('TEstadoCivil', @Converter_EstadoCivil);
  EnumConverters.Register('TFinalidade', @Converter_Finalidade);
  EnumConverters.Register('TFinalidadeProduto', @Converter_FinalidadeProduto);
  EnumConverters.Register('TGeneroEspecieDocumento', @Converter_GeneroEspecieDocumento);
  EnumConverters.Register('TIncidenciaIPI', @Converter_IncidenciaIPI);
  EnumConverters.Register('TIndiceAT', @Converter_IndiceAT);
  EnumConverters.Register('TMarcaImpressora', @Converter_MarcaImpressora);
  EnumConverters.Register('TMetodoPagamentoEcommerce', @Converter_MetodoPagamentoEcommerce);
  EnumConverters.Register('TModalidadeEspeciePagamento', @Converter_ModalidadeEspeciePagamento);
  EnumConverters.Register('TModeloImpressora', @Converter_ModeloImpressora);
  EnumConverters.Register('TNivelFornecedor', @Converter_NivelFornecedor);
  EnumConverters.Register('TPerfilFiscal', @Converter_PerfilFiscal);
  EnumConverters.Register('TPesoVariavel', @Converter_PesoVariavel);
  EnumConverters.Register('TProducao', @Converter_Producao);
  EnumConverters.Register('TResponsavelValidacao', @Converter_ResponsavelValidacao);
  EnumConverters.Register('TSexo', @Converter_Sexo);
  EnumConverters.Register('TSituacaoAprovacao', @Converter_SituacaoAprovacao);
  EnumConverters.Register('TSituacaoLimiteCliente', @Converter_SituacaoLimiteCliente);
  EnumConverters.Register('TSituacaoSetor', @Converter_SituacaoSetor);
  EnumConverters.Register('TStatusBloqueioCliente', @Converter_StatusBloqueioCliente);
  EnumConverters.Register('TStatusDaPromocao', @Converter_StatusDaPromocao);
  EnumConverters.Register('TStatusDoTitulo', @Converter_StatusDoTitulo);
  EnumConverters.Register('TStatusTitulo', @Converter_StatusTitulo);
  EnumConverters.Register('TStatusXmlNotaPDV', @Converter_StatusXmlNotaPDV);
  EnumConverters.Register('TTabelaA', @Converter_TabelaA);
  EnumConverters.Register('TTabelaPrazo', @Converter_TabelaPrazo);
  EnumConverters.Register('TTipoAgregacao', @Converter_TipoAgregacao);
  EnumConverters.Register('TTipoBonificacao', @Converter_TipoBonificacao);
  EnumConverters.Register('TTipoCategoria', @Converter_TipoCategoria);
  EnumConverters.Register('TTipoCliente', @Converter_TipoCliente);
  EnumConverters.Register('TTipoContaCorrente', @Converter_TipoContaCorrente);
  EnumConverters.Register('TTipoControleDocumento', @Converter_TipoControleDocumento);
  EnumConverters.Register('TTipoDaPessoa', @Converter_TipoDaPessoa);
  EnumConverters.Register('TTipoEndereco', @Converter_TipoEndereco);
  EnumConverters.Register('TTipoEntrada', @Converter_TipoEntrada);
  EnumConverters.Register('TTipoEstoque', @Converter_TipoEstoque);
  EnumConverters.Register('TTipoFator', @Converter_TipoFator);
  EnumConverters.Register('TTipoFinalizadoraPremiacao', @Converter_TipoFinalizadoraPremiacao);
  EnumConverters.Register('TTipoFormaPagamentoCartao', @Converter_TipoFormaPagamentoCartao);
  EnumConverters.Register('TTipoFornecedor', @Converter_TipoFornecedor);
  EnumConverters.Register('TTipoFrenteLoja', @Converter_TipoFrenteLoja);
  EnumConverters.Register('TTipoFreteNota', @Converter_TipoFreteNota);
  EnumConverters.Register('TTipoIPI', @Converter_TipoIPI);
  EnumConverters.Register('TTipoImposto', @Converter_TipoImposto);
  EnumConverters.Register('TTipoIncidencia', @Converter_TipoIncidencia);
  EnumConverters.Register('TTipoOperacao', @Converter_TipoOperacao);
  EnumConverters.Register('TTipoPauta', @Converter_TipoPauta);
  EnumConverters.Register('TTipoPessoa', @Converter_TipoPessoa);
  EnumConverters.Register('TTipoProdutoAuxiliar', @Converter_TipoProdutoAuxiliar);
  EnumConverters.Register('TTipoPromocao', @Converter_TipoPromocao);
  EnumConverters.Register('TTipoReferencia', @Converter_TipoReferencia);
  EnumConverters.Register('TTipoResidencia', @Converter_TipoResidencia);

finalization
  FreeAndNil(EnumConverters);

end.

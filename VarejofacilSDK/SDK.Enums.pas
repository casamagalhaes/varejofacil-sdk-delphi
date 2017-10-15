unit SDK.Enums;

interface

uses
  SysUtils, Classes, SDK.Types, TypInfo;

type
  EnumException = class(Exception);

  TConverter = function(const AValue: TString): Integer;

  TEnumConverters = class(TStringList)
  public
    procedure Register(const AEnumName: TString; AConverter: TConverter);
    function Execute(const AEnumName, AValue: TString): Integer;
    class function EnumToStr(const AEnumType: PTypeInfo; AEnumValue: Integer): TString;
  end;

var
  EnumConverters: TEnumConverters;

type

  TAcaoNotaFiscal = (anfAUTORIZAR, anfEMITIR, anfCANCELAR);

  TAmbiente = (aPRODUCAO, aHOMOLOGACAO);

  TAplicacao = (aSERVER, aDESABILITADO, aSYSPDV_SERVICE);

  TAutorizadorLimiteCredito = (alcNAO_AUTORIZA, alcRETAGUARDA_OFF_LINE, alcNAO, alcVALOR_MAIOR_QUE_ZERO, alcQUALQUER_VALOR);

  TCargoFuncionario = (cfGERENTE, cfOPERADOR, cfGARCOM, cfVENDEDOR);

  TContigenciaEmissaoNotaFiscal = (cenfDPEC, cenfSCAN, cenfFSDA, cenfFS, cenfNORMAL);

  TControlaClienteRetaguarda = (ccrVAREJO_FACIL, ccrWEB_SAC, ccrARQUIVO, ccrSOCKET, ccrSYSPDV, ccrWEB_SERVICE);

  TControlaVendedor = (cvP, cvS, cvN);

  TEspeciePagamento = (epVALE_COMPRA, epFATURA, epDINHEIRO, epVALE_PRESENTE, epVALE_COMBUTIVEL, epCHEQUE, epCARTAO_INT, epOUTROS, epVALE_REFEICAO, epOUTRAS_MOEDAS, epCONVENIO, epCARTAO_CREDITO, epCARTAO_DEBITO, epCREDIARIO, epVALE_ALIMENTACAO);

  TEstoqueProdutoComposto = (epcVENDA, epcPRODUCAO);

  TFinalidadeEstoqueLocal = (felCOMERCIALIZACAO, felIMOBILIZADO);

  TFinalidadeNotaFiscal = (fnfDE_AJUSTE, fnfRESTITUICAO, fnfTRANSFERENCIA_CREDITO, fnfNORMAL, fnfCOMPLEMENTAR);

  TFinalidadeProduto = (fpCOMERCIALIZACAO, fpINDUSTRIALIZADO, fpCONSUMO, fpMATERIA_PRIMA, fpOUTROS, fpIMOBILIZADO, fpSERVICOS);

  TFinalizadoraEspecie = (feCARTAO, feCONVENIO, feVALE_COMPRA, feFATURA, feCREDIARIO, feDINHEIRO, feTICKETS, feCHEQUE, feCARTAO_INTERNO, feOUTROS);

  TFormaAplicacaoDesconto = (fadDESCONTO_NO_SUBTOTAL, fadDESCONTO_NO_ITEM, fadDESCONTO_PLANO_SUBTOTAL, fadDESCONTO_PLANO_ITENS, fadDESABILITADO);

  TFormaEfetivacaoPrevenda = (fepNORMAL_PREVENDA_SEM_PREFINALIZACAO, fepNORMAL_SOLICITA_CODIGO_PREVENDA, fepNORMAL_PREVENDA_PREFINALIZADA, fepPREVENDA_PEDIDO_VENDA, fepNORMAL_PREVENDA);

  TFormaRegistroVendaQuantidade = (frvqDESCONTO_FINALIZADORA, frvqCANCELAMENTO_ITEM, frvqDESCONTO_SUBTOTAL);

  TFormaValidacaoFidelizacao = (fvfPADRAO_EAN, fvfMODULO_11, fvfCPF_CNPJ, fvfNAO_VALIDA);

  TFormatoPlanoConta = (fpcSINTETICO, fpcANALITICO);

  THabilitaTrocoDoacao = (htdTROCO_DOACAO, htdTROCO_PREMIADO, htdNAO);

  TIdentificaoConsumidorNoCupom = (icncQUALQUER_LUGAR_CUPOM, icncINICIO_CUPOM, icncVALOR_CUPOM, icncFINAL_CUPOM);

  TImpressaoComprovanteEntregaDomicilio = (icedNAO_IMPRIME, icedIMPRIME_1_VIA, icedIMPRIME_2_VIAS);

  TImprimeCodigoBarrasCupomPrevenda = (icbcpNUMERO_AUXILIAR, icbcpNAO, icbcpNUMERO_PREVENDA);

  TIndicadorProdutoComposto = (ipcSIM, ipcKIT, ipcNAO);

  TIndicadorQuantidadePrecosVenda = (iqpvUNICO_2_PRECOS, iqpvUTILIZA_FUNCOES, iqpvUNICO_PRECO_2, iqpvUNICO_PRECO_3, iqpvUNICO);

  TIndicadorTransmissao = (itA_TRANSMITIR, itTRANSMITIDO);

  TInformacaoSuplementarCupom = (iscNENHUM, iscPARAIBA_LEGAL, iscNOTA_LEGAL_CONCESSAO_CREDITOS, iscNOTA_LEGAL, iscCUPOM_MANIA, iscMINAS_LEGAL);

  TIntegracaoNetPoints = (inpVAREJO_FACIL, inpDIRETO, inpDESABILITADO);

  TIntegracaoSistemaEstacionamento = (isePONTE, iseAVC, iseDESABILITADO);

  TLimiteCredito = (lcNAO, lcLIMITE_1, lcLIMITE_3);

  TLocalDigitacaoCpfConsumidor = (ldccPINPAD, ldccPINPAD_CONFIRMA_OPERADOR, ldccTECLADO_PINPAD, ldccTECLADO);

  TLocalDigitacaoSenha = (ldsPINPAD, ldsLEITOR_BIOMETRICO_ID_ALTERNADO, ldsSCANNER, ldsLEITOR_BIOMETRICO_ID_UNICO, ldsTECLADO);

  TLocalDigitacaoTelefoneRecarga = (ldtrPINPAD, ldtrTECLADO_PINPAD, ldtrTECLADO);

  TLocalLeituraCodigo = (llcPINPAD, llcSCANNER, llcTECLADO_PINPAD, llcTECLADO);

  TLocalTEF = (ltefAUTOMATICO, ltefMANUAL, ltefDISCADO);

  TMeioAutorizacaoPrivateLabel = (maplNENHUM, maplCARTAO_DE_CREDITO, maplCHEQUE);

  TMeioAutorizacaoTEF = (matefCARTAO_FINIVEST, matefCARTAO_CREDITO_PARCELADO_ADMINISTRADORA, matefMENU_DE_OPCOES, matefRESGATE_DOTZ, matefCARTAO_CREDITO_A_VISTA, matefPRE_AUTORIZACAO, matefCARTAO_CREDITO_PARCELADO_ESTABELECIMENTO, matefCARTAO_REFEICAO_ELETRONICO, matefCARTAO_DEBITO_PARCELADO, matefCONSULTA_CHEQUE_TECBAN, matefCARTAO_DEBITO_CDC, matefGARANTIA_CHEQUE_TECBAN, matefCARTAO_DEBITO_A_VISTA, matefCONSULTA_CHEQUE_SERASA, matefCONSULTA_OU_GARANTIA_DE_CHEQUE, matefCARTAO_CREDITO, matefCARTAO_DEBITO, matefCARTAO_DEBITO_PRE_DATADO);

  TMetodoCalculoDesconto = (mcdQUANTIDADE, mcdVALOR);

  TModalidade = (mTRANSFERENCIA, mRESTITUICAO, mDEVOLUCAO, mCREDITO_ICMS, mTRANSFERENCIA_FISCAL, mNORMAL, mCOMPLEMENTAR);

  TNaturezaLancamento = (nlDEBITO, nlCREDITO);

  TOrigemSerieProduto = (ospAJUSTE);

  TOrigemVenda = (ovFICHA, ovPEDIDO_VENDA_DAV, ovPREVENDA);

  TProdutoAssociacao = (paASSOCIADO, paPACOTE, paNORMAL);

  TRamoAtuacao = (raATACADO, raVAREJO);

  TSimbologiaECF = (secfSERVICO, secfSUBSTITUICAO, secfTRIBUTADO, secfNAO_TRIBUTADO, secfISENTO);

  TSolicitaConfirmacaoTrocaPontosValeCompra = (sctpvcRG, sctpvcDIA_MES_ANO, sctpvcNAO);

  TSolicitaFinalizadoraFidelizacao = (sffPRODUTO, sffCUPOM, sffFINALIZADORA);

  TSolicitaFuncaoFidelizacao = (sffQUALQUER_LUGAR_CUPOM, sffINICIO_CUPOM, sffFINAL_CUPOM);

  TStatusAprovacaoCadastro = (sacPENDENTE, sacSIM, sacNAO);

  TStatusAtivacao = (saATIVO, saINATIVO);

  TStatusAtualPreVenda = (sapvPRONTO, sapvSAIU_PARA_ENTREGA, sapvENTREGUE);

  TStatusBloqueio = (sbBLOQUEADO, sbNAO_BLOQUEADO, sbBLOQUEADO_COM_AVISO, sbBLOQUEADO_COM_AUTORIZACAO);

  TStatusCartaoReceber = (scrABERTA, scrLIQUIDACAO_ANTECIPADA, scrLIQUIDACAO_NORMAL);

  TStatusConciliacao = (scCONCILIADO, scNAO_CONCILIADO);

  TStatusConsumo = (scVENDIDA, scPROCESSO_DE_FECHAMENTO, scABERTA, scTRANSFERIDA);

  TStatusConsumoItem = (sciCANCELADO, sciRECEBIDO, sciVENDIDO, sciTRANSFERIDO);

  TStatusDevolucao = (sdABERTA, sdFECHADA);

  TStatusEntrega = (sePENDENTE, seTRANSITO, seENTREGUE);

  TStatusEnvio = (seENVIADO, seREJEITADO, seAPROVADO, seREENVIADO);

  TStatusNotaFiscal = (snfPENDENTE, snfREJEITADA, snfAUTORIZADA, snfENVIADA, snfCANCELADA, snfDENEGADA, snfERRO);

  TStatusPedido = (spCANCELADO, spABERTO, spEFETIVACAO_SYSPDV_SERVICE, spBAIXADO);

  TStatusPedidoVenda = (spvCANCELADO, spvBLOQUEADA, spvABERTO, spvJUNCAO, spvEFETIVADO, spvVENDIDO);

  TStatusPreVenda = (sprPENDENTE, sprBLOQUEADA, sprORCAMENTO, sprTELE_ENTREGA, sprVENDIDO);

  TStatusRecepcaoVasilhame = (srvVENDA, srvNENHUM, srvRECEBIDO, srvUSADO, srvEXCLUIDO);

  TStatusSerie = (ssUTILIZADO, ssRESERVADO, ssESBOCO, ssLIVRE, ssESTOQUE);

  TStatusTEF = (stefTRANSACAO_NORMAL, stefIMPRESSO_COMPROVANTE, stefCONFIRMACAO_IMPRESSAO_COMPROVANTE, stefPENDENTE_IMPRESSAO);

  TStatusTransacaoNFCE = (stnfcePENDENTE, stnfceAUTORIZADA, stnfceCANCELADA);

  TStatusVendaAssistida = (svaPENDENTE, svaRECEBIDO);

  TTabelaA = (taMERCADORIA_IMPORTACAO_SUPERIOR_40, taMERCADORIA_IMPORTACAO_INFERIOR_40, taIMPORTACAO_DIRETA_SEM_SIMILAR_NACIONAL, taESTRANGEIRA_ADQUIRIDO_MERCADO_INTERNO, taCUJO_PRODUCAO_TENHA_SIDO_FEITO, taADQUIRIDO_MERCADO_INTERNO, taNACIONAL, taMERCADORIA_IMPORTACAO_SUPERIOR_A_70, taIMPORTACAO_DIRETA);

  TTabelaPrazos = (tpDFS, tpDF, tpDFD, tpPRZ, tpDFM, tpDFQ);

  TTamanhoCodigoProdutoBalanca = (tcpbT_4, tcpbT_6, tcpbT_5);

  TTipoAcrescimoDesconto = (tadPERCENTUAL, tadVALOR);

  TTipoAgregacao = (taPAUTA, taMARGEM);

  TTipoAjuste = (taVENDA_PDV, taPRODUCAO_OU_NFC, taCANCELAMENTO, taNOTA_FISCAL_VENDA, taPRE_VENDA, taNOTA_FISCAL_COMPRA, taAJUSTE);

  TTipoArredondamentoTruncamento = (tatTRUNCA, tatARREDONDA);

  TTipoAssociado = (taASSOCIADO, taPRINCIPAL);

  TTipoAtendimento = (taBALCAO, taTELEFONICO);

  TTipoBandeira = (tbDEBITO, tbVOUCHER, tbCREDITO);

  TTipoBonificacao = (tbPRECO, tbQUANTIDADE);

  TTipoCST = (tcstSAIDA, tcstENTRADA);

  TTipoCaixa = (tcRAPIDO, tcNORMAL);

  TTipoCalculoComissao = (tccDISTRIBUIDA, tccPRECO_COM_REDUCAO, tccMINILAB, tccTAXA_SERVICO);

  TTipoComponente = (tcASSOCIADO, tcPRINCIPAL);

  TTipoComunicacaoTEF = (tctefDISCADO, tctefONLINE, tctefONLINE_DLL);

  TTipoConta = (tcBANCARIA, tcCAIXA);

  TTipoContaAReceber = (tcarCARTAO, tcarTITULO);

  TTipoContaCliente = (tccESPECIAL, tccCOMUM);

  TTipoConvenio = (tcINFORMADO_PELO_CAIXA, tcFIXO_CODIGO_BARRAS, tcPADRAO);

  TTipoDocumentoConsultadoTEF = (tdctefCPF, tdctefCNPJ);

  TTipoDocumentoFiscal = (tdfRELATORIO_GERENCIAL, tdfCOMPROVANTE_NAO_FISCAL, tdfCOMPROVANTE_CREDITO_DEBITO);

  TTipoDocumentoTEF = (tdtefTRIBUTO, tdtefTITULO, tdtefARRECADACAO);

  TTipoEcf = (teECF_PDV, teECF_MR, teECF_IF);

  TTipoEmissao = (teSAT, teSERIE_D, teNFCE);

  TTipoEntradaNotaFiscal = (tenfENTRADA_DEVOLUCAO, tenfENTRADA_COMPRA, tenfRESERVADO, tenfENTRADA_TRANSFERENCIA);

  TTipoEspecializacaoCaixa = (tecRAPIDO, tecLANCHONETE, tecNORMAL);

  TTipoFechamento = (tfCUPOM, tfNOTA_FISCAL, tfORCAMENTO);

  TTipoFechamentoPedido = (tfpCUPOM, tfpNOTA_FISCAL);

  TTipoFidelizacao = (tfPRECO, tfQUANTIDADE, tfNAO);

  TTipoFormaPagamento = (tfpA_VISTA, tfpA_PRAZO);

  TTipoFornecedor = (tfTRANSPORTADORA, tfFORNECEDOR);

  TTipoFrete = (tfCIF, tfFOB);

  TTipoGarantia = (tgTROCA, tgREPARO);

  TTipoGeracaoFinanceiro = (tgfGERA_LIQUIDADO, tgfGERA_EM_ABERTO, tgfNAO_GERA);

  TTipoImpressao = (tiEPSON, tiBEMATECH, tiYANCO, tiWINDOWS);

  TTipoImpressaoItem = (tiiIMPRESSO, tiiNORMAL);

  TTipoImpressora = (tiMATRICIAL, tiGRAFICA);

  TTipoIntegracaoRetaguarda = (tirRMS, tirPADRAO, tirMILENIO);

  TTipoItemPreVenda = (tipvVENDA, tipvCANCELADO);

  TTipoJuros = (tjCOMPOSTO, tjSIMPLES);

  TTipoMascaraTexto = (tmtDATA, tmtNUMERICO, tmtCARACTERE);

  TTipoMovimentacao = (tmVENDA, tmORDEM_DE_PRODUCAO, tmCANCELAMENTO, tmNOTA_FISCAL, tmTROCA, tmENTRADA);

  TTipoMovimentacaoCartao = (tmcAUTOMATICO, tmcMANUAL);

  TTipoNota = (tnSAIDA, tnENTRADA);

  TTipoNotaComplementar = (tncICMS, tncPRECO, tncQUANTIDADE);

  TTipoNotaFiscal = (tnfSAIDA);

  TTipoOperacao = (toTRANSFERENCIA, toSAIDA, toENTRADA);

  TTipoOperacaoImpressao = (toiPEDIDO_VENDA, toiFICHA, toiTELE_ENTREGA, toiPREVENDA);

  TTipoPagamento = (tpTOTAL, tpPARCIAL, tpABERTO);

  TTipoPercentualImpostoVenda = (tpivFAIXA_SIMPLES, tpivNCM);

  TTipoPesoVariavel = (tpvUNIDADE_SEM_MULTIPLICACAO_VENDA, tpvFRACIONADO_PADRAO, tpvFRACIONADO_E_ETIQUETA_BALANCA_PESO, tpvUNIDADE_MULTIPLOS_VENDA, tpvUNIDADE_COM_MULTIPLICACAO_NA_VENDA);

  TTipoPesquisaCliente = (tpcCODIGO, tpcCPF_CNPJ, tpcAUTORIZACAO_DE_VENDA, tpcCODIGO_EXTERNO);

  TTipoPessoa = (tpESTRANGEIRA, tpFISICA, tpJURIDICA);

  TTipoPessoaPFPJ = (tppfpjFISICA, tppfpjJURIDICA);

  TTipoPinPad = (tppMODO_SEGURO, tppMODO_DIRETO, tppNAO);

  TTipoPlanoPagamento = (tppTERCEIROS, tppPROPRIO);

  TTipoPreco = (tpP_2, tpP_1, tpP_3);

  TTipoPrecoCusto = (tpcFISCAL, tpcREPOSICAO, tpcMEDIO);

  TTipoPrecoVariavel = (tprPENDENTE_PESAGEM, tprFRACIONADO_ETIQUETA_BALANCA, tprFRACIONADO_ETIQUETA_TECIDO, tprUNIDADE_SEM_MULTIPLICACAO_NA_VENDA, tprUNIDADE_MULTIPLOS_VENDA);

  TTipoPrevisaoEfetivado = (tpePREVISTO, tpeEFETIVO);

  TTipoQuebra = (tqARREDONDAR, tqTRUNCAR);

  TTipoRegimeTributario = (trtSIMPLES_NACIONAL_COM_EXCESSO_SUBLIMITE, trtSIMPLES_NACIONAL);

  TTipoSangria = (tsVENDA, tsCORRESPONDENTE_BANCARIO, tsRECEBIMENTO);

  TTipoSecao = (tsNAO_ALIMENTO, tsALIMENTO, tsAPROPRIACAO);

  TTipoTEF = (ttefVENDA, ttefCORRESPONDENTE_BANCARIO, ttefRECARGA);

  TTipoTaxaServico = (ttsPRODUTO, ttsACRESCIMO, ttsTROCO);

  TTipoTelaPdv = (ttpMAGAZINE, ttpPADRAO);

  TTipoTerminal = (ttMICRO, ttTECLADO_GRADUAL);

  TTipoTexto = (ttDATA, ttNUMERICO, ttCARACTERE);

  TTipoTransacao = (ttFLASH_CAIXA, ttESTORNO_RECEBIMENTO, ttENTRADA_OPERADOR, ttTROCA_BOBINA, ttCANCELAMENTO_125, ttREFORCO_CAIXA, ttINICIALIZA_VENDA_BRUTA, ttSAIDA_OPERADOR, ttFECHAMENTO_CAIXA, ttEMPRESTIMO, ttABERTURA_CAIXA, ttVENDA, ttTROCA_FINALIZACAO, ttABERTURA_GAVETA, ttRECEBIMENTO, ttBLOQUEIO_OPERACOES, ttTRANSACOES_REALIZADAS_ADMINISTRADOR_TEF_SOFTWARE_EXPRESS, ttLEITURA_X, ttESTORNO_PAGAMENTO, ttPAGAMENTO, ttCANCELAMENTO_126, ttCANCELAMENTO_RECEBIMENTO, ttREIMPRESSAO_CUPOM, ttSANGRIA, ttCANCELAMENTO_CARTAO_PROPRIO_OU_TEF);

  TTipoTributacaoEstadual = (tteALIQUOTA_EFETIVA, tteSUPER_SIMPLES, tteNORMAL, tteESTADUAL_SUBSTITUICAO);

  TTipoTributacaoFederal = (ttfLUCRO_REAL, ttfSUPER_SIMPLES, ttfLUCRO_PRESUMIDO);

  TTipoTroco = (ttTROCO, ttCONTRA_VALE);

  TTipoVenda = (tvCANCELADO, tvVENDIDO);

  TVariacaoGramasBalanca = (vgbCINCO_GRAMAS, vgbDUAS_GRAMAS, vgbUM_GRAMA);

  TVersaoSistemaEstacionamento = (vseV10, vseV11);


implementation



{ TAcaoNotaFiscal }

function Converter_AcaoNotaFiscal(const AValue: TString): Integer;
begin
  if SameText(AValue, 'AUTORIZAR') then Result := Integer(anfAUTORIZAR) else
  if SameText(AValue, 'EMITIR') then Result := Integer(anfEMITIR) else
  if SameText(AValue, 'CANCELAR') then Result := Integer(anfCANCELAR) else
  raise EnumException.CreateFmt('Valor %s incorreto para AcaoNotaFiscal.', [AValue]);
end;

{ TAmbiente }

function Converter_Ambiente(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PRODUCAO') then Result := Integer(aPRODUCAO) else
  if SameText(AValue, 'HOMOLOGACAO') then Result := Integer(aHOMOLOGACAO) else
  raise EnumException.CreateFmt('Valor %s incorreto para Ambiente.', [AValue]);
end;

{ TAplicacao }

function Converter_Aplicacao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'SERVER') then Result := Integer(aSERVER) else
  if SameText(AValue, 'DESABILITADO') then Result := Integer(aDESABILITADO) else
  if SameText(AValue, 'SYSPDV_SERVICE') then Result := Integer(aSYSPDV_SERVICE) else
  raise EnumException.CreateFmt('Valor %s incorreto para Aplicacao.', [AValue]);
end;

{ TAutorizadorLimiteCredito }

function Converter_AutorizadorLimiteCredito(const AValue: TString): Integer;
begin
  if SameText(AValue, 'NAO_AUTORIZA') then Result := Integer(alcNAO_AUTORIZA) else
  if SameText(AValue, 'RETAGUARDA_OFF_LINE') then Result := Integer(alcRETAGUARDA_OFF_LINE) else
  if SameText(AValue, 'NAO') then Result := Integer(alcNAO) else
  if SameText(AValue, 'VALOR_MAIOR_QUE_ZERO') then Result := Integer(alcVALOR_MAIOR_QUE_ZERO) else
  if SameText(AValue, 'QUALQUER_VALOR') then Result := Integer(alcQUALQUER_VALOR) else
  raise EnumException.CreateFmt('Valor %s incorreto para AutorizadorLimiteCredito.', [AValue]);
end;

{ TCargoFuncionario }

function Converter_CargoFuncionario(const AValue: TString): Integer;
begin
  if SameText(AValue, 'GERENTE') then Result := Integer(cfGERENTE) else
  if SameText(AValue, 'OPERADOR') then Result := Integer(cfOPERADOR) else
  if SameText(AValue, 'GARCOM') then Result := Integer(cfGARCOM) else
  if SameText(AValue, 'VENDEDOR') then Result := Integer(cfVENDEDOR) else
  raise EnumException.CreateFmt('Valor %s incorreto para CargoFuncionario.', [AValue]);
end;

{ TContigenciaEmissaoNotaFiscal }

function Converter_ContigenciaEmissaoNotaFiscal(const AValue: TString): Integer;
begin
  if SameText(AValue, 'DPEC') then Result := Integer(cenfDPEC) else
  if SameText(AValue, 'SCAN') then Result := Integer(cenfSCAN) else
  if SameText(AValue, 'FSDA') then Result := Integer(cenfFSDA) else
  if SameText(AValue, 'FS') then Result := Integer(cenfFS) else
  if SameText(AValue, 'NORMAL') then Result := Integer(cenfNORMAL) else
  raise EnumException.CreateFmt('Valor %s incorreto para ContigenciaEmissaoNotaFiscal.', [AValue]);
end;

{ TControlaClienteRetaguarda }

function Converter_ControlaClienteRetaguarda(const AValue: TString): Integer;
begin
  if SameText(AValue, 'VAREJO_FACIL') then Result := Integer(ccrVAREJO_FACIL) else
  if SameText(AValue, 'WEB_SAC') then Result := Integer(ccrWEB_SAC) else
  if SameText(AValue, 'ARQUIVO') then Result := Integer(ccrARQUIVO) else
  if SameText(AValue, 'SOCKET') then Result := Integer(ccrSOCKET) else
  if SameText(AValue, 'SYSPDV') then Result := Integer(ccrSYSPDV) else
  if SameText(AValue, 'WEB_SERVICE') then Result := Integer(ccrWEB_SERVICE) else
  raise EnumException.CreateFmt('Valor %s incorreto para ControlaClienteRetaguarda.', [AValue]);
end;

{ TControlaVendedor }

function Converter_ControlaVendedor(const AValue: TString): Integer;
begin
  if SameText(AValue, 'P') then Result := Integer(cvP) else
  if SameText(AValue, 'S') then Result := Integer(cvS) else
  if SameText(AValue, 'N') then Result := Integer(cvN) else
  raise EnumException.CreateFmt('Valor %s incorreto para ControlaVendedor.', [AValue]);
end;

{ TEspeciePagamento }

function Converter_EspeciePagamento(const AValue: TString): Integer;
begin
  if SameText(AValue, 'VALE_COMPRA') then Result := Integer(epVALE_COMPRA) else
  if SameText(AValue, 'FATURA') then Result := Integer(epFATURA) else
  if SameText(AValue, 'DINHEIRO') then Result := Integer(epDINHEIRO) else
  if SameText(AValue, 'VALE_PRESENTE') then Result := Integer(epVALE_PRESENTE) else
  if SameText(AValue, 'VALE_COMBUTIVEL') then Result := Integer(epVALE_COMBUTIVEL) else
  if SameText(AValue, 'CHEQUE') then Result := Integer(epCHEQUE) else
  if SameText(AValue, 'CARTAO_INT') then Result := Integer(epCARTAO_INT) else
  if SameText(AValue, 'OUTROS') then Result := Integer(epOUTROS) else
  if SameText(AValue, 'VALE_REFEICAO') then Result := Integer(epVALE_REFEICAO) else
  if SameText(AValue, 'OUTRAS_MOEDAS') then Result := Integer(epOUTRAS_MOEDAS) else
  if SameText(AValue, 'CONVENIO') then Result := Integer(epCONVENIO) else
  if SameText(AValue, 'CARTAO_CREDITO') then Result := Integer(epCARTAO_CREDITO) else
  if SameText(AValue, 'CARTAO_DEBITO') then Result := Integer(epCARTAO_DEBITO) else
  if SameText(AValue, 'CREDIARIO') then Result := Integer(epCREDIARIO) else
  if SameText(AValue, 'VALE_ALIMENTACAO') then Result := Integer(epVALE_ALIMENTACAO) else
  raise EnumException.CreateFmt('Valor %s incorreto para EspeciePagamento.', [AValue]);
end;

{ TEstoqueProdutoComposto }

function Converter_EstoqueProdutoComposto(const AValue: TString): Integer;
begin
  if SameText(AValue, 'VENDA') then Result := Integer(epcVENDA) else
  if SameText(AValue, 'PRODUCAO') then Result := Integer(epcPRODUCAO) else
  raise EnumException.CreateFmt('Valor %s incorreto para EstoqueProdutoComposto.', [AValue]);
end;

{ TFinalidadeEstoqueLocal }

function Converter_FinalidadeEstoqueLocal(const AValue: TString): Integer;
begin
  if SameText(AValue, 'COMERCIALIZACAO') then Result := Integer(felCOMERCIALIZACAO) else
  if SameText(AValue, 'IMOBILIZADO') then Result := Integer(felIMOBILIZADO) else
  raise EnumException.CreateFmt('Valor %s incorreto para FinalidadeEstoqueLocal.', [AValue]);
end;

{ TFinalidadeNotaFiscal }

function Converter_FinalidadeNotaFiscal(const AValue: TString): Integer;
begin
  if SameText(AValue, 'DE_AJUSTE') then Result := Integer(fnfDE_AJUSTE) else
  if SameText(AValue, 'RESTITUICAO') then Result := Integer(fnfRESTITUICAO) else
  if SameText(AValue, 'TRANSFERENCIA_CREDITO') then Result := Integer(fnfTRANSFERENCIA_CREDITO) else
  if SameText(AValue, 'NORMAL') then Result := Integer(fnfNORMAL) else
  if SameText(AValue, 'COMPLEMENTAR') then Result := Integer(fnfCOMPLEMENTAR) else
  raise EnumException.CreateFmt('Valor %s incorreto para FinalidadeNotaFiscal.', [AValue]);
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
  if SameText(AValue, 'SERVICOS') then Result := Integer(fpSERVICOS) else
  raise EnumException.CreateFmt('Valor %s incorreto para FinalidadeProduto.', [AValue]);
end;

{ TFinalizadoraEspecie }

function Converter_FinalizadoraEspecie(const AValue: TString): Integer;
begin
  if SameText(AValue, 'CARTAO') then Result := Integer(feCARTAO) else
  if SameText(AValue, 'CONVENIO') then Result := Integer(feCONVENIO) else
  if SameText(AValue, 'VALE_COMPRA') then Result := Integer(feVALE_COMPRA) else
  if SameText(AValue, 'FATURA') then Result := Integer(feFATURA) else
  if SameText(AValue, 'CREDIARIO') then Result := Integer(feCREDIARIO) else
  if SameText(AValue, 'DINHEIRO') then Result := Integer(feDINHEIRO) else
  if SameText(AValue, 'TICKETS') then Result := Integer(feTICKETS) else
  if SameText(AValue, 'CHEQUE') then Result := Integer(feCHEQUE) else
  if SameText(AValue, 'CARTAO_INTERNO') then Result := Integer(feCARTAO_INTERNO) else
  if SameText(AValue, 'OUTROS') then Result := Integer(feOUTROS) else
  raise EnumException.CreateFmt('Valor %s incorreto para FinalizadoraEspecie.', [AValue]);
end;

{ TFormaAplicacaoDesconto }

function Converter_FormaAplicacaoDesconto(const AValue: TString): Integer;
begin
  if SameText(AValue, 'DESCONTO_NO_SUBTOTAL') then Result := Integer(fadDESCONTO_NO_SUBTOTAL) else
  if SameText(AValue, 'DESCONTO_NO_ITEM') then Result := Integer(fadDESCONTO_NO_ITEM) else
  if SameText(AValue, 'DESCONTO_PLANO_SUBTOTAL') then Result := Integer(fadDESCONTO_PLANO_SUBTOTAL) else
  if SameText(AValue, 'DESCONTO_PLANO_ITENS') then Result := Integer(fadDESCONTO_PLANO_ITENS) else
  if SameText(AValue, 'DESABILITADO') then Result := Integer(fadDESABILITADO) else
  raise EnumException.CreateFmt('Valor %s incorreto para FormaAplicacaoDesconto.', [AValue]);
end;

{ TFormaEfetivacaoPrevenda }

function Converter_FormaEfetivacaoPrevenda(const AValue: TString): Integer;
begin
  if SameText(AValue, 'NORMAL_PREVENDA_SEM_PREFINALIZACAO') then Result := Integer(fepNORMAL_PREVENDA_SEM_PREFINALIZACAO) else
  if SameText(AValue, 'NORMAL_SOLICITA_CODIGO_PREVENDA') then Result := Integer(fepNORMAL_SOLICITA_CODIGO_PREVENDA) else
  if SameText(AValue, 'NORMAL_PREVENDA_PREFINALIZADA') then Result := Integer(fepNORMAL_PREVENDA_PREFINALIZADA) else
  if SameText(AValue, 'PREVENDA_PEDIDO_VENDA') then Result := Integer(fepPREVENDA_PEDIDO_VENDA) else
  if SameText(AValue, 'NORMAL_PREVENDA') then Result := Integer(fepNORMAL_PREVENDA) else
  raise EnumException.CreateFmt('Valor %s incorreto para FormaEfetivacaoPrevenda.', [AValue]);
end;

{ TFormaRegistroVendaQuantidade }

function Converter_FormaRegistroVendaQuantidade(const AValue: TString): Integer;
begin
  if SameText(AValue, 'DESCONTO_FINALIZADORA') then Result := Integer(frvqDESCONTO_FINALIZADORA) else
  if SameText(AValue, 'CANCELAMENTO_ITEM') then Result := Integer(frvqCANCELAMENTO_ITEM) else
  if SameText(AValue, 'DESCONTO_SUBTOTAL') then Result := Integer(frvqDESCONTO_SUBTOTAL) else
  raise EnumException.CreateFmt('Valor %s incorreto para FormaRegistroVendaQuantidade.', [AValue]);
end;

{ TFormaValidacaoFidelizacao }

function Converter_FormaValidacaoFidelizacao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PADRAO_EAN') then Result := Integer(fvfPADRAO_EAN) else
  if SameText(AValue, 'MODULO_11') then Result := Integer(fvfMODULO_11) else
  if SameText(AValue, 'CPF_CNPJ') then Result := Integer(fvfCPF_CNPJ) else
  if SameText(AValue, 'NAO_VALIDA') then Result := Integer(fvfNAO_VALIDA) else
  raise EnumException.CreateFmt('Valor %s incorreto para FormaValidacaoFidelizacao.', [AValue]);
end;

{ TFormatoPlanoConta }

function Converter_FormatoPlanoConta(const AValue: TString): Integer;
begin
  if SameText(AValue, 'SINTETICO') then Result := Integer(fpcSINTETICO) else
  if SameText(AValue, 'ANALITICO') then Result := Integer(fpcANALITICO) else
  raise EnumException.CreateFmt('Valor %s incorreto para FormatoPlanoConta.', [AValue]);
end;

{ THabilitaTrocoDoacao }

function Converter_HabilitaTrocoDoacao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'TROCO_DOACAO') then Result := Integer(htdTROCO_DOACAO) else
  if SameText(AValue, 'TROCO_PREMIADO') then Result := Integer(htdTROCO_PREMIADO) else
  if SameText(AValue, 'NAO') then Result := Integer(htdNAO) else
  raise EnumException.CreateFmt('Valor %s incorreto para HabilitaTrocoDoacao.', [AValue]);
end;

{ TIdentificaoConsumidorNoCupom }

function Converter_IdentificaoConsumidorNoCupom(const AValue: TString): Integer;
begin
  if SameText(AValue, 'QUALQUER_LUGAR_CUPOM') then Result := Integer(icncQUALQUER_LUGAR_CUPOM) else
  if SameText(AValue, 'INICIO_CUPOM') then Result := Integer(icncINICIO_CUPOM) else
  if SameText(AValue, 'VALOR_CUPOM') then Result := Integer(icncVALOR_CUPOM) else
  if SameText(AValue, 'FINAL_CUPOM') then Result := Integer(icncFINAL_CUPOM) else
  raise EnumException.CreateFmt('Valor %s incorreto para IdentificaoConsumidorNoCupom.', [AValue]);
end;

{ TImpressaoComprovanteEntregaDomicilio }

function Converter_ImpressaoComprovanteEntregaDomicilio(const AValue: TString): Integer;
begin
  if SameText(AValue, 'NAO_IMPRIME') then Result := Integer(icedNAO_IMPRIME) else
  if SameText(AValue, 'IMPRIME_1_VIA') then Result := Integer(icedIMPRIME_1_VIA) else
  if SameText(AValue, 'IMPRIME_2_VIAS') then Result := Integer(icedIMPRIME_2_VIAS) else
  raise EnumException.CreateFmt('Valor %s incorreto para ImpressaoComprovanteEntregaDomicilio.', [AValue]);
end;

{ TImprimeCodigoBarrasCupomPrevenda }

function Converter_ImprimeCodigoBarrasCupomPrevenda(const AValue: TString): Integer;
begin
  if SameText(AValue, 'NUMERO_AUXILIAR') then Result := Integer(icbcpNUMERO_AUXILIAR) else
  if SameText(AValue, 'NAO') then Result := Integer(icbcpNAO) else
  if SameText(AValue, 'NUMERO_PREVENDA') then Result := Integer(icbcpNUMERO_PREVENDA) else
  raise EnumException.CreateFmt('Valor %s incorreto para ImprimeCodigoBarrasCupomPrevenda.', [AValue]);
end;

{ TIndicadorProdutoComposto }

function Converter_IndicadorProdutoComposto(const AValue: TString): Integer;
begin
  if SameText(AValue, 'SIM') then Result := Integer(ipcSIM) else
  if SameText(AValue, 'KIT') then Result := Integer(ipcKIT) else
  if SameText(AValue, 'NAO') then Result := Integer(ipcNAO) else
  raise EnumException.CreateFmt('Valor %s incorreto para IndicadorProdutoComposto.', [AValue]);
end;

{ TIndicadorQuantidadePrecosVenda }

function Converter_IndicadorQuantidadePrecosVenda(const AValue: TString): Integer;
begin
  if SameText(AValue, 'UNICO_2_PRECOS') then Result := Integer(iqpvUNICO_2_PRECOS) else
  if SameText(AValue, 'UTILIZA_FUNCOES') then Result := Integer(iqpvUTILIZA_FUNCOES) else
  if SameText(AValue, 'UNICO_PRECO_2') then Result := Integer(iqpvUNICO_PRECO_2) else
  if SameText(AValue, 'UNICO_PRECO_3') then Result := Integer(iqpvUNICO_PRECO_3) else
  if SameText(AValue, 'UNICO') then Result := Integer(iqpvUNICO) else
  raise EnumException.CreateFmt('Valor %s incorreto para IndicadorQuantidadePrecosVenda.', [AValue]);
end;

{ TIndicadorTransmissao }

function Converter_IndicadorTransmissao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'A_TRANSMITIR') then Result := Integer(itA_TRANSMITIR) else
  if SameText(AValue, 'TRANSMITIDO') then Result := Integer(itTRANSMITIDO) else
  raise EnumException.CreateFmt('Valor %s incorreto para IndicadorTransmissao.', [AValue]);
end;

{ TInformacaoSuplementarCupom }

function Converter_InformacaoSuplementarCupom(const AValue: TString): Integer;
begin
  if SameText(AValue, 'NENHUM') then Result := Integer(iscNENHUM) else
  if SameText(AValue, 'PARAIBA_LEGAL') then Result := Integer(iscPARAIBA_LEGAL) else
  if SameText(AValue, 'NOTA_LEGAL_CONCESSAO_CREDITOS') then Result := Integer(iscNOTA_LEGAL_CONCESSAO_CREDITOS) else
  if SameText(AValue, 'NOTA_LEGAL') then Result := Integer(iscNOTA_LEGAL) else
  if SameText(AValue, 'CUPOM_MANIA') then Result := Integer(iscCUPOM_MANIA) else
  if SameText(AValue, 'MINAS_LEGAL') then Result := Integer(iscMINAS_LEGAL) else
  raise EnumException.CreateFmt('Valor %s incorreto para InformacaoSuplementarCupom.', [AValue]);
end;

{ TIntegracaoNetPoints }

function Converter_IntegracaoNetPoints(const AValue: TString): Integer;
begin
  if SameText(AValue, 'VAREJO_FACIL') then Result := Integer(inpVAREJO_FACIL) else
  if SameText(AValue, 'DIRETO') then Result := Integer(inpDIRETO) else
  if SameText(AValue, 'DESABILITADO') then Result := Integer(inpDESABILITADO) else
  raise EnumException.CreateFmt('Valor %s incorreto para IntegracaoNetPoints.', [AValue]);
end;

{ TIntegracaoSistemaEstacionamento }

function Converter_IntegracaoSistemaEstacionamento(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PONTE') then Result := Integer(isePONTE) else
  if SameText(AValue, 'AVC') then Result := Integer(iseAVC) else
  if SameText(AValue, 'DESABILITADO') then Result := Integer(iseDESABILITADO) else
  raise EnumException.CreateFmt('Valor %s incorreto para IntegracaoSistemaEstacionamento.', [AValue]);
end;

{ TLimiteCredito }

function Converter_LimiteCredito(const AValue: TString): Integer;
begin
  if SameText(AValue, 'NAO') then Result := Integer(lcNAO) else
  if SameText(AValue, 'LIMITE_1') then Result := Integer(lcLIMITE_1) else
  if SameText(AValue, 'LIMITE_3') then Result := Integer(lcLIMITE_3) else
  raise EnumException.CreateFmt('Valor %s incorreto para LimiteCredito.', [AValue]);
end;

{ TLocalDigitacaoCpfConsumidor }

function Converter_LocalDigitacaoCpfConsumidor(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PINPAD') then Result := Integer(ldccPINPAD) else
  if SameText(AValue, 'PINPAD_CONFIRMA_OPERADOR') then Result := Integer(ldccPINPAD_CONFIRMA_OPERADOR) else
  if SameText(AValue, 'TECLADO_PINPAD') then Result := Integer(ldccTECLADO_PINPAD) else
  if SameText(AValue, 'TECLADO') then Result := Integer(ldccTECLADO) else
  raise EnumException.CreateFmt('Valor %s incorreto para LocalDigitacaoCpfConsumidor.', [AValue]);
end;

{ TLocalDigitacaoSenha }

function Converter_LocalDigitacaoSenha(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PINPAD') then Result := Integer(ldsPINPAD) else
  if SameText(AValue, 'LEITOR_BIOMETRICO_ID_ALTERNADO') then Result := Integer(ldsLEITOR_BIOMETRICO_ID_ALTERNADO) else
  if SameText(AValue, 'SCANNER') then Result := Integer(ldsSCANNER) else
  if SameText(AValue, 'LEITOR_BIOMETRICO_ID_UNICO') then Result := Integer(ldsLEITOR_BIOMETRICO_ID_UNICO) else
  if SameText(AValue, 'TECLADO') then Result := Integer(ldsTECLADO) else
  raise EnumException.CreateFmt('Valor %s incorreto para LocalDigitacaoSenha.', [AValue]);
end;

{ TLocalDigitacaoTelefoneRecarga }

function Converter_LocalDigitacaoTelefoneRecarga(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PINPAD') then Result := Integer(ldtrPINPAD) else
  if SameText(AValue, 'TECLADO_PINPAD') then Result := Integer(ldtrTECLADO_PINPAD) else
  if SameText(AValue, 'TECLADO') then Result := Integer(ldtrTECLADO) else
  raise EnumException.CreateFmt('Valor %s incorreto para LocalDigitacaoTelefoneRecarga.', [AValue]);
end;

{ TLocalLeituraCodigo }

function Converter_LocalLeituraCodigo(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PINPAD') then Result := Integer(llcPINPAD) else
  if SameText(AValue, 'SCANNER') then Result := Integer(llcSCANNER) else
  if SameText(AValue, 'TECLADO_PINPAD') then Result := Integer(llcTECLADO_PINPAD) else
  if SameText(AValue, 'TECLADO') then Result := Integer(llcTECLADO) else
  raise EnumException.CreateFmt('Valor %s incorreto para LocalLeituraCodigo.', [AValue]);
end;

{ TLocalTEF }

function Converter_LocalTEF(const AValue: TString): Integer;
begin
  if SameText(AValue, 'AUTOMATICO') then Result := Integer(ltefAUTOMATICO) else
  if SameText(AValue, 'MANUAL') then Result := Integer(ltefMANUAL) else
  if SameText(AValue, 'DISCADO') then Result := Integer(ltefDISCADO) else
  raise EnumException.CreateFmt('Valor %s incorreto para LocalTEF.', [AValue]);
end;

{ TMeioAutorizacaoPrivateLabel }

function Converter_MeioAutorizacaoPrivateLabel(const AValue: TString): Integer;
begin
  if SameText(AValue, 'NENHUM') then Result := Integer(maplNENHUM) else
  if SameText(AValue, 'CARTAO_DE_CREDITO') then Result := Integer(maplCARTAO_DE_CREDITO) else
  if SameText(AValue, 'CHEQUE') then Result := Integer(maplCHEQUE) else
  raise EnumException.CreateFmt('Valor %s incorreto para MeioAutorizacaoPrivateLabel.', [AValue]);
end;

{ TMeioAutorizacaoTEF }

function Converter_MeioAutorizacaoTEF(const AValue: TString): Integer;
begin
  if SameText(AValue, 'CARTAO_FINIVEST') then Result := Integer(matefCARTAO_FINIVEST) else
  if SameText(AValue, 'CARTAO_CREDITO_PARCELADO_ADMINISTRADORA') then Result := Integer(matefCARTAO_CREDITO_PARCELADO_ADMINISTRADORA) else
  if SameText(AValue, 'MENU_DE_OPCOES') then Result := Integer(matefMENU_DE_OPCOES) else
  if SameText(AValue, 'RESGATE_DOTZ') then Result := Integer(matefRESGATE_DOTZ) else
  if SameText(AValue, 'CARTAO_CREDITO_A_VISTA') then Result := Integer(matefCARTAO_CREDITO_A_VISTA) else
  if SameText(AValue, 'PRE_AUTORIZACAO') then Result := Integer(matefPRE_AUTORIZACAO) else
  if SameText(AValue, 'CARTAO_CREDITO_PARCELADO_ESTABELECIMENTO') then Result := Integer(matefCARTAO_CREDITO_PARCELADO_ESTABELECIMENTO) else
  if SameText(AValue, 'CARTAO_REFEICAO_ELETRONICO') then Result := Integer(matefCARTAO_REFEICAO_ELETRONICO) else
  if SameText(AValue, 'CARTAO_DEBITO_PARCELADO') then Result := Integer(matefCARTAO_DEBITO_PARCELADO) else
  if SameText(AValue, 'CONSULTA_CHEQUE_TECBAN') then Result := Integer(matefCONSULTA_CHEQUE_TECBAN) else
  if SameText(AValue, 'CARTAO_DEBITO_CDC') then Result := Integer(matefCARTAO_DEBITO_CDC) else
  if SameText(AValue, 'GARANTIA_CHEQUE_TECBAN') then Result := Integer(matefGARANTIA_CHEQUE_TECBAN) else
  if SameText(AValue, 'CARTAO_DEBITO_A_VISTA') then Result := Integer(matefCARTAO_DEBITO_A_VISTA) else
  if SameText(AValue, 'CONSULTA_CHEQUE_SERASA') then Result := Integer(matefCONSULTA_CHEQUE_SERASA) else
  if SameText(AValue, 'CONSULTA_OU_GARANTIA_DE_CHEQUE') then Result := Integer(matefCONSULTA_OU_GARANTIA_DE_CHEQUE) else
  if SameText(AValue, 'CARTAO_CREDITO') then Result := Integer(matefCARTAO_CREDITO) else
  if SameText(AValue, 'CARTAO_DEBITO') then Result := Integer(matefCARTAO_DEBITO) else
  if SameText(AValue, 'CARTAO_DEBITO_PRE_DATADO') then Result := Integer(matefCARTAO_DEBITO_PRE_DATADO) else
  raise EnumException.CreateFmt('Valor %s incorreto para MeioAutorizacaoTEF.', [AValue]);
end;

{ TMetodoCalculoDesconto }

function Converter_MetodoCalculoDesconto(const AValue: TString): Integer;
begin
  if SameText(AValue, 'QUANTIDADE') then Result := Integer(mcdQUANTIDADE) else
  if SameText(AValue, 'VALOR') then Result := Integer(mcdVALOR) else
  raise EnumException.CreateFmt('Valor %s incorreto para MetodoCalculoDesconto.', [AValue]);
end;

{ TModalidade }

function Converter_Modalidade(const AValue: TString): Integer;
begin
  if SameText(AValue, 'TRANSFERENCIA') then Result := Integer(mTRANSFERENCIA) else
  if SameText(AValue, 'RESTITUICAO') then Result := Integer(mRESTITUICAO) else
  if SameText(AValue, 'DEVOLUCAO') then Result := Integer(mDEVOLUCAO) else
  if SameText(AValue, 'CREDITO_ICMS') then Result := Integer(mCREDITO_ICMS) else
  if SameText(AValue, 'TRANSFERENCIA_FISCAL') then Result := Integer(mTRANSFERENCIA_FISCAL) else
  if SameText(AValue, 'NORMAL') then Result := Integer(mNORMAL) else
  if SameText(AValue, 'COMPLEMENTAR') then Result := Integer(mCOMPLEMENTAR) else
  raise EnumException.CreateFmt('Valor %s incorreto para Modalidade.', [AValue]);
end;

{ TNaturezaLancamento }

function Converter_NaturezaLancamento(const AValue: TString): Integer;
begin
  if SameText(AValue, 'DEBITO') then Result := Integer(nlDEBITO) else
  if SameText(AValue, 'CREDITO') then Result := Integer(nlCREDITO) else
  raise EnumException.CreateFmt('Valor %s incorreto para NaturezaLancamento.', [AValue]);
end;

{ TOrigemSerieProduto }

function Converter_OrigemSerieProduto(const AValue: TString): Integer;
begin
  if SameText(AValue, 'AJUSTE') then Result := Integer(ospAJUSTE) else
  raise EnumException.CreateFmt('Valor %s incorreto para OrigemSerieProduto.', [AValue]);
end;

{ TOrigemVenda }

function Converter_OrigemVenda(const AValue: TString): Integer;
begin
  if SameText(AValue, 'FICHA') then Result := Integer(ovFICHA) else
  if SameText(AValue, 'PEDIDO_VENDA_DAV') then Result := Integer(ovPEDIDO_VENDA_DAV) else
  if SameText(AValue, 'PREVENDA') then Result := Integer(ovPREVENDA) else
  raise EnumException.CreateFmt('Valor %s incorreto para OrigemVenda.', [AValue]);
end;

{ TProdutoAssociacao }

function Converter_ProdutoAssociacao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'ASSOCIADO') then Result := Integer(paASSOCIADO) else
  if SameText(AValue, 'PACOTE') then Result := Integer(paPACOTE) else
  if SameText(AValue, 'NORMAL') then Result := Integer(paNORMAL) else
  raise EnumException.CreateFmt('Valor %s incorreto para ProdutoAssociacao.', [AValue]);
end;

{ TRamoAtuacao }

function Converter_RamoAtuacao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'ATACADO') then Result := Integer(raATACADO) else
  if SameText(AValue, 'VAREJO') then Result := Integer(raVAREJO) else
  raise EnumException.CreateFmt('Valor %s incorreto para RamoAtuacao.', [AValue]);
end;

{ TSimbologiaECF }

function Converter_SimbologiaECF(const AValue: TString): Integer;
begin
  if SameText(AValue, 'SERVICO') then Result := Integer(secfSERVICO) else
  if SameText(AValue, 'SUBSTITUICAO') then Result := Integer(secfSUBSTITUICAO) else
  if SameText(AValue, 'TRIBUTADO') then Result := Integer(secfTRIBUTADO) else
  if SameText(AValue, 'NAO_TRIBUTADO') then Result := Integer(secfNAO_TRIBUTADO) else
  if SameText(AValue, 'ISENTO') then Result := Integer(secfISENTO) else
  raise EnumException.CreateFmt('Valor %s incorreto para SimbologiaECF.', [AValue]);
end;

{ TSolicitaConfirmacaoTrocaPontosValeCompra }

function Converter_SolicitaConfirmacaoTrocaPontosValeCompra(const AValue: TString): Integer;
begin
  if SameText(AValue, 'RG') then Result := Integer(sctpvcRG) else
  if SameText(AValue, 'DIA_MES_ANO') then Result := Integer(sctpvcDIA_MES_ANO) else
  if SameText(AValue, 'NAO') then Result := Integer(sctpvcNAO) else
  raise EnumException.CreateFmt('Valor %s incorreto para SolicitaConfirmacaoTrocaPontosValeCompra.', [AValue]);
end;

{ TSolicitaFinalizadoraFidelizacao }

function Converter_SolicitaFinalizadoraFidelizacao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PRODUTO') then Result := Integer(sffPRODUTO) else
  if SameText(AValue, 'CUPOM') then Result := Integer(sffCUPOM) else
  if SameText(AValue, 'FINALIZADORA') then Result := Integer(sffFINALIZADORA) else
  raise EnumException.CreateFmt('Valor %s incorreto para SolicitaFinalizadoraFidelizacao.', [AValue]);
end;

{ TSolicitaFuncaoFidelizacao }

function Converter_SolicitaFuncaoFidelizacao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'QUALQUER_LUGAR_CUPOM') then Result := Integer(sffQUALQUER_LUGAR_CUPOM) else
  if SameText(AValue, 'INICIO_CUPOM') then Result := Integer(sffINICIO_CUPOM) else
  if SameText(AValue, 'FINAL_CUPOM') then Result := Integer(sffFINAL_CUPOM) else
  raise EnumException.CreateFmt('Valor %s incorreto para SolicitaFuncaoFidelizacao.', [AValue]);
end;

{ TStatusAprovacaoCadastro }

function Converter_StatusAprovacaoCadastro(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PENDENTE') then Result := Integer(sacPENDENTE) else
  if SameText(AValue, 'SIM') then Result := Integer(sacSIM) else
  if SameText(AValue, 'NAO') then Result := Integer(sacNAO) else
  raise EnumException.CreateFmt('Valor %s incorreto para StatusAprovacaoCadastro.', [AValue]);
end;

{ TStatusAtivacao }

function Converter_StatusAtivacao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'ATIVO') then Result := Integer(saATIVO) else
  if SameText(AValue, 'INATIVO') then Result := Integer(saINATIVO) else
  raise EnumException.CreateFmt('Valor %s incorreto para StatusAtivacao.', [AValue]);
end;

{ TStatusAtualPreVenda }

function Converter_StatusAtualPreVenda(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PRONTO') then Result := Integer(sapvPRONTO) else
  if SameText(AValue, 'SAIU_PARA_ENTREGA') then Result := Integer(sapvSAIU_PARA_ENTREGA) else
  if SameText(AValue, 'ENTREGUE') then Result := Integer(sapvENTREGUE) else
  raise EnumException.CreateFmt('Valor %s incorreto para StatusAtualPreVenda.', [AValue]);
end;

{ TStatusBloqueio }

function Converter_StatusBloqueio(const AValue: TString): Integer;
begin
  if SameText(AValue, 'BLOQUEADO') then Result := Integer(sbBLOQUEADO) else
  if SameText(AValue, 'NAO_BLOQUEADO') then Result := Integer(sbNAO_BLOQUEADO) else
  if SameText(AValue, 'BLOQUEADO_COM_AVISO') then Result := Integer(sbBLOQUEADO_COM_AVISO) else
  if SameText(AValue, 'BLOQUEADO_COM_AUTORIZACAO') then Result := Integer(sbBLOQUEADO_COM_AUTORIZACAO) else
  raise EnumException.CreateFmt('Valor %s incorreto para StatusBloqueio.', [AValue]);
end;

{ TStatusCartaoReceber }

function Converter_StatusCartaoReceber(const AValue: TString): Integer;
begin
  if SameText(AValue, 'ABERTA') then Result := Integer(scrABERTA) else
  if SameText(AValue, 'LIQUIDACAO_ANTECIPADA') then Result := Integer(scrLIQUIDACAO_ANTECIPADA) else
  if SameText(AValue, 'LIQUIDACAO_NORMAL') then Result := Integer(scrLIQUIDACAO_NORMAL) else
  raise EnumException.CreateFmt('Valor %s incorreto para StatusCartaoReceber.', [AValue]);
end;

{ TStatusConciliacao }

function Converter_StatusConciliacao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'CONCILIADO') then Result := Integer(scCONCILIADO) else
  if SameText(AValue, 'NAO_CONCILIADO') then Result := Integer(scNAO_CONCILIADO) else
  raise EnumException.CreateFmt('Valor %s incorreto para StatusConciliacao.', [AValue]);
end;

{ TStatusConsumo }

function Converter_StatusConsumo(const AValue: TString): Integer;
begin
  if SameText(AValue, 'VENDIDA') then Result := Integer(scVENDIDA) else
  if SameText(AValue, 'PROCESSO_DE_FECHAMENTO') then Result := Integer(scPROCESSO_DE_FECHAMENTO) else
  if SameText(AValue, 'ABERTA') then Result := Integer(scABERTA) else
  if SameText(AValue, 'TRANSFERIDA') then Result := Integer(scTRANSFERIDA) else
  raise EnumException.CreateFmt('Valor %s incorreto para StatusConsumo.', [AValue]);
end;

{ TStatusConsumoItem }

function Converter_StatusConsumoItem(const AValue: TString): Integer;
begin
  if SameText(AValue, 'CANCELADO') then Result := Integer(sciCANCELADO) else
  if SameText(AValue, 'RECEBIDO') then Result := Integer(sciRECEBIDO) else
  if SameText(AValue, 'VENDIDO') then Result := Integer(sciVENDIDO) else
  if SameText(AValue, 'TRANSFERIDO') then Result := Integer(sciTRANSFERIDO) else
  raise EnumException.CreateFmt('Valor %s incorreto para StatusConsumoItem.', [AValue]);
end;

{ TStatusDevolucao }

function Converter_StatusDevolucao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'ABERTA') then Result := Integer(sdABERTA) else
  if SameText(AValue, 'FECHADA') then Result := Integer(sdFECHADA) else
  raise EnumException.CreateFmt('Valor %s incorreto para StatusDevolucao.', [AValue]);
end;

{ TStatusEntrega }

function Converter_StatusEntrega(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PENDENTE') then Result := Integer(sePENDENTE) else
  if SameText(AValue, 'TRANSITO') then Result := Integer(seTRANSITO) else
  if SameText(AValue, 'ENTREGUE') then Result := Integer(seENTREGUE) else
  raise EnumException.CreateFmt('Valor %s incorreto para StatusEntrega.', [AValue]);
end;

{ TStatusEnvio }

function Converter_StatusEnvio(const AValue: TString): Integer;
begin
  if SameText(AValue, 'ENVIADO') then Result := Integer(seENVIADO) else
  if SameText(AValue, 'REJEITADO') then Result := Integer(seREJEITADO) else
  if SameText(AValue, 'APROVADO') then Result := Integer(seAPROVADO) else
  if SameText(AValue, 'REENVIADO') then Result := Integer(seREENVIADO) else
  raise EnumException.CreateFmt('Valor %s incorreto para StatusEnvio.', [AValue]);
end;

{ TStatusNotaFiscal }

function Converter_StatusNotaFiscal(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PENDENTE') then Result := Integer(snfPENDENTE) else
  if SameText(AValue, 'REJEITADA') then Result := Integer(snfREJEITADA) else
  if SameText(AValue, 'AUTORIZADA') then Result := Integer(snfAUTORIZADA) else
  if SameText(AValue, 'ENVIADA') then Result := Integer(snfENVIADA) else
  if SameText(AValue, 'CANCELADA') then Result := Integer(snfCANCELADA) else
  if SameText(AValue, 'DENEGADA') then Result := Integer(snfDENEGADA) else
  if SameText(AValue, 'ERRO') then Result := Integer(snfERRO) else
  raise EnumException.CreateFmt('Valor %s incorreto para StatusNotaFiscal.', [AValue]);
end;

{ TStatusPedido }

function Converter_StatusPedido(const AValue: TString): Integer;
begin
  if SameText(AValue, 'CANCELADO') then Result := Integer(spCANCELADO) else
  if SameText(AValue, 'ABERTO') then Result := Integer(spABERTO) else
  if SameText(AValue, 'EFETIVACAO_SYSPDV_SERVICE') then Result := Integer(spEFETIVACAO_SYSPDV_SERVICE) else
  if SameText(AValue, 'BAIXADO') then Result := Integer(spBAIXADO) else
  raise EnumException.CreateFmt('Valor %s incorreto para StatusPedido.', [AValue]);
end;

{ TStatusPedidoVenda }

function Converter_StatusPedidoVenda(const AValue: TString): Integer;
begin
  if SameText(AValue, 'CANCELADO') then Result := Integer(spvCANCELADO) else
  if SameText(AValue, 'BLOQUEADA') then Result := Integer(spvBLOQUEADA) else
  if SameText(AValue, 'ABERTO') then Result := Integer(spvABERTO) else
  if SameText(AValue, 'JUNCAO') then Result := Integer(spvJUNCAO) else
  if SameText(AValue, 'EFETIVADO') then Result := Integer(spvEFETIVADO) else
  if SameText(AValue, 'VENDIDO') then Result := Integer(spvVENDIDO) else
  raise EnumException.CreateFmt('Valor %s incorreto para StatusPedidoVenda.', [AValue]);
end;

{ TStatusPreVenda }

function Converter_StatusPreVenda(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PENDENTE') then Result := Integer(sprPENDENTE) else
  if SameText(AValue, 'BLOQUEADA') then Result := Integer(sprBLOQUEADA) else
  if SameText(AValue, 'ORCAMENTO') then Result := Integer(sprORCAMENTO) else
  if SameText(AValue, 'TELE_ENTREGA') then Result := Integer(sprTELE_ENTREGA) else
  if SameText(AValue, 'VENDIDO') then Result := Integer(sprVENDIDO) else
  raise EnumException.CreateFmt('Valor %s incorreto para StatusPreVenda.', [AValue]);
end;

{ TStatusRecepcaoVasilhame }

function Converter_StatusRecepcaoVasilhame(const AValue: TString): Integer;
begin
  if SameText(AValue, 'VENDA') then Result := Integer(srvVENDA) else
  if SameText(AValue, 'NENHUM') then Result := Integer(srvNENHUM) else
  if SameText(AValue, 'RECEBIDO') then Result := Integer(srvRECEBIDO) else
  if SameText(AValue, 'USADO') then Result := Integer(srvUSADO) else
  if SameText(AValue, 'EXCLUIDO') then Result := Integer(srvEXCLUIDO) else
  raise EnumException.CreateFmt('Valor %s incorreto para StatusRecepcaoVasilhame.', [AValue]);
end;

{ TStatusSerie }

function Converter_StatusSerie(const AValue: TString): Integer;
begin
  if SameText(AValue, 'UTILIZADO') then Result := Integer(ssUTILIZADO) else
  if SameText(AValue, 'RESERVADO') then Result := Integer(ssRESERVADO) else
  if SameText(AValue, 'ESBOCO') then Result := Integer(ssESBOCO) else
  if SameText(AValue, 'LIVRE') then Result := Integer(ssLIVRE) else
  if SameText(AValue, 'ESTOQUE') then Result := Integer(ssESTOQUE) else
  raise EnumException.CreateFmt('Valor %s incorreto para StatusSerie.', [AValue]);
end;

{ TStatusTEF }

function Converter_StatusTEF(const AValue: TString): Integer;
begin
  if SameText(AValue, 'TRANSACAO_NORMAL') then Result := Integer(stefTRANSACAO_NORMAL) else
  if SameText(AValue, 'IMPRESSO_COMPROVANTE') then Result := Integer(stefIMPRESSO_COMPROVANTE) else
  if SameText(AValue, 'CONFIRMACAO_IMPRESSAO_COMPROVANTE') then Result := Integer(stefCONFIRMACAO_IMPRESSAO_COMPROVANTE) else
  if SameText(AValue, 'PENDENTE_IMPRESSAO') then Result := Integer(stefPENDENTE_IMPRESSAO) else
  raise EnumException.CreateFmt('Valor %s incorreto para StatusTEF.', [AValue]);
end;

{ TStatusTransacaoNFCE }

function Converter_StatusTransacaoNFCE(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PENDENTE') then Result := Integer(stnfcePENDENTE) else
  if SameText(AValue, 'AUTORIZADA') then Result := Integer(stnfceAUTORIZADA) else
  if SameText(AValue, 'CANCELADA') then Result := Integer(stnfceCANCELADA) else
  raise EnumException.CreateFmt('Valor %s incorreto para StatusTransacaoNFCE.', [AValue]);
end;

{ TStatusVendaAssistida }

function Converter_StatusVendaAssistida(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PENDENTE') then Result := Integer(svaPENDENTE) else
  if SameText(AValue, 'RECEBIDO') then Result := Integer(svaRECEBIDO) else
  raise EnumException.CreateFmt('Valor %s incorreto para StatusVendaAssistida.', [AValue]);
end;

{ TTabelaA }

function Converter_TabelaA(const AValue: TString): Integer;
begin
  if SameText(AValue, 'MERCADORIA_IMPORTACAO_SUPERIOR_40') then Result := Integer(taMERCADORIA_IMPORTACAO_SUPERIOR_40) else
  if SameText(AValue, 'MERCADORIA_IMPORTACAO_INFERIOR_40') then Result := Integer(taMERCADORIA_IMPORTACAO_INFERIOR_40) else
  if SameText(AValue, 'IMPORTACAO_DIRETA_SEM_SIMILAR_NACIONAL') then Result := Integer(taIMPORTACAO_DIRETA_SEM_SIMILAR_NACIONAL) else
  if SameText(AValue, 'ESTRANGEIRA_ADQUIRIDO_MERCADO_INTERNO') then Result := Integer(taESTRANGEIRA_ADQUIRIDO_MERCADO_INTERNO) else
  if SameText(AValue, 'CUJO_PRODUCAO_TENHA_SIDO_FEITO') then Result := Integer(taCUJO_PRODUCAO_TENHA_SIDO_FEITO) else
  if SameText(AValue, 'ADQUIRIDO_MERCADO_INTERNO') then Result := Integer(taADQUIRIDO_MERCADO_INTERNO) else
  if SameText(AValue, 'NACIONAL') then Result := Integer(taNACIONAL) else
  if SameText(AValue, 'MERCADORIA_IMPORTACAO_SUPERIOR_A_70') then Result := Integer(taMERCADORIA_IMPORTACAO_SUPERIOR_A_70) else
  if SameText(AValue, 'IMPORTACAO_DIRETA') then Result := Integer(taIMPORTACAO_DIRETA) else
  raise EnumException.CreateFmt('Valor %s incorreto para TabelaA.', [AValue]);
end;

{ TTabelaPrazos }

function Converter_TabelaPrazos(const AValue: TString): Integer;
begin
  if SameText(AValue, 'DFS') then Result := Integer(tpDFS) else
  if SameText(AValue, 'DF') then Result := Integer(tpDF) else
  if SameText(AValue, 'DFD') then Result := Integer(tpDFD) else
  if SameText(AValue, 'PRZ') then Result := Integer(tpPRZ) else
  if SameText(AValue, 'DFM') then Result := Integer(tpDFM) else
  if SameText(AValue, 'DFQ') then Result := Integer(tpDFQ) else
  raise EnumException.CreateFmt('Valor %s incorreto para TabelaPrazos.', [AValue]);
end;

{ TTamanhoCodigoProdutoBalanca }

function Converter_TamanhoCodigoProdutoBalanca(const AValue: TString): Integer;
begin
  if SameText(AValue, 'T_4') then Result := Integer(tcpbT_4) else
  if SameText(AValue, 'T_6') then Result := Integer(tcpbT_6) else
  if SameText(AValue, 'T_5') then Result := Integer(tcpbT_5) else
  raise EnumException.CreateFmt('Valor %s incorreto para TamanhoCodigoProdutoBalanca.', [AValue]);
end;

{ TTipoAcrescimoDesconto }

function Converter_TipoAcrescimoDesconto(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PERCENTUAL') then Result := Integer(tadPERCENTUAL) else
  if SameText(AValue, 'VALOR') then Result := Integer(tadVALOR) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoAcrescimoDesconto.', [AValue]);
end;

{ TTipoAgregacao }

function Converter_TipoAgregacao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PAUTA') then Result := Integer(taPAUTA) else
  if SameText(AValue, 'MARGEM') then Result := Integer(taMARGEM) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoAgregacao.', [AValue]);
end;

{ TTipoAjuste }

function Converter_TipoAjuste(const AValue: TString): Integer;
begin
  if SameText(AValue, 'VENDA_PDV') then Result := Integer(taVENDA_PDV) else
  if SameText(AValue, 'PRODUCAO_OU_NFC') then Result := Integer(taPRODUCAO_OU_NFC) else
  if SameText(AValue, 'CANCELAMENTO') then Result := Integer(taCANCELAMENTO) else
  if SameText(AValue, 'NOTA_FISCAL_VENDA') then Result := Integer(taNOTA_FISCAL_VENDA) else
  if SameText(AValue, 'PRE_VENDA') then Result := Integer(taPRE_VENDA) else
  if SameText(AValue, 'NOTA_FISCAL_COMPRA') then Result := Integer(taNOTA_FISCAL_COMPRA) else
  if SameText(AValue, 'AJUSTE') then Result := Integer(taAJUSTE) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoAjuste.', [AValue]);
end;

{ TTipoArredondamentoTruncamento }

function Converter_TipoArredondamentoTruncamento(const AValue: TString): Integer;
begin
  if SameText(AValue, 'TRUNCA') then Result := Integer(tatTRUNCA) else
  if SameText(AValue, 'ARREDONDA') then Result := Integer(tatARREDONDA) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoArredondamentoTruncamento.', [AValue]);
end;

{ TTipoAssociado }

function Converter_TipoAssociado(const AValue: TString): Integer;
begin
  if SameText(AValue, 'ASSOCIADO') then Result := Integer(taASSOCIADO) else
  if SameText(AValue, 'PRINCIPAL') then Result := Integer(taPRINCIPAL) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoAssociado.', [AValue]);
end;

{ TTipoAtendimento }

function Converter_TipoAtendimento(const AValue: TString): Integer;
begin
  if SameText(AValue, 'BALCAO') then Result := Integer(taBALCAO) else
  if SameText(AValue, 'TELEFONICO') then Result := Integer(taTELEFONICO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoAtendimento.', [AValue]);
end;

{ TTipoBandeira }

function Converter_TipoBandeira(const AValue: TString): Integer;
begin
  if SameText(AValue, 'DEBITO') then Result := Integer(tbDEBITO) else
  if SameText(AValue, 'VOUCHER') then Result := Integer(tbVOUCHER) else
  if SameText(AValue, 'CREDITO') then Result := Integer(tbCREDITO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoBandeira.', [AValue]);
end;

{ TTipoBonificacao }

function Converter_TipoBonificacao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PRECO') then Result := Integer(tbPRECO) else
  if SameText(AValue, 'QUANTIDADE') then Result := Integer(tbQUANTIDADE) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoBonificacao.', [AValue]);
end;

{ TTipoCST }

function Converter_TipoCST(const AValue: TString): Integer;
begin
  if SameText(AValue, 'SAIDA') then Result := Integer(tcstSAIDA) else
  if SameText(AValue, 'ENTRADA') then Result := Integer(tcstENTRADA) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoCST.', [AValue]);
end;

{ TTipoCaixa }

function Converter_TipoCaixa(const AValue: TString): Integer;
begin
  if SameText(AValue, 'RAPIDO') then Result := Integer(tcRAPIDO) else
  if SameText(AValue, 'NORMAL') then Result := Integer(tcNORMAL) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoCaixa.', [AValue]);
end;

{ TTipoCalculoComissao }

function Converter_TipoCalculoComissao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'DISTRIBUIDA') then Result := Integer(tccDISTRIBUIDA) else
  if SameText(AValue, 'PRECO_COM_REDUCAO') then Result := Integer(tccPRECO_COM_REDUCAO) else
  if SameText(AValue, 'MINILAB') then Result := Integer(tccMINILAB) else
  if SameText(AValue, 'TAXA_SERVICO') then Result := Integer(tccTAXA_SERVICO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoCalculoComissao.', [AValue]);
end;

{ TTipoComponente }

function Converter_TipoComponente(const AValue: TString): Integer;
begin
  if SameText(AValue, 'ASSOCIADO') then Result := Integer(tcASSOCIADO) else
  if SameText(AValue, 'PRINCIPAL') then Result := Integer(tcPRINCIPAL) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoComponente.', [AValue]);
end;

{ TTipoComunicacaoTEF }

function Converter_TipoComunicacaoTEF(const AValue: TString): Integer;
begin
  if SameText(AValue, 'DISCADO') then Result := Integer(tctefDISCADO) else
  if SameText(AValue, 'ONLINE') then Result := Integer(tctefONLINE) else
  if SameText(AValue, 'ONLINE_DLL') then Result := Integer(tctefONLINE_DLL) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoComunicacaoTEF.', [AValue]);
end;

{ TTipoConta }

function Converter_TipoConta(const AValue: TString): Integer;
begin
  if SameText(AValue, 'BANCARIA') then Result := Integer(tcBANCARIA) else
  if SameText(AValue, 'CAIXA') then Result := Integer(tcCAIXA) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoConta.', [AValue]);
end;

{ TTipoContaAReceber }

function Converter_TipoContaAReceber(const AValue: TString): Integer;
begin
  if SameText(AValue, 'CARTAO') then Result := Integer(tcarCARTAO) else
  if SameText(AValue, 'TITULO') then Result := Integer(tcarTITULO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoContaAReceber.', [AValue]);
end;

{ TTipoContaCliente }

function Converter_TipoContaCliente(const AValue: TString): Integer;
begin
  if SameText(AValue, 'ESPECIAL') then Result := Integer(tccESPECIAL) else
  if SameText(AValue, 'COMUM') then Result := Integer(tccCOMUM) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoContaCliente.', [AValue]);
end;

{ TTipoConvenio }

function Converter_TipoConvenio(const AValue: TString): Integer;
begin
  if SameText(AValue, 'INFORMADO_PELO_CAIXA') then Result := Integer(tcINFORMADO_PELO_CAIXA) else
  if SameText(AValue, 'FIXO_CODIGO_BARRAS') then Result := Integer(tcFIXO_CODIGO_BARRAS) else
  if SameText(AValue, 'PADRAO') then Result := Integer(tcPADRAO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoConvenio.', [AValue]);
end;

{ TTipoDocumentoConsultadoTEF }

function Converter_TipoDocumentoConsultadoTEF(const AValue: TString): Integer;
begin
  if SameText(AValue, 'CPF') then Result := Integer(tdctefCPF) else
  if SameText(AValue, 'CNPJ') then Result := Integer(tdctefCNPJ) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoDocumentoConsultadoTEF.', [AValue]);
end;

{ TTipoDocumentoFiscal }

function Converter_TipoDocumentoFiscal(const AValue: TString): Integer;
begin
  if SameText(AValue, 'RELATORIO_GERENCIAL') then Result := Integer(tdfRELATORIO_GERENCIAL) else
  if SameText(AValue, 'COMPROVANTE_NAO_FISCAL') then Result := Integer(tdfCOMPROVANTE_NAO_FISCAL) else
  if SameText(AValue, 'COMPROVANTE_CREDITO_DEBITO') then Result := Integer(tdfCOMPROVANTE_CREDITO_DEBITO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoDocumentoFiscal.', [AValue]);
end;

{ TTipoDocumentoTEF }

function Converter_TipoDocumentoTEF(const AValue: TString): Integer;
begin
  if SameText(AValue, 'TRIBUTO') then Result := Integer(tdtefTRIBUTO) else
  if SameText(AValue, 'TITULO') then Result := Integer(tdtefTITULO) else
  if SameText(AValue, 'ARRECADACAO') then Result := Integer(tdtefARRECADACAO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoDocumentoTEF.', [AValue]);
end;

{ TTipoEcf }

function Converter_TipoEcf(const AValue: TString): Integer;
begin
  if SameText(AValue, 'ECF_PDV') then Result := Integer(teECF_PDV) else
  if SameText(AValue, 'ECF_MR') then Result := Integer(teECF_MR) else
  if SameText(AValue, 'ECF_IF') then Result := Integer(teECF_IF) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoEcf.', [AValue]);
end;

{ TTipoEmissao }

function Converter_TipoEmissao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'SAT') then Result := Integer(teSAT) else
  if SameText(AValue, 'SERIE_D') then Result := Integer(teSERIE_D) else
  if SameText(AValue, 'NFCE') then Result := Integer(teNFCE) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoEmissao.', [AValue]);
end;

{ TTipoEntradaNotaFiscal }

function Converter_TipoEntradaNotaFiscal(const AValue: TString): Integer;
begin
  if SameText(AValue, 'ENTRADA_DEVOLUCAO') then Result := Integer(tenfENTRADA_DEVOLUCAO) else
  if SameText(AValue, 'ENTRADA_COMPRA') then Result := Integer(tenfENTRADA_COMPRA) else
  if SameText(AValue, 'RESERVADO') then Result := Integer(tenfRESERVADO) else
  if SameText(AValue, 'ENTRADA_TRANSFERENCIA') then Result := Integer(tenfENTRADA_TRANSFERENCIA) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoEntradaNotaFiscal.', [AValue]);
end;

{ TTipoEspecializacaoCaixa }

function Converter_TipoEspecializacaoCaixa(const AValue: TString): Integer;
begin
  if SameText(AValue, 'RAPIDO') then Result := Integer(tecRAPIDO) else
  if SameText(AValue, 'LANCHONETE') then Result := Integer(tecLANCHONETE) else
  if SameText(AValue, 'NORMAL') then Result := Integer(tecNORMAL) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoEspecializacaoCaixa.', [AValue]);
end;

{ TTipoFechamento }

function Converter_TipoFechamento(const AValue: TString): Integer;
begin
  if SameText(AValue, 'CUPOM') then Result := Integer(tfCUPOM) else
  if SameText(AValue, 'NOTA_FISCAL') then Result := Integer(tfNOTA_FISCAL) else
  if SameText(AValue, 'ORCAMENTO') then Result := Integer(tfORCAMENTO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoFechamento.', [AValue]);
end;

{ TTipoFechamentoPedido }

function Converter_TipoFechamentoPedido(const AValue: TString): Integer;
begin
  if SameText(AValue, 'CUPOM') then Result := Integer(tfpCUPOM) else
  if SameText(AValue, 'NOTA_FISCAL') then Result := Integer(tfpNOTA_FISCAL) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoFechamentoPedido.', [AValue]);
end;

{ TTipoFidelizacao }

function Converter_TipoFidelizacao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PRECO') then Result := Integer(tfPRECO) else
  if SameText(AValue, 'QUANTIDADE') then Result := Integer(tfQUANTIDADE) else
  if SameText(AValue, 'NAO') then Result := Integer(tfNAO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoFidelizacao.', [AValue]);
end;

{ TTipoFormaPagamento }

function Converter_TipoFormaPagamento(const AValue: TString): Integer;
begin
  if SameText(AValue, 'A_VISTA') then Result := Integer(tfpA_VISTA) else
  if SameText(AValue, 'A_PRAZO') then Result := Integer(tfpA_PRAZO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoFormaPagamento.', [AValue]);
end;

{ TTipoFornecedor }

function Converter_TipoFornecedor(const AValue: TString): Integer;
begin
  if SameText(AValue, 'TRANSPORTADORA') then Result := Integer(tfTRANSPORTADORA) else
  if SameText(AValue, 'FORNECEDOR') then Result := Integer(tfFORNECEDOR) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoFornecedor.', [AValue]);
end;

{ TTipoFrete }

function Converter_TipoFrete(const AValue: TString): Integer;
begin
  if SameText(AValue, 'CIF') then Result := Integer(tfCIF) else
  if SameText(AValue, 'FOB') then Result := Integer(tfFOB) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoFrete.', [AValue]);
end;

{ TTipoGarantia }

function Converter_TipoGarantia(const AValue: TString): Integer;
begin
  if SameText(AValue, 'TROCA') then Result := Integer(tgTROCA) else
  if SameText(AValue, 'REPARO') then Result := Integer(tgREPARO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoGarantia.', [AValue]);
end;

{ TTipoGeracaoFinanceiro }

function Converter_TipoGeracaoFinanceiro(const AValue: TString): Integer;
begin
  if SameText(AValue, 'GERA_LIQUIDADO') then Result := Integer(tgfGERA_LIQUIDADO) else
  if SameText(AValue, 'GERA_EM_ABERTO') then Result := Integer(tgfGERA_EM_ABERTO) else
  if SameText(AValue, 'NAO_GERA') then Result := Integer(tgfNAO_GERA) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoGeracaoFinanceiro.', [AValue]);
end;

{ TTipoImpressao }

function Converter_TipoImpressao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'EPSON') then Result := Integer(tiEPSON) else
  if SameText(AValue, 'BEMATECH') then Result := Integer(tiBEMATECH) else
  if SameText(AValue, 'YANCO') then Result := Integer(tiYANCO) else
  if SameText(AValue, 'WINDOWS') then Result := Integer(tiWINDOWS) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoImpressao.', [AValue]);
end;

{ TTipoImpressaoItem }

function Converter_TipoImpressaoItem(const AValue: TString): Integer;
begin
  if SameText(AValue, 'IMPRESSO') then Result := Integer(tiiIMPRESSO) else
  if SameText(AValue, 'NORMAL') then Result := Integer(tiiNORMAL) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoImpressaoItem.', [AValue]);
end;

{ TTipoImpressora }

function Converter_TipoImpressora(const AValue: TString): Integer;
begin
  if SameText(AValue, 'MATRICIAL') then Result := Integer(tiMATRICIAL) else
  if SameText(AValue, 'GRAFICA') then Result := Integer(tiGRAFICA) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoImpressora.', [AValue]);
end;

{ TTipoIntegracaoRetaguarda }

function Converter_TipoIntegracaoRetaguarda(const AValue: TString): Integer;
begin
  if SameText(AValue, 'RMS') then Result := Integer(tirRMS) else
  if SameText(AValue, 'PADRAO') then Result := Integer(tirPADRAO) else
  if SameText(AValue, 'MILENIO') then Result := Integer(tirMILENIO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoIntegracaoRetaguarda.', [AValue]);
end;

{ TTipoItemPreVenda }

function Converter_TipoItemPreVenda(const AValue: TString): Integer;
begin
  if SameText(AValue, 'VENDA') then Result := Integer(tipvVENDA) else
  if SameText(AValue, 'CANCELADO') then Result := Integer(tipvCANCELADO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoItemPreVenda.', [AValue]);
end;

{ TTipoJuros }

function Converter_TipoJuros(const AValue: TString): Integer;
begin
  if SameText(AValue, 'COMPOSTO') then Result := Integer(tjCOMPOSTO) else
  if SameText(AValue, 'SIMPLES') then Result := Integer(tjSIMPLES) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoJuros.', [AValue]);
end;

{ TTipoMascaraTexto }

function Converter_TipoMascaraTexto(const AValue: TString): Integer;
begin
  if SameText(AValue, 'DATA') then Result := Integer(tmtDATA) else
  if SameText(AValue, 'NUMERICO') then Result := Integer(tmtNUMERICO) else
  if SameText(AValue, 'CARACTERE') then Result := Integer(tmtCARACTERE) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoMascaraTexto.', [AValue]);
end;

{ TTipoMovimentacao }

function Converter_TipoMovimentacao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'VENDA') then Result := Integer(tmVENDA) else
  if SameText(AValue, 'ORDEM_DE_PRODUCAO') then Result := Integer(tmORDEM_DE_PRODUCAO) else
  if SameText(AValue, 'CANCELAMENTO') then Result := Integer(tmCANCELAMENTO) else
  if SameText(AValue, 'NOTA_FISCAL') then Result := Integer(tmNOTA_FISCAL) else
  if SameText(AValue, 'TROCA') then Result := Integer(tmTROCA) else
  if SameText(AValue, 'ENTRADA') then Result := Integer(tmENTRADA) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoMovimentacao.', [AValue]);
end;

{ TTipoMovimentacaoCartao }

function Converter_TipoMovimentacaoCartao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'AUTOMATICO') then Result := Integer(tmcAUTOMATICO) else
  if SameText(AValue, 'MANUAL') then Result := Integer(tmcMANUAL) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoMovimentacaoCartao.', [AValue]);
end;

{ TTipoNota }

function Converter_TipoNota(const AValue: TString): Integer;
begin
  if SameText(AValue, 'SAIDA') then Result := Integer(tnSAIDA) else
  if SameText(AValue, 'ENTRADA') then Result := Integer(tnENTRADA) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoNota.', [AValue]);
end;

{ TTipoNotaComplementar }

function Converter_TipoNotaComplementar(const AValue: TString): Integer;
begin
  if SameText(AValue, 'ICMS') then Result := Integer(tncICMS) else
  if SameText(AValue, 'PRECO') then Result := Integer(tncPRECO) else
  if SameText(AValue, 'QUANTIDADE') then Result := Integer(tncQUANTIDADE) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoNotaComplementar.', [AValue]);
end;

{ TTipoNotaFiscal }

function Converter_TipoNotaFiscal(const AValue: TString): Integer;
begin
  if SameText(AValue, 'SAIDA') then Result := Integer(tnfSAIDA) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoNotaFiscal.', [AValue]);
end;

{ TTipoOperacao }

function Converter_TipoOperacao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'TRANSFERENCIA') then Result := Integer(toTRANSFERENCIA) else
  if SameText(AValue, 'SAIDA') then Result := Integer(toSAIDA) else
  if SameText(AValue, 'ENTRADA') then Result := Integer(toENTRADA) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoOperacao.', [AValue]);
end;

{ TTipoOperacaoImpressao }

function Converter_TipoOperacaoImpressao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PEDIDO_VENDA') then Result := Integer(toiPEDIDO_VENDA) else
  if SameText(AValue, 'FICHA') then Result := Integer(toiFICHA) else
  if SameText(AValue, 'TELE_ENTREGA') then Result := Integer(toiTELE_ENTREGA) else
  if SameText(AValue, 'PREVENDA') then Result := Integer(toiPREVENDA) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoOperacaoImpressao.', [AValue]);
end;

{ TTipoPagamento }

function Converter_TipoPagamento(const AValue: TString): Integer;
begin
  if SameText(AValue, 'TOTAL') then Result := Integer(tpTOTAL) else
  if SameText(AValue, 'PARCIAL') then Result := Integer(tpPARCIAL) else
  if SameText(AValue, 'ABERTO') then Result := Integer(tpABERTO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoPagamento.', [AValue]);
end;

{ TTipoPercentualImpostoVenda }

function Converter_TipoPercentualImpostoVenda(const AValue: TString): Integer;
begin
  if SameText(AValue, 'FAIXA_SIMPLES') then Result := Integer(tpivFAIXA_SIMPLES) else
  if SameText(AValue, 'NCM') then Result := Integer(tpivNCM) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoPercentualImpostoVenda.', [AValue]);
end;

{ TTipoPesoVariavel }

function Converter_TipoPesoVariavel(const AValue: TString): Integer;
begin
  if SameText(AValue, 'UNIDADE_SEM_MULTIPLICACAO_VENDA') then Result := Integer(tpvUNIDADE_SEM_MULTIPLICACAO_VENDA) else
  if SameText(AValue, 'FRACIONADO_PADRAO') then Result := Integer(tpvFRACIONADO_PADRAO) else
  if SameText(AValue, 'FRACIONADO_E_ETIQUETA_BALANCA_PESO') then Result := Integer(tpvFRACIONADO_E_ETIQUETA_BALANCA_PESO) else
  if SameText(AValue, 'UNIDADE_MULTIPLOS_VENDA') then Result := Integer(tpvUNIDADE_MULTIPLOS_VENDA) else
  if SameText(AValue, 'UNIDADE_COM_MULTIPLICACAO_NA_VENDA') then Result := Integer(tpvUNIDADE_COM_MULTIPLICACAO_NA_VENDA) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoPesoVariavel.', [AValue]);
end;

{ TTipoPesquisaCliente }

function Converter_TipoPesquisaCliente(const AValue: TString): Integer;
begin
  if SameText(AValue, 'CODIGO') then Result := Integer(tpcCODIGO) else
  if SameText(AValue, 'CPF_CNPJ') then Result := Integer(tpcCPF_CNPJ) else
  if SameText(AValue, 'AUTORIZACAO_DE_VENDA') then Result := Integer(tpcAUTORIZACAO_DE_VENDA) else
  if SameText(AValue, 'CODIGO_EXTERNO') then Result := Integer(tpcCODIGO_EXTERNO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoPesquisaCliente.', [AValue]);
end;

{ TTipoPessoa }

function Converter_TipoPessoa(const AValue: TString): Integer;
begin
  if SameText(AValue, 'ESTRANGEIRA') then Result := Integer(tpESTRANGEIRA) else
  if SameText(AValue, 'FISICA') then Result := Integer(tpFISICA) else
  if SameText(AValue, 'JURIDICA') then Result := Integer(tpJURIDICA) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoPessoa.', [AValue]);
end;

{ TTipoPessoaPFPJ }

function Converter_TipoPessoaPFPJ(const AValue: TString): Integer;
begin
  if SameText(AValue, 'FISICA') then Result := Integer(tppfpjFISICA) else
  if SameText(AValue, 'JURIDICA') then Result := Integer(tppfpjJURIDICA) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoPessoaPFPJ.', [AValue]);
end;

{ TTipoPinPad }

function Converter_TipoPinPad(const AValue: TString): Integer;
begin
  if SameText(AValue, 'MODO_SEGURO') then Result := Integer(tppMODO_SEGURO) else
  if SameText(AValue, 'MODO_DIRETO') then Result := Integer(tppMODO_DIRETO) else
  if SameText(AValue, 'NAO') then Result := Integer(tppNAO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoPinPad.', [AValue]);
end;

{ TTipoPlanoPagamento }

function Converter_TipoPlanoPagamento(const AValue: TString): Integer;
begin
  if SameText(AValue, 'TERCEIROS') then Result := Integer(tppTERCEIROS) else
  if SameText(AValue, 'PROPRIO') then Result := Integer(tppPROPRIO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoPlanoPagamento.', [AValue]);
end;

{ TTipoPreco }

function Converter_TipoPreco(const AValue: TString): Integer;
begin
  if SameText(AValue, 'P_2') then Result := Integer(tpP_2) else
  if SameText(AValue, 'P_1') then Result := Integer(tpP_1) else
  if SameText(AValue, 'P_3') then Result := Integer(tpP_3) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoPreco.', [AValue]);
end;

{ TTipoPrecoCusto }

function Converter_TipoPrecoCusto(const AValue: TString): Integer;
begin
  if SameText(AValue, 'FISCAL') then Result := Integer(tpcFISCAL) else
  if SameText(AValue, 'REPOSICAO') then Result := Integer(tpcREPOSICAO) else
  if SameText(AValue, 'MEDIO') then Result := Integer(tpcMEDIO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoPrecoCusto.', [AValue]);
end;

{ TTipoPrecoVariavel }

function Converter_TipoPrecoVariavel(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PENDENTE_PESAGEM') then Result := Integer(tprPENDENTE_PESAGEM) else
  if SameText(AValue, 'FRACIONADO_ETIQUETA_BALANCA') then Result := Integer(tprFRACIONADO_ETIQUETA_BALANCA) else
  if SameText(AValue, 'FRACIONADO_ETIQUETA_TECIDO') then Result := Integer(tprFRACIONADO_ETIQUETA_TECIDO) else
  if SameText(AValue, 'UNIDADE_SEM_MULTIPLICACAO_NA_VENDA') then Result := Integer(tprUNIDADE_SEM_MULTIPLICACAO_NA_VENDA) else
  if SameText(AValue, 'UNIDADE_MULTIPLOS_VENDA') then Result := Integer(tprUNIDADE_MULTIPLOS_VENDA) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoPrecoVariavel.', [AValue]);
end;

{ TTipoPrevisaoEfetivado }

function Converter_TipoPrevisaoEfetivado(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PREVISTO') then Result := Integer(tpePREVISTO) else
  if SameText(AValue, 'EFETIVO') then Result := Integer(tpeEFETIVO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoPrevisaoEfetivado.', [AValue]);
end;

{ TTipoQuebra }

function Converter_TipoQuebra(const AValue: TString): Integer;
begin
  if SameText(AValue, 'ARREDONDAR') then Result := Integer(tqARREDONDAR) else
  if SameText(AValue, 'TRUNCAR') then Result := Integer(tqTRUNCAR) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoQuebra.', [AValue]);
end;

{ TTipoRegimeTributario }

function Converter_TipoRegimeTributario(const AValue: TString): Integer;
begin
  if SameText(AValue, 'SIMPLES_NACIONAL_COM_EXCESSO_SUBLIMITE') then Result := Integer(trtSIMPLES_NACIONAL_COM_EXCESSO_SUBLIMITE) else
  if SameText(AValue, 'SIMPLES_NACIONAL') then Result := Integer(trtSIMPLES_NACIONAL) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoRegimeTributario.', [AValue]);
end;

{ TTipoSangria }

function Converter_TipoSangria(const AValue: TString): Integer;
begin
  if SameText(AValue, 'VENDA') then Result := Integer(tsVENDA) else
  if SameText(AValue, 'CORRESPONDENTE_BANCARIO') then Result := Integer(tsCORRESPONDENTE_BANCARIO) else
  if SameText(AValue, 'RECEBIMENTO') then Result := Integer(tsRECEBIMENTO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoSangria.', [AValue]);
end;

{ TTipoSecao }

function Converter_TipoSecao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'NAO_ALIMENTO') then Result := Integer(tsNAO_ALIMENTO) else
  if SameText(AValue, 'ALIMENTO') then Result := Integer(tsALIMENTO) else
  if SameText(AValue, 'APROPRIACAO') then Result := Integer(tsAPROPRIACAO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoSecao.', [AValue]);
end;

{ TTipoTEF }

function Converter_TipoTEF(const AValue: TString): Integer;
begin
  if SameText(AValue, 'VENDA') then Result := Integer(ttefVENDA) else
  if SameText(AValue, 'CORRESPONDENTE_BANCARIO') then Result := Integer(ttefCORRESPONDENTE_BANCARIO) else
  if SameText(AValue, 'RECARGA') then Result := Integer(ttefRECARGA) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoTEF.', [AValue]);
end;

{ TTipoTaxaServico }

function Converter_TipoTaxaServico(const AValue: TString): Integer;
begin
  if SameText(AValue, 'PRODUTO') then Result := Integer(ttsPRODUTO) else
  if SameText(AValue, 'ACRESCIMO') then Result := Integer(ttsACRESCIMO) else
  if SameText(AValue, 'TROCO') then Result := Integer(ttsTROCO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoTaxaServico.', [AValue]);
end;

{ TTipoTelaPdv }

function Converter_TipoTelaPdv(const AValue: TString): Integer;
begin
  if SameText(AValue, 'MAGAZINE') then Result := Integer(ttpMAGAZINE) else
  if SameText(AValue, 'PADRAO') then Result := Integer(ttpPADRAO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoTelaPdv.', [AValue]);
end;

{ TTipoTerminal }

function Converter_TipoTerminal(const AValue: TString): Integer;
begin
  if SameText(AValue, 'MICRO') then Result := Integer(ttMICRO) else
  if SameText(AValue, 'TECLADO_GRADUAL') then Result := Integer(ttTECLADO_GRADUAL) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoTerminal.', [AValue]);
end;

{ TTipoTexto }

function Converter_TipoTexto(const AValue: TString): Integer;
begin
  if SameText(AValue, 'DATA') then Result := Integer(ttDATA) else
  if SameText(AValue, 'NUMERICO') then Result := Integer(ttNUMERICO) else
  if SameText(AValue, 'CARACTERE') then Result := Integer(ttCARACTERE) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoTexto.', [AValue]);
end;

{ TTipoTransacao }

function Converter_TipoTransacao(const AValue: TString): Integer;
begin
  if SameText(AValue, 'FLASH_CAIXA') then Result := Integer(ttFLASH_CAIXA) else
  if SameText(AValue, 'ESTORNO_RECEBIMENTO') then Result := Integer(ttESTORNO_RECEBIMENTO) else
  if SameText(AValue, 'ENTRADA_OPERADOR') then Result := Integer(ttENTRADA_OPERADOR) else
  if SameText(AValue, 'TROCA_BOBINA') then Result := Integer(ttTROCA_BOBINA) else
  if SameText(AValue, 'CANCELAMENTO_125') then Result := Integer(ttCANCELAMENTO_125) else
  if SameText(AValue, 'REFORCO_CAIXA') then Result := Integer(ttREFORCO_CAIXA) else
  if SameText(AValue, 'INICIALIZA_VENDA_BRUTA') then Result := Integer(ttINICIALIZA_VENDA_BRUTA) else
  if SameText(AValue, 'SAIDA_OPERADOR') then Result := Integer(ttSAIDA_OPERADOR) else
  if SameText(AValue, 'FECHAMENTO_CAIXA') then Result := Integer(ttFECHAMENTO_CAIXA) else
  if SameText(AValue, 'EMPRESTIMO') then Result := Integer(ttEMPRESTIMO) else
  if SameText(AValue, 'ABERTURA_CAIXA') then Result := Integer(ttABERTURA_CAIXA) else
  if SameText(AValue, 'VENDA') then Result := Integer(ttVENDA) else
  if SameText(AValue, 'TROCA_FINALIZACAO') then Result := Integer(ttTROCA_FINALIZACAO) else
  if SameText(AValue, 'ABERTURA_GAVETA') then Result := Integer(ttABERTURA_GAVETA) else
  if SameText(AValue, 'RECEBIMENTO') then Result := Integer(ttRECEBIMENTO) else
  if SameText(AValue, 'BLOQUEIO_OPERACOES') then Result := Integer(ttBLOQUEIO_OPERACOES) else
  if SameText(AValue, 'TRANSACOES_REALIZADAS_ADMINISTRADOR_TEF_SOFTWARE_EXPRESS') then Result := Integer(ttTRANSACOES_REALIZADAS_ADMINISTRADOR_TEF_SOFTWARE_EXPRESS) else
  if SameText(AValue, 'LEITURA_X') then Result := Integer(ttLEITURA_X) else
  if SameText(AValue, 'ESTORNO_PAGAMENTO') then Result := Integer(ttESTORNO_PAGAMENTO) else
  if SameText(AValue, 'PAGAMENTO') then Result := Integer(ttPAGAMENTO) else
  if SameText(AValue, 'CANCELAMENTO_126') then Result := Integer(ttCANCELAMENTO_126) else
  if SameText(AValue, 'CANCELAMENTO_RECEBIMENTO') then Result := Integer(ttCANCELAMENTO_RECEBIMENTO) else
  if SameText(AValue, 'REIMPRESSAO_CUPOM') then Result := Integer(ttREIMPRESSAO_CUPOM) else
  if SameText(AValue, 'SANGRIA') then Result := Integer(ttSANGRIA) else
  if SameText(AValue, 'CANCELAMENTO_CARTAO_PROPRIO_OU_TEF') then Result := Integer(ttCANCELAMENTO_CARTAO_PROPRIO_OU_TEF) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoTransacao.', [AValue]);
end;

{ TTipoTributacaoEstadual }

function Converter_TipoTributacaoEstadual(const AValue: TString): Integer;
begin
  if SameText(AValue, 'ALIQUOTA_EFETIVA') then Result := Integer(tteALIQUOTA_EFETIVA) else
  if SameText(AValue, 'SUPER_SIMPLES') then Result := Integer(tteSUPER_SIMPLES) else
  if SameText(AValue, 'NORMAL') then Result := Integer(tteNORMAL) else
  if SameText(AValue, 'ESTADUAL_SUBSTITUICAO') then Result := Integer(tteESTADUAL_SUBSTITUICAO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoTributacaoEstadual.', [AValue]);
end;

{ TTipoTributacaoFederal }

function Converter_TipoTributacaoFederal(const AValue: TString): Integer;
begin
  if SameText(AValue, 'LUCRO_REAL') then Result := Integer(ttfLUCRO_REAL) else
  if SameText(AValue, 'SUPER_SIMPLES') then Result := Integer(ttfSUPER_SIMPLES) else
  if SameText(AValue, 'LUCRO_PRESUMIDO') then Result := Integer(ttfLUCRO_PRESUMIDO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoTributacaoFederal.', [AValue]);
end;

{ TTipoTroco }

function Converter_TipoTroco(const AValue: TString): Integer;
begin
  if SameText(AValue, 'TROCO') then Result := Integer(ttTROCO) else
  if SameText(AValue, 'CONTRA_VALE') then Result := Integer(ttCONTRA_VALE) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoTroco.', [AValue]);
end;

{ TTipoVenda }

function Converter_TipoVenda(const AValue: TString): Integer;
begin
  if SameText(AValue, 'CANCELADO') then Result := Integer(tvCANCELADO) else
  if SameText(AValue, 'VENDIDO') then Result := Integer(tvVENDIDO) else
  raise EnumException.CreateFmt('Valor %s incorreto para TipoVenda.', [AValue]);
end;

{ TVariacaoGramasBalanca }

function Converter_VariacaoGramasBalanca(const AValue: TString): Integer;
begin
  if SameText(AValue, 'CINCO_GRAMAS') then Result := Integer(vgbCINCO_GRAMAS) else
  if SameText(AValue, 'DUAS_GRAMAS') then Result := Integer(vgbDUAS_GRAMAS) else
  if SameText(AValue, 'UM_GRAMA') then Result := Integer(vgbUM_GRAMA) else
  raise EnumException.CreateFmt('Valor %s incorreto para VariacaoGramasBalanca.', [AValue]);
end;

{ TVersaoSistemaEstacionamento }

function Converter_VersaoSistemaEstacionamento(const AValue: TString): Integer;
begin
  if SameText(AValue, 'V10') then Result := Integer(vseV10) else
  if SameText(AValue, 'V11') then Result := Integer(vseV11) else
  raise EnumException.CreateFmt('Valor %s incorreto para VersaoSistemaEstacionamento.', [AValue]);
end;

{ TEnumConverters }

class function TEnumConverters.EnumToStr(const AEnumType: PTypeInfo; AEnumValue: Integer): TString;

  function RemoveLowerCase(const AInput: TString): TString;
  var
    UpperCaseChars: TString;
    I, X: Integer;
  begin
    Result := EmptyStr;
    UpperCaseChars := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    for X := Low(AInput) to High(AInput) do
      for I := Low(UpperCaseChars) to High(UpperCaseChars) do
        if AInput[X] = UpperCaseChars[I] then
          Result := Result + AInput[X];
  end;

begin
  Result := RemoveLowerCase(GetEnumName(AEnumType, AEnumValue));
end;

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
  EnumConverters.Register('TAcaoNotaFiscal', @Converter_AcaoNotaFiscal);
  EnumConverters.Register('TAmbiente', @Converter_Ambiente);
  EnumConverters.Register('TAplicacao', @Converter_Aplicacao);
  EnumConverters.Register('TAutorizadorLimiteCredito', @Converter_AutorizadorLimiteCredito);
  EnumConverters.Register('TCargoFuncionario', @Converter_CargoFuncionario);
  EnumConverters.Register('TContigenciaEmissaoNotaFiscal', @Converter_ContigenciaEmissaoNotaFiscal);
  EnumConverters.Register('TControlaClienteRetaguarda', @Converter_ControlaClienteRetaguarda);
  EnumConverters.Register('TControlaVendedor', @Converter_ControlaVendedor);
  EnumConverters.Register('TEspeciePagamento', @Converter_EspeciePagamento);
  EnumConverters.Register('TEstoqueProdutoComposto', @Converter_EstoqueProdutoComposto);
  EnumConverters.Register('TFinalidadeEstoqueLocal', @Converter_FinalidadeEstoqueLocal);
  EnumConverters.Register('TFinalidadeNotaFiscal', @Converter_FinalidadeNotaFiscal);
  EnumConverters.Register('TFinalidadeProduto', @Converter_FinalidadeProduto);
  EnumConverters.Register('TFinalizadoraEspecie', @Converter_FinalizadoraEspecie);
  EnumConverters.Register('TFormaAplicacaoDesconto', @Converter_FormaAplicacaoDesconto);
  EnumConverters.Register('TFormaEfetivacaoPrevenda', @Converter_FormaEfetivacaoPrevenda);
  EnumConverters.Register('TFormaRegistroVendaQuantidade', @Converter_FormaRegistroVendaQuantidade);
  EnumConverters.Register('TFormaValidacaoFidelizacao', @Converter_FormaValidacaoFidelizacao);
  EnumConverters.Register('TFormatoPlanoConta', @Converter_FormatoPlanoConta);
  EnumConverters.Register('THabilitaTrocoDoacao', @Converter_HabilitaTrocoDoacao);
  EnumConverters.Register('TIdentificaoConsumidorNoCupom', @Converter_IdentificaoConsumidorNoCupom);
  EnumConverters.Register('TImpressaoComprovanteEntregaDomicilio', @Converter_ImpressaoComprovanteEntregaDomicilio);
  EnumConverters.Register('TImprimeCodigoBarrasCupomPrevenda', @Converter_ImprimeCodigoBarrasCupomPrevenda);
  EnumConverters.Register('TIndicadorProdutoComposto', @Converter_IndicadorProdutoComposto);
  EnumConverters.Register('TIndicadorQuantidadePrecosVenda', @Converter_IndicadorQuantidadePrecosVenda);
  EnumConverters.Register('TIndicadorTransmissao', @Converter_IndicadorTransmissao);
  EnumConverters.Register('TInformacaoSuplementarCupom', @Converter_InformacaoSuplementarCupom);
  EnumConverters.Register('TIntegracaoNetPoints', @Converter_IntegracaoNetPoints);
  EnumConverters.Register('TIntegracaoSistemaEstacionamento', @Converter_IntegracaoSistemaEstacionamento);
  EnumConverters.Register('TLimiteCredito', @Converter_LimiteCredito);
  EnumConverters.Register('TLocalDigitacaoCpfConsumidor', @Converter_LocalDigitacaoCpfConsumidor);
  EnumConverters.Register('TLocalDigitacaoSenha', @Converter_LocalDigitacaoSenha);
  EnumConverters.Register('TLocalDigitacaoTelefoneRecarga', @Converter_LocalDigitacaoTelefoneRecarga);
  EnumConverters.Register('TLocalLeituraCodigo', @Converter_LocalLeituraCodigo);
  EnumConverters.Register('TLocalTEF', @Converter_LocalTEF);
  EnumConverters.Register('TMeioAutorizacaoPrivateLabel', @Converter_MeioAutorizacaoPrivateLabel);
  EnumConverters.Register('TMeioAutorizacaoTEF', @Converter_MeioAutorizacaoTEF);
  EnumConverters.Register('TMetodoCalculoDesconto', @Converter_MetodoCalculoDesconto);
  EnumConverters.Register('TModalidade', @Converter_Modalidade);
  EnumConverters.Register('TNaturezaLancamento', @Converter_NaturezaLancamento);
  EnumConverters.Register('TOrigemSerieProduto', @Converter_OrigemSerieProduto);
  EnumConverters.Register('TOrigemVenda', @Converter_OrigemVenda);
  EnumConverters.Register('TProdutoAssociacao', @Converter_ProdutoAssociacao);
  EnumConverters.Register('TRamoAtuacao', @Converter_RamoAtuacao);
  EnumConverters.Register('TSimbologiaECF', @Converter_SimbologiaECF);
  EnumConverters.Register('TSolicitaConfirmacaoTrocaPontosValeCompra', @Converter_SolicitaConfirmacaoTrocaPontosValeCompra);
  EnumConverters.Register('TSolicitaFinalizadoraFidelizacao', @Converter_SolicitaFinalizadoraFidelizacao);
  EnumConverters.Register('TSolicitaFuncaoFidelizacao', @Converter_SolicitaFuncaoFidelizacao);
  EnumConverters.Register('TStatusAprovacaoCadastro', @Converter_StatusAprovacaoCadastro);
  EnumConverters.Register('TStatusAtivacao', @Converter_StatusAtivacao);
  EnumConverters.Register('TStatusAtualPreVenda', @Converter_StatusAtualPreVenda);
  EnumConverters.Register('TStatusBloqueio', @Converter_StatusBloqueio);
  EnumConverters.Register('TStatusCartaoReceber', @Converter_StatusCartaoReceber);
  EnumConverters.Register('TStatusConciliacao', @Converter_StatusConciliacao);
  EnumConverters.Register('TStatusConsumo', @Converter_StatusConsumo);
  EnumConverters.Register('TStatusConsumoItem', @Converter_StatusConsumoItem);
  EnumConverters.Register('TStatusDevolucao', @Converter_StatusDevolucao);
  EnumConverters.Register('TStatusEntrega', @Converter_StatusEntrega);
  EnumConverters.Register('TStatusEnvio', @Converter_StatusEnvio);
  EnumConverters.Register('TStatusNotaFiscal', @Converter_StatusNotaFiscal);
  EnumConverters.Register('TStatusPedido', @Converter_StatusPedido);
  EnumConverters.Register('TStatusPedidoVenda', @Converter_StatusPedidoVenda);
  EnumConverters.Register('TStatusPreVenda', @Converter_StatusPreVenda);
  EnumConverters.Register('TStatusRecepcaoVasilhame', @Converter_StatusRecepcaoVasilhame);
  EnumConverters.Register('TStatusSerie', @Converter_StatusSerie);
  EnumConverters.Register('TStatusTEF', @Converter_StatusTEF);
  EnumConverters.Register('TStatusTransacaoNFCE', @Converter_StatusTransacaoNFCE);
  EnumConverters.Register('TStatusVendaAssistida', @Converter_StatusVendaAssistida);
  EnumConverters.Register('TTabelaA', @Converter_TabelaA);
  EnumConverters.Register('TTabelaPrazos', @Converter_TabelaPrazos);
  EnumConverters.Register('TTamanhoCodigoProdutoBalanca', @Converter_TamanhoCodigoProdutoBalanca);
  EnumConverters.Register('TTipoAcrescimoDesconto', @Converter_TipoAcrescimoDesconto);
  EnumConverters.Register('TTipoAgregacao', @Converter_TipoAgregacao);
  EnumConverters.Register('TTipoAjuste', @Converter_TipoAjuste);
  EnumConverters.Register('TTipoArredondamentoTruncamento', @Converter_TipoArredondamentoTruncamento);
  EnumConverters.Register('TTipoAssociado', @Converter_TipoAssociado);
  EnumConverters.Register('TTipoAtendimento', @Converter_TipoAtendimento);
  EnumConverters.Register('TTipoBandeira', @Converter_TipoBandeira);
  EnumConverters.Register('TTipoBonificacao', @Converter_TipoBonificacao);
  EnumConverters.Register('TTipoCST', @Converter_TipoCST);
  EnumConverters.Register('TTipoCaixa', @Converter_TipoCaixa);
  EnumConverters.Register('TTipoCalculoComissao', @Converter_TipoCalculoComissao);
  EnumConverters.Register('TTipoComponente', @Converter_TipoComponente);
  EnumConverters.Register('TTipoComunicacaoTEF', @Converter_TipoComunicacaoTEF);
  EnumConverters.Register('TTipoConta', @Converter_TipoConta);
  EnumConverters.Register('TTipoContaAReceber', @Converter_TipoContaAReceber);
  EnumConverters.Register('TTipoContaCliente', @Converter_TipoContaCliente);
  EnumConverters.Register('TTipoConvenio', @Converter_TipoConvenio);
  EnumConverters.Register('TTipoDocumentoConsultadoTEF', @Converter_TipoDocumentoConsultadoTEF);
  EnumConverters.Register('TTipoDocumentoFiscal', @Converter_TipoDocumentoFiscal);
  EnumConverters.Register('TTipoDocumentoTEF', @Converter_TipoDocumentoTEF);
  EnumConverters.Register('TTipoEcf', @Converter_TipoEcf);
  EnumConverters.Register('TTipoEmissao', @Converter_TipoEmissao);
  EnumConverters.Register('TTipoEntradaNotaFiscal', @Converter_TipoEntradaNotaFiscal);
  EnumConverters.Register('TTipoEspecializacaoCaixa', @Converter_TipoEspecializacaoCaixa);
  EnumConverters.Register('TTipoFechamento', @Converter_TipoFechamento);
  EnumConverters.Register('TTipoFechamentoPedido', @Converter_TipoFechamentoPedido);
  EnumConverters.Register('TTipoFidelizacao', @Converter_TipoFidelizacao);
  EnumConverters.Register('TTipoFormaPagamento', @Converter_TipoFormaPagamento);
  EnumConverters.Register('TTipoFornecedor', @Converter_TipoFornecedor);
  EnumConverters.Register('TTipoFrete', @Converter_TipoFrete);
  EnumConverters.Register('TTipoGarantia', @Converter_TipoGarantia);
  EnumConverters.Register('TTipoGeracaoFinanceiro', @Converter_TipoGeracaoFinanceiro);
  EnumConverters.Register('TTipoImpressao', @Converter_TipoImpressao);
  EnumConverters.Register('TTipoImpressaoItem', @Converter_TipoImpressaoItem);
  EnumConverters.Register('TTipoImpressora', @Converter_TipoImpressora);
  EnumConverters.Register('TTipoIntegracaoRetaguarda', @Converter_TipoIntegracaoRetaguarda);
  EnumConverters.Register('TTipoItemPreVenda', @Converter_TipoItemPreVenda);
  EnumConverters.Register('TTipoJuros', @Converter_TipoJuros);
  EnumConverters.Register('TTipoMascaraTexto', @Converter_TipoMascaraTexto);
  EnumConverters.Register('TTipoMovimentacao', @Converter_TipoMovimentacao);
  EnumConverters.Register('TTipoMovimentacaoCartao', @Converter_TipoMovimentacaoCartao);
  EnumConverters.Register('TTipoNota', @Converter_TipoNota);
  EnumConverters.Register('TTipoNotaComplementar', @Converter_TipoNotaComplementar);
  EnumConverters.Register('TTipoNotaFiscal', @Converter_TipoNotaFiscal);
  EnumConverters.Register('TTipoOperacao', @Converter_TipoOperacao);
  EnumConverters.Register('TTipoOperacaoImpressao', @Converter_TipoOperacaoImpressao);
  EnumConverters.Register('TTipoPagamento', @Converter_TipoPagamento);
  EnumConverters.Register('TTipoPercentualImpostoVenda', @Converter_TipoPercentualImpostoVenda);
  EnumConverters.Register('TTipoPesoVariavel', @Converter_TipoPesoVariavel);
  EnumConverters.Register('TTipoPesquisaCliente', @Converter_TipoPesquisaCliente);
  EnumConverters.Register('TTipoPessoa', @Converter_TipoPessoa);
  EnumConverters.Register('TTipoPessoaPFPJ', @Converter_TipoPessoaPFPJ);
  EnumConverters.Register('TTipoPinPad', @Converter_TipoPinPad);
  EnumConverters.Register('TTipoPlanoPagamento', @Converter_TipoPlanoPagamento);
  EnumConverters.Register('TTipoPreco', @Converter_TipoPreco);
  EnumConverters.Register('TTipoPrecoCusto', @Converter_TipoPrecoCusto);
  EnumConverters.Register('TTipoPrecoVariavel', @Converter_TipoPrecoVariavel);
  EnumConverters.Register('TTipoPrevisaoEfetivado', @Converter_TipoPrevisaoEfetivado);
  EnumConverters.Register('TTipoQuebra', @Converter_TipoQuebra);
  EnumConverters.Register('TTipoRegimeTributario', @Converter_TipoRegimeTributario);
  EnumConverters.Register('TTipoSangria', @Converter_TipoSangria);
  EnumConverters.Register('TTipoSecao', @Converter_TipoSecao);
  EnumConverters.Register('TTipoTEF', @Converter_TipoTEF);
  EnumConverters.Register('TTipoTaxaServico', @Converter_TipoTaxaServico);
  EnumConverters.Register('TTipoTelaPdv', @Converter_TipoTelaPdv);
  EnumConverters.Register('TTipoTerminal', @Converter_TipoTerminal);
  EnumConverters.Register('TTipoTexto', @Converter_TipoTexto);
  EnumConverters.Register('TTipoTransacao', @Converter_TipoTransacao);
  EnumConverters.Register('TTipoTributacaoEstadual', @Converter_TipoTributacaoEstadual);
  EnumConverters.Register('TTipoTributacaoFederal', @Converter_TipoTributacaoFederal);
  EnumConverters.Register('TTipoTroco', @Converter_TipoTroco);
  EnumConverters.Register('TTipoVenda', @Converter_TipoVenda);
  EnumConverters.Register('TVariacaoGramasBalanca', @Converter_VariacaoGramasBalanca);
  EnumConverters.Register('TVersaoSistemaEstacionamento', @Converter_VersaoSistemaEstacionamento);

finalization
  FreeAndNil(EnumConverters);

end.


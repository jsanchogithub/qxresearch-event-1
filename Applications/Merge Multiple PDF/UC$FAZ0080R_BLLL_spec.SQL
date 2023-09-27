PACKAGE UC$FAZ0080R_BLLL 
AS
/******************************************************************************
   NAME:       UC$FAZ0080R_BLL
   PURPOSE:    Package de procedimentos e funções para execução de report FAZ0080R

   REVISIONS:
   Ver           Data            Autor             Descrição
   ---------  -----------  -----------------  --------------------
   1.0        2023/01/13    José Sancho       Criação do package.
******************************************************************************/

-- Params do report. 1 param = 1 number, que será index!

     P_ATENDER_ENTREGAS         number := 1;
     P_CHAVE_PRINCIPAL          number := 2;
     P_LABEL_ARREDONDAMENTO     number := 3;
     P_OBS                      number := 4;
     P_DATA                     number := 5;
     P_IGC_ID                   number := 6;
     P_FLG_TIP_GER              number := 7;
     P_TIPO_OBRA                number := 8;
     P_ALTERA_50_2A             number := 9;
     P_OBA_ID                   number := 10;
     P_SES_ID                   number := 11;
     P_ANO_GERA_CUS             number := 12;
     P_SES_ID_EXT               number := 13;
     P_TIRAGEM                  number := 14;
     P_SES_ID_SUBC_ENCAD        number := 15;
     P_ACUM_ACA_SUBC            number := 16;
     P_CUS_EDI                  number := 17;
     P_SES_ID_CUS_PE            number := 18;
     P_GERA_VALO                number := 19;
     P_OPT_ID_NF                number := 20;
     P_OPT_RG_3                 number := 21;
     P_OPT_CUS_PE               number := 22;
     P_CUSTOS_ADICIONAIS        number := 23;
     P_USER                     number := 24;
     P_DUPLI                    number := 25;
     P_MULTI_OPE_SUB            number := 26;
     P_TOT_FORA_TOT             number := 27;
     P_MODO                     number := 28;

-- 1 var globar por para, para facilidade de acesso
     vg_P_ATENDER_ENTREGAS      varchar2(5);
     vg_P_CHAVE_PRINCIPAL       varchar2(50);
     vg_P_LABEL_ARREDONDAMENTO  varchar2(50);
     vg_P_OBS                   varchar2(4000);
     vg_P_DATA                  varchar2(50);
     vg_P_IGC_ID                varchar2(50);
     vgn_P_IGC_ID               number;
     vg_P_FLG_TIP_GER           varchar2(5);
     vg_P_TIPO_OBRA             varchar2(5);
     vg_P_ALTERA_50_2A          varchar2(5);
     vg_P_OBA_ID                number;             --N
     vg_P_SES_ID                varchar2(50);
     vg_P_ANO_GERA_CUS          varchar2(50);
     vg_P_SES_ID_EXT            varchar2(50);
     vg_P_TIRAGEM               number;             --N
     vg_P_SES_ID_SUBC_ENCAD     varchar2(50);
     vg_P_ACUM_ACA_SUBC         varchar2(50);
     vg_P_CUS_EDI               varchar2(50);
     vg_P_SES_ID_CUS_PE         number;             --N
     vg_P_GERA_VALO             varchar2(50);
     vg_P_OPT_ID_NF             varchar2(50);
     vg_P_OPT_RG_3              varchar2(50);
     vg_P_OPT_CUS_PE            number;             --N
     vg_P_CUSTOS_ADICIONAIS     varchar2(50);
     vg_P_USER                  varchar2(50);
     vg_P_DUPLI                 number;             --N
     vg_P_MULTI_OPE_SUB         varchar2(50);
     vg_P_TOT_FORA_TOT          varchar2(50);
     vg_P_MODO                  varchar2(50);

-- Dados de Q_Master_cabecalho. Tudo o que tiver sub-select, tem que ter registo, para depois poder relacionar...
-- vg_QMC_
     vg_QMC_oba_id               number;
     vg_QMC_chave_principal      number;
     vg_QMC_titulo               varchar2(200);
     vg_QMC_numero_codigo        varchar2(100);
     vg_QMC_autor                varchar2(100);
     vg_QMC_numero_folhas        number;
     vg_QMC_numero_paginas       number;
     vg_QMC_tiragem              number;
     vg_QMC_tiragem_total        number;
     vg_QMC_tiragem_edicao       number;
     vg_QMC_cores_texto          varchar2(100);
     vg_QMC_cores_capa           varchar2(100);
     vg_QMC_observacoes          varchar2(4000);
     vg_QMC_cliente              varchar2(100);
     vg_QMC_cores_frente         number;
     vg_QMC_cores_retiracao      number;
     vg_QMC_cor_fre_com          number;
     vg_QMC_cor_ret_com          number;
     vg_QMC_num_fol_com          number;

-- deve ser acedido por função
-- objetivo: a partir de um nome ter um IDX.
--
    vg_tip_tuga            varchar2(100)  := 'PARAMS_FAZ0080R';
    vg_scope               varchar2(1000) := 'UC$FAZ0080R_BLL.GERA_DADOS_REPORT';
    vg_reg_oba             bgo_obras%rowtype;
    vg_taxp_id             number;

    type val_param         is table of varchar2(4000) index by binary_integer;
    val_param_rep          val_param;
    max_idx_par            number := 40;



procedure gera_dados_report (p_taxp_id in number,
                             p_erro in out varchar2);
END UC$FAZ0080R_BLLL;

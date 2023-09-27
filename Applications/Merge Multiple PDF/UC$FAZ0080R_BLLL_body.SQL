PACKAGE BODY UC$FAZ0080R_BLLL as
/******************************************************************************
   NAME:       UC$FAZ0080R_BLL
   PURPOSE:    Package de procedimentos e funções para execução de report FAZ0080R

   REVISIONS:
   Ver           Data            Autor             Descrição
   ---------  -----------  -----------------  --------------------
   1.0        2023/01/13    José Sancho       Criação do package.
******************************************************************************/
procedure uc$logs_gera_log (p_usr     in varchar2,
                            p_des_pro in varchar2,
                            p_pro_id  in varchar2,
                            p_tip_log in varchar2,
                            p_obs     in varchar2,
                            p_obs_esp in clob,
                            p_cod_avi in varchar2)
is
    c_scope               constant varchar2(1000) := UC$FAZ0080R_BLLl.vg_scope;
    v_override_default    varchar2(1)             := logger.bgo_override_default(c_scope);
    v_pro_id              varchar2(100)           := to_char(0);
    v_params              logger.tab_param;
begin
    logger.log_info (p_obs,c_scope,v_pro_id,v_override_default,null,v_params);
end;
--
--
    function val_par_rep (p_nom_par in number) return varchar2 is
    -- retorna o valor de um parâmetro no report.
    begin
      return val_param_rep(p_nom_par);
    exception when others then return sqlerrm;
    end;
--
--
    procedure act_val_vg_par_rep (p_nom_par in number) is
    -- retorna o valor de um parâmetro no report.
    begin

      if p_nom_par = P_ATENDER_ENTREGAS then
            vg_P_ATENDER_ENTREGAS := val_par_rep(P_ATENDER_ENTREGAS);
      elsif p_nom_par = P_CHAVE_PRINCIPAL then
            vg_P_CHAVE_PRINCIPAL := val_par_rep(P_CHAVE_PRINCIPAL);
      elsif p_nom_par = P_LABEL_ARREDONDAMENTO then
            vg_P_LABEL_ARREDONDAMENTO := val_par_rep(P_LABEL_ARREDONDAMENTO);
      elsif p_nom_par = P_OBS then
            vg_P_OBS := val_par_rep(P_OBS);
      elsif p_nom_par = P_DATA then
            vg_P_DATA := val_par_rep(P_DATA);
      elsif p_nom_par = P_IGC_ID then
            vg_P_IGC_ID := val_par_rep(P_IGC_ID);
      elsif p_nom_par = P_FLG_TIP_GER then
            vg_P_FLG_TIP_GER := val_par_rep(P_FLG_TIP_GER);
      elsif p_nom_par = P_TIPO_OBRA then
            vg_P_TIPO_OBRA := val_par_rep(P_TIPO_OBRA);
      elsif p_nom_par = P_ALTERA_50_2A then
            vg_P_ALTERA_50_2A := val_par_rep(P_ALTERA_50_2A);
      elsif p_nom_par = P_OBA_ID then
            vg_P_OBA_ID := val_par_rep(P_OBA_ID);
      elsif p_nom_par = P_SES_ID then
            vg_P_SES_ID := val_par_rep(P_SES_ID);
      elsif p_nom_par = P_ANO_GERA_CUS then
            vg_P_ANO_GERA_CUS := val_par_rep(P_ANO_GERA_CUS);
      elsif p_nom_par = P_SES_ID_EXT then
            vg_P_SES_ID_EXT := val_par_rep(P_SES_ID_EXT);
      elsif p_nom_par = P_TIRAGEM then
            vg_P_TIRAGEM := val_par_rep(P_TIRAGEM);
      elsif p_nom_par = P_SES_ID_SUBC_ENCAD then
            vg_P_SES_ID_SUBC_ENCAD := val_par_rep(P_SES_ID_SUBC_ENCAD);
      elsif p_nom_par = P_ACUM_ACA_SUBC then
            vg_P_ACUM_ACA_SUBC := val_par_rep(P_ACUM_ACA_SUBC);
      elsif p_nom_par = P_CUS_EDI then
            vg_P_CUS_EDI := val_par_rep(P_CUS_EDI);
      elsif p_nom_par = P_SES_ID_CUS_PE then
            vg_P_SES_ID_CUS_PE := val_par_rep(P_SES_ID_CUS_PE);
      elsif p_nom_par = P_GERA_VALO  then
            vg_P_GERA_VALO  := val_par_rep(P_GERA_VALO );
      elsif p_nom_par =P_OPT_ID_NF  then
            vg_P_OPT_ID_NF  := val_par_rep(P_OPT_ID_NF );
      elsif p_nom_par =P_OPT_RG_3  then
            vg_P_OPT_RG_3  := val_par_rep(P_OPT_RG_3);
      elsif p_nom_par =P_OPT_CUS_PE then
            vg_P_OPT_CUS_PE  := val_par_rep(P_OPT_CUS_PE);
      elsif p_nom_par =P_CUSTOS_ADICIONAIS then
            vg_P_CUSTOS_ADICIONAIS  := val_par_rep(P_CUSTOS_ADICIONAIS);
      elsif p_nom_par =P_USER then
            vg_P_USER  := val_par_rep(P_USER);
      elsif p_nom_par =P_DUPLI then
            vg_P_DUPLI  := val_par_rep(P_DUPLI);
      elsif p_nom_par =P_MULTI_OPE_SUB then
            vg_P_MULTI_OPE_SUB  := val_par_rep(P_MULTI_OPE_SUB);
      elsif p_nom_par =P_TOT_FORA_TOT then
            vg_P_TOT_FORA_TOT  := val_par_rep(P_TOT_FORA_TOT);
      elsif p_nom_par =P_MODO then
            vg_P_MODO  := val_par_rep(P_MODO);
      end if;


    exception when others then null;
    end;
--
--
    procedure uc$custos_pe is
    begin

      uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', 'vg_p_ses_id_cus_pe = '||vg_p_ses_id_cus_pe , null, null);

      vg_p_opt_cus_pe := 0;   -- JGS20150824

      if vg_P_IGC_ID is null then
        vgn_P_IGC_ID := null;
      else
        vgn_P_IGC_ID := to_number(vg_P_IGC_ID);
      end if;

      for r_cus_pe in (
            select null ordenacao3,
                   cco.ord ordenacao_num2,
                   oda.oba_id oba_id_suo2,
                   cco.descricao descricao2,
                   ene.nome_abreviado nome_abreviado2,
                   decode(opo.sinal_operacao,'-',-1,1)*suo.pre_ven suo_valor2,
                   cg.rv_abbreviation emp,
                   oda.id oda_id,
                   nvl(suo.qtd_fat,oda.quantidade) quantidade,   -- jgs20170213 ODA.QUANTIDADE,
                   (nvl(oda.duracao_horas,0) + ( nvl(oda.duracao_minutos,0)/60 ) ) * 60 total_tempo
            from   bgo_subcontratacoes suo,
                   bgo_operacoes_processadas oda,
                   bgo_operacoes_anuais ono,
                   bgo_centros_custos cco,
                   bgo_entidades ene,
                   bgo_operacoes opo,
                   cg_ref_codes cg
            where  opo.id=ono.opo_id
            and    cg.rv_domain='EMPRESA_SUBCONTRATACAO'
            and    cg.rv_low_value=suo.emp_fac
            and    suo.emp_fac = 'P'
            and    suo.oda_id=oda.id
            and    oda.ono_id=ono.id
            and    ono.cco_id=cco.id
            and    ene.id=suo.ene_id_produtor
            and    oda.igc_id in (select distinct
                                         igc.id
                                  from   bgo_valores_facturacao vfo,
                                         bgo_indices_geracao_custos igc
                                  where  vfo.oba_id_referente=oda.oba_id
                                  and    oda.igc_id=igc.id
                                  and    vfo.igc_id=igc.id
                                  and    vfo.igc_id=nvl(vgn_p_igc_id,vfo.igc_id)  -- JGS20110913
                                  and    vfo.oba_id_referente=vg_p_oba_id
                                  and    igc.estado='A')
            and    considerar='N'
            and    oda.oba_id=vg_p_oba_id
            and    uc$producao.aced_obra(ono.id,'OF')='S'
            union all
            select oba.titulo_abreviado ordenacao,
                   cco.ord ordenacao_num2,
                   aoa.oba_id_receptora oba_id_suo,
                   cco.descricao descricao2,
                   ene.nome_abreviado,
                   decode(opo.sinal_operacao,'-',-1,1)*(suo.pre_ven*uc$facturas_obras.cust_aoa_cco (aoa.id,ono.cco_id)/100) suo_valor, -- jgs20110915 decode(opo.sinal_operacao,'-',-1,1)*(SUO.pre_ven*AOA.PERCENTAGEM_CUSTOS/100) SUO_VALOR,
                   cg.rv_abbreviation emp,
                   oda.id oda_id,
                   nvl(suo.qtd_fat,oda.quantidade) quantidade,   -- jgs20170213 ODA.QUANTIDADE,
                   (nvl(oda.duracao_horas,0) + ( nvl(oda.duracao_minutos,0)/60 ) ) * 60 total_tempo
            from   bgo_subcontratacoes suo,
                   bgo_operacoes_processadas oda,
                   bgo_operacoes_anuais ono,
                   bgo_associacoes_obras aoa,
                   bgo_obras oba,
                   bgo_associacoes_partes ape,
                   bgo_entidades ene,
                   bgo_operacoes opo,
                   bgo_centros_custos cco,
                   cg_ref_codes cg
            where  opo.id=ono.opo_id
            and    cg.rv_domain='EMPRESA_SUBCONTRATACAO'
            and    cg.rv_low_value=suo.emp_fac
            and    suo.emp_fac = 'P'
            and    suo.oda_id=oda.id
            and    oda.ono_id=ono.id
            and    ono.cco_id=cco.id
            and    ene.id=suo.ene_id_produtor
            and    aoa.oba_id_associada=oda.oba_id
            and    oba.id=aoa.oba_id_associada
            and    aoa.oba_id_receptora=vg_p_oba_id
            and    ape.pre_id_associada=oda.pre_id
            and    ape.pre_id_receptora in (select id from bgo_partes where oba_id=vg_p_oba_id)  -- jgs20150824 (SELECT ID FROM BGO_PARTES WHERE OBA_ID=AOA.OBA_ID_RECEPTORA)
            and     (suo.pre_ven*uc$facturas_obras.cust_aoa_cco (aoa.id,ono.cco_id)/100) != 0
            and    aoa.id=(select max(id)
                           from   bgo_associacoes_obras
                           where  oba_id_associada=aoa.oba_id_associada
                           and    oba_id_receptora=aoa.oba_id_receptora)
            and    oda.igc_id in (select distinct
                                         igc_id_proveniente
                                  from   bgo_valores_facturacao vfo,
                                         bgo_indices_geracao_custos igc
                                  where  vfo.oba_id_proveniente=aoa.oba_id_associada
                                  and    vfo.igc_id=igc.id
                                  and    vfo.igc_id=nvl(vgn_p_igc_id,vfo.igc_id)  -- JGS20110913
                                  and    igc.estado='A'
                                  and    vfo.oba_id_referente=aoa.oba_id_receptora
                                  and    vfo.tipo_movimento != 'G'
                                  and    ((vg_p_flg_tip_ger = 'R' and vg_p_tipo_obra = 'AR') or vfo.oba_id_referente <> vfo.oba_id_proveniente)
                                  and    vfo.oba_id_referente=vg_p_oba_id
                                  and    oda.igc_id=vfo.igc_id_proveniente)
            and    considerar='N'
            and    uc$producao.aced_obra(ono.id,'OF')='S'

      )
      loop

          vg_p_opt_cus_pe := vg_p_opt_cus_pe +1;  -- JGS20150824

          uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', 'R_CUS_PE.ODA_ID = '||r_cus_pe.oda_id , null, null);

          begin
          insert into bgo_auxi_repo_fatu (tip_reg,seq_id,oda_id, oba_id, oba_id_prov, descricao, tipo_mov_aux, order_by, order_by_num, quantidade, unidade, tempo, valor, valor_eur)
          values ('CUS_PE',vg_p_ses_id_cus_pe,r_cus_pe.oda_id,vg_p_oba_id,vg_p_oba_id,r_cus_pe.descricao2 ,'1S',null,r_cus_pe.ordenacao_num2,nvl(r_cus_pe.quantidade,0),null,nvl(r_cus_pe.total_tempo,0), r_cus_pe.suo_valor2, r_cus_pe.suo_valor2);
          exception when others then
                uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', 'SQLERRM = '||sqlerrm , null, null);
          end;

      end loop;

       insert into bgo_auxi_repo_fatu (c1,tip_reg,seq_id,oda_id, oba_id, oba_id_prov, descricao, tipo_mov_aux, order_by, order_by_num, quantidade, unidade, tempo, valor, valor_eur)
       select 'TOTAL','CUS_PE',vg_p_ses_id_cus_pe,null,vg_p_oba_id,vg_p_oba_id,descricao ,'1S',null, order_by_num,sum(quantidade),null,sum(tempo), sum(valor), sum(valor_eur)
       from   bgo_auxi_repo_fatu
       where  tip_reg = 'CUS_PE'
       and    seq_id  = vg_p_ses_id_cus_pe
       group by descricao, order_by_num;

       commit;


    end;
    --
    --
    procedure uc$trata_oper_discr is

       v_cco_id    number;
       v_igc_id    number;

       v_tot_qtd   number;
       v_tot_val   number;
       v_tot_tem   number;

       -- jgs20150127
       v_ccc_reg   bgo_classes_centros_custos%rowtype;
       aoa_reg     bgo_associacoes_obras%rowtype;
       v_perc      number;

    begin

       -- jgs20150126 inserir na tabela tmp os oba_id das associadas.
       delete from bgo_auxi_perg_resp where tab_nom = 'IDS_OBRAS_ASSOCIADAS';
       insert into bgo_auxi_perg_resp (tab_nom,tab_id) values ('IDS_OBRAS_ASSOCIADAS',vg_p_oba_id);
       insert into bgo_auxi_perg_resp (tab_nom,tab_id)
       select 'IDS_OBRAS_ASSOCIADAS',oba_id_associada
       from   bgo_associacoes_obras
       where  oba_id_receptora  = vg_p_oba_id
       and    oba_id_receptora != oba_id_associada
         and    flg_disc_valo    = 'N';


       -- BG ----------------------------------------

         select igc.id
         into   v_igc_id
         from   bgo_valores_facturacao vfo
       ,	    bgo_indices_geracao_custos igc
       where  vfo.oba_id_referente= vg_p_oba_id
       and	  vfo.igc_id=igc.id
       and    vfo.flg_tip_ger = vg_p_flg_tip_ger
       and    igc.estado='A'
       and    rownum=1;

       -- jgs20150126 inserir na tabela tmp os igc_ids das associadas (o select anterior já existia).
       delete from bgo_auxi_perg_resp where tab_nom = 'IGCS_OBRAS_ASSOCIADAS';
       insert into bgo_auxi_perg_resp (tab_nom,tab_id) values ('IGCS_OBRAS_ASSOCIADAS',v_igc_id);
       insert into bgo_auxi_perg_resp (tab_nom,tab_id)
       select distinct 'IGCS_OBRAS_ASSOCIADAS',igc_id_proveniente
       from   bgo_valores_facturacao
       where  igc_id = v_igc_id;

         for r_g1 in (

                  -- loop inicial
                  select  afo.oba_id oba_id_detail,
                          afo.oba_id_prov oba_id_prov,
                          afo.descricao descricao_detail,
                          afo.tipo_movimento_aux tipo_mov_aux,
                          afo.order_by order_by_detail,
                          afo.order_by_num order_by_num,
                          afo.quantidade quantidade,
                          afo.unidade unidade,
                          afo.tempo,
                          afo.valor valor_detail,
                          decode(vg_p_altera_50_2a,'N',afo.valor_eur,decode(afo.tipo_movimento_aux,'2A',uc$facturas_obras.reto_valo_2a_5o(afo.oba_id),(decode(afo.tipo_movimento_aux,'5O',uc$facturas_obras.reto_valo_2a_5o(afo.oba_id),afo.valor_eur)))) valor_eur_detail,
                          null dummy
                  from    bgo_analise_facturacao_v afo
                  where   afo.flg_tip_ger = vg_p_flg_tip_ger   -- JGS20150129 'R'
                  and      afo.oba_id = vg_p_oba_id
                  order   by order_by_num,order_by_detail

            )
            loop

               v_tot_qtd  := 0;
               v_tot_val  := 0;
               v_tot_tem  := 0;

             uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', '####### -- UC$TRATA_OPER_DISCR: tipo_mov_aux = '||r_g1.tipo_mov_aux ||', :DESCRICAO_DETAIL = '||r_g1.descricao_detail||', v_igc_id = '||to_char(nvl(v_igc_id,-1)), null, null);

                -- Para o centro de custo...
                begin

                    begin

                        select id
                        into   v_cco_id
                        from   bgo_centros_custos
                        where  descricao = r_g1.descricao_detail;

                    exception when others then v_cco_id := null;
                    end;

                  uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', '####### --v_cco_id = '||to_char(nvl(v_cco_id,-1))||', :P_ANO_GERA_CUS = '||vg_p_ano_gera_cus, null, null);

                    if v_cco_id is not null then


                    for v_opo_disc in (

                                    select distinct opo1.id, opo1.codigo, opo1.des_orc descricao
                                    from   bgo_operacoes_anuais ono1,
                                           bgo_operacoes        opo1
                                    where  ono1.cco_id   = v_cco_id
                                    and    ono1.opo_id   = opo1.id
                                    and    ono1.ano      = vg_p_ano_gera_cus     -- JGS20200210
                                    and    flg_dis       = 'S'

                    )
                    loop

                                            -- para esta operação, todas as anuais...
                                for r_ono_disc in (

                                    select *
                                    from   bgo_operacoes_anuais
                                    where  opo_id   = v_opo_disc.id
                                    and    flg_dis  = 'S'

                                )
                                loop


                                  uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', '####### --r_ono_disc.ID = '||to_char(nvl(r_ono_disc.id,-1)), null, null);

                                    for r_ope_disc in (


                                        select oda.id, valor_facturacao_eur, nvl(suo.qtd_fat,quantidade) quantidade , (nvl(oda.duracao_horas,0) + ( nvl(oda.duracao_minutos,0)/60 ) ) * 60 total_tempo, /*jgs20150127*/ oba_id
                                        from   bgo_operacoes_processadas oda,
                                               bgo_subcontratacoes       suo   -- jgs20170213
                                        where  oba_id in (select tab_id from bgo_auxi_perg_resp where tab_nom = 'IDS_OBRAS_ASSOCIADAS' )  -- jgs20150127 where  oba_id = :P_oba_id
                                        and    ono_id = r_ono_disc.id
                                        and    (igc_id in (select tab_id from bgo_auxi_perg_resp where tab_nom = 'IGCS_OBRAS_ASSOCIADAS'))   -- jgs20150127 igc_id = v_igc_id
                                        and    subcontratacao  = 'S'                -- acrescento isto para garantir
                                        and    nvl(valor_facturacao_eur,0) != 0   -- a partida, o valor faturado é igual ao bgo_subcontratacoes.
                                        and    suo.oda_id (+) = oda.id

                                    )
                                    loop

                                       -- jgs20150127
                               if r_ope_disc.oba_id = vg_p_oba_id and (vg_p_flg_tip_ger = 'A' or vg_p_tipo_obra != 'AR')     then

                                   v_perc := 1;

                               else

                                 begin

                                      select ccc.*
                                      into   v_ccc_reg
                                      from   bgo_classes_centros_custos ccc,
                                             bgo_centros_custos cco,
                                             bgo_operacoes_anuais ono
                                      where  ono.id = r_ono_disc.id
                                      and    cco.id = ono.cco_id
                                      and    ccc.id = cco.ccc_id;

                                        select *
                                        into   aoa_reg
                                        from   bgo_associacoes_obras
                                        where  oba_id_receptora =  vg_p_oba_id
                                        and    oba_id_associada =  r_ope_disc.oba_id;

                                      if v_ccc_reg.custo_fixo = 'S' then
                                          v_perc := aoa_reg.per_cus_fix/100;
                                      elsif v_ccc_reg.acabamento = 'S' then
                                          v_perc := aoa_reg.per_cus_var/100;
                                      elsif v_ccc_reg.cus_cha = 'S' then
                                          v_perc := aoa_reg.per_cha/100;
                                      else
                                          v_perc := 1;
                                      end if;


                                   exception when others then v_perc := 1;
                                   end;

                               end if;
                                       -- fim jgs20150127

                                       insert into bgo_auxi_repo_fatu (tip_reg,seq_id,oda_id, oba_id, oba_id_prov, descricao, tipo_mov_aux, order_by, order_by_num, quantidade, unidade, tempo, valor, valor_eur)
                                       values ('BG',vg_p_ses_id,r_ope_disc.id,r_g1.oba_id_detail,r_g1.oba_id_prov,v_opo_disc.descricao ,r_g1.tipo_mov_aux,r_g1.order_by_detail,r_g1.order_by_num+0.5,nvl(r_ope_disc.quantidade,0),r_g1.unidade,r_ope_disc.total_tempo, r_g1.valor_detail, r_ope_disc.valor_facturacao_eur*v_perc);

                                       -- acumular para saber se temos que não apresentar o principal, e para saber quanto temos que subtrair...
                                                     v_tot_qtd  := v_tot_qtd + nvl(r_ope_disc.quantidade,0)*v_perc;     -- podiamos não guardar, mas guardamos para discriminar
                                                     v_tot_val  := v_tot_val + r_ope_disc.valor_facturacao_eur*v_perc;
                                                     v_tot_tem  := v_tot_tem + nvl(r_ope_disc.total_tempo,0)*v_perc;

                                    end loop;

                                end loop;

                        -- fim todas as anuais

                    end loop;

                                if v_tot_qtd  != 0 or v_tot_val  != 0 or  v_tot_tem  != 0 then

                        -- inserir o acumulado...
                        insert into bgo_auxi_repo_fatu (tip_reg,c1, seq_id,oda_id, oba_id, oba_id_prov, descricao, tipo_mov_aux, order_by, order_by_num, quantidade, unidade, tempo, valor, valor_eur)
                        values ('BG','ACUMULADO',vg_p_ses_id,null,r_g1.oba_id_detail,r_g1.oba_id_prov,null ,r_g1.tipo_mov_aux,r_g1.order_by_detail,r_g1.order_by_num,v_tot_qtd,r_g1.unidade,v_tot_tem, r_g1.valor_detail, v_tot_val);

                                end if;    --if v_tot_qtd  != 0 or v_tot_val  != 0 or  v_tot_tem  != 0 then


                    end if; -- if v_cco_id is not null then

                exception when others then null;
                end;

            end loop;      -- r_g1

            commit;


         for r_g1 in (    -- jgs20150824... substituir...

                  -- loop inicial
                        select  distinct anf.oba_id oba_id_detail,
                      anf.oba_id_prov oba_id_prov,
                      anf.descricao descricao_detail,
                      anf.tipo_mov_aux tipo_mov_aux,
                      anf.order_by order_by_detail,
                      anf.order_by_num order_by_num,
                      anf.quantidade quantidade,
                      anf.unidade unidade,
                      anf.tempo tempo,
                                    anf.valor valor_detail,
                                    anf.valor_eur valor_eur_detail,
                      anf.n1    valor_sub,    -- JGS20141117: é este valor_sub que parece que deve ser usado. Só que isto é um acumulado para varisas ODAs.
                      null dummy1
                        from    bgo_auxi_repo_fatu anf
                        where   anf.oba_id = vg_p_oba_id      -- pode ficar...
                        and     anf.seq_id = vg_p_opt_id_nf
                      and     anf.n1 != 0   -- jgs20141117
              and     (
                                    anf.c1 = vg_p_flg_tip_ger
                                    or (vg_p_flg_tip_ger = 'R' and vg_p_tipo_obra = 'R' and anf.c1 = 'A' and anf.n1 != 0)
                                )
                        order by  order_by_num,order_by

            )
            loop

               v_tot_qtd  := 0;
               v_tot_val  := 0;
               v_tot_tem  := 0;

             uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', 'EDITORAS......####### -- UC$TRATA_OPER_DISCR: tipo_mov_aux (não selecionado), :DESCRICAO_DETAIL = '||r_g1.descricao_detail||', v_igc_id = '||to_char(nvl(v_igc_id,-1)), null, null);

                -- Para o centro de custo...
                begin

                    begin

                        select id
                        into   v_cco_id
                        from   bgo_centros_custos
                        where  descricao = r_g1.descricao_detail;

                    exception when others then v_cco_id := null;
                    end;

                  uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', 'EDITORAS......####### --v_cco_id = '||to_char(nvl(v_cco_id,-1))||', :P_ANO_GERA_CUS = '||vg_p_ano_gera_cus, null, null);

                    if v_cco_id is not null then


                    for v_opo_disc in (

                                    select distinct opo1.id, opo1.codigo, opo1.des_orc descricao
                                    from   bgo_operacoes_anuais ono1,
                                           bgo_operacoes        opo1
                                    where  ono1.cco_id   = v_cco_id
                                    and    ono1.opo_id   = opo1.id
                                    and    flg_dis       = 'S'

                    )
                    loop

                                            -- para esta operação, todas as anuais...
                                for r_ono_disc in (

                                    select *
                                    from   bgo_operacoes_anuais
                                    where  opo_id   = v_opo_disc.id
                                    and    flg_dis  = 'S'

                                )
                                loop


                                  uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', 'EDITORAS......####### --r_ono_disc.ID = '||to_char(nvl(r_ono_disc.id,-1)), null, null);

                                    for r_ope_disc in (

                                        -- select ID, VALOR_FACTURACAO_EUR, quantidade, (NVL(ODA.DURACAO_HORAS,0) + ( NVL(ODA.DURACAO_MINUTOS,0)/60 ) ) * 60 TOTAL_TEMPO
                                        select oda.id, suo.valor_eur valor_facturacao_eur, nvl(suo.qtd_fat,oda.quantidade) quantidade , (nvl(oda.duracao_horas,0) + ( nvl(oda.duracao_minutos,0)/60 ) ) * 60 total_tempo, oba_id
                                        from   bgo_operacoes_processadas oda,
                                               bgo_subcontratacoes       suo
                                        where  oba_id in (select tab_id from bgo_auxi_perg_resp where tab_nom = 'IDS_OBRAS_ASSOCIADAS' )  -- JGS20150129 oba_id = :P_oba_id
                                        and    ono_id = r_ono_disc.id
                                        and    (igc_id in (select tab_id from bgo_auxi_perg_resp where tab_nom = 'IGCS_OBRAS_ASSOCIADAS'))       -- JGS20150129 igc_id = v_igc_id
                                        and    subcontratacao  = 'S'                -- acrescento isto para garantir
                                        -- jgs20141117: o valor faturado nestes casos não fica nas operacoes processadas... and    nvl(VALOR_FACTURACAO_EUR,0) != 0
                                        and    suo.oda_id = oda.id
                                        and    nvl(suo.emp_fac,'B') != 'B'
                                        and    nvl(suo.valor_eur,0) != 0

                                    )

                                    loop


                                     uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', 'EDITORAS......####### --r_ope_disc.id = '||to_char(nvl(r_ope_disc.id,-1)), null, null);


                                       -- jgs20150127
                               if r_ope_disc.oba_id = vg_p_oba_id and (vg_p_flg_tip_ger = 'A' or vg_p_tipo_obra != 'AR') then

                                   v_perc := 1;

                               else

                                 begin

                                      select ccc.*
                                      into   v_ccc_reg
                                      from   bgo_classes_centros_custos ccc,
                                             bgo_centros_custos cco,
                                             bgo_operacoes_anuais ono
                                      where  ono.id = r_ono_disc.id
                                      and    cco.id = ono.cco_id
                                      and    ccc.id = cco.ccc_id;

                                        select *
                                        into   aoa_reg
                                        from   bgo_associacoes_obras
                                        where  oba_id_receptora =  vg_p_oba_id
                                        and    oba_id_associada =  r_ope_disc.oba_id;

                                      if v_ccc_reg.custo_fixo = 'S' then
                                          v_perc := aoa_reg.per_cus_fix/100;
                                      elsif v_ccc_reg.acabamento = 'S' then
                                          v_perc := aoa_reg.per_cus_var/100;
                                      elsif v_ccc_reg.cus_cha = 'S' then
                                          v_perc := aoa_reg.per_cha/100;
                                      else
                                          v_perc := 1;
                                      end if;


                                   exception when others then v_perc := 1;
                                   end;

                               end if;
                                       -- fim jgs20150127



                                       insert into bgo_auxi_repo_fatu (tip_reg,seq_id,oda_id, oba_id, oba_id_prov, descricao, tipo_mov_aux, order_by, order_by_num, quantidade, unidade, tempo, valor, valor_eur)
                                       values ('EDI',vg_p_ses_id,r_ope_disc.id,r_g1.oba_id_detail,r_g1.oba_id_prov,v_opo_disc.descricao ,r_g1.tipo_mov_aux,r_g1.order_by_detail,r_g1.order_by_num+0.5,nvl(r_ope_disc.quantidade,0),r_g1.unidade,r_ope_disc.total_tempo, r_g1.valor_detail, r_ope_disc.valor_facturacao_eur*v_perc);

                                       -- acumular para saber se temos que não apresentar o principal, e para saber quanto temos que subtrair...
                                                     v_tot_qtd  := v_tot_qtd + nvl(r_ope_disc.quantidade,0)*v_perc;
                                                     v_tot_val  := v_tot_val + r_ope_disc.valor_facturacao_eur*v_perc;
                                                     v_tot_tem  := v_tot_tem + nvl(r_ope_disc.total_tempo,0)*v_perc;

                                    end loop;

                                end loop;

                        -- fim todas as anuais

                    end loop;


                                if v_tot_qtd  != 0 or v_tot_val  != 0 or  v_tot_tem  != 0 then

                        -- inserir o acumulado...
                        insert into bgo_auxi_repo_fatu (tip_reg,c1, seq_id,oda_id, oba_id, oba_id_prov, descricao, tipo_mov_aux, order_by, order_by_num, quantidade, unidade, tempo, valor, valor_eur)
                        values ('EDI','ACUMULADO',vg_p_ses_id,null,r_g1.oba_id_detail,r_g1.oba_id_prov,null ,r_g1.tipo_mov_aux,r_g1.order_by_detail,r_g1.order_by_num,v_tot_qtd,r_g1.unidade,v_tot_tem, r_g1.valor_detail, v_tot_val);

                                end if;    --if v_tot_qtd  != 0 or v_tot_val  != 0 or  v_tot_tem  != 0 then


                    end if; -- if v_cco_id is not null then

                exception when others then null;
                end;

            end loop;      -- r_g1

            commit;

    exception when others then null;

    end uc$trata_oper_discr;    --
    --
    procedure uc$carrega_nf is
    begin


        /* jgs20150723:

       Uma particularidade das obras que estamos a otimizar vg_p_flg_tip_ger = 'R' and vg_p_tipo_obra = 'R'.
       Como as condições são:
           anf.flg_tip_ger = vg_p_flg_tip_ger
           or (vg_p_flg_tip_ger = 'R' and vg_p_tipo_obra = 'R' and anf.flg_tip_ger = 'A' and anf.valor_sub != 0)

           Para estes casos acabamos por tratar todos os registos, A e R --> Omitimos a questão (colocamos sempre 'R') e depois fazemos update...

           Alterações à view original:
           1.- Tratar só a obra em questão,
           2.- Substituir aced obra
           3.- substituir uc$facturas_obras.reto_tipo_gera_igc_vfo (ODA.IGC_ID)


      */
      if vg_p_flg_tip_ger = 'R' and vg_p_tipo_obra = 'R' then

           insert into bgo_auxi_repo_fatu (seq_id, oda_id, suo_id,
                                           oba_id, oba_id_prov, descricao, tipo_mov_aux, order_by, order_by_num, quantidade, unidade, tempo, valor, valor_eur, n1,c1,tip_reg)
         select vg_p_opt_id_nf,null,null,
                oba_id, oba_id_prov, descricao, tipo_movimento_aux, order_by, order_by_num, quantidade, unidade, tempo, valor, valor_eur, valor_sub, flg_tip_ger,'AUX_ANF'
         from
            -----------------------------------------------------------------------------------------------------------------------------------------------------
             (
         select   vfg.oba_id_referente oba_id,
                  to_number (null) oba_id_prov,
                  '1S' tipo_movimento_aux,
                  cco.descricao descricao,
                  null order_by,
                  cco.ord order_by_num,
                  null unidade,
                  sum (vfg.quantidade) quantidade,
                  sum (vfg.tempo) tempo,
                  sum (vfg.valor) valor,
                  sum (nvl (vfg.valor_eur, 0)) valor_eur,
                  0 valor_sub,
                  vfg.flg_tip_ger flg_tip_ger
           from   (select   oba_id_referente,
                            oba_id_proveniente,
                            cco_id,
                            quantidade,
                            tempo,
                            valor,
                            valor_eur,
                            vfg.flg_tip_ger
                     from   bgo_valo_fact_empr_grup vfg,
                            bgo_indices_geracao_custos igc
                    where       vfg.igc_id = igc.id
                            and igc.estado = 'A'
                            and vfg.tipo_movimento = 'C'
                            and vfg.oba_id_referente = vfg.oba_id_proveniente
                            and vfg.oba_id_referente = vg_p_oba_id
                            and (vfg.flg_tip_ger = 'A'              -- jgs20110923
                                 or (vfg.flg_tip_ger = 'R'
                                     and uc$facturas_obras.disc_valo_sim (
                                           vfg.oba_id_referente,
                                           vfg.oba_id_proveniente
                                        ) = 'N'))               -- jgs20110923 fim
                   union all
                   select   oba_id_referente,
                            oba_id_proveniente,
                            cco_id,
                            quantidade,
                            tempo,
                            valor,
                            valor_eur,
                            vfg.flg_tip_ger
                     from   bgo_valo_fact_empr_grup vfg,
                            bgo_indices_geracao_custos igc,
                            bgo_associacoes_obras aoa
                    where       aoa.oba_id_associada = vfg.oba_id_proveniente
                            and aoa.oba_id_receptora = vfg.oba_id_referente
                            and vfg.oba_id_referente = vg_p_oba_id
                            and aoa.flg_disc_valo = 'N'
                            and aoa.id =
                                  (select   max (id)
                                     from   bgo_associacoes_obras
                                    where   aoa.oba_id_associada = oba_id_associada
                                            and aoa.oba_id_receptora =
                                                  oba_id_receptora)
                            and vfg.igc_id = igc.id
                            and igc.estado = 'A'
                            and vfg.tipo_movimento = 'C'
                            and vfg.oba_id_referente <> vfg.oba_id_proveniente) vfg --,    bgo_valo_fact_empr_grup vfg
                                                                                   ,
                  bgo_classes_centros_custos ccc,
                  bgo_centros_custos cco
          where       ccc.id = cco.ccc_id
                  and cco.id = vfg.cco_id              --AND     cno.cco_id=cco.id
                  and ccc.custo_fixo = 'S'
                  and ccc.acabamento = 'N'
       group by   vfg.oba_id_referente,
                  '1S',
                  cco.descricao,
                  cco.ord,                               --Ivo Oliveira 18/08/2003
                  null,
                  vfg.flg_tip_ger
       ---------
       union all
         ---------
         -- SUBCONTRATAÇÃO
         select   oba_id                                -- Ivo Oliveira 21/07/2003
                        ,
                  to_number (null) oba_id_prov,
                  '1S' tipo_movimento_aux,
                  descricao,
                  order_by,
                  order_by_num,
                  null unidade,
                  sum (quantidade) quantidade,
                  sum (tempo) tempo,
                  sum (valor) valor,
                  sum (valor_eur) valor_eur                             -- Ivo Fim
                                           ,
                  sum (valor_sub) valor_sub,
                  flg_tip_ger
           from   (  select   oda.oba_id oba_id,
                              to_number (null) oba_id_prov,
                              '1S' tipo_movimento_aux,
                              cco.descricao descricao,
                              null order_by,             --Ivo Oliveira 18/08/2003
                              cco.ord order_by_num, --Ivo Oliveira 15/09/2003 Tenho que ter outro campo senão ordenava sempre como char
                              null unidade,
                              0 quantidade,
                              0 tempo,
                              0 valor,
                              0 valor_eur,
                              sum (suo.pre_ven) valor_sub,
                              'R'       -- se oda.oba_id = vg_p_oba_id (não associada), geração só pode ser 'R'   uc$facturas_obras.reto_tipo_gera_igc_vfo (ODA.IGC_ID)
                                 flg_tip_ger                        -- jgs20110921
                       from   bgo_subcontratacoes suo,
                              bgo_operacoes_processadas oda,
                              bgo_operacoes_anuais ono,
                              bgo_centros_custos cco --,      BGO_CENTROS_CUSTOS_PRECOS_ANO cno --Ivo Oliveira 18/08/2003
                                                    ,
                              bgo_classes_centros_custos ccc
                      where       suo.oda_id = oda.id
                              and oda.ono_id = ono.id
                              and oda.oba_id = vg_p_oba_id
                              and ono.cco_id = cco.id
                              and oda.igc_id in
                                       (select   igc.id
                                          from   bgo_valores_facturacao vfo,
                                                 bgo_indices_geracao_custos igc
                                         where   vfo.oba_id_referente = oda.oba_id
                                                 and vfo.igc_id = igc.id
                                                 and igc.estado = 'A'
                                                 and vfo.tipo_movimento = 'C'
                                                 and vfo.oba_id_referente =
                                                       vfo.oba_id_proveniente
                                                 and oda.igc_id = igc.id
                                                 and rownum = 1)
                              and considerar = 'N'
                              and cco.emp != 'B'   --AND UC$PRODUCAO.ACED_OBRA (oda.ONO_ID, 'OF') = 'N'
                              and ccc.id = cco.ccc_id
                              and ccc.custo_fixo = 'S'
                              and ccc.acabamento = 'N'
                   group by   oda.oba_id,
                              '1S',
                              cco.descricao,
                              --cno.ordenacao, --Ivo Oliveira 18/08/2003
                              cco.ord,                   --Ivo Oliveira 18/08/2003
                              null,
                              'R'            -- se oda.oba_id = vg_p_oba_id (não associada), geração só pode ser 'R'    uc$facturas_obras.reto_tipo_gera_igc_vfo (ODA.IGC_ID) -- jgs20110921
                   -- FIM SUBCONTRATAÇÃO
                   ----------------------------------------
                   union all -- Ivo Oliveira 21/07/2003 - Valores de obras associadas incluidos nos cco da receptora
                     ----------------------------------------
                     -- SUBCONTRATAÇÃO
                     select   aoa.oba_id_receptora oba_id,
                              to_number (null) oba_id_prov,
                              '1S' tipo_movimento_aux,
                              cco.descricao descricao,
                              --cno.ordenacao order_by, --Ivo Oliveira 18/08/2003
                              null order_by,             --Ivo Oliveira 18/08/2003
                              cco.ord order_by_num, --Ivo Oliveira 15/09/2003 Tenho que ter outro campo senão ordenava sempre como char
                              null unidade,
                              0 quantidade,
                              0 tempo,
                              0 valor,
                              0 valor_eur,
                              sum(  suo.pre_ven
                                  * uc$facturas_obras.cust_aoa_cco (aoa.id, cco.id)
                                  / 100) -- jgs20110829 SUM (SUO.PRE_VEN * AOA.PERCENTAGEM_CUSTOS / 100)
                                 valor_sub,
                              decode(oda.oba_id,vg_p_oba_id,'R','A')                     --uc$facturas_obras.reto_tipo_gera_igc_vfo (ODA.IGC_ID)
                                 flg_tip_ger                        -- jgs20110921
                       from   bgo_subcontratacoes suo,
                              bgo_operacoes_processadas oda,
                              bgo_operacoes_anuais ono,
                              bgo_associacoes_obras aoa,
                              bgo_obras oba,
                              bgo_associacoes_partes ape,
                              bgo_centros_custos cco --,      BGO_CENTROS_CUSTOS_PRECOS_ANO cno --Ivo Oliveira 18/08/2003
                                                    ,
                              bgo_classes_centros_custos ccc
                      where       suo.oda_id = oda.id
                              and oda.ono_id = ono.id
                              and ono.cco_id = cco.id
                              and aoa.oba_id_receptora = vg_p_oba_id
                              and aoa.oba_id_associada = oda.oba_id
                              and oba.id = aoa.oba_id_associada
                              and ape.pre_id_associada = oda.pre_id
                              and ape.pre_id_receptora in
                                       (select   id
                                          from   bgo_partes
                                         where   oba_id = aoa.oba_id_receptora)
                              and aoa.flg_disc_valo = 'N'
                              and (decode(oda.oba_id,vg_p_oba_id,'R','A') = 'A'                          -- jgs20110923
                                   or (decode(oda.oba_id,vg_p_oba_id,'R','A') = 'R'
                                       and uc$facturas_obras.disc_valo_sim (
                                             aoa.oba_id_receptora,
                                             to_number (null)
                                          ) = 'N'))             -- jgs20110923 fim
                              and aoa.id =
                                    (select   max (id)
                                       from   bgo_associacoes_obras
                                      where   oba_id_associada = aoa.oba_id_associada
                                              and oba_id_receptora =
                                                    aoa.oba_id_receptora)
                              and oda.igc_id in
                                       (select   igc_id_proveniente
                                          from   bgo_valores_facturacao vfo,
                                                 bgo_indices_geracao_custos igc
                                         where   vfo.oba_id_proveniente =
                                                    aoa.oba_id_associada
                                                 and vfo.igc_id = igc.id
                                                 and igc.estado = 'A'
                                                 and vfo.oba_id_referente =
                                                       aoa.oba_id_receptora
                                                 and vfo.tipo_movimento != 'G'
                                                 and vfo.oba_id_referente <>
                                                       vfo.oba_id_proveniente
                                                 and oda.igc_id =
                                                       vfo.igc_id_proveniente
                                                 and rownum = 1)
                              and considerar = 'N'
                              and cco.emp != 'B'    --AND UC$PRODUCAO.ACED_OBRA (oda.ONO_ID, 'OF') = 'N'
                              and ccc.id = cco.ccc_id
                              and ccc.custo_fixo = 'S'
                              and ccc.acabamento = 'N'
                   group by   aoa.oba_id_receptora,
                              to_number (null),
                              '1S',
                              cco.descricao,
                              --cno.ordenacao, --Ivo Oliveira 18/08/2003
                              cco.ord,                   --Ivo Oliveira 18/08/2003
                              null,
                              decode(oda.oba_id,vg_p_oba_id,'R','A')     --uc$facturas_obras.reto_tipo_gera_igc_vfo (ODA.IGC_ID) -- jgs20110921
                                                                                   )
       group by   oba_id,
                  '1S',
                  descricao,
                  order_by,
                  order_by_num,
                  flg_tip_ger                                       -- jgs20110921
       -- FIM SUBCONTRATAÇÃO
       ---------
       union all
         ---------
         select   vfg.oba_id_referente oba_id_custos_fixos,
                  to_number (null) oba_id_prov,
                  '2N' tipo_movimento_aux,
                  cco.descricao descricao,
                  null order_by,                         --Ivo Oliveira 18/08/2003
                  cco.ord order_by_num, --Ivo Oliveira 15/09/2003 Tenho que ter outro campo senão ordenava sempre como char
                  null unidade,
                  sum (vfg.quantidade) quantidade,
                  sum (vfg.tempo) tempo,
                  sum (vfg.valor) valor,
                  --ROUND(SUM(NVL(vfg.valor_eur,0)),2) valor_eur
                  sum (nvl (vfg.valor_eur, 0)) valor_eur,
                  0 valor_sub,
                  vfg.flg_tip_ger
           from   (select   oba_id_referente,
                            oba_id_proveniente,
                            cco_id,
                            quantidade,
                            tempo,
                            valor,
                            valor_eur,
                            vfg.flg_tip_ger
                     from   bgo_valo_fact_empr_grup vfg,
                            bgo_indices_geracao_custos igc
                    where       vfg.igc_id = igc.id
                            and igc.estado = 'A'
                            and vfg.tipo_movimento = 'C'
                            and vfg.oba_id_referente = vfg.oba_id_proveniente
                            and vfg.oba_id_referente = vg_p_oba_id
                            and (vfg.flg_tip_ger = 'A'              -- jgs20110923
                                 or (vfg.flg_tip_ger = 'R'
                                     and uc$facturas_obras.disc_valo_sim (
                                           vfg.oba_id_referente,
                                           vfg.oba_id_proveniente
                                        ) = 'N'))               -- jgs20110923 fim
                   union all
                   select   oba_id_referente,
                            oba_id_proveniente,
                            cco_id,
                            quantidade,
                            tempo,
                            valor,
                            valor_eur,
                            vfg.flg_tip_ger
                     from   bgo_valo_fact_empr_grup vfg,
                            bgo_indices_geracao_custos igc,
                            bgo_associacoes_obras aoa
                    where       aoa.oba_id_associada = vfg.oba_id_proveniente
                            and aoa.oba_id_receptora = vfg.oba_id_referente
                            and vfg.oba_id_referente = vg_p_oba_id
                            and aoa.flg_disc_valo = 'N'
                            and aoa.id =
                                  (select   max (id)
                                     from   bgo_associacoes_obras
                                    where   aoa.oba_id_associada = oba_id_associada
                                            and aoa.oba_id_receptora =
                                                  oba_id_receptora)
                            and vfg.igc_id = igc.id
                            and igc.estado = 'A'
                            and vfg.tipo_movimento = 'C'
                            and vfg.oba_id_referente <> vfg.oba_id_proveniente) vfg --,    bgo_valo_fact_empr_grup vfg,
                                                                                   ,
                  bgo_classes_centros_custos ccc,
                  bgo_centros_custos cco
          where       ccc.id = cco.ccc_id              --AND     cno.cco_id=cco.id
                  and ccc.acabamento = 'N'
                  and cco.id = vfg.cco_id
       group by   vfg.oba_id_referente,
                  '2N',
                  cco.descricao,
                  cco.ord,                               --Ivo Oliveira 18/08/2003
                  null,
                  vfg.flg_tip_ger
       ---------
       union all
         ---------
         -- SUBCONTRATAÇÃO
         select   oba_id,
                  to_number (null) oba_id_prov,
                  '2N' tipo_movimento_aux,
                  descricao,
                  order_by,
                  order_by_num,
                  null unidade,
                  sum (quantidade) quantidade,
                  sum (tempo) tempo,
                  sum (valor) valor,
                  sum (valor_eur) valor_eur                             -- Ivo Fim
                                           ,
                  sum (valor_sub) valor_sub,
                  flg_tip_ger                                       -- jgs20110921
           from   (  select   oda.oba_id oba_id,
                              to_number (null) oba_id_prov,
                              '2N' tipo_movimento_aux,
                              cco.descricao descricao,
                              --cno.ordenacao order_by, --Ivo Oliveira 18/08/2003
                              null order_by,             --Ivo Oliveira 18/08/2003
                              cco.ord order_by_num, --Ivo Oliveira 15/09/2003 Tenho que ter outro campo senão ordenava sempre como char
                              null unidade,
                              0 quantidade,
                              0 tempo,
                              0 valor,
                              0 valor_eur,
                              sum (suo.pre_ven) valor_sub,
                              'R'    --uc$facturas_obras.reto_tipo_gera_igc_vfo (ODA.IGC_ID)
                                 flg_tip_ger                        -- jgs20110921
                       from   bgo_subcontratacoes suo,
                              bgo_operacoes_processadas oda,
                              bgo_operacoes_anuais ono,
                              bgo_centros_custos cco --,      BGO_CENTROS_CUSTOS_PRECOS_ANO cno --Ivo Oliveira 18/08/2003
                                                    ,
                              bgo_classes_centros_custos ccc
                      where       suo.oda_id = oda.id
                              and oda.ono_id = ono.id
                              and oda.oba_id = vg_p_oba_id
                              and ono.cco_id = cco.id
                              and oda.igc_id in
                                       (select   igc.id
                                          from   bgo_valores_facturacao vfo,
                                                 bgo_indices_geracao_custos igc
                                         where   vfo.oba_id_referente = oda.oba_id
                                                 and vfo.igc_id = igc.id
                                                 and igc.estado = 'A'
                                                 and vfo.tipo_movimento = 'C'
                                                 and vfo.oba_id_referente =
                                                       vfo.oba_id_proveniente
                                                 and oda.igc_id = igc.id
                                                 and rownum = 1)
                              and considerar = 'N'
                              and cco.emp != 'B'   --AND UC$PRODUCAO.ACED_OBRA (oda.ONO_ID, 'OF') = 'N'
                              and ccc.id = cco.ccc_id
                              and ccc.acabamento = 'N'
                   group by   oda.oba_id,
                              '2N',
                              cco.descricao,
                              --cno.ordenacao, --Ivo Oliveira 18/08/2003
                              cco.ord,                   --Ivo Oliveira 18/08/2003
                              null,
                              'R'  --uc$facturas_obras.reto_tipo_gera_igc_vfo (ODA.IGC_ID) -- jgs20110921
                   -- FIM SUBCONTRATAÇÃO
                   ----------------------------------------
                   union all -- Ivo Oliveira 21/07/2003 - Valores de obras associadas incluidos nos cco da receptora
                     ----------------------------------------
                     -- SUBCONTRATAÇÃO
                     select   aoa.oba_id_receptora oba_id,
                              to_number (null) oba_id_prov,
                              '2N' tipo_movimento_aux,
                              cco.descricao descricao,
                              --cno.ordenacao order_by, --Ivo Oliveira 18/08/2003
                              null order_by,             --Ivo Oliveira 18/08/2003
                              cco.ord order_by_num, --Ivo Oliveira 15/09/2003 Tenho que ter outro campo senão ordenava sempre como char
                              null unidade,
                              0 quantidade,
                              0 tempo,
                              0 valor,
                              0 valor_eur,
                              sum(  suo.pre_ven
                                  * uc$facturas_obras.cust_aoa_cco (aoa.id, cco.id)
                                  / 100) -- jgs20110829 SUM (SUO.PRE_VEN * AOA.PERCENTAGEM_CUSTOS / 100)
                                 valor_sub,
                              decode(oda.oba_id,vg_p_oba_id,'R','A')  --uc$facturas_obras.reto_tipo_gera_igc_vfo (ODA.IGC_ID)
                                 flg_tip_ger                        -- jgs20110921
                       from   bgo_subcontratacoes suo,
                              bgo_operacoes_processadas oda,
                              bgo_operacoes_anuais ono,
                              bgo_associacoes_obras aoa,
                              bgo_obras oba,
                              bgo_associacoes_partes ape,
                              bgo_centros_custos cco --,      BGO_CENTROS_CUSTOS_PRECOS_ANO cno --Ivo Oliveira 18/08/2003
                                                    ,
                              bgo_classes_centros_custos ccc
                      where       suo.oda_id = oda.id
                              and oda.ono_id = ono.id
                              and aoa.oba_id_receptora = vg_p_oba_id
                              and ono.cco_id = cco.id
                              and aoa.oba_id_associada = oda.oba_id
                              and oba.id = aoa.oba_id_associada
                              and ape.pre_id_associada = oda.pre_id
                              and ape.pre_id_receptora in
                                       (select   id
                                          from   bgo_partes
                                         where   oba_id = aoa.oba_id_receptora)
                              and aoa.flg_disc_valo = 'N'
                              and (decode(oda.oba_id,vg_p_oba_id,'R','A') = 'A'                          -- jgs20110923
                                   or (decode(oda.oba_id,vg_p_oba_id,'R','A') = 'R'
                                       and uc$facturas_obras.disc_valo_sim (
                                             aoa.oba_id_receptora,
                                             to_number (null)
                                          ) = 'N'))             -- jgs20110923 fim
                              and aoa.id =
                                    (select   max (id)
                                       from   bgo_associacoes_obras
                                      where   oba_id_associada = aoa.oba_id_associada
                                              and oba_id_receptora =
                                                    aoa.oba_id_receptora)
                              and oda.igc_id in
                                       (select   igc_id_proveniente
                                          from   bgo_valores_facturacao vfo,
                                                 bgo_indices_geracao_custos igc
                                         where   vfo.oba_id_proveniente =
                                                    aoa.oba_id_associada
                                                 and vfo.igc_id = igc.id
                                                 and igc.estado = 'A'
                                                 and vfo.oba_id_referente =
                                                       aoa.oba_id_receptora
                                                 and vfo.tipo_movimento != 'G'
                                                 and vfo.oba_id_referente <>
                                                       vfo.oba_id_proveniente
                                                 and oda.igc_id =
                                                       vfo.igc_id_proveniente
                                                 and rownum = 1)
                              and considerar= 'N'
                              and cco.emp != 'B' --AND UC$PRODUCAO.ACED_OBRA (oda.ONO_ID, 'OF') = 'N'
                              and ccc.id = cco.ccc_id
                              and ccc.acabamento = 'N'
                   group by   aoa.oba_id_receptora,
                              to_number (null),
                              '2N',
                              cco.descricao,
                              --cno.ordenacao, --Ivo Oliveira 18/08/2003
                              cco.ord,                   --Ivo Oliveira 18/08/2003
                              null,
                              decode(oda.oba_id,vg_p_oba_id,'R','A')   --uc$facturas_obras.reto_tipo_gera_igc_vfo (ODA.IGC_ID) -- jgs20110921
                                                                                   )
       group by   oba_id,
                  '2N',
                  descricao,
                  order_by,
                  order_by_num,
                  flg_tip_ger                                       -- jgs20110921
       -- FIM SUBCONTRATAÇÃO
       ---------
       union all
         ---------
         select   vfg.oba_id_referente oba_id,
                  to_number (null) oba_id_prov,
                  '3X' tipo_movimento_aux,
                  cco.descricao descricao,
                  null order_by,                         --Ivo Oliveira 18/08/2003
                  cco.ord order_by_num, --Ivo Oliveira 15/09/2003 Tenho que ter outro campo senão ordenava sempre como char
                  null unidade,
                  sum (vfg.quantidade) quantidade,
                  sum (vfg.tempo) tempo,
                  sum (vfg.valor) valor,
                  --ROUND(SUM(NVL(vfg.valor_eur,0)),2) valor_eur
                  sum (nvl (vfg.valor_eur, 0)) valor_eur,
                  0 valor_sub,
                  vfg.flg_tip_ger
           from   (select   oba_id_referente,
                            oba_id_proveniente,
                            cco_id,
                            quantidade,
                            tempo,
                            valor,
                            valor_eur,
                            vfg.flg_tip_ger
                     from   bgo_valo_fact_empr_grup vfg,
                            bgo_indices_geracao_custos igc
                    where       vfg.igc_id = igc.id
                            and igc.estado = 'A'
                            and vfg.tipo_movimento = 'C'
                            and vfg.oba_id_referente = vfg.oba_id_proveniente
                            and vfg.oba_id_referente = vg_p_oba_id
                            and (vfg.flg_tip_ger = 'A'              -- jgs20110923
                                 or (vfg.flg_tip_ger = 'R'
                                     and uc$facturas_obras.disc_valo_sim (
                                           vfg.oba_id_referente,
                                           vfg.oba_id_proveniente
                                        ) = 'N'))               -- jgs20110923 fim
                   union all
                   select   oba_id_referente,
                            oba_id_proveniente,
                            cco_id,
                            quantidade,
                            tempo,
                            valor,
                            valor_eur,
                            vfg.flg_tip_ger
                     from   bgo_valo_fact_empr_grup vfg,
                            bgo_indices_geracao_custos igc,
                            bgo_associacoes_obras aoa
                    where       aoa.oba_id_associada = vfg.oba_id_proveniente
                            and aoa.oba_id_receptora = vfg.oba_id_referente
                            and aoa.flg_disc_valo = 'N'
                            and aoa.id =
                                  (select   max (id)
                                     from   bgo_associacoes_obras
                                    where   aoa.oba_id_associada = oba_id_associada
                                            and aoa.oba_id_receptora =
                                                  oba_id_receptora)
                            and vfg.igc_id = igc.id
                            and vfg.oba_id_referente = vg_p_oba_id
                            and igc.estado = 'A'
                            and vfg.tipo_movimento = 'C'
                            and vfg.oba_id_referente <> vfg.oba_id_proveniente) vfg,
                  bgo_classes_centros_custos ccc,
                  bgo_centros_custos cco
          where       ccc.id = cco.ccc_id
                  and ccc.custo_fixo = 'N'
                  and ccc.acabamento = 'N'
                  and cco.id = vfg.cco_id
       group by   vfg.oba_id_referente,
                  '3X',
                  cco.descricao,
                  cco.ord,                               --Ivo Oliveira 18/08/2003
                  null,
                  vfg.flg_tip_ger
       ---------
       union all
         ---------
         -- SUBCONTRATAÇÃO
         select   oba_id                                -- Ivo Oliveira 21/07/2003
                        ,
                  to_number (null) oba_id_prov,
                  '3X' tipo_movimento_aux,
                  descricao,
                  order_by,
                  order_by_num,
                  null unidade,
                  sum (quantidade) quantidade,
                  sum (tempo) tempo,
                  sum (valor) valor,
                  sum (valor_eur) valor_eur                             -- Ivo Fim
                                           ,
                  sum (valor_sub) valor_sub,
                  flg_tip_ger                                       -- jgs20110921
           from   (  select   oda.oba_id oba_id,
                              to_number (null) oba_id_prov,
                              '3X' tipo_movimento_aux,
                              cco.descricao descricao,
                              --cno.ordenacao order_by, --Ivo Oliveira 18/08/2003
                              null order_by,             --Ivo Oliveira 18/08/2003
                              cco.ord order_by_num, --Ivo Oliveira 15/09/2003 Tenho que ter outro campo senão ordenava sempre como char
                              null unidade,
                              0 quantidade,
                              0 tempo,
                              0 valor,
                              0 valor_eur,
                              sum (suo.pre_ven) valor_sub,
                              'R'  --uc$facturas_obras.reto_tipo_gera_igc_vfo (ODA.IGC_ID)
                                 flg_tip_ger                        -- jgs20110921
                       from   bgo_subcontratacoes suo,
                              bgo_operacoes_processadas oda,
                              bgo_operacoes_anuais ono,
                              bgo_centros_custos cco --,      BGO_CENTROS_CUSTOS_PRECOS_ANO cno --Ivo Oliveira 18/08/2003
                                                    ,
                              bgo_classes_centros_custos ccc
                      where       suo.oda_id = oda.id
                              and oda.ono_id = ono.id
                              and ono.cco_id = cco.id
                              and oda.oba_id = vg_p_oba_id
                              and oda.igc_id in
                                       (select   igc.id
                                          from   bgo_valores_facturacao vfo,
                                                 bgo_indices_geracao_custos igc
                                         where   vfo.oba_id_referente = oda.oba_id
                                                 and vfo.igc_id = igc.id
                                                 and igc.estado = 'A'
                                                 and vfo.tipo_movimento = 'C'
                                                 and vfo.oba_id_referente =
                                                       vfo.oba_id_proveniente
                                                 and oda.igc_id = igc.id
                                                 and rownum = 1)
                              and considerar = 'N'
                              and cco.emp != 'B' --AND UC$PRODUCAO.ACED_OBRA (oda.ONO_ID, 'OF') = 'N'
                              and ccc.id = cco.ccc_id
                              and ccc.custo_fixo = 'N'
                              and ccc.acabamento = 'N'
                   group by   oda.oba_id,
                              '3X',
                              cco.descricao,
                              --cno.ordenacao, --Ivo Oliveira 18/08/2003
                              cco.ord,                   --Ivo Oliveira 18/08/2003
                              null,
                              'R'     --uc$facturas_obras.reto_tipo_gera_igc_vfo (ODA.IGC_ID) -- jgs20110921
                   -- FIM SUBCONTRATAÇÃO
                   ----------------------------------------
                   union all -- Ivo Oliveira 21/07/2003 - Valores de obras associadas incluidos nos cco da receptora
                     ----------------------------------------
                     -- SUBCONTRATAÇÃO
                     select   aoa.oba_id_receptora oba_id,
                              to_number (null) oba_id_prov,
                              '3X' tipo_movimento_aux,
                              cco.descricao descricao,
                              --cno.ordenacao order_by, --Ivo Oliveira 18/08/2003
                              null order_by,             --Ivo Oliveira 18/08/2003
                              cco.ord order_by_num, --Ivo Oliveira 15/09/2003 Tenho que ter outro campo senão ordenava sempre como char
                              null unidade,
                              0 quantidade,
                              0 tempo,
                              0 valor,
                              0 valor_eur,
                              sum(  suo.pre_ven
                                  * uc$facturas_obras.cust_aoa_cco (aoa.id, cco.id)
                                  / 100) --jgs20110829 SUM (SUO.PRE_VEN * AOA.PERCENTAGEM_CUSTOS / 100)
                                 valor_sub,
                              decode(oda.oba_id,vg_p_oba_id,'R','A')    --uc$facturas_obras.reto_tipo_gera_igc_vfo (ODA.IGC_ID)
                                 flg_tip_ger                        -- jgs20110921
                       from   bgo_subcontratacoes suo,
                              bgo_operacoes_processadas oda,
                              bgo_operacoes_anuais ono,
                              bgo_associacoes_obras aoa,
                              bgo_obras oba,
                              bgo_associacoes_partes ape,
                              bgo_centros_custos cco --,      BGO_CENTROS_CUSTOS_PRECOS_ANO cno --Ivo Oliveira 18/08/2003
                                                    ,
                              bgo_classes_centros_custos ccc
                      where       suo.oda_id = oda.id
                              and oda.ono_id = ono.id
                              and ono.cco_id = cco.id
                              and aoa.oba_id_associada = oda.oba_id
                              and aoa.oba_id_receptora = vg_p_oba_id
                              and oba.id = aoa.oba_id_associada
                              and ape.pre_id_associada = oda.pre_id
                              and ape.pre_id_receptora in
                                       (select   id
                                          from   bgo_partes
                                         where   oba_id = aoa.oba_id_receptora)
                              and aoa.flg_disc_valo = 'N'
                              and (decode(oda.oba_id,vg_p_oba_id,'R','A') = 'A'                          -- jgs20110923
                                   or (decode(oda.oba_id,vg_p_oba_id,'R','A') = 'R'
                                       and uc$facturas_obras.disc_valo_sim (
                                             aoa.oba_id_receptora,
                                             to_number (null)
                                          ) = 'N'))             -- jgs20110923 fim
                              and aoa.id =
                                    (select   max (id)
                                       from   bgo_associacoes_obras
                                      where   oba_id_associada = aoa.oba_id_associada
                                              and oba_id_receptora =
                                                    aoa.oba_id_receptora)
                              and oda.igc_id in
                                       (select   igc_id_proveniente
                                          from   bgo_valores_facturacao vfo,
                                                 bgo_indices_geracao_custos igc
                                         where   vfo.oba_id_proveniente =
                                                    aoa.oba_id_associada
                                                 and vfo.igc_id = igc.id
                                                 and igc.estado = 'A'
                                                 and vfo.oba_id_referente =
                                                       aoa.oba_id_receptora
                                                 and vfo.tipo_movimento != 'G'
                                                 and vfo.oba_id_referente <>
                                                       vfo.oba_id_proveniente
                                                 and oda.igc_id =
                                                       vfo.igc_id_proveniente
                                                 and rownum = 1)
                              and considerar = 'N'
                              and cco.emp != 'B' --AND UC$PRODUCAO.ACED_OBRA (oda.ONO_ID, 'OF') = 'N'
                              and ccc.id = cco.ccc_id
                              and ccc.custo_fixo = 'N'
                              and ccc.acabamento = 'N'
                   group by   aoa.oba_id_receptora,
                              to_number (null),
                              '3X',
                              cco.descricao,
                              --cno.ordenacao, --Ivo Oliveira 18/08/2003
                              cco.ord,                   --Ivo Oliveira 18/08/2003
                              null,
                              decode(oda.oba_id,vg_p_oba_id,'R','A')     ---uc$facturas_obras.reto_tipo_gera_igc_vfo (ODA.IGC_ID) -- jgs20110921
                                                                                   )
       group by   oba_id,
                  '3X',
                  descricao,
                  order_by,
                  order_by_num,
                  flg_tip_ger
       -- FIM SUBCONTRATAÇÃO
       ---------
       union all
         ---------
         select   vfg.oba_id_referente oba_id,
                  vfg.oba_id_proveniente oba_id_prov,
                  '5O' tipo_movimento_aux,                  /* OBRAS ASSOCIADAS */
                  --oba_proveniente.titulo_abreviado||'  ('||aoa.percentagem_custos||'%)' descricao,
                  oba_proveniente.titulo_abreviado descricao,
                  oba_proveniente.titulo_abreviado order_by,
                  to_number (null) order_by_num,
                  null unidade,
                  sum (vfg.quantidade) quantidade,
                  sum (vfg.tempo) tempo,
                  sum (vfg.valor) valor,
                  --ROUND(SUM(NVL(vfg.valor_eur,0)),2) valor_eur
                  sum (nvl (vfg.valor_eur, 0)) valor_eur,
                  0 valor_sub,
                  vfg.flg_tip_ger
           from   bgo_valo_fact_empr_grup vfg,
                  bgo_indices_geracao_custos igc,
                  bgo_obras oba_proveniente,
                  bgo_associacoes_obras aoa
          where       igc.id = vfg.igc_id
                  and igc.estado = 'A'
                  and oba_proveniente.id = vfg.oba_id_proveniente
                  and vfg.oba_id_referente = vg_p_oba_id
                  and (vfg.flg_tip_ger = 'R'                       /*jgs20110919*/
                                            or (vfg.oba_id_referente <> vfg.oba_id_proveniente))
                  -- jgs20110923 AND vfg.oba_id_referente <> vfg.oba_id_proveniente
                  and aoa.oba_id_receptora = vfg.oba_id_referente
                  and aoa.oba_id_associada = vfg.oba_id_proveniente
                  and aoa.flg_disc_valo = 'S'           -- Ivo Oliveira 21/07/2003
                  and vfg.tipo_movimento != 'G'         -- Jorge Rafael 02-10-2000
       /* Deve listar todos os tipos de movimento, excepto artigos da PEL, onde a obra referente seja
       diferente da proveniente.  */
       group by   vfg.oba_id_referente,
                  vfg.oba_id_proveniente,
                  '5O',
                  --oba_proveniente.titulo_abreviado||'  ('||aoa.percentagem_custos||'%)',
                  oba_proveniente.titulo_abreviado,
                  oba_proveniente.titulo_abreviado,
                  null,
                  vfg.flg_tip_ger
       ---------
       union all
         ---------
         -- SUBCONTRATAÇÃO
         select   aoa.oba_id_receptora oba_id,
                  aoa.oba_id_associada oba_id_prov,
                  '5O' tipo_movimento_aux,
                  oba.titulo_abreviado descricao,
                  oba.titulo_abreviado order_by,
                  to_number (null) order_by_num,
                  null unidade,
                  0 quantidade,
                  0 tempo,
                  0 valor,
                  0 valor_eur,
                  sum(  suo.pre_ven
                      * uc$facturas_obras.cust_aoa_cco (aoa.id, ono.cco_id)
                      / 100)
                     valor_sub -- jgs20110929 SUM (SUO.PRE_VEN * AOA.PERCENTAGEM_CUSTOS / 100) valor_sub
                              ,
                  decode(oda.oba_id,vg_p_oba_id,'R','A') flg_tip_ger -- uc$facturas_obras.reto_tipo_gera_igc_vfo (ODA.IGC_ID) flg_tip_ger -- jgs20110921
           from   bgo_subcontratacoes suo,
                  bgo_operacoes_processadas oda,
                  bgo_operacoes_anuais ono,
                  bgo_associacoes_obras aoa,
                  bgo_obras oba,
                  bgo_associacoes_partes ape
          where       suo.oda_id = oda.id
                  and oda.ono_id = ono.id
                  and aoa.oba_id_receptora = vg_p_oba_id
                  and aoa.oba_id_associada = oda.oba_id
                  and aoa.flg_disc_valo = 'S'           -- Ivo Oliveira 21/07/2003
                  and (decode(oda.oba_id,vg_p_oba_id,'R','A') = 'R' /*jgs20110919*/
                                                                                  or (aoa.oba_id_receptora <> aoa.oba_id_associada))
                  and oba.id = aoa.oba_id_associada
                  and ape.pre_id_associada = oda.pre_id
                  and ape.pre_id_receptora in
                           (select   id
                              from   bgo_partes
                             where   oba_id = aoa.oba_id_receptora)
                  and aoa.id =
                        (select   max (id)
                           from   bgo_associacoes_obras
                          where   oba_id_associada = aoa.oba_id_associada
                                  and oba_id_receptora = aoa.oba_id_receptora)
                  and oda.igc_id in
                           (select   igc_id_proveniente
                              from   bgo_valores_facturacao vfo,
                                     bgo_indices_geracao_custos igc
                             where   vfo.oba_id_proveniente = aoa.oba_id_associada
                                     and vfo.igc_id = igc.id
                                     and igc.estado = 'A'
                                     and vfo.oba_id_referente =
                                           aoa.oba_id_receptora
                                     and vfo.tipo_movimento != 'G'
                                     and vfo.oba_id_referente <>
                                           vfo.oba_id_proveniente
                                     and oda.igc_id = vfo.igc_id_proveniente
                                     and rownum = 1)
                  and considerar <> 'S'
                  and considerar is not null             --Ivo Oliveira 17/07/2003
                  and uc$producao.aced_obra (oda.ono_id, 'OF') = 'N'
       group by   aoa.oba_id_receptora,
                  aoa.oba_id_associada,
                  '5O',
                  oba.titulo_abreviado,
                  oba.titulo_abreviado,
                  null,
                  decode(oda.oba_id,vg_p_oba_id,'R','A')   ---uc$facturas_obras.reto_tipo_gera_igc_vfo (ODA.IGC_ID) -- jgs20110921
       -- FIM SUBCONTRATAÇÃO
       ---------
       union all
         ---------
         select   oba_id,
                  to_number (null) oba_id_prov,
                  '6D' tipo_movimento_aux,
                  descricao,
                  order_by,
                  to_number (null) order_by_num,
                  null unidade,
                  sum (quantidade) quantidade,
                  sum (tempo) tempo,
                  sum (valor) valor,
                  sum (valor_eur) valor_eur                             -- Ivo Fim
                                           ,
                  sum (valor_sub) valor_sub,
                  flg_tip_ger
           from   (  select   vfg.oba_id_referente oba_id,
                              to_number (null) oba_id_prov,
                              '6D' tipo_movimento_aux,
                              'Diferencial de acabamento' descricao,
                              null order_by,
                              null unidade,
                              sum (vfg.quantidade) quantidade,
                              sum (vfg.tempo) tempo,
                              sum (vfg.valor) valor,
                              --ROUND(SUM(NVL(vfg.valor_eur,0)),2) valor_eur
                              sum (nvl (vfg.valor_eur, 0)) valor_eur,
                              0 valor_sub,
                              vfg.flg_tip_ger
                       from   (select   oba_id_referente,
                                        oba_id_proveniente,
                                        quantidade,
                                        tempo,
                                        valor,
                                        valor_eur,
                                        vfg.flg_tip_ger
                                 from   bgo_valo_fact_empr_grup vfg,
                                        bgo_indices_geracao_custos igc
                                where       vfg.igc_id = igc.id
                                        and igc.estado = 'A'
                                        and vfg.oba_id_referente = vg_p_oba_id
                                        and vfg.tipo_movimento = 'D'
                                        and vfg.oba_id_referente =
                                              vfg.oba_id_proveniente
                               union all
                               select   oba_id_referente,
                                        oba_id_proveniente,
                                        quantidade,
                                        tempo,
                                        valor,
                                        valor_eur,
                                        vfg.flg_tip_ger
                                 from   bgo_valo_fact_empr_grup vfg,
                                        bgo_indices_geracao_custos igc,
                                        bgo_associacoes_obras aoa
                                where   aoa.oba_id_associada = vfg.oba_id_proveniente
                                        and aoa.oba_id_receptora =
                                              vfg.oba_id_referente
                                        and aoa.flg_disc_valo = 'N'
                                        and vfg.oba_id_referente = vg_p_oba_id
                                        and aoa.id =
                                              (select   max (id)
                                                 from   bgo_associacoes_obras
                                                where   aoa.oba_id_associada =
                                                           oba_id_associada
                                                        and aoa.oba_id_receptora =
                                                              oba_id_receptora)
                                        and vfg.igc_id = igc.id
                                        and igc.estado = 'A'
                                        and vfg.tipo_movimento = 'D'
                                        and vfg.oba_id_referente <>
                                              vfg.oba_id_proveniente) vfg
                   group by   vfg.oba_id_referente,
                              '6D',
                              'Diferencial de acabamento',
                              null,
                              null,
                              vfg.flg_tip_ger ----------------------------------------
                   union all -- Ivo Oliveira 21/07/2003 - Valores de obras associadas incluidos nos cco da receptora
                     ----------------------------------------
                     select   vfg.oba_id_referente oba_id,
                              to_number (null) oba_id_prov,
                              '6D' tipo_movimento_aux,
                              'ACAB.-' || oba.titulo_abreviado || ' ('
                              || to_char(uc$facturas_obras.cust_aoa_cco (aoa.id,
                                                                         vfg.cco_id)) -- jgs20110829 || AOA.PERCENTAGEM_CUSTOS
                              || '%)'
                                 descricao,
                              null order_by,
                              null unidade,
                              oba.tiragem_total quantidade,
                              sum (vfg.tempo) tempo,
                              sum (vfg.valor) valor,
                              sum (nvl (vfg.valor_eur, 0)) valor_eur,
                              0 valor_sub,
                              vfg.flg_tip_ger
                       from   bgo_valo_fact_empr_grup vfg,
                              bgo_indices_geracao_custos igc,
                              bgo_obras oba,
                              bgo_associacoes_obras aoa
                      where       aoa.oba_id_associada = vfg.oba_id_proveniente
                              and aoa.oba_id_receptora = vfg.oba_id_referente
                              and vfg.oba_id_referente = vg_p_oba_id
                              and aoa.flg_disc_valo = 'N'
                              and aoa.id =
                                    (select   max (id)
                                       from   bgo_associacoes_obras
                                      where   aoa.oba_id_associada = oba_id_associada
                                              and aoa.oba_id_receptora =
                                                    oba_id_receptora)
                              and vfg.tipo_movimento = 'B'        /* Acabamento */
                              and vfg.oba_id_referente <> vfg.oba_id_proveniente
                              and igc.id = vfg.igc_id
                              and igc.estado = 'A'
                              and vfg.igc_id =
                                    (select   max (igc_id)
                                       from   bgo_valo_fact_empr_grup
                                      where   oba_id_referente = vfg.oba_id_referente
                                              and oba_id_proveniente = oba.id
                                              and tipo_movimento = 'B')
                              and oba.id = vfg.oba_id_proveniente
                   group by   vfg.oba_id_referente,
                              '6D',
                              'ACAB.-' || oba.titulo_abreviado || ' ('
                              || to_char(uc$facturas_obras.cust_aoa_cco (
                                            aoa.id,
                                            vfg.cco_id
                                         )) -- jgs20110829 || AOA.PERCENTAGEM_CUSTOS
                              || '%)',
                              null,
                              null,
                              oba.tiragem_total,
                              vfg.flg_tip_ger)
       group by   oba_id,
                  '6D',
                  descricao,
                  order_by,
                  flg_tip_ger
       ---------
       union all
         ---------
         select   vfg.oba_id_referente oba_id,
                  to_number (null) oba_id_prov,
                  '7B' tipo_movimento_aux,
                  nvl (too.descricao_output, 'Acabamento') descricao,
                  null order_by,
                  to_number (null) order_by_num,
                  null unidade,
                  oba.tiragem_total quantidade,
                  sum (vfg.tempo) tempo,
                  sum (vfg.valor) valor,
                  --ROUND(SUM(NVL(vfg.valor_eur,0)),5) valor_eur
                  sum (nvl (vfg.valor_eur, 0)) valor_eur,
                  0 valor_sub,
                  vfg.flg_tip_ger
           from   bgo_valo_fact_empr_grup vfg,
                  bgo_indices_geracao_custos igc,
                  bgo_obras oba,
                  bgo_tipos_acabamento too
          where       vfg.tipo_movimento = 'B'                    /* Acabamento */
                  and vfg.oba_id_referente = vfg.oba_id_proveniente
                  and igc.id = vfg.igc_id
                  and igc.estado = 'A'
                  and vfg.oba_id_referente = vg_p_oba_id
                  and vfg.igc_id =
                        (select   max (igc_id)
                           from   bgo_valo_fact_empr_grup
                          where       oba_id_referente = oba.id
                                  and oba_id_proveniente = oba.id
                                  and tipo_movimento = 'B')
                  and oba.id = vfg.oba_id_referente
                  and too.id(+) = oba.too_id
       group by   vfg.oba_id_referente,
                  '7B',
                  nvl (too.descricao_output, 'Acabamento'),
                  null,
                  null,
                  oba.tiragem_total,
                  vfg.flg_tip_ger
            )
            -----------------------------------------------------------------------------------------------------------------------------------------------------
            where oba_id = vg_p_oba_id;


      else -- se não for R-R, como até agora...

          insert into bgo_auxi_repo_fatu (seq_id, oda_id, suo_id, oba_id, oba_id_prov, descricao, tipo_mov_aux, order_by, order_by_num, quantidade, unidade, tempo, valor, valor_eur, n1,c1,tip_reg)
          select  vg_p_opt_id_nf,null,null,oba_id, oba_id_prov, descricao, tipo_movimento_aux, order_by, order_by_num, quantidade, unidade, tempo, valor, valor_eur, valor_sub, flg_tip_ger,'AUX_ANF'
          from    bgo_analise_nao_fact_v anf
          where   anf.oba_id = vg_p_oba_id   ;

      end if;

      -- jgs20211108 unifica mesmos centros de custo.Ticket#2021101310009695 — Resumo Detalhado de Custos - Custos das Editoras
      for r_dup in (

                select barf.seq_id, barf.oba_id,barf.descricao, barf.tipo_mov_aux, barf.order_by_num
                from   bgo_auxi_repo_fatu barf
                where  barf.seq_id = vg_p_opt_id_nf
                and    (barf.valor_eur != 0 or barf.n1 != 0)
                and    not exists (
                    select 1
                    from   bgo_auxi_repo_fatu  rpf
                    where  rpf.seq_id = vg_p_opt_id_nf
                    and    (rpf.valor_eur != 0 or rpf.n1 != 0)
                    and    rpf.order_by_num = barf.order_by_num + 0.5
                    and    rpf.oba_id = barf.oba_id
                    and    rpf.tipo_mov_aux = barf.tipo_mov_aux

                )
                group  by barf.seq_id, barf.oba_id,descricao, barf.tipo_mov_aux, barf.order_by_num
                having count(*) > 1
      )
      loop

                -- temos que percorrer os dois. Pegar no primeiro, anotar, update do segundo e delete do primeiro
                declare
                    v_n1		number;
                    v_id    number;
                    v_rg    number;
                begin

                        v_n1 := null;
                        v_id := null;
                        v_rg := 0;

                        for r_tra in (
                            select trata.*
                            from   bgo_auxi_repo_fatu trata
                            where  trata.seq_id = r_dup.seq_id and
                                   trata.oba_id = r_dup.oba_id and
                                   trata.descricao = r_dup.descricao and
                                   trata.tipo_mov_aux = r_dup.tipo_mov_aux and
                                   trata.order_by_num = r_dup.order_by_num
                            order  by nvl(trata.valor_eur,0), nvl(trata.n1,0)
                        )  -- primeiro subc.
                        loop

                            v_rg := v_rg + 1;
                            if v_id is null then
                                v_id := r_tra.id;
                                v_n1 := r_tra.n1;
                            end if;

                            if v_rg = 2 then

                                update bgo_auxi_repo_fatu
                                set    n1 = v_n1
                                where  id = r_tra.id;

                                delete from bgo_auxi_repo_fatu
                                where  id = v_id;

                            end if;

                        end loop;

                end;

      end loop;
      -- fim jgs20211108 unifica mesmos centros de custo.Ticket#2021101310009695 — Resumo Detalhado de Custos - Custos das Editoras



    end uc$carrega_nf;

    --
    procedure acab_ext (p_oba_id         in number,
                        p_ano_ger_custos in varchar2,
                        p_gfo            in varchar2,
                        p_id             in number,
                        p_igc_id         in number,
                        p_indicativo     in varchar2)

    is
    /************************************************************************
       NOME:        ACAB_EXT
       OBJECTIVO:   Gerar valores auxiliares para considerar como externos as entidades de
                    acabamento marcadas como externas (e descriminar)

       REVISÕES:
       Ver           Data            Autor             Descrição
       ---------  -----------  -----------------  -----------------------
        1.0        2014/11/18   José Sancho        Criação

    **************************************************************************/

    -- IVO OLIVEIRA 19/09/2002
    -- SE P_FACTURAVEL = 'S' OPERAÇÕES FACTURÁVEIS --> OPERAÇÕES DA EMPRESA " BLOCO GRÁFICO "
    -- SE P_FACTURAVEL = 'N' OPERAÇÕES NÃO FACTURÁVEIS --> OPERAÇÕES DA EMPRESA " AREAL "
    -- IVO FIM   ISTO DEIXOU DE SER NECESSARIO POIS A SUBCONTRATACAO MESMO DE OUTRAS EMPRESAS
              -- SE TIVER CONSIDERAR='S' DEVE SER TRATADA COMO FACTURÁVEL 29/10/2002

    cursor c_entidades_acabamento
    is
    select oba_id,
           chave,
           titulo,
           gfo_id,
           principal principal,
           valor_acabamento valor_acabamento,
           valor_acabamento_diferencial valor_acabamento_diferencial,
           unit_sub unit_sub,
           unit_sub_cus unit_sub_cus,  -- Eribeiro -- 2011-07-01 --
           valor_acabamento_eur valor_acabamento_eur,
           valor_acabamento_dif_eur valor_acabamento_dif_eur,
           unit_sub_eur unit_sub_eur,
           unit_sub_eur_cus unit_sub_eur_cus,  -- Eribeiro -- 2011-07-01 --
           dec_tiragem,
           dec_tipo_parte,
           val_cus_aca_eur val_cus_aca_eur,                -- #SAP# jgs20110105
           val_cus_aca_dif_eur val_cus_aca_dif_eur,         -- #SAP# jgs20110105
           eao_id,
           ene_id
    from  (select oba.id oba_id,
                  oba.chave_principal chave,
                  oba.titulo_abreviado titulo,
                  pre.gfo_id gfo_id,
                  sum(decode(tipos_partes.tipo_parte,'P',1,0)) principal,
                  sum(decode(tipos_partes.tipo_parte,'D',0,1) * decode(pao.id,null,0, ( decode(eaa.quantidade,null,1,0,1,eaa.quantidade) * pao.preco_venda * decode(eao.tipo_calculo,'O', nvl(pre.formato_altura,0)/100*nvl(pre.formato_largura,0)/100, 1) / decode(eao.tipo_calculo,'N',1, 'D', 1, 'O', nvl(decode(pre.itens_plano,0,1,pre.itens_plano),1), total_partes.total) * decode(eao.tipo_calculo,'N',decode(pre.rel_imp_aca_fac,0,1,pre.rel_imp_aca_fac), 'D', decode(pre.rel_imp_aca_fac,0,1,pre.rel_imp_aca_fac),1)) )) valor_acabamento,
                  sum(decode(tipos_partes.tipo_parte,'D',1,0) * decode(pao.id,null,0, ( decode(eaa.quantidade,null,1,0,1,eaa.quantidade) * pao.preco_venda * decode(eao.tipo_calculo,'O', nvl(pre.formato_altura,0)/100*nvl(pre.formato_largura,0)/100, 1) / decode(eao.tipo_calculo,'N',1, 'D', 1, 'O', nvl(decode(pre.itens_plano,0,1,pre.itens_plano),1), total_partes.total) * decode(eao.tipo_calculo,'N',decode(pre.rel_imp_aca_fac,0,1,pre.rel_imp_aca_fac), 'D', decode(pre.rel_imp_aca_fac,0,1,pre.rel_imp_aca_fac),1)) )) valor_acabamento_diferencial,
                  0 unit_sub,
                  0 unit_sub_cus, -- Eribeiro -- 2011-07-01 --
                  sum(decode(tipos_partes.tipo_parte,'D',0,1) * decode(pao.id,null,0, ( decode(eaa.quantidade,null,1,0,1,eaa.quantidade) * pao.preco_venda_eur * decode(eao.tipo_calculo,'O', nvl(pre.formato_altura,0)/100*nvl(pre.formato_largura,0)/100, 1) / decode(eao.tipo_calculo,'N',1, 'D', 1, 'O', nvl(decode(pre.itens_plano,0,1,pre.itens_plano),1), total_partes.total) * decode(eao.tipo_calculo,'N',decode(pre.rel_imp_aca_fac,0,1,pre.rel_imp_aca_fac), 'D', decode(pre.rel_imp_aca_fac,0,1,pre.rel_imp_aca_fac),1)) )) valor_acabamento_eur,
                  sum(decode(tipos_partes.tipo_parte,'D',1,0) * decode(pao.id,null,0, ( decode(eaa.quantidade,null,1,0,1,eaa.quantidade) * pao.preco_venda_eur * decode(eao.tipo_calculo,'O', nvl(pre.formato_altura,0)/100*nvl(pre.formato_largura,0)/100, 1) / decode(eao.tipo_calculo,'N',1, 'D', 1, 'O', nvl(decode(pre.itens_plano,0,1,pre.itens_plano),1), total_partes.total) * decode(eao.tipo_calculo,'N',decode(pre.rel_imp_aca_fac,0,1,pre.rel_imp_aca_fac), 'D', decode(pre.rel_imp_aca_fac,0,1,pre.rel_imp_aca_fac),1)) )) valor_acabamento_dif_eur,
                  0 unit_sub_eur,
                  0 unit_sub_eur_cus, -- Eribeiro -- 2011-07-01 --
                  decode(tipos_partes.tipo_parte,'D',pre.tiragem,null) dec_tiragem,
                  decode(tipos_partes.tipo_parte,'P','P','D','D','OUTROS') dec_tipo_parte,
                  sum(decode(tipos_partes.tipo_parte,'D',0,1) * decode(pao.id,null,0, ( decode(eaa.quantidade,null,1,0,1,eaa.quantidade) * pao.preco_custo_eur * decode(eao.tipo_calculo,'O', nvl(pre.formato_altura,0)/100*nvl(pre.formato_largura,0)/100, 1) / decode(eao.tipo_calculo,'N',1, 'D', 1, 'O', nvl(decode(pre.itens_plano,0,1,pre.itens_plano),1), total_partes.total) * decode(eao.tipo_calculo,'N',decode(pre.rel_imp_aca_fac,0,1,pre.rel_imp_aca_fac), 'D', decode(pre.rel_imp_aca_fac,0,1,pre.rel_imp_aca_fac),1)) )) val_cus_aca_eur,         -- #SAP# jgs20110105
                  sum(decode(tipos_partes.tipo_parte,'D',1,0) * decode(pao.id,null,0, ( decode(eaa.quantidade,null,1,0,1,eaa.quantidade) * pao.preco_custo_eur * decode(eao.tipo_calculo,'O', nvl(pre.formato_altura,0)/100*nvl(pre.formato_largura,0)/100, 1) / decode(eao.tipo_calculo,'N',1, 'D', 1, 'O', nvl(decode(pre.itens_plano,0,1,pre.itens_plano),1), total_partes.total) * decode(eao.tipo_calculo,'N',decode(pre.rel_imp_aca_fac,0,1,pre.rel_imp_aca_fac), 'D', decode(pre.rel_imp_aca_fac,0,1,pre.rel_imp_aca_fac),1)) )) val_cus_aca_dif_eur,      -- #SAP# jgs20110105
                  eaa.eao_id,
                  eaa.ene_id
           from   bgo_entidades_acabamento_obras eaa,
                  bgo_entidade_acabamento eao,
                  bgo_precos_acabamento pao,
                  bgo_obras_partes_n1_v tipos_partes,
                  bgo_obras_partes_ea_v total_partes,
                  bgo_partes_cfd_v somas_partes,
                  bgo_resumo_artigos_gf_temp rat,
                  bgo_obras oba,
                  bgo_partes pre
           where  eaa.eao_id = eao.id (+)
           and    eaa.flg_cus_ext = 'S'
           and    pao.eao_id (+) = eao.id
           and    eaa.pre_id (+) = pre.id
           and    somas_partes.oba_id = p_oba_id
           and    somas_partes.eao_id = eaa.eao_id
           and   ((pre.gfo_id is not null
                   and
                   somas_partes.gfo_id = pre.gfo_id)
                  or
                  pre.gfo_id is null)
           and   ((eao.id is not null
                   and
                   total_partes.eao_id = eao.id )
                  or
                  eao.id is null )
           and    total_partes.oba_id  = p_oba_id
           and   ((pre.gfo_id is not null
                   and
                   total_partes.gfo_id = pre.gfo_id)
                  or
                  pre.gfo_id is null)
           and    tipos_partes.codigo_nivel1 = pre.codigo_nivel1
           and    tipos_partes.chave_principal = oba.chave_principal
           and   ((pao.id is null)
                  or
                  ((to_char(sysdate,'YYYY-MM-DD')<(select valor_bg
                                                   from   bgo_parametros
                                                   where  descricao = 'data_transicao'
                                                   and    rownum=1)
                    and
                    pao.preco_venda is not null)
                   or
                   (to_char(sysdate,'YYYY-MM-DD')>=(select valor_bg
                                                    from   bgo_parametros
                                                    where  descricao = 'data_transicao'
                                                    and    rownum=1)
                    and
                    pao.preco_venda_eur is not null)))
           and    ((pao.id is not null
                    and
                    pao.ano = p_ano_ger_custos)
                   or pao.id is null)
           and    ((eao.id is not null
                    and
                    ((eao.tipo_calculo in ('N','O')
                      or
                      (eao.tipo_calculo not in ('N', 'O')
                       and
                       decode(eao.tipo_calculo,'F',decode(tipos_partes.tipo_parte,'D',somas_partes.total_folhas_diferencial,somas_partes.total_folhas),
                                               'C',decode(tipos_partes.tipo_parte,'D',somas_partes.total_cadernos_diferencial,somas_partes.total_cadernos),
                                               'D',round(nvl(pre.numero_paginas,0)/(decode(pre.rel_imp_aca_fac,null,1,0,1,pre.rel_imp_aca_fac)))) between pao.limite_inferior and pao.limite_superior))))
                   or
                   eao.id is null)
           and    (p_gfo = 'N'
                   or
                   (p_gfo = 'S'
                    and
                    rat.gfo_id = pre.gfo_id))
           and     rat.oba_id = p_oba_id
           and     rat.id = p_id
           and     oba.id = p_oba_id
           and     pre.oba_id = p_oba_id
           group by
                   oba.id,
                     eaa.eao_id,
                     eaa.ene_id,
                   oba.chave_principal,
                   oba.titulo_abreviado,
                   pre.gfo_id,
                   decode(tipos_partes.tipo_parte,'D',pre.tiragem,null),
                   decode(tipos_partes.tipo_parte,'P','P','D','D','OUTROS'))
    order by
           principal desc;


        /*VALORES FACTURAÇÃO - OBRAS ASSOCIADAS*/


        cursor c_assoc_grupos_fact(p_gfo_id number)is
        select gfo_id_receptor,
               percentagem
        from   bgo_assoc_grupos_facturacao
        where  gfo_id_associado = p_gfo_id;


        v_fim                           varchar2(1):='N';
        v_num_grupos_assoc               number := 0;
        v_assoc_ja_fact                   varchar2(1) := 'N';
        v_logs                           varchar2(1) := 'S';

        v_c_entidades_acabamento       c_entidades_acabamento%rowtype;
        v_c_entidades_acabamento_temp  c_entidades_acabamento%rowtype;

        v_pua                      number(20,9) := 0;
        v_pda                      number(20,9) := 0;
        v_pua_eur                  number(20,9) := 0;
        v_pda_eur                  number(20,9) := 0;
        v_ea_dif_gfo_id           number(9)    := 0;
        v_ea_fid_tiragem           number(9)       := 0;
        v_dif_sim                  varchar2(1)  := 'N';

        v_empresa                  bgo_valo_fact_empr_grup.empresa%type;

        v_pua_cus                  number(20,9) := 0;
        v_pda_cus                  number(20,9) := 0;
        v_pua_eur_cus              number(20,9) := 0;
        v_pda_eur_cus              number(20,9) := 0;

        v_reg_vfo                 bgo_valores_facturacao%rowtype;
        v_reg_w                   bgo_analise_facturacao_v%rowtype;
        v_nome_abre               varchar2(1000);
        v_eao_desc                varchar2(1000);


    begin

      uc$varios.cria_log('ficheiros_log_adm','ACAB_EXT_','*** INICIO DO PROCESSAMENTO: ACABAMENTO ***');

      uc$varios.cria_log('ficheiros_log_adm','ACAB_EXT_',to_char(p_oba_id));
      uc$varios.cria_log('ficheiros_log_adm','ACAB_EXT_',p_ano_ger_custos);
      uc$varios.cria_log('ficheiros_log_adm','ACAB_EXT_',p_gfo);
      uc$varios.cria_log('ficheiros_log_adm','ACAB_EXT_',to_char(p_id));

      for v_c_entidades_acabamento in c_entidades_acabamento
      loop

        v_fim:='S';

        uc$varios.cria_log('ficheiros_log_adm','ACAB_EXT_',to_char(v_c_entidades_acabamento.valor_acabamento_eur));
        uc$varios.cria_log('ficheiros_log_adm','ACAB_EXT_',to_char(v_c_entidades_acabamento.unit_sub_eur));
        uc$varios.cria_log('ficheiros_log_adm','ACAB_EXT_',to_char(v_c_entidades_acabamento.unit_sub_eur_cus));
        uc$varios.cria_log('ficheiros_log_adm','ACAB_EXT_',to_char(v_c_entidades_acabamento.val_cus_aca_eur)); -- #SAP# jgs20110105


        /*Valores da Obra Referente - Acabamentos*/

        if v_c_entidades_acabamento.dec_tipo_parte != 'D' then

           if v_logs='S' then
              if nvl(p_indicativo,'N')='S' then
                uc$varios.cria_log('ficheiros_log_adm','ACAB_EXT_','=> ESTOU A INSERIR A LINHA DE ACABAMENTOS (VALOR MERAMENTE INDICATIVO)');
              else
                uc$varios.cria_log('ficheiros_log_adm','ACAB_EXT_','=> ESTOU A INSERIR A LINHA DE ACABAMENTOS');
              end if;
           end if;

           if v_c_entidades_acabamento.gfo_id is not null then
              select count(1)
              into   v_num_grupos_assoc
              from   bgo_assoc_grupos_facturacao
              where  gfo_id_associado = v_c_entidades_acabamento.gfo_id;
           end if;

           if v_c_entidades_acabamento.gfo_id is not null  and v_num_grupos_assoc > 0 then

              for xreg in c_assoc_grupos_fact(v_c_entidades_acabamento.gfo_id)
              loop

                begin

                 if v_logs='S' then
                    if nvl(p_indicativo,'N')='S' then
                      uc$varios.cria_log('ficheiros_log_adm','ACAB_EXT_','=> INSERIR (1) - (VALOR MERAMENTE INDICATIVO)');
                    else
                      uc$varios.cria_log('ficheiros_log_adm','ACAB_EXT_','=> INSERIR (1)');
                    end if;
                 end if;


                    v_reg_vfo.oba_id_referente 		:= p_oba_id;
                    v_reg_vfo.oba_id_proveniente	:= p_oba_id;
                    v_reg_vfo.gfo_id              := xreg.gfo_id_receptor;
                    v_reg_vfo.igc_id              := p_igc_id;
                    v_reg_vfo.valor               := nvl(round((v_c_entidades_acabamento.valor_acabamento+v_c_entidades_acabamento.unit_sub),1),0) * xreg.percentagem / 100;
                    v_reg_vfo.valor_eur           := round(nvl((v_c_entidades_acabamento.valor_acabamento_eur+v_c_entidades_acabamento.unit_sub_eur),0) * xreg.percentagem / 100,5);
                    v_reg_vfo.val_cus             := round(nvl((v_c_entidades_acabamento.val_cus_aca_eur+v_c_entidades_acabamento.unit_sub_eur_cus),0) * xreg.percentagem / 100,5);
                    v_reg_vfo.tipo_movimento      := 'B';
                    v_reg_vfo.igc_id_proveniente  := p_igc_id;

                               /*
                               SELECT     null ordenacao,
                               Cco.ORD    ordenacao_num,
                               ODA.OBA_ID OBA_ID_SUO,
                               OPO.DESCRICAO,
                               ENE.NOME_ABREVIADO,
                               decode(opo.sinal_operacao,'-',-1,1)*SUO.pre_ven SUO_VALOR
                               */

                    begin

                                select nome_abreviado
                                into   v_nome_abre
                                from   bgo_entidades
                                where  id = v_c_entidades_acabamento.ene_id;

                    exception when others then v_nome_abre := null;
                    end;

                      begin

                                select descricao
                                into   v_eao_desc
                                from   bgo_entidade_acabamento
                                where  id = v_c_entidades_acabamento.eao_id;

                      exception when others then v_eao_desc  := null;
                      end;



                    insert into bgo_auxi_repo_fatu (tip_reg,seq_id,c1,valor_eur, descricao)
                    values ('BG_EXT',vg_p_ses_id_ext, v_nome_abre, v_reg_vfo.valor_eur,v_eao_desc);

                    -- FIM simular view BGO_ANALISE_FACTURACAO_V

                 exception
                when others then
                  rollback;
                  uc$varios.cria_log('ficheiros_log_adm','ACAB_EXT_','=> Erro ao Inserir Valores de Facturação referentes a Valores de Acabamentos da própria OBRA. '||sqlcode);
                  --DSI$ERRORS.UNHANDLED_EXCEPTION('Erro ao Inserir Valores de Facturação referentes a Valores de Acabamentos da própria OBRA. '||SQLCODE);
                  end;

              end loop;

           else

              begin

                 if v_logs='S' then
                    uc$varios.cria_log('ficheiros_log_adm','ACAB_EXT_',to_char(v_c_entidades_acabamento.valor_acabamento_eur));
                    uc$varios.cria_log('ficheiros_log_adm','ACAB_EXT_',to_char(v_c_entidades_acabamento.unit_sub_eur));
                    uc$varios.cria_log('ficheiros_log_adm','ACAB_EXT_',to_char(v_c_entidades_acabamento.unit_sub_eur_cus));
                    uc$varios.cria_log('ficheiros_log_adm','ACAB_EXT_',to_char(v_c_entidades_acabamento.val_cus_aca_eur)); -- #SAP# jgs20110105
                    uc$varios.cria_log('ficheiros_log_adm','ACAB_EXT_','=> INSERIR (2)');
                 end if;


                  v_reg_vfo.oba_id_referente 		:= p_oba_id;
                  v_reg_vfo.oba_id_proveniente	:= p_oba_id;
                  v_reg_vfo.gfo_id              := v_c_entidades_acabamento.gfo_id;
                  v_reg_vfo.igc_id              := p_igc_id;
                  v_reg_vfo.valor               := nvl(round((v_c_entidades_acabamento.valor_acabamento+v_c_entidades_acabamento.unit_sub),1),0);
                  v_reg_vfo.valor_eur           := round(nvl((v_c_entidades_acabamento.valor_acabamento_eur+v_c_entidades_acabamento.unit_sub_eur),0),5);
                  v_reg_vfo.val_cus             := round(nvl((v_c_entidades_acabamento.valor_acabamento_eur+v_c_entidades_acabamento.unit_sub_eur),0),5);
                  v_reg_vfo.tipo_movimento      := 'B';
                  v_reg_vfo.igc_id_proveniente  := p_igc_id;

                  begin

                            select nome_abreviado
                            into   v_nome_abre
                            from   bgo_entidades
                            where  id = v_c_entidades_acabamento.ene_id;

                  exception when others then v_nome_abre := null;
                  end;

                  begin

                            select descricao
                            into   v_eao_desc
                            from   bgo_entidade_acabamento
                            where  id = v_c_entidades_acabamento.eao_id;

                  exception when others then v_eao_desc  := null;
                  end;

                  insert into bgo_auxi_repo_fatu (tip_reg,seq_id,c1,valor_eur,descricao)
                  values ('BG_EXT',vg_p_ses_id_ext, v_nome_abre, v_reg_vfo.valor_eur,v_eao_desc );

              exception
              when others then
                rollback;
                uc$varios.cria_log('ficheiros_log_adm','ACAB_EXT_','=> Erro ao Inserir Valores de Facturação referentes a Valores de Acabamentos da própria OBRA. '||sqlcode);
                --DSI$ERRORS.UNHANDLED_EXCEPTION('Erro ao Inserir Valores de Facturação referentes a Valores de Acabamentos da própria OBRA. '||SQLCODE);
              end;

           end if;

           v_pua := v_pua + v_c_entidades_acabamento.valor_acabamento + v_c_entidades_acabamento.unit_sub;
           v_pua_eur := v_pua_eur + v_c_entidades_acabamento.valor_acabamento_eur + v_c_entidades_acabamento.unit_sub_eur;

           v_pua_eur_cus := v_pua_eur_cus + v_c_entidades_acabamento.val_cus_aca_eur + v_c_entidades_acabamento.unit_sub_eur_cus; -- #SAP# jgs20110105

        end if;

        -- por simplicidade, não trato os Diferenciais...


        v_c_entidades_acabamento_temp := v_c_entidades_acabamento;

      end loop;

      commit;

      uc$varios.cria_log('ficheiros_log_adm','ACAB_EXT_','*** FIM DO PROCESSAMENTO: ACABAMENTO ***');



    end acab_ext;
    --
    --
    procedure acab_sub is

        v_nome_abre 		varchar2(500);
        v_valor         number;

        v_id_p          number := null;

      -- jgs20190129
      v_tot_aca_ope   number;
      v_pv_opo_ene    number;
      v_pv_opo_enes   number;

    begin

      -- para simular o comportamento da geração de valores, calcular primeiro o preço medio por parte, porque o preço medio por parte é calculado
      -- independentemente da entidade.
      -- como no report depois temos que apresentar por entidade, depois desagregamos, mas usamos o mesmo valor para todas as entidades.

      -- jgs20150128: se obra tiver uma parte de tipo P, só considerar nos cálculos essa e as filhas. Se não, todas.

        /* jgs20190129 Ticket#2018120610001977 — Resumo detalhado de custos - Obra 20183374 - com valor
            O erro no report ocorre quando temos registos de subcontratação com a mesma operação e na mesma parte. Nestes casos, o SIBG para determinar o custo unitário de acabamento calcula o valor médio dessas operações.
            No caso em apreço, o SIBG calculou corretamente esse valor (0,0666 €/ex). O erro surge quando o SIBG tenta determinar o valor total do acabamento externo.
            Neste cálculo, o SIBG já não está a considerar o valor médio dos registos com a mesma operação e na mesma parte, mas aparentemente está a considerar o somatório dos custos unitários dos registos de subcontratação
            com a indicação de faturar "Sim". Esta situação levou a que tivéssemos um valor de acabamento externo superior ao valor total do acabamento originado um valor de acabamento interno negativo.
            Pelo exposto, solicito que revejam o cálculo do valor total do acabamento que deverá seguir as mesmas regras que consideram para determinar o valor unitário de acabamento.
        */



      begin
            select id
            into   v_id_p
            from   bgo_partes
            where  oba_id     = vg_p_oba_id
            and    tipo_parte = 'P';

      exception when others then v_id_p := null;
      end;

      uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', '.... v_id_p = ' || to_char(nvl(v_id_p,-1)), null, null);

      for r_pre in (

          -- jgs20170213 select opo.id opo_id, oda.pre_id, sum(suo.pre_ven)/sum(oda.quantidade) pre_uni, opo.des_orc descricao /* jgs20150324 opo.descricao */
          -- nota jgs20190129 -- não estando o cliente, faz a média por operação.
          --                     ao acrescentar o cliente, teremos os valores necessários...
          select opo.id opo_id, oda.pre_id, sum(suo.pre_ven)/sum(nvl(suo.qtd_fat,oda.quantidade)) pre_uni, opo.des_orc descricao /* jgs20150324 opo.descricao */
          from   bgo_subcontratacoes       suo,
                 bgo_operacoes_processadas oda,
                 bgo_oda_igc_aux           oia,
                 bgo_operacoes_anuais      ono,
                 bgo_operacoes             opo
          where  oia.igc_id = (select  max (vfo2.igc_id_proveniente)
                                 from  bgo_valores_facturacao    vfo2
                                where  vfo2.oba_id_referente    = vg_p_oba_id
                                  and  vfo2.tipo_movimento = 'B'
                              )
          and   oia.oda_id     = oda.id
          and   oia.oda_id     = suo.oda_id
          and   oia.considerar = 'S'
          and   oda.ono_id     = ono.id
          and   ono.opo_id     = opo.id
          -- JGS20150128
          and   ( v_id_p is null or
                        (v_id_p is not null and oda.pre_id in (
                                                                                                select v_id_p id from dual
                                                                                                union all
                                                                                                select id id
                                                                                                from   bgo_partes
                                                                                                where  oba_id = vg_p_oba_id
                                                                                                and    pre_id = v_id_p
                                                                                            )
                        )
                )
          group by opo.id, oda.pre_id, opo.des_orc /* jgs2050324 opo.descricao */

      )
      loop


        declare
            v_descri	varchar2(1000);
        begin

            select codigo_nivel1||codigo_nivel2||codigo_nivel3
            into   v_descri
            from   bgo_partes
            where  id = r_pre.pre_id;

          uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', '»»»»»» Parte = '||v_descri||', OPERACAO = '||r_pre.opo_id||', preço medio = ' || to_char(nvl(r_pre.pre_uni,-1)), null, null);

            v_tot_aca_ope := vg_p_tiragem * r_pre.pre_uni;
          uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', 'v_tot_aca_ope = ' || to_char(nvl(v_tot_aca_ope,-1)), null, null);

        end;

        -- nota jgs20190129: o preço medio parece estar OK...(por parte)
        -- nota jgs20190129: No detalhe dos custos externos, os valores deverão ser repartidos de acordo com o peso da contribuição de cada umas das entidades. Neste caso teríamos as seguintes ponderações:
        -- para cada uma das partes, todos os clientes...

          for r_sub in (

                    -- select opo.id opo_id, oda.ene_id, r_pre.pre_uni pre_uni, opo.des_orc descricao /* jgs20150324 opo.descricao*/,sum(oda.quantidade) qtd
                    select opo.id opo_id, oda.ene_id, r_pre.pre_uni pre_uni, opo.des_orc descricao /* jgs20150324 opo.descricao*/,sum(nvl(suo.qtd_fat,oda.quantidade)) qtd
                    from   bgo_subcontratacoes       suo,
                           bgo_operacoes_processadas oda,
                           bgo_oda_igc_aux           oia,
                           bgo_operacoes_anuais      ono,
                           bgo_operacoes             opo
                    where  oia.igc_id = (select  max (vfo2.igc_id_proveniente)
                                           from  bgo_valores_facturacao    vfo2
                                          where  vfo2.oba_id_referente    = vg_p_oba_id
                                            and  vfo2.tipo_movimento = 'B'
                                        )
                    and   oia.oda_id     = oda.id
                    and   oia.oda_id     = suo.oda_id
                    and   oia.considerar = 'S'
                    and   oda.ono_id     = ono.id
                    and   oda.pre_id     = r_pre.pre_id
                    and   ono.opo_id     = r_pre.opo_id
                    and   ono.opo_id     = opo.id
                    group by opo.id, oda.ene_id, opo.des_orc /*jgs20150324 opo.descricao*/

          )
          loop

              begin

                        select nome_abreviado
                        into   v_nome_abre
                        from   bgo_entidades
                        where  id = r_sub.ene_id;

              exception when others then v_nome_abre := null;
              end;

                --SRW.set_field_num (0, nvl(:valor_eur_detail,1) * Tiragem(vg_QMC_oba_id));


              v_valor := r_sub.pre_uni * vg_p_tiragem;       -- a diferença entre a primeira versão e esta é que o pre_uni agora vem da simulação do cálculo do acabamento.
                                                           -- o pre_uni que estava na primeira versão era:
                                                           /*
                                                                                                                      for r_sub in (
                                                                                                                                select opo.id opo_id, oda.ene_id, sum(suo.pre_ven)/sum(oda.quantidade) pre_uni, opo.descricao

                                                           */

              -- nota jgs20190129: No detalhe dos custos externos, os valores deverão ser repartidos de acordo com o peso da contribuição de cada umas das entidades. Neste caso teríamos as seguintes ponderações:
            -- no exemplo: 2 operações, 2 entidades, 4 registos.  :OK
            -- Para poderar: preço de venda da operação-entidade / somatório(prços de venda operação-entidades).
                  v_pv_opo_ene   := 0;
              begin

                  select suo.pre_ven
                  into   v_pv_opo_ene
                  from   bgo_subcontratacoes       suo,
                         bgo_operacoes_processadas oda,
                         bgo_oda_igc_aux           oia,
                         bgo_operacoes_anuais      ono,
                         bgo_operacoes             opo
                  where  oia.igc_id = (select  max (vfo2.igc_id_proveniente)
                                         from  bgo_valores_facturacao    vfo2
                                        where  vfo2.oba_id_referente    = vg_p_oba_id
                                          and  vfo2.tipo_movimento = 'B'
                                      )
                  and   oia.oda_id     = oda.id
                  and   oia.oda_id     = suo.oda_id
                  and   oia.considerar = 'S'
                  and   oda.ono_id     = ono.id
                  and   ono.opo_id     = opo.id
                  and   oda.pre_id     = r_pre.pre_id
                  and   oda.ene_id     = r_sub.ene_id
                  and   ono.opo_id     = r_sub.opo_id
                  -- JGS20150128
                  and   ( v_id_p is null or
                                (v_id_p is not null and oda.pre_id in (
                                                                                                        select v_id_p id from dual
                                                                                                        union all
                                                                                                        select id id
                                                                                                        from   bgo_partes
                                                                                                        where  oba_id = vg_p_oba_id
                                                                                                        and    pre_id = v_id_p
                                                                                                    )
                                )
                        )
                  and  rownum = 1;


              exception when others then null;
                uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', 'v_pv_opo_ene erro ' || sqlerrm, null, null);
              end;
            uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', 'v_pv_opo_ene = ' || to_char(nvl(v_pv_opo_ene,-1)), null, null);

                    -- não parece ser correto... v_pv_opo_enes := v_tot_aca_ope;

                  v_pv_opo_enes   := 0;
              begin

              -- por cada ene_id, um registo, somar todos...
              select sum(pre_ven)
              into   v_pv_opo_enes
              from (
                      select oda.ene_id, max(suo.pre_ven) pre_ven
                      from   bgo_subcontratacoes       suo,
                             bgo_operacoes_processadas oda,
                             bgo_oda_igc_aux           oia,
                             bgo_operacoes_anuais      ono,
                             bgo_operacoes             opo
                      where  oia.igc_id = (select  max (vfo2.igc_id_proveniente)
                                             from  bgo_valores_facturacao    vfo2
                                            where  vfo2.oba_id_referente    = vg_p_oba_id
                                              and  vfo2.tipo_movimento = 'B'
                                          )
                      and   oia.oda_id     = oda.id
                      and   oia.oda_id     = suo.oda_id
                      and   oia.considerar = 'S'
                      and   oda.ono_id     = ono.id
                      and   ono.opo_id     = opo.id
                      and   oda.pre_id     = r_pre.pre_id
                      --    and   oda.ene_id     = r_sub.ene_id   -- isto faz a média!
                      and   ono.opo_id     = r_sub.opo_id
                      -- JGS20150128
                      and   ( v_id_p is null or
                                    (v_id_p is not null and oda.pre_id in (
                                                                                                            select v_id_p id from dual
                                                                                                            union all
                                                                                                            select id id
                                                                                                            from   bgo_partes
                                                                                                            where  oba_id = vg_p_oba_id
                                                                                                            and    pre_id = v_id_p
                                                                                                        )
                                    )
                            )
                   group by oda.ene_id
               );

              exception when others then null;
                uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', 'v_pv_opo_enes erro ' || sqlerrm, null, null);
              end;


            uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', 'v_pv_opo_enes = ' || to_char(nvl(v_pv_opo_enes,-1)), null, null);


                  if vg_p_multi_ope_sub = 'S' then   -- jgs20190129

                  insert into bgo_auxi_repo_fatu (tip_reg,seq_id,c1,valor_eur, descricao)
                  values ('BG_ACA_SUB',vg_p_ses_id_subc_encad, v_nome_abre, (nvl(v_pv_opo_ene,-1)/v_pv_opo_enes)*v_tot_aca_ope   ,r_sub.descricao);

                    else  -- fica como estava...
                  insert into bgo_auxi_repo_fatu (tip_reg,seq_id,c1,valor_eur, descricao)
                  values ('BG_ACA_SUB',vg_p_ses_id_subc_encad, v_nome_abre, v_valor,r_sub.descricao);
                  end if;



          end loop;

      end loop; --for r_pre in (


      commit;

      -- para não existir diferenças de arredondamento, ajustamos um dos registos
      -- SRW.set_field_num (0, nvl(:valor_eur_detail,1) * Tiragem(vg_QMC_oba_id));
      declare

          v_valor_eur_detail			number;
          v_av_menos_auxi         number;
          v_av_menos_auxi_abs     number;


      begin

                select decode(vg_p_altera_50_2a,'N',afo.valor_eur,decode(afo.tipo_movimento_aux,'2A',uc$facturas_obras.reto_valo_2a_5o(afo.oba_id),(decode(afo.tipo_movimento_aux,'5O',uc$facturas_obras.reto_valo_2a_5o(afo.oba_id),afo.valor_eur)))) valor_eur_detail
                into   v_valor_eur_detail
                from   bgo_analise_facturacao_v afo
                where  afo.flg_tip_ger        = vg_p_flg_tip_ger
                and    afo.tipo_movimento_aux = '7B'
                and    afo.oba_id             = vg_p_oba_id;

                -- se foi encontrada...
            uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', '####### -- v_valor_eur_detail = '||to_char(nvl(v_valor_eur_detail,-1)), null, null);

          --vg_p_acum_aca_subc;

          begin

                uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', '####### -- vg_p_ses_id_subc_encad = '||to_char(nvl(vg_p_ses_id_subc_encad,-1)), null, null);

                        /*  JGS20190129
                         O erro surge quando o SIBG tenta determinar o valor total do acabamento externo. Neste cálculo, o SIBG já não está a considerar o valor médio dos registos
                         com a mesma operação e na mesma parte, mas aparentemente está a considerar o somatório dos custos unitários dos registos de subcontratação com a
                         indicação de faturar "Sim"
                        */

                    select nvl(sum(valor_eur),0)
                    into   vg_p_acum_aca_subc
                    from   bgo_auxi_repo_fatu
                    where  seq_id = vg_p_ses_id_subc_encad;

                uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', '####### -- vg_p_acum_aca_subc = '||to_char(nvl(vg_p_acum_aca_subc,-1)), null, null);

          exception when others then vg_p_acum_aca_subc := 0;
          end;

            uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', '####### -- vg_p_tiragem = '||to_char(nvl(vg_p_tiragem,-1)), null, null);

          v_av_menos_auxi := v_valor_eur_detail*nvl(vg_p_tiragem,0) - vg_p_acum_aca_subc;

            uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', '####### -- v_av_menos_auxi = '||to_char(nvl(v_av_menos_auxi,-1)), null, null);

          select abs(nvl(v_av_menos_auxi,0))
          into   v_av_menos_auxi_abs
          from   dual;

          if v_av_menos_auxi_abs < 0.05 and v_av_menos_auxi_abs > 0 then   -- ajustar um dos valores, e recalcular total...

                        update bgo_auxi_repo_fatu
                        set    valor_eur = valor_eur + v_av_menos_auxi
                        where  id = (

                            select min(id)
                            from   bgo_auxi_repo_fatu
                            where  seq_id = vg_p_ses_id_subc_encad

                        );


                  begin

                            select nvl(sum(valor_eur),0)
                            into   vg_p_acum_aca_subc
                            from   bgo_auxi_repo_fatu
                            where  seq_id = vg_p_ses_id_subc_encad;

                        uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', '####### -- após ajuste... vg_p_acum_aca_subc = '||to_char(nvl(vg_p_acum_aca_subc,-1)), null, null);

                  exception when others then vg_p_acum_aca_subc := 0;
                  end;

          end if;

      exception when others then null;  -- NÃO ENCONTROU...
      end;

      if vg_p_acum_aca_subc is null then

        vg_p_acum_aca_subc := 0;

      end if;

      commit;

    end acab_sub;
    --
    --
    procedure uc$carrega_as is
    begin


      delete from bgo_auxi_perg_resp where tab_nom = 'SUBC_ASSO';

      vg_p_opt_rg_3 := 0;

      for r_ in (

          select suo.id
             from bgo_subcontratacoes suo
             ,		 bgo_operacoes_processadas oda
             ,		 bgo_associacoes_obras aoa
             ,		 bgo_obras oba
             ,		 bgo_associacoes_partes ape
             ,     bgo_operacoes_anuais   ono   -- jgs20110920
             where suo.oda_id=oda.id
             and   oda.ono_id = ono.id
             and     (suo.pre_ven*uc$facturas_obras.cust_aoa_cco (aoa.id,ono.cco_id)/100) != 0    -- jgs20110920
             and aoa.oba_id_associada=oda.oba_id
             and oba.id=aoa.oba_id_associada
             and ape.pre_id_associada=oda.pre_id
             and ape.pre_id_receptora in (select id
                                                                      from bgo_partes
                                                                      where oba_id=vg_p_oba_id   ) -- opt-jgs20150717 AOA.OBA_ID_RECEPTORA
             and aoa.id=(select max(id)
                                     from bgo_associacoes_obras
                                     where oba_id_associada=aoa.oba_id_associada
                                     and oba_id_receptora=aoa.oba_id_receptora)
             and oda.igc_id in (select igc_id_proveniente
                                                from bgo_valores_facturacao vfo
                                                ,	bgo_indices_geracao_custos igc
                                                where vfo.oba_id_proveniente=aoa.oba_id_associada
                                                and vfo.igc_id=igc.id  and vfo.flg_tip_ger = vg_p_flg_tip_ger --  VFO.IGC_ID=NVL(:P_IGC_ID,VFO.IGC_ID)
                                                and igc.estado='A'
                                                and vfo.oba_id_referente=aoa.oba_id_receptora
                                                and vfo.tipo_movimento != 'G'
                                                and ((vg_p_flg_tip_ger = 'R' and vg_p_tipo_obra = 'AR') or vfo.oba_id_referente <> vfo.oba_id_proveniente)
                                                    and oda.igc_id=vfo.igc_id_proveniente
                                                    and rownum=1)
             and considerar='N'
             and uc$producao.aced_obra(oda.ono_id,'OF')='S'
             and aoa.oba_id_receptora=vg_p_oba_id
           -- jgs20150313
           and oda.id not in (select oda_id from bgo_auxi_repo_fatu where seq_id = vg_p_ses_id_cus_pe and oda_id is not null)


      )
      loop

        vg_p_opt_rg_3 := vg_p_opt_rg_3 + 1;


      end loop;



    end;

--
--


    function BeforePForm return boolean is
    begin
      return (TRUE);
    end;
--
--
    function ret_idx_nome (p_nome in varchar2) return number is
        v_idx   number;
        c_scope               constant varchar2(1000) := UC$FAZ0080R_BLLl.vg_scope;
        v_override_default    varchar2(1)             := logger.bgo_override_default(c_scope);
        v_pro_id              varchar2(100)           := to_char(0);
        v_params              logger.tab_param;

    begin

        select to_number(col_seg)
        into   v_idx
        from   bgo_tabe_uso_gera
        where  tip_reg = UC$FAZ0080R_BLLl.vg_tip_tuga
        and    col_pri = upper(p_nome);

        return v_idx;
    exception when others then 
    	logger.log_info ('ret_idx_nome p_nome = '||p_nome||', erro = '||sqlerrm,c_scope,v_pro_id,v_override_default,null,v_params);
    	return null;
    end;
--
--
    function BeforeReport return boolean is

        c_scope               constant varchar2(1000) := UC$FAZ0080R_BLLl.vg_scope;
        v_override_default    varchar2(1)             := logger.bgo_override_default(c_scope);
        v_pro_id              varchar2(100)           := to_char(0);
        v_params              logger.tab_param;

        -- variáveis para armazenar params
        v_p_tipo_obra         varchar2(10);
        v_p_flg_tip_ger       varchar2(10);

    begin

    logger.log_info ('Ini BeforeReport',c_scope,v_pro_id,v_override_default,null,v_params);

    -- antes de mais, bgo_auxi_perg_resp é a mesma?
    insert into bgo_auxi_perg_resp (tab_nom,tab_id) values ('TESTE_PARA_VER_SE_COLA',17);

    --jgs20100930
    delete from   bgo_auxi_perg_resp
    where  tab_nom = 'FAO0080R_SUBBG';

    -- JGS20150213
    delete from   bgo_auxi_perg_resp
    where  tab_nom = 'TOT_EDIT';

    logger.log_info ('P_TIPO_OBRA ='||vg_p_tipo_obra,c_scope,v_pro_id,v_override_default,null,v_params);

    if vg_p_tipo_obra = 'AR' then
        if vg_p_flg_tip_ger = 'A' THEN
            val_param_rep(P_MODO) := 'FAT0081R';
            vg_P_MODO := 'FAT0081R';
        else
            val_param_rep(P_MODO) := 'FAT0082R';
            vg_P_MODO := 'FAT0082R';
        end if;
    else
        val_param_rep(P_MODO) := 'FAT0080R';
        vg_P_MODO := 'FAT0080R';
    end if;

    if vg_p_tipo_obra = 'AR' and vg_p_flg_tip_ger = 'R' AND vg_P_ATENDER_ENTREGAS = 'N' then
        vg_P_ALTERA_50_2A := 'S';
        val_param_rep(P_ALTERA_50_2A) := 'S';
    else
        vg_P_ALTERA_50_2A := 'N';
        val_param_rep(P_ALTERA_50_2A) := 'N';
    end if;

    select * into vg_reg_oba from bgo_obras where to_char(chave_principal) = vg_p_CHAVE_PRINCIPAL;
    val_param_rep(P_OBA_ID) := to_char(vg_reg_oba.id);
    vg_P_oba_id             := vg_reg_oba.id;

    /* jgs20190129 Ticket#2018120610001977 — Resumo detalhado de custos - Obra 20183374 - com valor
    O erro no report ocorre quando temos registos de subcontratação com a mesma operação e na mesma parte. Nestes casos, o SIBG para determinar o custo unitário de acabamento calcula o valor médio dessas operações.
    No caso em apreço, o SIBG calculou corretamente esse valor (0,0666 €/ex). O erro surge quando o SIBG tenta determinar o valor total do acabamento externo.
    Neste cálculo, o SIBG já não está a considerar o valor médio dos registos com a mesma operação e na mesma parte, mas aparentemente está a considerar o somatório dos custos unitários dos registos de subcontratação
    com a indicação de faturar "Sim". Esta situação levou a que tivéssemos um valor de acabamento externo superior ao valor total do acabamento originado um valor de acabamento interno negativo.
    Pelo exposto, solicito que revejam o cálculo do valor total do acabamento que deverá seguir as mesmas regras que consideram para determinar o valor unitário de acabamento.
    */

    -- jgs20190129: determinar se temos registos de subcontratação com a mesma operação e na mesma parte
    DECLARE
        v_max_ope_sub   number;
    BEGIN

        UC$LOGS_GERA_LOG (null, 'FAO0080R', 'A PREENCHER', 'D', '(acab -) vg_p_oba_id = '||vg_P_oba_id, null, null);

      begin
            select max(count(*))
            into   v_max_ope_sub
            from   bgo_operacoes_processadas oda,
                   bgo_operacoes_anuais      ono
            where  oda.oba_id         = vg_P_oba_id
            and    oda.subcontratacao = 'S'
            and    oda.ono_id         = ono.id
            group  by oda.pre_id, ono.opo_id;
      exception when others then
            v_max_ope_sub := null;
      end;

        UC$LOGS_GERA_LOG (null, 'FAO0080R', 'A PREENCHER', 'D', '(acab -) v_max_ope_sub = '||v_max_ope_sub, null, null);

        if nvl(v_max_ope_sub, 0) > 1 then
            vg_P_MULTI_OPE_SUB := 'S';
            val_param_rep(P_MULTI_OPE_SUB) := 'S';
        else
            vg_P_MULTI_OPE_SUB := 'N';
            val_param_rep(P_MULTI_OPE_SUB) := 'N';
        end if;

        UC$LOGS_GERA_LOG (null, 'FAO0080R', 'A PREENCHER', 'D', '(acab -) vg_p_multi_ope_sub = '||vg_P_MULTI_OPE_SUB, null, null);

    END;

    -- Os que não chegam no report, podem passar para number!
    vg_p_dupli := 1;
    val_param_rep(P_DUPLI) := '1'; --
    UC$LOGS_GERA_LOG (null, 'FAO0080R', 'A PREENCHER', 'D', 'vg_P_DUPLI = '||to_char(vg_p_dupli), null, null);

    -- jgs20141118
    BEGIN

        if upper(vg_P_ATENDER_ENTREGAS) = 'N' then

              select nvl(tiragem_total,1) into vg_p_tiragem from bgo_obras where id = vg_P_oba_id;

        elsif upper(vg_P_ATENDER_ENTREGAS) = 'S' then

            --SELECT  nvl(MAX(lge.quantidade_facturada),0)
            SELECT  nvl(SUM(lge.quantidade - lge.quantidade_facturada),0) --Alterado Joao Repolho 2000-09-07
            INTO		vg_p_tiragem
            FROM		bgo_linhas_guias_entrega lge
            WHERE		oba_id_facturacao = vg_P_oba_id
            AND     lge.estado <>'N';

        end if;

    exception
            when no_data_found then
            vg_p_tiragem := 1;
            when others then
            vg_p_tiragem := 0;
    END;
    val_param_rep(P_TIRAGEM) := TO_CHAR(vg_p_tiragem);
    -- jgs20141118 fim

    -- procedimentos especiais
    SELECT TO_NUMBER(PAR.VALOR_BG) INTO vg_P_ANO_GERA_CUS FROM BGO_PARAMETROS PAR WHERE PAR.DESCRICAO = 'ano_geracao_custos';

    -- parâmetros que são lidos e passam para o report

    SELECT arf_ses_seq.NEXTVAL INTO vg_P_SES_ID FROM DUAL;
    SELECT arf_ses_seq.NEXTVAL INTO vg_P_SES_ID_CUS_PE FROM DUAL; -- para poder controlar os registos de subcontratação internos...
    SELECT arf_ses_seq.NEXTVAL INTO vg_P_SES_ID_SUBC_ENCAD FROM DUAL; -- para poder controlar os registos de subcontratação internos...
    SELECT arf_ses_seq.NEXTVAL INTO vg_p_opt_id_nf FROM DUAL;  -- OPT-JGS20150824  -- Para UC$CARREGA_NF;
    SELECT arf_ses_seq.NEXTVAL INTO vg_P_SES_ID_EXT FROM DUAL;  -- um id diferente, para poder controlar melhor...

    insert into bgo_tabe_auxi_pers (col_1_c,col_1_n,  -- chave
                                    col_2_n,
                                    col_3_n,
                                    col_4_n,
                                    col_5_n,
                                    col_6_n)
    values (
        'NOVOS_REPORTS_FAZ0080R_IDS_AUXI', vg_taxp_id,
                                    vg_P_SES_ID,            -- col_2_n,
                                    vg_P_SES_ID_CUS_PE,     -- col_3_n,
                                    vg_P_SES_ID_SUBC_ENCAD, -- col_4_n,
                                    vg_p_opt_id_nf,         -- col_5_n,
                                    vg_P_SES_ID_EXT         -- col_6_n,
    );

    UC$LOGS_GERA_LOG (null, 'FAO0080R', 'A PREENCHER', 'D', 'uc$carrega_nf...', null, null);
    uc$carrega_nf;
    UC$LOGS_GERA_LOG (null, 'FAO0080R', 'A PREENCHER', 'D', 'uc$trata_oper_discr...', null, null);
    uc$trata_oper_discr;
    UC$LOGS_GERA_LOG (null, 'FAO0080R', 'A PREENCHER', 'D', 'acab_sub...', null, null);
    acab_sub;

    -- jgs20150312 custos da editora Ticket#2015021210000552
    -- para Q_4
    --UC$CUSTOS_PE; -- jgs20150312  Penso que deve ser fora.

    --acab_ext;
    declare  -- preparação de cálculo de valores para acab_ext

        v_count number;
        v_id    number;

    begin

           begin -- jgs20110209 ver se há grupos de facturação
              select count(1)
              into   v_count
              from   bgo_grupos_facturacao
              where  oba_id = vg_p_oba_id;
           exception when others then v_count := 0;
           end;

           -- este é sem grupos, por tanto...
           v_count := 0;

           if v_count = 0 then  -- sem grupos de fact

               select rat_seq.nextval
               into   v_id
               from   dual;

               -- valor é sempre calculado sem grupos de facturação.

               insert into bgo_resumo_artigos_gf_temp(id,oba_id)
               values (v_id, vg_p_oba_id);

               commit;



           else --if v_count = 0 then

               select rat_seq.nextval
               into   v_id
               from   dual;

               insert into bgo_resumo_artigos_gf_temp
                (  id
                , gfo_id
                , gfo_codigo
                , gfo_descricao
                , oba_id
               )
               select
                 v_id
                , id
                , codigo
                , descricao
                , oba_id
               from   bgo_grupos_facturacao
               where  oba_id = vg_p_oba_id;

               commit;
           end if; -- if v_count = 0 then


                 acab_ext(vg_p_oba_id,
                          vg_p_ano_gera_cus,
                          'N',                   -- P_GFO            IN VARCHAR2,
                          v_id,                  -- P_ID             IN NUMBER,
                          null,                  -- não é utilizado... P_IGC_ID         IN NUMBER,
                          'N');                  -- P_INDICATIVO     IN VARCHAR2, -- Ivo Oliveira 16/05/2006 - Indica que é para gerar o valor como indicativo não conta para facturar

    end;

    uc$custos_pe;

    return(TRUE);
    end  BeforeReport;
--
--
procedure Q1_oba_id_Detail1 is
begin

    insert into bgo_tabe_auxi_pers (col_1_c,col_1_n,  -- chave
           col_2_n,     -- afo.oba_id oba_id_Detail,
           col_3_n,     -- afo.oba_id_prov oba_id_prov
           col_2_c,     -- afo.descricao descricao_Detail,
           col_3_c,     -- afo.tipo_movimento_aux tipo_mov_aux,
           col_4_c,     -- afo.order_by order_by_detail,
           col_4_n,     -- afo.order_by_num order_by_num,
           col_5_n,     -- afo.quantidade quantidade,
           col_5_c,     -- afo.unidade unidade,
           col_6_n,     -- afo.tempo,
           col_7_c,     -- Valor_Detail, -- não existindo 8_n, coloco este em c,tté podia ser null...
           col_7_n,     -- Valor_eur_Detail,
           col_8_c,     -- valor_sub, vamos ver isto com mais calma... Vamos meter TO_CHAR. Depois, to(number)
           col_6_c      -- null dummy
           )
    select 'NOVOS_REPORTS_FAZ0080R_QDETAIL1', vg_taxp_id,
           anf.oba_id oba_id_detail1,
           anf.oba_id_prov oba_id_prov2,
           anf.descricao descricao_detail1,
           anf.tipo_mov_aux tipo_mov_aux1,
           anf.order_by order_by_detail1,
           anf.order_by_num order_by_num2,
           anf.quantidade quantidade1,
           anf.unidade unidade1,
           anf.tempo tempo1,
           anf.valor valor_detail1,
           anf.valor_eur valor_eur_detail1,
           to_char(anf.n1) valor_sub,
           null dummy1
    from   bgo_auxi_repo_fatu anf
    where  anf.seq_id = vg_p_opt_id_nf
    -- AND    anf.oba_id = vg_QMC_oba_id   /*MASTER-DETAIL*/
    and
     ( anf.c1 = vg_p_flg_tip_ger
           or (vg_p_flg_tip_ger = 'R' and vg_p_tipo_obra = 'R' and anf.c1 = 'A' and anf.n1 != 0))
    -- jgs20141031
    union all
    select  'NOVOS_REPORTS_FAZ0080R_QDETAIL1', vg_taxp_id,
            arf.oba_id oba_id_detail1,
            arf.oba_id_prov oba_id_prov2,
            arf.descricao descricao_detail1,
            arf.tipo_mov_aux tipo_mov_aux1,
            arf.order_by order_by_detail1,
            arf.order_by_num order_by_num2,
            sum(arf.quantidade) quantidade1,
            arf.unidade unidade1,
            sum(arf.tempo) tempo1,
            sum(arf.valor) valor_detail1,
            sum(arf.valor_eur) valor_eur_detail1,
            '0' valor_sub,
            null dummy1
    from    bgo_auxi_repo_fatu arf
    where   arf.seq_id = vg_p_ses_id
    and     tip_reg      = 'EDI'
    and     c1 is null
    group   by
            arf.oba_id,
            arf.oba_id_prov,
            arf.descricao,
            arf.tipo_mov_aux,
            arf.order_by,
            arf.order_by_num,
            arf.unidade, --,
            null
    -- fim jgs20141031
    -- jgs20150313
    union all
    select  'NOVOS_REPORTS_FAZ0080R_QDETAIL1', vg_taxp_id,
            arf.oba_id oba_id_detail1,
            arf.oba_id_prov oba_id_prov2,
            arf.descricao descricao_detail1,
            arf.tipo_mov_aux tipo_mov_aux1,
            arf.order_by order_by_detail1,
            arf.order_by_num order_by_num2,
            sum(arf.quantidade) quantidade1,
            arf.unidade unidade1,
            sum(arf.tempo) tempo1,
            sum(arf.valor) valor_detail1,
            0 valor_eur_detail1,
            to_char(sum(arf.valor_eur))  valor_sub,
            null dummy1
    from    bgo_auxi_repo_fatu arf
    where   arf.seq_id = vg_p_ses_id_cus_pe
    and     tip_reg      = 'CUS_PE'
    and     c1= 'TOTAL'
    group   by
            arf.oba_id,
            arf.oba_id_prov,
            arf.descricao,
            arf.tipo_mov_aux,
            arf.order_by,
            arf.order_by_num,
            arf.unidade, --,
            null;
    -- fim jgs20150313


end;
--
--
procedure Q_Consumiveis is
begin

    insert into bgo_tabe_auxi_pers (col_1_c,col_1_n,  -- chave
           col_2_n,     -- afo.oba_id oba_id_Detail,
           col_3_n,     -- afo.oba_id_prov oba_id_prov
           col_2_c,     -- to_char(aro.codigo)...
           col_3_c,     -- une.codigo...
           col_4_n,     -- afo.order_by_num order_by_num,
           col_5_n,     -- afo.quantidade quantidade,
           col_6_n      -- afo.tempo,
           )
    select 'NOVOS_REPORTS_FAZ0080R_CONSUMI', vg_taxp_id,
          vfo.oba_id_referente oba_id_consumiveis,
          vfo.oba_id_proveniente oba_id_prov_cons,
          to_char(aro.codigo) || ' - ' || aro.descricao aro_consumido,
          une.codigo  une_consumiveis,
          decode (ene.nome_abreviado, pmo.valor_bg , aro.preco_venda, aro.preco_venda_outros) preco_unit_consumiveis,
          decode (ene.nome_abreviado, pmo.valor_bg , aro.preco_venda_eur, aro.preco_venda_outros_eur) preco_unit__eur_consumiveis,
          sum(vfo.quantidade) qtd_consumiveis
    from   bgo_obras oba,
           bgo_valores_facturacao vfo,
           bgo_indices_geracao_custos igc,
           bgo_artigos aro,
           bgo_unidades une,
           bgo_entidades ene,
           bgo_parametros pmo
    where  vfo.oba_id_referente = oba.id
    AND    vfo.oba_id_referente = vg_QMC_oba_id   /*MASTER-DETAIL*/
    and	   vfo.tipo_movimento = 'G'
    and	   igc.id = vfo.igc_id
    and            vfo.flg_tip_ger = vg_p_flg_tip_ger   -- JGS20110913
    and             igc.estado = 'A'
    and	   ene.id(+) = oba.ene_id_dest
    and	   aro.id = vfo.aro_id
    and           aro.empresa = 'P'
    and	   une.id(+) = aro.une_id
    and	   pmo.descricao = 'entidade_porto_editora'
    group by     vfo.oba_id_referente ,vfo.oba_id_proveniente,
          to_char(aro.codigo) || ' - ' || aro.descricao ,
           une.codigo  ,
           decode (ene.nome_abreviado, pmo.valor_bg , aro.preco_venda, aro.preco_venda_outros) ,
           decode (ene.nome_abreviado, pmo.valor_bg , aro.preco_venda_eur, aro.preco_venda_outros_eur);

end;
--
--
procedure Q_Detail is
begin

    insert into bgo_tabe_auxi_pers (col_1_c,col_1_n,  -- chave
           col_2_n,     -- afo.oba_id oba_id_Detail,
           col_3_n,     -- afo.oba_id_prov oba_id_prov
           col_2_c,     -- afo.descricao descricao_Detail,
           col_3_c,     -- afo.tipo_movimento_aux tipo_mov_aux,
           col_4_c,     -- afo.order_by order_by_detail,
           col_4_n,     -- afo.order_by_num order_by_num,
           col_5_n,     -- afo.quantidade quantidade,
           col_5_c,     -- afo.unidade unidade,
           col_6_n,     -- afo.tempo,
           col_7_c,     -- Valor_Detail, -- não existindo 8_n, coloco este em c,tté podia ser null...
           col_7_n,     -- Valor_eur_Detail,
           col_6_c      -- null dummy
           )
    select 'NOVOS_REPORTS_FAZ0080R_QDETAIL', vg_taxp_id,
           afo.oba_id oba_id_Detail,
           afo.oba_id_prov oba_id_prov,
           afo.descricao descricao_Detail,
           afo.tipo_movimento_aux tipo_mov_aux,
           afo.order_by order_by_detail,
           afo.order_by_num order_by_num,
           afo.quantidade quantidade,
           afo.unidade unidade,
           afo.tempo,
           afo.valor Valor_Detail,
	       DECODE(vg_P_ALTERA_50_2A,'N',decode(afo.tipo_movimento_aux,'7B',afo.valor_eur/vg_P_DUPLI,afo.valor_eur),DECODE(afo.tipo_movimento_aux,'2A',UC$FACTURAS_OBRAS.reto_valo_2A_5O(afo.oba_id),(DECODE(afo.tipo_movimento_aux,'5O',UC$FACTURAS_OBRAS.reto_valo_2A_5O(afo.oba_id),decode(afo.tipo_movimento_aux,'7B',afo.valor_eur/vg_P_DUPLI,afo.valor_eur))))) Valor_eur_Detail,    -- jgs20170202 + p_dupli
           null dummy
    from         bgo_analise_facturacao_v afo
    where          afo.flg_tip_ger = vg_p_flg_tip_ger
    AND    afo.oba_id = vg_QMC_oba_id   /*MASTER-DETAIL*/
    and             (nvl(vg_p_custos_adicionais,'N') != 'S' or afo.tipo_movimento_aux  != '7B'  )    -- JGS20160506
    and            afo.tipo_movimento_aux  != '6D'    -- JGS20150416: ramaral, entregue em mão
    -- jgs20141030
    union all
    select  'NOVOS_REPORTS_FAZ0080R_QDETAIL', vg_taxp_id,
            arf.oba_id oba_id_detail,
            arf.oba_id_prov oba_id_prov,
            arf.descricao descricao_detail,
            arf.tipo_mov_aux tipo_mov_aux,
            arf.order_by order_by_detail,
            arf.order_by_num order_by_num,
            sum(arf.quantidade) quantidade,
            arf.unidade unidade,
            sum(arf.tempo) tempo,
            sum(arf.valor) valor_detail,
            sum(arf.valor_eur) valor_eur_detail,
            null dummy
    from    bgo_auxi_repo_fatu arf
    where   arf.seq_id = vg_p_ses_id
    and       tip_reg      = 'BG'
    AND    arf.oba_id = vg_QMC_oba_id   /*MASTER-DETAIL*/
    and       c1 is null
    group   by
            arf.oba_id,
            arf.oba_id_prov,
            arf.descricao,
            arf.tipo_mov_aux,
            arf.order_by,
            arf.order_by_num,
            arf.unidade, --,
            null
    -- fim jgs20141030
    ----------------------------------
    union	-- Ivo Oliveira 24/05/2006	Valores Indicativos
    ----------------------------------
    select 'NOVOS_REPORTS_FAZ0080R_QDETAIL', vg_taxp_id,
           val_ind.oba_id_ref oba_id_detail,
           to_number(null) oba_id_prov,
           nvl(too.descricao_output,'Acabamento') descricao_detail,
           '7C' tipo_mov_aux,
           null order_by_detail,
           to_number(null) order_by_num,
           to_number(null) quantidade,
           null unidade,
           to_number(null) tempo,
           to_number(null) valor_detail,
           val_ind.val valor_eur_detail,
           null dummy
    from   bgo_valo_fact_indi val_ind
    ,            bgo_indices_geracao_custos igc
    ,            bgo_obras oba
    ,            bgo_tipos_acabamento too
    where  val_ind.tip_mov = 'B'
    AND    val_ind.oba_id_ref = vg_QMC_oba_id   /*MASTER-DETAIL*/
    and     igc.id=val_ind.igc_id
    and    igc.id=nvl(vg_p_igc_id,igc.id)  -- JGS20110913
    and     igc.estado='A'
    and     oba.id=val_ind.oba_id_ref
    and     nvl(vg_p_custos_adicionais,'N') != 'S'    -- JGS20160506
    and     oba.too_id=too.id(+);

end;
--
--
procedure Q_Requisicoes is
begin
    null;
end;
--
--
procedure Q_Primeira_Entrega is
begin
    null;
end;
--
--
procedure Q2_OBA_ID_SUO is
begin
    insert into bgo_tabe_auxi_pers (col_1_c,col_1_n,  -- chave
           col_2_c,     -- null ordenacao1,        char
           col_2_n,     -- cco.ord ordenacao_num3, num
           col_3_n,     -- oda.oba_id oba_id_suo3,
           col_3_c,     -- opo.des_orc descricao3,
           col_4_c,     -- ene.nome_abreviado nome_abreviado3,
           col_4_n,      -- decode(opo.sinal_operacao,'-',-1,1)*suo.pre_ven suo_valor3,
           col_5_n      -- ordem_disc
           )
    select 'NOVOS_REPORTS_FAZ0080R_Q2', vg_taxp_id,
           null ordenacao,
           cco.ord ordenacao_num,
           oda.oba_id oba_id_suo,
           opo.des_orc  descricao, -- OPO.DESCRICAO,
           ene.nome_abreviado,
           decode(opo.sinal_operacao,'-',-1,1)*suo.pre_ven suo_valor,
           decode(ono.flg_dis,'N',0,1) ordem_disc   /*jgs20201203 Ticket#2020112310007463 */
    from   bgo_subcontratacoes suo,
           bgo_operacoes_processadas oda,
           bgo_operacoes_anuais ono,
           bgo_centros_custos cco,
           bgo_entidades ene,
           bgo_operacoes opo
    where  opo.id=ono.opo_id
    AND    oda.oba_id = vg_QMC_oba_id   /*MASTER-DETAIL*/
    and    suo.oda_id=oda.id
    and    oda.ono_id=ono.id
    and    ono.cco_id=cco.id
    and    ene.id=suo.ene_id_produtor
    and    oda.igc_id in (select distinct
                                 igc.id
                          from   bgo_valores_facturacao vfo,
                                 bgo_indices_geracao_custos igc
                          where  vfo.oba_id_referente=oda.oba_id
                          and    oda.igc_id=igc.id
                          and    vfo.oba_id_referente=vg_QMC_oba_id
                          and    vfo.igc_id=igc.id
                          and    vfo.igc_id=nvl(vg_p_igc_id,vfo.igc_id)  -- JGS20110913
                          and    igc.estado='A')
    and    oda.oba_id=vg_QMC_oba_id
    and    considerar='S'
    -- jgs20150129: eliminar registos de obras custo fixo e percentagem = 0 na recetora
    and   not exists
        (
        select 1
        from   bgo_classes_centros_custos ccc,
               bgo_centros_custos         cco
        where  cco.id = ono.cco_id
        and    ccc.id = cco.ccc_id
        and    ccc.custo_fixo = 'S'
        and    exists (select 1 from bgo_associacoes_obras aoa2 where aoa2.oba_id_associada =oda.oba_id and aoa2.oba_id_receptora = vg_QMC_oba_id and aoa2.per_cus_fix = 0 /*jgs20150331*/ and vg_p_flg_tip_ger != 'A' )
        )
    -- FIM jgs20150129
    union all

    select 'NOVOS_REPORTS_FAZ0080R_Q2', vg_taxp_id,
           oba.titulo_abreviado ordenacao,
           cco.ord ordenacao_num,
            /*  jgs20150505 to_number(null) ordenacao_num,   */
            aoa.oba_id_receptora oba_id_suo,
            opo.des_orc  descricao,  /* jgs20191008 opo.descricao descricao, */
            ene.nome_abreviado,
            -- jgs20100226 decode(opo.sinal_operacao,'-',-1,1)*(SUO.VALOR_EUR*AOA.PERCENTAGEM_CUSTOS/100) SUO_VALOR
            decode(opo.sinal_operacao,'-',-1,1)*(suo.pre_ven*uc$facturas_obras.cust_aoa_cco (aoa.id,ono.cco_id)/100) suo_valor,     -- jgs20110915 decode(opo.sinal_operacao,'-',-1,1)*(SUO.pre_ven*AOA.PERCENTAGEM_CUSTOS/100) SUO_VALOR
           decode(ono.flg_dis,'N',0,1) ordem_disc   /*jgs20201203 Ticket#2020112310007463 */
    from    bgo_subcontratacoes suo,
            bgo_operacoes_processadas oda,
            bgo_operacoes_anuais ono,
            bgo_associacoes_obras aoa,
            bgo_obras oba,
            bgo_associacoes_partes ape,
            bgo_entidades ene,
           bgo_centros_custos cco,   /*jgs20150505 para ordenar*/
            bgo_operacoes opo
    where   opo.id=ono.opo_id
    AND    oda.oba_id = vg_QMC_oba_id   /*MASTER-DETAIL*/
    and     suo.oda_id=oda.id
    and     oda.ono_id=ono.id
    and     ene.id=suo.ene_id_produtor
    and    ono.cco_id=cco.id     /*jgs20150505*/
    and     aoa.oba_id_associada=oda.oba_id
    and     oba.id=aoa.oba_id_associada
    and     aoa.oba_id_receptora=vg_QMC_oba_id
    and     ape.pre_id_associada=oda.pre_id
    and     ape.pre_id_receptora in (select id from bgo_partes where oba_id=aoa.oba_id_receptora)
    and     (suo.pre_ven*uc$facturas_obras.cust_aoa_cco (aoa.id,ono.cco_id)/100) != 0
    and     aoa.id=(select max(id)
                    from   bgo_associacoes_obras
                    where  oba_id_associada=aoa.oba_id_associada
                    and    oba_id_receptora=aoa.oba_id_receptora)
    and     oda.igc_id in (select igc_id_proveniente
                           from   bgo_valores_facturacao vfo,
                                  bgo_indices_geracao_custos igc
                           where  vfo.oba_id_proveniente=aoa.oba_id_associada
                           and    vfo.igc_id=igc.id
                           and    igc.estado='A'
                           and    vfo.oba_id_referente=aoa.oba_id_receptora
                           and    vfo.tipo_movimento != 'G'
                           and    ((vg_p_flg_tip_ger = 'R' and vg_p_tipo_obra = 'AR' and vfo.flg_tip_ger = 'R') or vfo.oba_id_referente <> vfo.oba_id_proveniente)
                           and    vfo.oba_id_referente=vg_QMC_oba_id
                           and    oda.igc_id=vfo.igc_id_proveniente
                           and    rownum=1)
    and     considerar='S'    -- jgs20150129: eliminar registos de obras custo fixo e percentagem = 0 na recetora
    and   not exists
        (
        select 1
        from   bgo_classes_centros_custos ccc,
               bgo_centros_custos         cco
        where  cco.id = ono.cco_id
        and    ccc.id = cco.ccc_id
        and    ccc.custo_fixo = 'S'
        and    exists (select 1 from bgo_associacoes_obras aoa2 where aoa2.oba_id_associada = aoa.oba_id_associada and aoa2.oba_id_receptora = aoa.oba_id_receptora /* jgs20150505 aoa.OBA_ID_ASSOCIADA */ and aoa2.per_cus_fix = 0 /*jgs20150331*/ and vg_p_flg_tip_ger != 'A' )
        )
    -- FIM jgs20150129
    union all   -- jgs20141118, entidade de acabamento externas

    select 'NOVOS_REPORTS_FAZ0080R_Q2', vg_taxp_id,
           null ordenacao,
           98              ordenacao_num,
           vg_p_oba_id  oba_id_suo,
           descricao,
           c1 nome_abreviado,
           valor_eur*vg_p_tiragem suo_valor,
           0 ordem_disc
    from  bgo_auxi_repo_fatu
    where seq_id = vg_p_ses_id_ext

    union all   -- jgs20141119, registos de subcontratação

    select 'NOVOS_REPORTS_FAZ0080R_Q2', vg_taxp_id,
           null ordenacao,
           99              ordenacao_num,
           vg_p_oba_id  oba_id_suo,
           descricao,
           c1 nome_abreviado,
           valor_eur suo_valor,
           0 ordem_disc
    from  bgo_auxi_repo_fatu
    where seq_id = vg_p_ses_id_subc_encad
    and   nvl(vg_p_custos_adicionais,'N') != 'S';  -- JGS20200113: para acabamento, vg_p_custos_adicionais tem que estar desmarcado (=N) Se custos adicionais, não considera acabementoend;
end;
--
--
procedure Q3_OBA_ID_SUO3 is
begin
    insert into bgo_tabe_auxi_pers (col_1_c,col_1_n,  -- chave
           col_2_c,     -- null ordenacao1,        char
           col_2_n,     -- cco.ord ordenacao_num3, num
           col_3_n,     -- oda.oba_id oba_id_suo3,
           col_3_c,     -- opo.des_orc descricao3,
           col_4_c,     -- ene.nome_abreviado nome_abreviado3,
           col_4_n     -- decode(opo.sinal_operacao,'-',-1,1)*suo.pre_ven suo_valor3,
           )
    select 'NOVOS_REPORTS_FAZ0080R_Q3', vg_taxp_id,
           null ordenacao1,
           cco.ord ordenacao_num3,
           oda.oba_id oba_id_suo3,
           opo.des_orc descricao3,     --OPO.DESCRICAO descricao3,
           ene.nome_abreviado nome_abreviado3,
           decode(opo.sinal_operacao,'-',-1,1)*suo.pre_ven suo_valor3
    from   bgo_subcontratacoes suo,
           bgo_operacoes_processadas oda,
           bgo_operacoes_anuais ono,
           bgo_centros_custos cco,
           bgo_entidades ene,
           bgo_operacoes opo
    where  opo.id=ono.opo_id
    AND    oda.oba_id = vg_QMC_oba_id   /*MASTER-DETAIL*/
    and    suo.oda_id=oda.id
    and    oda.ono_id=ono.id
    and    ono.cco_id=cco.id
    and    oda.oba_id=vg_QMC_oba_id
    and    (vg_p_modo = 'FAT0081R' /*JGS20221130 pasa tudo*/ or (vg_p_modo != 'FAT0081R' and /*JGS20221130 tem que validar*/    (vg_p_tipo_obra != 'AR' or (vg_p_tipo_obra = 'AR' and vg_p_flg_tip_ger = 'R' and exists (select 1 from bgo_associacoes_obras where oba_id_associada = vg_QMC_oba_id and oba_id_receptora = vg_QMC_oba_id and per_cus_fix > 0 )) ) ))
    and    ene.id=suo.ene_id_produtor
    and    ((oda.igc_id in (select igc.id
                          from   bgo_valores_facturacao vfo,
                                 bgo_indices_geracao_custos igc
                          where  vfo.oba_id_referente=oda.oba_id
                          and    oda.igc_id=igc.id
                          and    rownum=1
                          and    vfo.igc_id=igc.id
                          and    vfo.igc_id=nvl(vg_p_igc_id,vfo.igc_id)  -- JGS20110913
                          and    igc.estado='A'
                          and    vfo.oba_id_referente=vg_QMC_oba_id)
                )
              or
              (
                    oda.igc_id is not null
                and oda.subcontratacao = 'S'
                and exists (select 1 from bgo_indices_geracao_custos igc where igc.estado='A' and oda.igc_id=igc.id )
              )
             )
    and    considerar<>'S'
    and    considerar is not null
    and    uc$producao.aced_obra(ono.id,'OF')='N'
    and    suo.pre_ven != 0 -- JGS20200724
    union all
    select 'NOVOS_REPORTS_FAZ0080R_Q3', vg_taxp_id,
           oba.titulo_abreviado ordenacao,
           to_number(null) ordenacao_num,
           aoa.oba_id_receptora oba_id_suo,
           opo.des_orc descricao,    /* jgs20191008 opo.descricao */
           ene.nome_abreviado,
           -- jgs20100226 decode(opo.sinal_operacao,'-',-1,1)*(SUO.VALOR_EUR*AOA.PERCENTAGEM_CUSTOS/100) SUO_VALOR
           decode(opo.sinal_operacao,'-',-1,1)*(suo.pre_ven*uc$facturas_obras.cust_aoa_cco (aoa.id,ono.cco_id)/100) suo_valor -- jgs20110915 decode(opo.sinal_operacao,'-',-1,1)*(SUO.pre_ven*AOA.PERCENTAGEM_CUSTOS/100) SUO_VALOR
    from   bgo_subcontratacoes suo,
           bgo_operacoes_processadas oda,
           bgo_operacoes_anuais ono,
           bgo_associacoes_obras aoa,
           bgo_obras oba,
           bgo_associacoes_partes ape,
           bgo_entidades ene,
           bgo_operacoes opo
    where  opo.id=ono.opo_id
    AND    oda.oba_id = vg_QMC_oba_id   /*MASTER-DETAIL*/
    and    suo.oda_id=oda.id
    and    oda.ono_id=ono.id
    and    ene.id=suo.ene_id_produtor
    and    aoa.oba_id_associada=oda.oba_id
    and    aoa.oba_id_receptora=vg_QMC_oba_id -- IVO OLIVEIRA 25/07/2003
    and    oba.id=aoa.oba_id_associada
    and    ape.pre_id_associada=oda.pre_id
    and    ape.pre_id_receptora in (select id from bgo_partes where oba_id=aoa.oba_id_receptora)
    and    aoa.id=(select max(id)
                   from   bgo_associacoes_obras
                   where  oba_id_associada=aoa.oba_id_associada
                   and    oba_id_receptora=aoa.oba_id_receptora)
    and    oda.igc_id in (select distinct
                                 igc_id_proveniente
                          from   bgo_valores_facturacao vfo,
                                 bgo_indices_geracao_custos igc
                          where  vfo.oba_id_proveniente=aoa.oba_id_associada
                          and    vfo.igc_id=igc.id
                          and    vfo.igc_id=nvl(vg_p_igc_id,vfo.igc_id)  -- JGS20110913
                          and    igc.estado='A'
                          and    vfo.oba_id_referente=aoa.oba_id_receptora
                          and    vfo.tipo_movimento != 'G'
                          and    (vg_p_modo = 'FAT0081R' /*JGS20221130 pasa tudo*/ or (vg_p_modo != 'FAT0081R' and /*JGS20221130 tem que validar*/    ((vg_p_flg_tip_ger = 'R' and vg_p_tipo_obra = 'AR') or vfo.oba_id_referente <> vfo.oba_id_proveniente) ))
                          and    oda.igc_id=vfo.igc_id_proveniente
                          and    vfo.oba_id_referente=vg_QMC_oba_id)
    and    considerar<>'S'
    and    considerar is not null
    and    uc$producao.aced_obra(ono.id,'OF')='N'
    and    suo.pre_ven != 0 -- JGS20200724
    -- jgs20150313
    union all
    select 'NOVOS_REPORTS_FAZ0080R_Q3', vg_taxp_id,
           null ordenacao3,
           cco.ord ordenacao_num2,
           oda.oba_id oba_id_suo2,
           opo.des_orc descricao2,                  /*jgs20191008 OPO.DESCRICAO */
           ene.nome_abreviado nome_abreviado2,
           decode(opo.sinal_operacao,'-',-1,1)*suo.pre_ven suo_valor2
    from   bgo_subcontratacoes suo,
           bgo_operacoes_processadas oda,
           bgo_operacoes_anuais ono,
           bgo_centros_custos cco,
           bgo_entidades ene,
           bgo_operacoes opo,
           cg_ref_codes cg
    where  opo.id=ono.opo_id
    AND    oda.oba_id = vg_QMC_oba_id   /*MASTER-DETAIL*/
    and    cg.rv_domain='EMPRESA_SUBCONTRATACAO'
    and    cg.rv_low_value=suo.emp_fac
    and    suo.emp_fac = 'P'
    and    suo.oda_id=oda.id
    and    oda.ono_id=ono.id
    and    ono.cco_id=cco.id
    and    ene.id=suo.ene_id_produtor
    and    oda.igc_id in (select distinct
                                 igc.id
                          from   bgo_valores_facturacao vfo,
                                 bgo_indices_geracao_custos igc
                          where  vfo.oba_id_referente=oda.oba_id
                          and    oda.igc_id=igc.id
                          and    vfo.igc_id=igc.id
                          and    vfo.igc_id=nvl(vg_p_igc_id,vfo.igc_id)  -- JGS20110913
                          and    vfo.oba_id_referente=vg_p_oba_id
                          and    igc.estado='A')
    and    considerar='N'
    and    oda.oba_id=vg_p_oba_id
    and    uc$producao.aced_obra(ono.id,'OF')='S'
    and    suo.pre_ven != 0 -- JGS20200724
    union all
    select 'NOVOS_REPORTS_FAZ0080R_Q3', vg_taxp_id,
           oba.titulo_abreviado ordenacao,
           cco.ord ordenacao_num2,
           aoa.oba_id_receptora oba_id_suo,
           opo.des_orc   descricao2,                 /* jgs20191008 OPO.descricao */
           ene.nome_abreviado,
           decode(opo.sinal_operacao,'-',-1,1)*(suo.pre_ven*uc$facturas_obras.cust_aoa_cco (aoa.id,ono.cco_id)/100) suo_valor
    from   bgo_subcontratacoes suo,
           bgo_operacoes_processadas oda,
           bgo_operacoes_anuais ono,
           bgo_associacoes_obras aoa,
           bgo_obras oba,
           bgo_associacoes_partes ape,
           bgo_entidades ene,
           bgo_operacoes opo,
           bgo_centros_custos cco,
           cg_ref_codes cg
    where  opo.id=ono.opo_id
    AND    oda.oba_id = vg_QMC_oba_id   /*MASTER-DETAIL*/
    and    cg.rv_domain='EMPRESA_SUBCONTRATACAO'
    and    cg.rv_low_value=suo.emp_fac
    and    suo.emp_fac = 'P'
    and    suo.oda_id=oda.id
    and    oda.ono_id=ono.id
    and    ono.cco_id=cco.id
    and    ene.id=suo.ene_id_produtor
    and    aoa.oba_id_associada=oda.oba_id
    and    oba.id=aoa.oba_id_associada
    and    aoa.oba_id_receptora=vg_p_oba_id
    and    ape.pre_id_associada=oda.pre_id
    and    ape.pre_id_receptora in (select id from bgo_partes where oba_id=aoa.oba_id_receptora)
    and     (suo.pre_ven*uc$facturas_obras.cust_aoa_cco (aoa.id,ono.cco_id)/100) != 0
    and    aoa.id=(select max(id)
                   from   bgo_associacoes_obras
                   where  oba_id_associada=aoa.oba_id_associada
                   and    oba_id_receptora=aoa.oba_id_receptora)
    and    oda.igc_id in (select distinct
                                 igc_id_proveniente
                          from   bgo_valores_facturacao vfo,
                                 bgo_indices_geracao_custos igc
                          where  vfo.oba_id_proveniente=aoa.oba_id_associada
                          and    vfo.igc_id=igc.id
                          and    vfo.igc_id=nvl(vg_p_igc_id,vfo.igc_id)  -- JGS20110913
                          and    igc.estado='A'
                          and    vfo.oba_id_referente=aoa.oba_id_receptora
                          and    vfo.tipo_movimento != 'G'
                          and    (vg_p_modo = 'FAT0081R' /*JGS20221130 pasa tudo*/ or (vg_p_modo != 'FAT0081R' and /*JGS20221130 tem que validar*/        ((vg_p_flg_tip_ger = 'R' and vg_p_tipo_obra = 'AR') or vfo.oba_id_referente <> vfo.oba_id_proveniente) ))
                          and    vfo.oba_id_referente=vg_p_oba_id
                          and    oda.igc_id=vfo.igc_id_proveniente)
    and    considerar='N'
    and    uc$producao.aced_obra(ono.id,'OF')='S'
    and    suo.pre_ven != 0; -- JGS20200724
end;


procedure Q4_OBA_ID_SUO2 is
begin

    insert into bgo_tabe_auxi_pers (col_1_c,col_1_n,  -- chave
           col_2_c,     -- null ordenacao3,        char
           col_2_n,     -- cco.ord ordenacao_num2, num
           col_3_n,     -- oda.oba_id oba_id_suo2,
           col_3_c,     -- opo.des_orc descricao2, --OPO.DESCRICAO descricao2,
           col_4_c,     -- ene.nome_abreviado nome_abreviado2,
           col_4_n,     -- decode(opo.sinal_operacao,'-',-1,1)*suo.pre_ven suo_valor2,
           col_5_c      -- cg.rv_abbreviation emp
           )
    select 'NOVOS_REPORTS_FAZ0080R_Q4', vg_taxp_id,
           null ordenacao3,
           cco.ord ordenacao_num2,
           oda.oba_id oba_id_suo2,
           opo.des_orc descricao2,     --OPO.DESCRICAO descricao2,
           ene.nome_abreviado nome_abreviado2,
           -- jgs20100226 decode(opo.sinal_operacao,'-',-1,1)*SUO.VALOR_EUR SUO_VALOR2,
           decode(opo.sinal_operacao,'-',-1,1)*suo.pre_ven suo_valor2,
           cg.rv_abbreviation emp
    from   bgo_subcontratacoes suo,
           bgo_operacoes_processadas oda,
           bgo_operacoes_anuais ono,
           bgo_centros_custos cco,
           bgo_entidades ene,
           bgo_operacoes opo,
           cg_ref_codes cg
    where  opo.id=ono.opo_id
    AND    oda.oba_id = vg_QMC_oba_id   /*MASTER-DETAIL*/
    and    cg.rv_domain='EMPRESA_SUBCONTRATACAO'
    and    cg.rv_low_value=suo.emp_fac
    and    suo.oda_id=oda.id
    and    oda.ono_id=ono.id
    and    ono.cco_id=cco.id
    and    ene.id=suo.ene_id_produtor
    and    oda.igc_id in (select distinct
                                 igc.id
                          from   bgo_valores_facturacao vfo,
                                 bgo_indices_geracao_custos igc
                          where  vfo.oba_id_referente=oda.oba_id
                          and    oda.igc_id=igc.id
                          and    vfo.igc_id=igc.id
                          and    vfo.igc_id=nvl(vg_p_igc_id,vfo.igc_id)  -- JGS20110913
                          and    vfo.oba_id_referente=vg_QMC_oba_id
                          and    igc.estado='A')
    and    considerar='N'
    and    oda.oba_id=vg_QMC_oba_id
    and    uc$producao.aced_obra(ono.id,'OF')='S'
    -- JGS20150313
    and    oda.id not in (select oda_id from bgo_auxi_repo_fatu where seq_id = vg_p_ses_id_cus_pe and oda_id is not null)
    -- FIM JGS20150313
    and    cg.rv_abbreviation   != 'BG'     -- jgs20150827: Ticket#2015072410000708 - Analisar inclusão indevida de reg. ID = 7682665 em Res Det Custos obra 20143456
    union all
    select 'NOVOS_REPORTS_FAZ0080R_Q4', vg_taxp_id,
           oba.titulo_abreviado ordenacao,
           to_number(null) ordenacao_num,
           aoa.oba_id_receptora oba_id_suo,
           opo.des_orc,      /*jgs20191008 opo.descricao descricao,*/
           ene.nome_abreviado,
           --decode(opo.sinal_operacao,'-',-1,1)*(SUO.VALOR_EUR*AOA.PERCENTAGEM_CUSTOS/100) SUO_VALOR,
           decode(opo.sinal_operacao,'-',-1,1)*(suo.pre_ven*uc$facturas_obras.cust_aoa_cco (aoa.id,ono.cco_id)/100) suo_valor, -- jgs20110915 decode(opo.sinal_operacao,'-',-1,1)*(SUO.pre_ven*AOA.PERCENTAGEM_CUSTOS/100) SUO_VALOR,
           cg.rv_abbreviation emp
    from   bgo_subcontratacoes suo,
           bgo_operacoes_processadas oda,
           bgo_operacoes_anuais ono,
           bgo_associacoes_obras aoa,
           bgo_obras oba,
           bgo_associacoes_partes ape,
           bgo_entidades ene,
           bgo_operacoes opo,
           cg_ref_codes cg
    where  opo.id=ono.opo_id
    and    cg.rv_domain='EMPRESA_SUBCONTRATACAO'
    and    cg.rv_low_value=suo.emp_fac
    and    suo.oda_id=oda.id
    and    oda.ono_id=ono.id
    and    ene.id=suo.ene_id_produtor
    and    aoa.oba_id_associada=oda.oba_id
    and    oba.id=aoa.oba_id_associada
    and    aoa.oba_id_receptora=vg_QMC_oba_id
    and    ape.pre_id_associada=oda.pre_id
    and    ape.pre_id_receptora in (select id from bgo_partes where oba_id=aoa.oba_id_receptora)
    and     (suo.pre_ven*uc$facturas_obras.cust_aoa_cco (aoa.id,ono.cco_id)/100) != 0
    and    aoa.id=(select max(id)
                   from   bgo_associacoes_obras
                   where  oba_id_associada=aoa.oba_id_associada
                   and    oba_id_receptora=aoa.oba_id_receptora)
    and    oda.igc_id in (select distinct
                                 igc_id_proveniente
                          from   bgo_valores_facturacao vfo,
                                 bgo_indices_geracao_custos igc
                          where  vfo.oba_id_proveniente=aoa.oba_id_associada
                          and    vfo.igc_id=igc.id
                          and    vfo.igc_id=nvl(vg_p_igc_id,vfo.igc_id)  -- JGS20110913
                          and    igc.estado='A'
                          and    vfo.oba_id_referente=aoa.oba_id_receptora
                          and    vfo.tipo_movimento != 'G'
                          and    ((vg_p_flg_tip_ger = 'R' and vg_p_tipo_obra = 'AR') or vfo.oba_id_referente <> vfo.oba_id_proveniente)
                          and    vfo.oba_id_referente=vg_QMC_oba_id
                          and    oda.igc_id=vfo.igc_id_proveniente)
    and    considerar='N'
    and    uc$producao.aced_obra(ono.id,'OF')='S'
    and    cg.rv_abbreviation   != 'BG'     -- jgs20150827: Ticket#2015072410000708 - Analisar inclusão indevida de reg. ID = 7682665 em Res Det Custos obra 20143456
       -- jgs20150313
       and oda.id not in (select oda_id from bgo_auxi_repo_fatu where seq_id = vg_p_ses_id_cus_pe and oda_id is not null);
       -- fim jgs20150313
    -- isto vai ser no report!!! order by 4; -- 2; -- jgs20150327
end;
--
--
procedure Q_master_cabecalho is
begin
    SELECT oba.id oba_id,
           oba.chave_principal chave_principal,
           oba.titulo_completo  titulo,
           UC$SGP_PLAN_OPER.OBTE_OBA_NUME_CODI_MASC_02 (oba.numero_codigo,oba.add_on) numero_codigo,
           ene_autor.nome_abreviado autor,
           oba.numero_folhas numero_folhas,
           oba.numero_folhas*16 numero_paginas,
           oba.tiragem tiragem,
           oba.tiragem_total tiragem_total,
           oba.tiragem_edicao tiragem_edicao,
           oba.cores_texto cores_texto,
           oba.cores_capa cores_capa,
                       oba.OBS_RESUMO_CUSTOS observacoes,
                       ene_cliente.nome_abreviado     cliente,
                        oba.cores_frente,
                       oba.cores_retiracao,
                       oba.cor_fre_com,
                       oba.cor_ret_com,
                        oba.num_fol_com
    INTO
         vg_QMC_oba_id,
         vg_QMC_chave_principal,
         vg_QMC_titulo,
         vg_QMC_numero_codigo,
         vg_QMC_autor,
         vg_QMC_numero_folhas,
         vg_QMC_numero_paginas,
         vg_QMC_tiragem,
         vg_QMC_tiragem_total,
         vg_QMC_tiragem_edicao,
         vg_QMC_cores_texto,
         vg_QMC_cores_capa,
         vg_QMC_observacoes,
         vg_QMC_cliente,
         vg_QMC_cores_frente,
         vg_QMC_cores_retiracao,
         vg_QMC_cor_fre_com,
         vg_QMC_cor_ret_com,
         vg_QMC_num_fol_com
    FROM   BGO_OBRAS        oba,
           BGO_ENTIDADES    ene_autor,
           bgo_entidades    ene_cliente
    WHERE  oba.CHAVE_PRINCIPAL = vg_P_CHAVE_PRINCIPAL
    AND	   ene_autor.id(+) = oba.ene_id_criada_por
    and    ene_cliente.id(+) = oba.ene_id_dest;
end;
--
--
    procedure uc$actu_dados (p_val in number, p_campo in varchar2,p_origem in varchar2) is

        v_val       number;
        v_vpf_id		number;

        v_alt       varchar2(1000);

    begin

        -- jgs20220804: erros de atualização módulo resumo de custos.
        begin

                insert into bgo_tabe_auxi_pers (col_1_c,col_2_c,col_1_n,col_2_n,col_3_c,col_5_c)
                values('FAT0080R_UC$ACTU_DADOS',vg_p_gera_valo,vg_QMC_oba_id,p_val,p_campo,vg_p_user);

            exception when others then null;
            end;

        -- fim jgs20220804: erros de atualização módulo resumo de custos.



                v_val := p_val;
                v_alt := '['||to_char(sysdate,'yyyy-mm-dd hh24:mi:ss')||'] '||p_campo||' '||to_char(p_val)||' '||p_origem;

            select max(vpf.id)
            into   v_vpf_id
            from   bgo_vali_pre_fatu vpf
            where  vpf.oba_id = vg_QMC_oba_id
            and    (vpf.cur_id is null or (not exists (select 1 from bgo_cabecalhos_facturas where id = vpf.cur_id)));

            uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', 'F_15: v_vpf_id '||to_char(nvl(v_vpf_id,-1))||', '||p_campo||', '||to_char(nvl(p_val,-1)), null, null);

            if v_vpf_id is not null then

              -- jgs20150601   !!!!!! update bgo_vali_pre_fatu vpf set obs_aux = substr(obs_aux,1,3000);
              update bgo_vali_pre_fatu vpf set obs_aux = substr(obs_aux,1,3000) where id = v_vpf_id;
                reps_resu_cust_dao.alte_dado_nume_vpf(v_vpf_id,p_campo,v_val,v_alt);

            else

                -- jgs20220804: erros de atualização módulo resumo de custos.
                begin

                        insert into bgo_tabe_auxi_pers (col_1_c,col_2_c,col_1_n,col_2_n,col_3_c,col_4_c,col_5_c)
                        values('FAT0080R_UC$ACTU_DADOS',vg_p_gera_valo,vg_QMC_oba_id,p_val,p_campo,'v_vpf_id IS null!',vg_p_user);

                    exception when others then null;
                    end;

        -- fim jgs20220804: erros de atualização módulo resumo de custos.


            end if;



    exception when others then

        uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', 'F_15: erro: '||sqlerrm, null, null);

    end;
    -- fim jgs20140827 -- atualizar para validação de pré-faturas


--
--
    function CF_Existe_SubFormula return Char is
      dummy number(1);

        begin
         -- Ivo Oliveira 21/11/2002
         -- Esta função serve para verificar se há ou não registos de subcontratação, de forma
         -- a mostrar ou não o quadro de subcontratação

         begin
            select distinct 1
            into dummy
            from
            (select 1
             from bgo_subcontratacoes suo
             ,		 bgo_operacoes_processadas oda
             where suo.oda_id=oda.id
           and oda.igc_id in (select igc.id
                                              from bgo_valores_facturacao vfo
                                                ,		 bgo_indices_geracao_custos igc
                                                where vfo.oba_id_referente=oda.oba_id
                                                and	 vfo.igc_id=igc.id and  vfo.flg_tip_ger = vg_p_flg_tip_ger --   VFO.IGC_ID=NVL(:P_IGC_ID,VFO.IGC_ID)  -- JGS20110913
                                                and igc.estado='A'
                                                    and oda.igc_id=igc.id
                                                    and rownum=1)
             and considerar='S'
           and oda.oba_id=vg_QMC_oba_id
             union all
             select 1
             from bgo_subcontratacoes suo
             ,		 bgo_operacoes_processadas oda
             ,		 bgo_associacoes_obras aoa
             ,		 bgo_obras oba
             ,		 bgo_associacoes_partes ape
             ,     bgo_operacoes_anuais   ono    -- JGS20110920
             where suo.oda_id=oda.id
             and   oda.ono_id=ono.id
             and   (suo.pre_ven*uc$facturas_obras.cust_aoa_cco (aoa.id,ono.cco_id)/100) != 0  -- jgs20110920
             and aoa.oba_id_associada=oda.oba_id
             and oba.id=aoa.oba_id_associada
             and ape.pre_id_associada=oda.pre_id
             and ape.pre_id_receptora in (select id
                                                                      from bgo_partes
                                                                      where oba_id=aoa.oba_id_receptora)
             and aoa.id=(select max(id)
                                     from bgo_associacoes_obras
                                     where oba_id_associada=aoa.oba_id_associada
                                     and oba_id_receptora=aoa.oba_id_receptora)
             and oda.igc_id in (select igc_id_proveniente
                                                from bgo_valores_facturacao vfo
                                                ,	bgo_indices_geracao_custos igc
                                                where vfo.oba_id_proveniente=aoa.oba_id_associada
                                                and vfo.igc_id=igc.id and  vfo.flg_tip_ger = vg_p_flg_tip_ger --   VFO.IGC_ID=NVL(:P_IGC_ID,VFO.IGC_ID)  -- JGS20110913
                                                and igc.estado='A'
                                                and vfo.oba_id_referente=aoa.oba_id_receptora
                                                and vfo.tipo_movimento != 'G'
                                                and ((vg_p_flg_tip_ger = 'R' and vg_p_tipo_obra = 'AR') or vfo.oba_id_referente <> vfo.oba_id_proveniente)
                                                    and oda.igc_id=vfo.igc_id_proveniente
                                                    and rownum=1)
             and considerar='S'
             and aoa.oba_id_receptora=vg_QMC_oba_id);

           uc$logs_gera_log (null, 'FAO0080RZEROS', 'A PREENCHER', 'D', 'CF_EXISTE_SUB='||'S', null, null);

           return('S');
         exception when others then
           return('N');
         end;


    end CF_Existe_SubFormula;

--
--
    function CF_Existe_Sub_OutrFormula return Char is
      dummy number(1);
    begin
     -- Ivo Oliveira 21/11/2002
     -- Esta função serve para verificar se há ou não registos de subcontratação, de forma
     -- a mostrar ou não o quadro de subcontratação
     begin
        select distinct 1
        into dummy
        from
        (select 1
         from bgo_subcontratacoes suo
         ,		 bgo_operacoes_processadas oda
         where suo.oda_id=oda.id
       and    (vg_p_tipo_obra != 'AR' or (vg_p_tipo_obra = 'AR' and vg_p_flg_tip_ger = 'R' and exists (select 1 from bgo_associacoes_obras where oba_id_associada = vg_QMC_oba_id and oba_id_receptora = vg_QMC_oba_id and per_cus_fix > 0 )) ) -- jgs20111014
       and ((oda.igc_id in (select igc.id
                                          from bgo_valores_facturacao vfo
                                            ,		 bgo_indices_geracao_custos igc
                                            where vfo.oba_id_referente=oda.oba_id
                                            and	 vfo.igc_id=igc.id and   vfo.flg_tip_ger = vg_p_flg_tip_ger --  VFO.IGC_ID=NVL(:P_IGC_ID,VFO.IGC_ID)  -- JGS20110913
                                            and igc.estado='A'
                                                and oda.igc_id=igc.id
                                                and rownum=1)
              )
              or -- JGS20081024, se não foi gerado IGC, por não ter operações BG, não descartar registos de SUBCONTRATAÇÃO
              (
                    oda.igc_id is not null
                and oda.subcontratacao = 'S'
                and exists (select 1 from bgo_indices_geracao_custos igc where igc.estado='A' and oda.igc_id=igc.id )
              )
            )
         and considerar<>'S' and considerar is not null -- Ivo Oliveira 17/07/2003
       and uc$producao.aced_obra(oda.ono_id,'OF')='N'
       and oda.oba_id=vg_QMC_oba_id
         union all
         select 1
         from bgo_subcontratacoes suo
         ,		 bgo_operacoes_processadas oda
         ,		 bgo_associacoes_obras aoa
         ,		 bgo_obras oba
         ,		 bgo_associacoes_partes ape
         where suo.oda_id=oda.id
       and    (vg_p_tipo_obra != 'AR' or (vg_p_tipo_obra = 'AR' and vg_p_flg_tip_ger = 'R' and exists (select 1 from bgo_associacoes_obras where oba_id_associada = vg_QMC_oba_id and oba_id_receptora = vg_QMC_oba_id and per_cus_fix > 0 )) ) -- jgs20111014
         and aoa.oba_id_associada=oda.oba_id
         and oba.id=aoa.oba_id_associada
         and ape.pre_id_associada=oda.pre_id
         and ape.pre_id_receptora in (select id
                                                                  from bgo_partes
                                                                  where oba_id=vg_QMC_oba_id)       --opt-jgs20150824  WHERE OBA_ID=AOA.OBA_ID_RECEPTORA)
         and aoa.id=(select max(id)
                                 from bgo_associacoes_obras
                                 where oba_id_associada=aoa.oba_id_associada
                                 and oba_id_receptora=aoa.oba_id_receptora)
         and oda.igc_id in (select igc_id_proveniente
                                            from bgo_valores_facturacao vfo
                                            ,	bgo_indices_geracao_custos igc
                                            where vfo.oba_id_proveniente=aoa.oba_id_associada
                                            and vfo.igc_id=igc.id and   vfo.flg_tip_ger = vg_p_flg_tip_ger --   VFO.IGC_ID=NVL(:P_IGC_ID,VFO.IGC_ID)  -- JGS20110913
                                            and igc.estado='A'
                                            and vfo.oba_id_referente=aoa.oba_id_receptora
                                            and vfo.tipo_movimento != 'G'
                                            and ((vg_p_flg_tip_ger = 'R' and vg_p_tipo_obra = 'AR') or vfo.oba_id_referente <> vfo.oba_id_proveniente)
                                                and oda.igc_id=vfo.igc_id_proveniente
                                                and rownum=1)
         and considerar<>'S' and considerar is not null -- Ivo Oliveira 17/07/2003
         and uc$producao.aced_obra(oda.ono_id,'OF')='N'
         and aoa.oba_id_receptora=vg_QMC_oba_id);

       uc$logs_gera_log (null, 'FAO0080RZEROS', 'A PREENCHER', 'D', 'CF_EXISTE_SUB_OUTR='||'S', null, null);

         uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', 'Vou retornar S', null, null);

       return('S');
     exception when others then

         uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', 'Vou retornar N: erro = '||sqlerrm, null, null);

       return('N');
     end;


    end CF_Existe_Sub_OutrFormula;
--
--
    function cf_existe_sub_pe return varchar2 is   -- jgs20150313
        v_count	number;
    begin

    --JGS20150824
       if VG_p_opt_cus_pe > 0 then return 'S';
       else return 'N';
       end if;
    --FIM JGS20150824

    end cf_existe_sub_pe;--
--
    procedure M_G_Consumiveis_GRPFR3FormatTr is
      dummy number(1);
      -- vai ficar na pers, col_1_c = upper(M_G_Consumiveis_GRPFR3FormatTr) e col_1_n, o tal...
      v_ret varchar2(10);
    begin

     begin

        select distinct 1
        into dummy
        from
        (select 1
         from bgo_subcontratacoes suo
         ,		 bgo_operacoes_processadas oda
         where suo.oda_id=oda.id
       and oda.igc_id in (select igc.id
                                          from bgo_valores_facturacao vfo
                                            ,		 bgo_indices_geracao_custos igc
                                            where vfo.oba_id_referente=oda.oba_id
                                            and	 vfo.igc_id=igc.id and vfo.flg_tip_ger = vg_p_flg_tip_ger --  VFO.IGC_ID=NVL(:P_IGC_ID,VFO.IGC_ID)  /*JGS20110913*/
                                            and igc.estado='A'
                                                and oda.igc_id=igc.id
                                                and rownum=1)
         and considerar='N'
       and uc$producao.aced_obra(oda.ono_id,'OF')='S'
       and oda.oba_id=vg_QMC_oba_id
       -- jgs20150313
       and oda.id not in (select oda_id from bgo_auxi_repo_fatu where seq_id = vg_p_ses_id_cus_pe and oda_id is not null)
       -- fim jgs20150313
         union all
         select 1
         from bgo_subcontratacoes suo
         ,		 bgo_operacoes_processadas oda
         ,		 bgo_associacoes_obras aoa
         ,		 bgo_obras oba
         ,		 bgo_associacoes_partes ape
         ,     bgo_operacoes_anuais   ono   -- jgs20110920
         where suo.oda_id=oda.id
         and   oda.ono_id = ono.id
         and     (suo.pre_ven*uc$facturas_obras.cust_aoa_cco (aoa.id,ono.cco_id)/100) != 0    -- jgs20110920
         and aoa.oba_id_associada=oda.oba_id
         and oba.id=aoa.oba_id_associada
         and ape.pre_id_associada=oda.pre_id
         and ape.pre_id_receptora in (select id
                                                                  from bgo_partes
                                                                  where oba_id=vg_QMC_oba_id)         -- opt-jgs20150824 WHERE OBA_ID=AOA.OBA_ID_RECEPTORA)
         and aoa.id=(select max(id)
                                 from bgo_associacoes_obras
                                 where oba_id_associada=aoa.oba_id_associada
                                 and oba_id_receptora=aoa.oba_id_receptora)
         and oda.igc_id in (select igc_id_proveniente
                                            from bgo_valores_facturacao vfo
                                            ,	bgo_indices_geracao_custos igc
                                            where vfo.oba_id_proveniente=aoa.oba_id_associada
                                            and vfo.igc_id=igc.id  and vfo.flg_tip_ger = vg_p_flg_tip_ger --  VFO.IGC_ID=NVL(:P_IGC_ID,VFO.IGC_ID)  /*JGS20110913*/
                                            and igc.estado='A'
                                            and vfo.oba_id_referente=aoa.oba_id_receptora
                                            and vfo.tipo_movimento != 'G'
                                            and ((vg_p_flg_tip_ger = 'R' and vg_p_tipo_obra = 'AR') or vfo.oba_id_referente <> vfo.oba_id_proveniente)
                                                and oda.igc_id=vfo.igc_id_proveniente
                                                and rownum=1)
         and considerar='N'
         and uc$producao.aced_obra(oda.ono_id,'OF')='S'
         and aoa.oba_id_receptora=vg_QMC_oba_id
       -- jgs20150313
       and oda.id not in (select oda_id from bgo_auxi_repo_fatu where seq_id = vg_p_ses_id_cus_pe and oda_id is not null));
       -- fim jgs20150313

       -- jgs20230101return(true);
       v_ret := 'TRUE';

     exception when others then

       /* jgs20230101: não sendo chamado o prcedimento UC$CARREGA_AS no report, vg_p_opt_rg_3 está a null,
          isso significa que não é usado... Isto estava ativo no report, mas comento...
         -- JGS20150824
       if vg_p_opt_rg_3 > 0 then
       return(true);
       else
       return(false);
       end if;
         -- FIM ... JGS20150824
       */
       -- return(false);

       v_ret := 'FALSE';

     end;

     -- insert para ler no report! --
     insert into bgo_tabe_auxi_pers (col_1_c,col_1_n,col_2_c)
     values (upper('M_G_Consumiveis_GRPFR3FormatTr'), vg_taxp_id,v_ret);

    end M_G_Consumiveis_GRPFR3FormatTr;
--
--
    PROCEDURE F_CS_total1FormatTrigger is
        v_data_euro				bgo_parametros.valor_bg%type;
        v_total_1s				bgo_valores_facturacao.valor%type:=0;
        v_total_3x				bgo_valores_facturacao.valor%type:=0;
        v_total 					number (38,2):=0;

      v_count           number; -- jgs20150213
      v_valor           number; -- jgs20150213

    begin


      v_count := 1;
        declare
            v_vpf_id		number;
            v_val       number;
        begin


            select max(vpf.id)
            into   v_vpf_id
            from   bgo_vali_pre_fatu vpf
            where  vpf.oba_id = vg_QMC_oba_id
            and    (vpf.cur_id is null or (not exists (select 1 from bgo_cabecalhos_facturas where id = vpf.cur_id)));

            uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', 'F_cstotal1: v_vpf_id '||to_char(nvl(v_vpf_id,-1)), null, null);

            if v_vpf_id is not null then

                        select val_tot_edi_res_det_cus
                        into   v_val
                        from   bgo_vali_pre_fatu vpf
                        where  id = v_vpf_id;

                      if v_val = 0 then

                        v_count := 0;

                      end if;

            end if;


        exception when others then

        uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', 'ERRO AO ENCONTRAR REGISTO = '||sqlerrm , null, null);
        v_count := 1;

        end;

        if v_count = 0 then

           begin

                select sum(tab_id)
                into   v_valor
                from   bgo_auxi_perg_resp
                where  tab_nom = 'TOT_EDIT';


          exception when others then v_valor := 0;
          end;

          uc$actu_dados (v_valor,'VAL_TOT_EDI_RES_DET_CUS','FAO0080F.F_CS_total1');
      end if;

     insert into bgo_tabe_auxi_pers (col_1_c,col_1_n,col_2_c)
     values (upper('F_CS_total1FormatTrigger'), vg_taxp_id,'TRUE');

     --return (true);
    end F_CS_total1FormatTrigger;

--
--
    procedure M_G_Consumiveis_GRPFR4FormatTr is

       v_count		number;
       v_ret        varchar2(100);

    begin

      -- JGS20150129
      select count(1)
      into   v_count
      from (

                        select null ordenacao,
                               cco.ord ordenacao_num,
                               oda.oba_id oba_id_suo,
                               opo.descricao,
                               ene.nome_abreviado,
                               -- jgs20100226 decode(opo.sinal_operacao,'-',-1,1)*SUO.VALOR_EUR SUO_VALOR
                               decode(opo.sinal_operacao,'-',-1,1)*suo.pre_ven suo_valor
                        from   bgo_subcontratacoes suo,
                               bgo_operacoes_processadas oda,
                               bgo_operacoes_anuais ono,
                               bgo_centros_custos cco,
                               bgo_entidades ene,
                               bgo_operacoes opo
                        where  opo.id=ono.opo_id
                        and    suo.oda_id=oda.id
                        and    oda.ono_id=ono.id
                        and    ono.cco_id=cco.id
                        and    ene.id=suo.ene_id_produtor
                        and    oda.igc_id in (select distinct
                                                     igc.id
                                              from   bgo_valores_facturacao vfo,
                                                     bgo_indices_geracao_custos igc
                                              where  vfo.oba_id_referente=oda.oba_id
                                              and    oda.igc_id=igc.id
                                              and    vfo.oba_id_referente=vg_QMC_oba_id
                                              and    vfo.igc_id=igc.id
                                              and    vfo.igc_id=nvl(vg_p_igc_id,vfo.igc_id)  -- JGS20110913
                                              and    igc.estado='A')
                        and    oda.oba_id=vg_QMC_oba_id
                        and    considerar='S'
                        --and    oda.oba_id = :oba_id
                        union all

                        select  oba.titulo_abreviado ordenacao,
                                to_number(null) ordenacao_num,
                                aoa.oba_id_receptora oba_id_suo,
                                opo.descricao descricao,
                                ene.nome_abreviado,
                                -- jgs20100226 decode(opo.sinal_operacao,'-',-1,1)*(SUO.VALOR_EUR*AOA.PERCENTAGEM_CUSTOS/100) SUO_VALOR
                                decode(opo.sinal_operacao,'-',-1,1)*(suo.pre_ven*uc$facturas_obras.cust_aoa_cco (aoa.id,ono.cco_id)/100) suo_valor     -- jgs20110915 decode(opo.sinal_operacao,'-',-1,1)*(SUO.pre_ven*AOA.PERCENTAGEM_CUSTOS/100) SUO_VALOR
                        from    bgo_subcontratacoes suo,
                                bgo_operacoes_processadas oda,
                                bgo_operacoes_anuais ono,
                                bgo_associacoes_obras aoa,
                                bgo_obras oba,
                                bgo_associacoes_partes ape,
                                bgo_entidades ene,
                                bgo_operacoes opo
                        where   opo.id=ono.opo_id
                        and     suo.oda_id=oda.id
                        and     oda.ono_id=ono.id
                        and     ene.id=suo.ene_id_produtor
                        and     aoa.oba_id_associada=oda.oba_id
                        and     oba.id=aoa.oba_id_associada
                        and     aoa.oba_id_receptora=vg_QMC_oba_id
                        and     ape.pre_id_associada=oda.pre_id
                        and     ape.pre_id_receptora in (select id from bgo_partes where oba_id=aoa.oba_id_receptora)
                        and     (suo.pre_ven*uc$facturas_obras.cust_aoa_cco (aoa.id,ono.cco_id)/100) != 0
                        and     aoa.id=(select max(id)
                                        from   bgo_associacoes_obras
                                        where  oba_id_associada=aoa.oba_id_associada
                                        and    oba_id_receptora=aoa.oba_id_receptora)
                        and     oda.igc_id in (select igc_id_proveniente
                                               from   bgo_valores_facturacao vfo,
                                                      bgo_indices_geracao_custos igc
                                               where  vfo.oba_id_proveniente=aoa.oba_id_associada
                                               and    vfo.igc_id=igc.id
                                               and    igc.estado='A'
                                               and    vfo.oba_id_referente=aoa.oba_id_receptora
                                               and    vfo.tipo_movimento != 'G'
                                               and    ((vg_p_flg_tip_ger = 'R' and vg_p_tipo_obra = 'AR' and vfo.flg_tip_ger = 'R') or vfo.oba_id_referente <> vfo.oba_id_proveniente)
                                               and    vfo.oba_id_referente=vg_QMC_oba_id
                                               and    oda.igc_id=vfo.igc_id_proveniente
                                               and    rownum=1)
                        and     considerar='S'
                        and    oda.oba_id = vg_QMC_oba_id

                        union all   -- jgs20141118, entidade de acabamento externas

                        select            null ordenacao,
                               98              ordenacao_num,
                               vg_p_oba_id  oba_id_suo,
                               descricao,
                               c1 nome_abreviado,
                               valor_eur*vg_p_tiragem suo_valor
                        from  bgo_auxi_repo_fatu
                        where seq_id = vg_p_ses_id_ext

                        union all   -- jgs20141119, registos de subcontratação

                        select            null ordenacao,
                               99              ordenacao_num,
                               vg_p_oba_id  oba_id_suo,
                               descricao,
                               c1 nome_abreviado,
                               valor_eur suo_valor
                        from  bgo_auxi_repo_fatu
                        where seq_id = vg_p_ses_id_subc_encad


      );

      -- JGS20150129 FIM

        if cf_existe_subFormula='S' or v_count > 0  then
            --return(true);
            v_ret := 'TRUE';
        else
            --return(false);
            v_ret := 'FALSE';
        end if;
     insert into bgo_tabe_auxi_pers (col_1_c,col_1_n,col_2_c)
     values (upper('M_G_Consumiveis_GRPFR4FormatTr'), vg_taxp_id,v_ret);

    end M_G_Consumiveis_GRPFR4FormatTr;
--
--
    procedure F_CS_total4FormatTrigger is
    begin
        null; --se houver tempo...
    end F_CS_total4FormatTrigger;
    --
    --
    procedure R_G_Master_Cabecalho2FormatTri is
      dummy number(6);
      v_ret varchar2(100);
    begin

            select count(*)
            into dummy
            from bgo_auxi_repo_fatu /*BGO_ANALISE_NAO_FACT_V*/ anf
            where oba_id=vg_QMC_oba_id
            and     anf.seq_id = vg_p_opt_id_nf
          and   c1 = vg_p_flg_tip_ger;

          if 	dummy>0 then
            --return (true);
            v_ret := 'TRUE';
          else
            if cf_existe_sub_outrFormula='S'  /*JGS20150313*/ or cf_existe_sub_pe = 'S' then
               --return(true);
                v_ret := 'TRUE';
              else
               --return(false);
                v_ret := 'FALSE';
              end if;
          end if;

         insert into bgo_tabe_auxi_pers (col_1_c,col_1_n,col_2_c)
         values (upper('R_G_Master_Cabecalho2FormatTri'), vg_taxp_id,v_ret);

        commit;

    end R_G_Master_Cabecalho2FormatTri;

--
--
    procedure M_G_Consumiveis_GRPFR5FormatTr is
        v_count	number; ---- jgs20200724
      v_ret varchar2(100);
    begin

      -- jgs20221130 no data_block o que vai haver é:
      -- and (:p_modo = 'FAT0081R' /*pasa tudo*/ or :p_modo != 'FAT0081R' and /*tem que validar*/

      if vg_p_modo = 'FAT0081R' then -- jgs20221130

      select count(1)
      into   v_count
      from (
                select null ordenacao1,
                       cco.ord ordenacao_num3,
                       oda.oba_id oba_id_suo3,
                       opo.des_orc descricao3,     --OPO.DESCRICAO descricao3,
                       ene.nome_abreviado nome_abreviado3,
                       -- jgs20100226 decode(opo.sinal_operacao,'-',-1,1)*SUO.VALOR_EUR SUO_VALOR3
                       decode(opo.sinal_operacao,'-',-1,1)*suo.pre_ven suo_valor3
                from   bgo_subcontratacoes suo,
                       bgo_operacoes_processadas oda,
                       bgo_operacoes_anuais ono,
                       bgo_centros_custos cco,
                       bgo_entidades ene,
                       bgo_operacoes opo
                where  opo.id=ono.opo_id
                and    suo.oda_id=oda.id
                and    oda.ono_id=ono.id
                and    ono.cco_id=cco.id
                and    oda.oba_id=vg_QMC_oba_id
                -- jgs20221130: a alteração em baixo, só se 81! se 80 ou 82, continua!
                /* jgs20221130 [81][1] AND    (:P_TIPO_OBRA != 'AR' OR (:P_TIPO_OBRA = 'AR' AND :p_FLG_TIP_GER = 'R' and exists (select 1 from bgo_associacoes_obras where OBA_ID_ASSOCIADA = :oba_id and OBA_ID_RECEPTORA = :oba_id and PER_CUS_FIX > 0 )) )*/
                and    ene.id=suo.ene_id_produtor
                and    ((oda.igc_id in (select igc.id
                                      from   bgo_valores_facturacao vfo,
                                             bgo_indices_geracao_custos igc
                                      where  vfo.oba_id_referente=oda.oba_id
                                      and    oda.igc_id=igc.id
                                      and    rownum=1
                                      and    vfo.igc_id=igc.id
                                      and    vfo.igc_id=nvl(vg_p_igc_id,vfo.igc_id)  -- JGS20110913
                                      and    igc.estado='A'
                                      and    vfo.oba_id_referente=vg_QMC_oba_id)
                            )
                          or
                          (
                                oda.igc_id is not null
                            and oda.subcontratacao = 'S'
                            and exists (select 1 from bgo_indices_geracao_custos igc where igc.estado='A' and oda.igc_id=igc.id )
                          )
                         )
                and    considerar<>'S'
                and    considerar is not null
                and    uc$producao.aced_obra(ono.id,'OF')='N'
                and    suo.pre_ven != 0 -- JGS20200724
                union all
                select oba.titulo_abreviado ordenacao,
                       to_number(null) ordenacao_num,
                       aoa.oba_id_receptora oba_id_suo,
                       opo.des_orc descricao,    /* jgs20191008 opo.descricao */
                       ene.nome_abreviado,
                       -- jgs20100226 decode(opo.sinal_operacao,'-',-1,1)*(SUO.VALOR_EUR*AOA.PERCENTAGEM_CUSTOS/100) SUO_VALOR
                       decode(opo.sinal_operacao,'-',-1,1)*(suo.pre_ven*uc$facturas_obras.cust_aoa_cco (aoa.id,ono.cco_id)/100) suo_valor -- jgs20110915 decode(opo.sinal_operacao,'-',-1,1)*(SUO.pre_ven*AOA.PERCENTAGEM_CUSTOS/100) SUO_VALOR
                from   bgo_subcontratacoes suo,
                       bgo_operacoes_processadas oda,
                       bgo_operacoes_anuais ono,
                       bgo_associacoes_obras aoa,
                       bgo_obras oba,
                       bgo_associacoes_partes ape,
                       bgo_entidades ene,
                       bgo_operacoes opo
                where  opo.id=ono.opo_id
                and    suo.oda_id=oda.id
                and    oda.ono_id=ono.id
                and    ene.id=suo.ene_id_produtor
                and    aoa.oba_id_associada=oda.oba_id
                and    aoa.oba_id_receptora=vg_QMC_oba_id -- IVO OLIVEIRA 25/07/2003
                and    oba.id=aoa.oba_id_associada
                and    ape.pre_id_associada=oda.pre_id
                and    ape.pre_id_receptora in (select id from bgo_partes where oba_id=aoa.oba_id_receptora)
                and    aoa.id=(select max(id)
                               from   bgo_associacoes_obras
                               where  oba_id_associada=aoa.oba_id_associada
                               and    oba_id_receptora=aoa.oba_id_receptora)
                and    oda.igc_id in (select distinct
                                             igc_id_proveniente
                                      from   bgo_valores_facturacao vfo,
                                             bgo_indices_geracao_custos igc
                                      where  vfo.oba_id_proveniente=aoa.oba_id_associada
                                      and    vfo.igc_id=igc.id
                                      and    vfo.igc_id=nvl(vg_p_igc_id,vfo.igc_id)  -- JGS20110913
                                      and    igc.estado='A'
                                      and    vfo.oba_id_referente=aoa.oba_id_receptora
                                      and    vfo.tipo_movimento != 'G'
                                      /* jgs20221130 [81][1] AND    ((:P_FLG_TIP_GER = 'R' and :P_TIPO_OBRA = 'AR') or vfo.oba_id_referente <> vfo.oba_id_proveniente) */
                                      and    oda.igc_id=vfo.igc_id_proveniente
                                      and    vfo.oba_id_referente=vg_QMC_oba_id)
                and    considerar<>'S'
                and    considerar is not null
                and    uc$producao.aced_obra(ono.id,'OF')='N'
                and    suo.pre_ven != 0 -- JGS20200724
                -- jgs20150313
                union all
                select null ordenacao3,
                       cco.ord ordenacao_num2,
                       oda.oba_id oba_id_suo2,
                       opo.des_orc descricao2,                  /*jgs20191008 OPO.DESCRICAO */
                       ene.nome_abreviado nome_abreviado2,
                       decode(opo.sinal_operacao,'-',-1,1)*suo.pre_ven suo_valor2
                from   bgo_subcontratacoes suo,
                       bgo_operacoes_processadas oda,
                       bgo_operacoes_anuais ono,
                       bgo_centros_custos cco,
                       bgo_entidades ene,
                       bgo_operacoes opo,
                       cg_ref_codes cg
                where  opo.id=ono.opo_id
                and    cg.rv_domain='EMPRESA_SUBCONTRATACAO'
                and    cg.rv_low_value=suo.emp_fac
                and    suo.emp_fac = 'P'
                and    suo.oda_id=oda.id
                and    oda.ono_id=ono.id
                and    ono.cco_id=cco.id
                and    ene.id=suo.ene_id_produtor
                and    oda.igc_id in (select distinct
                                             igc.id
                                      from   bgo_valores_facturacao vfo,
                                             bgo_indices_geracao_custos igc
                                      where  vfo.oba_id_referente=oda.oba_id
                                      and    oda.igc_id=igc.id
                                      and    vfo.igc_id=igc.id
                                      and    vfo.igc_id=nvl(vg_p_igc_id,vfo.igc_id)  -- JGS20110913
                                      and    vfo.oba_id_referente=vg_p_oba_id
                                      and    igc.estado='A')
                and    considerar='N'
                and    oda.oba_id=vg_p_oba_id
                and    uc$producao.aced_obra(ono.id,'OF')='S'
                and    suo.pre_ven != 0 -- JGS20200724
                union all
                select oba.titulo_abreviado ordenacao,
                       cco.ord ordenacao_num2,
                       aoa.oba_id_receptora oba_id_suo,
                       opo.des_orc   descricao2,                 /* jgs20191008 OPO.descricao */
                       ene.nome_abreviado,
                       decode(opo.sinal_operacao,'-',-1,1)*(suo.pre_ven*uc$facturas_obras.cust_aoa_cco (aoa.id,ono.cco_id)/100) suo_valor
                from   bgo_subcontratacoes suo,
                       bgo_operacoes_processadas oda,
                       bgo_operacoes_anuais ono,
                       bgo_associacoes_obras aoa,
                       bgo_obras oba,
                       bgo_associacoes_partes ape,
                       bgo_entidades ene,
                       bgo_operacoes opo,
                       bgo_centros_custos cco,
                       cg_ref_codes cg
                where  opo.id=ono.opo_id
                and    cg.rv_domain='EMPRESA_SUBCONTRATACAO'
                and    cg.rv_low_value=suo.emp_fac
                and    suo.emp_fac = 'P'
                and    suo.oda_id=oda.id
                and    oda.ono_id=ono.id
                and    ono.cco_id=cco.id
                and    ene.id=suo.ene_id_produtor
                and    aoa.oba_id_associada=oda.oba_id
                and    oba.id=aoa.oba_id_associada
                and    aoa.oba_id_receptora=vg_p_oba_id
                and    ape.pre_id_associada=oda.pre_id
                and    ape.pre_id_receptora in (select id from bgo_partes where oba_id=aoa.oba_id_receptora)
                and     (suo.pre_ven*uc$facturas_obras.cust_aoa_cco (aoa.id,ono.cco_id)/100) != 0
                and    aoa.id=(select max(id)
                               from   bgo_associacoes_obras
                               where  oba_id_associada=aoa.oba_id_associada
                               and    oba_id_receptora=aoa.oba_id_receptora)
                and    oda.igc_id in (select distinct
                                             igc_id_proveniente
                                      from   bgo_valores_facturacao vfo,
                                             bgo_indices_geracao_custos igc
                                      where  vfo.oba_id_proveniente=aoa.oba_id_associada
                                      and    vfo.igc_id=igc.id
                                      and    vfo.igc_id=nvl(vg_p_igc_id,vfo.igc_id)  -- JGS20110913
                                      and    igc.estado='A'
                                      and    vfo.oba_id_referente=aoa.oba_id_receptora
                                      and    vfo.tipo_movimento != 'G'
                                      /* jgs20221130 [81][1] AND    ((:P_FLG_TIP_GER = 'R' and :P_TIPO_OBRA = 'AR') or vfo.oba_id_referente <> vfo.oba_id_proveniente) */
                                      and    vfo.oba_id_referente=vg_p_oba_id
                                      and    oda.igc_id=vfo.igc_id_proveniente)
                and    considerar='N'
                and    uc$producao.aced_obra(ono.id,'OF')='S'
                and    suo.pre_ven != 0 -- JGS20200724
                -- fim jgs20150313
                );

      else -- if :p_modo = 'FAT0081R' then -- jgs20221130


      select count(1)
      into   v_count
      from (
                select null ordenacao1,
                       cco.ord ordenacao_num3,
                       oda.oba_id oba_id_suo3,
                       opo.des_orc descricao3,     --OPO.DESCRICAO descricao3,
                       ene.nome_abreviado nome_abreviado3,
                       -- jgs20100226 decode(opo.sinal_operacao,'-',-1,1)*SUO.VALOR_EUR SUO_VALOR3
                       decode(opo.sinal_operacao,'-',-1,1)*suo.pre_ven suo_valor3
                from   bgo_subcontratacoes suo,
                       bgo_operacoes_processadas oda,
                       bgo_operacoes_anuais ono,
                       bgo_centros_custos cco,
                       bgo_entidades ene,
                       bgo_operacoes opo
                where  opo.id=ono.opo_id
                and    suo.oda_id=oda.id
                and    oda.ono_id=ono.id
                and    ono.cco_id=cco.id
                and    oda.oba_id=vg_QMC_oba_id
                -- jgs20221130: a alteração em baixo, só se 81! se 80 ou 82, continua!
                and    (vg_p_tipo_obra != 'AR' or (vg_p_tipo_obra = 'AR' and vg_p_flg_tip_ger = 'R' and exists (select 1 from bgo_associacoes_obras where oba_id_associada = vg_QMC_oba_id and oba_id_receptora = vg_QMC_oba_id and per_cus_fix > 0 )) )
                and    ene.id=suo.ene_id_produtor
                and    ((oda.igc_id in (select igc.id
                                      from   bgo_valores_facturacao vfo,
                                             bgo_indices_geracao_custos igc
                                      where  vfo.oba_id_referente=oda.oba_id
                                      and    oda.igc_id=igc.id
                                      and    rownum=1
                                      and    vfo.igc_id=igc.id
                                      and    vfo.igc_id=nvl(vg_p_igc_id,vfo.igc_id)  -- JGS20110913
                                      and    igc.estado='A'
                                      and    vfo.oba_id_referente=vg_QMC_oba_id)
                            )
                          or
                          (
                                oda.igc_id is not null
                            and oda.subcontratacao = 'S'
                            and exists (select 1 from bgo_indices_geracao_custos igc where igc.estado='A' and oda.igc_id=igc.id )
                          )
                         )
                and    considerar<>'S'
                and    considerar is not null
                and    uc$producao.aced_obra(ono.id,'OF')='N'
                and    suo.pre_ven != 0 -- JGS20200724
                union all
                select oba.titulo_abreviado ordenacao,
                       to_number(null) ordenacao_num,
                       aoa.oba_id_receptora oba_id_suo,
                       opo.des_orc descricao,    /* jgs20191008 opo.descricao */
                       ene.nome_abreviado,
                       -- jgs20100226 decode(opo.sinal_operacao,'-',-1,1)*(SUO.VALOR_EUR*AOA.PERCENTAGEM_CUSTOS/100) SUO_VALOR
                       decode(opo.sinal_operacao,'-',-1,1)*(suo.pre_ven*uc$facturas_obras.cust_aoa_cco (aoa.id,ono.cco_id)/100) suo_valor -- jgs20110915 decode(opo.sinal_operacao,'-',-1,1)*(SUO.pre_ven*AOA.PERCENTAGEM_CUSTOS/100) SUO_VALOR
                from   bgo_subcontratacoes suo,
                       bgo_operacoes_processadas oda,
                       bgo_operacoes_anuais ono,
                       bgo_associacoes_obras aoa,
                       bgo_obras oba,
                       bgo_associacoes_partes ape,
                       bgo_entidades ene,
                       bgo_operacoes opo
                where  opo.id=ono.opo_id
                and    suo.oda_id=oda.id
                and    oda.ono_id=ono.id
                and    ene.id=suo.ene_id_produtor
                and    aoa.oba_id_associada=oda.oba_id
                and    aoa.oba_id_receptora=vg_QMC_oba_id -- IVO OLIVEIRA 25/07/2003
                and    oba.id=aoa.oba_id_associada
                and    ape.pre_id_associada=oda.pre_id
                and    ape.pre_id_receptora in (select id from bgo_partes where oba_id=aoa.oba_id_receptora)
                and    aoa.id=(select max(id)
                               from   bgo_associacoes_obras
                               where  oba_id_associada=aoa.oba_id_associada
                               and    oba_id_receptora=aoa.oba_id_receptora)
                and    oda.igc_id in (select distinct
                                             igc_id_proveniente
                                      from   bgo_valores_facturacao vfo,
                                             bgo_indices_geracao_custos igc
                                      where  vfo.oba_id_proveniente=aoa.oba_id_associada
                                      and    vfo.igc_id=igc.id
                                      and    vfo.igc_id=nvl(vg_p_igc_id,vfo.igc_id)  -- JGS20110913
                                      and    igc.estado='A'
                                      and    vfo.oba_id_referente=aoa.oba_id_receptora
                                      and    vfo.tipo_movimento != 'G'
                                      and    ((vg_p_flg_tip_ger = 'R' and vg_p_tipo_obra = 'AR') or vfo.oba_id_referente <> vfo.oba_id_proveniente)
                                      and    oda.igc_id=vfo.igc_id_proveniente
                                      and    vfo.oba_id_referente=vg_QMC_oba_id)
                and    considerar<>'S'
                and    considerar is not null
                and    uc$producao.aced_obra(ono.id,'OF')='N'
                and    suo.pre_ven != 0 -- JGS20200724
                -- jgs20150313
                union all
                select null ordenacao3,
                       cco.ord ordenacao_num2,
                       oda.oba_id oba_id_suo2,
                       opo.des_orc descricao2,                  /*jgs20191008 OPO.DESCRICAO */
                       ene.nome_abreviado nome_abreviado2,
                       decode(opo.sinal_operacao,'-',-1,1)*suo.pre_ven suo_valor2
                from   bgo_subcontratacoes suo,
                       bgo_operacoes_processadas oda,
                       bgo_operacoes_anuais ono,
                       bgo_centros_custos cco,
                       bgo_entidades ene,
                       bgo_operacoes opo,
                       cg_ref_codes cg
                where  opo.id=ono.opo_id
                and    cg.rv_domain='EMPRESA_SUBCONTRATACAO'
                and    cg.rv_low_value=suo.emp_fac
                and    suo.emp_fac = 'P'
                and    suo.oda_id=oda.id
                and    oda.ono_id=ono.id
                and    ono.cco_id=cco.id
                and    ene.id=suo.ene_id_produtor
                and    oda.igc_id in (select distinct
                                             igc.id
                                      from   bgo_valores_facturacao vfo,
                                             bgo_indices_geracao_custos igc
                                      where  vfo.oba_id_referente=oda.oba_id
                                      and    oda.igc_id=igc.id
                                      and    vfo.igc_id=igc.id
                                      and    vfo.igc_id=nvl(vg_p_igc_id,vfo.igc_id)  -- JGS20110913
                                      and    vfo.oba_id_referente=vg_p_oba_id
                                      and    igc.estado='A')
                and    considerar='N'
                and    oda.oba_id=vg_p_oba_id
                and    uc$producao.aced_obra(ono.id,'OF')='S'
                and    suo.pre_ven != 0 -- JGS20200724
                union all
                select oba.titulo_abreviado ordenacao,
                       cco.ord ordenacao_num2,
                       aoa.oba_id_receptora oba_id_suo,
                       opo.des_orc   descricao2,                 /* jgs20191008 OPO.descricao */
                       ene.nome_abreviado,
                       decode(opo.sinal_operacao,'-',-1,1)*(suo.pre_ven*uc$facturas_obras.cust_aoa_cco (aoa.id,ono.cco_id)/100) suo_valor
                from   bgo_subcontratacoes suo,
                       bgo_operacoes_processadas oda,
                       bgo_operacoes_anuais ono,
                       bgo_associacoes_obras aoa,
                       bgo_obras oba,
                       bgo_associacoes_partes ape,
                       bgo_entidades ene,
                       bgo_operacoes opo,
                       bgo_centros_custos cco,
                       cg_ref_codes cg
                where  opo.id=ono.opo_id
                and    cg.rv_domain='EMPRESA_SUBCONTRATACAO'
                and    cg.rv_low_value=suo.emp_fac
                and    suo.emp_fac = 'P'
                and    suo.oda_id=oda.id
                and    oda.ono_id=ono.id
                and    ono.cco_id=cco.id
                and    ene.id=suo.ene_id_produtor
                and    aoa.oba_id_associada=oda.oba_id
                and    oba.id=aoa.oba_id_associada
                and    aoa.oba_id_receptora=vg_p_oba_id
                and    ape.pre_id_associada=oda.pre_id
                and    ape.pre_id_receptora in (select id from bgo_partes where oba_id=aoa.oba_id_receptora)
                and     (suo.pre_ven*uc$facturas_obras.cust_aoa_cco (aoa.id,ono.cco_id)/100) != 0
                and    aoa.id=(select max(id)
                               from   bgo_associacoes_obras
                               where  oba_id_associada=aoa.oba_id_associada
                               and    oba_id_receptora=aoa.oba_id_receptora)
                and    oda.igc_id in (select distinct
                                             igc_id_proveniente
                                      from   bgo_valores_facturacao vfo,
                                             bgo_indices_geracao_custos igc
                                      where  vfo.oba_id_proveniente=aoa.oba_id_associada
                                      and    vfo.igc_id=igc.id
                                      and    vfo.igc_id=nvl(vg_p_igc_id,vfo.igc_id)  -- JGS20110913
                                      and    igc.estado='A'
                                      and    vfo.oba_id_referente=aoa.oba_id_receptora
                                      and    vfo.tipo_movimento != 'G'
                                      and    ((vg_p_flg_tip_ger = 'R' and vg_p_tipo_obra = 'AR') or vfo.oba_id_referente <> vfo.oba_id_proveniente)
                                      and    vfo.oba_id_referente=vg_p_oba_id
                                      and    oda.igc_id=vfo.igc_id_proveniente)
                and    considerar='N'
                and    uc$producao.aced_obra(ono.id,'OF')='S'
                and    suo.pre_ven != 0 -- JGS20200724
                -- fim jgs20150313
                );

      end if;  -- else -- if :p_modo = 'FAT0081R' then -- jgs20221130

      if v_count > 0 then
            -- return(true);
             v_ret := 'TRUE';
        else
            --return(false);
             v_ret := 'FALSE';
        end if;
         insert into bgo_tabe_auxi_pers (col_1_c,col_1_n,col_2_c)
         values (upper('M_G_Consumiveis_GRPFR5FormatTr'), vg_taxp_id,v_ret);


    end M_G_Consumiveis_GRPFR5FormatTr;
--
--
    procedure F_Exterior_Outr1FormatTrigger is
      dummy number(1);
      v_ret varchar2(100);
    begin
     begin
        select distinct 1
        into dummy
        from
        (select 1
         from bgo_subcontratacoes suo
         ,		 bgo_operacoes_processadas oda
         where suo.oda_id=oda.id
       and oda.igc_id in (select igc.id
                                          from bgo_valores_facturacao vfo
                                            ,		 bgo_indices_geracao_custos igc
                                            where vfo.oba_id_referente=oda.oba_id
                                            and	 vfo.igc_id=igc.id  and  vfo.flg_tip_ger = vg_p_flg_tip_ger -- VFO.IGC_ID=NVL(:P_IGC_ID,VFO.IGC_ID)  /*JGS20110913*/
                                            and igc.estado='A'
                                                and oda.igc_id=igc.id
                                                and rownum=1)
         and considerar<>'S' and considerar is not null -- Ivo Oliveira 17/07/2003
       and uc$producao.aced_obra(oda.ono_id,'OF')='N'
       and oda.oba_id=vg_QMC_oba_id
         union all
         select 1
         from bgo_subcontratacoes suo
         ,		 bgo_operacoes_processadas oda
         ,		 bgo_associacoes_obras aoa
         ,		 bgo_obras oba
         ,		 bgo_associacoes_partes ape
         where suo.oda_id=oda.id
         and aoa.oba_id_associada=oda.oba_id
         and oba.id=aoa.oba_id_associada
         and ape.pre_id_associada=oda.pre_id
         and ape.pre_id_receptora in (select id
                                                                  from bgo_partes
                                                                  where oba_id=aoa.oba_id_receptora)
         and aoa.id=(select max(id)
                                 from bgo_associacoes_obras
                                 where oba_id_associada=aoa.oba_id_associada
                                 and oba_id_receptora=aoa.oba_id_receptora)
         and oda.igc_id in (select igc_id_proveniente
                                            from bgo_valores_facturacao vfo
                                            ,	bgo_indices_geracao_custos igc
                                            where vfo.oba_id_proveniente=aoa.oba_id_associada
                                            and vfo.igc_id=igc.id  and vfo.flg_tip_ger = vg_p_flg_tip_ger --  VFO.IGC_ID=NVL(:P_IGC_ID,VFO.IGC_ID)  /*JGS20110913*/
                                            and igc.estado='A'
                                            and vfo.oba_id_referente=aoa.oba_id_receptora
                                            and vfo.tipo_movimento != 'G'
                                            and ((vg_p_flg_tip_ger = 'R' and vg_p_tipo_obra = 'AR') or vfo.oba_id_referente <> vfo.oba_id_proveniente)
                                                and oda.igc_id=vfo.igc_id_proveniente
                                                and rownum=1)
         and considerar<>'S' and considerar is not null -- Ivo Oliveira 17/07/2003
         and uc$producao.aced_obra(oda.ono_id,'OF')='N'
         and aoa.oba_id_receptora=vg_QMC_oba_id);

         -- este é diferente, retorna um valor
         v_ret := 'Externo *';
         --srw.set_field_char(0,'Externo *');
     exception when others then
         --srw.set_field_char(0,'Externo');
         v_ret := 'Externo';
     end;
         insert into bgo_tabe_auxi_pers (col_1_c,col_1_n,col_2_c)
         values (upper('F_Exterior_Outr1FormatTrigger'), vg_taxp_id,v_ret);

    end F_Exterior_Outr1FormatTrigger;
--
--
    procedure F_Exterior1FormatTrigger is
      dummy number(1);
      v_ret varchar2(50);
    begin
     begin
        select distinct 1
        into dummy
        from
        (select 1
         from bgo_subcontratacoes suo
         ,		 bgo_operacoes_processadas oda
         where suo.oda_id=oda.id
       and oda.igc_id in (select igc.id
                                          from bgo_valores_facturacao vfo
                                            ,		 bgo_indices_geracao_custos igc
                                            where vfo.oba_id_referente=oda.oba_id
                                            and	 vfo.igc_id=igc.id  and vfo.flg_tip_ger = vg_p_flg_tip_ger --  VFO.IGC_ID=NVL(:P_IGC_ID,VFO.IGC_ID)  /*JGS20110913*/
                                            and igc.estado='A'
                                                and oda.igc_id=igc.id
                                                and rownum=1)
         and considerar='S'
       and oda.oba_id=vg_QMC_oba_id
         union all
         select 1
         from bgo_subcontratacoes suo
         ,		 bgo_operacoes_processadas oda
         ,		 bgo_associacoes_obras aoa
         ,		 bgo_obras oba
         ,		 bgo_associacoes_partes ape
         where suo.oda_id=oda.id
         and aoa.oba_id_associada=oda.oba_id
         and oba.id=aoa.oba_id_associada
         and ape.pre_id_associada=oda.pre_id
         and ape.pre_id_receptora in (select id
                                                                  from bgo_partes
                                                                  where oba_id=aoa.oba_id_receptora)
         and aoa.id=(select max(id)
                                 from bgo_associacoes_obras
                                 where oba_id_associada=aoa.oba_id_associada
                                 and oba_id_receptora=aoa.oba_id_receptora)
         and oda.igc_id in (select igc_id_proveniente
                                            from bgo_valores_facturacao vfo
                                            ,	bgo_indices_geracao_custos igc
                                            where vfo.oba_id_proveniente=aoa.oba_id_associada
                                            and vfo.igc_id=igc.id  and vfo.flg_tip_ger = vg_p_flg_tip_ger --  VFO.IGC_ID=NVL(:P_IGC_ID,VFO.IGC_ID)  /*JGS20110913*/
                                            and igc.estado='A'
                                            and vfo.oba_id_referente=aoa.oba_id_receptora
                                            and vfo.tipo_movimento != 'G'
                                            and ((vg_p_flg_tip_ger = 'R' and vg_p_tipo_obra = 'AR') or vfo.oba_id_referente <> vfo.oba_id_proveniente)
                                                and oda.igc_id=vfo.igc_id_proveniente
                                                and rownum=1)
         and considerar='S'
         and aoa.oba_id_receptora=vg_QMC_oba_id);

         --srw.set_field_char(0,'Externo *');
         v_ret := 'Externo *';

     exception when others then
         --srw.set_field_char(0,'Externo');
         v_ret := 'Externo';

     end;
         insert into bgo_tabe_auxi_pers (col_1_c,col_1_n,col_2_c)
         values (upper('F_Exterior1FormatTrigger'), vg_taxp_id,v_ret);

    end F_Exterior1FormatTrigger;--
--
    procedure CF_DESIG_ENTFormula is   -- JGS20220203: correção de crash
        v_empresa bgo_valo_fact_empr_grup.empresa%type;
        v_texto varchar2(500);

        p_per_val bgo_dsi_para.val_eur%type := null;
        p_tipo  bgo_dsi_ctrl_para.per_val%type := null;
        p_mesg  varchar2(0200):=null;

        v_num    number;  -- jgs20150313

    begin


     begin
        select empresa
        into v_empresa
        from bgo_valo_fact_empr_grup vfg
        ,		 bgo_indices_geracao_custos igc
        where /*VFG.OBA_ID_REFERENTE=VFG.OBA_ID_PROVENIENTE
        AND */igc.id=vfg.igc_id
        and igc.estado='A'
        and vfg.oba_id_referente=vg_QMC_oba_id
        and empresa is not null
        and rownum=1;

        uc$varios.dsi_para('FAO0080R',v_empresa,'designacao_entidade',p_per_val,p_tipo,p_mesg);

      uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', 'Ini: '||p_per_val, null, null);


      v_texto:=initcap(p_per_val);

     exception when others then
         begin

        uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', 'Ini select ...', null, null);

             select distinct empresa
             into v_empresa
         from (select cco.emp empresa
                 from bgo_subcontratacoes suo,
                      bgo_operacoes_processadas oda,
                      bgo_operacoes opo,
                      bgo_operacoes_anuais ono,
                      bgo_centros_custos cco
                where suo.oda_id = oda.id
                  and oda.ono_id = ono.id
                  and ono.opo_id = opo.id
                  and ono.cco_id = cco.id
                  and oda.igc_id in (
                         select igc.id
                           from bgo_valores_facturacao vfo,
                                bgo_indices_geracao_custos igc
                          where vfo.oba_id_referente = oda.oba_id
                            and vfo.igc_id = igc.id and   vfo.flg_tip_ger = vg_p_flg_tip_ger --   VFO.IGC_ID=NVL(:P_IGC_ID,VFO.IGC_ID)  -- JGS20110913
                            and igc.estado = 'A'
                            and oda.igc_id = igc.id
                            and rownum = 1)
                  and considerar <> 'S'
                  and considerar is not null      -- Ivo Oliveira 17/07/2003
                  and uc$producao.aced_obra (oda.ono_id, 'OF') = 'N'
                  and oda.oba_id = vg_QMC_oba_id
                  and cco.emp <> 'B'
                  and rownum = 1
               union all
               select cco.emp empresa
                 from bgo_subcontratacoes suo,
                      bgo_operacoes_processadas oda,
                      bgo_operacoes_anuais ono,
                      bgo_operacoes opo,
                      bgo_centros_custos cco,
                      bgo_associacoes_obras aoa,
                      bgo_obras oba,
                      bgo_associacoes_partes ape
                where suo.oda_id = oda.id
                  and oda.ono_id = ono.id
                  and ono.opo_id = opo.id
                  and ono.cco_id = cco.id
                  and cco.emp <> 'B'
                  and aoa.oba_id_associada = oda.oba_id
                  and oba.id = aoa.oba_id_associada
                  and ape.pre_id_associada = oda.pre_id
                  and ape.pre_id_receptora in (
                                         select id
                                           from bgo_partes
                                          where oba_id =
                                                        aoa.oba_id_receptora)
                  and aoa.id =
                         (select max (id)
                            from bgo_associacoes_obras
                           where oba_id_associada = aoa.oba_id_associada
                             and oba_id_receptora = aoa.oba_id_receptora)
                  and oda.igc_id in (
                         select igc_id_proveniente
                           from bgo_valores_facturacao vfo,
                                bgo_indices_geracao_custos igc
                          where vfo.oba_id_proveniente =
                                                        aoa.oba_id_associada
                            and vfo.igc_id = igc.id and  vfo.flg_tip_ger = vg_p_flg_tip_ger --   VFO.IGC_ID=NVL(:P_IGC_ID,VFO.IGC_ID)  -- JGS20110913
                            and igc.estado = 'A'
                            and vfo.oba_id_referente = aoa.oba_id_receptora
                            and vfo.tipo_movimento != 'G'
                            and vfo.oba_id_referente <>
                                                      vfo.oba_id_proveniente
                            and oda.igc_id = vfo.igc_id_proveniente
                            and rownum = 1)
                  and considerar <> 'S'
                  and considerar is not null      -- Ivo Oliveira 17/07/2003
                  and uc$producao.aced_obra (oda.ono_id, 'OF') = 'N'
                  and aoa.oba_id_receptora = vg_QMC_oba_id
                  and rownum = 1);


                 uc$varios.dsi_para('FAO0080R',v_empresa,'designacao_entidade',p_per_val,p_tipo,p_mesg);

             v_texto:=initcap(p_per_val);

        uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', 'Fim select ...', null, null);

         exception when others then

        uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', 'Ini exception ...:P_SES_ID_CUS_PE ='||vg_p_ses_id_cus_pe, null, null);

           select count(1)
           into   v_num
           from   (
           select  arf.oba_id oba_id_detail1,
                arf.oba_id_prov oba_id_prov2,
                arf.descricao descricao_detail1,
                arf.tipo_mov_aux tipo_mov_aux1,
                arf.order_by order_by_detail1,
                arf.order_by_num order_by_num2,
                arf.quantidade quantidade1,
                arf.unidade unidade1,
                arf.tempo tempo1,
                arf.valor valor_detail1,
                arf.valor_eur valor_eur_detail1,
                0 valor_sub,
                null dummy1
                from    bgo_auxi_repo_fatu arf
                where   arf.seq_id = vg_p_ses_id_cus_pe
                and     tip_reg      = 'CUS_PE'
                and     rownum = 1
                and     c1= 'TOTAL');


        uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', 'Fim exception ...', null, null);

                if v_num > 0 then
                    v_texto:='PORTO EDITORA';
                else
                    v_texto:='Outras Empresas';
                end if;
          -- FIM JGS20150313


            end;

     end;

         insert into bgo_tabe_auxi_pers (col_1_c,col_1_n,col_2_c)
         values (upper('F_Exterior_Outr1FormatTrigger'), vg_taxp_id,v_texto);

    END CF_DESIG_ENTFormula;
--
--
    procedure CF_Existe_SubFormula is
      dummy number(1);
      v_ret varchar2(1);
    begin
     -- Ivo Oliveira 21/11/2002
     -- Esta função serve para verificar se há ou não registos de subcontratação, de forma
     -- a mostrar ou não o quadro de subcontratação

     begin
        select distinct 1
        into dummy
        from
        (select 1
         from bgo_subcontratacoes suo
         ,		 bgo_operacoes_processadas oda
         where suo.oda_id=oda.id
       and oda.igc_id in (select igc.id
                                          from bgo_valores_facturacao vfo
                                            ,		 bgo_indices_geracao_custos igc
                                            where vfo.oba_id_referente=oda.oba_id
                                            and	 vfo.igc_id=igc.id and  vfo.flg_tip_ger = vg_p_flg_tip_ger --   VFO.IGC_ID=NVL(:P_IGC_ID,VFO.IGC_ID)  -- JGS20110913
                                            and igc.estado='A'
                                                and oda.igc_id=igc.id
                                                and rownum=1)
         and considerar='S'
       and oda.oba_id=vg_QMC_oba_id
         union all
         select 1
         from bgo_subcontratacoes suo
         ,		 bgo_operacoes_processadas oda
         ,		 bgo_associacoes_obras aoa
         ,		 bgo_obras oba
         ,		 bgo_associacoes_partes ape
         ,     bgo_operacoes_anuais   ono    -- JGS20110920
         where suo.oda_id=oda.id
         and   oda.ono_id=ono.id
         and   (suo.pre_ven*uc$facturas_obras.cust_aoa_cco (aoa.id,ono.cco_id)/100) != 0  -- jgs20110920
         and aoa.oba_id_associada=oda.oba_id
         and oba.id=aoa.oba_id_associada
         and ape.pre_id_associada=oda.pre_id
         and ape.pre_id_receptora in (select id
                                                                  from bgo_partes
                                                                  where oba_id=aoa.oba_id_receptora)
         and aoa.id=(select max(id)
                                 from bgo_associacoes_obras
                                 where oba_id_associada=aoa.oba_id_associada
                                 and oba_id_receptora=aoa.oba_id_receptora)
         and oda.igc_id in (select igc_id_proveniente
                                            from bgo_valores_facturacao vfo
                                            ,	bgo_indices_geracao_custos igc
                                            where vfo.oba_id_proveniente=aoa.oba_id_associada
                                            and vfo.igc_id=igc.id and  vfo.flg_tip_ger = vg_p_flg_tip_ger --   VFO.IGC_ID=NVL(:P_IGC_ID,VFO.IGC_ID)  -- JGS20110913
                                            and igc.estado='A'
                                            and vfo.oba_id_referente=aoa.oba_id_receptora
                                            and vfo.tipo_movimento != 'G'
                                            and ((vg_p_flg_tip_ger = 'R' and vg_p_tipo_obra = 'AR') or vfo.oba_id_referente <> vfo.oba_id_proveniente)
                                                and oda.igc_id=vfo.igc_id_proveniente
                                                and rownum=1)
         and considerar='S'
         and aoa.oba_id_receptora=vg_QMC_oba_id);

       uc$logs_gera_log (null, 'FAO0080RZEROS', 'A PREENCHER', 'D', 'CF_EXISTE_SUB='||'S', null, null);

       -- return('S');
       v_ret := 'S';
     exception when others then
       --return('N');
       v_ret := 'N';
     end;

         insert into bgo_tabe_auxi_pers (col_1_c,col_1_n,col_2_c)
         values (upper('CF_Existe_SubFormula'), vg_taxp_id,v_ret);

    end CF_Existe_SubFormula;
--
--
    procedure CF_Existe_Sub_OutrFormula is
      dummy number(1);
      v_ret varchar2(1);
    begin
     -- Ivo Oliveira 21/11/2002
     -- Esta função serve para verificar se há ou não registos de subcontratação, de forma
     -- a mostrar ou não o quadro de subcontratação
     begin
        select distinct 1
        into dummy
        from
        (select 1
         from bgo_subcontratacoes suo
         ,		 bgo_operacoes_processadas oda
         where suo.oda_id=oda.id
       and    (vg_p_tipo_obra != 'AR' or (vg_p_tipo_obra = 'AR' and vg_p_flg_tip_ger = 'R' and exists (select 1 from bgo_associacoes_obras where oba_id_associada = vg_QMC_oba_id and oba_id_receptora = vg_QMC_oba_id and per_cus_fix > 0 )) ) -- jgs20111014
       and ((oda.igc_id in (select igc.id
                                          from bgo_valores_facturacao vfo
                                            ,		 bgo_indices_geracao_custos igc
                                            where vfo.oba_id_referente=oda.oba_id
                                            and	 vfo.igc_id=igc.id and   vfo.flg_tip_ger = vg_p_flg_tip_ger --  VFO.IGC_ID=NVL(:P_IGC_ID,VFO.IGC_ID)  -- JGS20110913
                                            and igc.estado='A'
                                                and oda.igc_id=igc.id
                                                and rownum=1)
              )
              or -- JGS20081024, se não foi gerado IGC, por não ter operações BG, não descartar registos de SUBCONTRATAÇÃO
              (
                    oda.igc_id is not null
                and oda.subcontratacao = 'S'
                and exists (select 1 from bgo_indices_geracao_custos igc where igc.estado='A' and oda.igc_id=igc.id )
              )
            )
         and considerar<>'S' and considerar is not null -- Ivo Oliveira 17/07/2003
       and uc$producao.aced_obra(oda.ono_id,'OF')='N'
       and oda.oba_id=vg_QMC_oba_id
         union all
         select 1
         from bgo_subcontratacoes suo
         ,		 bgo_operacoes_processadas oda
         ,		 bgo_associacoes_obras aoa
         ,		 bgo_obras oba
         ,		 bgo_associacoes_partes ape
         where suo.oda_id=oda.id
       and    (vg_p_tipo_obra != 'AR' or (vg_p_tipo_obra = 'AR' and vg_p_flg_tip_ger = 'R' and exists (select 1 from bgo_associacoes_obras where oba_id_associada = vg_QMC_oba_id and oba_id_receptora = vg_QMC_oba_id and per_cus_fix > 0 )) ) -- jgs20111014
         and aoa.oba_id_associada=oda.oba_id
         and oba.id=aoa.oba_id_associada
         and ape.pre_id_associada=oda.pre_id
         and ape.pre_id_receptora in (select id
                                                                  from bgo_partes
                                                                  where oba_id=vg_QMC_oba_id)       --opt-jgs20150824  WHERE OBA_ID=AOA.OBA_ID_RECEPTORA)
         and aoa.id=(select max(id)
                                 from bgo_associacoes_obras
                                 where oba_id_associada=aoa.oba_id_associada
                                 and oba_id_receptora=aoa.oba_id_receptora)
         and oda.igc_id in (select igc_id_proveniente
                                            from bgo_valores_facturacao vfo
                                            ,	bgo_indices_geracao_custos igc
                                            where vfo.oba_id_proveniente=aoa.oba_id_associada
                                            and vfo.igc_id=igc.id and   vfo.flg_tip_ger = vg_p_flg_tip_ger --   VFO.IGC_ID=NVL(:P_IGC_ID,VFO.IGC_ID)  -- JGS20110913
                                            and igc.estado='A'
                                            and vfo.oba_id_referente=aoa.oba_id_receptora
                                            and vfo.tipo_movimento != 'G'
                                            and ((vg_p_flg_tip_ger = 'R' and vg_p_tipo_obra = 'AR') or vfo.oba_id_referente <> vfo.oba_id_proveniente)
                                                and oda.igc_id=vfo.igc_id_proveniente
                                                and rownum=1)
         and considerar<>'S' and considerar is not null -- Ivo Oliveira 17/07/2003
         and uc$producao.aced_obra(oda.ono_id,'OF')='N'
         and aoa.oba_id_receptora=vg_QMC_oba_id);

       uc$logs_gera_log (null, 'FAO0080RZEROS', 'A PREENCHER', 'D', 'CF_EXISTE_SUB_OUTR='||'S', null, null);

         uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', 'Vou retornar S', null, null);

       --return('S');
       v_ret := 'S';
     exception when others then

         uc$logs_gera_log (null, 'FAO0080R', 'A PREENCHER', 'D', 'Vou retornar N: erro = '||sqlerrm, null, null);

       --return('N');
       v_ret := 'N';
     end;
         insert into bgo_tabe_auxi_pers (col_1_c,col_1_n,col_2_c)
         values (upper('CF_Existe_Sub_OutrFormula'), vg_taxp_id,v_ret);


    end CF_Existe_Sub_OutrFormula;
--
--
procedure gera_dados_report (p_taxp_id in number,
                             p_erro in out varchar2) is
/******************************************************************************
   NAME:       gera_dados_report
   PURPOSE:    Geração de dados para execução de report FAZ0080R

   REVISIONS:
   Ver           Data            Autor             Descrição
   ---------  -----------  -----------------  --------------------
   1.0        2023/01/13    José Sancho       Criação.
******************************************************************************/

    v_taxp_reg  bgo_tabe_auxi_pers%rowtype;

    v_BeforePForm         boolean;
    v_BeforeReport        boolean;

    v_aux_fmt_trg         boolean;

    -- Logger --
    c_scope               constant varchar2(1000) := UC$FAZ0080R_BLLl.vg_scope;
    v_override_default    varchar2(1) := logger.bgo_override_default(c_scope);
    v_pro_id              varchar2(100) := to_char(p_taxp_id);
    v_params              logger.tab_param;

begin

    p_erro := null;
    -- Logger --
    logger.append_param (p_params => v_params, p_name => 'P_TAXP_ID', p_val => to_char(p_taxp_id));
    logger.log_info ('> INICIO! (parâmetros de entrada na coluna EXTRA)',c_scope,v_pro_id,v_override_default,null,v_params);

    logger.log_info ('BeforePForm...',c_scope,v_pro_id,v_override_default,null,v_params);
    v_BeforePForm  := BeforePForm;   -- apenas atribuir role.

    logger.log_info ('bgo_tabe_auxi_pers...',c_scope,v_pro_id,v_override_default,null,v_params);
    select * into v_taxp_reg from bgo_tabe_auxi_pers where id = p_taxp_id;
    vg_taxp_id := p_taxp_id;
    logger.log_info ('bgo_tabe_auxi_pers OK',c_scope,v_pro_id,v_override_default,null,v_params);

    -- ler parâmetros, para poder trabalhar P_SEQUENCE = col_1_n
    for iii in 1..max_idx_par
    loop
        val_param_rep(iii) := null;
    end loop;

    logger.log_info ('v_taxp_reg.col_1_n='||to_char(v_taxp_reg.col_1_n),c_scope,v_pro_id,v_override_default,null,v_params);
    if v_taxp_reg.col_1_n is not null then

         for i in (select par,
                          val
                   from   bgo_reps_auto
                   where  session_id = v_taxp_reg.col_1_n)
         loop
            logger.log_info ('i.par='||i.par,c_scope,v_pro_id,v_override_default,null,v_params);
            logger.log_info ('A retornar idx...',c_scope,v_pro_id,v_override_default,null,v_params);
            val_param_rep(ret_idx_nome(i.par)) := i.val;
            logger.log_info ('Retorno OK...',c_scope,v_pro_id,v_override_default,null,v_params);
            act_val_vg_par_rep(ret_idx_nome(i.par));
            logger.append_param (p_params => v_params, p_name => i.par, p_val => i.val);
         end loop;
         logger.log_info ('> REPORT! (parâmetros de entrada na coluna EXTRA)',c_scope,v_pro_id,v_override_default,null,v_params);
    end if;

    logger.log_info ('BeforeReport...',c_scope,v_pro_id,v_override_default,null,v_params);
    v_BeforeReport := BeforeReport;

    logger.log_info ('Q_master_cabecalho...',c_scope,v_pro_id,v_override_default,null,v_params);
    Q_master_cabecalho;

    logger.log_info ('Q_Detail...',c_scope,v_pro_id,v_override_default,null,v_params);
    Q_Detail;

    Q_Primeira_Entrega;
    Q_Requisicoes;

    logger.log_info ('Q_Consumiveis...',c_scope,v_pro_id,v_override_default,null,v_params);
    Q_Consumiveis;
    logger.log_info ('Q1_oba_id_Detail1...',c_scope,v_pro_id,v_override_default,null,v_params);
    Q1_oba_id_Detail1;
    logger.log_info ('Q2_OBA_ID_SUO...',c_scope,v_pro_id,v_override_default,null,v_params);
    Q2_OBA_ID_SUO;
    logger.log_info ('Q3_OBA_ID_SUO3...',c_scope,v_pro_id,v_override_default,null,v_params);
    Q3_OBA_ID_SUO3;
    logger.log_info ('Q4_OBA_ID_SUO2...',c_scope,v_pro_id,v_override_default,null,v_params);
    Q4_OBA_ID_SUO2;

    commit;

    logger.log_info ('Format triggers...',c_scope,v_pro_id,v_override_default,null,v_params);
    logger.log_info ('M_G_Consumiveis_GRPFR3FormatTr...',c_scope,v_pro_id,v_override_default,null,v_params);
    M_G_Consumiveis_GRPFR3FormatTr;
    logger.log_info ('F_CS_total1FormatTrigger...',c_scope,v_pro_id,v_override_default,null,v_params);
    F_CS_total1FormatTrigger;
    logger.log_info ('M_G_Consumiveis_GRPFR4FormatTr...',c_scope,v_pro_id,v_override_default,null,v_params);
    M_G_Consumiveis_GRPFR4FormatTr;
    logger.log_info ('F_CS_total4FormatTrigger...',c_scope,v_pro_id,v_override_default,null,v_params);
    F_CS_total4FormatTrigger;

    logger.log_info ('R_G_Master_Cabecalho2FormatTri...',c_scope,v_pro_id,v_override_default,null,v_params);
    R_G_Master_Cabecalho2FormatTri;
    commit;

    logger.log_info ('F_Exterior_Outr1FormatTrigger...',c_scope,v_pro_id,v_override_default,null,v_params);
    F_Exterior_Outr1FormatTrigger;
    logger.log_info ('F_Exterior1FormatTrigger...',c_scope,v_pro_id,v_override_default,null,v_params);
    F_Exterior1FormatTrigger;

    logger.log_info ('CF_DESIG_ENTFormula...',c_scope,v_pro_id,v_override_default,null,v_params);
    CF_DESIG_ENTFormula;
    logger.log_info ('CF_Existe_SubFormula...',c_scope,v_pro_id,v_override_default,null,v_params);
    CF_Existe_SubFormula;
    logger.log_info ('CF_Existe_Sub_OutrFormula...',c_scope,v_pro_id,v_override_default,null,v_params);
    CF_Existe_Sub_OutrFormula;
    --
    -- TODO: :P_SES_ID_CUS_PE todos estes parâmetros devem não ser lidos no report... Devem ser passados ao chamar a uma função!
    --       Para ter o mesmo valor, no report e no PL/SQL
    --       É importante testar ist já, pque pode estar a funcionar indevidamente...
    --       Aliás, todos os procedimentos cá deve ser eliminados do report!
    --
    -- Fazer bkp do report, e procurar point of situ

    logger.log_info ('Fim!',c_scope,v_pro_id,v_override_default,null,v_params);

exception
when others then
   p_erro := '[UC$FAZ0080R_BLL] '||sqlerrm;
   logger.log_error (p_erro,c_scope,v_pro_id,v_override_default,null,v_params,'DSI0');
end gera_dados_report;

END UC$FAZ0080R_BLLL;
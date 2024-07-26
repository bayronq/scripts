if [ ! -d /loghist/lost+found ]
then mount 10.161.200.20:/logwas /loghist
     if [ ! -d /loghist/lost+found -a ! -f /tmp/.logs.err ]
     then echo "CRITICO: no esta montado /loghist en $hostname" | mail tic.mdsw.implementaciones@banrural.com.gt
          touch /tmp/.logs.err
     else rm -f /tmp/logs.err
     fi
fi


cd /var/logs/EEGSA
FECHA_LOG=`date +%m%d%Y`; export FECHA_LOG

cp EEGSA_Consulta_TramaReq.log /loghist/Broker7/EEGSA/Respaldo/Consulta/EEGSA_Consulta_TramaReq$FECHA_LOG.log; cat /dev/null > EEGSA_Consulta_TramaReq.log
gzip /loghist/Broker7/EEGSA/Respaldo/Consulta/EEGSA_Consulta_TramaReq$FECHA_LOG.log
cp EEGSA_Consulta_TramaResp.log /loghist/Broker7/EEGSA/Respaldo/Consulta/EEGSA_Consulta_TramaResp$FECHA_LOG.log; cat /dev/null > EEGSA_Consulta_TramaResp.log
gzip /loghist/Broker7/EEGSA/Respaldo/Consulta/EEGSA_Consulta_TramaResp$FECHA_LOG.log
cp EEGSA_Pago_TramaReq.log /loghist/Broker7/EEGSA/Respaldo/Pago/EEGSA_Pago_TramaReq$FECHA_LOG.log; cat /dev/null > EEGSA_Pago_TramaReq.log
gzip /loghist/Broker7/EEGSA/Respaldo/Pago/EEGSA_Pago_TramaReq$FECHA_LOG.log
cp EEGSA_Pago_TramaResp.log /loghist/Broker7/EEGSA/Respaldo/Pago/EEGSA_Pago_TramaResp$FECHA_LOG.log; cat /dev/null > EEGSA_Pago_TramaResp.log
gzip /loghist/Broker7/EEGSA/Respaldo/Pago/EEGSA_Pago_TramaResp$FECHA_LOG.log
cp EEGSA_Reversion_TramaReq.log /loghist/Broker7/EEGSA/Respaldo/Reverso/EEGSA_Reversion_TramaReq$FECHA_LOG.log; cat /dev/null > EEGSA_Reversion_TramaReq.log
gzip /loghist/Broker7/EEGSA/Respaldo/Reverso/EEGSA_Reversion_TramaReq$FECHA_LOG.log
cp EEGSA_Reversion_TramaResp.log /loghist/Broker7/EEGSA/Respaldo/Reverso/EEGSA_Reversion_TramaResp$FECHA_LOG.log; cat /dev/null > EEGSA_Reversion_TramaResp.log
gzip /loghist/Broker7/EEGSA/Respaldo/Reverso/EEGSA_Reversion_TramaResp$FECHA_LOG.log
cp EEGSA_PagoOffline_TramaReq.log /loghist/Broker7/EEGSA/Respaldo/PagoOffline/EEGSA_PagoOffline_TramaReq$FECHA_LOG.log; cat /dev/null > EEGSA_PagoOffline_TramaReq.log
gzip /loghist/Broker7/EEGSA/Respaldo/PagoOffline/EEGSA_PagoOffline_TramaReq$FECHA_LOG.log
cp EEGSA_PagoOffline_TramaResp.log /loghist/Broker7/EEGSA/Respaldo/PagoOffline/EEGSA_PagoOffline_TramaResp$FECHA_LOG.log; cat /dev/null > EEGSA_PagoOffline_TramaResp.log
gzip /loghist/Broker7/EEGSA/Respaldo/PagoOffline/EEGSA_PagoOffline_TramaResp$FECHA_LOG.log


cd /var/adm
cp user.log /loghist/Broker7/Userlog/user$FECHA_LOG.log; cat /dev/null > user.log
gzip /loghist/Broker7/Userlog/user$FECHA_LOG.log

#Modificado por Ing. Kevin Cruz e Ing. Diego Romero 24/06/2018
cd /var/logs/Movistar
cp Movistar_Pago_TramaReq.log /loghist/Broker7/Movistar/Respaldo/Pago/Movistar_Pago_TramaReq$FECHA_LOG.log; cat /dev/null > Movistar_Pago_TramaReq.log
chmod 777 Movistar_Pago_TramaReq.log
gzip /loghist/Broker7/Movistar/Respaldo/Pago/Movistar_Pago_TramaReq$FECHA_LOG.log
cp Movistar_Pago_TramaResp.log /loghist/Broker7/Movistar/Respaldo/Pago/Movistar_Pago_TramaResp$FECHA_LOG.log; cat /dev/null > Movistar_Pago_TramaResp.log
chmod 777 Movistar_Pago_TramaResp.log
gzip /loghist/Broker7/Movistar/Respaldo/Pago/Movistar_Pago_TramaResp$FECHA_LOG.log
cp Movistar_PrePago_TramaReq.log /loghist/Broker7/Movistar/Respaldo/PrePago/Movistar_PrePago_TramaReq$FECHA_LOG.log; cat /dev/null > Movistar_PrePago_TramaReq.log
chmod 777 Movistar_PrePago_TramaReq.log
gzip /loghist/Broker7/Movistar/Respaldo/PrePago/Movistar_PrePago_TramaReq$FECHA_LOG.log
cp Movistar_PrePago_TramaResp.log /loghist/Broker7/Movistar/Respaldo/PrePago/Movistar_PrePago_TramaResp$FECHA_LOG.log; cat /dev/null > Movistar_PrePago_TramaResp.log
chmod 777 Movistar_PrePago_TramaResp.log
gzip /loghist/Broker7/Movistar/Respaldo/PrePago/Movistar_PrePago_TramaResp$FECHA_LOG.log
cp Movistar_RevPago_TramaReq.log /loghist/Broker7/Movistar/Respaldo/ReversoPago/Movistar_RevPago_TramaReq$FECHA_LOG.log; cat /dev/null > Movistar_RevPago_TramaReq.log
chmod 777 Movistar_RevPago_TramaReq.log
gzip /loghist/Broker7/Movistar/Respaldo/ReversoPago/Movistar_RevPago_TramaReq$FECHA_LOG.log
cp Movistar_RevPago_TramaResp.log /loghist/Broker7/Movistar/Respaldo/ReversoPago/Movistar_RevPago_TramaResp$FECHA_LOG.log; cat /dev/null > Movistar_RevPago_TramaResp.log
chmod 777 Movistar_RevPago_TramaResp.log
gzip /loghist/Broker7/Movistar/Respaldo/ReversoPago/Movistar_RevPago_TramaResp$FECHA_LOG.log
cp Movistar_RevPrePago_TramaReq.log /loghist/Broker7/Movistar/Respaldo/ReversoPrepago/Movistar_RevPrePago_TramaReq$FECHA_LOG.log; cat /dev/null > Movistar_RevPrePago_TramaReq.log
chmod 777 Movistar_RevPrePago_TramaReq.log
gzip /loghist/Broker7/Movistar/Respaldo/ReversoPrepago/Movistar_RevPrePago_TramaReq$FECHA_LOG.log
cp Movistar_RevPrePago_TramaResp.log /loghist/Broker7/Movistar/Respaldo/ReversoPrepago/Movistar_RevPrePago_TramaResp$FECHA_LOG.log; cat /dev/null > Movistar_RevPrePago_TramaResp.log
chmod 777 Movistar_RevPrePago_TramaResp.log
gzip /loghist/Broker7/Movistar/Respaldo/ReversoPrepago/Movistar_RevPrePago_TramaResp$FECHA_LOG.log
cp Movistar_CnsltPago_TramaReq.log /loghist/Broker7/Movistar/Respaldo/Consulta/Movistar_CnsltPago_TramaReq$FECHA_LOG.log; cat /dev/null > Movistar_CnsltPago_TramaReq.log
chmod 777 Movistar_CnsltPago_TramaReq.log
gzip /loghist/Broker7/Movistar/Respaldo/Consulta/Movistar_CnsltPago_TramaReq$FECHA_LOG.log
cp Movistar_CnsltPago_TramaResp.log /loghist/Broker7/Movistar/Respaldo/Consulta/Movistar_CnsltPago_TramaResp$FECHA_LOG.log; cat /dev/null > Movistar_CnsltPago_TramaResp.log
chmod 777 Movistar_CnsltPago_TramaResp.log
gzip /loghist/Broker7/Movistar/Respaldo/Consulta/Movistar_CnsltPago_TramaResp$FECHA_LOG.log


echo "Inicio backup logs PTC"
cd /var/logs/PTC
cp RetiroEfectivo_Req.log /loghist/Broker7/PTC/Respaldo/RetiroEfectivo/RetiroEfectivo_Req_$FECHA_LOG.log; rm RetiroEfectivo_Req.log
gzip /loghist/Broker7/PTC/Respaldo/RetiroEfectivo/RetiroEfectivo_Req_$FECHA_LOG.log
cp RetiroEfectivo_Resp.log /loghist/Broker7/PTC/Respaldo/RetiroEfectivo/RetiroEfectivo_Resp_$FECHA_LOG.log; rm RetiroEfectivo_Resp.log
gzip /loghist/Broker7/PTC/Respaldo/RetiroEfectivo/RetiroEfectivo_Resp_$FECHA_LOG.log
cp Trama_RetiroEfectivo_Rev_Req.log /loghist/Broker7/PTC/Respaldo/RetiroEfectivoRev/RetiroEfectivo_Rev_Req_$FECHA_LOG.log; rm RetiroEfectivo_Rev_Req.log
gzip /loghist/Broker7/PTC/Respaldo/RetiroEfectivoRev/RetiroEfectivo_Rev_Req_$FECHA_LOG.log
cp Trama_RetiroEfectivo_Rev_Resp.log /loghist/Broker7/PTC/Respaldo/RetiroEfectivoRev/RetiroEfectivo_Rev_Resp_$FECHA_LOG.log; rm RetiroEfectivo_Rev_Resp.log
gzip /loghist/Broker7/PTC/Respaldo/RetiroEfectivoRev/RetiroEfectivo_Rev_Resp_$FECHA_LOG.log
echo "Se termino de realizar el backup de tramas PTC"


echo "Inicio backup logs RGP"
cd /var/logs/RGP
cp RGP_Consulta.log /loghist/Broker7/RGP/RGP_Consulta_$FECHA_LOG.log; cat /dev/null > RGP_Consulta.log
gzip /loghist/Broker7/RGP/RGP_Consulta_$FECHA_LOG.log


echo "Inicio backup logs Antecedentes Policiacos"
cd /var/logs/AntPoliciales
cp pnc_pago_req.log /loghist/Broker7/AntPoliciales/pnc_pago_req_$FECHA_LOG.log; cat /dev/null > pnc_pago_req.log
gzip /loghist/Broker7/AntPoliciales/pnc_pago_req_$FECHA_LOG.log
cp pnc_pago_resp.log /loghist/Broker7/AntPoliciales/pnc_pago_resp_$FECHA_LOG.log; cat /dev/null > pnc_pago_resp.log
gzip /loghist/Broker7/AntPoliciales/pnc_pago_resp_$FECHA_LOG.log
cp pnc_reversa_req.log /loghist/Broker7/AntPoliciales/pnc_reversa_req_$FECHA_LOG.log; cat /dev/null > pnc_reversa_req.log
gzip /loghist/Broker7/AntPoliciales/pnc_reversa_req_$FECHA_LOG.log
cp pnc_reversa_resp.log /loghist/Broker7/AntPoliciales/pnc_reversa_resp_$FECHA_LOG.log; cat /dev/null > pnc_reversa_resp.log
gzip /loghist/Broker7/AntPoliciales/pnc_reversa_resp_$FECHA_LOG.log


echo "Inicio backup logs ESB Logging"
cp /tmp/trace_error_esb_logging.log /loghist/Broker7/ESB/trace_error_esb_logging_$FECHA_LOG.log; cat /dev/null > trace_error_esb_logging.log
gzip /loghist/Broker7/ESB/trace_error_esb_logging_$FECHA_LOG.log



cp /tmp/traceCA_Resp.log /loghist/Broker7/ESB/traceCA_Resp_$FECHA_LOG.log; cat /dev/null > traceCA_Resp.log
gzip /loghist/Broker7/ESB/traceCA_Resp_$FECHA_LOG.log
echo "Finaliza backup logs ESB Logging"




echo "Inicio backup logs Energuate"
#cd /var/logs/Energuate
#cp Energuate_AppPago_Req.log /loghist/Broker7/Energuate/PagoOnline/Energuate_AppPago_Req_$FECHA_LOG.log; rm Energuate_AppPago_Req.log
#cp Energuate_AppPago_Resp.log /loghist/Broker7/Energuate/PagoOnline/Energuate_AppPago_Resp_$FECHA_LOG.log; rm  Energuate_AppPago_Resp.log
#cp Energuate_PagoDeudaBV_Req.log /loghist/Broker7/Energuate/PagoBancaVirtual/Energuate_PagoDeudaBV_Req_$FECHA_LOG.log; rm Energuate_PagoDeudaBV_Req.log
#cp Energuate_PagoDeudaBV_Resp.log /loghist/Broker7/Energuate/PagoBancaVirtual/Energuate_PagoDeudaBV_Resp_$FECHA_LOG.log; rm Energuate_PagoDeudaBV_Resp.log
#cp Energuate_POffline_Req.log /loghist/Broker7/Energuate/PagoOffline/Energuate_POffline_Req_$FECHA_LOG.log; rm Energuate_POffline_Req.log
#cp Energuate_POffline_Resp.log /loghist/Broker7/Energuate/PagoOffline/Energuate_POffline_Resp_$FECHA_LOG.log; rm Energuate_POffline_Resp.log
#cp Energuate_AppPago_Rev_Req.log /loghist/Broker7/Energuate/Reversa/Energuate_AppPago_Rev_Req_$FECHA_LOG.log; rm Energuate_AppPago_Rev_Req.log
#cp Energuate_AppPago_Rev_Resp.log /loghist/Broker7/Energuate/Reversa/Energuate_AppPago_Rev_Resp_$FECHA_LOG.log; rm Energuate_AppPago_Rev_Resp.log
#cp Energuate_ConsultaSaldo_Req.log /loghist/Broker7/Energuate/Consulta/Energuate_ConsultaSaldo_Req_$FECHA_LOG.log; rm Energuate_ConsultaSaldo_Req.log
#cp Energuate_ConsultaSaldo_Resp.log	/loghist/Broker7/Energuate/Consulta/Energuate_ConsultaSaldo_Resp_$FECHA_LOG.log; rm Energuate_ConsultaSaldo_Resp.log
#cp Energuate_ConsultaSaldosBV_Req.log /loghist/Broker7/Energuate/ConsultaBV/Energuate_ConsultaSaldosBV_Req_$FECHA_LOG.log; rm Energuate_ConsultaSaldosBV_Req.log
#cp Energuate_ConsultaSaldosBV_Resp.log /loghist/Broker7/Energuate/ConsultaBV/Energuate_ConsultaSaldosBV_Resp_$FECHA_LOG.log; rm Energuate_ConsultaSaldosBV_Resp.log
#cp Energuate_EchoBdr_Req.log /loghist/Broker7/Energuate/Eco_Bdr/Energuate_EchoBdr_Req_$FECHA_LOG.log; rm Energuate_EchoBdr_Req.log
#cp Energuate_EchoBdr_Resp.log /loghist/Broker7/Energuate/Respaldo/Eco_Bdr/Energuate_EchoBdr_Resp_$FECHA_LOG.log; rm Energuate_EchoBdr_Resp.log
#cp Energuate_Sinc_In.log /loghist/Broker7/Energuate/Respaldo/Sincronizacion/Energuate_Sinc_In_$FECHA_LOG.log; rm Energuate_Sinc_In.log
#cp Energuate_Sinc_Out.log /loghist/Broker7/Energuate/Respaldo/Sincronizacion/Energuate_Sinc_Out_$FECHA_LOG.log; rm Energuate_Sinc_Out.log
#cp Energuate_EchoEner_In.log /loghist/Broker7/Energuate/Respaldo/Eco_Energuate/Energuate_EchoEner_In_$FECHA_LOG.log; rm Energuate_EchoEner_In.log
#cp Energuate_EchoEner_Out.log /loghist/Broker7/Energuate/Respaldo/Eco_Energuate/Energuate_EchoEner_Out_$FECHA_LOG.log; rm Energuate_EchoEner_Out.log
echo "Se termino de realizar el backup de tramas Energuate"

#KC 06/03/2018
echo "Inicio de backup de Tramites"
cd /var/logs/Tramites/
cp Tramites_CreaExpGES_XmlReq.log /loghist/Broker7/Tramites/Respaldo/CreaExpGES/Tramites_CreaExpGES_XmlReq$FECHA_LOG.log; rm Tramites_CreaExpGES_XmlReq.log


#KC 13/06/2018
echo "Inicio de backup de Adventistas"
cd /var/logs/Adventistas/
cp Adventistas_Consulta_Req.log /loghist/Broker7/Adventistas/Respaldo/Adventistas_Consulta_Req$FECHA_LOG.log; rm Adventistas_Consulta_Req.log
cp Adventistas_Consulta_Resp.log /loghist/Broker7/Adventistas/Respaldo/Adventistas_Consulta_Resp$FECHA_LOG.log; rm Adventistas_Consulta_Resp.log
cp Adventistas_Pago_Req.log /loghist/Broker7/Adventistas/Respaldo/Adventistas_Pago_Req$FECHA_LOG.log; rm Adventistas_Pago_Req.log
cp Adventistas_Pago_Resp.log /loghist/Broker7/Adventistas/Respaldo/Adventistas_Pago_Resp$FECHA_LOG.log; rm Adventistas_Pago_Resp.log
cp Adventistas_Reversa_Req.log /loghist/Broker7/Adventistas/Respaldo/Adventistas_Reversa_Req$FECHA_LOG.log; rm Adventistas_Reversa_Req.log

#KC 13/06/2018
echo "Inicio de backup de Asrural"
cd /var/logs/Asrural/
cp Asrural_Consulta_Req.log /loghist/Broker7/Asrural/Respaldo/Asrural_Consulta_Req$FECHA_LOG.log; rm Asrural_Consulta_Req.log
cp Asrural_Consulta_Resp.log /loghist/Broker7/Asrural/Respaldo/Asrural_Consulta_Resp$FECHA_LOG.log; rm Asrural_Consulta_Resp.log
cp Asrural_Pago_Req.log  /loghist/Broker7/Asrural/Respaldo/Asrural_Pago_Req$FECHA_LOG.log
cp Asrural_Pago_Resp.log /loghist/Broker7/Asrural/Respaldo/Asrural_Pago_Resp$FECHA_LOG.log; rm Asrural_Pago_Resp.log
cp Asrural_Reversa_Req.log /loghist/Broker7/Asrural/Respaldo/Asrural_Reversa_Req$FECHA_LOG.log; rm Asrural_Reversa_Req.log
cp Asrural_Reversa_Resp.log /loghist/Broker7/Asrural/Respaldo/Asrural_Reversa_Resp$FECHA_LOG.log; rm Asrural_Reversa_Resp.log

#KC 13/06/2018
echo "Inicio de backup de Empagua"
cd /var/logs/Empagua/
cp Empagua_Consulta_TramaReq.log /loghist/Broker7/Empagua/Respaldo/Empagua_Consulta_TramaReq$FECHA_LOG.log; rm Empagua_Consulta_TramaReq.log
cp Empagua_Pago_TramaReq.log /loghist/Broker7/Empagua/Respaldo/Empagua_Pago_TramaReq$FECHA_LOG.log; rm Empagua_Pago_TramaReq.log
cp Empagua_Reversa_TramaReq.log /loghist/Broker7/Empagua/Respaldo/Empagua_Reversa_TramaReq$FECHA_LOG.log; rm Empagua_Reversa_TramaReq.log

#KC 13/06/2018
echo "Inicio de backup de MAGA"
cd /var/logs/MAGA/
cp MAGA_Pago_Req.log /loghist/Broker7/MAGA/Respaldo/MAGA_Pago_Req$FECHA_LOG.log; rm MAGA_Pago_Req.log
cp MAGA_Pago_Resp.log /loghist/Broker7/MAGA/Respaldo/MAGA_Pago_Resp$FECHA_LOG.log; rm MAGA_Pago_Resp.log


#Bayron Cuá 06/08/2018
echo "Backup logs ORIFLAME"
cd /var/logs/ORIFLAME
cp ORIFLAME_Pago_Req.log /loghist/Broker7/Oriflame/ORIFLAME_Pago_Req_$FECHA_LOG.log; cat /dev/null > ORIFLAME_Pago_Req.log
gzip /loghist/Broker7/Oriflame/ORIFLAME_Pago_Req_$FECHA_LOG.log
cp ORIFLAME_Pago_Resp.log /loghist/Broker7/Oriflame/ORIFLAME_Pago_Resp_$FECHA_LOG.log; cat /dev/null > ORIFLAME_Pago_Resp.log
gzip /loghist/Broker7/Oriflame/ORIFLAME_Pago_Resp_$FECHA_LOG.log
cp ORIFLAME_Consulta_Req.log /loghist/Broker7/Oriflame/ORIFLAME_Consulta_Req_$FECHA_LOG.log; cat /dev/null > ORIFLAME_Consulta_Req.log
gzip /loghist/Broker7/Oriflame/ORIFLAME_Consulta_Req_$FECHA_LOG.log
cp ORIFLAME_Consulta_Resp.log /loghist/Broker7/Oriflame/ORIFLAME_Consulta_Resp_$FECHA_LOG.log; cat /dev/null > ORIFLAME_Consulta_Resp.log
gzip /loghist/Broker7/Oriflame/ORIFLAME_Consulta_Resp_$FECHA_LOG.log
cp ORIFLAME_Reversa_Req.log /loghist/Broker7/Oriflame/ORIFLAME_Reversa_Req_$FECHA_LOG.log; cat /dev/null > ORIFLAME_Reversa_Req.log
gzip /loghist/Broker7/Oriflame/ORIFLAME_Reversa_Req_$FECHA_LOG.log
cp ORIFLAME_Reversa_Resp.log /loghist/Broker7/Oriflame/ORIFLAME_Reversa_Resp_$FECHA_LOG.log; cat /dev/null > ORIFLAME_Reversa_Resp.log
gzip /loghist/Broker7/Oriflame/ORIFLAME_Reversa_Resp_$FECHA_LOG.log

#DR 03/12/2018
echo "Inicio de backup de Remesas Familiares TNC"
cd /var/logs/TNC/
cp ConfirmacionYPagoTNC_Req.log /loghist/Broker7/TNC/ConfirmacionYPagoTNC_Req$FECHA_LOG.log; rm ConfirmacionYPagoTNC_Req.log
cp ConfirmacionYPagoTNC_Resp.log /loghist/Broker7/TNC/ConfirmacionYPagoTNC_Resp$FECHA_LOG.log; rm ConfirmacionYPagoTNC_Resp.log
cp ConsultaTNC_Req.log /loghist/Broker7/TNC/ConsultaTNC_Req$FECHA_LOG.log; rm ConsultaTNC_Req.log
cp ConsultaTNC_Resp.log /loghist/Broker7/TNC/ConsultaTNC_Resp$FECHA_LOG.log; rm ConsultaTNC_Resp.log
cp ReversaTNC_Req.log /loghist/Broker7/TNC/ReversaTNC_Req$FECHA_LOG.log; rm ReversaTNC_Req.log
cp ReversaTNC_Resp.log /loghist/Broker7/TNC/ReversaTNC_Resp$FECHA_LOG.log; rm ReversaTNC_Resp.log
cp sp_carga_nueva_remesa_tnc_consulta.log /loghist/Broker7/TNC/sp_carga_nueva_remesa_tnc_consulta$FECHA_LOG.log; rm sp_carga_nueva_remesa_tnc_consulta.log





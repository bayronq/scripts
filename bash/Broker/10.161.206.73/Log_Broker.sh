#Script que realiza el backup diario de logs del BUS 
#Realizado por Bayron Cua
#Modificación 07/10/2020, se agrego logs de OJFEI, ACH, RGP, Emetra



#if [ ! -d /loghist/lost+found ]
#then mount 10.161.200.20:/logwas /loghist
#then mount 10.160.255.36:/nfs/MANTENIMIENTO /loghist
#     if [ ! -d /loghist/lost+found -a ! -f /tmp/.logs.err ]
#     then echo "CRITICO: no esta montado /loghist en $hostname" | mail tic.mdsw.implementaciones@banrural.com.gt
 #         touch /tmp/.logs.err
 #    else cat /dev/null > -f /tmp/logs.err
  #   fi
#fi

#Variables
logs=/loghist/BUS10
FECHA_LOG=`date +%Y%m%d`; export FECHA_LOG
local=/var/logs


echo "Inicio backup logs ESB Logging"
cp /tmp/trace_error_esb_logging.log /loghist/BUS10/ESB/trace_error_esb_logging_73_$FECHA_LOG.log; cat /dev/null > trace_error_esb_logging.log

cd /var/adm
cp user.log /loghist/BUS10/Userlog/user_73_$FECHA_LOG.log; cat /dev/null > user.log

echo "Inicio de backup de OJFEI"
cd /var/logs/OJFEI/
cd antecedentes
cp OJFEI_Req.log /loghist/BUS10/OJFEI/IIBNODE1/OJFEI_Req_$FECHA_LOG.log; cat /dev/null > OJFEI_Req.log
cp OJFEI_Resp.log /loghist/BUS10/OJFEI/IIBNODE1/OJFEI_Resp_$FECHA_LOG.log; cat /dev/null > OJFEI_Resp.log
cd ../Depositos
cp DepositosFEI.log $logs/OJFEI/IIBNODE1/DepositosFEI_$FECHA_LOG.log; cat /dev/null > DepositosFEI.log
cd ../PensionesAlimenticias
cp Pago.log $logs/OJFEI/IIBNODE1/Pago_$FECHA_LOG.log; cat /dev/null > Pago.log


echo "Inicio de backup de Adventistas"
cd /var/logs/Adventistas/
cp Adventistas_Consulta_Req.log /loghist/BUS10/Adventistas/Adventistas_Consulta_Req_73_$FECHA_LOG.log; cat /dev/null > Adventistas_Consulta_Req.log
cp Adventistas_Consulta_Resp.log /loghist/BUS10/Adventistas/Adventistas_Consulta_Resp_73_$FECHA_LOG.log; cat /dev/null > Adventistas_Consulta_Resp.log
cp Adventistas_Pago_Req.log /loghist/BUS10/Adventistas/Adventistas_Pago_Req_73_$FECHA_LOG.log; cat /dev/null > Adventistas_Pago_Req.log
cp Adventistas_Pago_Resp.log /loghist/BUS10/Adventistas/Adventistas_Pago_Resp_73_$FECHA_LOG.log; cat /dev/null > Adventistas_Pago_Resp.log
cp Adventistas_Reversa_Req.log /loghist/BUS10/Adventistas/Adventistas_Reversa_Req_73_$FECHA_LOG.log; cat /dev/null > Adventistas_Reversa_Req.log

echo "Inicio backup de MinecoRGM"
cd /var/logs/MinecoRGM
cp MinecoRGM_Consulta_Req.log /loghist/BUS10/MinecoRGM/MinecoRGM_Consulta_Req_73_$FECHA_LOG.log; cat /dev/null > MinecoRGM_Consulta_Req.log
cp MinecoRGM_Consulta_Resp.log /loghist/BUS10/MinecoRGM/MinecoRGM_Consulta_Resp_73_$FECHA_LOG.log; cat /dev/null > MinecoRGM_Consulta_Resp.log
cp MinecoRGM_Pago_Req.log /loghist/BUS10/MinecoRGM/MinecoRGM_Pago_Req_73_$FECHA_LOG.log; cat /dev/null > MinecoRGM_Pago_Req.log
cp MinecoRGM_Pago_Resp.log /loghist/BUS10/MinecoRGM/MinecoRGM_Pago_Resp_73_$FECHA_LOG.log; cat /dev/null > MinecoRGM_Pago_Resp.log
cp MinecoRGM_Reversa_Req.log /loghist/BUS10/MinecoRGM/MinecoRGM_Reversa_Req_73_$FECHA_LOG.log; cat /dev/null > MinecoRGM_Reversa_Req.log
cp MinecoRGM_Reversa_Resp.log /loghist/BUS10/MinecoRGM/MinecoRGM_Reversa_Resp_73_$FECHA_LOG.log; cat /dev/null > MinecoRGM_Reversa_Resp.log

echo "Inicio backup de Tramites"
cd /var/logs/Tramites
cp Tramites_CreaExpGES_XmlReq.log /loghist/BUS10/Tramites/Tramites_CreaExpGES_XmlReq_73_$FECHA_LOG.log; cat /dev/null > Tramites_CreaExpGES_XmlReq.log
cp Tramites_consultaPreCREDITPRO_XmlReq_Desa.log /loghist/BUS10/Tramites/Tramites_consultaPreCREDITPRO_XmlReq_Desa_73_$FECHA_LOG.log; cat /dev/null > Tramites_consultaPreCREDITPRO_XmlReq_Desa.log
cp Tramites_consultaPreCREDITPRO_XmlReq.log /loghist/BUS10/Tramites/Tramites_consultaPreCREDITPRO_XmlReq_73_$FECHA_LOG.log; cat /dev/null > Tramites_consultaPreCREDITPRO_XmlReq.log

echo "Inicio de backup de Remesas Familiares TNC"
cd /var/logs/TNC/
cp ConfirmacionYPagoTNC_Req.log /loghist/BUS10/TNC/ConfirmacionYPagoTNC_Req_73_$FECHA_LOG.log; cat /dev/null > ConfirmacionYPagoTNC_Req.log
cp ConfirmacionYPagoTNC_Resp.log /loghist/BUS10/TNC/ConfirmacionYPagoTNC_Resp73_$FECHA_LOG.log; cat /dev/null > ConfirmacionYPagoTNC_Resp.log
cp ConsultaTNC_Req.log /loghist/BUS10/TNC/ConsultaTNC_Req_73_$FECHA_LOG.log; cat /dev/null > ConsultaTNC_Req.log
cp ConsultaTNC_Resp.log /loghist/BUS10/TNC/ConsultaTNC_Resp_73_$FECHA_LOG.log; cat /dev/null > ConsultaTNC_Resp.log
cp ReversaTNC_Req.log /loghist/BUS10/TNC/ReversaTNC_Req_73_$FECHA_LOG.log; cat /dev/null > ReversaTNC_Req.log
cp ReversaTNC_Resp.log /loghist/BUS10/TNC/ReversaTNC_Resp_73_$FECHA_LOG.log; cat /dev/null > ReversaTNC_Resp.log
cp sp_carga_nueva_remesa_tnc_consulta.log /loghist/BUS10/TNC/sp_carga_nueva_remesa_tnc_consulta_73_$FECHA_LOG.log; cat /dev/null > sp_carga_nueva_remesa_tnc_consulta.log
cp wsconsultarem.log /loghist/BUS10/TNC/wsconsultarem_73_$FECHA_LOG.log; cat /dev/null > wsconsultarem.log
cp wspagorem.log /loghist/BUS10/TNC/wsconsultarem_73_$FECHA_LOG.log; cat /dev/null > wsconsultarem.log

#echo "Inicio de backup de Asrural"
#cd /var/logs/Asrural/
#cp Asrural_Consulta_Req.log /loghist/BUS10/Asrural/Asrural_Consulta_Req_73_$FECHA_LOG.log; rm Asrural_Consulta_Req.log
#cp Asrural_Consulta_Resp.log /loghist/BUS10/Asrural/Asrural_Consulta_Resp_73_$FECHA_LOG.log; rm Asrural_Consulta_Resp.log
#cp Asrural_Pago_Req.log  /loghist/BUS10/Asrural/Asrural_Pago_Req_73_$FECHA_LOG.log; rm Asrural_Pago_Req.log
#cp Asrural_Pago_Resp.log /loghist/BUS10/Asrural/Asrural_Pago_Resp_73_$FECHA_LOG.log; rm Asrural_Pago_Resp.log
#cp Asrural_Reversa_Req.log /loghist/BUS10/Asrural/Asrural_Reversa_Req_73_$FECHA_LOG.log; rm Asrural_Reversa_Req.log
#cp Asrural_Reversa_Resp.log /loghist/BUS10/Asrural/Asrural_Reversa_Resp_73_$FECHA_LOG.log; rm Asrural_Reversa_Resp.log

echo "Inicio de backup de ColegioVeterinarios"
cd /var/logs/ColegioVeterinarios/
cp CMVZ_Consulta_Req.log /loghist/BUS10/ColegioVeterinarios/CMVZ_Consulta_Req_73_$FECHA_LOG.log; cat /dev/null > CMVZ_Consulta_Req.log
cp CMVZ_Consulta_Resp.log /loghist/BUS10/ColegioVeterinarios/CMVZ_Consulta_Resp_73_$FECHA_LOG.log; cat /dev/null > CMVZ_Consulta_Resp.log
cp CMVZ_Pago_Req.log /loghist/BUS10/ColegioVeterinarios/CMVZ_Pago_Req_73_$FECHA_LOG.log; cat /dev/null > CMVZ_Pago_Req.log
cp CMVZ_Pago_Resp.log /loghist/BUS10/ColegioVeterinarios/CMVZ_Pago_Resp_73_$FECHA_LOG.log; cat /dev/null > CMVZ_Pago_Resp.log
cp CMVZ_Reversa_Req.log /loghist/BUS10/ColegioVeterinarios/CMVZ_Reversa_Req_73_$FECHA_LOG.log; cat /dev/null > CMVZ_Reversa_Req.log
cp CMVZ_Reversa_Resp.log /loghist/BUS10/ColegioVeterinarios/CMVZ_Reversa_Resp_73_$FECHA_LOG.log; cat /dev/null > CMVZ_Reversa_Resp.log

echo "Inicio de backup de SAT"
cd /var/logs/SAT/
cp declaraguate.log /loghist/BUS10/SAT/Respaldo/Declaraguate_73_$FECHA_LOG.log; cat /dev/null > declaraguate.log

echo "Creando backups de logs de ADAP"
cd /var/logs/ADAP
find . -mtime +1 -type d -exec /usr/scripts/mvadap.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

echo "Creando backup de logs Sicoin"
cd /var/logs/Sicoin/mqsibackout
find . -mtime +1 -exec /usr/scripts/mvsicoin.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;
cd /var/logs/Sicoin
cp ErroresRespuestaSICOIN.log $logs/Sicoin/ErroresRespuestaSICOIN_73_$FECHA_LOG.log; cat /dev/null > ErroresRespuestaSICOIN.log
cp Sicoin_RESP.log $logs/Sicoin/Sicoin_RESP_73_$FECHA_LOG.log; cat /dev/null > Sicoin_RESP.log
cp Sicoin_RESP1.log $logs/Sicoin/Sicoin_RESP1_73_$FECHA_LOG.log; cat /dev/null > Sicoin_RESP1.log

echo "Creando backup de logs UPANA"
cd /var/logs/UPANA
cp ConsultaMensualidades.log $logs/UPANA/ConsultaMensualidades_73_$FECHA_LOG.log; cat /dev/null > ConsultaMensualidades.log
cp ConsultaObligatorios.log $logs/UPANA/ConsultaObligatorios_73_$FECHA_LOG.log; cat /dev/null > ConsultaObligatorios.log
cp PagoMensualidades.log $logs/UPANA/PagoMensualidades_73_$FECHA_LOG.log; cat /dev/null > PagoMensualidades.log
cp PagoObligatorio.log $logs/UPANA/PagoObligatorio_73_$FECHA_LOG.log; cat /dev/null > PagoObligatorio.log
cp ReversaMensualidades.log $logs/UPANA/ReversaMensualidades_73_$FECHA_LOG.log; cat /dev/null > ReversaMensualidades.log
cp ReversaObligatorios.log $logs/UPANA/ReversaObligatorios_73_$FECHA_LOG.log; cat /dev/null > ReversaObligatorios.log

echo "Creando backup de logs Transferencias_Electronicas_Masivas"
cd /var/logs/Transferencias_Electronicas_Masivas
find . -mtime +1 -type d -exec /usr/scripts/mvtransferencias.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;
 
echo "Creando backup de logs RPI"
cd /var/logs/RPI
cp Consulta.log $logs/RPI/Consulta_73_$FECHA_LOG.log; cat /dev/null > Consulta.log
cp Pago.log $logs/RPI/Pago_73_$FECHA_LOG.log; cat /dev/null > Pago.log

echo "Creando backup de logs Rgp"
cd /var/logs/RGP
cp Cnslt_CertifHonorarios.log $logs/RGP/Cnslt_CertifHonorarios_73_$FECHA_LOG.log; cat /dev/null > Cnslt_CertifHonorarios.log
cp Pago_CertifHonorarios.log $logs/RGP/Pago_CertifHonorarios_73_$FECHA_LOG.log; cat /dev/null > Pago_CertifHonorarios.log
cp Pago_CnsltaDistancia.log $logs/RGP/Pago_CnsltaDistancia_73_$FECHA_LOG.log; cat /dev/null > Pago_CnsltaDistancia.log
cp Reversa_CertifHonorario.log $logs/RGP/Reversa_CertifHonorario$FECHA_LOG.log; cat /dev/null > Reversa_CertifHonorario.log
cp Reversa_CnsltaDistancia.log $logs/RGP/Reversa_CnsltaDistancia$FECHA_LOG.log; cat /dev/null > Reversa_CnsltaDistancia.log


echo "Creando backup logs TransNetwork"
cd /var/logs/TransNetwork
cp sp_tnc_reversapush.log /loghist/BUS10/TransNetwork/IIBNODE1/sp_tnc_reversapush_73_$FECHA_LOG.log; cat /dev/null > sp_tnc_reversapush.log
cp sp_tnc_liveservice.log /loghist/BUS10/TransNetwork/IIBNODE1/sp_tnc_liveservice_73_$FECHA_LOG.log; cat /dev/null > sp_tnc_liveservice.log
cp ReversaPush_REQ.log /loghist/BUS10/TransNetwork/IIBNODE1/ReversaPush_REQ_73_$FECHA_LOG.log; cat /dev/null > ReversaPush_REQ.log
cp sp_tnc_confirmapush.log /loghist/BUS10/TransNetwork/IIBNODE1/sp_tnc_confirmapush_73_$FECHA_LOG.log; cat /dev/null > sp_tnc_confirmapush.log
cp ReversaPush_RESP.log /loghist/BUS10/TransNetwork/IIBNODE1/ReversaPush_RESP_73_$FECHA_LOG.log; cat /dev/null > ReversaPush_RESP.log
cp LiveService_RESP.log /loghist/BUS10/TransNetwork/IIBNODE1/LiveService_RESP_73_$FECHA_LOG.log; cat /dev/null > LiveService_RESP.log
cp LiveService_REQ.log /loghist/BUS10/TransNetwork/IIBNODE1/LiveService_REQ_73_$FECHA_LOG.log; cat /dev/null > LiveService_REQ.log
cp ConfirmaPush_RESP.log /loghist/BUS10/TransNetwork/IIBNODE1/ConfirmaPush_RESP_73_$FECHA_LOG.log; cat /dev/null > ConfirmaPush_RESP.log
cp ConfirmaPush_REQ.log /loghist/BUS10/TransNetwork/IIBNODE1/ConfirmaPush_REQ_73_$FECHA_LOG.log; cat /dev/null > ConfirmaPush_REQ.log


echo "Creando backups de logs de SIB"
cd /var/logs/SIB
find . -mtime +1 -type d -exec /usr/scripts/mvsib.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

echo "Creando backups de logs de ACH"
cd /var/logs/ACH
find . -mtime +1 -type d -exec /usr/scripts/mvach.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

echo "Inicio backup logs PTC"
cd /var/logs/PTC
cp ConsultaSaldos1.log /loghist/BUS10/PTC/IIBNODE1/ConsultaSaldos1_$FECHA_LOG.log; cat /dev/null > ConsultaSaldos1.log
cp ConsultaSaldos2.log /loghist/BUS10/PTC/IIBNODE1/ConsultaSaldos2_$FECHA_LOG.log; cat /dev/null > ConsultaSaldos2.log
cp ConsultaSaldos3.log /loghist/BUS10/PTC/IIBNODE1/ConsultaSaldos3_$FECHA_LOG.log; cat /dev/null > ConsultaSaldos3.log
cp ConsultaEnteIR.log /loghist/BUS10/PTC/IIBNODE1/ConsultaEnteIR_$FECHA_LOG.log; cat /dev/null > ConsultaEnteIR.log
cp RespuestaExtAutogestionConsultaInfo.log /loghist/BUS10/PTC/IIBNODE1/RespuestaExtAutogestionConsultaInfo_$FECHA_LOG.log; cat /dev/null > RespuestaExtAutogestionConsultaInfo.log
cp RespConsultaCuotasAutogestion.log /loghist/BUS10/PTC/IIBNODE1/RespConsultaCuotasAutogestion_$FECHA_LOG.log; cat /dev/null > RespConsultaCuotasAutogestion.log
cp TimeOut.log /loghist/BUS10/PTC/IIBNODE1/TimeOut_$FECHA_LOG.log; cat /dev/null > TimeOut.log
cat /dev/null > Error.log
find . -mtime +1 -type d -exec /usr/scripts/mvPTC.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;


echo "Se termino de realizar el backup de tramas PTC"

echo "Creando backups de logs de EEGSA"
cd /var/logs/EEGSA
cp EEGSA_Consulta_TramaReq.log /loghist/Broker7/EEGSA/Respaldo/Consulta/EEGSA_Consulta_TramaReq$FECHA_LOG.log; cat /dev/null > EEGSA_Consulta_TramaReq.log
cp EEGSA_Consulta_TramaResp.log /loghist/BUS10/EEGSA/Consulta/EEGSA_Consulta_TramaResp$FECHA_LOG.log; cat /dev/null > EEGSA_Consulta_TramaResp.log
cp EEGSA_Pago_TramaReq.log /loghist/BUS10/EEGSA/Pago/EEGSA_Pago_TramaReq$FECHA_LOG.log; cat /dev/null > EEGSA_Pago_TramaReq.log
cp EEGSA_Pago_TramaResp.log /loghist/BUS10/EEGSA/Pago/EEGSA_Pago_TramaResp$FECHA_LOG.log; cat /dev/null > EEGSA_Pago_TramaResp.log
cp EEGSA_Reversion_TramaReq.log /loghist/BUS10/EEGSA/Reverso/EEGSA_Reversion_TramaReq$FECHA_LOG.log; cat /dev/null > EEGSA_Reversion_TramaReq.log
cp EEGSA_Reversion_TramaResp.log /loghist/BUS10/EEGSA/Reverso/EEGSA_Reversion_TramaResp$FECHA_LOG.log; cat /dev/null > EEGSA_Reversion_TramaResp.log
cp EEGSA_PagoOffline_TramaReq.log /loghist/BUS10/EEGSA/PagoOffline/EEGSA_PagoOffline_TramaReq$FECHA_LOG.log; cat /dev/null > EEGSA_PagoOffline_TramaReq.log
cp EEGSA_PagoOffline_TramaResp.log /loghist/BUS10/EEGSA/PagoOffline/EEGSA_PagoOffline_TramaResp$FECHA_LOG.log; cat /dev/null > EEGSA_PagoOffline_TramaResp.log

#Bayron Cua
echo "Inicio backup de SIB"
cd /var/logs
cp ConsultaRespuestaSIB.log /loghist/BUS10/SIB/ConsultaRespuestaSIB_73_$FECHA_LOG.log; cat /dev/null > ConsultaRespuestaSIB.log
cp ConsultaSibMapping.log /loghist/BUS10/SIB/ConsultaSibMapping_73_$FECHA_LOG.log; cat /dev/null > ConsultaSibMapping.log
cp AsociarCuentas.log /loghist/BUS10/SIB/AsociarCuentas_73_$FECHA_LOG.log; cat /dev/null > AsociarCuentas.log
cp ConsultaSIBCompute.log /loghist/BUS10/SIB/ConsultaSIBCompute_73_$FECHA_LOG.log; cat /dev/null > ConsultaSIBCompute.log
cp PreconsultaCompute.log /loghist/BUS10/SIB/PreconsultaCompute_73_$FECHA_LOG.log; cat /dev/null > PreconsultaCompute.log
cp PreConsultaRespuestaSIB.log /loghist/BUS10/SIB/PreConsultaRespuestaSIB_73_$FECHA_LOG.log; cat /dev/null > PreConsultaRespuestaSIB.log
cp PreconsultaSibMapping.log /loghist/BUS10/SIB/PreconsultaSibMapping_73_$FECHA_LOG.log; cat /dev/null > PreconsultaSibMapping.log

#Bayron Cua
echo "Inicio backup de Citi"
cd /var/logs/Citi/Speedcollect
cp Consulta.log /loghist/BUS10/Citi/Speedcollect/Consulta_73_$FECHA_LOG.log; cat /dev/null > Consulta.log
cp Pago.log /loghist/BUS10/Citi/Speedcollect/Pago_73_$FECHA_LOG.log; cat /dev/null > Pago.log
cp Reversa.log /loghist/BUS10/Citi/Speedcollect/Reversa_73_$FECHA_LOG.log; cat /dev/null > Reversa.log

#Bayron Cua
echo "Creando backups de logs de BDG"
cd /var/logs/BDG
find . -mtime +1 -type d -exec /usr/scripts/mvbdg.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

#Bayron Cua
echo "Creando backups de logs de FRI"
cd /var/logs/FRI
find . -mtime +1 -type d -exec /usr/scripts/mvfri.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

#Bayron Cua
echo "Creando backups de logs de GEKO"
cd /var/logs/GEKO
find . -mtime +1 -type d -exec /usr/scripts/mvgeko.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

#Bayron Cua
echo "Creando backups de logs de IVR"
cd /var/logs/IVR
find . -mtime +1 -type d -exec /usr/scripts/mvivr.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

#Bayron Cua
echo "Creando backup Genesis Empresarial"
cd /var/logs/GenesisEmp
cp GenesisEmp_Consulta.log $logs/GensisEmp/IBBNode1/GenesisEmp_Consulta$FECHA_LOG.log; cat /dev/null > GenesisEmp_Consulta.log
cp GenesisEmp_Pago.log $logs/GensisEmp/IBBNode1/GenesisEmp_Pago$FECHA_LOG.log; cat /dev/null > GenesisEmp_Pago.log
cp GenesisEmp_Reversa.log $logs/GensisEmp/IBBNode1/GenesisEmp_Reversa$FECHA_LOG.log; cat /dev/null > GenesisEmp_Reversa.log


#Bayron Cuá 02/08/2021
echo "Creando backup Antecedentes Policiacos"
cd /var/logs/AntPoliciales
cp pnc_pago_req.log $logs/AntPoliciales/IIBNODE1/pnc_pago_req$FECHA_LOG.log; cat /dev/null > pnc_pago_req.log
cp pnc_pago_resp.log $logs/AntPoliciales/IIBNODE1/pnc_pago_resp$FECHA_LOG.log; cat /dev/null > pnc_pago_resp.log
cp pnc_reversa_resp.log $logs/AntPoliciales/IIBNODE1/pnc_reversa_resp$FECHA_LOG.log; cat /dev/null > pnc_reversa_resp.log
cp pnc_reversa_req.log $logs/AntPoliciales/IIBNODE1/pnc_reversa_req$FECHA_LOG.log; cat /dev/null > pnc_reversa_req.log

echo "Inicio backup logs IV-R"
cd /var/logs/IV-R
cp IV-R.log $logs/IV-R/IIBNOED1/IV-R_$FECHA_LOG.log; cat /dev/null > IV-R.log
cp "mensajes de entrada.log" $logs/IV-R/IIBNODE1/"mensajes de entrada.log"_$FECHA_LOG.log; cat /dev/null > "mensajes de entrada.log"
cp proxy.log $logs/IV-R/IIBNOED1/proxy_$FECHA_LOG.log; cat /dev/null > proxy.log


echo "Inicio Backup Empagua"
cd /var/logs/Empagua
cp Empagua_Pago_TramaReq.log $logs/Empagua/IIBNODE1/Empagua_Pago_TramaReq_$FECHA_LOG.log; cat /dev/null > Empagua_Pago_TramaReq.log
cp Empagua_Consulta_TramaReq.log $logs/Empagua/IIBNODE1/Empagua_Consulta_TramaReq_$FECHA_LOG.log; cat /dev/null > Empagua_Consulta_TramaReq.log
cp Empagua_Reversa_TramaReq.log $logs/Empagua/IIBNODE1/Empagua_Reversa_TramaReq_$FECHA_LOG.log; cat /dev/null > Empagua_Reversa_TramaReq.log
cp Respuesta.log $logs/Empagua/IIBNODE1/Respuesta_$FECHA_LOG.log; cat /dev/null > Respuesta.log

#NO ESTA ACTIVO EN EL 73
echo "Creando backup logs MDG"
cd /var/logs/MDG
cp CreaModificaCliente.log /loghist/BUS10/MDG/IIBNODE1/CreaModificaCliente_73_$FECHA_LOG.log; cat /dev/null > CreaModificaCliente.log
cp ReplicacionASE.log /loghist/BUS10/MDG/IIBNODE1/ReplicacionASE_73_$FECHA_LOG.log; cat /dev/null > ReplicacionASE.log
cp ValidaCliente_REST.log /loghist/BUS10/MDG/IIBNODE1/ValidaCliente_REST_73_$FECHA_LOG.log; cat /dev/null > ValidaCliente_REST.log
cp CreaModifica_REST.log /loghist/BUS10/MDG/IIBNODE1/CreaModifica_REST_73_$FECHA_LOG.log; cat /dev/null > CreaModifica_REST.log
cp CreaModifica_RESTJSON.log /loghist/BUS10/MDG/IIBNODE1/CreaModifica_RESTJSON_73_$FECHA_LOG.log; cat /dev/null > CreaModifica_RESTJSON.log
cp ReplicacionPTC.log /loghist/BUS10/MDG/IIBNODE1/ReplicacionPTC_73_$FECHA_LOG.log; cat /dev/null > ReplicacionPTC.log


echo "Creando backup logs Remesas"
cd /var/logs/
cp RemesasNuevasAntesSP.log /loghist/BUS10/Remesas/IIBNODE1/CRemesasNuevasAntesSP_73_$FECHA_LOG.log; cat /dev/null > RemesasNuevasAntesSP.log
cp RemesasNuevasDespuesSP.log /loghist/BUS10/Remesas/IIBNODE1/RemesasNuevasDespuesSP_73_$FECHA_LOG.log; cat /dev/null > RemesasNuevasDespuesSP.log
cp RemesasAntesSP.log /loghist/BUS10/Remesas/IIBNODE1/RemesasAntesSP_73_$FECHA_LOG.log; cat /dev/null > RemesasAntesSP.log
cp RemesasDespuesSP.log /loghist/BUS10/Remesas/IIBNODE1/RemesasDespuesSP_73_$FECHA_LOG.log; cat /dev/null > RemesasDespuesSP.log

echo "Creando backup logs UREGIONAL"
cd /var/logs/UREGIONAL
cp UREGIONAL_Reversa.log /loghist/BUS10/UREGIONAL/IIBNODE1/UREGIONAL_Reversa_73_$FECHA_LOG.log; cat /dev/null > UREGIONAL_Reversa.log
cp UREGIONAL_Pago.log /loghist/BUS10/UREGIONAL/IIBNODE1/UREGIONAL_Pago_73_$FECHA_LOG.log; cat /dev/null > UREGIONAL_Pago.log
cp UREGIONAL_Consulta.log /loghist/BUS10/UREGIONAL/IIBNODE1/UREGIONAL_Consulta_73_$FECHA_LOG.log; cat /dev/null > UREGIONAL_Consulta.log

echo "Creando backup logs UPANACEP"
cd /var/logs/UPANACEP
cp UPANACEP_Pago.log /loghist/BUS10/UPANACEP/IIBNODE1/UPANACEP_Pago_73_$FECHA_LOG.log; cat /dev/null > UPANACEP_Pago.log
cp UPANACEP_Consulta.log /loghist/BUS10/UPANACEP/IIBNODE1/UPANACEP_Consulta_73_$FECHA_LOG.log; cat /dev/null > UPANACEP_Consulta.log

echo "Inicio backup de RGAE"
cd /var/logs/RGAE
cp RGAE_Consulta.log /loghist/BUS10/RGAE/RGAE_Consulta_73_$FECHA_LOG.log; cat /dev/null > RGAE_Consulta.log
cp RGAE_Pago.log /loghist/BUS10/RGAE/RGAE_Pago_73_$FECHA_LOG.log; cat /dev/null > RGAE_Pago.log
cp RGAE_Reversa.log /loghist/BUS10/RGAE/RGAE_Reversa_73_$FECHA_LOG.log; cat /dev/null > RGAE_Reversa.log

echo "Creando backup de logs Oriflame_Generico"
cd /var/logs/Oriflame_Generico
cp ORIFLAME_GENERICO_Consulta.log /loghist/Oriflame_Generico/IIBNODE1/ORIFLAME_GENERICO_Consulta_73_$FECHA_LOG.log; cat /dev/null > ORIFLAME_GENERICO_Consulta.log
cp ORIFLAME_GENERICO_Pago.log /loghist/Oriflame_Generico/IIBNODE1/ORIFLAME_GENERICO_Pago_73_$FECHA_LOG.log; cat /dev/null > ORIFLAME_GENERICO_Pago.log

echo "Creando backup de logs ORIFLAME"
cd /var/logs/ORIFLAME
cp ORIFLAME_Consulta_Req.log /loghist/Oriflame/IIBNODE1/ORIFLAME_Consulta_Req_73_$FECHA_LOG.log; cat /dev/null > ORIFLAME_Consulta_Req.log
cp ORIFLAME_Consulta_Resp.log /loghist/Oriflame/IIBNODE1/ORIFLAME_Consulta_Resp_73_$FECHA_LOG.log; cat /dev/null > ORIFLAME_Consulta_Resp.log
cp ORIFLAME_Pago_Req.log /loghist/Oriflame/IIBNODE1/ORIFLAME_Pago_Req_73_$FECHA_LOG.log; cat /dev/null > ORIFLAME_Pago_Req.log
cp ORIFLAME_Pago_Resp.log /loghist/Oriflame/IIBNODE1/ORIFLAME_Pago_Resp_73_$FECHA_LOG.log; cat /dev/null > ORIFLAME_Pago_Resp.log
cp ORIFLAME_Reversa_Req.log /loghist/Oriflame/IIBNODE1/ORIFLAME_Reversa_Req_73_$FECHA_LOG.log; cat /dev/null > ORIFLAME_Reversa_Req.log
cp ORIFLAME_Reversa_Resp.log /loghist/Oriflame/IIBNODE1/ORIFLAME_Reversa_Resp_73_$FECHA_LOG.log; cat /dev/null > ORIFLAME_Reversa_Resp.log

echo "Creando backup de logs MCC"
cd /var/logs/MCC
find . -mtime +1 -exec /usr/scripts/mvMCC.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

echo "Inicio backup de MAGA"
cd /var/logs/MAGA
cp MAGA_Pago_Req.log /loghist/BUS10/MAGA/MAGA_Pago_Req_73_$FECHA_LOG.log; cat /dev/null > MAGA_Pago_Req.log
cp MAGA_Pago_Resp.log /loghist/BUS10/MAGA/MAGA_Pago_Resp_73_$FECHA_LOG.log; cat /dev/null > MAGA_Pago_Resp.log
cp MAGA_Pago_Resp1.log /loghist/BUS10/MAGA/MAGA_Pago_Resp1_73_$FECHA_LOG.log; cat /dev/null > MAGA_Pago_Resp1.log

echo "Creando backup de logs HuellaCliente"
cd /var/logs/HuellaCliente
find . -mtime +1 -exec /usr/scripts/mvhuellac.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

echo "Creando backup de logs Gestor"
cd /var/logs/Gestor
find . -mtime +1 -exec /usr/scripts/mvGestor.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;


echo "Creando backups de logs de Emetra"
cd /var/logs/Emetra
cp Emetra_Reversa_TramaResp.log /loghist/BUS10/Emetra/Emetra_Reversa_TramaResp_$FECHA_LOG.log; cat /dev/null > Emetra_Reversa_TramaResp.log
cp Emetra_Reversa_TramaReq.log /loghist/BUS10/Emetra/Emetra_Reversa_TramaReq_$FECHA_LOG.log; cat /dev/null > Emetra_Reversa_TramaReq.log
cp Emetra_Pago_TramaResp.log /loghist/BUS10/Emetra/Emetra_Pago_TramaResp_$FECHA_LOG.log; cat /dev/null > Emetra_Pago_TramaResp.log
cp Emetra_Pago_TramaReq.log /loghist/BUS10/Emetra/Emetra_Pago_TramaReq_$FECHA_LOG.log; cat /dev/null > Emetra_Pago_TramaReq.log
cp Emetra_Consulta_TramaResp.log /loghist/BUS10/Emetra/Emetra_Consulta_TramaResp_$FECHA_LOG.log; cat /dev/null > Emetra_Consulta_TramaResp.log
cp Emetra_Consulta_TramaReq.log /loghist/BUS10/Emetra/Emetra_Consulta_TramaReq_$FECHA_LOG.log; cat /dev/null > Emetra_Consulta_TramaReq.log

echo "Creando backup de logs BV"
cd /var/logs/BV
find . -mtime +1 -exec /usr/scripts/mvBV.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

echo "Creando backup de logs DepositoElectronico"
cd /var/logs/DepositoElectronico
find . -mtime +1 -exec /usr/scripts/mvDepositoElectronico.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

echo "Creando backup de logs Consulta_SIB"
cd /var/logs/Consulta_SIB
find . -mtime +1 -exec /usr/scripts/mvconsib.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

echo "Creando backups de logs de ColegioEconomicas"
cd /var/logs/ColegioEconomicas
cp PagoColegiaturas.log /loghist/Broker10/ColegioEconomicas/PagoColegiaturas_$FECHA_LOG.log; cat /dev/null > PagoColegiaturas.log
cp ConsultaColegiaturas.log /loghist/BUS10/ColegioEconomicas/ConsultaColegiaturas_$FECHA_LOG.log; cat /dev/null > ConsultaColegiaturas.log

echo "Creando backup logs SIAFSAG"
cd /var/logs/SIAFSAG
cp ConsultaSIAFSAG.log /loghist/BUS10/SIAFSAG/IIBNODE1/ConsultaSIAFSAG_73_$FECHA_LOG.log; cat /dev/null > ConsultaSIAFSAG.log
cp PagoSIAFSAG.log /loghist/BUS10/SIAFSAG/IIBNODE1/PagoSIAFSAG_73_$FECHA_LOG.log; cat /dev/null > PagoSIAFSAG.log
cp ReversaSIAFSAG.log /loghist/BUS10/SIAFSAG/IIBNODE1/ReversaSIAFSAG_73_$FECHA_LOG.log; cat /dev/null > ReversaSIAFSAG.log


echo "Creando backups de logs de Claro"
cd /var/logs/Claro
cp Claro_resp.log /loghist/BUS10/Claro/Claro_resp_$FECHA_LOG.log; cat /dev/null > Claro_resp.log
cd /var/logs/Claro/mqsitransit
cp ClaroRecarga.log /loghist/BUS10/Claro/ClaroRecarga_$FECHA_LOG.log; cat /dev/null > ClaroRecarga.log
cp TimeOut.log /loghist/BUS10/Claro/TimeOut_$FECHA_LOG.log; cat /dev/null > TimeOut.log

echo "Creando backup de logs CertificacionDocumentos"
cd /var/logs/CertificacionDocumentos
find . -mtime +1 -exec /usr/scripts/mvCertificacionDocumentos.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

echo "Creando backup de logs Certificacion_documentos"
cd /var/logs/Certificacion_documentos
find . -mtime +1 -exec /usr/scripts/mvCertificacion_documentos.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

echo "Creando backup de logs BilleteraDigital"
cd /var/logs/BilleteraDigital
find . -mtime +1 -exec /usr/scripts/mvBilleteraDigital.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

echo "Creando backup de logs Gestor"
cd /var/logs/GESTOR
find . -mtime +1 -exec /usr/scripts/mvGESTOR1.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;


echo "Liberando espacio en /var"
cd /var/mqsi
rm -rf core*




 
 





















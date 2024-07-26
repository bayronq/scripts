#Script que realiza el backup diario de logs del BUS 
#Realizado por Bayron Cua
#Modificación 07/10/2020, se agrego logs de OJFEI, ACH, RGP, Emetra


#if [ ! -d /loghist/lost+found ]
#then mount 10.161.200.20:/logwas /loghist
#then mount 10.160.255.36:/nfs/MANTENIMIENTO /loghist


#     if [ ! -d /loghist/lost+found -a ! -f /tmp/.logs.err ]
#     then echo "CRITICO: no esta montado /loghist en $hostname" | mail tic.mdsw.implementaciones@banrural.com.gt
#          touch /tmp/.logs.err
#     else cat /dev/null > -f /tmp/logs.err
#    fi
#fi

#Variables
host=$(hostname)
logs=/loghist/BUS10
FECHA_LOG=`date +%Y%m%d`; export FECHA_LOG
local=/var/logs


echo "Inicio backup logs ESB Logging"
cp /tmp/trace_error_esb_logging.log /loghist/BUS10/ESB/trace_error_esb_logging_74_$FECHA_LOG.log; cat /dev/null > trace_error_esb_logging.log

cd /var/adm
cp user.log /loghist/BUS10/Userlog/user_74_$FECHA_LOG.log; cat /dev/null > user.log


echo "Creando backup logs Migracion"
cd /var/logs/Migracion
cp Pasaporte_Pago.log /loghist/BUS10/Migracion/IIBNODE2/Pasaporte_Pago_74_$FECHA_LOG.log; cat /dev/null > Pasaporte_Pago.log
cp Reenvio_PagoPas.log /loghist/BUS10/Migracion/IIBNODE2/Reenvio_PagoPas_74_$FECHA_LOG.log; cat /dev/null > Reenvio_PagoPas.log
cp Migracion_Consulta.log /loghist/BUS10/Migracion/IIBNODE2/Migracion_Consulta_74_$FECHA_LOG.log; cat /dev/null > Migracion_Consulta.log
cp Migracion_Pago.log /loghist/BUS10/Migracion/IIBNODE2/Migracion_Pago_74_$FECHA_LOG.log; cat /dev/null > Migracion_Pago.log
cp Pasaporte_Reversa.log /loghist/BUS10/Migracion/IIBNODE2/Pasaporte_Reversa_74_$FECHA_LOG.log; cat /dev/null > Pasaporte_Reversa.log

echo "Creando backup logs CGC"
cd /var/logs/CGC
cp CGC_Consulta.log /loghist/BUS10/CGC/IIBNODE2/CGC_Consulta_74_$FECHA_LOG.log; cat /dev/null > CGC_Consulta.log
cp CGC_Pago.log /loghist/BUS10/CGC/IIBNODE2/CGC_Pago_74_$FECHA_LOG.log; cat /dev/null > CGC_Pago.log
cp CGC_Reversa.log /loghist/BUS10/CGC/IIBNODE2/CGC_Reversa_74_$FECHA_LOG.log; cat /dev/null > CGC_Reversa.log


echo "Inicio de backup de OJFEI"
cd /var/logs/OJFEI/
cd antecedentes
cp OJFEI_Req.log /loghist/BUS10/OJFEI/IIBNODE2/OJFEI_Req_$FECHA_LOG.log; cat /dev/null > OJFEI_Req.log
cp OJFEI_Resp.log /loghist/BUS10/OJFEI/IIBNODE2/OJFEI_Resp_$FECHA_LOG.log; cat /dev/null > OJFEI_Resp.log
cd /var/logs/OJFEI/Depositos
cp DepositosFEI.log $logs/OJFEI/IIBNODE2/DepositosFEI_$FECHA_LOG.log; cat /dev/null > DepositosFEI.log
cd /var/logs/OJFEI/PensionesAlimenticias
cp Pago.log $logs/OJFEI/IIBNODE2/Pago_$FECHA_LOG.log; cat /dev/null > Pago.log


echo "Inicio de backup de Adventistas"
cd /var/logs/Adventistas/
cp Adventistas_Consulta_Req.log /loghist/BUS10/Adventistas/Adventistas_Consulta_Req_74_$FECHA_LOG.log; cat /dev/null > Adventistas_Consulta_Req.log
cp Adventistas_Consulta_Resp.log /loghist/BUS10/Adventistas/Adventistas_Consulta_Resp_74_$FECHA_LOG.log; cat /dev/null > Adventistas_Consulta_Resp.log
cp Adventistas_Pago_Req.log /loghist/BUS10/Adventistas/Adventistas_Pago_Req_74_$FECHA_LOG.log; cat /dev/null > Adventistas_Pago_Req.log
cp Adventistas_Pago_Resp.log /loghist/BUS10/Adventistas/Adventistas_Pago_Resp_74_$FECHA_LOG.log; cat /dev/null > Adventistas_Pago_Resp.log
cp Adventistas_Reversa_Req.log /loghist/BUS10/Adventistas/Adventistas_Reversa_Req_74_$FECHA_LOG.log; cat /dev/null > Adventistas_Reversa_Req.log
cp Adventistas_Reversa_Resp.log /loghist/BUS10/Adventistas/Adventistas_Reversa_Resp_74_$FECHA_LOG.log; cat /dev/null > Adventistas_Reversa_Resp.log

echo "Inicio backup de MinecoRGM"
cd /var/logs/MinecoRGM
cp MinecoRGM_Consulta_Req.log /loghist/BUS10/MinecoRGM/MinecoRGM_Consulta_Req_74_$FECHA_LOG.log; cat /dev/null > MinecoRGM_Consulta_Req.log
cp MinecoRGM_Consulta_Resp.log /loghist/BUS10/MinecoRGM/MinecoRGM_Consulta_Resp_74_$FECHA_LOG.log; cat /dev/null > MinecoRGM_Consulta_Resp.log
cp MinecoRGM_Pago_Req.log /loghist/BUS10/MinecoRGM/MinecoRGM_Pago_Req_74_$FECHA_LOG.log; cat /dev/null > MinecoRGM_Pago_Req.log
cp MinecoRGM_Pago_Resp.log /loghist/BUS10/MinecoRGM/MinecoRGM_Pago_Resp_74_$FECHA_LOG.log; cat /dev/null > MinecoRGM_Pago_Resp.log
cp MinecoRGM_Reversa_Req.log /loghist/BUS10/MinecoRGM/MinecoRGM_Reversa_Req_74_$FECHA_LOG.log; cat /dev/null > MinecoRGM_Reversa_Req.log
cp MinecoRGM_Reversa_Resp.log /loghist/BUS10/MinecoRGM/MinecoRGM_Reversa_Resp_74_$FECHA_LOG.log; cat /dev/null > MinecoRGM_Reversa_Resp.log

echo "Inicio backup de Tramites"
cd /var/logs/Tramites
cp Tramites_CreaExpGES_XmlReq.log /loghist/BUS10/Tramites/Tramites_CreaExpGES_XmlReq_74_$FECHA_LOG.log; cat /dev/null > Tramites_CreaExpGES_XmlReq.log
cp Tramites_consultaPreCREDITPRO_XmlReq_Desa.log /loghist/BUS10/Tramites/Tramites_consultaPreCREDITPRO_XmlReq_Desa_74_$FECHA_LOG.log; cat /dev/null > Tramites_consultaPreCREDITPRO_XmlReq_Desa.log
cp Tramites_consultaPreCREDITPRO_XmlReq.log $logs/Tramites/Tramites_consultaPreCREDITPRO_XmlReq_74_$FECHA_LOG.log; cat /dev/null > Tramites_consultaPreCREDITPRO_XmlReq.log;

echo "Inicio de backup de Remesas Familiares TNC"
cd /var/logs/TNC/
cp ConfirmacionYPagoTNC_Req.log /loghist/BUS10/TNC/ConfirmacionYPagoTNC_Req_74_$FECHA_LOG.log; cat /dev/null > ConfirmacionYPagoTNC_Req.log
cp ConfirmacionYPagoTNC_Resp.log /loghist/BUS10/TNC/ConfirmacionYPagoTNC_Resp74_$FECHA_LOG.log; cat /dev/null > ConfirmacionYPagoTNC_Resp.log
cp ConsultaTNC_Req.log /loghist/BUS10/TNC/ConsultaTNC_Req_74_$FECHA_LOG.log; cat /dev/null > ConsultaTNC_Req.log
cp ConsultaTNC_Resp.log /loghist/BUS10/TNC/ConsultaTNC_Resp_74_$FECHA_LOG.log; cat /dev/null > ConsultaTNC_Resp.log
cp ReversaTNC_Req.log /loghist/BUS10/TNC/ReversaTNC_Req_74_$FECHA_LOG.log; cat /dev/null > ReversaTNC_Req.log
cp ReversaTNC_Resp.log /loghist/BUS10/TNC/ReversaTNC_Resp_74_$FECHA_LOG.log; cat /dev/null > ReversaTNC_Resp.log
cp sp_carga_nueva_remesa_tnc_consulta.log /loghist/BUS10/TNC/sp_carga_nueva_remesa_tnc_consulta_74_$FECHA_LOG.log; cat /dev/null > sp_carga_nueva_remesa_tnc_consulta.log
cp wsconsultarem.log /loghist/BUS10/TNC/wsconsultarem_74_$FECHA_LOG.log; cat /dev/null > wsconsultarem.log
cp wspagorem.log /loghist/BUS10/TNC/wsconsultarem_74_$FECHA_LOG.log; cat /dev/null > wsconsultarem.log


echo "Inicio de backup de Asrural"
cd /var/logs/Asrural/
cp Asrural_Consulta_Req.log /loghist/BUS10/Asrural/Asrural_Consulta_Req_74_$FECHA_LOG.log; rm Asrural_Consulta_Req.log
cp Asrural_Consulta_Resp.log /loghist/BUS10/Asrural/Asrural_Consulta_Resp_74_$FECHA_LOG.log; rm Asrural_Consulta_Resp.log
cp Asrural_Pago_Req.log  /loghist/BUS10/Asrural/Asrural_Pago_Req_74_$FECHA_LOG.log; rm Asrural_Pago_Req.log
cp Asrural_Pago_Resp.log /loghist/BUS10/Asrural/Asrural_Pago_Resp_74_$FECHA_LOG.log; rm Asrural_Pago_Resp.log
cp Asrural_Reversa_Req.log /loghist/BUS10/Asrural/Asrural_Reversa_Req_74_$FECHA_LOG.log; rm Asrural_Reversa_Req.log
cp Asrural_Reversa_Resp.log /loghist/BUS10/Asrural/Asrural_Reversa_Resp_74_$FECHA_LOG.log; rm Asrural_Reversa_Resp.log

echo "Inicio de backup de ColegioVeterinarios"
cd /var/logs/ColegioVeterinarios/
cp CMVZ_Consulta_Req.log /loghist/BUS10/ColegioVeterinarios/CMVZ_Consulta_Req_74_$FECHA_LOG.log; cat /dev/null > CMVZ_Consulta_Req.log
cp CMVZ_Consulta_Resp.log /loghist/BUS10/ColegioVeterinarios/CMVZ_Consulta_Resp_74_$FECHA_LOG.log; cat /dev/null > CMVZ_Consulta_Resp.log
cp CMVZ_Pago_Req.log /loghist/BUS10/ColegioVeterinarios/CMVZ_Pago_Req_74_$FECHA_LOG.log; cat /dev/null > CMVZ_Pago_Req.log
cp CMVZ_Pago_Resp.log /loghist/BUS10/ColegioVeterinarios/CMVZ_Pago_Resp_74_$FECHA_LOG.log; cat /dev/null > CMVZ_Pago_Resp.log
cp CMVZ_Reversa_Req.log /loghist/BUS10/ColegioVeterinarios/CMVZ_Reversa_Req_74_$FECHA_LOG.log; cat /dev/null > CMVZ_Reversa_Req.log
cp CMVZ_Reversa_Resp.log /loghist/BUS10/ColegioVeterinarios/CMVZ_Reversa_Resp_74_$FECHA_LOG.log; cat /dev/null > CMVZ_Reversa_Resp.log

echo "Inicio de backup de SAT"
cd /var/logs/SAT
cp declaraguate.log /loghist/BUS10/SAT/Respaldo/Declaraguate_74_$FECHA_LOG.log; cat /dev/null > declaraguate.log


echo "Creando backups de logs de ADAP"
cd /var/logs/ADAP
find . -mtime +1 -type d -exec /usr/scripts/mvadap.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

echo "Creando backup de logs UPANA"
cd /var/logs/UPANA
cp ConsultaMensualidades.log $logs/UPANA/IIBNODE2/ConsultaMensualidades_74_$FECHA_LOG.log; cat /dev/null > ConsultaMensualidades.log
cp ConsultaObligatorios.log $logs/UPANA/IIBNODE2/ConsultaObligatorios_74_$FECHA_LOG.log; cat /dev/null > ConsultaObligatorios.log
cp PagoMensualidades.log $logs/UPANA/IIBNODE2/PagoMensualidades_74_$FECHA_LOG.log; cat /dev/null > PagoMensualidades.log
cp PagoObligatorio.log $logs/UPANA/IIBNODE2/PagoObligatorio_74_$FECHA_LOG.log; cat /dev/null > PagoObligatorio.log
cp ReversaMensualidades.log $logs/UPANA/IIBNODE2/ReversaMensualidades_74_$FECHA_LOG.log; cat /dev/null > ReversaMensualidades.log
cp ReversaObligatorios.log $logs/UPANA/IIBNODE2/UPANA/ReversaObligatorios_74_$FECHA_LOG.log; cat /dev/null > ReversaObligatorios.log

echo "Creando backup de logs UPANACEP"
cd /var/logs/UPANACEP
cp UPANACEP_Pago.log $logs/UPANACEP/IIBNODE2/UPANACEP_Pago_74_$FECHA_LOG.log; cat /dev/null > UPANACEP_Pago.log
cp UPANACEP_Consulta.log $logs/UPANACEP/IIBNODE2/UPANACEP_Consulta_74_$FECHA_LOG.log; cat /dev/null > UPANACEP_Consulta.log
cp UPANACEP_Reversa.log $logs/UPANACEP/IIBNODE2/UPANACEP_Reversa_74_$FECHA_LOG.log; cat /dev/null > UPANACEP_Reversa.log

echo "Creando backup de logs DIARIOCA"
cd /var/logs/DIARIOCA
cp DIARIOCA_Confirmacion.log $logs/DIARIOCA/IIBNODE2/DIARIOCA_Confirmacion_74_$FECHA_LOG.log; cat /dev/null > DIARIOCA_Confirmacion.log
cp DIARIOCA_Consulta.log $logs/DIARIOCA/IIBNODE2/DIARIOCA_Consulta_74_$FECHA_LOG.log; cat /dev/null > DIARIOCA_Consulta.log
cp DIARIOCA_Pago.log $logs/DIARIOCA/IIBNODE2/DIARIOCA_Pago_74_$FECHA_LOG.log; cat /dev/null > DIARIOCA_Pago.log
cp DIARIOCA_Reversa.log $logs/DIARIOCA/IIBNODE2/PDIARIOCA_Reversa_74_$FECHA_LOG.log; cat /dev/null > DIARIOCA_Reversa.log

echo "Creando backup de logs FUNDEA"
cd /var/logs/FUNDEA/PagoGenerico
cp FUNDEA_Consultar.log $logs/FUNDEA/PagoGenerico/IIBNODE2/FUNDEA_Consultar_74_$FECHA_LOG.log; cat /dev/null > FUNDEA_Consultar.log
cp FUNDEA_Pago.log $logs/FUNDEA/PagoGenerico/IIBNODE2/FUNDEA_Pago_74_$FECHA_LOG.log; cat /dev/null > FUNDEA_Pago.log
cp FUNDEA_Reversa.log $logs/FUNDEA/PagoGenerico/IIBNODE2/FUNDEA_Reversa_74_$FECHA_LOG.log; cat /dev/null > FUNDEA_Reversa.log

echo "Creando backup de logs FUNDEA"
cd /var/logs/FUNDEA/PagoGenerico
cp FUNDEA_Consultar.log $logs/FUNDEA/PagoGenerico/IIBNODE2/FUNDEA_Consultar_74_$FECHA_LOG.log; cat /dev/null > FUNDEA_Consultar.log
cp FUNDEA_Pago.log $logs/FUNDEA/PagoGenerico/IIBNODE2/FUNDEA_Pago_74_$FECHA_LOG.log; cat /dev/null > FUNDEA_Pago.log


echo "Creando backup de logs ASEGU_CONFIO"
cd /var/logs/ASEGU_CONFIO
cp ASEGU_CONFIO_Consulta.log $logs/ASEGU_CONFIO/IIBNODE2/ASEGU_CONFIO_Consulta_74_$FECHA_LOG.log; cat /dev/null > ASEGU_CONFIO_Consulta.log
cp ASEGU_CONFIO_Pago.log $logs/ASEGU_CONFIO/IIBNODE2/ASEGU_CONFIO_Pago_74_$FECHA_LOG.log; cat /dev/null > ASEGU_CONFIO_Pago.log

echo "Creando backup de logs UREGIONAL"
cd /var/logs/UREGIONAL
cp UREGIONAL_Pago.log $logs/UREGIONAL/IIBNODE2/UREGIONAL_Pago_74_$FECHA_LOG.log; cat /dev/null > UREGIONAL_Pago.log
cp UREGIONAL_Consulta.log $logs/UREGIONAL/IIBNODE2/UREGIONAL_Consulta_74_$FECHA_LOG.log; cat /dev/null > UREGIONAL_Consulta.log
cp UREGIONAL_Reversa.log $logs/UREGIONAL/IIBNODE2/UREGIONAL_Reversa_74_$FECHA_LOG.log; cat /dev/null > UREGIONAL_Reversa.log

echo "Creando backup de logs Transferencias_Electronicas_Masivas"
cd /var/logs/Transferencias_Electronicas_Masivas
find . -mtime +1 -type d -exec /usr/scripts/mvtransferencias.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;
 
echo "Creando backup de logs pagoPsicologos"
cd /var/logs/pagoPsicologos
cp psicologos1.log $logs/pagoPsicologos/IIBNODE2/psicologos1_74_$FECHA_LOG.log; cat /dev/null > psicologos1.log
cp psicologos.log $logs/pagoPsicologos/IIBNODE2/psicologos_74_$FECHA_LOG.log; cat /dev/null > psicologos.log
cp pagoSicologos.log $logs/pagoPsicologos/IIBNODE2/pagoSicologos_74_$FECHA_LOG.log; cat /dev/null > pagoSicologos.log
cp revertPsicologos.log $logs/pagoPsicologos/IIBNODE2/revertPsicologos_74_$FECHA_LOG.log; cat /dev/null > revertPsicologos.log

echo "Creando backup de logs Oriflame_Generico"
cd /var/logs/Oriflame_Generico
cp ORIFLAME_GENERICO_Consulta.log $logs/Oriflame/IIBNODE2/ORIFLAME_GENERICO_Consulta_74_$FECHA_LOG.log; cat /dev/null > ORIFLAME_GENERICO_Consulta.log
cp ORIFLAME_GENERICO_Pago.log $logs/Oriflame/IIBNODE2/ORIFLAME_GENERICO_Pago_74_$FECHA_LOG.log; cat /dev/null > ORIFLAME_GENERICO_Pago.log
cp ORIFLAME_GENERICO_Reversa.log $logs/Oriflame/IIBNODE2/ORIFLAME_GENERICO_Reversa_74_$FECHA_LOG.log; cat /dev/null > ORIFLAME_GENERICO_Reversa.log
 
echo "Creando backup de logs NAVEGA"
cd /var/logs/NAVEGA
cp NAVEGA_ConsultaRecibo.log $logs/NAVEGA/IIBNODE2/NAVEGA_ConsultaRecibo_74_$FECHA_LOG.log; cat /dev/null > NAVEGA_ConsultaRecibo.log
cp NAVEGA_Consulta.log $logs/NAVEGA/IIBNODE2/NAVEGA_Consulta_74_$FECHA_LOG.log; cat /dev/null > NAVEGA_Consulta.log
cp NAVEGA_Pago.log $logs/NAVEGA/IIBNODE2/NAVEGA_Pago_74_$FECHA_LOG.log; cat /dev/null > NAVEGA_Pago.log

echo "Creando backup de logs RPI"
cd /var/logs/RPI
cp Consulta.log $logs/RPI/IIBNODE2/Consulta_74_$FECHA_LOG.log; cat /dev/null > Consulta.log
cp Pago.log $logs/RPI/IIBNODE2/Pago_74_$FECHA_LOG.log; cat /dev/null > Pago.log

echo "Creando backups de logs de ACH"
cd /var/logs/ACH
find . -mtime +1 -type d -exec /usr/scripts/mvach.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

echo "Creando backups de logs de SIB"
cd /var/logs/SIB
find . -mtime +1 -type d -exec /usr/scripts/mvsib.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

#echo "Creando backup de logs Sicoin"
#cd /var/logs/Sicoin/mqsibackout
#find . -mtime +1 -exec /usr/scripts/mvsicoin.sh {} \;

echo "Inicio backup logs PTC"
cd /var/logs/PTC
cp ConsultaSaldos1.log /loghist/BUS10/PTC/IIBNODE2/ConsultaSaldos1_$FECHA_LOG.log; cat /dev/null > ConsultaSaldos1.log
cp ConsultaSaldos2.log /loghist/BUS10/PTC/IIBNODE2/ConsultaSaldos2_$FECHA_LOG.log; cat /dev/null > ConsultaSaldos2.log
cp ConsultaSaldos3.log /loghist/BUS10/PTC/IIBNODE2/ConsultaSaldos3_$FECHA_LOG.log; cat /dev/null > ConsultaSaldos3.log
cat /dev/null > Error.log
echo "Se termino de realizar el backup de tramas PTC"
find . -mtime +1 -type d -exec /usr/scripts/mvPTC.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;


echo "Inicio backup de SIB"
cd /var/logs
cp ConsultaRespuestaSIB.log /loghist/BUS10/SIB/ConsultaRespuestaSIB_74_$FECHA_LOG.log; cat /dev/null > ConsultaRespuestaSIB.log
cp ConsultaSibMapping.log /loghist/BUS10/SIB/ConsultaSibMapping_74_$FECHA_LOG.log; cat /dev/null > ConsultaSibMapping.log
cp AsociarCuentas.log /loghist/BUS10/SIB/AsociarCuentas_74_$FECHA_LOG.log; cat /dev/null > AsociarCuentas.log
cp ConsultaSIBCompute.log /loghist/BUS10/SIB/ConsultaSIBCompute_74_$FECHA_LOG.log; cat /dev/null > ConsultaSIBCompute.log
cp PreconsultaCompute.log /loghist/BUS10/SIB/PreconsultaCompute_74_$FECHA_LOG.log; cat /dev/null > PreconsultaCompute.log
cp PreConsultaRespuestaSIB.log /loghist/BUS10/SIB/PreConsultaRespuestaSIB_74_$FECHA_LOG.log; cat /dev/null > PreConsultaRespuestaSIB.log
cp PreconsultaSibMapping.log /loghist/BUS10/SIB/PreconsultaSibMapping_74_$FECHA_LOG.log; cat /dev/null > PreconsultaSibMapping.log

echo "Inicio backup de RGAE"
cd /var/logs/RGAE
cp RGAE_Consulta.log /loghist/BUS10/RGAE/RGAE_Consulta_74_$FECHA_LOG.log; cat /dev/null > RGAE_Consulta.log
cp RGAE_Pago.log /loghist/BUS10/RGAE/RGAE_Pago_74_$FECHA_LOG.log; cat /dev/null > RGAE_Pago.log
cp RGAE_Reversa.log /loghist/BUS10/RGAE/RGAE_Reversa_74_$FECHA_LOG.log; cat /dev/null > RGAE_Reversa.log

echo "Inicio backup de Citi"
cd /var/logs/Citi/Speedcollect
cp Consulta.log /loghist/BUS10/Citi/Speedcollect/Consulta_74_$FECHA_LOG.log; cat /dev/null > Consulta.log
cp Pago.log /loghist/BUS10/Citi/Speedcollect/Pago_74_$FECHA_LOG.log; cat /dev/null > Pago.log
cp Reversa.log /loghist/BUS10/Citi/Speedcollect/Reversa_74_$FECHA_LOG.log; cat /dev/null > Reversa.log

echo "Inicio backup de IVR"
cd /var/logs/IVR
find . -mtime +1 -type d -exec /usr/scripts/mvivr.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

echo "Inicio backup logs IV-R"
cd /var/logs/IV-R
cp IV-R.log $logs/IV-R/IIBNOED2/IV-R_$FECHA_LOG.log; cat /dev/null > IV-R.log
cp "mensajes de entrada.log" $logs/IV-R/IIBNOED2/"mensajes de entrada.log"_$FECHA_LOG.log; cat /dev/null > "mensajes de entrada.log"
cp proxy.log $logs/IV-R/IIBNOED2/proxy_$FECHA_LOG.log; cat /dev/null > proxy.log

echo "Inicio backup de ASEC"
cd /var/logs/ASEC
cp ASEC_Autentificar.log /loghist/BUS10/ASEC/ASEC_Autentificar_74_$FECHA_LOG.log; cat /dev/null > ASEC_Autentificar.log
cp ASEC_Consulta.log /loghist/BUS10/ASEC/ASEC_Consulta_74_$FECHA_LOG.log; cat /dev/null > ASEC_Consulta.log
cp ASEC_Pago.log /loghist/BUS10/ASEC/ASEC_Pago_74_$FECHA_LOG.log; cat /dev/null > ASEC_Pago.log

echo "Inicio backup de SICOIN"
cd /var/logs/SICOIN
cp sicoin.log /loghist/BUS10/SICOIN/sicoin_74_$FECHA_LOG.log; cat /dev/null > sicoin.log

echo "Creando backups de logs de BDG"
cd /var/logs/BDG
find . -mtime +1 -type d -exec /usr/scripts/mvbdg.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

echo "Creando backup logs tigoProtelecom"
cd /var/logs/tigoProtelecom
cp tigoPago.log /loghist/BUS10/tigoProtelecom/IIBNODE2/tigoPago_$FECHA_LOG.log; cat /dev/null > tigoPago.log
cp tigoConsulta.log /loghist/BUS10/tigoProtelecom/IIBNODE2/tigoConsulta_$FECHA_LOG.log; cat /dev/null > tigoConsulta.log
cp tigoRev.log /loghist/BUS10/tigoProtelecom/IIBNODE2/tigoRev_$FECHA_LOG.log; cat /dev/null > tigoRev.log

echo "Creando backup logs MDG"
cd /var/logs/MDG
cp CreaModificaCliente.log /loghist/BUS10/MDG/IIBNODE2/CreaModificaCliente_74_$FECHA_LOG.log; cat /dev/null > CreaModificaCliente.log
cp ReplicacionASE.log /loghist/BUS10/MDG/IIBNODE2/ReplicacionASE_74_$FECHA_LOG.log; cat /dev/null > ReplicacionASE.log
cp ValidaCliente_REST.log /loghist/BUS10/MDG/IIBNODE2/ValidaCliente_REST_74_$FECHA_LOG.log; cat /dev/null > ValidaCliente_REST.log
cp CreaModifica_REST.log /loghist/BUS10/MDG/IIBNODE2/CreaModifica_REST_74_$FECHA_LOG.log; cat /dev/null > CreaModifica_REST.log
cp CreaModifica_RESTJSON.log /loghist/BUS10/MDG/IIBNODE2/CreaModifica_RESTJSON_74_$FECHA_LOG.log; cat /dev/null > CreaModifica_RESTJSON.log
cp ReplicacionPTC.log /loghist/BUS10/MDG/IIBNODE2/ReplicacionPTC_74_$FECHA_LOG.log; cat /dev/null > ReplicacionPTC.log


echo "Creando backup logs Remesas"
cd /var/logs/
cp RemesasNuevasAntesSP.log /loghist/BUS10/Remesas/IIBNODE2/CRemesasNuevasAntesSP_74_$FECHA_LOG.log; cat /dev/null > RemesasNuevasAntesSP.log
cp RemesasNuevasDespuesSP.log /loghist/BUS10/Remesas/IIBNODE2/RemesasNuevasDespuesSP_74_$FECHA_LOG.log; cat /dev/null > RemesasNuevasDespuesSP.log
cp RemesasAntesSP.log /loghist/BUS10/Remesas/IIBNODE2/RemesasAntesSP_74_$FECHA_LOG.log; cat /dev/null > RemesasAntesSP.log
cp RemesasDespuesSP.log /loghist/BUS10/Remesas/IIBNODE2/RemesasDespuesSP_74_$FECHA_LOG.log; cat /dev/null > RemesasDespuesSP.log

echo "Creando backup de logs HuellaCliente"
cd /var/logs/HuellaCliente
find . -mtime +1 -exec /usr/scripts/mvhuellac.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

echo "Creando backup logs ChequePida"
cd /var/logs/CHQPIDA
cp ChequePidaReq.log /loghist/BUS10/CHQPIDA/IIBNODE2/ChequePidaReq_74_$FECHA_LOG.log; cat /dev/null > ChequePidaReq.log
cp ChequePidaResp.log /loghist/BUS10/CHQPIDA/IIBNODE2/ChequePidaResp_74_$FECHA_LOG.log; cat /dev/null > ChequePidaResp.log
cp CHQP_ErrorSP.log /loghist/BUS10/CHQPIDA/IIBNODE2/CHQP_ErrorSP_74_$FECHA_LOG.log; cat /dev/null > CHQP_ErrorSP.log

echo "Creando backup logs YANBAL"
cd /var/logs/YANBAL
cp YANBAL_Pago.log /loghist/BUS10/YANBAL/IIBNODE2/YANBAL_Pago_$FECHA_LOG.log; cat /dev/null > YANBAL_Pago.log
cp YANBAL_Consulta.log /loghist/BUS10/YANBAL/IIBNODE2/YANBAL_Consulta_$FECHA_LOG.log; cat /dev/null > YANBAL_Consulta.log

echo "Creando backup logs HABITAT"
cd /var/logs/HABITAT
cp HABITAT_Reversa.log /loghist/BUS10/HABITAT/IIBNODE2/HABITAT_Reversa_74_$FECHA_LOG.log; cat /dev/null > HABITAT_Reversa.log
cp HABITAT_Pago.log /loghist/BUS10/HABITAT/IIBNODE2/HABITAT_Pago_74_$FECHA_LOG.log; cat /dev/null > HABITAT_Pago.log
cp HABITAT_Consulta.log /loghist/BUS10/HABITAT/IIBNODE2/HABITAT_Consulta_74_$FECHA_LOG.log; cat /dev/null > HABITAT_Consulta.log


echo "Creando backup logs TransNetwork"
cd /var/logs/TransNetwork
cp sp_tnc_reversapush.log /loghist/BUS10/TransNetwork/IIBNODE2/sp_tnc_reversapush_74_$FECHA_LOG.log; cat /dev/null > sp_tnc_reversapush.log
cp sp_tnc_liveservice.log /loghist/BUS10/TransNetwork/IIBNODE2/sp_tnc_liveservice_74_$FECHA_LOG.log; cat /dev/null > sp_tnc_liveservice.log
cp sp_tnc_confirmapush.log /loghist/BUS10/TransNetwork/IIBNODE2/sp_tnc_confirmapush_74_$FECHA_LOG.log; cat /dev/null > sp_tnc_confirmapush.log
cp ReversaPush_RESP.log /loghist/BUS10/TransNetwork/IIBNODE2/ReversaPush_RESP_74_$FECHA_LOG.log; cat /dev/null > ReversaPush_RESP.log
cp LiveService_RESP.log /loghist/BUS10/TransNetwork/IIBNODE2/LiveService_RESP_74_$FECHA_LOG.log; cat /dev/null > LiveService_RESP.log
cp LiveService_REQ.log /loghist/BUS10/TransNetwork/IIBNODE2/LiveService_REQ_74_$FECHA_LOG.log; cat /dev/null > LiveService_REQ.log
cp ConfirmaPush_RESP.log /loghist/BUS10/TransNetwork/IIBNODE2/ConfirmaPush_RESP_74_$FECHA_LOG.log; cat /dev/null > ConfirmaPush_RESP.log
cp ConfirmaPush_REQ.log /loghist/BUS10/TransNetwork/IIBNODE2/ConfirmaPush_REQ_74_$FECHA_LOG.log; cat /dev/null > ConfirmaPush_REQ.log

echo "Creando backup logs INAB"
cd /var/logs/INAB
cp INAB_Pago.log /loghist/BUS10/INAB/IIBNODE2/INAB_Pago_$FECHA_LOG.log; cat /dev/null > INAB_Pago.log

echo "Creando backup logs SIAFSAG"
cd /var/logs/SIAFSAG
cp ConsultaSIAFSAG.log /loghist/BUS10/SIAFSAG/IIBNODE2/ConsultaSIAFSAG_74_$FECHA_LOG.log; cat /dev/null > ConsultaSIAFSAG.log
cp PagoSIAFSAG.log /loghist/BUS10/SIAFSAG/IIBNODE2/PagoSIAFSAG_74_$FECHA_LOG.log; cat /dev/null > PagoSIAFSAG.log
cp ReversaSIAFSAG.log /loghist/BUS10/SIAFSAG/IIBNODE2/ReversaSIAFSAG_74_$FECHA_LOG.log; cat /dev/null > ReversaSIAFSAG.log

echo "Creando backup logs USAC"
cd /var/logs/USAC
cp pagosUSAC.log /loghist/BUS10/USAC/IIBNODE2/pagosUSAC_74_$FECHA_LOG.log; cat /dev/null > pagosUSAC.log

echo "Creando backup logs FEP"
cd /var/logs/FEP
cp FEP.log /loghist/BUS10/FEP/IIBNODE2/FEP_74_$FECHA_LOG.log; cat /dev/null > FEP.log

echo "Creando backup logs BELCORP"
cd /var/logs/BELCORP
cp BELCORP_Reversa.log /loghist/BUS10/BELCORP/IIBNODE2/BELCORP_Reversa_74_$FECHA_LOG.log; cat /dev/null > BELCORP_Reversa.log
cp BELCORP_Pago.log /loghist/BUS10/BELCORP/IIBNODE2/BELCORP_Pago_74_$FECHA_LOG.log; cat /dev/null > BELCORP_Pago.log
cp BELCORP_ConsultaTkn.log /loghist/BUS10/BELCORP/IIBNODE2/BELCORP_ConsultaTkn_74_$FECHA_LOG.log; cat /dev/null > BELCORP_ConsultaTkn.log
cp BELCORP_Consulta.log /loghist/BUS10/BELCORP/IIBNODE2/BELCORP_Consulta_74_$FECHA_LOG.log; cat /dev/null > BELCORP_Consulta.log


echo "Creando backup de logs BV"
cd /var/logs/BV
find . -mtime +1 -type d -exec /usr/scripts/mvBV.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;


echo "Creando backup de logs DepositoElectronico"
cd /var/logs/DepositoElectronico
find . -mtime +1 -exec /usr/scripts/mvDepositoElectronico.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

echo "Creando backup de logs BilleteraDigital"
cd /var/logs/BilleteraDigital
find . -mtime +1 -exec /usr/scripts/mvBilleteraDigital.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

echo "Creando backup de logs GESTOR"
cd /var/logs/GESTOR
find . -mtime +1 -exec /usr/scripts/mvGESTOR.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

echo "Creando backup de logs FRI"
cd /var/logs/FRI
find . -mtime +1 -exec /usr/scripts/mvfri.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

echo "Creando backup de logs MCC"
cd /var/logs/MCC
find . -mtime +1 -exec /usr/scripts/mvMCC.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

echo "Creando backup de logs Consulta_SIB"
cd /var/logs/Consulta_SIB
find . -mtime +1 -exec /usr/scripts/mvconsib.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

echo "Creando backup de logs CertificacionDocumentos"
cd /var/logs/CertificacionDocumentos
find . -mtime +1 -exec /usr/scripts/mvCertificacionDocumentos.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

echo "Creando backup de logs Certificacion_documentos"
cd /var/logs/Certificacion_documentos
find . -mtime +1 -exec /usr/scripts/mvCertificacion_documentos.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

echo "Creando backup de logs Gestor"
cd /var/logs/Gestor
find . -mtime +1 -exec /usr/scripts/mvGestor.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

echo "Creando backup de logs Gestor"
cd /var/logs/GESTOR
find . -mtime +1 -exec /usr/scripts/mvGESTOR1.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;

echo "Creando backups de logs de GEKO"
cd /var/logs/GEKO
find . -mtime +1 -type d -exec /usr/scripts/mvgeko.sh {} \;
find . -mtime +1 -type d -exec /usr/scripts/rmfile.sh {} \;


echo "Liberando espacio en /var"
cd /var/mqsi
rm -rf core*


 























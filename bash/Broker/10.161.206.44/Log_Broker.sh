if [ ! -d /loghist/lost+found ]
then mount 10.161.200.20:/logwas /loghist
     if [ ! -d /loghist/lost+found -a ! -f /tmp/.logs.err ]
     then echo "CRITICO: no esta montado /loghist en $hostname" | mail tic.mdsw.implementaciones@banrural.com.gt
          touch /tmp/.logs.err
     else rm -f /tmp/logs.err
     fi
fi




cd /var/adm
cp user.log /loghist/Broker7/Userlog/user$FECHA_LOG.log; cat /dev/null > user.log
gzip /loghist/Broker7/Userlog/user$FECHA_LOG.log



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



echo "Inicio backup logs ESB Logging"
cp /tmp/trace_error_esb_logging.log /loghist/Broker7/ESB/trace_error_esb_logging_$FECHA_LOG.log; cat /dev/null > trace_error_esb_logging.log
gzip /loghist/Broker7/ESB/trace_error_esb_logging_$FECHA_LOG.log



cp /tmp/traceCA_Resp.log /loghist/Broker7/ESB/traceCA_Resp_$FECHA_LOG.log; cat /dev/null > traceCA_Resp.log
gzip /loghist/Broker7/ESB/traceCA_Resp_$FECHA_LOG.log
echo "Finaliza backup logs ESB Logging"













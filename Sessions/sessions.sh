#!/bin/bash

if [ ! -f ./sessions.txt ]; then
    echo -e '"Date/Time"\t"Server 1"\t"Server 2"\t"Server 3"\t"Server 4"\t"Server 5"\t"Server 6"\t"Server 7"\t"Server 8"\t"Total Sessions"'
fi

COUNTER=1

while [  $COUNTER -gt 0 ]; do
        SRV1=0
        SRV1=`curl -m 1 -s -u bobby.fincher:V3r@Br@dl3y http://vbr-prd-dal-app-01-p:10190/management/deployment/store.ear/subdeployment/store.war\?operation\=resource\&include-runtime\&recursive\&json.pre
tty\ | grep \"active-sessions | cut -d' ' -f7 | cut -d',' -f1`
        SRV2=0
        SRV2=`curl -m 1 -s -u bobby.fincher:V3r@Br@dl3y http://vbr-prd-dal-app-01-p:10290/management/deployment/store.ear/subdeployment/store.war\?operation\=resource\&include-runtime\&recursive\&json.pre
tty\ | grep \"active-sessions | cut -d' ' -f7 | cut -d',' -f1`
        SRV3=0
        SRV3=`curl -m 1 -s -u bobby.fincher:V3r@Br@dl3y http://vbr-prd-dal-app-02-p:10190/management/deployment/store.ear/subdeployment/store.war\?operation\=resource\&include-runtime\&recursive\&json.pre
tty\ | grep \"active-sessions | cut -d' ' -f7 | cut -d',' -f1`
        SRV4=0
        SRV4=`curl -m 1 -s -u bobby.fincher:V3r@Br@dl3y http://vbr-prd-dal-app-02-p:10290/management/deployment/store.ear/subdeployment/store.war\?operation\=resource\&include-runtime\&recursive\&json.pre
tty\ | grep \"active-sessions | cut -d' ' -f7 | cut -d',' -f1`
        SRV5=0
        SRV5=`curl -m 1 -s -u bobby.fincher:V3r@Br@dl3y http://vbr-prd-dal-app-03-p:10190/management/deployment/store.ear/subdeployment/store.war?\operation\=resource\&include-runtime\&recursive\&json.pre
tty\ | grep \"active-sessions | cut -d' ' -f7 | cut -d',' -f1`
        SRV6=0
        SRV6=`curl -m 1 -s -u bobby.fincher:V3r@Br@dl3y http://vbr-prd-dal-app-03-p:10290/management/deployment/store.ear/subdeployment/store.war?\operation\=resource\&include-runtime\&recursive\&json.pre
tty\ | grep \"active-sessions | cut -d' ' -f7 | cut -d',' -f1`
        SRV7=0
        SRV7=`curl -m 1 -s -u bobby.fincher:V3r@Br@dl3y http://vbr-prd-dal-app-04-p:10190/management/deployment/store.ear/subdeployment/store.war?\operation\=resource\&include-runtime\&recursive\&json.pre
tty\ | grep \"active-sessions | cut -d' ' -f7 | cut -d',' -f1`
        SRV8=0
        SRV8=`curl -m 1 -s -u bobby.fincher:V3r@Br@dl3y http://vbr-prd-dal-app-04-p:10290/management/deployment/store.ear/subdeployment/store.war?\operation\=resource\&include-runtime\&recursive\&json.pre
tty\ | grep \"active-sessions | cut -d' ' -f7 | cut -d',' -f1`
        
        TS=`date +%F" "%T`
        
        let "SESS_TOT = SRV1 + SRV2 + SRV3 + SRV4 + SRV5 + SRV6 + SRV7 + SRV8"
        
        echo -e $TS'\t'$SRV1'\t'$SRV2'\t'$SRV3'\t'$SRV4'\t'$SRV5'\t'$SRV6'\t'$SRV7'\t'$SRV8'\t'$SESS_TOT
        sleep 60
done

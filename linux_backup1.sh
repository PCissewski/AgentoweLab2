#!/bin/bash 
java -Djavax.net.ssl.keyStore=keys/backup1.jks \
    -Djavax.net.ssl.keyStorePassword=password \
    -Djavax.net.ssl.trustStorePassword=password \
    -Djavax.net.ssl.trustStore=keys/backup1_ca.jks \
    -cp ./lib/jade.jar jade.Boot -local-host 42.0.237.37 -host 42.0.237.37 \
    -port 5111 -local-port 2137 -backupmain -container-name LinuxBackup1  \
    -nomtp -icps jade.imtp.leap.JICP.JICPSPeer \
    -services \
    jade.core.replication.MainReplicationService\; \
    jade.core.replication.AddressNotificationService

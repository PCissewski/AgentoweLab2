#!/bin/bash
java -Djavax.net.ssl.keyStore=keys/backup2.jks \
    -Djavax.net.ssl.keyStorePassword=password \
    -Djavax.net.ssl.trustStore=keys/backup2_ca.jks \
    -cp ./lib/jade.jar jade.Boot -local-host 192.168.68.103 -host 192.168.68.103 \
    -port 5111 -local-port 5113 -backupmain -container-name LinuxBackup2  \
    -nomtp -icps jade.imtp.leap.JICP.JICPSPeer \
    -services \
    jade.core.replication.MainReplicationService\; \
    jade.core.replication.AddressNotificationService

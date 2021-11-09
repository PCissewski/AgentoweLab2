#!/bin/bash 
java -cp ./lib/jade.jar jade.Boot -local-host 192.168.68.103 -host 192.168.68.103 \
    -port 5211 -local-port 5212 -backupmain -container-name LinuxBackup1  \
    -nomtp -icps jade.imtp.leap.JICP.JICPSPeer \
    -services \
    jade.core.replication.MainReplicationService\; \
    jade.core.replication.AddressNotificationService

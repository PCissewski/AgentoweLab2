#!/bin/bash
java -cp ./lib/jade.jar jade.Boot \
    -nomtp -icps jade.imtp.leap.JICP.JICPSPeer \
    -local-host 192.168.68.103 -host 192.168.68.103 \
    -port 5211 -local-port 5214 \
    -container -container-name LinuxClientNoAuth \
    -services \
    jade.core.replication.AddressNotificationService

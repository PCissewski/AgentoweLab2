#!/bin/bash

java -cp lib/jade.jar jade.Boot -gui \
    -nomtp -icps jade.imtp.leap.JICP.JICPSPeer \
    -host 192.168.68.103 -port 5211 \
    -local-host 192.168.68.103 -local-port 5211 \
    -name s175690 -container-name LinuxMainNoAuth \
    -services \
    jade.core.replication.MainReplicationService\; \
    jade.core.replication.AddressNotificationService

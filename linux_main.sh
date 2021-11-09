#!/bin/bash

java -Djavax.net.ssl.keyStore=keys/main.jks \
    -Djavax.net.ssl.keyStorePassword=password \
    -Djavax.net.ssl.trustStorePassword=password \
    -Djavax.net.ssl.trustStore=keys/main_ca.jks \
    -cp lib/jade.jar jade.Boot \
    -nomtp -icps jade.imtp.leap.JICP.JICPSPeer \
    -local-host 42.0.237.37 -local-port 5111 \
    -name student -container-name LinuxMain \
    -services \
    jade.core.replication.MainReplicationService\; \
    jade.core.replication.AddressNotificationService

#!/bin/bash
java -Djavax.net.ssl.keyStore=keys/client.jks \
    -Djavax.net.ssl.keyStorePassword=password \
    -Djavax.net.ssl.trustStorePassword=password \
    -Djavax.net.ssl.trustStore=keys/client_ca.jks \
    -cp ./lib/jade.jar jade.Boot -gui -local-host 42.0.237.37 \
    -port 5111 -local-port 5114 -container \
    -nomtp -icps jade.imtp.leap.JICP.JICPSPeer \
    -container-name LinuxClient \
    -services \
    jade.core.replication.AddressNotificationService

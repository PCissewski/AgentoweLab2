#!/bin/bash

# create keys
keytool -genkeypair -keystore main.jks -alias main -keyalg RSA -storepass password -keypass password -dname "CN=176446"
keytool -genkeypair -keystore backup1.jks -alias backup1 -keyalg RSA -storepass password -keypass password -dname "CN=176446"
keytool -genkeypair -keystore backup2.jks -alias backup2 -keyalg RSA -storepass password -keypass password -dname "CN=176446"
keytool -genkeypair -keystore client.jks -alias client -keyalg RSA -storepass password -keypass password -dname "CN=176446"

# export them
keytool -export -keystore main.jks -alias main -file main.cer -storepass password
keytool -export -keystore backup1.jks -alias backup1 -file backup1.cer -storepass password
keytool -export -keystore backup2.jks -alias backup2 -file backup2.cer -storepass password
keytool -export -keystore client.jks -alias client -file client.cer -storepass password

# trust store for main
keytool -import -file backup1.cer -alias backup1 -keystore main_ca.jks -storepass password -noprompt
keytool -import -file backup2.cer -alias backup2 -keystore main_ca.jks -storepass password -noprompt
keytool -import -file client.cer -alias client -keystore main_ca.jks -storepass password -noprompt

# trust store for backup1
keytool -import -file main.cer -alias backup1 -keystore backup1_ca.jks -storepass password -noprompt
keytool -import -file backup2.cer -alias backup2 -keystore backup1_ca.jks -storepass password -noprompt
keytool -import -file client.cer -alias client -keystore backup1_ca.jks -storepass password -noprompt

# trust store for backup2
keytool -import -file backup1.cer -alias backup1 -keystore backup2_ca.jks -storepass password -noprompt
keytool -import -file main.cer -alias backup2 -keystore backup2_ca.jks -storepass password -noprompt
keytool -import -file client.cer -alias client -keystore backup2_ca.jks -storepass password -noprompt

# trust store for client
keytool -import -file backup1.cer -alias backup1 -keystore client_ca.jks -storepass password -noprompt
keytool -import -file backup2.cer -alias backup2 -keystore client_ca.jks -storepass password -noprompt
keytool -import -file main.cer -alias client -keystore client_ca.jks -storepass password -noprompt

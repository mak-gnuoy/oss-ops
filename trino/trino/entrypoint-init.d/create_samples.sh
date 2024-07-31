#!/bin/bash

sleep 10
java -jar /trino/trino-cli-452-executable.jar --server http://trino:8080 -f /entrypoint-init.d/samples.sql --debug

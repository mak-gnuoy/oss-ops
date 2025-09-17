#!/bin/bash

echo -e "##### Installing calico ..."
POD_NETWORK_CIDR=10.244.0.0/16
CALICO_VERSION=3.30.3
DOWNLOAD_DIR=conf
curl https://raw.githubusercontent.com/projectcalico/calico/v$CALICO_VERSION/manifests/calico.yaml -o $DOWNLOAD_DIR/calico.yaml
sed -i '/# *- name: CALICO_IPV4POOL_CIDR/{s/# *//;n;s/# *value: ".*"/  value: "10.244.0.0\/16"/}' $DOWNLOAD_DIR/calico.yaml
kubectl apply -f $DOWNLOAD_DIR/calico.yaml
echo -e "##### ... done."

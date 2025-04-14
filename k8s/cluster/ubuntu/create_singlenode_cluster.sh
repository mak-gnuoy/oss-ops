#!/bin/bash

source ./create_control_plane.sh

echo -e "##### Enabling to schedule Pods on the control plane nodes ..."
kubectl taint nodes --all node-role.kubernetes.io/control-plane-
echo -e "##### ... done."

#!/bin/bash

echo -e "##### Cleaning up cluster ..."
sudo kubeadm reset
rm -rf $HOME/.kube
echo -e "##### ... done."

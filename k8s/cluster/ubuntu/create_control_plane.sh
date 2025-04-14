#!/bin/bash

echo -e "##### Creating cluster ..."
ip=`hostname -I | cut -d " " -f 1`
#sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --control-plane-endpoint=$ip --apiserver-advertise-address=$ip
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 
echo -e "##### ... done."
 
echo -e "##### Copying config for non-root user ..."
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
echo -e "##### ... done."

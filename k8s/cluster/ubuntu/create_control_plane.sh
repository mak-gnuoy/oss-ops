#!/bin/bash

sudo hostnamectl set-hostname control-plane

echo -e "##### Creating cluster ..."
POD_NETWORK_CIDR=10.244.0.0/16
ip=`hostname -I | cut -d " " -f 1`
#sudo kubeadm init --pod-network-cidr=$POD_NETWORK_CIDR --control-plane-endpoint=$ip --apiserver-advertise-address=$ip
sudo kubeadm init --pod-network-cidr=$POD_NETWORK_CIDR 
echo -e "##### ... done."
 
echo -e "##### Copying config for non-root user ..."
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
echo -e "##### ... done."
#export KUBECONFIG=/etc/kubernetes/admin.conf

source ./create_calico.sh

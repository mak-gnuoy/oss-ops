#!/bin/bash

echo -e "##### Changing to swapoff ..."
sudo swapoff -a
echo -e "##### ... done."

echo -e "##### Configuring Notwork ..."
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.ipv4.ip_forward = 1
EOF
sudo sysctl --system
echo -e "##### ... done."

# Variables
PLATFORM=linux
ARCH=amd64
SYSTEMD_DIR=/usr/lib/systemd/system/
DOWNLOAD_DIR=
INSTALL_DIR=
TEMP_DIR=/tmp/k8s
mkdir -p $TEMP_DIR

echo -e "##### Installing containerd ..."
# https://github.com/containerd/containerd/blob/main/docs/getting-started.md
CONTAINERD_VERSION=2.0.4
INSTALL_DIR=/usr/local
curl -sL https://github.com/containerd/containerd/releases/download/v$CONTAINERD_VERSION/containerd-$CONTAINERD_VERSION-$PLATFORM-$ARCH.tar.gz | sudo tar -C $INSTALL_DIR -xz
sudo curl -sL -o $SYSTEMD_DIR/containerd.service https://raw.githubusercontent.com/containerd/containerd/main/containerd.service
sudo systemctl daemon-reload 
sudo systemctl enable --now containerd
echo -e "##### ... done."

echo -e "##### Installing runc ..."
# https://github.com/containerd/containerd/blob/main/docs/getting-started.md
RUNC_VERSION=1.2.6
INSTALL_DIR=/usr/local/sbin
curl -sL -o $TEMP_DIR/runc.$ARCH https://github.com/opencontainers/runc/releases/download/v$RUNC_VERSION/runc.$ARCH 
sudo install -m 755 $TEMP_DIR/runc.$ARCH $INSTALL_DIR/runc 
echo -e "##### ... done."

echo -e "##### Installing CNI Plugin ..."
# https://github.com/containerd/containerd/blob/main/docs/getting-started.md
CNI_PLUGIN_VERSION=1.6.2
INSTALL_DIR=/opt/cni/bin
mkdir -p $INSTALL_DIR 
curl -sL https://github.com/containernetworking/plugins/releases/download/v$CNI_PLUGIN_VERSION/cni-plugins-$PLATFORM-$ARCH-v$CNI_PLUGIN_VERSION.tgz | sudo tar -C $INSTALL_DIR -xz 
echo -e "##### ... done."

echo -e "##### Installing kubeadm, kubectl and kubelet ..."
# https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/
K8S_VERSION=1.32
sudo apt-get update
# apt-transport-https may be a dummy package; if so, you can skip that package
sudo apt-get install -y apt-transport-https ca-certificates curl gpg
# If the directory `/etc/apt/keyrings` does not exist, it should be created before the curl command, read the note below.
# sudo mkdir -p -m 755 /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v$K8S_VERSION/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
# This overwrites any existing configuration in /etc/apt/sources.list.d/kubernetes.list
echo -e 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v'$K8S_VERSION'/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
sudo systemctl enable --now kubelet
echo -e "##### ... done."

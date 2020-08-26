#!/bin/sh
set -ex

kubeadm reset
sudo apt-get purge -y kubeadm kubectl kubelet kubernetes-cni kube*   
sudo apt-get autoremove -y  
sudo rm -rf ~/.kube


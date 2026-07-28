#!/bin/bash
## K3s
curl -sfL https://get.k3s.io/ | sh -
mkdir -p $HOME/.kube
sudo cp /etc/rancher/k3s/k3s.yaml $HOME/.kube/config
sudo chown $USER:$USER $HOME/.kube/config

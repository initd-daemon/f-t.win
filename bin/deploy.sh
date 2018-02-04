#!/bin/bash
apt update
apt install -y curl
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl
kubectl --kubeconfig=bin/kubeconfig.yaml apply -f bin/kube/deployment.yaml
kubectl --kubeconfig=bin/kubeconfig.yaml apply -f bin/kube/ingress.yaml
kubectl --kubeconfig=bin/kubeconfig.yaml apply -f bin/kube/service.yaml

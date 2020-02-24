#!/bin/bash
echo "Installing Go"
wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.13.4.linux-amd64.tar.gz
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
echo "export GOPATH=\$HOME/go" >> ~/.bashrc
source ~/.bashrc

echo "Installing Helm"
curl -L https://git.io/get_helm.sh | bash
helm init

echo  "Finishing with NSM"
git clone https://github.com/networkservicemesh/networkservicemesh
cd networkservicemesh
./scripts/install-protoc.sh
go install github.com/golang/protobuf/protoc-gen-go
go install k8s.io/code-generator/cmd/deepcopy-gen

go generate ./...
go build ./...

make k8s-build
make helm-init
make helm-install-nsm


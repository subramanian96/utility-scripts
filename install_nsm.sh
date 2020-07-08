#!/bin/bash
export SCRIPT_DIR=$(realpath $(dirname $0))
source $SCRIPT_DIR/install_go.sh

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


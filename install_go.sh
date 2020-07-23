#!/bin/bash
echo "Installing Go"
export SCRIPT_DIR=$(realpath $(dirname $0))
pushd SCRIPT_DIR
wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.13.4.linux-amd64.tar.gz
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
echo "export GOPATH=\$HOME/go" >> ~/.bashrc
source ~/.bashrc
rm -rf go1.13.4.linux-amd64.tar.gz
popd


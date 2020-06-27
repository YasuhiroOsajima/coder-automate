#!/bin/sh

GO_VERSION=go1.14.4

apt update
apt install bison gcc make -y
export -n GOPATH
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
source /root/.gvm/scripts/gvm
gvm install ${GO_VERSION}  -B
gvm use ${GO_VERSION} --default

pkglist=(
ms-vscode.Go
)

for var in ${pkglist[@]}
do
    code-server --install-extension $var
done

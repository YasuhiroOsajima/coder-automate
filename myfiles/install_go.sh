#!/bin/sh

apt update
apt install bison gcc make -y
export -n GOPATH
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
source /root/.gvm/scripts/gvm
gvm install go1.13.8 -B
gvm use go1.13.8 --default

pkglist=(
ms-vscode.Go
)

for var in ${pkglist[@]}
do
    code-server --install-extension $var
done

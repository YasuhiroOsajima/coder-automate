#!/bin/sh

apt update
apt install python3 python3-venv python3-pip -y

pkglist=(
magicstack.MagicPython
ms-python.python
)

for var in ${pkglist[@]}
do
    code-server --install-extension $var
done

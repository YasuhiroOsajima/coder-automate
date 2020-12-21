#!/bin/sh

apt update
apt install build-essential libncursesw5-dev libgdbm-dev libc6-dev zlib1g-dev libsqlite3-dev tk-dev libssl-dev openssl libbz2-dev libreadline-dev libffi-dev -y
apt install git -y

git clone https://github.com/pyenv/pyenv.git ~/.pyenv

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
source ~/.bashrc

pkglist=(
magicstack.MagicPython
ms-python.python
)

# https://note.com/digzero/n/n70ee0402a92b
# ms-python.python is sould be version 2020.5.86806

for var in ${pkglist[@]}
do
    code-server --install-extension $var
done

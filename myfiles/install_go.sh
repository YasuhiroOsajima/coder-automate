#!/bin/sh

git clone https://github.com/syndbg/goenv.git ~/.goenv

echo 'export GOENV_ROOT="$HOME/.goenv"' >> ~/.bashrc
echo 'export PATH="$GOENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(goenv init -)"' >> ~/.bashrc
source ~/.bashrc

# ms-vscode.Go
pkglist=(
golang.go
)

for var in ${pkglist[@]}
do
    code-server --install-extension $var
done


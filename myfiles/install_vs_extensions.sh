#!/bin/sh
 
# Visual Studio Code :: Package list
pkglist=(
CoenraadS.bracket-pair-colorizer-2
DavidAnson.vscode-markdownlint
mechatroner.rainbow-csv
PKief.material-icon-theme
redhat.vscode-yaml
rokoroku.vscode-theme-darcula
streetsidesoftware.code-spell-checker
vscodevim.vim
yzhang.markdown-all-in-one
)

for var in ${pkglist[@]}
do
    code-server --install-extension $var
done

#!/bin/sh
 
# Visual Studio Code :: Package list
pkglist=(
CoenraadS.bracket-pair-colorizer-2
danields761.dracula-theme-from-intellij-pythoned
DavidAnson.vscode-markdownlint
magicstack.MagicPython
mechatroner.rainbow-csv
ms-python.python
ms-vscode.Go
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

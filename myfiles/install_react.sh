#!/bin/sh

# ex.
# ndenv install v13.13.0
# ndenv rehash
# ndenv global v13.13.0
# npm install -g yarn

# yarn create react-app my-app --template typescript
# yarn add -D prettier prettier-eslint prettier-eslint-cli
# yarn add -D eslint-config-prettier eslint-plugin-prettier


pkglist=(
dbaeumer.vscode-eslint
esbenp.prettier-vscode
infeng.vscode-react-typescript
ms-vscode.typescript-javascript-grammar
)

for var in ${pkglist[@]}
do
    code-server --install-extension $var
done



# yarn add -D eslint eslint-plugin-react @typescript-eslint/eslint-plugin @typescript-eslint/parser

# https://github.com/oukayuka/ReactBeginnersBook-2.0/tree/master/06-lint/01-eslint/.eslintrc.js
# https://github.com/oukayuka/ReactBeginnersBook-2.0/tree/master/06-lint/03-mysetting

# yarn add react-router react-router-dom @types/react-router @types/react-router-dom
# yarn add react-helmet @types/react-helmet

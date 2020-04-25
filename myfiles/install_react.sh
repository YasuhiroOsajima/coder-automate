#!/bin/sh

# ex.
# ndenv install v13.13.0
# ndenv rehash
# ndenv global v13.13.0
# npm install -g yarn

# yarn create react-app my-app --template typescript

# yarn add -D prettier prettier-eslint prettier-eslint-cli
# yarn add -D eslint-config-prettier eslint-plugin-prettier
# yarn add -D eslint-config-airbnb

# ./node_modules/.bin/eslint --init
# yarn add -D eslint-plugin-react@^7.19.0 @typescript-eslint/eslint-plugin@latest eslint-config-airbnb@latest eslint@^5.16.0 || ^6.8.0 eslint-plugin-import@^2.20.1 eslint-plugin-jsx-a11y@^6.2.3 eslint-plugin-react-hooks@^2.5.0 || ^1.7.0 @typescript-eslint/parser@latest

# vim package.json
# 
# "eslintConfig": {
#     "extends": [
#       "react-app",
#       "airbnb"     <-
#     ],
#     "settings": {
#       "react": {
#         "version": "16.11"
#       }
#     }
#   },


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

git clone https://github.com/riywo/ndenv ~/.ndenv

echo 'export PATH="$HOME/.ndenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(ndenv init -)"' >> ~/.bashrc

source ~/.bashrc; git clone https://github.com/riywo/node-build.git $(ndenv root)/plugins/node-build

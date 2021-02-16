#!/bin/sh

echo "alias ls='ls --color=auto'" >> ~/.bashrc

apt install tmux git -y
cp tmux.conf ~/.tmux.conf


apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
     $(lsb_release -cs) \
     stable"
apt update
apt install docker-ce docker-ce-cli containerd.io -y

systemctl enable docker

curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

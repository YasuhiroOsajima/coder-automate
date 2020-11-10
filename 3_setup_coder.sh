#!/bin/sh

# https://stackoverflow.com/questions/22475849/node-js-what-is-enospc-error-and-how-to-solve/32600959#32600959
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

firewall-cmd --zone=trusted --change-interface=docker0
firewall-cmd --permanent --zone=trusted --change-interface=docker0


docker run -d \
  --name code-server \
  --publish ${CODE_SERVER_PORT}:8080 \
  -e PASSWORD=${CODE_SERVER_PASSWORD} \
  --mount type=bind,source="${PWD}/myfiles",target="/root/myfiles" \
  --mount type=bind,source="${PWD}/settings",target="/root/.local/share/code-server" \
  --mount type=bind,source="${PWD}/certs",target="/.certs" \
  --mount type=bind,source="/var/run/docker.sock",target="/var/run/docker.sock" \
  --user $(id -u):$(id -g) \
  codercom/code-server:${CODE_SERVER_VERSION} \
  --cert="/.certs/cert.pem" \
  --cert-key="/.certs/privkey.pem"

docker exec code-server bash ~/myfiles/install_vs_extensions.sh
docker stop code-server
docker start code-server
 
docker logs code-server

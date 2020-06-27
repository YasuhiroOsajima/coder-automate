#!/bin/sh

# https://stackoverflow.com/questions/22475849/node-js-what-is-enospc-error-and-how-to-solve/32600959#32600959
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

firewall-cmd --zone=public --add-masquerade --permanent
firewall-cmd --reload

podman build -t code-server-build:${CODE_SERVER_VERSION} \
  --build-arg CODE_SERVER_VERSION="${CODE_SERVER_VERSION}"  .

podman run -d \
  --name code-server-build \
  --publish ${CODE_SERVER_PORT}:8080 \
  -e PASSWORD=${CODE_SERVER_PASSWORD} \
  --mount type=bind,source="${PWD}/myfiles",target="/root/myfiles" \
  --mount type=bind,source="${PWD}/settings",target="/root/.local/share/code-server" \
  --mount type=bind,source="${PWD}/certs",target="/.certs" \
  --user $(id -u):$(id -g) \
  localhost/code-server-build:${CODE_SERVER_VERSION} \
  --cert="/.certs/cert.pem" \
  --cert-key="/.certs/privkey.pem"

podman exec code-server-build bash ~/myfiles/install_vs_extensions.sh
podman stop code-server-build
podman start code-server-build

podman logs code-server-build

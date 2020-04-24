firewall-cmd --zone=public --add-masquerade --permanent
firewall-cmd --reload

podman build -t code-server-build:${CODE_SERVER_VERSION} --build-arg CODE_SERVER_VERSION="${CODE_SERVER_VERSION}"  .

podman run -d \
--name code-server-build \
--publish ${CODE_SERVER_PORT}:8080 \
--mount type=bind,source="${PWD}/myfiles",target="/root/myfiles" \
--mount type=bind,source="${PWD}/settings",target="/root/.local/share/code-server" \
--mount type=bind,source="${PWD}/certs",target="/.certs" \
--user $(id -u):$(id -g) \
localhost/code-server-build:${CODE_SERVER_VERSION} \
--auth none \
--cert="/.certs/cert.pem" \
--cert-key="/.certs/privkey.pem"

podman exec code-server-build bash ~/myfiles/install_go.sh
podman exec code-server-build bash ~/myfiles/install_python3.sh
podman exec code-server-build bash ~/myfiles/install_nodejs.sh
podman exec code-server-build bash ~/myfiles/install_vs_extensions.sh

podman stop code-server-build
podman start code-server-build

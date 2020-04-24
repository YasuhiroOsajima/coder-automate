#!/bin/sh

podman exec code-server-build bash ~/myfiles/install_python3.sh
podman stop code-server-build
podman start code-server-build

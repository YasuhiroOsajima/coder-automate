#!/bin/sh

docker exec code-server bash ~/myfiles/install_python3.sh
docker stop code-server
docker start code-server

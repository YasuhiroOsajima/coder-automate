#!/bin/sh

docker exec code-server bash ~/myfiles/install_go.sh
docker stop code-server
docker start code-server

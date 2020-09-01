#!/bin/sh

docker exec code-server bash ~/myfiles/install_nodejs.sh
docker stop code-server
docker start code-server

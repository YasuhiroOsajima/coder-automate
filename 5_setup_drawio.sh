#!/bin/sh

# https://hub.docker.com/r/fjudith/draw.io
# 8080 is http
# 8443 is https
# If using LETS_ENCRYPT_ENABLED=true, port 80 is cert-bot

DRAW_IO_VERSION=13.1.1

firewall-cmd --zone=public --add-service=http
firewall-cmd --zone=public --add-service=https --permanent

docker run -t -d \
  -e LETS_ENCRYPT_ENABLED=true \
  -e PUBLIC_DNS=${SERVER_FQDN} \
  --name="drawio" \
  -p 80:80 \
  -p 443:8443 fjudith/draw.io:${DRAW_IO_VERSION}

firewall-cmd --reload

#!/bin/sh

snap install --classic certbot
ln -s /snap/bin/certbot /usr/bin/certbot

ufw allow 80/tcp
certbot certonly --standalone -d ${SERVER_FQDN} -m ${MAIL_ADDRESS} --agree-tos -n
ufw delete allow 80/tcp

cp -fL ${PRIVATE_KEY_PATH} certs/privkey.pem
cp -fL ${CERT_FILE_PATH} certs/cert.pem

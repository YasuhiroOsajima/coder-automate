git clone https://github.com/certbot/certbot

firewall-cmd --zone=public --add-service=http
./certbot/certbot-auto certonly --standalone -d ${SERVER_FQDN} -m ${MAIL_ADDRESS} --agree-tos -n
firewall-cmd --reload

cp -fL ${PRIVATE_KEY_PATH} certs/privkey.pem
cp -fL ${CERT_FILE_PATH} certs/cert.pem

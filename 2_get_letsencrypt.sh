git clone https://github.com/certbot/certbot

cd certbot/
firewall-cmd --zone=public --add-service=http
./certbot-auto certonly --standalone -d ${SERVER_FQDN} -m ${MAIL_ADDRESS} --agree-tos -n
firewall-cmd --reload

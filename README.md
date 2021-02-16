# coder-automate
Automate setup code-server with Let's encrypt.  

This tool is depending to Ubuntu 20.04.

```bash
# apt update
# apt upgrade -y
# reboot

# git clone https://github.com/YasuhiroOsajima/coder-automate.git

# cd coder-automate/
# vim env.txt
# source env.txt

# bash 1_install_os_packages.sh
The server will reboot.

# bash 2_get_letsencrypt.sh
# bash 3_setup_coder.sh
```

Then accsess to the FQDN with the port from web browser. 

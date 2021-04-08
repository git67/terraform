#!/usr/bin/bash

PRIV_KEY=${1:-"NONE"}

_add_ssh_agent()
{
if [ ${1} != "NONE" ]; then
	chmod 600 ${1}
	echo "eval \"\$(ssh-agent -s)\" " >> ~/.bashrc
	echo "ssh-add ${1}" >> ~/.bashrc
fi
}

_add_apache()
{
yum install http -y
sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf
echo "hi world" >> /var/www/html/index.html
systemctl start httpd
}


# main
_add_ssh_agent ${PRIV_KEY}

#_add_apache

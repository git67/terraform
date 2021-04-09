#!/usr/bin/bash

PRIV_KEY=${1:-"NONE"}
TIME_OUT=60

_wait_for_finish()
{
until [ -f /var/lib/cloud/instance/boot-finished ]
do
  COUNT=$(( ${COUNT} + 1 ))
  [ ${COUNT} -gt ${TIME_OUT} ] && exit 1
  sleep 1
done
}

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
sudo yum install httpd -y
sudo sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf
sudo touch /var/www/html/index.html
sudo chmod 666 /var/www/html/index.html
sudo echo "hi world" >> /var/www/html/index.html
sudo systemctl start httpd
}


# main
_wait_for_finish
_add_ssh_agent ${PRIV_KEY}
_add_apache


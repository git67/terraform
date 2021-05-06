#!/usr/bin/bash
set -euo pipefail

export PATH="/usr/bin:/usr/sbin/:${PATH}"

PRIV_KEY=${1:-"NONE"}
TIME_OUT=60
FINAL_WAIT_DELAY=5

_wait_for_finish()
{
COUNT=0
until [ -f /var/lib/cloud/instance/boot-finished ]
do
  COUNT=$(( ${COUNT} + 1 ))
  [ ${COUNT} -gt ${1} ] && exit 1
  sleep 1
done
sleep ${2}
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
IP=$(ip r show|grep " src "|cut -d " " -f 3,9)
sudo yum install httpd -y
sudo sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf
sudo touch /var/www/html/index.html
sudo chmod 666 /var/www/html/index.html
sudo echo "${IP}" >> /var/www/html/index.html
sudo systemctl start httpd
}


# main
#_wait_for_finish ${TIME_OUT} ${FINAL_WAIT_DELAY}
#_add_ssh_agent ${PRIV_KEY}
_add_apache


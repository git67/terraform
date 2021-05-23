#!/bin/bash -x
set -euo pipefail

export PATH="/usr/bin:/usr/sbin/:${PATH}"

ELB=${1:-"NONE"}
PORT=${2:-"8080"}
PROBE_COUNT=${3:-"100"}

_probe_elb()
{
if [ ${1} = "NONE" ]; then
	exit 1
fi

while true
do
	wget -q ${ELB}:${PORT}
	grep eth0 index.html
	rm index.html*
done
}

_probe_elb ${ELB} ${PORT}

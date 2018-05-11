#!/bin/sh

# Since Ubuntu clears /var/run on reboot, create this before we try to start
if [ ! -e /var/run/OpenBTS ]; then
	mkdir /var/run/OpenBTS
fi

if [ ! -e /var/run/rrlp ]; then
	mkdir /var/run/rrlp
	chmod 777 /var/run/rrlp
fi

# place for CRD data
if [ ! -e /var/lib/OpenBTS ]; then
	mkdir /var/lib/OpenBTS
fi


systemctl start openbts
systemctl stop openbts
systemctl start openbts


echo -n "OpenBTS PID: " ; echo `ps -ef | grep "OpenBTS" | grep -wv 'grep\|vi\|vim'` | awk '{print $2}'

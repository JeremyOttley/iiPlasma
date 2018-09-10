#!/bin/bash
USERID=`id -u`
if [ ! -e /tmp/emacs$USERID/server ]
then
	echo "Starting server."
	/etc/init.d/emacs start
        while [ ! -e "/tmp/emacs$USERID/server" ] ; do sleep 1 ; done
fi

emacsclient -c "$@"

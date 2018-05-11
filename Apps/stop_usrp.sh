#!/bin/sh

# Might as well clean up after ourselves, too.
if pgrep transceiver; then killall transceiver; fi

systemctl stop openbts

#!/bin/bash

read -n1 -r -p "Please run this script with sudo permission.Do you? [n or y]" key

if [ "$key" = 'y' ]; then
  cp ~/openbts_service/systemd/asterisk.service /etc/systemd/system/
  cp ~/openbts_service/systemd/openbts.service /etc/systemd/system/
  cp ~/openbts_service/systemd/sipauthserve.service /etc/systemd/system/
  cp ~/openbts_service/systemd/smqueue.service /etc/systemd/system/

  systemctl reload openbts.service openbts.service sipauthserve.service smqueue.service
  printf "\n\n\n "
  systemctl status asterisk.service
  systemctl status sipauthserve.service
  systemctl status smqueue.service
  printf "\n\n PRESS q KEY TO CONTINUE ... \n\n\n "
  systemctl status openbts.service

  printf "\n\n If every service status is loaded, then successfully configuration \n "
else
    printf "\n\n Try again with SUDO permission \n "
    exit
fi

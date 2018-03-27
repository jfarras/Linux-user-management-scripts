#!/bin/bash

if [ $# -gt 0 ]
then
echo `sudo sed -i.bak "/$1/d" /etc/passwd`
echo `sudo sed -i.bak "/$1/d" /etc/group`
echo "esborrat $1"

sudo rm -rf /home/$1


else
echo "Introdueix usuari i permis sudo"
fi


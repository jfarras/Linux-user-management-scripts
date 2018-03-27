#!/bin/bash 

if [ $# -gt 0 ]
then
cont=`tail -n 1 /etc/passwd |awk 'BEGIN { FS = ":" } ; { print $3 }'`
cont2=`tail -n 1 /etc/passwd |awk 'BEGIN { FS = ":" } ; { print $4 }'`
cont=`expr $cont + 1`
#echo $cont
cont2=`expr $cont2 + 1`

echo "$1:x:$cont:$cont2::/home/$1:/bin/bash" >> /etc/passwd
echo `sudo echo "$1:*:18300:0:99999:5:::" >> /etc/shadow`
echo "$1:x:$cont2:" >> /etc/group
echo `sudo newgrp $1`
echo `sudo mkdir /home/$1`
echo "Home creada"

echo `sudo cp /etc/skel/.bash_logout /home/$1/.bash_logout`
echo `sudo cp /etc/skel/.bashrc /home/$1/.bashrc`
echo `sudo cp /etc/skel/.profile /home/$1/.profile`
echo `sudo chown -R $1 /home/$1`
echo `sudo chgrp -R $1 /home/$1`
#opcional el pass
#echo `sudo passwd $1` 
echo `exit`
exit
else
echo "Introdueix usuari i permisos sudo"
fi


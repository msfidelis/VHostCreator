#!/bin/bash
echo "INSTALANDO O VHOST CREATOR"
if [[ $EUID -ne 0 ]]; then
	echo -e "Este Script deve ser executado como Root ou Sudo \n"
	echo -e "\t\t\t Exemplo: sudo ./install.vhostcreator.sh  \n"
exit 1
else

  cp bin/vhost-creator /bin
  chmod 777 /bin/vhost-creator

  echo $"


  #################################################################################
  #			VHOST CREATOR SCRIPT - Debian Only9			#
  #	USAGE: vhost-creator -h you.virtualhost.com -d /path/to/project		#
  #			    v1.0 - Matheus Fidelis				#
  #################################################################################
  "
fi

#!/bin/bash
echo "INSTALANDO O VHOST CREATOR"
if [[ $EUID -ne 0 ]]; then
	echo -e "Este Script deve ser executado como Root ou Sudo \n"
	echo -e "\t\t\t Exemplo: sudo ./install.slack-vhost.sh  \n"
exit 1
else
	cp bin/slack-vhost /bin
	chmod 777 /bin/slack-vhost

	echo $"


	#################################################################################
				VHOST CREATOR SCRIPT - Slackware 14.1
		USAGE: slack-vhost -h you.virtualhost.com -d /path/to/project
				    v1.0 - Matheus Fidelis
	#################################################################################

	OBS: TENHA CERTEZA DE TER DESCOMENTADO A LINHA 487 DO ARQUIVO /etc/httpd/httpd.conf

	Include /etc/httpd/extra/httpd-vhosts.conf :)
	"
fi

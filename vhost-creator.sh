#!/bin/bash

#GERADOR AUTOMÁTICO DE VIRTUALHOSTS
# AUTHOR     :: Matheus Fidelis
# GITHUB     :: https://github.com/msfidelis
# TWITTER    :: http://twitter.com.br/fidelissauro
# S.O.       :: Debian 7, 8, Kali Linux 1.0, 2.0 e derivados

###########################################################
# MODO DE USAR: 
#               vhost-creator.sh -h teste.meusite.com -d /var/www/html/meusite

#PEGA OS ARGUMENTOS
while getopts 'h:d:' opt ; do
  case $opt in
    h) VHOST=$OPTARG ;;
    d) DIRECTORY=$OPTARG ;;
  esac
done


#CRIA O REGISTRO NO ARQUIVO HOSTS
echo "[+] CRIANDO O REGISTRO NO ARQUIVO HOSTS DO SISTEMA"
echo "127.0.0.1     $VHOST" >> /etc/hosts

echo $VHOST
echo $DIRECTORY

if [ -d "$DIRECTORY" ]; then
    #CRIA O VIRTUALHOST
    echo "[+] CRIANDO O VIRTUALHOST BASEADO APONTANDO PARA $DIRECTORY"
    echo "
    <VirtualHost *:80>
            ServerName $VHOST
            ServerAlias www.$VHOST
            DocumentRoot $DIRECTORY
            <Directory $DIRECTORY/>
                    Options Indexes FollowSymLinks
                    #MultiViews
                    AllowOverride All
                    Order allow,deny
                    allow from all
            </Directory>
            ErrorLog ${APACHE_LOG_DIR}/$VHOST.error.log
            CustomLog ${APACHE_LOG_DIR}/$VHOST.access.log combined
    </VirtualHost>
    " >> /etc/apache2/sites-available/$VHOST.conf
    
    #CRIA O LINK SIMBÓLICO NA PASTA DE SITES PUBLICADOS
    echo "[+] CRIANDO LINK SIMBÓLICO PARA PUBLICAR O SITE $VHOST"
        ln -s /etc/apache2/sites-available/$VHOST.conf /etc/apache2/sites-enabled/$VHOST.conf


    echo "[+] HABILITANDO O VHOST NO SISTEMA"
    a2ensite $VHOST.conf

    echo "[+] REINICIANDO O APACHE"
    systemctl restart apache2.service
    
else 
    echo [-] DIRETÓRIO DO SITE NÃO ENCONTRADO... 
fi
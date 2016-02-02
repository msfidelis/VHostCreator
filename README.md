# VHostCreator
Script simples para automatizar a criação de Virtualhosts no Apache 

#GERADOR AUTOMÁTICO DE VIRTUALHOSTS
AUTHOR     :: Matheus Fidelis

GITHUB     :: https://github.com/msfidelis

TWITTER    :: https://twitter.com/fidelissauro

S.O.       :: Debian 7, 8, Kali Linux 1.0, 2.0, Ubuntu, Slackware 14, 14.1 e derivados

Script adaptado do projeto: https://github.com/lauroguedes/vhautlinux

###########################################################
# MODO DE USAR: 

* Faça a instalação do projeto
```
root@fidelis~#: git clone https://github.com/msfidelis/VHostCreator.git

root@fidelis~#: cd VHostCreator

```
#DEBIAN DISTROS
```
root@fidelis~#: chmod 777 install-vhostcreator.sh ; ./install-vhostcreator.sh
```

* CRIE O PROJETO

```
root@fidelis~#: vhost-creator -h teste.meusite.com -d /var/www/html/meusite
```

#SLACKWARE DISTROS

* Edite o arquivo de configurações do httpd:
```
root@fidelis~#: vim /etc/httpd/httpd.conf
```

* E descomente a linha referênte aos Virtual Hosts:
```
# Virtual hosts
Include /etc/httpd/extra/httpd-vhosts.conf
```

* Instale o projeto:
```
root@fidelis~#: chmod 777 install.slack-vhost.sh ; ./install.slack-vhost.sh
```

* CRIE O PROJETO
```
root@fidelis~#: slack-vhost -h teste.meusite.com -d /var/www/html/meusite
```


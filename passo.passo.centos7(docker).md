Cen�rio
=================================================================================
Docker

CentOS 7 - Docker
=================================================================================

## Instala��o

1- Remover vers�es aneriores caso existam.

	yum remove docker
	yum remove docker-common
	yum remove container-selinux
	yum remove docker-selinnux
	yum remove docker-engine

2- Instalar yum-utils para fornecer comando "yum-config-manager" para adicionar o 
reposit�rio do Docker.

	yum install -y yum-utils

3- Adicionar o reposit�rio

	yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

4- Instalar docker

	yum makecache fast
	yum install -y docker-ce.x86_64

5- Configurar docker para subir como servi�o ao iniciar.

	chkconfig docker on

6- Iniciar o servi�o docker

	systemctl start docker

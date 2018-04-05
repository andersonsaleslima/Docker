Ubuntu 16 - LXC-DOCKER
==================================================================================

## Instala��o

1- Certificar-se de que o suporte ao "aufs"(AnotherunionFS) est� dipon�vel

	aptitude install linux-image-extra-`uname -r`

2- Adicionar a chave do reposit�rio do docker ao apt-key para verifica��o de
pacotes

	wget -qO- https://get.docker.io/gpg | apt-key add -

3- Adicionar o reposit�rio do docker aos sources do aptitude

	echo deb http://get.docker.io/ubuntu docker main >> /etc/apt/sources.list.d/docker.list

4- Atualizar o reposit�rio com o novo acr�scimo

	apt-get install update

5- Instalar o Docker

	apt-get install lxc-docker

6- Iniciando docker e habiliando na inicialiaza��o.

	systemctl start docker
	systemctl enable docker

## Instala��o 2

1- Atualizar sistema 

	apt-get upate

2- Instalar pacotes para permitir ao apt usar um reposit�rio via https

	apt-get install apt-transport-https ca-certificates curl software-properties-common

3- Adicionar chave GPG oficial do docker

	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

4- Verificar se voc� tem agora a chave com a impress�o digital 
"9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88" 

	apt-key fingerprint 0EBFCD88 

5- Adicionando reposit�rio est�vel

	add-apt-repository  "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

6- Atualizar modifica��es no reposit�rio 

	apt-get update

7- Instalando docker

	apt-get install docker-ce

8- 


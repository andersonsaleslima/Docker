Docker
================================================================================

## Comandos

1- Obter informações gerais do docker

	docker info	

2- Verificar a versão do docker

	docker version

3- Executando daemon do docker

	docker daemon &

4- Procurando uma imagem do docker

	docker search centos

5- Baixando uma imagem

	docker pull centos:7
	docker pull ubuntu
	docker pull hell-world

6- Listar imagens

	docker images

7- Analisando propriedades da imagem

	docker inspect images centos:7

8- criando container mas não executando

	docker create --name my-docker ubuntu echo "hello-world"

9- Criando e executando docker de forma desanexada

	docker run -itd --name my-docker-2 centos:7

10- criando um novo cotainer e executando um comando

	docker run -it --name docker-hello centos:7 echo "hello_world"

11- Verificando propriedades de uma container

	docker inspect my-docker

12- Listando todos os conteiners em execulção

	docker ps

13- Listar todos os conteiners, os que estão em "running" e os "non-running"

	docker ps -a

13- Parando um container

	docker stop my-docker-2

14- Inicializando container

	docker start my-docker-2

15- Acessando bash do docker em execução

		docker attach my-docker-2

	OBS: executar "exit" para sair do container pressione <CTRL+P+Q>

16- Executando comando dentro do container sem acessá-lo

	docker exec my-docker-2 echo "teste-exec"

17- Salvando(commiting) um conteiner:

	docker commit 	

17- Removendo um conteiner

	docker rm docker-hello

18- Removendo imagem 

	docker rmi hello-world

## Comandos de rede

1- Mapeando uma porta para um container

		docker run -it -p 8080:80 -p 443 --name my-docker centos:7

	OBS.: informa que a porta 8080 no Host é aberta e deve ser mapeada na 
	porta 80 do container. A porta 443 recebeu uma porta aleatóriado Docker-Host

2- Instalar bridge-utils

	apt-get install bridge-utilss	
	brctl show 

3- criando rede com driver bridge

	docker network create --driver=bridge --subnet=192.168.20.0/24 --gateway=192.168.10.1 -o parent=enp0s9 my-net-bridge

4- verificando a rede criada

	docker network inspect my-net-bridge

4- Criando container na nova rede

	docker run -it --netowork my-net-bridge -p 80 -p 443 --name my-docker-2 centos:7

5- conectando docker à uma rede

	docker connect bridge my-docker-2

6- Desconectar um contâiner definido pelo usuário

	docker disconnect bridge my-docker-2

8- Permitir o encaminhamento do cocker para o mundo externo

	docker net.ipv4.conf.all.forwarding=1

9- Alterar as políticas de iptables 

	iptables -P FORWARD ACCEPT

## Rede macvlan

1- verificar se o modulo macvlan é suportado

	modprobe macvlan
	grep | macvlan

2- criar e configurar o novo adaptador de rede
	
	nano /etc/network/interfaces

		auto enp0s9
		iface enp0s9 inet manual

		auto macvlan0
		iface macvlan0 inet static
		  address 192.168.10.16
		  netmask 255.255.255.0
		  gateway 192.168.10.1
		  dns-nameservers 10.0.0.1
		  pre-up ip link add link enp0s9 name macvlan0 type macvlan mode bridge

3- Opcionalmente você pode configurar uma macvlan manualmente

	ip link add macvlan0 link enp0s9 type macvlan mode bridge

4- Reiniciar interface "macvlan0"

	ifup macvlan0

5- criando rede macvlan

	docker network create -d macvlan --subnet=192.168.10.0/24 --gateway=192.168.10.1 -o parent=enp0s9 my-net-macvlan

6- criando conteiner da mac vlan

	docker run -itd --network my-net-macvlan --name my-docker centos:7 bash

## Comandos de gerenciamento de recursos

1- definindo memoria

	docker run -it -m 512M --name my-docker centos:7

## Volume

1- Montando um diretório do host como um volume de dados

	docker run -d -v /var/app:/var/www/html --name my-docker centos:7 

## Dockerfile

1- Exempo de arquivo dockerfile

	nano dockerfile

		FROM ubuntu
		ENTRYPOINT ["top", "-b"]
		CMD ["-c"]

2- Criando a imagem apartir de um arquivo

	docker build -t top .

3- Criando um conteiner aprtir da imagem criada

		docker run -it --name docker-top top

	OBS.: Para sair do container sem desativá-lo pressione <CTRL+P+Q>

4- Para verificar se container está sendo executado com sucesso o top execute um
comando no container sem precisar acessá-lo

	docker exec -it docker-top ps -aux

5- Para acessar o "bash" do container.

	docker exec -it  docker-top /bin/bash 

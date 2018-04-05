DOCKERFILE JBOSS
==========================================================================

1- Criar imagem base para o JBOSS

	docker build -t my-jboss/base ./1.BASE/

2- Criar imgem JDK para o JBOSS

	docker build -t my-jboss/jdk ./2.JDK/

3- Criar imagem Wildfly para JBOSS

	docker build -t my-jboss/wildfly ./3.wildfly/


4- Criando uma imagem do wildfly com OJDBC

	docker build -t my-boss/wilfly-ojdbc ./4.ojdbc/

5- Criando imagem tomcat

	docker build -t my-jboss/tomcat .5/tomcat/

6- Alterar o dockerfile que irá gerar a imagem de uso. Depois criar a imagem.

	docker build -t my-jboss/use ./6.USE/

7- Criar container

	docker run -itd --name host-jboss my-jboss/use

8- Para acessar o "bash" do container execute:

	docker exec -it host-jboss /bin/bash


Ubuntu - Apache 
================================================================================

1- criando imagem do docker file do apache no ubuntu

	docker build -t apache-ubuntu .

2- criano conteiner 

		docker run -it -p 80:80 -p 443:443 --name apache-ubuntu apache-ubuntu

	OBS.: 

3- Para verificar se container est� sendo executado com sucesso o apache execute 
um comando no container sem precisar acess�-lo.

	docker exec -it ubuntu-apache ps -aux


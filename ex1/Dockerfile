#sendo utilizado a versão do ubuntu 
FROM ubuntu

#definindo hora local
RUN ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

#instalaçâo do certificado SSL Let´s Encry´t
RUN apt-get -y update && apt-get -y install \
    ca-certificates \
    git \
    openssl

#utilizando a versão 6.11 do Wordpress
RUN cd /var/www/html \
    && wget https://wordpress.org/latest.tar.gz \
    && tar xzf latest.tar.gz 

#criação da rede interna para conectar ao banco de dados
RUN sudo su - postgres \
    && psql \ 
    && create database teste1 \
    && create user adminteste1 with password 'secret123' \
    && grant all privileges on database teste1 to adminteste1 \
    && q

RUN sed -e 's/database_name_here/teste1/g' -e 's/username_here/adminteste1/g' -e 's/password_here/secret123/g' -i ./wp-config.php

EXPOSE 8080
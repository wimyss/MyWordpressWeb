#!/bin/bash

apt update && apt upgrade -y

cd / && touch docker-compose.yml

echo "version: '3.9'

services:

    mysql:

        image: wimys/mariadb

        container_name: compose-mariadb

        ports:

            - '3306:3306'

        networks:

            wordpress-nt:

                ipv4_address: 172.20.0.2



    wordpress:

        image: wimys/wordpress

        container_name: compose-wordpress

        ports:

            - '80:80'

        networks:

            wordpress-nt:

                ipv4_address: 172.20.0.3

        depends_on:

            - mysql



networks:

    wordpress-nt:

        ipam:

            config:

                - subnet: 172.20.0.0/16" > docker-compose.yml

docker compose up -d

echo "
echo "http://localhost"
echo "docker-compsoe it start | Put << docker compose down >> for stop"




#!/bin/bash

if ! command -v docker &> /dev/null
then
    echo "Docker is not installed. Please install Docker before to use the script."
    exit
fi

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

        environment:

            MYSQL_ROOT_PASSWORD: SKJDHQDakjsnd87587

            MYSQL_DATABASE: wordpress

            MYSQL_USER: wpuser

            MYSQL_PASSWORD: SKJDHQDakjsnd87587



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

        environment:

            WORDPRESS_DB_HOST: mysql

            WORDPRESS_DB_USER: wpuser

            WORDPRESS_DB_PASSWORD: SKJDHQDakjsnd87587

            WORDPRESS_DB_NAME: wordpress



networks:



    wordpress-nt:



        ipam:



            config:



                - subnet: 172.20.0.0/16" > docker-compose.yml

docker compose -p wimyswordpress up -d && sudo rm ./wget-log && clear

echo "http://localhost"
echo "docker-compsoe it start | Put << docker compose down >> for stop"
echo "Made by © 2024 wimyss"



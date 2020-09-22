#!/bin/bash

docker-compose down --rmi all
docker-compose build

sudo docker login --username=$DOCKER_USERNAME --password=$DOCKER_PASSWORD

# Login With Credentials

sudo docker-compose push

#!/bin/bash

docker-compose down --rmi all
docker-compose build

sudo docker login

# Login With Credentials

sudo docker-compose push

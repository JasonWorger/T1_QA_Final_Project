#!/bin/bash

docker-compose down --rmi all
docker-compose build
sudo docker login
sudo docker-compose push

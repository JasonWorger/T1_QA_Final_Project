#!/bin/bash

# cd into docker repository.

cd docker

# Remove our previous images.
docker-compose down --rmi all

# Clone Angular Repository.

git clone https://github.com/spring-petclinic/spring-petclinic-angular.git

# Clone REST Repository.

git clone https://github.com/spring-petclinic/spring-petclinic-rest.git

# Copy Dockerfile from Dockerfiles/PetClinicREST to REST cloned folder.

sudo cp Dockerfiles/PetClinicREST/Dockerfile spring-petclinic-rest

# Copy Dockerfile from Dockerfiles/PetClinicAngular to Angular cloned folder.

sudo cp Dockerfiles/PetClinicAngular/Dockerfile spring-petclinic-angular
sudo cp Dockerfiles/PetClinicAngular/.dockerignore spring-petclinic-angular

# Run docker-compose.

docker-compose build

# Login with our docker credentials.

sudo docker login

# Push our built images to docker

sudo docker-compose push

# Remove our cloned git repos to save space.

sudo rm -r spring-petclinic-angular
sudo rm -r spring-petclinic-rest
#!/bin/bash

# cd into docker repository.

cd docker
echo "cd into docker"
# Remove our previous images.
docker-compose down --rmi all
echo "Removed images"
# Clone Angular Repository.

git clone https://github.com/spring-petclinic/spring-petclinic-angular.git
echo "cloned angular"
# Clone REST Repository.

git clone https://github.com/spring-petclinic/spring-petclinic-rest.git
echo "cloned rest"
# Copy Dockerfile from Dockerfiles/PetClinicREST to REST cloned folder.

sudo cp Dockerfiles/PetClinicREST/Dockerfile spring-petclinic-rest
echo  "copied rest dockerfile"
# Copy Dockerfile from Dockerfiles/PetClinicAngular to Angular cloned folder.

sudo cp Dockerfiles/PetClinicAngular/Dockerfile spring-petclinic-angular
sudo cp Dockerfiles/PetClinicAngular/.dockerignore spring-petclinic-angular

# Run docker-compose.
echo "About to build containers"
docker-compose build
echo "Built containers"
# Login with our docker credentials.

sudo docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
echo "Logged in"
# Push our built images to docker

sudo docker-compose push
echo "Pushed containers"
# Remove our cloned git repos to save space.

sudo rm -rf spring-petclinic-angular
sudo rm -rf spring-petclinic-rest
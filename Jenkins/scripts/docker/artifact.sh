#!/bin/bash

# cd into docker repository.
sudo apt-get install openjdk-8-jre maven default-jre

cd docker

echo "cd into docker"
echo "The working directory is:"
pwd

# Prune our system.

docker system prune -f

# Removing previous git repos.

sudo rm -rf spring-petclinic-angular
sudo rm -rf spring-petclinic-rest

# Clone REST Repository.
git clone https://github.com/spring-petclinic/spring-petclinic-rest.git

# Copy Dockerfile from Dockerfiles/PetClinicREST to REST cloned folder.
sudo cp Dockerfiles/PetClinicREST/Dockerfile spring-petclinic-rest

# Run docker-compose.
sudo docker-compose build
# Login with our docker credentials.

sudo docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
# Push our built images to docker

sudo docker-compose push

# Remove our cloned git repos to save space.
sudo rm -rf spring-petclinic-rest

# Clone our angular frontend repo.
git clone https://github.com/spring-petclinic/spring-petclinic-angular.git

# Change directory to the petclinic-angular folder.
cd spring-petclinic-angular.git

# Build docker image.
docker build -t spring-petclinic-angular:latest .

# Push image to docker.io.
sudo docker push spring-petclinic-angular:latest

# cd back one step.
cd ..

# Remove git repository.
sudo rm -r spring-petclinic-angular

#!/bin/bash

# ----- DEPENDENCIES -----

# Install build dependencies.
sudo apt install openjdk-8-jre maven default-jre

# cd into docker repository.
cd docker

# Prune our system.
docker system prune -f

# Remove previous git repos.
sudo rm -rf spring-petclinic-angular
sudo rm -rf spring-petclinic-rest

# ----- REST API -----

# Clone REST Repository.
git clone https://github.com/spring-petclinic/spring-petclinic-rest.git

# Copy Dockerfile from Dockerfiles/PetClinicREST to REST cloned folder.
sudo cp Dockerfiles/PetClinicREST/Dockerfile spring-petclinic-rest

# Copy database dependencies to REST cloned folder.
sudo cp buildDependencies/PetClinicREST/application-mysql.properties spring-petclinic-rest/src/main/resources/

# Replace our temporary variables with the actual values.
sed 's/{{rootPassword}}/$TF_VAR_DB_ROOT_PASSWORD/g' spring-petclinic-rest/src/main/resources/application-mysql.properties
sed 's/{{databaseURI}}/$TESTING_RDS_ENDPOINT/g' spring-petclinic-rest/src/main/resources/application-mysql.properties

# Test our sed function works.

cat spring-petclinic-rest/src/main/resources/application-mysql.properties

# Run docker-compose.
sudo docker-compose build --no-cache

# Login with our docker credentials.
sudo docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

# Push our built images to docker.
sudo docker-compose push

# Remove our cloned git repos to save space.
sudo rm -rf spring-petclinic-rest

# ----- ANGULAR -----

# Clone our angular frontend repo.
git clone https://github.com/spring-petclinic/spring-petclinic-angular.git

# Copy Dockerfile from Dockerfiles/PetClinicREST to REST cloned folder.
sudo cp Dockerfiles/PetClinicAngular/Dockerfile spring-petclinic-angular

# Copy environment dependencies to ANGULAR cloned folder.
sudo cp buildDependencies/PetClinicAngular/environment.ts spring-petclinic-angular/src/environments/environment.ts
sudo cp buildDependencies/PetClinicAngular/environment.prod.ts spring-petclinic-angular/src/environments/environment.prod.ts

# Change directory to the petclinic-angular folder.
cd spring-petclinic-angular

# Build docker image.
docker build --no-cache -t frontend:latest .

# Push image to docker.io.
sudo docker push docker.io/team1qa/frontend:latest

# cd back one step.
cd ..

# Remove git repository.
sudo rm -r spring-petclinic-angular

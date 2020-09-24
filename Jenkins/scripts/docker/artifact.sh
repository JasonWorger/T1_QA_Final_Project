#!/bin/bash

# ----- DEPENDENCIES -----

# Install build dependencies.
sudo apt install openjdk-8-jre maven default-jre

# cd into docker repository.
cd docker

# Prune our system.
docker system prune -f

# Remove previous git repos.
sudo rm -r spring-petclinic-angular
sudo rm -r spring-petclinic-rest

# ----- REST API -----

# Clone REST Repository.
git clone https://github.com/spring-petclinic/spring-petclinic-rest.git

# Copy Dockerfile from Dockerfiles/PetClinicREST to REST cloned folder.
sudo cp Dockerfiles/PetClinicREST/Dockerfile spring-petclinic-rest

# Copy database dependencies to REST cloned folder.
sudo cp buildDependencies/PetClinicREST/application.properties spring-petclinic-rest/src/main/resources/
sudo cp buildDependencies/PetClinicREST/application-mysql.properties spring-petclinic-rest/src/main/resources/

# Replace our temporary variables with the actual values.
sed -i "s|{{rootPassword}}|$TF_VAR_DB_ROOT_PASSWORD|g" spring-petclinic-rest/src/main/resources/application-mysql.properties
sed -i "s|{{dbURI}}|$TESTING_RDS_ENDPOINT|g" spring-petclinic-rest/src/main/resources/application-mysql.properties

# Test our sed function works.
# cat spring-petclinic-rest/src/main/resources/application-mysql.properties

# ----- ANGULAR -----

# Clone our angular frontend repo.
git clone https://github.com/spring-petclinic/spring-petclinic-angular.git

# Copy Dockerfile from Dockerfiles/PetClinicREST to REST cloned folder.
sudo cp Dockerfiles/PetClinicAngular/Dockerfile spring-petclinic-angular

# Copy environment dependencies to ANGULAR cloned folder.
sudo cp buildDependencies/PetClinicAngular/environment.ts spring-petclinic-angular/src/environments/
sudo cp buildDependencies/PetClinicAngular/environment.prod.ts spring-petclinic-angular/src/environments/

# Test our overwrite function.
# cat spring-petclinic-angular/src/environments/environment.ts

# Run docker-compose.
sudo docker-compose build --no-cache

# Login with our docker credentials.
sudo docker login docker.io -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

# Push our built images to docker.
sudo docker-compose push

# Remove our cloned git repos to save space.
sudo rm -r spring-petclinic-rest
sudo rm -r spring-petclinic-angular




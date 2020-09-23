#!/bin/bash
git clone https://github.com/spring-petclinic/spring-petclinic-angular.git
cd spring-petclinic-angular
sudo apt install openjdk-8-jre maven default-jre
npm i karma
ng test

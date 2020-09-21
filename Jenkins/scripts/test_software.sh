#! /bin/bash
git clone https://github.com/spring-petclinic/spring-petclinic-rest.git

cd spring-petclinic/spring-petclinic-rest/

mvn test

cd ../..

sudo rm -r spring-petclinic
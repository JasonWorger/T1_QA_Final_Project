#!/bin/bash
#sudo apt install openjdk-8-jre maven default-jre
#npm install
#ng update
#npm update
#npm i karma karma-chrome-launcher chromium
#export CHROME_BIN="/usr/local/lib/node_modules/chromium"
#ng test

git clone https://github.com/spring-petclinic/spring-petclinic-rest.git

cd spring-petclinic-rest

mvn test

cd ..

sudo rm -rf spring-petclinic-rest

#!/bin/sh

# Make a temporary directory.

mkdir database_temp && cd database_temp

# Clone down the Pet Clinic REST API.

git clone https://github.com/spring-petclinic/spring-petclinic-rest.git

# Find and move the schema files.

cp spring-petclinic-rest/src/main/resources/db/mysql/initDB.sql .
cp spring-petclinic-rest/src/main/resources/db/mysql/populateDB.sql .

# Run our files on mysql.

mysql -h terraform-20200922113603881400000001.cl3gwff76jo7.eu-west-1.rds.amazonaws.com -P 3306 -u root --password=$TF_VAR_DB_ROOT_PASSWORD < initDB.sql

mysql -h terraform-20200922113603881400000001.cl3gwff76jo7.eu-west-1.rds.amazonaws.com -P 3306 -u root --password=$TF_VAR_DB_ROOT_PASSWORD petclinic < populateDB.sql

# Clean up.

cd .. && sudo rm -r database_temp
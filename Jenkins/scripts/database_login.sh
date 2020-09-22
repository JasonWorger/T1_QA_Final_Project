#!/bin/sh

mysql -h $TESTING_RDS_ENDPOINT -P 3306 -u root -p $DATABASE_PASSWORD < path/to/file.sql
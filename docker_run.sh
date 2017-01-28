#!/usr/bin/env bash

echo running mariadb
docker run --name mariadb -v /tmp/mysql:/docker-entrypoint-initdb.d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=1234 -d mariadb:latest --lower_case_table_names=1




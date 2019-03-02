#!/usr/bin/env bash
source potato.conf
echo ${SOURCE_DB_HOST}
echo ${SOURCE_DB_USERNAME}
echo ${SOURCE_DB_PASSWORD}

SQL_QUERY="SHOW DATABASES;"
echo `mysql --host=${SOURCE_DB_HOST} --user=${SOURCE_DB_USERNAME} --password=${SOURCE_DB_PASSWORD} -e ${SQL_QUERY}`

exit 0
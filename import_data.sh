#!/usr/bin/env bash
source potatos.credential
#echo ${TARGET_DB_HOST}
#echo ${TARGET_DB_USERNAME}
#echo ${TARGET_DB_PASSWORD}

[ -z ${TARGET_DB_HOST} ] && echo "TARGET_DB_HOST is Empty" && exit 1
[ -z ${TARGET_DB_USERNAME} ] && echo "TARGET_DB_USERNAME is Empty" && exit 1
[ -z ${SOURCE_DB_PASSWORD} ] && echo "TARGET_DB_PASSWORD is Empty" && exit 1

mysql -h ${TARGET_DB_HOST} -u ${TARGET_DB_USERNAME} -p${TARGET_DB_PASSWORD} -e exit > /dev/null 2>&1

if [ $? -ne 0 ]; then
    echo "User ${TARGET_DB_USERNAME} can not connect to ${TARGET_DB_HOST} ..."
    exit 2
fi


if [ "$#" -lt 2 ]; then
    echo "2 parameters required"
    echo "1st parameter should be a text file, defined importing databases line by line."
    echo "2nd parameter should be a path, in which all the database dumpfiles are located. "
    exit 3
fi

FILE=$1
while read LINE
    do { 
        echo "Importing database ${LINE}"
        mysql -h ${TARGET_DB_HOST} -u ${TARGET_DB_USERNAME} -p${TARGET_DB_PASSWORD} ${LINE} < ${2}/${LINE}.dump
    }
done < ${FILE}

exit 0
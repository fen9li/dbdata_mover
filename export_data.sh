#!/usr/bin/env bash
source potatos.credential
#echo ${SOURCE_DB_HOST}
#echo ${SOURCE_DB_USERNAME}
#echo ${SOURCE_DB_PASSWORD}

[ -z ${SOURCE_DB_HOST} ] && echo "SOURCE_DB_HOST is Empty" && exit 1
[ -z ${SOURCE_DB_USERNAME} ] && echo "SOURCE_DB_USERNAME is Empty" && exit 1
[ -z ${SOURCE_DB_PASSWORD} ] && echo "SOURCE_DB_PASSWORD is Empty" && exit 1

mysql -h ${SOURCE_DB_HOST} -u ${SOURCE_DB_USERNAME} -p${SOURCE_DB_PASSWORD} -e exit > /dev/null 2>&1

if [ $? -ne 0 ]; then
    echo "User ${SOURCE_DB_USERNAME} can not connect to ${SOURCE_DB_HOST} ..."
    exit 2
fi


if [ "$#" -lt 2 ]; then
    echo "2 parameters required"
    echo "1st parameter should be a text file, defined  dumping databases line by line."
    echo "2nd parameter should be a path, in which the databases will be dumped to. "
    exit 3
fi

FILE=$1
while read LINE
    do { 
        echo "Dumping database ${LINE}"
        mysqldump -h ${SOURCE_DB_HOST} -u ${SOURCE_DB_USERNAME} -p${SOURCE_DB_PASSWORD} ${LINE} --databases > ${2}/${LINE}.dump
    }
done < ${FILE}

exit 0
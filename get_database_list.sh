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

if [ "$#" -lt 1 ]; then
    echo "One and only one parameter required"
    echo "The parameter should be a text file in which database names will be saved. "
    exit 3
fi

mysql -h ${SOURCE_DB_HOST} -u ${SOURCE_DB_USERNAME} -p${SOURCE_DB_PASSWORD} -B -e "SHOW DATABASES;" > ${1}

FILE=${1}
while read LINE
    do { 
        echo ${LINE}
    }
done < ${FILE}

exit 0
#!/usr/bin/env bash
source potato.credential
#echo ${SOURCE_DB_HOST}
#echo ${SOURCE_DB_USERNAME}
#echo ${SOURCE_DB_PASSWORD}

FILE=potatos.conf
while read LINE
    do { 
        echo "Dumping database ${LINE}"
        mysqldump -h ${SOURCE_DB_HOST} -u ${SOURCE_DB_USERNAME} -p${SOURCE_DB_PASSWORD} ${LINE} --databases > ${LINE}_db.dump
    }
done < ${FILE}

exit 0
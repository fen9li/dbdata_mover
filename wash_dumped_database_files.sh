#!/usr/bin/env bash
source potatos.credential
#echo ${TARGET_DB_HOST}
#echo ${TARGET_DB_USERNAME}
#echo ${TARGET_DB_PASSWORD}

[ -z ${TARGET_DB_HOST} ] && echo "TARGET_DB_HOST is Empty" && exit 1
[ -z ${TARGET_DB_USERNAME} ] && echo "TARGET_DB_USERNAME is Empty" && exit 1
[ -z ${TARGET_DB_PASSWORD} ] && echo "TARGET_DB_PASSWORD is Empty" && exit 1

mysql -h ${TARGET_DB_HOST} -u ${TARGET_DB_USERNAME} -p${TARGET_DB_PASSWORD} -e exit > /dev/null 2>&1

if [ $? -ne 0 ]; then
    echo "User ${TARGET_DB_USERNAME} can not connect to ${TARGET_DB_HOST} ..."
    exit 2
fi

if [ "$#" -lt 2 ]; then
    echo "2 parameters required"
    echo "1st parameter should be a text file, defined washing database files line by line."
    echo "2nd parameter should be a path, in which the washing database files are saved to. "
    exit 3
fi

FILE=$1
while read LINE
    do { 
        echo "Washing database ${LINE}"
        
        mv ${2}/${LINE}.db ${2}/${LINE}.db.tmp 
        cat ${2}/${LINE}.db.tmp | sed 's|`root`@`localhost`|`c1admin`@`%`|' > ${2}/${LINE}.db
        rm ${2}/${LINE}.db.tmp
    }
done < ${FILE}

exit 0
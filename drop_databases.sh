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

if [ "$#" -lt 1 ]; then
    echo "One and only one parameter required"
    echo "The parameter should be a text file, which defined databases required to drop. "
    echo "List databases in the format of one database in one line. Use / update databases.conf as your template."
    exit 3
fi

FILE=$1
while read LINE
    do { 
        echo "dropping database ${LINE}"
        mysql -h ${TARGET_DB_HOST} -u ${TARGET_DB_USERNAME} -p${TARGET_DB_PASSWORD} -e "DROP DATABASE ${LINE};" 
    }
done < ${FILE}

mysql -h ${TARGET_DB_HOST} -u ${TARGET_DB_USERNAME} -p${TARGET_DB_PASSWORD} -e "SHOW DATABASES;"

exit 0
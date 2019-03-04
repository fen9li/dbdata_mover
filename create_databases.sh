#!/usr/bin/env bash
source potatos.credential
#echo ${TARGET_DB_HOST}
#echo ${TARGET_DB_USERNAME}
#echo ${TARGET_DB_PASSWORD}

# 1st parameter: potatos.conf 
# The databases are going to be created, in the format of one database one line

if [ "$#" -lt 1 ]; then
    echo "1 parameter required"
    echo "1st parameter should be a text file, in which all creating databases are listed line by line."
    echo "Use / update potatos.conf if you dont have other ideas."
    exit 1
fi

FILE=$1
while read LINE
    do { 
        echo "Creating database ${LINE}"
        mysql -h ${TARGET_DB_HOST} -u ${TARGET_DB_USERNAME} -p${TARGET_DB_PASSWORD} -e "CREATE DATABASES ${LINE};" 
    }
done < ${FILE}

mysql -h ${TARGET_DB_HOST} -u ${TARGET_DB_USERNAME} -p${TARGET_DB_PASSWORD} -e "SHOW DATABASES;"

exit 0
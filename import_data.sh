#!/usr/bin/env bash
source potatos.credential
#echo ${TARGET_DB_HOST}
#echo ${TARGET_DB_USERNAME}
#echo ${TARGET_DB_PASSWORD}

# 1st parameter: potatos.conf 
# The databases are going to be imported, in the format of one database one line
# 2nd parameter: $dumpath 
# The location where dumpfiles are saved

if [ "$#" -lt 2 ]; then
    echo "2 parameters required"
    echo "1st parameter should be a text file, in which all importing databases are listed line by line."
    echo "2nd parameter should be a path, in which all the database dumpfiles are saved. "
    exit 1
fi

FILE=$1
while read LINE
    do { 
        echo "Importing database ${LINE}"
        mysql -h ${TARGET_DB_HOST} -u ${TARGET_DB_USERNAME} -p${TARGET_DB_PASSWORD} ${LINE} < ${2}/${LINE}.dump
    }
done < ${FILE}

exit 0
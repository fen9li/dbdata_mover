#!/usr/bin/env bash
source potatos.credential
#echo ${SOURCE_DB_HOST}
#echo ${SOURCE_DB_USERNAME}
#echo ${SOURCE_DB_PASSWORD}

# 1st parameter: potatos.conf 
# The databases are going to be dumped, in the format of one database one line
# 2nd parameter: $dumpath 
# The location to dump the databases

FILE=$1
while read LINE
    do { 
        echo "Dumping database ${LINE}"
        mysqldump -h ${SOURCE_DB_HOST} -u ${SOURCE_DB_USERNAME} -p${SOURCE_DB_PASSWORD} ${LINE} --databases > ${2}/${LINE}_db.dump
    }
done < ${FILE}

exit 0
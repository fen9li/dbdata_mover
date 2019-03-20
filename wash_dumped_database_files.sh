#!/usr/bin/env bash

if [ "$#" -lt 2 ]; then
    echo "2 parameters required"
    echo "1st parameter should be a text file, defined washing database files line by line."
    echo "2nd parameter should be a path, in which the washing database files are saved to. "
    exit 3
fi

FILE=$1
while read LINE; do
    {
        echo "Washing database ${LINE}"
        sed -i 's/`root`@`localhost`/`c1admin`@`%`/g' ${2}/${LINE}.db
    }
done <${FILE}

exit 0

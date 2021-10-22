#!/bin/bash
input="$1"
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'
echo "Running batch file: $input"
while IFS= read -r line
do
    echo -ne "${GREEN}Now Running:${NC} "
    echo "$line"
    eval $line
    if [[ $? != 0 ]]
    then
        echo -ne "${RED}Command: "
        echo -n "$line"
        echo -e " failed. Abroted.${NC}"
        exit
    fi
done < "$input"

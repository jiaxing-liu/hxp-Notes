#!/bin/bash
input="$1"
echo $input
while IFS= read -r line
do
    command $line
    if [[ $? != 0 ]]
    then
        echo "Command $line failed. Abroted."
        exit
    fi
done < "$input"

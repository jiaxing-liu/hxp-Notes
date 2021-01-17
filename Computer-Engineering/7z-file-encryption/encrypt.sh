#!/bin/bash

TARGET_DIR=$1
RANDOM_STR=$(head /dev/random | tr -dc '[:alnum:]' | head -c 1024)

mkdir -p encrypting
mv ${TARGET_DIR} encrypting/${TARGET_DIR}
echo -n ${RANDOM_STR} > ./${TARGET_DIR}/"${TARGET_DIR}.txt"
7z a -mx9 -myx9 -v1G -p"${RANDOM_STR}" -mhe ${TARGET_DIR}/${TARGET_DIR}.7z encrypting/${TARGET_DIR}
mv encrypting encrypted

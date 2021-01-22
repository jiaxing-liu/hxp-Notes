#!/bin/bash

TARGET_DIR=$1
RANDOM_STR=$(head /dev/random | tr -dc '[:alnum:]' | head -c 64)
echo $RANDOM_STR

mkdir -p encrypting
mv ${TARGET_DIR} encrypting/${TARGET_DIR}
mkdir ${TARGET_DIR}
echo ${RANDOM_STR} > ./${TARGET_DIR}/"${TARGET_DIR}.txt"
7z a -p"${RANDOM_STR}" ./${TARGET_DIR}/${TARGET_DIR}.zip ./encrypting/${TARGET_DIR}
mv encrypting encrypted

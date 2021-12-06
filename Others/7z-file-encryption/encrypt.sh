#!/bin/bash

TARGET_DIR=$1
RANDOM_STR=$(head /dev/random | tr -dc '[:print:]' | head -c 256)
echo "Password: $RANDOM_STR"

echo -n "${RANDOM_STR}" > "./password.txt"
7z a -p"${RANDOM_STR}" -mx=9 -mhe=off "./${TARGET_DIR}.7z" "./${TARGET_DIR}"
7z a "./${TARGET_DIR}.7z" "password.txt"
rm "password.txt"
mv "${TARGET_DIR}.7z" "${TARGET_DIR}_$(date +%Y%m%d%H%M%S).7z"

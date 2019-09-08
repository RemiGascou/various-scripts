#!/usr/bin/env bash

for file in $(find ./ -type f -name "*.sh" | grep -v "sourceall.sh"); do
    echo "sourcing ${file}"
    source ${file}
done

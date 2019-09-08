#!/usr/bin/env bash

isitdown(){
    if [[ $# -ne 1 ]]; then
        echo "Usage : isitdown HOST"
    else
        local HOST="${1}"
        local DATA=$(ping ${HOST} -c 2 -i 0.25 -W 2)
        local PLOSS=$(echo "${DATA}" | grep "packet loss" | awk '{split($0, a, "received, "); split(a[2], p, " packet loss"); print p[1]}')
        if [[ $(echo "${PLOSS}" | sed "s/%//g") -lt 10 ]]; then
            echo -e "Host : ${HOST} : \x1b[1;92mUP\x1b[0m (Packet loss : ${PLOSS})"
        elif [[ $(echo "${PLOSS}" | sed "s/%//g") == 100 ]]; then
            echo -e "Host : ${HOST} : \x1b[1;91mDOWN\x1b[0m (Packet loss : ${PLOSS})"
        fi
    fi
}

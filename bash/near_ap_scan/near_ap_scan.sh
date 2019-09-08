#!/usr/bin/env bash

near_ap_scan(){
    if [[ $# -ne 1 ]]; then
        echo "Usage : ${0} INTERFACE"
    else
        local INTERFACE="${1}"
        echo -e "\x1b[1m[\x1b[93mLOG\x1b[0m\x1b[1m]\x1b[0m Scanning Access points ..."
        local DATA=$(iwlist ${INTERFACE} scan 2>&1)
        if [[ $(echo "${DATA}" | grep "Interface doesn't support scanning." | wc -l) -gt 0 ]]; then
            echo -e "\x1b[1m[\x1b[91mWARN\x1b[0m\x1b[1m]\x1b[0m Interface ${INTERFACE} doesn't support scanning."
            exit -1
        else
            printf "| --- | ----------------- | -------------------- \n"
            printf "| %-3s | %-17s | %s\n" "ENC" "ADDRESS" "ESSID"
            printf "| --- | ----------------- | -------------------- \n"
            echo "${DATA}" | egrep 'Address|Encryption|ESSID'                   \
            | tr -d "\n" | sed "s/Address/\nAddress/g" | grep -e "^Address"     \
            | awk '{
                split($0, temp, "Encryption key:"); split(temp[2], encryption, " ");
                split($0, temp, "Address: "); split(temp[2], address, " ");
                split($0, temp, "ESSID:\""); split(temp[2], essid, "\"");
                printf "| %-3s | %-17s | %s\n", encryption[1],address[1] , essid[1];
            }'
            printf "| --- | ----------------- | -------------------- \n"
            echo -e "\x1b[1m[\x1b[91mWARN\x1b[0m\x1b[1m]\x1b[0m Scanning complete."
        fi
    fi
}

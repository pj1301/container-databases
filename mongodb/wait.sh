#!/bin/sh

# COLOURS
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
DEFAULT="\e[0m"

# FUNCTIONS
checkStatus()
{
    echo "${CYAN}\nPinging container socket to confirm service is ready\n${DEFAULT}"
    docker exec mongodb bash -c "echo 'db.runCommand({ ping: 1 }).ok' | mongo localhost:27017/test --quiet" && STATUS="OK" || STATUS="Error"
}

loaded()
{
    echo "${GREEN}\nMongo ready!\n${DEFAULT}"
    exit 0
}

failed()
{
    echo "${RED}\nMongo failed to load\n${DEFAULT}"
    exit 1
}

checkStatus
ATTEMPT=0

until [ $STATUS = "OK" ] || [ $ATTEMPT -eq 5 ]; do
    ATTEMPT=$((ATTEMPT+1))
    echo "ATTEMPT $ATTEMPT => MongoDB not ready..."
    sleep 3
    checkStatus
done

[ $STATUS = "OK" ] && loaded || failed

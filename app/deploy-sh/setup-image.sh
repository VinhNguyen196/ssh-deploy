#!/bin/bash
export TEMP_STR=$(docker images | grep $DOCKER_IMAGE)
TEMP_STR=$( echo ${TEMP_STR} | sed 's/^ *//g')
TEMP_STR=${TEMP_STR/ /:}
TEMP_STR=${TEMP_STR:0:`expr index "$TEMP_STR" " "`}
export DOCKER_TAG=${TEMP_STR:`expr index "$TEMP_STR" ":"`}


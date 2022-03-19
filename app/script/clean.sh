#!/bin/bash
source ~/.bashrc
echo $DOCKER_IMAGE
export TEMP_STR=$(docker images | grep $DOCKER_IMAGE)
echo $TEMP_STR
if [ "$TEMP_STR" != "" ]
then
 TEMP_STR=$( echo ${TEMP_STR} | sed 's/^ *//g')

 TEMP_STR=${TEMP_STR/ /:}

 TEMP_STR=${TEMP_STR:0:`expr index "$TEMP_STR" " "`}

 sudo sed -i 's/export DOCKER_TAG=/export DOCKER_TAG=${TEMP_STR:`expr index "$TEMP_STR" ":"`}/g' ~/.bashrc

 mkdir -p ./deploy && cd deploy

 docker compose down

 docker image rm $DOCKER_IMAGE:$DOCKER_TAG
fi
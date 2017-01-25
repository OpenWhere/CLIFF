#!/bin/bash
#
# Script to build and upload a docker image for this project
#
# $1 - tag of the image, defaults to latest
# $2 - namespace (develop, master or release)
#

set -e

IMAGE_NAME=cliff
TAG=${1:-latest}
NAMESPACE=${2}

DOCKER_VERSION=`docker --version | cut -f3 | cut -d '.' -f2`
[ ${DOCKER_VERSION} -lt 12 ] && TAG_FLAG='-f' || TAG_FLAG=''

docker pull tomcat:7-jre8
docker build -t ${IMAGE_NAME} .
docker tag ${TAG_FLAG} ${IMAGE_NAME} 080184233715.dkr.ecr.us-east-1.amazonaws.com/${NAMESPACE}/${IMAGE_NAME}:${TAG}
docker push 080184233715.dkr.ecr.us-east-1.amazonaws.com/${NAMESPACE}/${IMAGE_NAME}:${TAG}


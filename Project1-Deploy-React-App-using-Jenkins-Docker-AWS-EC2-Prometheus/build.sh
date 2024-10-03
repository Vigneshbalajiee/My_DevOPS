#! /bin/bash
echo "creating image using dockerfile"
docker build . -t $DOCKER_IMAGE:${BUILD_NUMBER}

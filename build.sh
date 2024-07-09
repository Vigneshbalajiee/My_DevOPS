#! /bin/bash
echo "creating image using dockerfile"
docker build . -t reactapp:${BUILD_NUMBER}

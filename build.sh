#! /bin/bash
echo "creating image using dockerfile"
docker build . -t reactapp:${env.BUILD_NUMBER}

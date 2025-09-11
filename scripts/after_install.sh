#!/bin/bash
set -e
echo "AfterInstall: post-copy actions (pull image)..."


DOCKER_IMAGE="gpjtech045/simple-python-flask-app:latest"
sudo docker pull "$DOCKER_IMAGE"

echo "AfterInstall: image pulled."


#!/bin/bash
set -e
echo "ApplicationStart: starting container..."

DOCKER_IMAGE="gpjtech045/simple-python-flask-app:latest"

# defensive cleanup
sudo docker stop my-python-app 2>/dev/null || true
sudo docker rm my-python-app 2>/dev/null || true

# start the container (adjust ports / env / volumes as needed)
sudo docker run -d \
  --name my-python-app \
  -p 5000:5000 \
  --restart unless-stopped \
  "$DOCKER_IMAGE"

echo "ApplicationStart: container started."


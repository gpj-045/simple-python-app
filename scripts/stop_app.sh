#!/bin/bash
set -e
echo "ApplicationStop: stopping existing container (if present)..."

if sudo docker ps -q --filter "name=my-python-app" | grep -q .; then
  sudo docker stop my-python-app || true
fi

if sudo docker ps -aq --filter "name=my-python-app" | grep -q .; then
  sudo docker rm my-python-app || true
fi

echo "ApplicationStop: done."


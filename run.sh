#!/bin/bash

set -e

IMAGE="9llabs-static:version-1.1"
CONTAINER="docker-9llabs-static"

echo "==> Building Docker image..."
sudo docker build -t "$IMAGE" -f Dockerfile .

echo "==> Stopping existing container..."
sudo docker stop "$CONTAINER" 2>/dev/null || true

echo "==> Removing existing container..."
sudo docker rm "$CONTAINER" 2>/dev/null || true

echo "==> Starting new container..."
sudo docker run \
  --expose=2021 \
  -p 2021:80 \
  -d \
  --name "$CONTAINER" \
  "$IMAGE"

echo "==> Checking container..."
sudo docker ps -f "name=$CONTAINER"

echo "==> Deployment completed successfully!"
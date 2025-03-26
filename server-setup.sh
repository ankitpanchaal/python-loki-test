#!/bin/bash
set -e

IMAGE_NAME="fastapi-app"
CONTAINER_NAME="fastapi-app-container"

# Build the Docker image
echo "Building Docker image: ${IMAGE_NAME}"
docker build -t ${IMAGE_NAME} .

# Remove any existing container with the same name
if [ "$(docker ps -a -q -f name=${CONTAINER_NAME})" ]; then
  echo "Removing existing container: ${CONTAINER_NAME}"
  docker rm -f ${CONTAINER_NAME}
fi

# Run the Docker container
echo "Running Docker container: ${CONTAINER_NAME}"
docker run -d --name ${CONTAINER_NAME} -p 80:80 ${IMAGE_NAME}

echo "FastAPI application is now running at http://localhost:80/health"

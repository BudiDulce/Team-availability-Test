#!/bin/bash
echo "Running code formatter and linter..."
npx prettier --write . || exit 1
npx eslint . || exit 1
echo "Running unit tests..."
npx jest || exit 1
echo "Building Docker image..."
docker build -t availability-app .
echo "Starting app using Docker Compose..."
docker-compose up -d
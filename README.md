# docker_ubuntu22.04_mongo_shell
This repository is responsible for building ubuntu22.04 image with mongo

# Prerequstics

Docker desktop for windows
Install docker for RHEL or ubunutu server

# Build the docker image
clone the repo and go to the directory in your local system
docker build -t <nameof the image you want) .

docker build -t ubuntu22.04_mongo_shell

# Create the container
Docker images,

docker container create -it --name ubunutu_22.04_mongo <image_name>

# Start the container
docker container start ubunutu_22.04_mongo

# Get into the container

docker exec -it ubunutu_22.04_mongo /bin/bash

# run the mongo

mongo

show dbs, show collections


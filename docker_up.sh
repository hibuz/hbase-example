#!/usr/bin/env bash

if [ ! "$( docker container inspect -f '{{.State.Running}}' hbase )" == "true" ]; then
    docker compose -f .docker/docker-compose.yaml --project-directory . up -d
    sleep 2
fi

if [[ "$OSTYPE" =~ ^msys  || "$OSTYPE" =~ ^cygwin ]]; then
    winpty docker exec -it hbase bash
else 
    docker exec -it hbase bash
fi

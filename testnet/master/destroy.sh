#!/bin/bash

docker stop $(docker ps -q)
docker rm firstnode_master ; docker rm wallet_master
docker image rm firstnode_master ; docker image rm wallet_master
docker system prune --all --force
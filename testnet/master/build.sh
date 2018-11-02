#!/bin/bash
PWD=$(basename $0)
DATA_DIR=$1

docker build testnet/master/compile -t liberty/compile:build
docker create --name extract liberty/compile:build 
docker cp extract:/root/cpuminer-multi/cpuminer $DATA_DIR/cpuminer
docker cp extract:/root/wallet/src/libertyd $DATA_DIR/libertyd
docker cp extract:/root/wallet/src/liberty-cli $DATA_DIR/liberty-cli
docker cp extract:/root/wallet/src/liberty-tx $DATA_DIR/liberty-tx
docker rm -f extract

docker network create liberty_net

docker build firstnode --build-arg data_dir=$DATA_DIR -t firstnode_master
docker run -d --name firstnode_master --net liberty_net -v ~/liberty_wallet:/var/share/liberty_wallet firstnode_master
echo "BUILD OF FIRSTNODE COMPLETE, CHECKING RUNNING CONTAINERS:"
docker ps

docker build wallet -t wallet_master
echo "BUILD OF WALLET COMPLETE, CHECKING RUNNING CONTAINERS:"
docker run -d -P --name wallet_master --net liberty_net -v ~/liberty_wallet:/var/share/liberty_wallet wallet_master

# IF YOU WANT TO CONNECT TO ONE OF THE CONTAINERS CLI TO CHECK ON THINGS USE THE FOLLOWING COMMANDS
# TO DISCONECT FROM THE CONTAINER AFTER YOU CONNECT WITHOUT KILLING IT USE <CTRL-P> <CTRL-Q>
# docker exec -it wallet_master /bin/bash or docker exec -it firstnode_master /bin/bash


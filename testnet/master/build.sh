#!/bin/bash
REALPATH=$(realpath $0)
PWD=$(dirname $REALPATH)
DATA_DIR=$(basename $1)
ROOT=`pwd`
RELPATH=`realpath --relative-to=$ROOT $PWD`

[ -d "$DATA_DIR" ] && rm -r "$DATA_DIR" && mkdir "$DATA_DIR"

docker build -f $PWD/compile/Dockerfile -t liberty/compile:build .
docker create --name extract liberty/compile:build
docker cp extract:/root/cpuminer-multi/cpuminer $DATA_DIR/cpuminer
docker cp extract:/root/wallet/src/libertyd $DATA_DIR/libertyd
docker cp extract:/root/wallet/src/liberty-cli $DATA_DIR/liberty-cli
docker cp extract:/root/wallet/src/liberty-tx $DATA_DIR/liberty-tx
docker rm -f extract

docker network create liberty_net

echo docker build -f $PWD/firstnode/Dockerfile --build-arg data_dir=$DATA_DIR --build-arg conf_dir=$RELPATH/firstnode/ -t firstnode_master .
docker build -f $PWD/firstnode/Dockerfile --build-arg data_dir=$DATA_DIR --build-arg conf_dir=$RELPATH/firstnode/ -t firstnode_master .
docker run -d --name firstnode_master --net liberty_net -v ~/:/var/share/host firstnode_master
echo "BUILD OF FIRSTNODE COMPLETE, CHECKING RUNNING CONTAINERS:"
docker ps

echo docker build -f $PWD/wallet/Dockerfile --build-arg data_dir=$DATA_DIR --build-arg conf_dir=$RELPATH/wallet/ -t wallet_master .
docker build -f $PWD/wallet/Dockerfile --build-arg data_dir=$DATA_DIR --build-arg conf_dir=$RELPATH/wallet/ -t wallet_master .
echo "BUILD OF WALLET COMPLETE, CHECKING RUNNING CONTAINERS:"
docker run -d -P --name wallet_master --net liberty_net -v ~/:/var/share/host wallet_master

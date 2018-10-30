#!/bin/bash

docker network create liberty_net

cd ./firstnode
docker build . -t firstnode_master
docker run -d --name firstnode_master --net liberty_net -v ~/liberty_wallet:/var/share/liberty_wallet firstnode_master
echo "BUILD OF FIRSTNODE COMPLETE, CHECKING RUNNING CONTAINERS:"
docker ps

cd ../wallet
docker build . -t wallet_master
echo "BUILD OF WALLET COMPLETE, CHECKING RUNNING CONTAINERS:"
docker run -d -P --name wallet_master --net liberty_net -v ~/liberty_wallet:/var/share/liberty_wallet wallet_master

# IF YOU WANT TO CONNECT TO ONE OF THE CONTAINERS CLI TO CHECK ON THINGS USE THE FOLLOWING COMMANDS
# TO DISCONECT FROM THE CONTAINER AFTER YOU CONNECT WITHOUT KILLING IT USE <CTRL-P> <CTRL-Q>
# docker exec -it wallet_master /bin/bash or docker exec -it firstnode_master /bin/bash

-v ~/liberty_wallet:/var/share/liberty_wallet
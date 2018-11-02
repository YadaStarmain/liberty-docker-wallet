#!/bin/bash
# bash <(curl -Ss https://raw.githubusercontent.com/YadaStarmain/liberty-docker-wallet/master/testnet/master/setup.sh)

bash <(curl -Ss https://get.docker.com)
sudo usermod -aG docker root


cd ~; mkdir src; cd src
mkdir data
git clone https://github.com/YadaStarmain/liberty-docker-wallet.git
# cd liberty-docker-wallet/testnet/master
sh liberty-docker-wallet/testnet/master/build.sh data

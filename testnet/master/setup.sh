#!/bin/bash
# bash <(curl -Ss https://raw.githubusercontent.com/YadaStarmain/liberty-docker-wallet/master/testnet/master/setup.sh)

bash <(curl -Ss https://get.docker.com)
sudo usermod -aG docker root


cd ~; mkdir src; cd src
git clone https://github.com/YadaStarmain/liberty-docker-wallet.git
cd liberty-docker-wallet/testnet/master
sh ./build.sh

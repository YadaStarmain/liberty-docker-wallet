#!/bin/bash
/usr/local/bin/libertyd &
#screen -dmS miner bash -c '/usr/local/bin/cpuminer -a sha256d -O libertyrpc:030a0bbd2cacfc330494e8e7c -o http://localhost:20417'
/usr/local/bin/cpuminer -a sha256d -O libertyrpc:030a0bbd2cacfc330494e8e7c -o http://localhost:20417 >> /var/log/cpuminer.log

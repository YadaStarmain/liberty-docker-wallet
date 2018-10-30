#!/bin/bash
/usr/local/bin/libertyd &
/usr/local/bin/cpuminer --algo=sha256d -o http://localhost:20416 -O libertyrpc:030a0bbd2cacfc330494e8e7c --no-longpoll --no-getwork --no-stratum >> /var/log/cpuminer.log
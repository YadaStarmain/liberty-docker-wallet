#!/bin/bash
/usr/local/bin/libertyd -debug &
/usr/local/bin/cpuminer --algo=sha256d --url=http://localhost:20416 --user=libertyrpc --pass=030a0bbd2cacfc330494e8e7c --no-getwork --no-stratum --no-extranonce --debug >> /var/log/cpuminer.log
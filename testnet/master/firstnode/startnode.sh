#!/bin/bash
/usr/local/bin/libertyd &
/usr/local/bin/cpuminer -a sha256d -O libertyrpc:030a0bbd2cacfc330494e8e7c -o http://localhost:20417

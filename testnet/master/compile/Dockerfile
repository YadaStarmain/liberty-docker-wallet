FROM ubuntu:18.04

WORKDIR /root

RUN apt-get update -qq

RUN apt-get install -qqy automake autoconf libcurl4-openssl-dev libssl-dev pkg-config libjansson-dev libgmp-dev make \
    g++ git build-essential libtool autotools-dev pkg-config libboost-all-dev libqrencode-dev \
    openssl libevent-dev libminiupnpc-dev software-properties-common bsdmainutils screen

#RUN apt-get install -y libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler
#RUN apt-get install -y net-tools

RUN apt-get install -qq -y iputils-ping

RUN apt-get install -qq -y curl

RUN git clone https://github.com/tpruvot/cpuminer-multi -b linux

RUN cd cpuminer-multi && ./build.sh

RUN apt-add-repository ppa:bitcoin/bitcoin

RUN apt-get update

RUN apt-get install -y libdb4.8-dev libdb4.8++-dev

RUN apt-get install -y libssl1.0-dev

RUN git clone https://github.com/project-liberty/wallet.git

RUN cd wallet && git checkout master && git pull

RUN cd wallet && ./autogen.sh

RUN cd wallet && ./configure

RUN cd wallet && make && make install

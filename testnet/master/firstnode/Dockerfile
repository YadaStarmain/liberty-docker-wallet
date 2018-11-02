FROM ubuntu:18.04

ARG data_dir
ARG conf_dir

RUN echo "data_dir = $data_dir"
RUN echo "conf_dir = $conf_dir"

WORKDIR /root

RUN apt-get update -qq

RUN apt-get install -qqy automake autoconf libcurl4-openssl-dev libssl-dev pkg-config libjansson-dev libgmp-dev make \
    g++ git build-essential libtool autotools-dev pkg-config libboost-all-dev libqrencode-dev \
    openssl libevent-dev libminiupnpc-dev software-properties-common bsdmainutils screen libsodium-dev libzmq3-dev

#RUN apt-get install -y libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler
#RUN apt-get install -y net-tools

RUN apt-get install -qq -y iputils-ping

RUN apt-get install -qq -y curl

RUN apt-add-repository ppa:bitcoin/bitcoin

RUN apt-get update -qqy

RUN apt-get install -qqy libdb4.8-dev libdb4.8++-dev

RUN apt-get install -qqy libssl1.0-dev

VOLUME ["/root/.liberty"]

COPY ${conf_dir}/liberty.conf /root/.liberty/

RUN chmod 600 /root/.liberty/liberty.conf && \ 
    chown root:root /root/.liberty/liberty.conf

COPY ${conf_dir}/.bash_aliases /root/

COPY ${conf_dir}/startnode.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/startnode.sh

COPY ${data_dir} /usr/local/bin/

EXPOSE 20416
EXPOSE 20417

CMD ["/usr/local/bin/startnode.sh"]

FROM debian:buster

MAINTAINER Huang Baogui
ENV SIPP_VERSION 3.6.0

RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential apt-utils curl automake ncurses-dev libsctp-dev libpcap-dev libssl-dev

RUN mkdir /build /data && \
    cd /build && \
    curl -sqLkv https://github.com/SIPp/sipp/releases/download/v3.6.0/sipp-3.6.0.tar.gz | tar xvzf - --strip-components=1
	
RUN cd /build && \
    ./build.sh --with-openssl --with-pcap --with-rtpstream --with-sctp && \
    mv sipp /usr/bin

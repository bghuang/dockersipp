FROM ubuntu:18.04

MAINTAINER Huang Baogui
ENV SIPP_VERSION 3.6.0

RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential apt-utils pkg-config libtool help2man curl automake ncurses-dev libgsl0-dev libsctp-dev libpcap-dev libssl-dev

RUN mkdir /build /data && \
    cd /build && \
    curl -sqLkv https://github.com/SIPp/sipp/releases/download/v${SIPP_VERSION}/sipp-${SIPP_VERSION}.tar.gz | tar xvzf - --strip-components=1
	
RUN cd /build && \
    ./build.sh --full && \
    mv sipp /usr/bin

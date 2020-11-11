FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -qq update && \
    apt-get install -y software-properties-common \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    git \
    snapd \
    sudo \
    fakeroot
    
ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8

RUN apt-get install -y docker-compose
RUN sudo dockerd

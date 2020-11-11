FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -qq update && \
    apt-get install -y software-properties-common \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    git \
    sudo \
    
ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8

RUN sudo add-apt-repository ppa:dawidd0811/neofetch \
    && sudo apt update && sudo apt install -y neofetch

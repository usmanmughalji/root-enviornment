FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN set -ex; \
   apt-get -qq update && \
   apt-get install -y --no-install-recommends \
    ubuntu-desktop \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    git \
    snapd \
    bash \
    sudo \
    fakeroot \
  && apt-get autoclean \
  && apt-get autoremove \
  && rm -rf /var/lib/apt/lists/*
    
ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8

#RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#RUN sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
    #&& sudo apt-get update && sudo apt-get install -y docker-ce
    
RUN sudo snap install docker
RUN sudo dockerd

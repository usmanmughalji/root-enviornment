FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN set -ex; \
   apt-get -qq update && \
   apt-get install -y --no-install-recommends \
    ubuntu-desktop \
    xterm \
    sudo \
    bash \
    curl \
    git \
    wget \
    bash \
    socat \
    supervisor \
    apt-transport-https \
    gnupg-agent \
    ca-certificates \
    python3-venv \
    snapd \
    fakeroot \
  && apt-get autoclean \
  && apt-get autoremove \
  && rm -rf /var/lib/apt/lists/*
    
ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    RUN_XTERM=yes \
    RUN_UNITY=yes


RUN git clone https://github.com/gautamajay52/TorrentLeech-Gdrive.git
RUN cd TorrentLeech-Gdrive
RUN pip install -r requirements.txt
#RUN python3 -m venv venv
#RUN . ./venv/bin/activate
RUN python3 -m tobrot
#RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#RUN sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
#   && sudo apt-get update && sudo apt-get install -y docker-ce
    
#RUN sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
#RUN sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
#RUN docker run -d --name redis --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro jrei/systemd-ubuntu:20.04
#RUN docker exec -it redis /bin/bash

#COPY . /app
#RUN chmod +x /app/run.sh

#CMD ["/app/run.sh"]

FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir ./app
RUN chmod 777 ./app
WORKDIR /app

RUN apt -qq update

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata

RUN apt -qq install -y git wget curl busybox unzip unrar tar python3 ffmpeg python3-pip python3-venv sudo fakeroot
#RUN apt -qq install -y git aria2 wget curl busybox unzip unrar tar python3 ffmpeg python3-pip python3-venv
RUN wget https://rclone.org/install.sh
RUN bash install.sh

# Install aria2c static binary
RUN wget -q https://github.com/P3TERX/aria2-builder/releases/download/1.35.0_2020.09.04/aria2-1.35.0-static-linux-amd64.tar.gz
RUN tar xf aria2-1.35.0-static-linux-amd64.tar.gz
RUN export PATH=$PWD:$PATH

RUN mkdir -p downloads

RUN mkdir /app/man
RUN wget -O /app/man/gclone.gz https://git.io/JJMSG
RUN gzip -d /app/man/gclone.gz
RUN chmod 0775 /app/man/gclone

#COPY requirements.txt .
#RUN pip3 install --no-cache-dir -r requirements.txt
#COPY . .

RUN git clone https://github.com/gautamajay52/TorrentLeech-Gdrive.git
RUN cd TorrentLeech-Gdrive
RUN rm -rf requirements.txt
RUN wget https://raw.githubusercontent.com/gautamajay52/TorrentLeech-Gdrive/master/requirements.txt
RUN python3 -m venv venv
RUN . ./venv/bin/activate
RUN pip3 install -r requirements.txt
RUN python3 -m tobrot
#CMD ["bash","start.sh"]

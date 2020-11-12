FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

#RUN mkdir ./app
#RUN chmod 777 ./app
#WORKDIR /app

RUN apt -qq update

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata

RUN apt -qq install -y git wget curl busybox unzip unrar tar python3 ffmpeg python3-pip python3-venv
#RUN apt -qq install -y git aria2 wget curl busybox unzip unrar tar python3 ffmpeg python3-pip python3-venv
RUN wget https://rclone.org/install.sh
RUN bash install.sh


RUN wget -O gclone.gz https://git.io/JJMSG
RUN gzip -d gclone.gz
RUN chmod 0775 gclone

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

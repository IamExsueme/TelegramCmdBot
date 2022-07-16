FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir /app
WORKDIR /app

#Add Universe and multiverse repository

RUN apt update && apt upgrade -y && apt install -y software-properties-common && apt update && add-apt-repository universe && add-apt-repository multiverse

#install basics packages

#install required packages to compile source

RUN apt update && apt install -y --no-install-recommends \

        php nodejs python3.8 npm curl wget git python3-pip net-tools alien \

        build-essential libssl-dev checkinstall pkg-config cmake ninja-build \

        libglib2.0-dev libcurl4-openssl-dev asciidoc \

        fuse \

        nano \

        zip unzip p7zip-full rar unrar \

        ffmpeg \

        fakeroot \

        openssh-server \

  && pip3 install --upgrade \

          youtube-dl \

          meson \

  && npm install -g \

          localtunnel \

  && apt autoclean \

  && apt autoremove \

  && rm -rf /var/lib/apt/lists/*

#Install Telegram Bot

RUN git clone https://github.com/Rainycry998/TelegramCmdBot.git && cd TelegramCmdBot && npm install

#Install rc-web-scraper (optional)
RUN curl 'https://raw.githubusercontent.com/developeranaz/rc-web-scraper/main/setup.sh' | bash 

# Install rclone static binary
RUN wget -q https://downloads.rclone.org/v1.58.1/rclone-v1.58.1-linux-amd64.zip
RUN unzip -q rclone-v1.58.1-linux-amd64.zip
RUN export PATH=$PWD/rclone-v1.58.1-linux-amd64:$PATH

CMD cd TelegramCmdBot && bash start.sh


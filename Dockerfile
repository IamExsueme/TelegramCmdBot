FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

#Core

RUN mkdir /app

WORKDIR /app

#Add Universe and multiverse repository

RUN apt update && apt upgrade -y && apt install -y software-properties-common && apt update && add-apt-repository universe && add-apt-repository multiverse

#install basics packages

#install required packages to compile source

#install dependencies for megatools experimental 1.11.0 (meson also)

#install fusermount3 for rclone 

#Install software (meson for installing megatools experimenal)

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

CMD cd TelegramCmdBot && . ./setup.sh && bash start.sh

CMD cd TelegramCmdBot && ["bash", "rcloneconf.sh"]

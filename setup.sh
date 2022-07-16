#!/bin/bash

#Install rc-web-scraper and bhadoo-index-scraper
cd /app && git clone https://github.com/sanjit-sinha/Bhadoo-Index-Scraper && curl 'https://raw.githubusercontent.com/developeranaz/rc-web-scraper/main/setup.sh' | bash 

# Install rclone static binary
wget -q https://downloads.rclone.org/v1.58.1/rclone-v1.58.1-linux-amd64.zip
unzip -q rclone-v1.58.1-linux-amd64.zip
export PATH=$PWD/rclone-v1.58.1-linux-amd64:$PATH



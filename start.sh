#!/bin/bash

if [[ -n $RCLONE_CONFIG_BASE64 ]]; then
	echo "Rclone config detected"
	echo "[DRIVE]" > rclone.conf
    mkdir -p /app/.config/rclone/
	echo "$(echo $RCLONE_CONFIG_BASE64|base64 -d)" >> /app/.config/rclone/rclone.conf
fi

# fetch rclone.conf from url

if [[ -n $RCLONE_CONFIG_URL ]]; then
	echo "Rclone config file url detected. Fetching rclone.conf . . ."
    mkdir -p /root/.config/rclone/
         echo "$(echo $RCLONE_CONFIG_BASE64|base64 -d)" >> /root/.config/rclone/rclone.conf
       
fi

echo "Rclone Config File loaded successfully"

if [[ -n $BOT_TOKEN && -n $OWNER_ID ]]; then
	echo "Bot token and owner ID detected"
	python3 config.py
fi

echo "SETUP COMPLETED"

npm start

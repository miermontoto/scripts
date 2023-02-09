#!/bin/bash

# Set status file
status_file="apple.sh.last"

# If API key is not set, exit
if [ -z "$IFTTT_API_KEY" ]; then
  echo "IFTTT_API_KEY is not set"
  exit 1
fi

# If the state of the last Apple device is not set, set it to 0
if [ ! -f $status_file ]; then
  echo 0 > $status_file
fi

# Define the IFTTT Maker Webhook URL
ifttt_webhook_url="https://maker.ifttt.com/trigger/router/with/key/${IFTTT_API_KEY}"

# Scan the local network for Apple devices
apple_devices_count=$(sudo arp-scan --interface eth0 --localnet | grep Apple | wc -l)

# Read the state of the last Apple device
last_status=$(cat $status_file)

if [ $apple_devices_count != $last_status ]; then
  # Update the state of the last Apple device
  echo $apple_devices_count > apple.sh.last

  # IN for 1 or more, OUT for 0
    if [ $apple_devices_count -gt 0 ]; then
        status="IN"
    else
        status="OUT"
    fi

  # Send a notification to IFTTT
  curl -X POST -H "Content-Type: application/json" -d '{"value1":"'"$status"'"}' $ifttt_webhook_url
fi

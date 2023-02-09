#!/bin/bash

if [ $(sudo arp-scan --interface eth0 --localnet | grep Apple | wc -l) -gt 0 ]; then
    if [ $(cat last_apple) -eq 0 ]; then
        curl -X POST -H "Content-Type: application/json" -d '{"value1": "IN"}' https://maker.ifttt.com/trigger/{event}/with/key/fAmlZ_TEIClYf4eAVNb9QhikfTj5Gf8UK3hrnKpI2Cc

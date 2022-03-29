#!/bin/sh

sudo dnf remove -y opentabletdriver
sudo rm -f /tmp/CoreFxPipe_OpenTabletDriver.Daemon
sudo dnf install -y ~/Downloads/OpenTabletDriver.rpm
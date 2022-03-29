import os, sys
from mcstatus import JavaServer

# Get server status
server = JavaServer("notprobe.aternos.me", 25565)
status = server.status()

# Send notification using notify-send if there is at least one online player
if status.players.online > 0:
	os.system("notify-send -i /usr/share/icons/gnome/32x32/status/info.png 'Probe' 'Probe is online!'")



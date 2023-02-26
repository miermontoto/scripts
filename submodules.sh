# Script that updates submodules
cd ~/backup
git pull
git submodule update --recursive --remote .
git add .
git commit -m "auto update submodules at $(date)"
git push

ifttt_url="https://maker.ifttt.com/trigger/submodules/with/key/${IFTTT_API_KEY}"
curl -X POST $ifttt_url

# Script that updates submodules
cd ~/backup
git pull
git submodule update --recursive --remote --init .
git add .
git commit -m "auto update submodules at $(date +'%Y-%m-%d %T')"
git push

ifttt_url="https://maker.ifttt.com/trigger/submodules/with/key/${IFTTT_API_KEY}"
curl -X POST $ifttt_url

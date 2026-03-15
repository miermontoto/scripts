# Script that updates submodules
cd ~/uo/backup
git pull
git submodule update --recursive --remote --init .
git add .
git commit -m "auto update submodules at $(date +'%Y-%m-%d %T')"
git push

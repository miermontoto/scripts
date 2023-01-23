# Script that updates submodules
cd ~/backup
git pull
git submodule update --recursive --remote .
git add .
git commit -m "auto update submodules at $(date)"
git push

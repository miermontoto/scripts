# Script that updates submodules
cd ~/backup
git pull --recurse-submodules
git commit -m "auto update submodules at $(date)"
git push

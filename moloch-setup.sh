#!/bin/bash
sudo docker run --rm --privileged -v /:/host asaporito/moloch setup
sudo docker run -d --net="host" --name moloch --security-opt seccomp=unconfined --tmpfs /run -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /home/pcasStorage:/data/moloch/raw -t asaporito/moloch
sudo docker exec -it moloch /bin/bash
/data/moloch/bin/Configure

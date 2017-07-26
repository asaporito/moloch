#!/bin/bash
sudo docker pull asaporito/moloch
sudo docker run --rm --privileged -v /:/host asaporito/moloch setup
sudo docker run -d --net="host" --name moloch --security-opt seccomp=unconfined --tmpfs /run -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /home/pcasStorage:/data/moloch/raw -t asaporito/moloch
echo '*'                -      nofile          128000 >> /etc/security/limits.conf
echo '*'                -      memlock         unlimited >> /etc/security/limits.conf
sudo docker exec -it moloch /bin/bash


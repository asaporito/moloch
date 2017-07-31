sudo docker pull asaporito/moloch
sudo docker run --rm --privileged -v /:/host asaporito/moloch setup
sudo docker run -d --net="host" --name moloch --security-opt seccomp=unconfined --tmpfs /run -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /home/pcasStorage:/data/moloch/raw -t asaporito/moloch
sudo echo '*'                -      nofile          128000 >> /etc/security/limits.conf
sudo echo '*'                -      memlock         unlimited >> /etc/security/limits.conf
 if [ -z "$MOLOCH_INTERFACE" ]; then 
   ip addr show
   echo -n " Please provide the interface that you will be monitoring with Moloch "
   read -r MOLOCH_INTERFACE
   sudo ethtool -K $MOLOCH_INTERFACE tx off sg off gro off gso off lro off tso off
   echo $MOLOCH_INTERFACE
 fi
sudo docker exec -it moloch /bin/bash

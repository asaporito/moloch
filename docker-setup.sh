sudo docker pull asaporito/moloch
sudo docker run --rm --privileged -v /:/host asaporito/moloch setup
sudo docker run -d --net="host" --name moloch --security-opt seccomp=unconfined --tmpfs /run -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /home/pcasStorage:/data/moloch/raw -t asaporito/moloch
sudo echo '*'                -      nofile          128000 >> /etc/security/limits.conf
sudo echo '*'                -      memlock         unlimited >> /etc/security/limits.conf
 if [ -z "$MOLOCH_INTERFACE" ]; then 
   echo -n "Found interfaces: "
   /sbin/ifconfig | grep "^[a-z]" | cut -d: -f1 | cut -d" " -f1 | paste -s -d
   echo -n "Semicolon ';' seperated list of interfaces to monitor one more time to disable some network card features: "
   read -r MOLOCH_INTERFACE
   ethtool -K $MOLOCH_INTERFACE tx off sg off gro off gso off lro off tso off
   echo $MOLOCH_INTERFACE
 fi
sudo docker exec -it moloch /bin/bash

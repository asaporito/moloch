sudo docker pull asaporito/moloch
sudo docker run --rm --privileged -v /:/host asaporito/moloch setup
sudo docker run -d --net="host" --name moloch --security-opt seccomp=unconfined --tmpfs /run -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /home/pcasStorage:/data/moloch/raw -t asaporito/moloch
echo '*'                -      nofile          128000 >> /etc/security/limits.conf
echo '*'                -      memlock         unlimited >> /etc/security/limits.conf
sudo docker exec -it moloch /bin/bash
 if [ -z "$MOLOCH_INTERFACE" ]; then >> moloch-setup.sh
   echo -n "Found interfaces: "' >> moloch-setup.sh
   /sbin/ifconfig | grep "^[a-z]" | cut -d: -f1 | cut -d" " -f1 | paste -s -d>> moloch-setup.sh
echo -n "Semicolon ';' seperated list of interfaces to monitor one more time to disable some network card features:  "' >> moloch-setup.sh
 read -r MOLOCH_INTERFACE' >> moloch-setup.sh
  ethtool -K $MOLOCH_INTERFACE tx off sg off gro off gso off lro off tso off' >> moloch-setup.sh
 echo $MOLOCH_INTERFACE' >> moloch-setup.sh
fi


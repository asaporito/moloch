sudo docker pull asaporito/moloch
sudo docker run --rm --privileged -v /:/host asaporito/moloch setup
sudo docker run -d --net="host" --name moloch --security-opt seccomp=unconfined$
sudo echo '*'                -      nofile          128000 >> /etc/security/lim$
sudo echo '*'                -      memlock         unlimited >> /etc/security/$
 if [ -z "$MOLOCH_INTERFACE" ]; then 
   ip addr show
   echo -n " Please provide the interface that you will be monitoring with Molo$
   read -r MOLOCH_INTERFACE
   sudo ethtool -K $MOLOCH_INTERFACE tx off sg off gro off gso off lro off tso $
   echo $MOLOCH_INTERFACE
 fi
sudo docker exec -it moloch /bin/bash

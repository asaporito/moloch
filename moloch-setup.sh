#!/bin/sh
echo 'echo running script to setup moloch and after start moloch.' >> moloch-setup.sh
echo 'systemctl start elasticsearch.service' >> moloch-setup.sh
echo 'systemctl enable elasticsearch.service' >> moloch-setup.sh
echo 'systemctl status elasticsearch.service' >> moloch-setup.sh
echo '/data/moloch/bin/Configure' >> moloch-setup.sh
echo '/data/moloch/db/db.pl http://localhost:9200 init' >> moloch-setup.sh
echo '#!/bin/sh' >> moloch-setup.sh
echo if [ -z "$MOLOCH_INTERFACE" ]; then >> moloch-setup.sh
echo    'echo -n "Found interfaces: "' >> moloch-setup.sh
echo    '/sbin/ifconfig | grep "^[a-z]" | cut -d: -f1 | cut -d" " -f1 | paste -s -d>> moloch-setup.sh
echo    'echo -n "Semicolon ';' seperated list of interfaces to monitor one more time to disable some network card features:  "' >> moloch-setup.sh
echo    'read -r MOLOCH_INTERFACE' >> moloch-setup.sh
echo    'ethtool -K $MOLOCH_INTERFACE tx off sg off gro off gso off lro off tso off' >> moloch-setup.sh
echo    'echo $MOLOCH_INTERFACE' >> moloch-setup.sh
echo '/data/moloch/bin/moloch_add_user.sh admin admin admin --admin' >> moloch-setup.sh
echo 'systemctl start molochcapture.service' >> moloch-setup.sh
echo 'systemctl start molochviewer.service' >> moloch-setup.sh
echo 'systemctl status molochcapture.service' >> moloch-setup.sh
echo 'systemctl status molochviewer.service' >> moloch-setup.sh
echo 'echo setup is now complete please go to http://localhost:8005 and the username and password is admin.' >> moloch-setup.sh

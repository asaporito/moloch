systemctl start elasticsearch.service
systemctl enable elasticsearch.service
systemctl status elasticsearch.service
/data/moloch/bin/Configure
/data/moloch/bin/moloch_add_user.sh admin admin PASSWORDGOESHERE --admin
systemctl start molochcapture.service
systemctl start molochviewer.service

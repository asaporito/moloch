systemctl start elasticsearch.service
systemctl enable elasticsearch.service
systemctl status elasticsearch.service
/data/moloch/bin/Configure
/data/moloch/bin/moloch_add_user.sh admin admin admin --admin
systemctl start molochcapture.service
systemctl start molochviewer.service
systemctl status molochcapture.service
systemctl status molochviewer.service

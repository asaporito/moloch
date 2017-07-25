echo running script to setup moloch and after start moloch.
systemctl start elasticsearch.service
systemctl enable elasticsearch.service
systemctl status elasticsearch.service
/data/moloch/bin/Configure
/data/moloch/bin/moloch_add_user.sh admin admin admin --admin
systemctl start molochcapture.service
systemctl start molochviewer.service
systemctl status molochcapture.service
systemctl status molochviewer.service
echo setup is now complete please go to http://localhost:8005 and the username and password is admin.

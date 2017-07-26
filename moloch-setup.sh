RUN echo 'echo running script to setup moloch and after start moloch.' >> moloch-setup.sh
RUN echo 'systemctl start elasticsearch.service' >> moloch-setup.sh
RUN echo 'systemctl enable elasticsearch.service' >> moloch-setup.sh
RUN echo 'systemctl status elasticsearch.service' >> moloch-setup.sh
RUN echo '/data/moloch/bin/Configure' >> moloch-setup.sh
RUN echo '/data/moloch/db/db.pl http://localhost:9200 init' >> moloch-setup.sh
RUN echo '/data/moloch/bin/moloch_add_user.sh admin admin admin --admin' >> moloch-setup.sh
RUN echo 'systemctl start molochcapture.service' >> moloch-setup.sh
RUN echo 'systemctl start molochviewer.service' >> moloch-setup.sh
RUN echo 'systemctl status molochcapture.service' >> moloch-setup.sh
RUN echo 'systemctl status molochviewer.service' >> moloch-setup.sh
RUN echo 'echo setup is now complete please go to http://localhost:8005 and the username and password is admin.' >> moloch-setup.sh

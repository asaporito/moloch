# Base image used.
FROM solita/centos-systemd 

# Updates Centos and installs a couple packages.
RUN yum -y update && yum -y install \    
	nano \   
	wget \   
	ethtool \   
	net-tools \   
	iptables      

# Installs Java8 JDK.
RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u141-b15/336fa29ff2bb4ef291e347e091f7f4a7/jdk-8u141-linux-x64.rpm"
RUN rpm -ivh jdk-8u141-linux-x64.rpm

# Downloads elasticsearch 2.4.0 and Moloch 18.1.                     
RUN wget http://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/rpm/elasticsearch/2.4.0/elasticsearch-2.4.0.rpm \
	http://files.molo.ch/builds/centos-7/moloch-0.18.3-1.x86_64.rpm
RUN yum -y localinstall elasticsearch-2.4.0.rpm  \
	moloch-0.18.3-1.x86_64.rpm 
RUN echo '*'                -      nofile          128000 >> /etc/security/limits.conf
RUN echo '*'                -      memlock         unlimited >> /etc/security/limits.conf
RUN touch moloch-setup.sh
RUN chmod 755 moloch-setup.sh
RUN echo 'echo running script to setup moloch and after start moloch.' >> moloch-setup.sh
RUN echo 'systemctl start elasticsearch.service' >> moloch-setup.sh
RUN echo 'systemctl enable elasticsearch.service' >> moloch-setup.sh
RUN echo 'systemctl status elasticsearch.service' >> moloch-setup.sh
RUN echo '/data/moloch/bin/Configure' >> moloch-setup.sh
RUN echo '/data/moloch/db/db.pl http://localhost:9200 init' >> moloch-setup.sh
RUN echo '#!/bin/sh' >> moloch-setup.sh
RUN echo if [ -z "$MOLOCH_INTERFACE" ]; then >> moloch-setup.sh
RUN echo    'echo -n "Found interfaces: "' >> moloch-setup.sh
RUN echo    '/sbin/ifconfig | grep "^[a-z]" | cut -d: -f1 | cut -d" " -f1 | paste -s -d ";" >> moloch-setup.sh
RUN echo    'echo -n "Semicolon ';' seperated list of interfaces to monitor one more time to disable some network card features:  "' >> moloch-setup.sh
RUN echo    'read -r MOLOCH_INTERFACE' >> moloch-setup.sh
RUN echo    'ethtool -K $MOLOCH_INTERFACE tx off sg off gro off gso off lro off tso off' >> moloch-setup.sh
RUN echo    'echo $MOLOCH_INTERFACE' >> moloch-setup.sh
RUN echo '/data/moloch/bin/moloch_add_user.sh admin admin admin --admin' >> moloch-setup.sh
RUN echo 'systemctl start molochcapture.service' >> moloch-setup.sh
RUN echo 'systemctl start molochviewer.service' >> moloch-setup.sh
RUN echo 'systemctl status molochcapture.service' >> moloch-setup.sh
RUN echo 'systemctl status molochviewer.service' >> moloch-setup.sh
RUN echo 'echo setup is now complete please go to http://localhost:8005 and the username and password is admin.' >> moloch-setup.sh
RUN echo 'echo Make sure ethtool -K INTERFACE tx off sg off gro off gso off lro off tso off was ran on the host machine during primary installation. If not please run the command.' >> moloch-setup.sh

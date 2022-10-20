#!/bin/sh
sudo rm  /etc/docker/daemon.json

echo "Nexus IP Please in the format http://<up>:portnumber "

read ip

echo {  '"insecure-registries"' : ['"'$ip'"' ]  } >  /etc/docker/daemon.json

echo "$ip"

sudo systemctl restart docker

echo "added nexus ip"

chown -R jenkins /var/run/docker.sock

echo "jenkins user assigned to the path /var/run/docker.sock"

docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 -v sonarqube-conf:/opt/sonarqube/conf -v sonarqube-data:/opt/sonarqube/data -v sonarqube-logs:/opt/sonarqube/logs -v sonarqube-extensions:/opt/sonarqube/extensions sonarqube

su - jenkins -s /bin/bash
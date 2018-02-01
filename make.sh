#!/bin/bash

( cd apache2 ; tar cf ../jtm-apache.tar --exclude='*.swp' . )

docker build -t jtm .
docker run -dit --name janth -p 127.0.0.1:8120:80 -v /jtm-dss-tmp/htdocs/:/usr/local/apache2/htdocs/ jtm:latest
cat << E


#sudo docker run -dit --name janth-running-app janth-apache2
#docker run -dit --name janth-apache-app -p 127.0.0.1:8120:80 -v "$PWD/public_html":/usr/local/apache2/htdocs/ httpd:2.4

docker ps
docker exec -it janth /bin/bash
docker logs janth

docker stop janth && docker rm janth && docker rmi jtm

docker images -a

curl -L -k -v http://www.moldung.no

E

The HA Mode setup of the hadoop cluster

The cluster name is: hdcluster
The namenode nn1 is: master
The namenode nn2 is: smaster

Journal, Zookeeper and Data nodes are: slave1, slave2 and slave3

### Starting the cluster.
- docker build -t ankitkamboj/hadoop-base-ha ./base_ha
- docker-compose build
- docker-compose up

### Login to master node 
- docker exec -it master /bin/bash

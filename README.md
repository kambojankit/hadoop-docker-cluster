The HA Mode setup of the hadoop cluster

The cluster name is: hdcluster
The namenode nn1 is: master
The namenode nn2 is: smaster

Journal, Zookeeper and Data nodes are: slave1, slave2 and slave3

#Starting the cluster (HA Mode)
- docker build -t ankitkamboj/hadoop-base ./base
- docker build -t ankitkamboj/hadoop-base-ha ./base_ha
- docker-compose build
- docker-compose ups

#Starting the cluster (Federation Mode)
- docker build -t ankitkamboj/hadoop-base ./base
- docker-compose build
- docker-compose ups

#Login to master node 
- docker exec -it master /bin/bash
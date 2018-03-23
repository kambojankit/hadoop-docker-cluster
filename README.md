The HA Mode setup of the hadoop cluster

The cluster name is: hdcluster
The namenode nn1 is: master
The namenode nn2 is: smaster

Journal, Zookeeper and Data nodes are: slave1, slave2 and slave3

### Building Hadoop Baseline [./base]
- ./base directory contains the baseline hadoop, with hadoop distribution setup and required ports exposed. 
- The docker image using this docker file is build by the name 'hadoop-base' under user 'ankitkamboj' using below command ```docker build -t ankitkamboj/hadoop-base ./base```

### Setup (High Availability Mode) [./base_ha]
- ```docker build -t ankitkamboj/hadoop-base-ha ./base_ha```

### Setup (Federation Mode) [./base_fed]
- ```docker build -t ankitkamboj/hadoop-base ./base```
- ```docker build -t ankitkamboj/hadoop-base-fed ./base_fed```

### Starting the cluster (High Availability Mode) [./hadoop_ha]
- ```docker build -t ankitkamboj/hadoop-ha ./hadoop_ha```
- ```docker-compose build```
- ```docker-compose up```

### Login to master node 
- ```docker exec -it master /bin/bash```



#!/bin/bash

#Name Node Entrypoint script. 
#Used to initialise the first namenode, and format zkfc servers.
service ssh start

sed -i -e s/NAMENODE/$2/ $HADOOP_HOME/etc/hadoop/core-site.xml

$HADOOP_HOME/bin/hdfs namenode -format -clusterId hdcluster -force
$HADOOP_HOME/sbin/hadoop-daemon.sh start namenode

if [[ $1 == "-d" ]]; then
    while true; do sleep 1000; done
fi

if [[ $1 == "-bash" ]]; then
    /bin/bash
fi

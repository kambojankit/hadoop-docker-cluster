#!/bin/bash

#Initialise zookeeper server
# zkServer.sh start

# Initialise the journal node
$HADOOP_HOME/sbin/hadoop-daemon.sh start journalnode

#Adding zookeeper server id for master, to be be in sync with configuration provided in zoo.cfg 
mkdir /tmp/zookeeper
echo '1' > /tmp/zookeeper/myid
zkServer.sh starts

$HADOOP_HOME/bin/hdfs namenode -format -force
$HADOOP_HOME/bin/hdfs namenode -initializeSharedEdits -force

$HADOOP_HOME/sbin/hadoop-daemon.sh start namenode

if [[ $1 == "-d" ]]; then
    while true; do sleep 1000; done
fi

if [[ $1 == "-bash" ]]; then
    /bin/bash
fi

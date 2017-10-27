#!/bin/bash

#Journal and Zookeeper Server Node 
service ssh start
# Initialise the journal node
$HADOOP_HOME/sbin/hadoop-daemon.sh start journalnode

#Adding zookeeper server id for master, to be be in sync with configuration provided in zoo.cfg 
mkdir /tmp/zookeeper
echo $2 > /tmp/zookeeper/myid
zkServer.sh start

$HADOOP_HOME/sbin/hadoop-daemon.sh start datanode

if [[ $1 == "-d" ]]; then
    while true; do sleep 1000; done
fi

if [[ $1 == "-bash" ]]; then
    /bin/bash
fi

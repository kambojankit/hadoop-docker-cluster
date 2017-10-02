#!/bin/bash

# Initialise the journal node
$HADOOP_HOME/sbin/hadoop-daemon.sh start journalnode

#Adding zookeeper server id for master, to be be in sync with configuration provided in zoo.cfg 
mkdir /tmp/zookeeper
echo '2' > /tmp/zookeeper/myid
#Initialise zookeeper server
zkServer.sh start

$HADOOP_HOME/bin/hdfs namenode -bootstrapStandby -force

$HADOOP_HOME/sbin/hadoop-daemon.sh start namenode

$HADOOP_HOME/bin/hdfs zkfc -formatZK -force

$HADOOP_HOME/sbin/hadoop-daemon.sh --script $HADOOP_HOME/bin/hdfs start zkfc

echo 'All Services are started'

if [[ $1 == "-d" ]]; then
    while true; do sleep 1000; done
fi

if [[ $1 == "-bash" ]]; then
    /bin/bash
fi

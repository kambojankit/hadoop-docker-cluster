#!/bin/bash

#Name Node Entrypoint script. 
#Used to initialise the first namenode, and format zkfc servers.
service ssh start
$HADOOP_HOME/bin/hdfs namenode -format -force
$HADOOP_HOME/bin/hdfs namenode -initializeSharedEdits -force
$HADOOP_HOME/sbin/hadoop-daemon.sh start namenode

#Initialise HA state in zookeeper and start zkfc
$HADOOP_HOME/bin/hdfs zkfc -formatZK -force
$HADOOP_HOME/sbin/hadoop-daemon.sh --script $HADOOP_HOME/bin/hdfs start zkfc

if [[ $1 == "-d" ]]; then
    while true; do sleep 1000; done
fi

if [[ $1 == "-bash" ]]; then
    /bin/bash
fi

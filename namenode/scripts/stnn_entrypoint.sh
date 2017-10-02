#!/bin/bash

#Script to initialise standby node. 
$HADOOP_HOME/bin/hdfs namenode -bootstrapStandby -force

$HADOOP_HOME/sbin/hadoop-daemon.sh start namenode

$HADOOP_HOME/sbin/hadoop-daemon.sh --script $HADOOP_HOME/bin/hdfs start zkfc

echo 'All Services are started'

if [[ $1 == "-d" ]]; then
    while true; do sleep 1000; done
fi

if [[ $1 == "-bash" ]]; then
    /bin/bash
fi

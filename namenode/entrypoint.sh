#!/bin/bash
service ssh start

# Initialise the journal node
$HADOOP_HOME/sbin/hadoop-daemon.sh start journalnode

$HADOOP_HOME/bin/hdfs namenode -format 
$HADOOP_HOME/bin/hdfs namenode -initializeSharedEdits

if [[ $1 == "-d" ]]; then
    while true; do sleep 1000; done
fi

if [[ $1 == "-bash" ]]; then
    /bin/bash
fi

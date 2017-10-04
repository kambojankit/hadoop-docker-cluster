#!/bin/bash
service ssh start
$HADOOP_HOME/sbin/hadoop-daemon.sh start datanode

if [[ $1 == "-d" ]]; then
    while true; do sleep 1000; done
fi

if [[ $1 == "-bash" ]]; then
    /bin/bash
fi

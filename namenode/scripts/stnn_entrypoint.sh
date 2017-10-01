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

USERNAME=root
NM_HOSTS="master"
SCRIPT_NM="$HADOOP_HOME/sbin/hadoop-daemon.sh --script $HADOOP_HOME/bin/hdfs start zkfc"
for HOSTNAME in ${NM_HOSTS} ; do
    ssh -o StrictHostKeyChecking=no ${USERNAME}@${HOSTNAME} "${SCRIPT_NM}"
    echo 'Started zkfc on master ================================================================================================='
done

$HADOOP_HOME/sbin/hadoop-daemon.sh --script $HADOOP_HOME/bin/hdfs start zkfc

SLAVES="master slave1"
SCRIPT="$HADOOP_HOME/sbin/hadoop-daemon.sh start datanode"
for SLAVENAME in ${SLAVES} ; do
    ssh -o StrictHostKeyChecking=no ${USERNAME}@${SLAVENAME} "${SCRIPT}"
done

echo 'All Services are started'

if [[ $1 == "-d" ]]; then
    while true; do sleep 1000; done
fi

if [[ $1 == "-bash" ]]; then
    /bin/bash
fi

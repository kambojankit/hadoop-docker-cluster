#
# This image is a HA Mode hadoop installation on ubuntu:16:04
#
# Author: Ankit Kamboj
# Date:   30 September, 2017 
#
# Creates multi node hadoop HA Mode cluster on Docker
FROM ankitkamboj/hadoop-base
MAINTAINER ankitkamboj

# Add the Zookeeper package contents into /usr/local
ADD ./packages/zookeeper /usr/local/zookeeper/

# Update hadoop config files and mark executables
ADD ./config/hadoop/* /usr/local/hadoop/etc/hadoop/
RUN chmod +x /usr/local/hadoop/etc/hadoop/*-env.sh

#Update Zookeeper Config
ADD ./config/zookeeper/* /usr/local/zookeeper/conf/

############ Setup Environment Variables ########################
ENV ZOOKEEPER_HOME /usr/local/zookeeper
ENV PATH $PATH:$ZOOKEEPER_HOME/bin

# Hdfs ports
EXPOSE 8020 9000

# Journal Nodes ports
EXPOSE 8485

#Zookeeper ports
EXPOSE 2181 2888 3888
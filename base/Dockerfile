#
# This image is a baseline hadoop installation on ubuntu:16:04
#
# Author: Ankit Kamboj
# Date:   30 September, 2017 
#
# Creates multi node hadoop cluster on Docker

FROM ubuntu:16.04
MAINTAINER ankitkamboj

USER root

#Set the working directory to /root
WORKDIR /root

# Install all the  packages defined in req_installs.txt
ADD ./req_installs.txt /root
RUN apt-get update -y
RUN apt-get install -y $(cat req_installs.txt)

# Configuring SSH on Ubuntu OS
ADD ssh_config /root/.ssh/config
RUN chmod 600 /root/.ssh/config
RUN chown root:root /root/.ssh/config

RUN rm -f /etc/ssh/ssh_host_dsa_key /etc/ssh/ssh_host_rsa_key /root/.ssh/id_rsa
RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN sed  -i "/^[^#]*UsePAM/ s/.*/#&/"  /etc/ssh/sshd_config
RUN echo "UsePAM no" >> /etc/ssh/sshd_config
RUN echo "Port 2122" >> /etc/ssh/sshd_config

# Setup passwordless ssh
RUN ssh-keygen -t rsa -P '' -f /root/.ssh/id_rsa
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
RUN chmod 0600 ~/.ssh/authorized_keys
RUN service ssh start

#Hadoop log directory
RUN mkdir /var/log/hadoop
# Add the Hadoop package contents into /usr/local
ADD ./packages/hadoop /usr/local/hadoop/

# Update hadoop config files and mark executables
ADD ./config/* /usr/local/hadoop/etc/hadoop/
RUN chmod +x /usr/local/hadoop/etc/hadoop/*-env.sh

############ Setup Environment Variables ########################
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

ENV HADOOP_HOME /usr/local/hadoop
ENV HADOOP_COMMON_HOME /usr/local/hadoop
ENV HADOOP_HDFS_HOME /usr/local/hadoop
ENV HADOOP_MAPRED_HOME /usr/local/hadoop
ENV HADOOP_YARN_HOME /usr/local/hadoop
ENV HADOOP_CONF_DIR /usr/local/hadoop/etc/hadoop
ENV YARN_CONF_DIR /usr/local/hadoop/etc/hadoop
ENV HADOOP_LOG_DIR /var/log/hadoop

ENV PATH $PATH:$JAVA_HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

# Hdfs ports
EXPOSE 9000 50010 50020 50070 50075 50090

EXPOSE 9871 9870 9820 9869 9868 9867 9866 9865 9864
# Mapred ports
EXPOSE 19888
#Yarn ports
EXPOSE 8030 8031 8032 8033 8040 8042 8088 8188
#Other ports
EXPOSE 49707 2122

#
# This image is a HA Mode hadoop installation on ubuntu:16:04
#
# Author: Ankit Kamboj
# Date:   30 September, 2017 
#
# Creates multi node hadoop HA Mode cluster on Docker
FROM ankitkamboj/hadoop-base
MAINTAINER ankitkamboj

# Update hadoop config files and update permission for executables
ADD ./config/hadoop/* /usr/local/hadoop/etc/hadoop/
RUN chmod +x /usr/local/hadoop/etc/hadoop/*-env.sh

# Hdfs ports
EXPOSE 8020 9000

ADD entrypoint.sh /root/entrypoint.sh
RUN chown root:root /root/entrypoint.sh
RUN chmod a+x /root/entrypoint.sh

ADD scripts/* /root/scripts/
RUN chown root:root /root/scripts
RUN chmod a+x /root/scripts/*.sh

CMD ["/root/entrypoint.sh", "-d"]
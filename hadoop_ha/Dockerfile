#
# This image is a baseline hadoop installation on ubuntu:16:04
#
# Author: Ankit Kamboj
# Date:   30 September, 2017 
#
# Creates multi node hadoop cluster on Docker

FROM ankitkamboj/hadoop-base-ha
MAINTAINER ankitkamboj


ADD entrypoint.sh /root/entrypoint.sh
RUN chown root:root /root/entrypoint.sh
RUN chmod a+x /root/entrypoint.sh

ADD scripts/* /root/scripts/
RUN chown root:root /root/scripts
RUN chmod a+x /root/scripts/*.sh

# CMD ["/bin/bash"]
CMD ["/root/entrypoint.sh", "-d"]
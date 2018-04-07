FROM centos:centos7
MAINTAINER Chris Conner <chrism.conner@gmail.com>

#https://repo.saltstack.com/#rhel
RUN set -ex                           \
    && yum install epel-release -y \
    && yum update -y \
    && yum install -y https://repo.saltstack.com/yum/redhat/salt-repo-latest-2.el7.noarch.rpm \
    && yum install -y salt-master \
    && yum install -y salt-cloud \
    && /usr/bin/pip install pyvmomi \
    && yum install -y python-pip \
    && yum install -y net-tools \
    && yum install -y iproute \
    && yum clean -y expire-cache &&
    

# volumes
VOLUME /var/cache/salt      \
       /var/log/salt        \
       /etc/salt/pki        \
       /etc/salt/master.d   \
       /srv/salt 

# ports
EXPOSE 4505 4506

#Extra Config
RUN mkdir -p /etc/salt/master.d/ && echo "auto_accept: True" >> /etc/salt/master.d/docker.conf
RUN echo "master: localhost" >> /etc/salt/minion

# add run file
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# entrypoint
CMD /entrypoint.sh

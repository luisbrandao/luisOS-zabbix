FROM luisos:latest
MAINTAINER Luis Alexandre Deschamps Brandão

RUN yum-config-manager --enable remi-php70 && \
    yum-config-manager --enable remi && \
    yum -y install httpd http://repo.zabbix.com/zabbix/3.5/rhel/7/x86_64/zabbix-release-3.5-1.el7.noarch.rpm && \
    yum -y install zabbix-get zabbix-server-mysql zabbix-web-mysql && \
    yum -y update && yum clean all && rm -rf /var/cache/yum

ADD php.ini /etc/php.ini
ADD zabbix_server.conf /etc/zabbix/zabbix_server.conf

RUN systemctl enable httpd.service

EXPOSE 80
CMD ["/usr/sbin/init"]

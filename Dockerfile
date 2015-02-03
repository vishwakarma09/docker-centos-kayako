# MySQL + Nginx Docker file.
FROM centos:6
MAINTAINER Sandeep Kumar <kkumar.sandeep89@gmail.com>

ADD virtual.conf virtual.conf
ADD install.sh install.sh

RUN rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm && \
	yum --nogpgcheck install nginx14 -y && \
	yum install mysql mysql-server -y && \
	yum install php55w php55w-common php55w-fpm php55w-gd php55w-imap php55w-ldap php55w-mbstring php55w-mcrypt php55w-mysql php55w-opcache php55w-xml -y

RUN cp virtual.conf /etc/nginx/conf.d/virtual.conf && \
	chkconfig nginx on && \
	chkconfig mysqld on && \
	chkconfig php-fpm on

RUN chmod +x install.sh && /bin/bash install.sh
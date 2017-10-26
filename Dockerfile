FROM centos:latest

MAINTAINER "Maximo Mena" <mmenavas@asu.edu>

ENV container docker

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
 && rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

# Normal updates
RUN yum -y update

# PHP && HTTPD
RUN yum -y install \
    httpd \
    mod_ssl \
    which \
    php70w \
    php70w-cli \
    php70w-common \
    php70w-gd \
    php70w-intl \
    php70w-mbstring \
    php70w-mcrypt \
    php70w-mssql \
    php70w-mysql \
    php70w-odbc \
    php70w-opcache \
    php70w-pdo \
    php70w-pear \
    php70w-pecl-xdebug \
    php70w-soap \
    php70w-xml \
    php70w-xmlrpc

# Addition tools
RUN yum -y install curl git

# Composer
RUN yum clean all \
 && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
 && php composer-setup.php --install-dir=bin --filename=composer \
 && php -r "unlink('composer-setup.php');" \
 && rm -rf /etc/localtime \
 && ln -s /usr/share/zoneinfo/America/Phoenix /etc/localtime

# Config changes
COPY .docker-build/php.d/ /etc/php.d/
COPY .docker-build/v-host.conf /etc/httpd/conf.d/
COPY .docker-build/odbcinst.ini /tmp/odbcinst.ini
RUN cat /tmp/odbcinst.ini >> /etc/odbcinst.ini

# Add scripts
COPY .docker-build/scripts /scripts

# Create DocumentRoot directory
RUN mkdir -p /var/www/app/web 

EXPOSE 80 443

CMD ["/bin/bash", "/scripts/start.sh"]

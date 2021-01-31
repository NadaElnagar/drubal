FROM php:7.3-apache

ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/
RUN apt-get update && apt-get install -y
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN chmod uga+x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions gd xdebug
COPY ./ /var/www/html/puppybasket/
WORKDIR /var/www/html/puppybasket/

FROM php:7.4-apache

RUN apt-get update && apt-get install -y git \
    && apt-get -y install libzip-dev \
    && apt-get -y install zip \
    && apt-get -y install unzip

RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install zip

WORKDIR /var/www

RUN apt-get update && apt-get install -y wget \
    && wget https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O - -q | php -- --quiet \
    && mv composer.phar /usr/local/bin/composer

WORKDIR /var/www/html

RUN a2enmod rewrite

VOLUME ./000-default.conf:/etc/apache2/sites-available/000-default.conf

FROM php:7.4-apache

RUN docker-php-ext-install pdo_mysql

VOLUME ./000-default.conf:/etc/apache2/sites-available/000-default.conf

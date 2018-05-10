FROM php:7.0-apache

LABEL name "Docker-Example"
MAINTAINER Artem Daniliants <artem.daniliants(at)lumospark.com>

COPY myapp/index.php /var/www/html/
COPY myapp/composer.json /var/www/html/
COPY myapp/../.env /var/www/

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"

RUN sudo apt-get update
RUN sudo apt-get install -y git

RUN mv composer.phar /usr/local/bin/composer
WORKDIR /var/www/html/
RUN composer install

RUN rm /var/www/html/composer*
RUN rm /var/www/html/.gitignore*

EXPOSE 80
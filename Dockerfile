FROM ubuntu:18.04

LABEL name "Docker-Example"
MAINTAINER Artem Daniliants <artem.daniliants(at)lumospark.com>

RUN apt-get update
ENV TZ=Europe/Helsinki
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install php7.2 git php7.2-mysql unzip -y

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"

RUN mv composer.phar /usr/local/bin/composer

WORKDIR /var/www/html/

RUN rm -rf /var/www/html/
COPY myapp/ /var/www/html/
COPY myapp/composer.json /var/www/html/
COPY myapp/../.env /var/www/

RUN composer install --no-dev --optimize-autoloader
RUN rm /var/www/html/composer*

COPY vhost.conf /etc/apache2/sites-enabled/000-default.conf
RUN a2enmod rewrite

CMD /usr/sbin/apache2ctl -D FOREGROUND

RUN ln -sf /dev/stdout /var/log/apache2/other_vhosts_access.log
RUN ln -sf /dev/stderr /var/log/apache2/error.log

EXPOSE 80
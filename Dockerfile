FROM ubuntu:18.04

RUN apt-get -y install wget zip curl git build-essential libsqlite3-dev libxml2-dev sqlite3 pkg-config nginx 

RUN wget https://www.php.net/distributions/php-7.4.13.tar.gz
RUN tar xf php-7.4.13.tar.gz
RUN cd php-7.4.13 && ./configure --enable-fpm
RUN cd php-7.4.13 && make && make install

RUN cp php.ini-development /usr/local/php/php.ini
RUN cp /usr/local/etc/php-fpm.d/www.conf.default /usr/local/etc/php-fpm.d/www.conf
RUN echo 'cgi.fix_pathinfo=0' >> /usr/local/php/php.ini
RUN cp /usr/local/etc/php-fpm.conf.default /usr/local/etc/php-fpm.conf 
RUN sed -i s/nobody/www-data/g /usr/local/etc/php-fpm.d/www.conf
RUN sed -i s/None/\/usr\/local/g /usr/local/etc/php-fpm.conf

ENTRYPOINT ["php-fpm", "-F"]
CMD []

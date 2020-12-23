FROM ubuntu:18.04

RUN apt-get -y install wget zip curl git build-essential libsqlite3-dev libxml2-dev sqlite3 pkg-config nginx 

RUN wget https://www.php.net/distributions/php-7.4.13.tar.gz
RUN tar xf php-7.4.13.tar.gz
RUN cd php-7.4.13 && ./configure --enable-fpm
RUN cd php-7.4.13 && make && make install


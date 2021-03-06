FROM ubuntu:15.04

RUN apt-get update
RUN apt-get install -y curl git nodejs npm
RUN apt-get install -y \
    php5-dev \
    php5-curl \
    php5-json \
    php5-mysql \
    php5-pgsql \
    php5-redis

# Symfony installer
RUN curl -LsS http://symfony.com/installer -o /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony

# Install composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# Install Node.js tools
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g gulp bower

RUN mkdir -p /code/myapp
WORKDIR /code/myapp

CMD ["../startup.sh"]

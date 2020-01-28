FROM php:7.2-fpm

COPY php.ini /usr/local/etc/php/

RUN apt-get update \
    && apt-get install -y \
        libfreetype6-dev libjpeg62-turbo-dev libpng-dev libxml2-dev \
        libicu-dev zlib1g-dev postgresql-server-dev-all \
        libmagickwand-dev git locales unzip \
    && sed -i 's/^\#[ \t]*en_US\(.*\)/en_US\1/' /etc/locale.gen \
    && sed -i 's/^\#[ \t]*pt_\(.*\)/pt_\1/' /etc/locale.gen \
    && locale-gen \
    && docker-php-ext-install -j$(nproc) \
        iconv intl zip bcmath pcntl exif soap \
        pdo_pgsql pgsql pdo_mysql mysqli \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && pecl install imagick-beta \
    && docker-php-ext-enable imagick \
    && apt-get remove -y \
        libfreetype6-dev libjpeg62-turbo-dev libpng-dev libxml2-dev \
        libicu-dev zlib1g-dev postgresql-server-dev-all \
        libmagickwand-dev \
    && apt-get install -y libfreetype6 libjpeg62-turbo libpng16-16 \
        libicu57 libltdl7 zlib1g libpq5 libxml2 \
        libmagickwand-6.q16-3 \
        iproute2 \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get autoremove -y

RUN \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    composer self-update

EXPOSE 9000

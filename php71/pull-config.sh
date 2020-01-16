#!/bin/bash

echo 'Download configs...'
docker cp php71:/usr/local/etc/php/php.ini-development php.ini
docker cp php71:/usr/local/etc/php-fpm.d/www.conf www.conf
echo 'Done.'

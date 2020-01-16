#!/bin/bash

echo 'Upload configs...'
docker cp php.ini php71:/usr/local/etc/php/
docker cp www.conf php71:/usr/local/etc/php-fpm.d/www.conf
echo 'Done.'

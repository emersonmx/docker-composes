#!/bin/bash

echo 'Download configs...'
docker cp php56:/usr/local/etc/php/php.ini-development php.ini
echo 'Done.'

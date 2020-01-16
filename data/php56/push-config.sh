#!/bin/bash

echo 'Upload configs...'
docker cp php.ini php56:/usr/local/etc/php/
echo 'Done.'

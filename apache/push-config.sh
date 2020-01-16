#!/bin/bash

echo 'Upload configs...'
docker cp httpd.conf apache:/usr/local/apache2/conf/
docker cp extra/httpd-vhosts.conf apache:/usr/local/apache2/conf/extra/
echo 'Done.'

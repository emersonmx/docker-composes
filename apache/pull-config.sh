#!/bin/bash

echo 'Download configs...'
docker cp apache:/usr/local/apache2/conf/httpd.conf .
docker cp apache:/usr/local/apache2/conf/extra/httpd-vhosts.conf extra
echo 'Done.'

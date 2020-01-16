#!/bin/bash

project_path="$(dirname $(dirname $(realpath $0)))"
source "$project_path/libs/helpers.sh"
service_path="$(get_service_path $0)"
container_name="$(get_container_name $0)"

echo 'Download configs...'
docker cp $container_name:/usr/local/etc/php/ "$service_path/php.ini"
docker cp $container_name:/usr/local/etc/php-fpm.d/www.conf "$service_path/www.conf"
echo 'Done.'

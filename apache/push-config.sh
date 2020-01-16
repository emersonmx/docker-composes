#!/bin/bash

project_path="$(dirname $(dirname $(realpath $0)))"
source "$project_path/libs/helpers.sh"
service_path="$(get_service_path $0)"
container_name="$(get_container_name $0)"

echo 'Upload configs...'
docker cp "$service_path/httpd.conf" $container_name:/usr/local/apache2/conf/
docker cp "$service_path/extra/httpd-vhosts.conf" $container_name:/usr/local/apache2/conf/extra/
echo 'Done.'

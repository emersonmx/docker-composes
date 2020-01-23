#!/bin/bash

project_path="$(dirname $(dirname $(realpath $0)))"
source "$project_path/libs/helpers.sh"
service_path="$(get_service_path $0)"
container_name="$(get_container_name $0)"

echo 'Upload configs...'
docker cp "$service_path/php.ini" $container_name:/usr/local/etc/php/
echo 'Done.'

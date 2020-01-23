#!/bin/bash

project_path="$(dirname $(dirname $(realpath $0)))"
source "$project_path/libs/helpers.sh"
service_path="$(get_service_path $0)"
container_name="$(get_container_name $0)"

echo 'Upload configs...'
docker cp "$service_path/nginx.conf" $container_name:/etc/nginx/nginx.conf
docker cp "$service_path/conf.d/default.conf" $container_name:/etc/nginx/conf.d/default.conf
echo 'Done.'

#!/bin/bash

project_path="$(dirname $(dirname $(realpath $0)))"
source "$project_path/libs/helpers.sh"
service_path="$(get_service_path $0)"
container_name="$(get_container_name $0)"

echo 'Download configs...'
docker cp $container_name:/etc/nginx/nginx.conf "$service_path/nginx.conf"
docker cp $container_name:/etc/nginx/conf.d/default.conf "$service_path/conf.d/default.conf"
echo 'Done.'

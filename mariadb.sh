#!/bin/bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

service_name=mariadb
data_dir="$script_dir/$service_name/data"
mkdir -p $data_dir

docker run \
    -d \
    -it \
    --name $service_name \
    -e MYSQL_ROOT_PASSWORD=secret \
    -p 3306:3306 \
    -v $data_dir:/var/lib/mysql \
    mariadb

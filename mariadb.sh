#!/bin/bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

data_dir="$script_dir/mariadb/data"
mkdir -p $data_dir

docker run \
    -d \
    -it \
    --rm \
    --name mariadb \
    -e MYSQL_ROOT_PASSWORD=secret \
    -p 3306:3306 \
    -v $data_dir:/var/lib/mysql \
    mariadb

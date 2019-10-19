#!/bin/bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

service_name=pgadmin
data_dir="$script_dir/$service_name/data"
mkdir -p $data_dir

docker run \
    -d \
    -it \
    --rm \
    --name $service_name \
    -e PGADMIN_DEFAULT_EMAIL=admin \
    -e PGADMIN_DEFAULT_PASSWORD=secret \
    -p 5050:80 \
    -v $data_dir:/var/lib/pgadmin \
    dpage/pgadmin4

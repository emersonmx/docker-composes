#!/bin/bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

service_name=redis
data_dir="$script_dir/$service_name/data"
mkdir -p $data_dir

docker run \
    -d \
    -it \
    --rm \
    --name $service_name \
    -p 6379:6379 \
    -v $data_dir:/data \
    redis:alpine

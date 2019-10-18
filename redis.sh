#!/bin/bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

data_dir="$script_dir/redis/data"
mkdir -p $data_dir

docker run \
    -d \
    -it \
    --rm \
    --name redis \
    -p 6379:6379 \
    -v $data_dir:/data \
    redis:alpine

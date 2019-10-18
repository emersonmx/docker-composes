#!/bin/bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

data_dir="$script_dir/pgsql/data"
mkdir -p $data_dir

docker run \
    -d \
    -it \
    --rm \
    --name pgsql \
    -e POSTGRES_USER=postgres \
    -e POSTGRES_PASSWORD=secret \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -p 5432:5432 \
    -v $data_dir:/var/lib/postgresql/data/pgdata \
    postgres:10-alpine

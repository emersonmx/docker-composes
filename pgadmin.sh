#!/bin/bash
set -euo pipefail

if [[ $# != 1 ]]
then
    echo "Usage: $0 <action>"
    exit 0
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

service_name=pgadmin
image=dpage/pgadmin4
data_dir="$script_dir/$service_name/data"
mkdir -p $data_dir

action=$1

function run_service() {
    docker run \
        -d \
        -it \
        --name $service_name \
        -e PGADMIN_DEFAULT_EMAIL=admin \
        -e PGADMIN_DEFAULT_PASSWORD=secret \
        -p 5050:80 \
        -v $data_dir:/var/lib/pgadmin \
        $image
}

function start_service() {
    docker start $service_name
}

function stop_service() {
    docker stop $service_name
}

function update_service() {
    if [[ $(docker inspect $service_name | grep Running) ]]
    then
        stop_service
        docker container rm $service_name
    fi

    docker pull $image
}

case $1 in
    start )
        start_service
        ;;
    stop )
        stop_service
        ;;
    restart )
        stop_service
        start_service
        ;;
    run )
        run_service
        ;;
    update )
        update_service
        ;;
    * )
        echo "Action not found!"
        ;;
esac

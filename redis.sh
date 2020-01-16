#!/bin/bash

if [[ $# != 1 ]]
then
    echo "Usage: $0 <action>"
    exit 0
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

service_name=redis
image=redis:alpine
data_dir="$script_dir/data/$service_name/data"
mkdir -p $data_dir

action=$1

function run_service() {
    docker run \
        -d \
        -it \
        --name $service_name \
        -p 6379:6379 \
        -v $data_dir:/data \
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

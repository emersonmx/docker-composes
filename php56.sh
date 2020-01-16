#!/bin/bash

if [[ $# != 1 ]]
then
    echo "Usage: $0 <action>"
    exit 0
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

service_name=php56
image=$service_name-custom
data_dir="$script_dir/data/$service_name"

action=$1

function build_service() {
    docker image build -t $image $data_dir
}

function run_service() {
    docker run \
        -d \
        -it \
        --name $service_name \
        -p 9001:9001 \
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

    build_service
}

function shell_service() {
    docker exec -it $service_name bash
}

case $1 in
    build )
        build_service
        ;;
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
    shell )
        shell_service
        ;;
    * )
        echo "Action not found!"
        ;;
esac

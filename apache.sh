#!/bin/bash

if [[ $# != 1 ]]
then
    echo "Usage: $0 <action>"
    exit 0
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

service_name=apache
image=httpd:2.4
data_dir="$script_dir/$service_name"
webroot="$HOME/code/projects/php"

action=$1

function run_service() {
    docker run \
        -d \
        -it \
        --name $service_name \
        -p 80:80 \
        -v $webroot:/code \
        $image

    docker cp "$data_dir/apache/httpd.conf" apache:/usr/local/apache2/conf/
    docker cp "$data_dir/apache/extra/httpd-vhosts.conf" apache:/usr/local/apache2/conf/extra/
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

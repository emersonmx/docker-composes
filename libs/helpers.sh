#!/bin/bash

function get_project_path() {
    echo "$(dirname $(dirname $(realpath $1)))"
}

function get_service_path() {
    echo "$(dirname $(realpath $1))"
}

function get_container_name() {
    project_path="$(get_project_path $1)"
    project_name="$(basename $project_path)"
    service_path="$(get_service_path $1)"
    service_name="$(basename $service_path)"
    echo "${project_name}_${service_name}_1"
}

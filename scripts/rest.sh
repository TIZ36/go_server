#!/bin/bash

api_service_name=$1

# default work dir is the root of the project
cd ..

# check if the api file exists
if test -f $api_service_name.api; then
    echo "api file ok"
else
    echo "api file not exists, please mannually create it."
    exit 1
fi

# generate the restful service folder
mkdir -p restful/$api_service_name &&

# generate the restful service code
goctl api go -api $api_service_name.api -dir ./restful/$api_service_name -style go_zero
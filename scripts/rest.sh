#!/bin/bash

api_service_name=$1

# 定义颜色和样式的ANSI转义序列
RED='\033[0;31m'
GREEN='\033[0;32m'
BOLD='\033[1m'
NC='\033[0m' # No Color

OKTAG="${BOLD}${GREEN}[OK]${NC}"
ERRTAG="${BOLD}${RED}[ER]${NC}"

function check_goctl() {
    if command -v goctl &> /dev/null
    then
        echo -e "${OKTAG} goctl exists"
    else
        echo -e "${ERRTAG} goctl does not exist, please install it first."
        exit 1
    fi
}

check_api_service_name() {
    if [ -z "$api_service_name" ]; then
        echo -e "${ERRTAG} api service name is empty, please input the api service name."
        exit 1
    else 
        echo -e "${OKTAG} api service name: $api_service_name"
    fi
}

check_apifile_exist() {
    if [ ! -f "$api_service_name.api" ]; then
        echo -e "${ERRTAG} api service file $api_service_name.api does not exist."
        exit 1
    else 
        echo -e "${OKTAG} api service file $api_service_name.api exists."
    fi
}

do_gen_gozero_rest_service() {
    echo -e "\n${BOLD}Below is Go-Zero output: \n${NC}" 
    # generate the restful service folder
    mkdir -p restful/$api_service_name &&
    # generate the restful service code
    goctl api go -api $api_service_name.api -dir ./restful/$api_service_name -style go_zero
}

start_restful_service() {
    # start the restful service
    cd restful/$api_service_name &&
    echo -e "${BOLD}DO 'go mod tidy' ... \n${NC}" && go mod tidy &&
    echo -e "${BOLD}DO 'go run $api_service_name.go' ... \n${NC}" && go run $api_service_name.go
}

# default work dir is the root of the project
cd .. && echo -e "${BOLD}workspace: ${PWD}${NC}\n"
# check if goctl exists
check_goctl
# check if the api service name is empty
check_api_service_name
# check if the api service file exists
check_apifile_exist
# generate the go-zero restful service
do_gen_gozero_rest_service
# start the restful service
start_restful_service
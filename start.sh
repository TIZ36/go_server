#!/bin/bash

service_name=$1

# 如果service_name没有输入，提示使用app为默认值
if [ -z "$service_name" ]; then
    echo -e "${BOLD}service_name is empty, use 'app' as default value.${NC}"
    service_name="app"
fi

cd scripts && ./rest.sh $service_name


#!/bin/bash

TARGET="./highest_common_factor.sh"

result=$("$TARGET")

if [[ $result = 1 ]]; then
    echo "OK"
    exit 0
else
    echo "NG"
    exit 1
fi

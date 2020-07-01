#!/usr/bin/env bash

set -o errexit

docker build \
    --build-arg http_proxy=${proxy} \
    -t langyb/xwiki-toolbox:latest \
    .

docker push langyb/xwiki-toolbox:latest
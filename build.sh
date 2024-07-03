#!/bin/bash

tag="$1"

if [ "$tag" ]; then
    docker build --rm -t "ansible-sandbox:$tag" . -f ansible-ubuntu.Dockerfile
else
    docker build --rm -t ansible-sandbox . -f ansible-ubuntu.Dockerfile
fi
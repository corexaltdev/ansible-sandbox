#!/bin/bash

tag="$1"
playbook=""
if [ "$tag" ]; then
    docker build --build-arg PLAYBOOK="$playbook" --rm -t "ansible-sandbox:$tag" . -f ansible-ubuntu.Dockerfile
else
    docker build --rm -t ansible-sandbox . -f ansible-ubuntu.Dockerfile
fi
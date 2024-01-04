#!/bin/bash
set -euo pipefail
trap 'echo FATAL ERROR EXIT CODE $? AT $0:$LINENO' ERR

tag="kouyosgroup/resistancedb2:latest"
name="ResistanceDB2"

sudo docker build . --tag $tag

sudo docker rm --force $name || true

sudo docker run \
    --volume "$(realpath ./data):/home/ubuntu/ResistanceDB2/data" \
    --name $name \
    $tag \
    /bin/bash -c "./run.sh"

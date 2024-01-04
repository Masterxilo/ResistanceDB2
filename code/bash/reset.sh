#!/bin/bash
set -euo pipefail
trap 'echo FATAL ERROR EXIT CODE $? AT $0:$LINENO' ERR

rm -rf ./data/*

mkdir -p ./data/input ./data/temp ./data/output

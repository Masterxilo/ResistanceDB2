#!/bin/bash
set -euo pipefail
trap 'echo FATAL ERROR EXIT CODE $? AT $0:$LINENO' ERR

#rm -rf ./data/* #no, input might be irreproducible!
rm -rf ./data/temp ./data/output
rm -f ./data/input/input.json # we know this can be reproduced

mkdir -p ./data/input ./data/temp ./data/output

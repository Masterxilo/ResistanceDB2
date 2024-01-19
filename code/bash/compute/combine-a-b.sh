#!/bin/bash
set -euo pipefail
trap 'echo FATAL ERROR EXIT CODE $? AT $0:$LINENO' ERR

#./code/bash/compute/combine-a-b.sh
cat ./data/input/a ./data/input/b > ./data/output/ab
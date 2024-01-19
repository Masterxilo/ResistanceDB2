#!/bin/bash
set -euo pipefail
trap 'echo FATAL ERROR EXIT CODE $? AT $0:$LINENO' ERR

#./code/bash/compute/create-d-e.sh
touch ./data/output/d
touch ./data/output/e

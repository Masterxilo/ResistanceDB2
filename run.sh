#!/bin/bash
set -euo pipefail
trap 'echo FATAL ERROR EXIT CODE $? AT $0:$LINENO' ERR

# optionally:
./code/bash/reset.sh

./code/bash/ensure-dependencies-are-installed.sh

./code/make/make

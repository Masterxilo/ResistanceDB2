#!/bin/bash
set -euo pipefail
trap 'echo FATAL ERROR EXIT CODE $? AT $0:$LINENO' ERR

# TODO freeze version
which Rscript || sudo apt-get install -y r-base-core
Rscript --version

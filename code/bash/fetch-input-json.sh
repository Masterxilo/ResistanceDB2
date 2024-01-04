#!/bin/bash
set -euo pipefail
trap 'echo FATAL ERROR EXIT CODE $? AT $0:$LINENO' ERR

curl --verbose --fail https://httpbin.org/get?hello=world --output ./data/input/input.json

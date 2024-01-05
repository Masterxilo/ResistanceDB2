#!/bin/bash
set -euo pipefail
trap 'echo FATAL ERROR EXIT CODE $? AT $0:$LINENO' ERR

jq .args.hello < ./data/input/input.json > ./data/output/output.json

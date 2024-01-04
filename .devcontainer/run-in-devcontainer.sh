#!/bin/bash
set -euo pipefail
trap 'echo FATAL ERROR EXIT CODE $? AT $0:$LINENO' ERR

# TODO test, install dependency npm, maybe prefer to run with npx?

npm install -g @devcontainers/cli
devcontainer up --workspace-folder .
devcontainer exec --workspace-folder . -- echo hi
devcontainer down --workspace-folder .

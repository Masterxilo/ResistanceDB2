#!/bin/bash
set -euo pipefail
trap 'echo FATAL ERROR EXIT CODE $? AT $0:$LINENO' ERR

condaprefix="$HOME/mambaforge"
condabin="$condaprefix/bin"
PATH="$condabin:${PATH}"

if which conda > /dev/null; then
    exit
fi

# TODO freeze version
cd /tmp
wget --no-clobber https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh
bash Mambaforge-Linux-x86_64.sh -b -p "$condaprefix"
# rm Mambaforge-Linux-x86_64.sh # OPTIMIZATION make image smaller...

which conda
mamba --version

# noninteractive installation to home dir, but adding PATH modification to bashrc with the same effect; also change PATH right now with
#   source put-dependencies-on-PATH.sh
echo 'PATH="'"$condabin"':${PATH}"' >> ~/.bashrc

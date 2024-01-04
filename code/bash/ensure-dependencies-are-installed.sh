#!/bin/bash
set -euo pipefail
trap 'echo FATAL ERROR EXIT CODE $? AT $0:$LINENO' ERR

./code/bash/make-conda-installed.sh

which python
python --version | grep --fixed-strings 'Python 3.'
which pip

./code/bash/make-R-installed.sh
which Rscript

# install libraries
#Rscript -e 'library("tidyverse")'

# other binaries we depend on, maybe install with conda...
#which conda blastn sierrapy pdflatex pandoc

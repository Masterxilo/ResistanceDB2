#!/bin/bash
set -euo pipefail
trap 'echo FATAL ERROR EXIT CODE $? AT $0:$LINENO' ERR

./code/bash/make-conda-installed.sh

which python
python --version | grep --fixed-strings 'Python 3.'
which pip

./code/bash/make-R-installed.sh
which Rscript
Rscript -e 'library("tidyverse")'

#which conda blastn sierrapy pdflatex pandoc

#!/bin/bash
set -euo pipefail
trap 'echo FATAL ERROR EXIT CODE $? AT $0:$LINENO' ERR

sudo apt-get --yes --no-install-recommends install texlive-{base,bibtex-extra,extra-utils,fonts-recommended,font-utils,latex-base,latex-recommended,latex-extra,pictures,pstricks,science} perl-tk purifyeps chktex latexmk dvipng xindy dvidvi fragmaster lacheck latexdiff libfile-which-perl dot2tex tipa

pdflatex --version
tlmgr --version

#  TODO install required latex packages
#tlmgr init-usertree
# update
#tlmgr update --self
#tlmgr install ulem environ xcolor titling booktabs tabulary colortbl float tabu xcolor geometry adjustbox multirow wrapfig float colortbl pdflscape tabu threeparttable threeparttablex makecell xcolor selnolig etoolbox
# FAILS > tlmgr: Local TeX Live (2021) is older than remote repository (2023).
# maybe install texlive 2023 latest according to official instructions...
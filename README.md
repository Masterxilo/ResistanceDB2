

# Software Architecture

This project uses the following technologies:

* R including CRAN package ecosystem
* Python including PyPI/pip and Conda/Mamba ecosystem
* Snakemake
* Some other software that is available in source or compiled form for Linux and Windows

Optionally, all of this can run in a Docker container.

## Supported Operating Systems
Windows 10 (only natively, no Windows container support)

Ubuntu 22.04 (both natively and in a Docker container, both on native Ubuntu and on Windows via WSL)


## Supported IDEs
IntelliJ IDEA (Ultimate, Community) by Jetbrains with https://plugins.jetbrains.com/plugin/6632-r-language-for-intellij & https://plugins.jetbrains.com/plugin/7322-python-community-edition

Visual Studio Code by Microsoft, optionally inside a DevContainer (tip: clone using https, not ssh to share credentials via credential helper store)

RStudio IDE by Posit PBC

## Supported Sources for Dependences
* anything that can be installed via shellscript on Ubuntu 22.04, in particular:
* anything available via `apt`/Debian package: https://packages.ubuntu.com/ and other repositories
* R: anything available on CRAN https://cran.r-project.org/web/packages/available_packages_by_date.html or indirectly via pacman/BiocManager/pak/devtools/remotes
* Python:
    * anything installable via pip, usually from https://pypi.org/
    * anything available via Anaconda/Conda/Mamba/Mambaforge https://anaconda.org/anaconda/repo

# TODO, Further Ideas
* monolotic makefile?
* every compute script should run independently too, and in an IDE with debuggability, single stepping
* in the "make" rule for any output file, maybe depend on the (main/lib) code files involved in the computation as well; or just delete everything on code changes?

* automatic formatting
* lint all code, in particular shell code too using shellcheck or similar (static analysis)
* decide if ./data/temp is needed - could also use /tmp... but maybe we would want to see it.. generate tempfilename in these dirs for traceability...

* consider substructuring code:
    * dependencies
    * input
    * computation
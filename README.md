

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

## Supported Sources for Dependences
* anything that can be installed via shellscript on Ubuntu 22.04, in particular:
* anything available via `apt`/Debian package: https://packages.ubuntu.com/ and other repositories
* R: anything available on CRAN https://cran.r-project.org/web/packages/available_packages_by_date.html or indirectly via pacman/BiocManager
* Python:
    * anything installable via pip, usually from https://pypi.org/
    * anything available via Anaconda/Conda/Mamba/Mambaforge https://anaconda.org/anaconda/repo
# TODO freeze version/hash
FROM ubuntu:22.04

# Install some basic tools, some of which are required for a vscode devcontainer
# TODO freeze version
RUN apt-get update && apt-get install -y curl sudo

# create non root user, this is common practice in docker containers and is required for vscode devcontainers and good interoperability in general especially when it comes to file permissions
RUN useradd -ms /bin/bash -G sudo ubuntu
RUN echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
# switch to ubuntu user
USER ubuntu

WORKDIR /home/ubuntu
# TODO freeze version
RUN curl -L https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh -o Mambaforge-Linux-x86_64.sh

# Install some basic tools, some of which are required for a vscode devcontainer
# TODO freeze version
RUN sudo apt-get update && sudo apt-get install -y \
    python3 \
    python3-pip \
    python3-dev \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-setuptools \
    python3-venv \
    git \
    curl \
    sudo

# TODO consider storing dependency files in this repo especially 
#RUN apt-get install -y git-lfs


WORKDIR /home/ubuntu
RUN bash Mambaforge-Linux-x86_64.sh -b -p /home/ubuntu/mambaforge
RUN rm Mambaforge-Linux-x86_64.sh
ENV PATH="/home/ubuntu/mambaforge/bin:${PATH}"
RUN which conda && mamba --version

# note: in devcontainer, /workspaces/ResistanceDB2 is mounted to host machine
WORKDIR /home/ubuntu/ResistanceDB2
COPY . .

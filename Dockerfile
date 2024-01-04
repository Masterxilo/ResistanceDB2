FROM ubuntu:22.04

# Install some basic tools, some of which are required for a vscode devcontainer
RUN apt-get update && apt-get install -y \
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
    sudo \
    && rm -rf /var/lib/apt/lists/*

# create non root user, this is common practice in docker containers and is required for vscode devcontainers and good interoperability in general especially when it comes to file permissions
RUN useradd -ms /bin/bash -G sudo ubuntu
RUN echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
# switch to ubuntu user
USER ubuntu

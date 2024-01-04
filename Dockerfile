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



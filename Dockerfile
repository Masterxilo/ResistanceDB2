# TODO freeze version/hash
FROM ubuntu:22.04
RUN apt-get update

# ensure apt installations will never ask questions
ARG DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
ENV TZ=Europe/Zurich
RUN echo $TZ > /etc/timezone
RUN apt-get install -y tzdata

# Install some basic tools, some of which are required for a vscode devcontainer
# TODO freeze version
RUN apt-get install -y curl sudo wget

# create non root user, this is common practice in docker containers and is required for vscode devcontainers and good interoperability in general especially when it comes to file permissions
RUN useradd -ms /bin/bash -G sudo ubuntu
RUN echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
# switch to ubuntu user
USER ubuntu

WORKDIR /home/ubuntu
# DOCKER BUILD OPTIMIZATION: install known dependencies early, and in particular, perform this long download early so that it can be cached
# TODO freeze version
RUN cd /tmp && wget https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh

# Install some basic tools, some (like git...) of which are required for a vscode devcontainer
# TODO freeze version
RUN sudo apt-get install -y git
RUN sudo apt-get install -y build-essential libssl-dev libffi-dev


# TODO consider storing dependency files in this repo especially 
#RUN apt-get install -y git-lfs

WORKDIR /home/ubuntu
WORKDIR /home/ubuntu/ResistanceDB2

# OPTIMIZATION install known dependencies early

#COPY ./code/bash/ /home/ubuntu/ResistanceDB2/code/bash/
COPY ./code/bash/make-R-installed.sh /home/ubuntu/ResistanceDB2/code/bash/
# 
RUN ./code/bash/make-R-installed.sh

COPY ./code/bash/make-conda-installed.sh /home/ubuntu/ResistanceDB2/code/bash/
RUN ./code/bash/make-conda-installed.sh

# note: in devcontainer, /workspaces/ResistanceDB2 is mounted to host machine

# COPY this repo into the container (this copy is not used when we work in the vscode devcontainer)
COPY . .

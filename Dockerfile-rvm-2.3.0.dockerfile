FROM buildpack-deps:bullseye

# Update repository with remote
RUN apt-get update

# General dependency installation
RUN apt-get install -y bison libgdbm-dev ruby autoconf make gem

# https://stackoverflow.com/questions/57946621/error-running-requirements-debian-libs-install-libssl-dev
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32
RUN echo "deb http://security.ubuntu.com/ubuntu bionic-security main" >> /etc/apt/sources.list
RUN apt-get update && apt-cache policy libssl1.0-dev
RUN apt-get install -y libssl1.0-dev

# https://rvm.io/rvm/install
RUN gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN \curl -sSL https://get.rvm.io | bash

# Update repository with remote
RUN apt-get update

# Make RVM runnable
RUN echo "source /usr/local/rvm/scripts/rvm" >> ~/.bashrc

# Change shell to bash, instead of dash
SHELL ["/bin/bash", "-l", "-c" ]

# NOTE: other versions of ruby may require other dependences
RUN rvm install 2.3.0

# NOTE: Most other operations in Ubuntu depend on dash
SHELL ["/bin/sh"]
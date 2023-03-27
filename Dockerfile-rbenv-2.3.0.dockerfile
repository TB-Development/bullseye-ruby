FROM buildpack-deps:bullseye
RUN apt-get update

# https://github.com/rbenv/ruby-build/wiki#openssl-usrincludeopensslasn1_mach102-error-error-this-file-is-obsolete-please-update-your-software
RUN apt-get install -y autoconf bison patch build-essential rustc libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev rbenv ca-certificates

# https://stackoverflow.com/questions/57946621/error-running-requirements-debian-libs-install-libssl-dev
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32
RUN echo "deb http://security.ubuntu.com/ubuntu bionic-security main" >> /etc/apt/sources.list
RUN apt-get update && apt-cache policy libssl1.0-dev && apt-get update
RUN apt-get install -y libssl1.0-dev

### Make rbenv runnable
RUN echo "eval '$(rbenv init -)'" >> ~/.bashrc
RUN rbenv install 2.3.0
RUN rbenv local 2.3.0

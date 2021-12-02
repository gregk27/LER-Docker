FROM docker/dev-environments-java AS base

RUN curl -SL https://github.com/wpilibsuite/roborio-toolchain/releases/download/v2022-1/FRC-2022-Linux-Toolchain-7.3.0.tar.gz | \
    sh -c 'mkdir -p /usr/local && cd /usr/local && tar xzf - --strip-components=2'

#Install vim
RUN apt-get -y update
RUN apt-get -y install vim
#Install JDK
RUN apt-get -y install default-jdk
RUN apt-get -y install gradle

FROM base
#Migrate files in local dir
COPY . /frc
COPY ./git-hooks/* /frc/git-hooks
RUN chmod +x /frc/git-hooks/*

RUN git config --global user.name "LER-Programming"
RUN git config --global user.email "github.lakeeffectrobotics@gmail.com"
RUN git config --global core.hooksPath /frc/git-hooks
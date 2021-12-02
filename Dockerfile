FROM docker/dev-environments-java AS base

ARG YEAR
ARG WPI_VERSION

ENV wpi_year=$YEAR
ENV wpi_version=$WPI_VERSION

RUN curl -SL "https://github.com/wpilibsuite/roborio-toolchain/releases/download/v$wpi_year-$wpi_version/FRC-$wpi_year-Linux-Toolchain-7.3.0.tar.gz" | \
    sh -c 'mkdir -p /usr/local && cd /usr/local && tar xzf - --strip-components=2'

#Install vim
RUN apt-get -y update
RUN apt-get -y install vim
#Install JDK
RUN apt-get -y install default-jdk
RUN apt-get -y install gradle

FROM base
#Migrate files in local dir
COPY ./deploy /frc
COPY ./deploy/git-hooks/* /frc/git-hooks
RUN chmod +x /frc/git-hooks/*

RUN git config --global user.name "LER-Programming"
RUN git config --global user.email "github.lakeeffectrobotics@gmail.com"
RUN git config --global core.hooksPath /frc/git-hooks
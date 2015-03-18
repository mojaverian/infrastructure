FROM debian:jessie
MAINTAINER Mattias Fliesberg <mattias@fliesberg.email>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository 'deb http://repos.fusiondirectory.org/debian wheezy main' && \
    add-apt-repository 'deb http://repos.fusiondirectory.org/debian-extra wheezy main' && \
    apt-get update && \
    apt-get install fusiondirectory

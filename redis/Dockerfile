FROM debian:jessie
MAINTAINER Mattias Fliesberg <mattias@fliesberg.email>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y redis-server

COPY start.sh /start.sh

ENTRYPOINT ["/start.sh"]

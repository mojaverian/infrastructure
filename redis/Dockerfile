FROM debian:jessie
MAINTAINER Mattias Fliesberg <mattias@fliesberg.email>

ENV DEBIAN_FRONTEND noninteractive
ENV HTTP_PROXY ""

RUN export ALL_PROXY="http://fr-proxy.groupinfra.com:3128" && \
    export HTTP_PROXY="http://fr-proxy.groupinfra.com:3128" && \
    export HTTPS_PROXY="http://fr-proxy.groupinfra.com:3128" && \
    export all_proxy="http://fr-proxy.groupinfra.com:3128" && \
    export http_proxy="http://fr-proxy.groupinfra.com:3128" && \
    export https_proxy="http://fr-proxy.groupinfra.com:3128" && \
    apt-get update && \
    apt-get install -y redis-server

COPY start.sh /start.sh

ENTRYPOINT ["/start.sh"]

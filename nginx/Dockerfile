FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y nginx

COPY start.sh /start.sh

ENTRYPOINT ["/start.sh"]

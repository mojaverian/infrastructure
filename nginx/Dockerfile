FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

COPY start_nginx.sh /start_nginx.sh

RUN apt-get update && \
    apt-get install -y nginx

ENTRYPOINT ["/start_nginx.sh"]

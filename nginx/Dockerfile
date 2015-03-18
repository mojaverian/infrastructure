FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y nginx

COPY start_nginx.sh /start_nginx.sh

ENTRYPOINT ["/start_nginx.sh"]

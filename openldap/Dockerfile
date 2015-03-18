FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y slapd

EXPOSE 389

COPY start_slapd.sh /start_slapd.sh

ENTRYPOINT ["/start_slapd.sh"]

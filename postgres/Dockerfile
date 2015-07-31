FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive
ENV HTTP_PROXY ""

RUN export ALL_PROXY="http://fr-proxy.groupinfra.com:3128" && \
    export HTTP_PROXY="http://fr-proxy.groupinfra.com:3128" && \
    export HTTPS_PROXY="http://fr-proxy.groupinfra.com:3128" && \
    export all_proxy="http://fr-proxy.groupinfra.com:3128" && \
    export http_proxy="http://fr-proxy.groupinfra.com:3128" && \
    export https_proxy="http://fr-proxy.groupinfra.com:3128" && \
    apt-get update && \
    apt-get install -y postgresql

USER postgres

RUN /etc/init.d/postgresql start && \
    psql -c "CREATE USER admin WITH SUPERUSER PASSWORD 'changeme';" && \
    # don't know how to do this in the gitlab docker build so let's do it here
    psql -c "CREATE USER git CREATEDB PASSWORD 'changeme'" && \
    psql -c "CREATE DATABASE gitlabhq_production OWNER git;"

RUN echo "host all all 0.0.0.0/0 md5" >> /etc/postgresql/9.4/main/pg_hba.conf
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.4/main/postgresql.conf

CMD ["/usr/lib/postgresql/9.4/bin/postgres", \
     "-D", "/var/lib/postgresql/9.4/main", \
     "-c", "config_file=/etc/postgresql/9.4/main/postgresql.conf"]

FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y postgresql

USER postgres

RUN /etc/init.d/postgresql start && \
    psql --command "CREATE USER admin WITH SUPERUSER PASSWORD 'changeme';"

RUN echo "host all all 0.0.0.0/0 md5" >> /etc/postgresql/9.4/main/pg_hba.conf
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.4/main/postgresql.conf

CMD ["/usr/lib/postgresql/9.4/bin/postgres", \
     "-D", "/var/lib/postgresql/9.4/main", \
     "-c", "config_file=/etc/postgresql/9.4/main/postgresql.conf"]

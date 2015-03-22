FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL en_US.UTF-8

RUN echo "slapd shared/organization string koda.re" | debconf-set-selections
RUN echo "slapd slapd/domain string koda.re" | debconf-set-selections
RUN echo "slapd slapd/password1 password changeme" | debconf-set-selections
RUN echo "slapd slapd/password2 password changeme" | debconf-set-selections
RUN echo "slapd slapd/internal/generated_adminpw password changeme" | debconf-set-selections
RUN echo "slapd slapd/internal/adminpw password changeme" | debconf-set-selections

RUN apt-get update && \
    apt-get install -y software-properties-common gnupg && \
    gpg --keyserver keys.gnupg.net --recv-keys E184859262B4981F && \
    gpg -a --export E184859262B4981F | apt-key add - && \
    add-apt-repository 'deb http://repos.fusiondirectory.org/debian wheezy main' && \
    add-apt-repository 'deb http://repos.fusiondirectory.org/debian-extra wheezy main' && \
    apt-get update && \
    apt-get install -y slapd ldap-utils dialog locales fusiondirectory-schema

RUN /etc/init.d/slapd start && \
    fusiondirectory-insert-schema

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    dpkg-reconfigure locales

EXPOSE 389

COPY start.sh /start.sh

ENTRYPOINT ["/start.sh"]

FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL en_US.UTF-8
ENV HTTP_PROXY ""

RUN echo "slapd shared/organization string koda.re" | debconf-set-selections
RUN echo "slapd slapd/domain string koda.re" | debconf-set-selections
RUN echo "slapd slapd/password1 password changeme" | debconf-set-selections
RUN echo "slapd slapd/password2 password changeme" | debconf-set-selections
RUN echo "slapd slapd/internal/generated_adminpw password changeme" | debconf-set-selections
RUN echo "slapd slapd/internal/adminpw password changeme" | debconf-set-selections

    
RUN export ALL_PROXY="http://fr-proxy.groupinfra.com:3128" && \
    export HTTP_PROXY="http://fr-proxy.groupinfra.com:3128" && \
    export HTTPS_PROXY="http://fr-proxy.groupinfra.com:3128" && \
    export all_proxy="http://fr-proxy.groupinfra.com:3128" && \
    export http_proxy="http://fr-proxy.groupinfra.com:3128" && \
    export https_proxy="http://fr-proxy.groupinfra.com:3128" && \
    export LC_ALL="en_US.UTF-8" && \
    apt-get update && \
   # apt-get install -y apt-utils locales curl && \
   # dpkg-reconfigure locales && \
    apt-get install -y software-properties-common gnupg && \
#    curl -#LO https://rvm.io/mpapis.asc && \
#    gpg --import mpapis.asc && \
   # gpg --keyserver keys.gnupg.net  --keyserver-options http-proxy=$HTTP_PROXY --recv-keys "E184859262B4981F" && \
   # gpg --armor --export "E184859262B4981F" --keyserver-options http-proxy=$HTTP_PROXY | apt-key add - && \
    
   # gpg --keyserver keys.gnupg.net --recv-keys "E184859262B4981F" && \
   # gpg -a --export "E184859262B4981F" | apt-key add - && \
   # add-apt-repository 'deb http://repos.fusiondirectory.org/debian wheezy main' && \
   # add-apt-repository 'deb http://repos.fusiondirectory.org/debian-extra wheezy main' 
   # apt-get update && \
    apt-get install -y slapd ldap-utils dialog locales ldap-utils \
    fusiondirectory-schema fusiondirectory-plugin-mail-schema

RUN /etc/init.d/slapd start && \
    fusiondirectory-insert-schema && \
    fusiondirectory-insert-schema --insert \
    /etc/ldap/schema/fusiondirectory/mail-fd.schema \
    /etc/ldap/schema/fusiondirectory/mail-fd-conf.schema \
    /etc/ldap/schema/fusiondirectory/systems-fd.schema \
    /etc/ldap/schema/fusiondirectory/service-fd.schema \
    /etc/ldap/schema/fusiondirectory/systems-fd-conf.schema

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    dpkg-reconfigure locales

EXPOSE 389

COPY start.sh /start.sh

ENTRYPOINT ["/start.sh"]

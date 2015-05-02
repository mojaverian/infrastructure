FROM debian:jessie
MAINTAINER Mattias Fliesberg <mattias@fliesberg.email>

ENV DEBIAN_FRONTEND noninteractive
ENV PGPASSWORD changeme

RUN apt-get update && \
    apt-get install -y postgresql-client libpq-dev build-essential \
    zlib1g-dev libyaml-dev libssl-dev libgdbm-dev libreadline-dev \
    libncurses5-dev libffi-dev curl openssh-server redis-server \
    checkinstall libxml2-dev libxslt-dev libcurl4-openssl-dev libicu-dev \
    logrotate python-docutils pkg-config cmake libkrb5-dev nodejs git \
    sudo ruby bundler

RUN adduser --disabled-login --gecos 'GitLab' git

RUN cd /home/git && \
    sudo -u git -H git clone https://gitlab.com/gitlab-org/gitlab-ce.git -b 7-10-stable gitlab

COPY config/gitlab.yml /home/git/gitlab/config/gitlab.yml
COPY config/resque.yml /home/git/gitlab/config/resque.yml
COPY config/database.yml /home/git/gitlab/config/database.yml
COPY config/unicorn.rb /home/git/gitlab/config/unicorn.rb

RUN cd /home/git/gitlab && \
    chown -R git log/ && \
    chown -R git tmp/ && \
    chmod -R u+rwX,go-w log/ && \
    chmod -R u+rwX tmp/ && \
    sudo -u git -H mkdir /home/git/gitlab-satellites && \
    chmod u+rwx,g=rx,o-rwx /home/git/gitlab-satellites && \
    chmod -R u+rwX tmp/pids/ && \
    chmod -R u+rwX tmp/sockets/ && \
    chmod -R u+rwX  public/uploads && \
    sudo -u git -H cp config/initializers/rack_attack.rb.example config/initializers/rack_attack.rb && \
    sudo -u git -H git config --global user.name "GitLab" && \
    sudo -u git -H git config --global user.email "git@koda.re" && \
    sudo -u git -H git config --global core.autocrlf input && \
    sudo -u git -H bundle install --deployment --without development test mysql aws && \
    sudo -u git -H bundle exec rake gitlab:shell:install[v2.6.2] REDIS_URL=redis://redis:6379 RAILS_ENV=production && \
    sudo -u git -H bundle exec rake assets:precompile RAILS_ENV=production

COPY start.sh /start.sh

ENTRYPOINT ["/start.sh"]

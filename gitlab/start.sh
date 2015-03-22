#!/bin/sh

GITLAB_HOME=/home/git/gitlab

ln -sf /gitlab_config/gitlab.yml $GITLAB_HOME/config/gitlab.yml
ln -sf /gitlab_config/unicorn.rb $GITLAB_HOME/config/unicorn.rb
ln -sf /gitlab_config/resque.yml $GITLAB_HOME/config/resque.yml
ln -sf /gitlab_config/database.yml $GITLAB_HOME/config/database.yml

/etc/init.d/ssh start

cd $GITLAB_HOME;

sudo -u git -H bundle exec rake sidekiq:start RAILS_ENV=production
sudo -u git -H bundle exec unicorn_rails -c $GITLAB_HOME/config/unicorn.rb -E production

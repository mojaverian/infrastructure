How to use
----------

If you're developing you will want to add this in /etc/hosts

    127.0.0.1 git.koda.re
    127.0.0.1 account.koda.re

Then put the actual cert in **nginx/config/certs/** or generate a dev cert.

    # openssl req -x509 -newkey rsa:2048 -days 3650 \
        -keyout nginx/config/certs/wildcard.koda.re.key \
        -out nginx/config/certs/wildcard.koda.re.pem
    # openssl rsa -in nginx/config/certs/wildcard.koda.re.key \
        -out nginx/config/certs/wildcard.koda.re.key.new
    # mv nginx/config/certs/wildcard.koda.re.key.new nginx/config/certs/wildcard.koda.re.key

This will setup slapd with FusionDirectory and GitLab with Sidekiq, OpenSSH, Redis, Postgres and LDAP login.

    # docker-compose up

Then you need to do some manual configuration steps

For Fusiondirectory

    # docker exec -it infrastructure_fusiondirectory_1 /bin/bash
    fusiondirectory # fusiondirectory-setup --check-ldap

For Gitlab

    # docker exec -it infrastructure_gitlab_1 /bin/bash
    gitlab # cd /home/git/gitlab
    gitlab # sudo -u git -H bundle exec rake gitlab:setup RAILS_ENV=production GITLAB_ROOT_PASSWORD=changeme

Don't forget to change the LDAP admin pass, postgres admin pass, the postgres
git user pass and the gitlab admin pass. They're all set to "changeme".

You'll find GitLab at https://git.koda.re/ and FusionDirectory at https://account.koda.re/

### Credentials

LDAP

    host: openldap
    base: dc=koda,dc=re
    user: cn=admin,dc=koda,dc=re
    pass: changeme

Postgresql

    host: postgres
    user: admin
    pass: changeme

Upgrading
---------

How to migrate databases and stuff for new versions...

### Gitlab

    # docker exec -it infrastructure_gitlab_1 /bin/bash
    # cd /home/git/gitlab
    # sudo -u git -H bundle exec rake db:migrate RAILS_ENV=production


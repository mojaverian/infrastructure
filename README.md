How to use
----------

    # docker-compose up

Then you need to do some manual configuration steps

    # docker exec -it infrastructure_fusiondirectory_1 /bin/bash
    fusiondirectory # fusiondirectory-setup --check-ldap

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

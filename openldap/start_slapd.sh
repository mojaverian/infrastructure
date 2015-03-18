#!/bin/sh

/usr/sbin/slapd -h "ldap:///" -u openldap -g openldap -d 0

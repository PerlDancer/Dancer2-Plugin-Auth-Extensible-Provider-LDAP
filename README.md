# NAME 

Dancer2::Plugin::Auth::Extensible::Provider::LDAP - LDAP authentication provider for Dancer2::Plugin::Auth::Extensible

# DESCRIPTION

This class is a generic LDAP authentication provider.

See [Dancer2::Plugin::Auth::Extensible](https://metacpan.org/pod/Dancer2::Plugin::Auth::Extensible) for details on how to use the
authentication framework.

# ATTRIBUTES

## host

The LDAP host name or IP address passed to ["CONSTRUCTOR" in Net::LDAP](https://metacpan.org/pod/Net::LDAP#CONSTRUCTOR).

Required.

## options

Extra options to be passed to ["CONSTRUCTOR" in Net::LDAP](https://metacpan.org/pod/Net::LDAP#CONSTRUCTOR) as a hash reference.

## basedn

The base dn for all searches (e.g. 'dc=example,dc=com').

Required.

## binddn

This must be the distinguished name of a user capable of binding to
and reading the directory (e.g. 'cn=admin,dc=example,dc=com').

Required.

## bindpw

The password for ["binddn"](#binddn).

Required.

## username\_attribute

The attribute to match when searching for a username.

Defaults to 'cn'.

## name\_attribute

The attribute which contains the full name of the user. See also:

["name" in Dancer2::Plugin::Auth::Extensible::Role::User](https://metacpan.org/pod/Dancer2::Plugin::Auth::Extensible::Role::User#name).

Defaults to 'displayName'.

## user\_filter

Filter used when searching for users.

Defaults to '(objectClass=person)'.

## role\_attribute

The attribute used when searching for role names.

Defaults to 'cn'.

## role\_filter

Filter used when searching for roles.

Defaults to '(objectClass=groupOfNames)'

## role\_member\_attribute

The attribute who's value should be a user's DN to show the user has the
specific ["role\_attribute"](#role_attribute)'s value.

Defaults to 'member'.

# METHODS

## ldap

Returns a connected [Net::LDAP](https://metacpan.org/pod/Net::LDAP) object.

## authenticate\_user $username, $password

## get\_user\_details $username

## get\_user\_roles

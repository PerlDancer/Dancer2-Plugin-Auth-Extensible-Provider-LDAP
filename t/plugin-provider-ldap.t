use strict;
use warnings;

use Test::More;
use Test::Net::LDAP::Mock;
use Dancer2::Plugin::Auth::Extensible::Test;

BEGIN {
    $ENV{DANCER_CONFDIR} = 't/lib';
    $ENV{DANCER_ENVIRONMENT} = 'provider-ldap';
}

{
    package TestApp;
    use Dancer2;
    use Dancer2::Plugin::Auth::Extensible::Test::App;
}

my $app = Dancer2->runner->psgi_app;
is( ref $app, 'CODE', 'Got app' );

ldap_mockify {
    my $ldap = Net::LDAP->new('ldap.example.com');
    $ldap->add('uid=user1, ou=users, dc=example, dc=com');
    Dancer2::Plugin::Auth::Extensible::Test::testme($app, 'base');
};

done_testing;

use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Acme::l33t',
    license             => 'perl',
    dist_author         => 'Yanick Champoux <yanick@cpan.org>',
    dist_version_from   => 'lib/Acme/l33t.pm',
    build_requires => {
        'Test::More' => 0,
    },
    add_to_cleanup      => [ 'Acme::l33t-*' ],
);

$builder->create_build_script();

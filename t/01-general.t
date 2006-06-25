use strict;
use warnings;

use Test::More tests => 4;

use Acme::l33t;
use IO::String;

my $output;

my $l33t = Acme::l33t->new({ stdout => IO::String->new( \$output ) });

$l33t->load( '7 75 55' );
$l33t->run;
is( join( ':', $l33t->get_memory ), '7:12:10:13', 'INC' );

$l33t->load( '8 75 55' );
$l33t->run;
is( join( ':', $l33t->get_memory ), '8:12:10:243', 'DEC' );

{
    local *STDERR;

    my $errors;
    open STDERR, '>', \$errors;

    $l33t->load( '777 55' );
    $l33t->run;

    is $errors, "j00 4r3 teh 5ux0r\n", 'error if opCode > 10';

    close STDERR;
    $errors = '';
    open STDERR, '>', \$errors;

    $l33t->load( '6 5 9 55 999999999999991 0 0 1 999999998 999999998' );
    $l33t->run;

    is $errors, "h0s7 5uXz0r5! c4N'7 c0Nn3<7 101010101 l4m3R !!!\n",
        'error if connect to invalid socket';
}


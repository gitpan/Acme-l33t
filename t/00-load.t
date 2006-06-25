#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'Acme::l33t' );
}

diag( "Testing Acme::l33t $Acme::l33t::VERSION, Perl $], $^X" );

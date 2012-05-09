use strict;
use warnings;

use Test::More tests => 1;
use PerlGSL::Integration::SingleDim qw/int_1d/;

is( int_1d(sub{1}, 0, 5), 5, '\int_0^5 dx' );



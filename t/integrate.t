use strict;
use warnings;

use Test::More tests => 1;
use PerlGSL::Integration::SingleDim qw/int_1d/;

is( int_1d(sub{1}, 0, 5), 5, '\int_0^5 dx' );

__END__

my ($result, $error) = int_1d(sub{my ($x,$y) = @_; return $x**2 * $y}, [0,0], [3,4]);
is( sprintf("%.0f",$result), 72, '\int_{0,0}^{3,4} x^2 y dx dy' );
ok( abs( $result - 72 ) < $result, 'result within error estimate' );

my $piby4_integrand = sub { ($_[0]**2 + $_[1]**2) < 1 };
my ($piby4, $piby4_error) = int_multi( $piby4_integrand, [0,0], [1,1], {calls => 1e6} );
ok( abs( $piby4 - atan2(1,1) ) < $piby4_error, 'calculate Pi' );



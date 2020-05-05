use v6;

use Raku::Tidy;
use Test;

subtest 'null hypothesis', {
	my $pt = Raku::Tidy.new;
	my ( $source, $tidied );
	$source = qq{1+ 2\t*3};
	$tidied = $pt.tidy( $source );
	is $tidied, $source, Q{null hypothesis - no changes};
};

my ( $source, $tidied );
$source = Q{1-3+ 2	*3};

subtest 'cuddled', {
	my $pt = Raku::Tidy.new( :operator-style( 'cuddled' ) );
	my $cuddled = Q{1-3+2*3};
	$tidied = $pt.tidy( $source );
	is $tidied, $cuddled, Q{cuddling successful};
};

subtest 'uncuddled', {
	my $pt = Raku::Tidy.new( :operator-style( 'uncuddled' ) );
	my $uncuddled = Q{1-3 + 2 * 3};
	$tidied = $pt.tidy( $source );
	is $tidied, $uncuddled, Q{uncuddling successful};
};

done-testing;

# vim: ft=raku

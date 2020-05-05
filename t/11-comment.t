use v6;

use Raku::Tidy;
use Test;

plan 2;

my $source = Q{1+2 # foo};

subtest 'null hypothesis (no removal)', {
	my $pt = Raku::Tidy.new;
	my $parsed = $pt.tidy( $source );
	is $parsed, $source, Q{No alterations};

	done-testing;
};

subtest 'strip flying comment', {
	my $pt = Raku::Tidy.new( :strip-comments( True ) );
	my $tidied = Q{1+2};
	my $parsed = $pt.tidy( $source );
	is $parsed, $tidied, Q{strip comments};

	done-testing;
};

done-testing;

# vim: ft=raku
